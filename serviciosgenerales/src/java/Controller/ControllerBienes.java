package Controller;

import Model.Bienes;
import Model.GetBienes;
import Model.RegistrarUsuario;
import Model.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ControllerBienes", urlPatterns = {"/ControllerBienes"})
public class ControllerBienes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //<div class="m-4" style="height: 550px;"><iframe name="myFrame" style="height: 100%; width:100%"><iframe/></div>
        doGet(request, response);
        doPost(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String selecciono = request.getParameter("selecciono");

        switch (selecciono) {
            case "todos":
                todos(request, response);
                break;
            case "tabla":
                tabla(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String guardarBien = request.getParameter("solicitud");

        switch (guardarBien) {
            case "registrarUsuario":
                guardarObjeto(request, response);
                break;
            default:
                request.setAttribute("info", "NO HAY DATOS");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    GetBienes bienes = new GetBienes();

    private void todos(HttpServletRequest request, HttpServletResponse response) {

        String data = bienes.getBienes();
        String[] datos = {data, "Lista total de Bienes"};

        try {
            request.setAttribute("data", datos);
            request.getRequestDispatcher("pages/todos.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ControllerBienes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerBienes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void climas(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void extintores(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void impresoras(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void verificado(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody

    }

    private void guardarObjeto(HttpServletRequest request, HttpServletResponse response) {
        RegistrarUsuario rg = new RegistrarUsuario();
        Usuarios u = new Usuarios();
        String nombre = (String) request.getParameter("nombre");
        String correo = (String) request.getParameter("correo");
        String contra = (String) request.getParameter("contra");

        u.setNombre(nombre);
        u.setCorreo(correo);
        u.setContra(contra);
        String mensaje = "";
        try {
            mensaje = rg.registrarUsuario(u);
        } catch (Exception ex) {
            Logger.getLogger(ControllerBienes.class.getName()).log(Level.SEVERE, null, ex);
        }

        out.print(mensaje);
    }

    private Bienes obtenerObjeto(HttpServletRequest request) throws ParseException {
        Bienes b = new Bienes();
        b.setDescripcion(request.getParameter("objetoDescripcion"));
        b.setMarca(request.getParameter("marca"));
        b.setModelo(request.getParameter("modelo"));
        b.setSerie(request.getParameter("serie"));
        b.setNum_inventario(request.getParameter("inventario"));
        b.setTipo_bien(request.getParameter("tipoBien"));
        b.setFecha_factura(request.getParameter("fechaFactura"));
        b.setFecha_instalacion(request.getParameter("fechaAltaSistema"));
        b.setStatus(request.getParameter("status"));
        b.setUbic_departamento(request.getParameter("ubicacion"));
        b.setResponsable(request.getParameter("responsable"));
        b.setDependencia(request.getParameter("dependencia"));
        b.setDepartamento(request.getParameter("departamento"));
        b.setUbicaObservaciones(request.getParameter("ubicacionObservacion"));
        b.setArea(request.getParameter("area"));
        return b;

    }

    private void tabla(HttpServletRequest request, HttpServletResponse response) {
        String data = bienes.getBienes();
        PrintWriter out;
        try {
        out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        out.print(data);
        out.flush();
        } catch (IOException ex) {
            Logger.getLogger(ControllerBienes.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
