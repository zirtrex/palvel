<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Interop\Container\ContainerInterface;


use Admin\Model\UsuarioTable;
use Admin\Model\CursoTable;
use Admin\Model\QuimicoTable;
use Admin\Model\RequerimientoTable;
use Admin\Model\Miscellanea;
use Admin\Entity\Curso;
use Admin\Entity\Escuela;
use Admin\Entity\Departamento;
use Admin\Model\EscuelaTable;
use Admin\Model\DepartamentoTable;


class AdminController extends AbstractActionController 
{
    private $container;
    private $usuarioTable;
    private $escuelaTable;
    private $departamentoTable;
    private $cursoTable;
    private $quimicoTable;
    private $requerimientoTable;
    
    public function __construct(ContainerInterface $container,
        UsuarioTable $usuarioTable,
        EscuelaTable $escuelaTable,
        DepartamentoTable $departamentoTable,
        CursoTable $cursoTable,
        QuimicoTable $quimicoTable,
        RequerimientoTable $requerimientoTable)
    {
        $this->container            = $container;
        $this->usuarioTable         = $usuarioTable;
        $this->escuelaTable         = $escuelaTable;
        $this->departamentoTable    = $departamentoTable;
        $this->cursoTable           = $cursoTable;
        $this->quimicoTable         = $quimicoTable;
        $this->requerimientoTable   = $requerimientoTable;
    }
    
    public function indexAction()
    {        
        return new ViewModel([]);
    }
    
    public function listarUsuariosAction()
    {
        
        $docentes = $this->requerimientoTable->obtenerUsuariosConRequerimientos(Miscellanea::SEMESTRE);
        
        return new ViewModel([
            'docentes' => $docentes,
            'messages' => $this->flashmessenger()->getMessages(),
            'errorMessages' => $this->flashmessenger()->getErrorMessages()
        ]);
    }
    
    //Muestra los cursos que tiene asignado un docente, es procesado cuando se inicia sesión
    public function listarCursosAction()
    {
        if($this->identity())
        {
            $codUsuario = (int) $this->params()->fromRoute('codusuario', 0);
            
            $cursos = $this->requerimientoTable->obtenerCursosByCodUsuarioAndSemestre($codUsuario, Miscellanea::SEMESTRE);
            
            return new ViewModel([
                'cursos' => $cursos,
                'codUsuario' => $codUsuario,
                'usuario' => $this->usuarioTable->obtenerUsuario($codUsuario),
                'messages' => $this->flashmessenger()->getMessages(),
                'errorMessages' => $this->flashmessenger()->getErrorMessages()
            ]);
        }
        
        return $this->redirect()->toRoute('ingresar');
    }
    
    public function listarPedidosAction()
    {
        
        $codUsuario         = (int) $this->params()->fromRoute('codusuario', 0);
        $semestre           = (String) $this->params()->fromRoute('semestre', Miscellanea::SEMESTRE);
        $codEscuela         = (int) $this->params()->fromRoute('codescuela', 0);
        $codCurso           = (int) $this->params()->fromRoute('codcurso', 0);
        
        if($codEscuela != 0){
            $escuela = $this->escuelaTable->obtenerEscuela($codEscuela);
        }else{
            $escuela = new Escuela();
            $escuela->nombreEscuela = "-";
        }        
        
        if($codCurso != null){
            $curso = $this->cursoTable->obtenerCurso($codCurso);
        }else{
            $curso = new Curso();
            $curso->nombreCurso = "Se listan los pedidos de todos los cursos";
        }
        
        //obtenerRequerimientosByCodigos($semestre = null, $codUsuario = null, $codEscuela = null, $codCurso = null, $codQuimico = null, $orderBy = array('codUsuario' => 'ASC'))
        $requerimientos = $this->requerimientoTable->obtenerRequerimientosByCodigosAndSemestre($semestre, $codUsuario, $escuela->codEscuela, $curso->codCurso);
        
        return new ViewModel([
            'codUsuario'        => $codUsuario,
            'usuario'           => $this->usuarioTable->obtenerUsuario($codUsuario),
            'semestre'          => $semestre,
            'codEscuela'        => $codEscuela,
            'escuela'           => $escuela,
            'codCurso'          => $codCurso,
            'curso'             => $curso,
            'requerimientos'    => $requerimientos,
            'messages'          => $this->flashmessenger()->getMessages(),
            'errorMessages'     => $this->flashmessenger()->getErrorMessages()
        ]);
    }
    
}
