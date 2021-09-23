package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import negocio.Municipio;

import util.CaException;
import util.ServiceLocator;

/**
 * @author Alba Consuelo Nieto.
 * Esta clase encapsula el acceso a la Base de Datos
 */
public class MunicipioDAO {
    private Municipio municipio;
    /*
     * Constructor de la clase
     */
    public MunicipioDAO(){
      municipio = new Municipio();
    }
    /**
     * Incluye una nueva fila en la tabla CAMUNICIPIO.
     * @throws CaException
     */
    public void incluirMunicipio() throws CaException {
      try {
      
        String strSQL = "INSERT INTO camunicipio (k_codigoPostal, n_municipio, q_nrohabitantes, i_escapital) VALUES(?,?,?,?)";
        Connection conexion = ServiceLocator.getInstance().tomarConexion();
        PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
        prepStmt.setLong(1,municipio.getKCodigoPostal()); 
        prepStmt.setString(2, municipio.getNMunicipio()); 
        prepStmt.setLong(3, municipio.getQNroHabitantes()); 
        prepStmt.setString(4, municipio.getIEsCapital()); 
        prepStmt.executeUpdate();
        prepStmt.close();
        ServiceLocator.getInstance().commit();
      } catch (SQLException e) {
           throw new CaException( "MunicipioDAO", "No pudo crear el municipio"+ e.getMessage());
      }  finally {
         ServiceLocator.getInstance().liberarConexion();
      }
      
    }
    
    public void modificarMunicipio(){
      
    }
    
    public void eliminarMunicipio(){
      
    }
    
    public void buscarMunicipio() throws CaException{
      try{
         String strSQL = "SELECT k_codigoPostal, n_Municipio, q_NroHabitantes, i_esCapital FROM camunicipio WHERE k_codigoPostal = ?";
         Connection conexion = ServiceLocator.getInstance().tomarConexion();
          PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
          prepStmt.setLong(1,municipio.getKCodigoPostal());
          ResultSet rs = prepStmt.executeQuery();
          while (rs.next()){
            municipio.setKCodigoPostal( rs.getLong(1));
            municipio.setNMunicipio(rs.getString(2));
            municipio.setQNroHabitantes(rs.getInt(3));
            municipio.setIEsCapital(rs.getString(4));
          }
      }
      catch(SQLException e){
        throw new CaException("MunicipioDAO", "No pudo recuperar el Municipio "+ e.getMessage());
      }
      
    }
    

    public void actualizarMunicipio() throws CaException {

    }

    public void setMunicipio(Municipio municipio) {
        this.municipio = municipio;
    }

    public Municipio getMunicipio() {
        return municipio;
    }
}


