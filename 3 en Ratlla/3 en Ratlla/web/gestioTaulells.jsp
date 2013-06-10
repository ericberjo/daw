<%-- 
    En aquesta pantalla gestionem les accions a realitzar de l'apartat 
    administrador segons el parametre passat (crear, reiniciar,estat)
--%>
<%@page import = "Gestio.GestioPartida" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>3 en Ratlla</title>
        
    </head>
    <body style='font-family:arial;'><center><br/><br/><h2>
        <%
            if(request.getParameter("crear") != null){
                
                 if(getServletContext().getAttribute("partides") == null){
                    GestioPartida[] partida = new GestioPartida[9];
                    for(int i=0; i<9; i++){
                         partida[i] = new GestioPartida(i);
                    }
                    getServletContext().setAttribute("partides", partida);
                                
                response.sendRedirect("administrador.html");
                }else{
                      out.println("Partides creades correctament");
                      %> 
                            </h2> 
                        <%
                }
            }
            else if(request.getParameter("reiniciar") != null){
                try{
                GestioPartida[] partida = (GestioPartida[])getServletContext().getAttribute("partides");
                for(int i=0; i<9; i++){
                    partida[i].reiniciar(); 
                }
                getServletContext().setAttribute("partides", partida);
                
                //redireccionament a administrador.html               
                out.println("Taulells reinciats"); 
                %> 
                     </h2> 
                <%
                }
                catch(Exception e){
                    out.println("No s'han pogut reiniciar els taulells");
                }
            }
            else if(request.getParameter("estat") != null){
                try{
                    GestioPartida[] partida = (GestioPartida[])getServletContext().getAttribute("partides");
                            %> 
                                <u>Partides</u></h2> 
                            <%
                        for(int i=0; i<partida.length; i++){
                            
                            out.println("<b>Numero "+i+"</b>: "+partida[i].estatPartida()); 
                            %> 
                              <br /> <br /> 
                            <%
                        }
                }
                catch(Exception e){
                    out.println("Falta instanciar les partides");
                }
            }
        %>
        <br /> <br /> <a href="administrador.html">Tornar a la pàgina d'administració</a></center>
    </body>
</html>
