package Controller;

import Model.Autentica;
import Model.RegistrarUsuario;
import Model.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.lang.System.out;

import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "Validar", urlPatterns = {"/Validar"})
public class Validar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        doPost(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("ingresar")) {
            verificar(request, response);
        } else if (accion.equalsIgnoreCase("salir")) {
            cerrarsession(request, response);
        } else if (accion.equalsIgnoreCase("registrar")) {
            registrar(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void verificar(HttpServletRequest request, HttpServletResponse response) {
        HttpSession sesion;
        Autentica consulta;
        Usuarios usuario;
        usuario = this.obtenerUsuario(request);
        consulta = new Autentica();
        try {
            usuario = consulta.postAuntenticar(usuario);
        } catch (Exception ex) {
            Logger.getLogger(Validar.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (usuario != null) {
            sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            request.setAttribute("msje", "Bienvenido al Sistema");
            try {
                request.getRequestDispatcher("Controller?accion=verificado").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(Validar.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(Validar.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            String linea1 = "<div class=\"alert alert-danger\" role=\"alert\">";
            String linea2 = "Correo o Contraseñas incorrectos!</div>";

            request.setAttribute("msje", linea1 + "\n" + linea2);
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(Validar.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(Validar.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private Usuarios obtenerUsuario(HttpServletRequest request) {
        Usuarios u = new Usuarios();
        u.setCorreo(request.getParameter("correo"));
        u.setContra(request.getParameter("contra"));

        return u;
    }

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession sesion;
        sesion = request.getSession();
        sesion.setAttribute("usuario", null);
        sesion.invalidate();
        try {
            request.getRequestDispatcher("Controller?accion=cerrar").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        RegistrarUsuario rg = new RegistrarUsuario();
        Usuarios datos = obtenerDatos(request);
        String mensaje = "";
        PrintWriter out;
        try {
            out = response.getWriter();
            try {
                mensaje = rg.registrarUsuario(datos);
                out.println("<h1 class=\"navbar-brand\">" + mensaje + "</h1>");
            } catch (Exception ex) {
                Logger.getLogger(ControllerBienes.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (IOException ex) {
            Logger.getLogger(Validar.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private Usuarios obtenerDatos(HttpServletRequest request) {
        Usuarios u = new Usuarios();
        String nombre = (String) request.getParameter("nombre");
        String correo = (String) request.getParameter("correo");
        String contra = (String) request.getParameter("contra");

        u.setNombre(nombre);
        u.setCorreo(correo);
        u.setContra(contra);
        return u;
    }

}
