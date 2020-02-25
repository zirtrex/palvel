<?php 
namespace Admin\Entity;


class Curso
{
    public $codCurso;
    public $nombreCurso;
    public $codEscuela;

    public function exchangeArray(array $data)
    {
        $this->codCurso     = !empty($data['codCurso']) ? $data['codCurso'] : null;
        $this->nombreCurso  = !empty($data['nombreCurso']) ? $data['nombreCurso'] : null;
        $this->codEscuela   = !empty($data['codEscuela']) ? $data['codEscuela'] : null;
        
    }
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}
