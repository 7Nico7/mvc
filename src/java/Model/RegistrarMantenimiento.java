/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Nico
 */
public class RegistrarMantenimiento extends Conexion{
        public String Mantenimiento(Bienes b) {
            String mensaje = "";
        String sql = "insert fecha_mante_camb(cve_bienes,cve_tipoMantenimiento, cve_fallas,"
                + " fecha, descripcion, evidencia) values (?,?,?,?,?,?);";
        Conexion con = null;
        Connection cn = null;
        PreparedStatement ps;
        try {
            cn = con.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, b.getCve_bienes());
            ps.setString(2, b.getTipoMantenimiento());
            ps.setString(3, b.getFallas());
            ps.setString(4, b.getFecha_manteni());
            ps.setString(5, b.getMant_descripcion());
            ps.setString(6, b.getEvidenciaVideo());
            ps.executeUpdate();
            System.err.println("ENTRA EXCUTE");
        } catch (SQLException e) {
            System.err.println("ERROR EN RegistrarMantenimiento : " + e);
        }
        
        return mensaje;
    }
}
