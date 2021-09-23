<%-- 
    Document   : IncluirMunicipio
    Created on : 19/06/2011, 02:00:15 PM
    Modified on : 04/05/2016
    Author     : COMPAQ
--%>

<%@page import="negocio.Municipio"%>
<%@page import="java.util.Date"%>
<%@page import="negocio.Catastro"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Municipio</title>
    </head>
    <%Date date = new Date();
      Catastro catastro = new Catastro();
      out.println("Bienvenido. Hora actual es " + date);%>
    <body>
    
        <!-- Pinta la forma -->
        <FORM >
            <H2> INCLUIR MUNICIPIOS </H2>
            <TABLE BORDER="1">
            <TR>
              <TD>Código Postal</TD>
              <TD><INPUT type=text name="codPostal"></TD>
            </TR>
            <TR>
              <TD>Nombre Municipio</TD>
              <TD><INPUT type=text name="nomMunicipio"></TD>
            </TR>
            <TR>
              <TD>Número Habitantes</TD>
              <TD><INPUT type=text name="numHabitantes"></TD>
            </TR>
            <TR>
              <TD>Es capital?</TD>
              <TD><INPUT TYPE= "checkbox" NAME = "esCapital" CHECKED > </TD>
            </TR>
            <TR>
               <TD><INPUT TYPE="submit" VALUE="Incluir Municipio"></TD>
               <TD><a href="/CatastroDemo/index.jsp" target="blank">Regresar</a></TD>
           </TR>
          </TABLE>
        </FORM>
        <%if (!request.getParameterMap().isEmpty()) {
          
          try{
               Municipio m = catastro.getMunicipio();
                //Convertir el codigo postal a un valor num�rico
                Long codPostal = Long.valueOf(request.getParameter("codPostal"));
                String nomMunicipio = request.getParameter("nomMunicipio");
                String numHabitantes = request.getParameter("numHabitantes");
                String esCapital = request.getParameter("esCapital");
                m.setKCodigoPostal(codPostal);
                m.setNMunicipio(nomMunicipio);
                m.setIEsCapital("N");
                if(esCapital != null && esCapital.equals("on")){
                  m.setIEsCapital("S");
                } 
                catastro.incluirMunicipio();
               out.println("Municipio ["+ m.getNMunicipio()+ "] Incluido exitosamente");
            }
            catch(NumberFormatException e ){
                out.println("Error --> " + "El código postal es requerido y debe ser numérico");
            }
            catch(Exception e1){
                out.println("Error --> " + e1 + e1.getMessage());
            }
            
        }%>
        
        
    </body>
</html>
