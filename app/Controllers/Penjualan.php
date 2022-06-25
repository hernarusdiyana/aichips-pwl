<?php

namespace App\Controllers;

use App\Libraries\Keranjang;
use App\Models\KeranjangModel;
use App\Models\PelangganModel;
use App\Models\PenjualanModel;
use App\Models\TransaksiModel;
use App\Models\Sales_Model;
use App\Models\AntrianModel;
use Irsyadulibad\DataTables\DataTables;

class Penjualan extends BaseController {
    protected $pelangganModel;
    protected $keranjangModel;
    protected $penjualanModel;
    protected $transaksi;
    protected $antrianModel;

    public function __construct() {
        $this->pelangganModel = new PelangganModel();
        $this->penjualanModel = new PenjualanModel();
        $this->transaksi      = new TransaksiModel();
        $this->keranjangModel = new KeranjangModel();
         $this->antrianModel = new AntrianModel();
         $this->salesModel = new Sales_Model();
        helper('form');
    }
    public function index() {
        $data = [
            'title'     => 'Input Penjualan',
            'pelanggan' => $this->pelangganModel->detailPelanggan(),
        ];
        echo view('penjualan/index', $data);
    }

    public function cekStok() {
        $barcode = $this->request->getGet('barcode');
        $respon  = $this->keranjangModel->cekStokProduk($barcode);

        return $this->response->setJSON($respon);
    }

    public function tambah() {
        if ($this->request->getMethod() == 'post') {
            $id   = $this->request->getPost('iditem', FILTER_SANITIZE_NUMBER_INT);
            $item = [
                'id'      => $id,
                'barcode' => $this->request->getPost('barcode', FILTER_SANITIZE_STRING),
                'nama'    => $this->request->getPost('nama', FILTER_SANITIZE_STRING),
                'harga'   => $this->request->getPost('harga', FILTER_SANITIZE_NUMBER_INT),
                'jumlah'  => $this->request->getPost('jumlah', FILTER_SANITIZE_NUMBER_INT),
                'stok'    => $this->request->getPost('stok', FILTER_SANITIZE_NUMBER_INT),
            ];
            $hasil = Keranjang::tambah($id, $item); // masukan item ke keranjang
            if ($hasil == 'error') {
                $respon = [
                    'status' => false,
                    'pesan'  => 'Item yang ditambahkan melebihi stok',
                ];
            } else {
                $respon = [
                    'status' => true,
                    'pesan'  => 'Item berhasil ditambahkan ke keranjang.',
                ];
            }

            return $this->response->setJSON($respon);
        }
    }

    public function ubah() {
        if ($this->request->getMethod() == 'post') {
            $id   = $this->request->getPost('item_id', FILTER_SANITIZE_NUMBER_INT);
            $item = [
                'jumlah' => $this->request->getPost('item_jumlah', FILTER_SANITIZE_NUMBER_INT),
                'diskon' => $this->request->getPost('item_diskon', FILTER_SANITIZE_NUMBER_INT),
                'total'  => $this->request->getPost('harga_setelah_diskon', FILTER_SANITIZE_NUMBER_INT),
            ];
            Keranjang::ubah($id, $item); // masukan item ke keranjang
            $respon = [
                'pesan' => 'Item berhasil diubah.',
            ];

            return $this->response->setJSON($respon);
        }
    }

    public function hapus() {
        if ($this->request->isAJAX()) {
            $iditem = $this->request->getPost('iditem', FILTER_SANITIZE_NUMBER_INT);
            if (empty($iditem)) {
                // hapus session keranjang
                session()->remove('keranjang');
                $respon = [
                    'status' => true,
                    'pesan'  => 'Transaksi berhasil dibatalkan.',
                ];
            } else {
                $hapus = Keranjang::hapus($iditem);
                if ($hapus) {
                    $respon = [
                        'status' => true,
                        'pesan'  => 'Item berhasil dihapus dari keranjang.',
                    ];
                } else {
                    $respon = [
                        'status' => false,
                        'pesan'  => 'Gagal menghapus item dari keranjang',
                    ];
                }
            }

            return $this->response->setJSON($respon);
        }
    }

