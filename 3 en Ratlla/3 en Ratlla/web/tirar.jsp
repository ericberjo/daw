<%@page import = "Gestio.GestioPartida" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            if(request.getParameter("x")!=null && request.getParameter("y")!=null && request.getParameter("jug")!=null){
                int x = Integer.parseInt(request.getParameter("x"));
                int y = Integer.parseInt(request.getParameter("y"));
                int player = Integer.parseInt(request.getParameter("jug"));
                int numTaulell = (Integer)session.getAttribute("numerot");
                GestioPartida[] partida = (GestioPartida[])getServletContext().getAttribute("partides");
                partida[numTaulell].casella(y, x, player);
                boolean win = partida[numTaulell].validarValors();
                partida[numTaulell].canviarTorn();

                //redireccionament a administracio.html
                response.sendRedirect("partida.jsp");
                
            }
        %>
    </body>
</html>
