/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
 * grupo No 1
 */
public class Datos {
    Conexion Conectar = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public void Consultelo(){
        String sql="Select * from comisario_g1";
        ArrayList datos = new ArrayList<>();
        Integer Idcomisario=0;
        String NombreComisario;
        
        try {
            ps=Conectar.getConexion().prepareStatement(sql);
            rs=ps.executeQuery();
            
            while(rs.next()){
                
                Idcomisario = rs.getInt(1);
                NombreComisario = rs.getString(2);
                datos.add(Idcomisario);
                datos.add(NombreComisario);
                
                
            }
            
             for(int i = 0; i < datos.size(); i++)
            {
                // Imprimimos los elementos del array en pantalla.
                System.out.println(datos.get(i));
            } 
            
            
            ps.close();
            Conectar.CerrarDB();
                        
        }catch(Exception e)
        {
            System.out.println("los datos men " + e.getMessage());
        } 
    }
}

    
