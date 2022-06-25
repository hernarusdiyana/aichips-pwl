<?php

namespace App\Models;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\Model;

class ItemModel extends Model
{
    protected $table      = 'tb_menu';
    protected $primaryKey = 'id';
    protected $returnType = 'object';
    // protected $useSoftDeletes = true;
    protected $allowedFields = ['barcode', 'nama_item', 'harga', 'stok', 'foto'];
    protected $useTimestamps = true;

    public function detailItem($id = null)
    {
        $builder = $this->builder($this->table)->select('tb_menu.id AS iditem, barcode, nama_item AS item, harga, stok, foto');
        if (empty($id)) {
            return $builder->get()->getResult(); // tampilkan semua data
        } else {
            // tampilkan data sesuai id/barcode
            return $builder->where('tb_menu.id', $id)->orWhere('barcode', $id)->get(1)->getRow();
        }
    }

    public function barcodeModel($keyword)
    {
        $builder = $this->builder($this->table);
        $builder->select('barcode')->Like('barcode', $keyword);
        return $builder->get()->getResultArray();
    }

    public function cariProduk($keyword)
    {
        $builder = $this->builder($this->table);
        $query = $builder->select('barcode, nama_item');
        if (empty($keyword)) {
            $data = $query->get(10)->getResult();
        } else {
            $data = $query->like('barcode', $keyword)->orLike('nama_item', $keyword)->get()->getResult();
        }
        return $data;
    }
}
