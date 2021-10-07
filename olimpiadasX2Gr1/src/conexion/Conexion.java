
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author Jose Alejandro Cortazar Lopez
 * @author Jefferson Escobar 
 * grupo No 1
 */

public class Conexion {

    private final String url = "jdbc:postgresql://localhost:5432/polideportivo";
    private final String user = "postgres";
    private final String password = "hermes13";    
    
    Connection con;
    public static void main(String[] argv) throws SQLException {
        Conexion ConexionOlimpiadas = new Conexion();
        ConexionOlimpiadas.getConexion();
        Insertar idComisarioPk = new Insertar();
        idComisarioPk.Insertece();
        Datos datamining = new Datos();
        datamining.Consultelo();
    } 
    public Connection getConexion()
    {
        try
        {
            Class.forName("org.postgresql.Driver" );
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Conecte con la Base de Datos");
        } 
        catch(Exception e)
        {
            System.err.println(e);
        } 

        return con;
    } 
    public void CerrarDB (){
        try{
            con.close();
        }
        catch(Exception e){
            System.out.println("ete es"+e.getMessage());
        }
    }
    
    
}

