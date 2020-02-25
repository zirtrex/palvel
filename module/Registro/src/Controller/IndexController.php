<?php

namespace Registro\Controller;

use Interop\Container\ContainerInterface;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Admin\Model\Miscellanea;
use Admin\Model\UsuarioTable;
use Admin\Model\EscuelaTable;
use Admin\Model\DepartamentoTable;
use Admin\Model\CursoTable;
use Admin\Model\QuimicoTable;
use Admin\Model\RequerimientoTable;
use Admin\Entity\Requerimiento;
use Admin\Entity\Usuario;
use Admin\Entity\Curso;
use Admin\Entity\Quimico;
use Admin\Entity\Escuela;
use Admin\Entity\Departamento;


class IndexController extends AbstractActionController 
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
    
	//Muestra los cursos que tiene asignado un docente, es procesado cuando se inicia sesión
	public function verCursosAction()
	{
		if($this->identity())
		{
			$codDocente = $this->getDatosDocente()->codUsuario;			
            
			$cursos = $this->requerimientoTable->obtenerCursosByCodUsuarioAndSemestre($codDocente, Miscellanea::SEMESTRE);
            
            return new ViewModel([
                'cursos' => $cursos
            ]);
        }
        
        return $this->redirect()->toRoute('ingresar');
	}
	
	//
	public function verPedidosAction()
	{
		if($this->identity())
		{
		    $codDocente       = $this->getDatosDocente()->codUsuario;
		    $semestre         = (String) $this->params()->fromRoute('semestre', '');
		    $codEscuela       = (int) $this->params()->fromRoute('codescuela', 0);
		    $codCurso         = (int) $this->params()->fromRoute('codcurso', 0);
		    
		    $curso        = $this->cursoTable->obtenerCurso($codCurso);
		    $escuela      = $this->escuelaTable->obtenerEscuela($codEscuela);
		    
		    //obtenerRequerimientosByCodigos($semestre = null, $codUsuario = null, $codEscuela = null, $codDepartamento = null, $codCurso = null, $codQuimico = null, $orderBy = array('codUsuario' => 'ASC'))
		    $requerimientos = $this->requerimientoTable->obtenerRequerimientosByCodigos($semestre, $codDocente, $codEscuela, $codCurso);
		    
		    return new ViewModel([		        
		        'codUsuario'      => $codDocente,
		        'semestre'        => $semestre,
		        'codEscuela'      => $codEscuela,
		        'escuela'         => $escuela,
		        'codCurso'        => $codCurso,
		        'curso'           => $curso,
		        'requerimientos'  => $requerimientos
		    ]);
			
		}
		
		return $this->redirect()->toRoute('ingresar');
	}
	
	//Muestra la pantalla para edición de requerimientos
	public function editarPedidoAction()
	{
	    if($this->identity())
	    {
	        $docente           = $this->getDatosDocente();
	        $semestre          = (String) $this->params()->fromRoute('semestre', '');
	        $codEscuela        = (int) $this->params()->fromRoute('codescuela', 0);
	        $codCurso          = (int) $this->params()->fromRoute('codcurso', 0);
	        
	        $curso        = $this->cursoTable->obtenerCurso($codCurso);
	        $escuela      = $this->escuelaTable->obtenerEscuela($codEscuela);
	        
	        //obtenerRequerimientosByCodigos($semestre = null, $codUsuario = null, $codEscuela = null, $codDepartamento = null, $codCurso = null, $codQuimico = null, $orderBy = array('codUsuario' => 'ASC'))
	        $requerimientos = $this->requerimientoTable->obtenerRequerimientosByCodigos($semestre, $codDocente, $codEscuela, $codCurso);
	        
	        return new ViewModel([	            
	            'docente'          => $docente,
	            'semestre'         => $semestre,
	            'codEscuela'       => $codEscuela,
	            'escuela'          => $escuela,
	            'codCurso'         => $codCurso,
	            'curso'            => $curso,
	            'requerimientos'   => \Zend\Json\Json::encode($requerimientos)
	        ]);
	        
	    }
	    
	    return $this->redirect()->toRoute('ingresar');
	}
	
	public function nuevoPedidoAction()
	{
	    return new ViewModel([]);
	}
	
	public function guardarPedidosAjaxAction()
	{
	
		if($this->identity())
		{
		    $request = $this->getRequest();
		    $response = $this->getResponse();
		    
		    if ($request->isPost())
		    {
		        $data = $request->getPost();
		        
		        //$response->setContent(\Zend\Json\Json::encode($data));
		        
		        $semestre         = $data['semestre'];
		        $codEscuela       = $data['codEscuela'];
		        $codCurso         = $data['codCurso'];
		        $codUsuario       = $this->getDatosDocente()->codUsuario;
		        $requerimientos   = $data['requerimientos'];
		        
		        $nroRequerimientos = sizeof($requerimientos);
		        
		        if($nroRequerimientos > 0)
		        {
		            $nroErrores = 0;
		            
		            foreach ($requerimientos as $req) {
		                
		                $requerimiento = new Requerimiento();
		                
		                $requerimiento->Usuario = new Usuario();
		                $requerimiento->Escuela = new Escuela();
		                $requerimiento->Curso = new Curso();
		                $requerimiento->Quimico = new Quimico();
		                
		                $requerimiento->cantidad = $req['cantidad'];
		                $requerimiento->semestre = $semestre;
		                $requerimiento->observacion = $req['observacion'];
		                $requerimiento->detalleObservacion = $req['detalleObservacion'];
		                $requerimiento->fechaPedido = gmdate("Y-m-d H:i:s", Miscellanea::getHoraLocal(-5));
		                $requerimiento->estado = "Enviado";
		                $requerimiento->Usuario->codUsuario = $codUsuario;
		                $requerimiento->Escuela->codEscuela = $codEscuela;
		                $requerimiento->Curso->codCurso = $codCurso;
		                $requerimiento->Quimico->codQuimico = $req['codQuimico'];
		                
		                try
		                {
		                    $this->requerimientoTable->agregarRequerimiento($requerimiento);
		                }
		                catch (\Exception $e)
		                {     
		                    $nroErrores++;		                    
		                    $mensajeErrorCode = $e->getCode();
		                    
		                    if($mensajeErrorCode == "23000"){
		                        $mensajeError = " Verifique que los datos no hayan sido registrados en el curso actual o que los elementos no esten duplicados.";
		                        //$mensajeError = $e->getMessage();
		                    }else{
		                        $mensajeError = $e->getMessage();
		                    }
		                }
		            }
		            
		            if ($nroErrores == 0)
		            {
		                $response->setContent(\Zend\Json\Json::encode(array('response' => true)));
		                
		            }else{
		                $mensajeError1 = "Han ocurrido " . $nroErrores . " errores. ";
		                $response->setContent(\Zend\Json\Json::encode([
		                    'response' => false,		                    
		                    'errorCode' => $mensajeErrorCode,
		                    'errorMessage' => $mensajeError1 . $mensajeError
		                ]));
		            }
		            
		        }
		    }
		    return $response;
		}
	
	}
	
	public function obtenerEscuelasAjaxAction()
	{
	    if($this->identity())
	    {	        
	        $escuelas = $this->escuelaTable->obtenerTodo();
	        
	        return $this->getResponse()->setContent(\Zend\Json\Json::encode($escuelas));
	    }
	    
	}
	
	public function obtenerDepartamentosAjaxAction()
	{
	    if($this->identity())
	    {
	        $departamentos = $this->departamentoTable->obtenerTodo();
	        
	        return $this->getResponse()->setContent(\Zend\Json\Json::encode($departamentos));
	    }
	    
	}
	
	public function obtenerCursosAjaxAction()
	{
	    if($this->identity())
	    {	        
	        $request = $this->getRequest();
	        $response = $this->getResponse();
	        
	        $codDocente = $this->getDatosDocente()->codUsuario;
	        
	        if ($request->isPost())
	        {
	            $data = $request->getPost();

	            $codEscuela =  $data['codEscuela'];
	            
	            $cursos = $this->cursoTable->obtenerCursosPorCodEscuela($codEscuela);
	            
	            $response->setContent(\Zend\Json\Json::encode($cursos));
	        }
	        
	        return $response;
	    }
	    
	}
	
	public function obtenerQuimicosAjaxAction()
	{
	    if($this->identity())
	    {
	        $quimicos = $this->quimicoTable->obtenerTodo(false);
	        
	        return $this->getResponse()->setContent(\Zend\Json\Json::encode($quimicos));
	    }
	    
	}	
	
	public function agregarPedidoAjaxAction()
	{
	    
	    if($this->identity())
	    {
	        $request = $this->getRequest();
	        $response = $this->getResponse();
	        
	        if ($request->isPost())
	        {
	            $data = $request->getPost();
	            
	            $mensajeError = "";
	            
	            $pedido = $data['pedido'];
                
                $requerimiento = new Requerimiento();
                
                $requerimiento->Usuario = new Usuario();
                $requerimiento->Escuela = new Escuela();
                $requerimiento->Curso = new Curso();
                $requerimiento->Quimico = new Quimico();
                
                $requerimiento->cantidad                        = $pedido['cantidad'];                
                $requerimiento->observacion                     = $pedido['observacion'];
                $requerimiento->detalleObservacion              = $pedido['detalleObservacion'];
                $requerimiento->fechaPedido                     = gmdate("Y-m-d H:i:s", Miscellanea::getHoraLocal(-5));
                $requerimiento->estado                          = "Guardado";
                $requerimiento->semestre                        = $pedido['semestre'];
                $requerimiento->Usuario->codUsuario             = $this->getDatosDocente()->codUsuario;
                $requerimiento->Escuela->codEscuela             = $pedido['codEscuela'];
                $requerimiento->Curso->codCurso                 = $pedido['codCurso'];
                $requerimiento->Quimico->codQuimico             = $pedido['codQuimico'];
                
                try
                {
                    $this->requerimientoTable->agregarRequerimiento($requerimiento);
                    
                }
                catch (\Exception $e)
                {
                    $mensajeErrorCode = $e->getCode();
                    
                    if($mensajeErrorCode == "23000"){
                        $mensajeError = " Verifique que los datos no hayan sido registrados en el curso actual o que los elementos no esten duplicados.";
                        //$mensajeError = $e->getMessage();
                    }else{
                        $mensajeError = $e->getMessage();
                    }
                    
                    //var_dump($mensajeError);
                    
                }                
                
                if ($mensajeError == "")
                {
                    $response->setContent(\Zend\Json\Json::encode([
                        'response' => true,
                        'successMessage' => "El pedido ha sido agregado correctamente."
                    ]));
                }
                else
                {
                    $mensajeError1 = "Han ocurrido errores.";
                    $response->setContent(\Zend\Json\Json::encode([
                        'response' => false,
                        'errorCode' => $mensajeErrorCode,
                        'errorMessage' => $mensajeError1 . $mensajeError
                    ]));
                }  
	            
	        }
	        return $response;
	    }
	    
	}
	
	public function actualizarPedidoAjaxAction()
	{
	    
	    if($this->identity())
	    {
	        $request = $this->getRequest();
	        $response = $this->getResponse();
	        
	        if ($request->isPost())
	        {
	            $data = $request->getPost();
	            
	            $mensajeError = "";
	            
	            $pedido = $data['pedido'];
	            
	            $requerimiento = new Requerimiento();
	            
	            $requerimiento->Usuario = new Usuario();
	            $requerimiento->Escuela = new Escuela();
	            $requerimiento->Curso = new Curso();
	            $requerimiento->Quimico = new Quimico();
	            
	            $requerimiento->cantidad                        = $pedido['cantidad'];
	            $requerimiento->observacion                     = $pedido['observacion'];
	            $requerimiento->detalleObservacion              = $pedido['detalleObservacion'];
	            $requerimiento->fechaPedido                     = gmdate("Y-m-d H:i:s", Miscellanea::getHoraLocal(-5));
	            $requerimiento->estado                          = "Actualizado";
	            $requerimiento->semestre                        = $pedido['semestre'];
	            $requerimiento->Usuario->codUsuario             = $this->getDatosDocente()->codUsuario;
	            $requerimiento->Escuela->codEscuela             = $pedido['codEscuela'];
	            $requerimiento->Curso->codCurso                 = $pedido['codCurso'];
	            $requerimiento->Quimico->codQuimico             = $pedido['codQuimico'];
	            
	            try
	            {
	                $this->requerimientoTable->actualizarRequerimiento($requerimiento);
	                
	            }
	            catch (\Exception $e)
	            {
	                $mensajeErrorCode = $e->getCode();
	                
	                if($mensajeErrorCode == "23000"){
	                    $mensajeError = " Verifique que los datos no hayan sido registrados en el curso actual o que los elementos no esten duplicados.";
	                    //$mensajeError = $e->getMessage();
	                }else{
	                    $mensajeError = $e->getMessage();
	                }
	                
	            }
	            
	            if ($mensajeError == "")
	            {
	                $response->setContent(\Zend\Json\Json::encode([
	                    'response' => true,
	                    'successMessage' => "El pedido ha sido actualizado correctamente."
	                ]));
	            }
	            else
	            {
	                $mensajeError1 = "Han ocurrido errores.";
	                $response->setContent(\Zend\Json\Json::encode([
	                    'response' => false,
	                    'errorCode' => $mensajeErrorCode,
	                    'errorMessage' => $mensajeError1 . $mensajeError
	                ]));
	            }
	            
	        }
	        return $response;
	    }
	    
	}
	
	public function removerPedidoAjaxAction()
	{
	    
	    if($this->identity())
	    {
	        $request = $this->getRequest();
	        $response = $this->getResponse();
	        
	        if ($request->isPost())
	        {
	            $data = $request->getPost();
	            
	            //$response->setContent(\Zend\Json\Json::encode($data));
	            
	            $pedido = $data['pedido'];
	            
	            $nroRequerimientos = sizeof($pedido);
	            
	            if($nroRequerimientos > 0)
	            {
	                $semestre          = $pedido['semestre'];
	                $codUsuario        = $this->getDatosDocente()->codUsuario;
	                $codEscuela        = $pedido['codEscuela'];
	                $codCurso          = $pedido['codCurso'];
	                $codQuimico        = $pedido['codQuimico'];
	                
	                //var_dump($pedido);
                    
                    try
                    {
                        //eliminarRequerimiento($semestre, $codUsuario, $codEscuela, $codDepartamento, $codCurso, $codQuimico)
                        $this->requerimientoTable->eliminarRequerimiento($semestre, $codUsuario, $codEscuela, $codCurso, $codQuimico);                        
                    }
                    catch (\Exception $e)
                    {
                        $mensajeErrorCode = $e->getCode();

                        $mensajeError = $e->getMessage();
                        
                        //var_dump($mensajeError);
                        
                    }	                
	                
                    if ($mensajeError == "")
	                {
	                    $response->setContent(\Zend\Json\Json::encode([
	                        'response' => true,
	                        'successMessage' => "El pedido ha sido eliminado correctamente."
	                    ]));
	                }
	                else
	                {
	                    $mensajeError1 = "Han ocurrido errores.";
	                    $response->setContent(\Zend\Json\Json::encode([
	                        'response' => false,
	                        'errorCode' => $mensajeErrorCode,
	                        'errorMessage' => $mensajeError1 . $mensajeError
	                    ]));
	                }
	                
	            }
	        }
	        return $response;
	    }
	    
	}
		
	//obtengo los datos del docente actual
	private function getDatosDocente()
	{		
		if($this->identity())
		{		
		    return $dataDocente = $this->usuarioTable->obtenerUsuario($this->identity()['codUsuario']);
		}
		
		return;
	}
	
}






