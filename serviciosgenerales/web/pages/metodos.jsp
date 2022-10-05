<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java"%>
<%@ page import="Model.*"%>
<%!RegistrarUsuario rg=new RegistrarUsuario();%>
<%!Usuarios u = new Usuarios();%>
<%
        String nombre=(String) request.getParameter("nombre");
         String correo=(String) request.getParameter("correo");
          String contra=(String) request.getParameter("contra");
          
          u.setNombre(nombre);
          u.setCorreo(correo);
          u.setContra(contra);
        out.print(rg.registrarUsuario(u));
%>