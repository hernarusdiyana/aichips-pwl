<?php

namespace App\Models;

use CodeIgniter\Model;

class AntrianModel extends Model
{

    protected $table = "antrian";
    protected $primaryKey = 'id';
    protected $allowedFields = ['nama', 'noMeja', 'tanggal', 'status', 'idUser'];

    public function antrianModel($keyword)
    {
        $builder = $this->builder($this->table);
        $builder->select('id')->Like('id', $keyword)->Where('status',0);
        return $builder->get()->getResultArray();
    }

    public function detailItem($id = null)
    {
        $builder = $this->builder($this->table)->select('id,nama,noMeja,tanggal,status,idUser');
        if (empty($id)) {
            return $builder->get()->getResult(); // tampilkan semua data
        } else {
            // tampilkan data sesuai id/barcode
            return $builder->where('id', $id)->orWhere('id', $id)->get(1)->getRow();
        }
    }

        public function detail($id)
    {
        $builder = $this->builder($this->table)->select('id');
                 // tampilkan data sesuai id/barcode
            return $builder->where('id', $id)->orWhere('id', $id)->get(1)->getRow();
    }
}

