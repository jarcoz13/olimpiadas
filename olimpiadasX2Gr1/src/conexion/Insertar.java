package conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jose Alejandro Cortazar Lopez
 * @author Jefferson Escobar 
 * grupo No 1 UDFJC
 */
public class Insertar {
    Conexion Conectar = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public void Insertece(){
        String sql="insert into comisario_g1(idcomisario,nombrecomisario) values(10,'Pive Valderrama')";
        
        try {
            ps=Conectar.getConexion().prepareStatement(sql);
            
            ps.execute();
            ps.close();
            
            Conectar.CerrarDB();
        
            System.out.println("Digite eso:");
            
            
        }catch(Exception e)
        {
            System.out.println("lo que sea, paila error" + e.getMessage());
        } 
    }
}
