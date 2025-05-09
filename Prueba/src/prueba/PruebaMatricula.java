package prueba;
import java.util.List;

import mat.AD7Bean;
import mat.AD7Bean.Matricula;
import mat.AD7Bean.ModoCambiadoEvent;
import mat.AD7Bean.ModoCambiadoListener;



public class PruebaMatricula implements ModoCambiadoListener {
    private AD7Bean ad7bean;
    
    public PruebaMatricula() {
    	ad7bean = new AD7Bean();
    	ad7bean.addModoCambiadoListener(this);
        
        // Listado completo
        System.out.println("=== LISTADO COMPLETO ===");
        ad7bean.cargarTodasMatriculas();
        imprimirMatriculas();
        
        // Listado por DNI
        System.out.println("\n=== LISTADO POR DNI (12345678A) ===");
        ad7bean.recargarDNI("12345678A");
        imprimirMatriculas();
        
        // Añadir nueva matrícula
        System.out.println("\n=== AÑADIR NUEVA MATRÍCULA ===");
        ad7bean.setDNI("12345678A");
        ad7bean.setNombreModulo("Sistemas Informáticos");
        ad7bean.setCurso("23-24");
        ad7bean.setNota(7.8);
        ad7bean.addMatricula();
        
        // Ver resultado
        ad7bean.recargarDNI("12345678A");
        imprimirMatriculas();
    }
    
    private void imprimirMatriculas() {
        List<Matricula> lista;
        
        if (ad7bean.getModo().equals("completo")) {
            lista = ad7bean.getTodasMatriculas();
        } else {
            lista = ad7bean.getMatriculasDNI();
        }
        
        for (Matricula m : lista) {
            System.out.printf("DNI: %s, Módulo: %s, Curso: %s, Nota: %.1f%n",
                m.getDNI(),
                m.getNombreModulo(),
                m.getCurso(),
                m.getNota());
        }
    }
    
    @Override
    public void modoCambiado(ModoCambiadoEvent ev) {
        System.out.println("\n[EVENTO] Modo cambiado a: " + 
            ((AD7Bean)ev.getSource()).getModo());
    }
    
    public static void main(String[] args) {
        new PruebaMatricula();
    }

}