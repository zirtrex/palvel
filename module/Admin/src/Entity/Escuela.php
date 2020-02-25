<?php 
namespace Admin\Entity;


class Escuela
{
    public $codEscuela;
    public $nombreEscuela;

    public function exchangeArray(array $data)
    {
        $this->codEscuela       = !empty($data['codEscuela']) ? $data['codEscuela'] : null;
        $this->nombreEscuela    = !empty($data['nombreEscuela']) ? $data['nombreEscuela'] : null;        
    }
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}
