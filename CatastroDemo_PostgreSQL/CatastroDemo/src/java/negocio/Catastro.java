package negocio;

import datos.MunicipioDAO;

import util.CaException;

/**
 * Clase controladora de la aplicaci�n
 * @author Alba Consuelo Nieto
 */
public class Catastro {
    private MunicipioDAO municipioDAO = new MunicipioDAO();
    
    public Catastro() {
         municipioDAO= new MunicipioDAO();
    }
    
   /**
     * Invoca el m�todo del DAO para incluir el municipio
     * @throws CaException
     */
    public void incluirMunicipio() throws CaException {
      municipioDAO.incluirMunicipio();
    }


    public Municipio getMunicipio() {
        return municipioDAO.getMunicipio();
    }
    
    
}
