<?php 
namespace Admin\Entity;


class Departamento
{
    public $codDepartamento;
    public $nombreDepartamento;

    public function exchangeArray(array $data)
    {
        $this->codDepartamento      = !empty($data['codDepartamento']) ? $data['codDepartamento'] : null;
        $this->nombreDepartamento   = !empty($data['nombreDepartamento']) ? $data['nombreDepartamento'] : null;        
    }
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}
