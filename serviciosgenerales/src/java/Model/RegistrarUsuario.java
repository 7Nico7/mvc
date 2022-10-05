
package Model;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class RegistrarUsuario extends Conexion {

    public String registrarUsuario(Usuarios usuario) throws Exception {
        Usuarios usu = null;
        Conexion con;
        Connection cn = null;
        Statement st = null;
        PreparedStatement ps;
        String sql = "insert usuarios(nombre, correo, contra)value (?,?,?)";
        //Usuarios u = new Usuarios();
        con = new Conexion();
        String mensaje = "";
        try {
            cn = con.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getContra());
            ps.executeUpdate();
            mensaje = "Se Registrado el Usuario";
        } catch (Exception ex) {
                mensaje = "ERROR " + ex;
   
        } finally {

            if (st != null && st.isClosed() == false) {
                st.close();

            }
            st = null;
            if (cn != null & cn.isClosed() == false) {
                cn.close();

            }
            cn = null;
        }
        return mensaje;
    }

}