package negocio;
/**
 * Clase que encapsula los datos del Empleado (DTO)
 * @author Alba Consuelo Nieto.
 */
public class Municipio {
    private long    kCodigoPostal;
    private String  nMunicipio;
    private long    qNroHabitantes;
    private String  iEsCapital;
   
    public Municipio() {   
    }

    public void setKCodigoPostal(long kCodigoPostal) {
        this.kCodigoPostal = kCodigoPostal;
    }

    public long getKCodigoPostal() {
        return kCodigoPostal;
    }

    public void setNMunicipio(String nombre) {
        this.nMunicipio = nombre;
    }

    public String getNMunicipio() {
        return nMunicipio;
    }


    public void setQNroHabitantes(long qNroHabitantes) {
        this.qNroHabitantes = qNroHabitantes;
    }

    public long getQNroHabitantes() {
        return qNroHabitantes;
    }

    public void setIEsCapital(String iEsCapital) {
        this.iEsCapital = iEsCapital;
    }

    public String getIEsCapital() {
        return iEsCapital;
    }
}


