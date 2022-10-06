package Controller;

import Model.Bienes;
import Model.GetBienes;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.RegistrarBienes;

@WebServlet(name = "ControllerBienes", urlPatterns = {"/ControllerBienes"})
public class ControllerBienes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
            case "nuevo":
                request.getRequestDispatcher("pages/nuevoBien.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String guardarBien = request.getParameter("tipoBien");


            switch (guardarBien) {
            case "1":
                GuardarClima(request, response);
                break;
            case "2":
                GuardarExtintor(request, response);
                break;
            case "3":
                GuardarImpresora(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
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


    private void GuardarClima(HttpServletRequest request, HttpServletResponse response) {
        RegistrarBienes re = new RegistrarBienes();
        Bienes bien = this.ObtenerBien(request);
        String mensaje = re.Registrar(bien); 

        request.setAttribute("mensaje", mensaje);
        try {
            request.getRequestDispatcher("pages/nuevoBien.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ControllerBienes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ControllerBienes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /*Obtiene el Objeto Clima*/
    private Bienes ObtenerBien(HttpServletRequest request) {
        Bienes bien = new Bienes();
        bien.setUnidad(request.getParameter("objetoDescripcion"));
        bien.setMarca(request.getParameter("marca"));
        bien.setModelo(request.getParameter("modelo"));
        bien.setSerie(request.getParameter("serie"));
        bien.setNum_inventario(request.getParameter("inventario"));
        bien.setTipo_bien(request.getParameter("tipoBien"));
        bien.setFecha_factura(request.getParameter("fechaFactura"));
        bien.setFecha_instalacion(request.getParameter("fechaAltaSistema"));
        bien.setUbic_departamento(request.getParameter("ubicacionTxt"));
        
        bien.setResponsable(request.getParameter("responsable"));
        bien.setDependencia(request.getParameter("dependencia"));
        bien.setDepartamento(request.getParameter("departamento"));
        bien.setUbicaObservaciones(request.getParameter("ubicacionObservacion"));
        bien.setFecha_manteni(request.getParameter("fechaMantenimiento"));
        bien.setTipoMantenimiento(request.getParameter("tipoMantenimiento"));
        bien.setFallas(request.getParameter("fallas"));
        
        bien.setMant_descripcion(request.getParameter("mantenimientObservacion"));
         bien.setArea(request.getParameter("area"));
        bien.setStatus(request.getParameter("status"));
        //bien.setEvidenciaVideo(request.getParameter("evidencia"));

        return bien;

    }
    
    /*Metodo para los datos de la tabla en json*/
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

    private void GuardarExtintor(HttpServletRequest request, HttpServletResponse response) {
    
    }

    private void GuardarImpresora(HttpServletRequest request, HttpServletResponse response) {
    
    }

}
