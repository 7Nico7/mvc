package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import Model.Usuarios; 
import Conexion.Conexion;
import java.sql.PreparedStatement;

public class Autentica extends Conexion {

    public Usuarios postAuntenticar(Usuarios usuario) throws Exception {
        Usuarios usu = null;
        Conexion con;
        Connection cn = null;
        Statement st = null;
        PreparedStatement ps;
        ResultSet rs = null;
        String sql = "select nombre, correo, contra, tipo_usuario from usuarios Where correo = ? and contra = ?";
        //Usuarios u = new Usuarios();
        con = new Conexion();
        try {
            cn = con.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, usuario.getCorreo());
            ps.setString(2, usuario.getContra());
            rs = ps.executeQuery();

            if (rs.next() == true) {
                usu = new Usuarios();
                usu.setNombre(rs.getString("nombre"));
                usu.setCorreo(rs.getString("correo"));
                usu.setContra(rs.getString("contra"));
                usu.setTipo_usuario(rs.getString("tipo_usuario"));
            }

        } catch (Exception ex) {

            System.out.println("postAuntenticar #### " + ex);
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (st != null && st.isClosed() == false) {
                st.close();

            }
            st = null;
            if (cn != null & cn.isClosed() == false) {
                cn.close();

            }
            cn = null;
        }
        return usu;
    }

}