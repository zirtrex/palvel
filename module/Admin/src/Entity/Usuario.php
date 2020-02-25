<?php 
namespace Admin\Entity;

class Usuario
{
    public $codUsuario;
    public $codigo;
    public $rol;
    public $usuario;
    public $clave;
    public $nombres;
    public $primerApellido;
    public $segundoApellido;
    public $modalidadDocente;
    public $correo;
    public $telefono;
    public $codDepartamento;
    public $departamento;
    public $imagenPerfil;

    public function exchangeArray(array $data)
    {
        $this->codUsuario       = !empty($data['codUsuario']) ? $data['codUsuario'] : null;
        $this->codigo           = !empty($data['codigo']) ? $data['codigo'] : null;
        $this->rol              = !empty($data['rol']) ? $data['rol'] : null;
        $this->usuario          = !empty($data['usuario']) ? $data['usuario'] : null;
        $this->clave            = !empty($data['clave']) ? $data['clave'] : null;
        $this->nombres          = !empty($data['nombres']) ? $data['nombres'] : null;
        $this->primerApellido   = !empty($data['primerApellido']) ? $data['primerApellido'] : null;
        $this->segundoApellido  = !empty($data['segundoApellido']) ? $data['segundoApellido'] : null;
        $this->modalidadDocente = !empty($data['modalidadDocente']) ? $data['modalidadDocente'] : null;
        $this->correo           = !empty($data['correo']) ? $data['correo'] : null;
        $this->telefono         = !empty($data['telefono']) ? $data['telefono'] : null;
        $this->codDepartamento  = !empty($data['codDepartamento']) ? $data['codDepartamento'] : null;
        $this->departamento     = !empty($data['departamento']) ? $data['departamento'] : null;
        $this->imagenPerfil     = !empty($data['imagenPerfil']) ? $data['imagenPerfil'] : null;
    }
    
    public function getArrayCopy()
    {
        return get_object_vars($this);
    }
}

