<%@page import = "Gestio.GestioPartida" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>3 en Ratlla</title>
    </head>
    <body style="font-family: arial;"><center><br/><h2>
        <%
            try{
                if(session.getAttribute("player") == null){
                    boolean full = false;
                    int i = 0;
                    GestioPartida[] partida = (GestioPartida[])getServletContext().getAttribute("partides");
                    while(partida[i].getPlayer() == 2 && i<partida.length-1){
                        i++;
                        if(i == partida.length-1 && partida[i].getPlayer() == 2){
                            full=true;
                        }
                    }

                    if(full == true){
                        out.print("Tots els taulers són plens, espera a que acabi alguna partida!");
                    }
                    else{
                        partida[i].setPlayer(request.getParameter("nick"));
                        getServletContext().setAttribute("partides", partida);
                        session.setAttribute("player", partida[i].getPlayer());
                        session.setAttribute("nom", partida[i].getJug(partida[i].getPlayer()));
                        session.setAttribute("numerot", i);
                    }                                
                response.sendRedirect("partida.jsp");
             }
             else{                   
                out.println("Ja hi ha una partida en joc");
                %>
                </h2>
                <% 
                %> <br /> <a href="partida.jsp">Anar a la partida</a> 
                <br />  <br /> <a href="jugar.html">Tornar al menú</a><%
             }
                
             }
             catch(Exception se){
                out.println("Hi ha hagut un problema");
                %> <br /> <a href="jugar.html">Tornar al menú</a> <%
             }                       
        %>
    </center>
</body>
</html>
