<?php

namespace App\Controllers;

use App\Models\MenuModel;

class Menu extends BaseController
{
    public function __construct()
    {
        date_default_timezone_set("Asia/Jakarta");
        $this->menuModel = new MenuModel();
    }
    public function index()
    {
         echo view('menu', ['title'    => 'Menu']);
    }
    public function muatData()
    {
        echo json_encode($this->menuModel->where("hapus", NULL)->findAll());
    }

    public function tambah()
    {
        $data = [
            "barcode" =>  $this->request->getPost("barcode"),
            "nama_item" => $this->request->getPost("nama_item"),
            "harga" =>  $this->request->getPost("harga"),
            "jenis" => $this->request->getPost("jenis"),
            "stok" => $this->request->getPost("stok"),
            "foto" => "default.jpg",
            "status" => 1
        ];

        $this->menuModel->save($data);

        echo json_encode("");
    }

    public function hapus()
    {
        $id = $this->request->getPost("id");
        if ($id) {
            $tanggal = date('Y-m-d h:m:s', strtotime('today'));
            $this->menuModel->update($id, ["hapus" => $tanggal]);
            echo json_encode("");
        } else {
            echo json_encode("id kosong");
        }
    }

    public function ubahStatus()
    {
        $this->menuModel->update($this->request->getPost("id"), ["status" => $this->request->getPost("status")]);
    }

    public function getMenu()
    {
        echo json_encode($this->menuModel->where("id", $this->request->getPost("id"))->first());
    }

    public function upload()
    {
        $data = array();

        $validation = \Config\Services::validation();

        $validation->setRules([
            'file' => 'uploaded[file]|max_size[file,2048]|ext_in[file,jpg,jpeg,gif,png,webp],'
        ]);

        if ($validation->withRequest($this->request)->run() == FALSE) {
            $data['success'] = 0;

            $data['error'] = $validation->getError('file'); // Error response
        } else {
            if ($file = $this->request->getFile('file')) {
                if ($file->isValid() && !$file->hasMoved()) {
                    $name = $file->getName();
                    $ext = $file->getClientExtension();

                    $newName = $file->getRandomName();

                    $namaMenu = $this->request->getPost("namaMenu");
                    $idMenu = $this->request->getPost("idMenu");

                    $namaMenu = str_replace(" ", "", strtolower($namaMenu) . "." . $ext);

                    $file->move('./images/menu', $namaMenu, true);

                    $this->menuModel->update($idMenu, ["foto" => $namaMenu]);

                    $data['success'] = 1;
                    $data['message'] = 'Foto Berhasil diupload :)';
                } else {
                    $data['success'] = 2;
                    $data['message'] = 'Foto gagal diupload.';
                }
            } else {
                $data['success'] = 2;
                $data['message'] = 'Foto gagal diupload.';
            }
        }
        return $this->response->setJSON($data);
    }
}
