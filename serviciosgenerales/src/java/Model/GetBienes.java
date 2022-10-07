package Model;

import Conexion.Conexion;
import Model.Bienes;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class GetBienes {

    public String getBienes() {
        String parte1 = "select b.cve_bienes, tipo, estado, marca, modelo, num_inventario, serie,fecha, ubic_departamento, departamento,\n"
                + " dependencia, responsable, area, unidad from bienes as b\n"
                + " inner join tipoBien as tiBien on b.cve_tipoBien=tiBien.cve_tipoBien";
        String parte2 = " inner join estado as es on b.cve_estado=es.cve_estado\n"
                + " inner join fecha_mante_camb as fmc on b.cve_bienes=fmc.cve_bienes\n"
                + " inner join ubicaciones as ub on b.cve_bienes=ub.cve_bienes;";
        String sql = parte1 + parte2;
        String json = null;
        Gson gson = new Gson();
        Conexion conecta = new Conexion();
        List<Bienes> bienes = new ArrayList<>();
        ResultSet rs = null; 
        PreparedStatement ps = null;
        Connection con = null;
        try {
            con = conecta.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while (rs.next()) {
                Bienes b = new Bienes();
                b.setCve_bienes(rs.getString("cve_bienes"));
                b.setTipo_bien(rs.getString("tipo"));
                b.setStatus(rs.getString("estado"));
                b.setMarca(rs.getString("marca"));
                b.setModelo(rs.getString("modelo"));
                b.setNum_inventario(rs.getString("num_inventario"));
                b.setSerie(rs.getString("serie"));
                b.setFecha_manteni(""+ rs.getDate("fecha"));
                b.setUbic_departamento(rs.getString("ubic_departamento"));
                b.setDepartamento(rs.getString("departamento"));
                b.setDependencia(rs.getString("dependencia"));
                b.setResponsable(rs.getString("responsable"));
                b.setArea(rs.getString("area"));
                b.setUnidad(rs.getString("unidad"));
                bienes.add(b);
            }

            json = gson.toJson(bienes);

        } catch (SQLException ex) {
            System.err.println("ERROR en getBienes : " + ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }

                if (con != null) {
                    con.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        return json;

    }
    
}
