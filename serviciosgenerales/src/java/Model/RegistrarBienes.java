package Model;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RegistrarBienes extends Conexion {

//Registra el Bien
    public String Registrar(Bienes b) {

        Conexion con = null;
        Connection cn = null;
        PreparedStatement ps;
        String sql = "insert bienes(cve_tipoBien, cve_estado, marca, modelo, fecha_instalacion, "
                + "fecha_factura, num_inventario, unidad, serie)value (?,?,?,?,?,?,?,?,?);";
        ResultSet rs = null;
        con = new Conexion();
        String mensaje = ""; 
        int id;
        try {
            cn = con.getConexion();
            ps = cn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, b.getTipo_bien());
            ps.setString(2, b.getStatus());
            ps.setString(3, b.getMarca());
            ps.setString(4, b.getModelo());
            ps.setString(5, b.getFecha_instalacion());
            ps.setString(6, b.getFecha_factura());
            ps.setString(6, b.getNum_inventario());
            ps.setString(7, b.getUnidad());
            ps.setString(8, b.getSerie());
            ps.executeUpdate();
            //Se obtiene el ID del Bien registrado
            rs = ps.getGeneratedKeys();
            mensaje = "Se registro el Bien";
            //Se asigna que tipo de Bien es
            if (rs.next()) {
                id = rs.getInt(1);
                mensaje = "Se registro el Bien Numero" + id;

                //Se registra la ubicacion del Bien
                ubicacion(b, id, cn);
                //Se registra el Mantenimiento del Bien
                Mantenimiento(b, id, cn);
            }
        } catch (SQLException ex) {
            mensaje = "NOSE Registrado el Bien";
            System.err.println("ERROR SQL " + ex);
        }
        return mensaje;
    }


    private void ubicacion(Bienes b, int id, Connection cn) {
        String sql = "insert ubicaciones(cve_bienes, ubic_departamento, departamento, dependencia, area, responsable) "
                + "values (?,?,?,?,?,?);";
        PreparedStatement ps;

        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, b.getUbic_departamento());
            ps.setString(3, b.getDepartamento());
            ps.setString(4, b.getDependencia());
            ps.setString(5, b.getArea());
            ps.setString(6, b.getResponsable());
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("ERROR ubicacion " + e);
        }
    }

    private void Mantenimiento(Bienes b, int id, Connection cn) {
        String sql = "insert fecha_mante_camb(cve_bienes,cve_tipoMantenimiento, cve_fallas,"
                + " fecha, descripcion, evidencia) values (?,?,?,?,?,?);";
        PreparedStatement ps;
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, b.getTipoMantenimiento());
            ps.setString(3, b.getFallas());
            ps.setString(4, b.getFecha_manteni());
            ps.setString(5, b.getMant_descripcion());
            ps.setString(6, b.getEvidenciaVideo());
        } catch (Exception e) {
            System.err.println("ERROR");
        }
    }
}
