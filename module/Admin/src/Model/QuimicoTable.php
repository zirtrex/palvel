<?php 
namespace Admin\Model;

use RuntimeException;
use Zend\Db\TableGateway\TableGatewayInterface;
use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Db\ResultSet\ResultSet;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;
use Zend\Db\Sql\Expression;
use Admin\Entity\Quimico;


class QuimicoTable
{
    private $tableGateway;

    public function __construct(TableGatewayInterface $tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function obtenerTodo($paginado = false)
    {
        if ($paginado) {
            
            $select = new Select("quimico");

            $resultSetPrototype = new ResultSet();
            $resultSetPrototype->setArrayObjectPrototype(new Quimico());

            $paginatorAdapter = new DbSelect($select, $this->tableGateway->getAdapter(),$resultSetPrototype);
            
            $paginator = new Paginator($paginatorAdapter);
            
            return $paginator;
        }

        $resultSet = $this->tableGateway->select();
        return $resultSet;
    }
    
    public function obtenerTerrenosCount(Array $where = null, $group = null)
    {
        $sql = new Sql($this->tableGateway->getAdapter());
        $select = new Select();
        
        $select->from('terrenos')
            ->columns(array('*', 'total' => New Expression('COUNT(*)')));
        
        if($where !== null){ $select->where($where); }
        
        if($group!== null){ $select->group($group); }
        
        $statement = $sql->prepareStatementForSqlObject($select);
        $resultSet = $statement->execute();
        
        $row = $resultSet->current();
        
        return $row;
    }

    public function obtenerQuimico($codQuimico)
    {
        $codQuimico= (int) $codQuimico;
        $rowset = $this->tableGateway->select(['codQuimico' => $codQuimico]);
        $row = $rowset->current();
        
        if (! $row) {
            throw new RuntimeException(sprintf(
                'No se puede encontrar una columna con el identificador %d', $codQuimico
            ));
        }

        return $row;
    }
    
    public function obtenerQuimicosPorTipo($tipo)
    {
        $tipo= (String) $tipo;
        $resulset = $this->tableGateway->select(['tipo' => $tipo]);
        
        if (! $resulset) {
            throw new RuntimeException(sprintf(
                'No se puede encontrar una columna con el identificador %d', $tipo
                ));
        }
        
        return $resulset;
    }

    public function guardarQuimico(Quimico $quimico)
    {
        $data = [
            'elemento'        => $quimico->elemento,
            'unidadMedida'    => $quimico->unidadMedida,
            'tipo'            => $quimico->tipo
            
        ];

        $codQuimico = (int) $quimico->codQuimico;

        if ($codQuimico=== 0) {
            $this->tableGateway->insert($data);
            return $this->tableGateway->lastInsertValue;
        }
        
        if (! $this->obtenerQuimico($codQuimico)) {
            throw new RuntimeException(sprintf(
                'No se puede actualizar la fila con el identidicador %d; no existe', $codQuimico
                ));
        }
        
        $this->tableGateway->update($data, ['codQuimico' => $codQuimico]);
        
        return $codQuimico;
    }

    public function eliminarQuimico($codQuimico)
    {
        return $this->tableGateway->delete(['codQuimico' => (int) $codQuimico]);
    }
}

