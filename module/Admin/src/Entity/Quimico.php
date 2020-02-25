<?php 
namespace Admin\Entity;


class Quimico
{
    public $codQuimico;
    public $elemento;
    public $unidadMedida;
    public $tipo;
    public $min;
    public $max;
    public $intervalo;
    public $activo;
    public $codQuipu;
    public $unidadQuipu;
    public $nomQuipu;
    public $cargadoQuipu;

    public function exchangeArray(array $data)
    {
        $this->codQuimico       = !empty($data['codQuimico']) ? $data['codQuimico'] : null;
        $this->elemento         = !empty($data['elemento']) ? $data['elemento'] : null;
        $this->unidadMedida     = !empty($data['unidadMedida']) ? $data['unidadMedida'] : null;
        $this->tipo             = !empty($data['tipo']) ? $data['tipo'] : null;
        $this->min              = !empty($data['min']) ? $data['min'] : null;
        $this->max              = !empty($data['max']) ? $data['max'] : null;
        $this->intervalo        = !empty($data['intervalo']) ? $data['intervalo'] : null;
        $this->activo           = !empty($data['activo']) ? $data['activo'] : null;
        $this->codQuipu         = !empty($data['codQuipu']) ? $data['codQuipu'] : null;
        $this->unidadQuipu      = !empty($data['unidadQuipu']) ? $data['unidadQuipu'] : null;
        $this->nomQuipu         = !empty($data['nomQuipu']) ? $data['nomQuipu'] : null;
        $this->cargadoQuipu     = !empty($data['cargadoQuipu']) ? $data['cargadoQuipu'] : null;
    }
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}
