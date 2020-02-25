<?php 
namespace Admin\Model;

use RuntimeException;
use Zend\Db\TableGateway\TableGatewayInterface;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Where;
use Zend\Db\ResultSet\ResultSet;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;
use Zend\Db\Sql\Sql;
use Zend\Db\Sql\Expression;
use Admin\Entity\Requerimiento;
use Zend\Db\Sql\Predicate\PredicateSet;


class RequerimientoTable
{
    private $tableGateway;

    public function __construct(TableGatewayInterface $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function obtenerTodo($paginado = false)
    {
        if ($paginado) {
            
            $select = new Select();
            
            $select->from('requerimiento')
                ->order('codUsuario ASC');

            //$resultSetPrototype = new ResultSet();
            //$resultSetPrototype->setArrayObjectPrototype(new Pagos());

            $paginatorAdapter = new DbSelect($select, $this->tableGateway->getAdapter(), null/*$resultSetPrototype*/);
            
            $paginator = new Paginator($paginatorAdapter);
            
            return $paginator;
        }
        
        $resultSet = $this->tableGateway->select();
        return $resultSet;
    }
     
    public function obtenerRequerimientosByCodigos($semestre = null, $codUsuario = null, $codEscuela = null, $codCurso = null, $codQuimico = null, $orderBy = array('codUsuario' => 'ASC'))
    {
        $sql = new Sql($this->tableGateway->getAdapter());
        $select = $sql->select();
        
        $select->from('vw_requerimiento')->columns(array('*'));
        
        if($semestre !== null){ $select->where(array('semestre' => $semestre)); }
        if($codUsuario !== null){ $select->where(array('codUsuario' => $codUsuario)); }
        if($codEscuela !== null){ $select->where(array('codEscuela' => $codEscuela)); }
        if($codCurso !== null){ $select->where(array('codCurso' => $codCurso)); }
        if($codQuimico !== null){ $select->where(array('codQuimico' => $codQuimico)); }
        
        
        if($orderBy !== null){ $select->order($orderBy); }
        
        $resultset = $this->tableGateway->selectWith($select);
        $resultset->buffer();
        
        return $resultset;
    }
    
    public function obtenerRequerimientosByCodigosAndSemestre($semestre = null, $codUsuario = null, $codEscuela = null, $codCurso = null, $codQuimico = null, $orderBy = array('semestre', 'codUsuario' => 'ASC'))
    {
        $sql = new Sql($this->tableGateway->getAdapter());
        $select = $sql->select();
        
        $select->from('vw_requerimiento')->columns(array('*'));
        
        if($semestre !== null){
            $spec = function (Where $where) use ($semestre) {
                $where->like('semestre', $semestre . '%');
            };
            $select->where($spec);
        }
        if($codUsuario !== null){ $select->where(array('codUsuario' => $codUsuario)); }
        if($codEscuela !== null){ $select->where(array('codEscuela' => $codEscuela)); }
        if($codCurso !== null){ $select->where(array('codCurso' => $codCurso)); }
        if($codQuimico !== null){ $select->where(array('codQuimico' => $codQuimico)); }
        
        
        if($orderBy !== null){ $select->order($orderBy); }
        
        $resultset = $this->tableGateway->selectWith($select);
        $resultset->buffer();
        
        return $resultset;
    }
    
    public function obtenerUsuariosConRequerimientos($semestre = null)
    {
        $sql = new Sql($this->tableGateway->getAdapter());
        $select = $sql->select();
        
        $select->from('vw_requerimiento')->columns(array('*'));
        
        if($semestre !== null){
            $spec = function (Where $where) use ($semestre) {
                $where->like('semestre', $semestre . '%');
            };
            $select->where($spec);
        }        
        
        $select->group("codUsuario");        
        
        $resultset = $this->tableGateway->selectWith($select);
        $resultset->buffer();
        
        return $resultset;
    }
    
    public function obtenerCursosByCodUsuario($codUsuario = null)
    {
        $sql = new Sql($this->tableGateway->getAdapter());
        $select = $sql->select();
        
        $select->from('vw_requerimiento')->columns(array('*'));
        
        if($codUsuario!== null){ $select->where(array('codUsuario' => $codUsuario)); }
        
        $select->group(array("semestre", "nombreCurso"));
        
        $resultset = $this->tableGateway->selectWith($select);
        $resultset->buffer();
        
        return $resultset;
    }
    
    public function obtenerCursosByCodUsuarioAndSemestre($codUsuario = null, $semestre = null)
    {
        $sql = new Sql($this->tableGateway->getAdapter());
        $select = $sql->select();
        
        $select->from('vw_requerimiento')->columns(array('*'));
        
        
        if($codUsuario!== null){ $select->where(array('codUsuario' => $codUsuario)); }
        if($semestre !== null){
            $spec = function (Where $where) use ($semestre) {
                $where->like('semestre', $semestre . '%');
            };
            $select->where($spec);
        }
        
        $select->group(array("semestre", "nombreCurso"));
        
        $resultset = $this->tableGateway->selectWith($select);
        $resultset->buffer();
        
        return $resultset;
    }
    
    public function obtenerSumaPedidos(Array $where = null, $group = null, $semestre = null)
    {
        $sql = new Sql($this->tableGateway->getAdapter());
        $select = new Select();
        
        $select->from('vw_requerimiento')
            ->columns(array('*', 'totalPedido' => New Expression('SUM(cantidad)')));        
        
        
        //if($semestre !== null){ $select->where(array('semestre' => $semestre)); }
        
        if($semestre !== null){
            $spec = function (Where $where) use ($semestre) {
                $where->like('semestre', $semestre . '%');
            };
            $select->where($spec);
        }
        
        if($group !== null){ $select->group($group); }
        
        $select->order('semestre');
        
        //var_dump($select->getSqlString()); return ;
        
        $statement = $sql->prepareStatementForSqlObject($select);
        $resultSet = $statement->execute();
        
        return $resultSet;
    }

    private function obtenerRequerimiento($semestre, $codUsuario, $codEscuela, $codCurso, $codQuimico)
    {
        $sql = new Sql($this->tableGateway->getAdapter());
        $select = $sql->select();
        
        $codUsuario = (int) $codUsuario;
        $codCurso = (int) $codCurso;
        $codQuimico = (int) $codQuimico;
        
        $select->from('requerimiento')
                ->columns(array('*'))
                ->where(array('codUsuario' => $codUsuario))
                ->where(array('codCurso' => $codCurso))
                ->where(array('codQuimico' => $codQuimico));
        
        $statement = $sql->prepareStatementForSqlObject($select);
        $row = $statement->execute();
        
        if (! $row) {
            throw new RuntimeException(sprintf(
                'No puede ser encontrada la fila con identificador %d, %d, $d', $codUsuario, $codCurso, $codQuimico
            ));
        }

        return $row->current();
    }

    public function agregarRequerimiento(Requerimiento $requerimiento)
    {
        $data = [
            'cantidad'              => $requerimiento->cantidad,
            'semestre'              => $requerimiento->semestre,
            'observacion'           => $requerimiento->observacion,
            'detalleObservacion'    => $requerimiento->detalleObservacion,
            'fechaPedido'           => $requerimiento->fechaPedido,
            'estado'                => $requerimiento->estado,
            'codUsuario'            => $requerimiento->Usuario->codUsuario,
            'codEscuela'            => $requerimiento->Escuela->codEscuela,
            'codCurso'              => $requerimiento->Curso->codCurso,
            'codQuimico'            => $requerimiento->Quimico->codQuimico
        ];        

        try
        {
            $this->tableGateway->insert($data);
            return true;
        }
        catch (\Exception $e)
        {
            throw new \Exception($e->getPrevious()->getMessage(),$e->getPrevious()->getCode(), $e->getPrevious()->getPrevious());
            return false;
        }        
    }
    
    public function actualizarRequerimiento(Requerimiento $requerimiento)
    {
        $data = [
            'cantidad'              => $requerimiento->cantidad,
            'observacion'           => $requerimiento->observacion,
            'detalleObservacion'    => $requerimiento->detalleObservacion,
            'fechaPedido'           => $requerimiento->fechaPedido,
            'estado'                => $requerimiento->estado
        ];
        
        $semestre           = (String) $requerimiento->semestre;
        $codEscuela         = (int) $requerimiento->Escuela->codEscuela;
        $codUsuario         = (int) $requerimiento->Usuario->codUsuario;
        $codCurso           = (int) $requerimiento->Curso->codCurso;
        $codQuimico         = (int) $requerimiento->Quimico->codQuimico;
        
        
        if (! $this->obtenerRequerimiento($semestre, $codUsuario, $codEscuela, $codCurso, $codQuimico)) {
            throw new RuntimeException(sprintf(
                'No se puede actualizar registro con identificador %d, %d, %d, %d, %d, $d; no existe', $semestre, $codUsuario, $codEscuela, $codDepartamento, $codCurso, $codQuimico
                ));
            return false;
        }
        
        $this->tableGateway->update($data, 
            ['semestre' => $semestre, 
            'codUsuario' => $codUsuario, 
            'codEscuela' => $codEscuela,
            'codCurso' => $codCurso, 
            'codQuimico' => $codQuimico]);
        
        return true;
    }

    public function eliminarRequerimiento($semestre, $codUsuario, $codEscuela, $codCurso, $codQuimico)
    {
        try
        {
            return $this->tableGateway->delete(
                ['semestre' => $semestre,
                'codUsuario' => $codUsuario,
                'codEscuela' => $codEscuela,
                'codCurso' => $codCurso,
                'codQuimico' => $codQuimico]);
        }
        catch (\Exception $e)
        {
            throw new \Exception($e->getPrevious()->getMessage(),$e->getPrevious()->getCode(), $e->getPrevious()->getPrevious());
        }
        
    }
}