    public function bayar() {
        if ($this->request->getMethod() == 'post') {
            // tambahkan record ke tabel penjualan
            $tunai     = $this->request->getPost('tunai', FILTER_SANITIZE_NUMBER_INT);
            $kembalian = $this->request->getPost('kembalian', FILTER_SANITIZE_NUMBER_INT);
            
            $data      = [
                'invoice'      => $this->penjualanModel->invoice(),
                'id_pelanggan' => $this->request->getPost('id_pelanggan', FILTER_SANITIZE_NUMBER_INT),
                'total_harga'  => $this->request->getPost('subtotal', FILTER_SANITIZE_NUMBER_INT),
                'diskon'       => $this->request->getPost('diskon', FILTER_SANITIZE_NUMBER_INT),
                'total_akhir'  => $this->request->getPost('total_akhir', FILTER_SANITIZE_NUMBER_INT),
                'tunai'        => str_replace('.', '', $tunai),
                'kembalian'    => str_replace('.', '', $kembalian),
                'catatan'      => $this->request->getPost('catatan', FILTER_SANITIZE_STRING),
                'tanggal'      => $this->request->getPost('tanggal', FILTER_SANITIZE_STRING),
                'no_pesan'      =>$this->request->getPost('no_pesan', FILTER_SANITIZE_NUMBER_INT),
                'id_user'      => session('id'),
                'ip_address'   => $this->request->getIPAddress(),
                'created_at'   => date('Y-m-d H:i:s'),
                'updated_at'   => date('Y-m-d H:i:s'),
            ];

            $result = $this->penjualanModel->simpanPenjualan($data);
            if ($result['status']) {
                $respon = [
                    'status'      => $result['status'],
                    'pesan'       => 'Transaksi berhasil.',
                    'idpenjualan' => $result['id'],
                ];
            } else {
                $respon = [
                    'status' => $result['status'],
                    'pesan'  => 'Transaksi gagal',
                ];
            }

            return $this->response->setJSON($respon);
        }
    }

    public function keranjang() {
        if ($this->request->isAJAX()) {
            $respon = [
                'invoice'   => $this->penjualanModel->invoice(),
                'keranjang' => Keranjang::keranjang(),
                'sub_total' => Keranjang::sub_total(),
            ];

            return $this->response->setJSON($respon);
        }
    }

    public function invoice() {
        if ($this->request->isAJAX()) {
            return DataTables::use ('tb_penjualan')->select('id, invoice, tanggal')->make();
        } else if ($this->request->getMethod() == 'get') {
            $data = [
                'title' => 'Daftar Invoice',
            ];
            echo view('penjualan/daftar_invoice', $data);
        }
    }
    

    public function cetak($id) {
        $transaksi = $this->transaksi->detailTransaksi($id);
        // jika id penjualan tidak ditemukan redirect ke halaman invoice dan tampilkan error
        if (empty($transaksi)) {
            return redirect()->to('/penjualan/invoice')->with('pesan', 'Invoice tidak ditemukan');
        }
        echo view('penjualan/cetak_termal', ['transaksi' => $transaksi]);
    }

     function pos(){
         $data = [
            'page_title'     => 'Input Penjualan',
            'page_name' => 'penjualan/pos',
         ]; 
        echo view('penjualan/pos',$data);
    }

    function save_pos(){
        $resp = $this->sales->save_pos();
        if($resp){
            echo $resp;
        }else{
            echo false;
        }
    }
    function receipt($id = ''){
        $data['id'] = $id;
        $this->load->view('penjualan/receipt',$data);
    }

    function order_list(){
        $data['page_title'] = 'Order List';
        $data['page_name'] = 'penjualan/order_list';
        $this->load->view('index',$data);
    }

    function load_olist(){
        $resp = $this->sales->load_olist();
        if($resp)
            echo $resp;
    }

    function view_order($oid = '',$queue =''){
        $data['oid'] = $oid;
        $data['queue'] = $queue;
        $this->load->view('sales/view_order',$data);
    }

    function edit_order($oid='',$queue ='',$kitchen=0){
        $data['oid'] = $oid;
        $data['queue'] = $queue;
        $data['kitchen'] = $kitchen;
        $this->load->view('sales/edit_order',$data);
    }

    function delete_order(){
        $resp = $this->sales->delete_order();
        if($resp)
        echo $resp;
    }

    function pay_saved(){
        $resp = $this->sales->pay_saved();
        if($resp)
        echo $resp;
    }

    function change_ostatus(){
        $resp = $this->sales->change_ostatus();
        if($resp)
        echo $resp;
    }
}
