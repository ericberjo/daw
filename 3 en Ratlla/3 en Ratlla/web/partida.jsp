<%@page import = "Gestio.GestioPartida" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <style type="text/css">
                input{   width: 60px;height: 60px;font-size:24px;}
                body{ font-family: arial}
           </style>
    </head>
    <body><center>
          <%
            GestioPartida[] partida = (GestioPartida[])getServletContext().getAttribute("partides");
            int numTaulell = (Integer)session.getAttribute("numerot");
            int player = (Integer)session.getAttribute("player");
            String nomador = (String)session.getAttribute("nom");
            out.println("<b>JUGADOR: </b>"+nomador+"."+"<br/>");          
            out.println("<b>TORN: </b>"+partida[numTaulell].veureTorn()+"<br/>");
            String estat = partida[numTaulell].estatPartida();
            out.println("<b>ESTAT PARTIDA:</b> "+estat);
        %>
        <form method="post" name="form1" id="form1">
        <table style=" margin-top:100px;">
            <tr>                
            <td><input type="submit" name="00" value="<%= partida[numTaulell].estatCasella(0,0) %>" 
                       formaction="tirar.jsp?x=0&y=0&jug=<%= player %>"
                       <% if(partida[numTaulell].veureTorn() != nomador || estat=="Partida acabada"){ %> disabled <% } %>/></td>
            <td><input type="submit" name="01" value="<%= partida[numTaulell].estatCasella(0,1) %>" 
                       formaction="tirar.jsp?x=0&y=1&jug=<%= player %>"
                       <% if(partida[numTaulell].veureTorn() != nomador || estat=="Partida acabada"){ %> disabled <% } %>/></td>
            <td><input type="submit" name="02" value="<%= partida[numTaulell].estatCasella(0,2) %>" 
                       formaction="tirar.jsp?x=0&y=2&jug=<%= player %>"
                       <% if(partida[numTaulell].veureTorn() != nomador || estat=="Partida acabada"){ %> disabled <% } %>/></td>            
            </tr>
            <tr>                
            <td><input type="submit" name="10" value="<%= partida[numTaulell].estatCasella(1,0) %>" 
                       formaction="tirar.jsp?x=1&y=0&jug=<%= player %>"
                       <% if(partida[numTaulell].veureTorn() != nomador || estat=="Partida acabada"){ %> disabled <% } %>/></td>
            <td><input type="submit" name="11" value="<%= partida[numTaulell].estatCasella(1,1) %>" 
                       formaction="tirar.jsp?x=1&y=1&jug=<%= player %>"
                       <% if(partida[numTaulell].veureTorn() != nomador || estat=="Partida acabada"){ %> disabled <% } %>/></td>
            <td><input type="submit" name="12" value="<%= partida[numTaulell].estatCasella(1,2) %>" 
                       formaction="tirar.jsp?x=1&y=2&jug=<%= player %>"
                       <% if(partida[numTaulell].veureTorn() !=  nomador || estat=="Partida acabada"){ %> disabled <% } %>/></td>
            
            </tr>
            <tr>
                
            <td><input type="submit" name="20" value="<%= partida[numTaulell].estatCasella(2,0) %>" 
                       formaction="tirar.jsp?x=2&y=0&jug=<%= player %>"
                       <% if(partida[numTaulell].veureTorn() != nomador || estat=="Partida acabada"){ %> disabled <% } %>/></td>
            <td><input type="submit" name="21" value="<%= partida[numTaulell].estatCasella(2,1) %>" 
                       formaction="tirar.jsp?x=2&y=1&jug=<%= player %>"
                       <% if(partida[numTaulell].veureTorn() != nomador || estat=="Partida acabada"){ %> disabled <% } %>/></td>
            <td><input type="submit" name="22" value="<%= partida[numTaulell].estatCasella(2,2) %>" 
                       formaction="tirar.jsp?x=2&y=2&jug=<%= player %>"
                       <% if(partida[numTaulell].veureTorn() != nomador || estat=="Partida acabada"){ %> disabled <% } %>/></td>
            
            </tr>
        </table>
        </form>
        <%
            if(estat=="Partida acabada"){
                if(nomador == partida[numTaulell].veureTorn()){
                    %> <h1>LOSER</h1> <%                                      
                }
                else{
                    %> <h1>WINNER</h1> <%
                }
            }
            
        %><br/>
        <a href="partida.jsp">Actualitza</a><center>
    </body>
</html>
