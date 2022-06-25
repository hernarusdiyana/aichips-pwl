<?php

namespace App\Controllers;

use App\Models\MenuModel;
use App\Models\AntrianModel;
use App\Models\TransaksiModel2;

class Antrian extends BaseController
{
    public function __construct()
    {
        $this->menuModel = new MenuModel();
        $this->antrianModel = new AntrianModel();
        $this->transaksiModel = new TransaksiModel2();
    }
    public function index()
    {
        echo view('antrian', ['title'=>'antrian']);
    }

    public function dataAntrian()
    {
        echo json_encode($this->antrianModel->where("status !=", 2)->findAll());
    }

    public function dataAntrianSelesai()
    {
        date_default_timezone_set("Asia/Jakarta");
        $tanggal = date('Y-m-d', strtotime('today')) . " 00:00:00";
        echo json_encode($this->antrianModel->where(["status" => 2, "tanggal >=" =>  $tanggal])->findAll());
    }

    public function proses()
    {
        $id = $this->request->getPost("idTransaksi");
        $status = $this->request->getPost("statusTransaksi");
        $data = ["status" => $status + 1];
        if ($status == 0) {
            $data["idUser"] = session()->get('id');
            date_default_timezone_set("Asia/Jakarta");
            $data["tanggal"] = date('Y-m-d h:m:s', strtotime('today'));
        }

        $this->antrianModel->update($id, $data);

        echo json_encode("");
    }

    public function rincianPesanan()
    {
        $idAntian = $this->request->getPost("idAntrian");

        $pesanan = $this->transaksiModel->where("idAntrian", $idAntian)->findAll();
        for ($i = 0; $i < count($pesanan); $i++) {
            $menu = $this->menuModel->where("id", $pesanan[$i]["idMenu"])->first();
            $pesanan[$i]["nama"] = $menu["nama_item"];
            $pesanan[$i]["harga"] = $menu["harga"];
        }
        echo json_encode($pesanan);
    }

        public function nomorpesanan() {
        $keyword = $this->request->getGet('term', FILTER_SANITIZE_SPECIAL_CHARS);
        $data    = $this->antrianModel->antrianModel($keyword);
        $no_pesan = [];
        foreach ($data as $item) {
            array_push($no_pesan, $item['id']);
        }

        return $this->response->setJSON($no_pesan);
    }

        public function detail() {
        $no_pesan = $this->request->getGet('no_pesan', FILTER_SANITIZE_SPECIAL_CHARS);
        $data    = $this->antrianModel->detailItem($no_pesan);
        if (!empty($data)) {
            return $this->response->setJSON($data);
        }
    }
}
