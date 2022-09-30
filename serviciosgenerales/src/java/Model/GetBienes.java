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

public class GetBienes {

    public String getBienes() {
        String parte1 = "select cve_bienes, estado, marca, modelo, fecha_instalacion, num_inventario from bienes as b";
        String parte2 = " inner join estado as e on b.cve_estado=e.cve_estado;";
        String sql = parte1 + parte2;
        String json = null;
        Gson gson = new Gson();
        Conexion conecta = new Conexion();
        List<Bienes> bienes = new ArrayList<>();
        //Usuarios u = new Usuarios();ResultSet rs
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
                b.setStatus(rs.getString("estado"));
                b.setMarca(rs.getString("marca"));
                b.setModelo(rs.getString("modelo"));
                b.setFecha_instalacion(rs.getString("fecha_instalacion"));
                b.setNum_inventario(rs.getString("num_inventario"));
                bienes.add(b);
            }

            json = gson.toJson(bienes);
            
             
        } catch (SQLException ex) {
            throw new RuntimeException("Error", ex);
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
