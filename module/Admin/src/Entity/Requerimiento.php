<?php 
namespace Admin\Entity;

class Requerimiento
{
    public $codRequerimiento;
    public $cantidad;
    public $semestre;
    public $observacion;
    public $detalleObservacion;
    public $fechaPedido;
    public $estado;
    public $Usuario;
    public $Escuela;
    public $Curso;
    public $Quimico;

    public function exchangeArray(array $data)
    {
        $this->codRequerimiento         = !empty($data['codRequerimiento']) ? $data['codRequerimiento'] : null;
        $this->cantidad                 = !empty($data['cantidad']) ? $data['cantidad'] : null;
        $this->semestre                 = !empty($data['semestre']) ? $data['semestre'] : null;
        $this->observacion              = !empty($data['observacion']) ? $data['observacion'] : null;
        $this->detalleObservacion       = !empty($data['detalleObservacion']) ? $data['detalleObservacion'] : null;
        $this->fechaPedido              = !empty($data['fechaPedido']) ? $data['fechaPedido'] : null;
        $this->estado                   = !empty($data['estado']) ? $data['estado'] : null;
        
        
        $this->Usuario = new Usuario();
        
        $this->Usuario->codUsuario          = !empty($data['codUsuario']) ? $data['codUsuario'] : null;
        $this->Usuario->codigo              = !empty($data['codigo']) ? $data['codigo'] : null;
        $this->Usuario->nombres             = !empty($data['nombres']) ? $data['nombres'] : null;
        $this->Usuario->primerApellido      = !empty($data['primerApellido']) ? $data['primerApellido'] : null;
        $this->Usuario->segundoApellido     = !empty($data['segundoApellido']) ? $data['segundoApellido'] : null;
        
        $this->Escuela = new Escuela();
        
        $this->Escuela->codEscuela      = !empty($data['codEscuela']) ? $data['codEscuela'] : null;
        $this->Escuela->nombreEscuela   = !empty($data['nombreEscuela']) ? $data['nombreEscuela'] : null;
        
        $this->Curso = new Curso();
        
        $this->Curso->codCurso          = !empty($data['codCurso']) ? $data['codCurso'] : null;
        $this->Curso->nombreCurso       = !empty($data['nombreCurso']) ? $data['nombreCurso'] : null;
        $this->Curso->semestre          = !empty($data['semestre']) ? $data['semestre'] : null;
        $this->Curso->codEscuela        = !empty($data['codEscuela']) ? $data['codEscuela'] : null;
        
        $this->Quimico = new Quimico();
        
        $this->Quimico->codQuimico      = !empty($data['codQuimico']) ? $data['codQuimico'] : null;
        $this->Quimico->elemento        = !empty($data['elemento']) ? $data['elemento'] : null;
        $this->Quimico->unidadMedida    = !empty($data['unidadMedida']) ? $data['unidadMedida'] : null;
        $this->Quimico->tipo            = !empty($data['tipo']) ? $data['tipo'] : null;
    }
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}

