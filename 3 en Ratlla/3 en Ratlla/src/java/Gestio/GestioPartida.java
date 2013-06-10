
package Gestio;

public class GestioPartida{

    String taulell[][]; 
    String jugador[];
    int contJugs;
    boolean win;
    int numTaulell;
    int torn;
    
    public GestioPartida(int numT){
        taulell = new String[3][3];
        jugador = new String[2];
        for(int i=0; i<3; i++){
            for(int j=0; j<3; j++){
                taulell[i][j]="";
            }
        }
        contJugs=0;
        numTaulell=numT;
        win=false;
        torn=1;
    }
    
    public void canviarTorn(){
        if(torn==1){
            torn=2;
        }
        else if(torn==2){
            torn=1;
        }
    }
    
    public String veureTorn(){
        return jugador[torn-1];
    }
    
    public String estatCasella(int x, int y){
        return taulell[x][y];
    }
    
    public void casella(int x, int y, int numJug){
        if(numJug == 1){
            taulell[y][x]="X";
        }
        else{
            taulell[y][x]="O";
        }
    }
    
    public int getNumTaulell(){
        return numTaulell;
    }
    
    public void setPlayer(String nom){
        if(contJugs==0){
            jugador[0]=nom;
        }else{
            jugador[1]=nom;
        }
        contJugs++;
    }
    
    public String getJug(int numJug){
        if(numJug == 1){
            return jugador[0];
        }
        else{
            return jugador[1];
        }
    }
    
    public int getPlayer(){
        return contJugs;
    }
//mira si ha guanyat
    public boolean validarValors(){
        if(taulell[0][0].equals("")==false && taulell[0][0].equals(taulell[0][1]) && taulell[0][1].equals(taulell[0][2])){win=true;}
        else if(taulell[1][0].equals("")==false && taulell[1][0].equals(taulell[1][1]) && taulell[1][1].equals(taulell[1][2])){win=true;}
        else if(taulell[2][0].equals("")==false && taulell[2][0].equals(taulell[2][1]) && taulell[2][1].equals(taulell[2][2])){win=true;}
        else if(taulell[0][0].equals("")==false && taulell[0][0].equals(taulell[1][0]) && taulell[1][0].equals(taulell[2][0])){win=true;}
        else if(taulell[0][1].equals("")==false && taulell[0][1].equals(taulell[1][1]) && taulell[1][1].equals(taulell[2][1])){win=true;}
        else if(taulell[0][2].equals("")==false && taulell[0][2].equals(taulell[1][2]) && taulell[1][2].equals(taulell[2][2])){win=true;}
        else if(taulell[0][0].equals("")==false && taulell[0][0].equals(taulell[1][1]) && taulell[1][1].equals(taulell[2][2])){win=true;}
        else if(taulell[0][2].equals("")==false && taulell[0][2].equals(taulell[1][1]) && taulell[1][1].equals(taulell[2][0])){win=true;}
        return win;
    }
    /**
     * Borra el valor de totes les posicions del taulell
     */
    public void reiniciar(){         
        for(int i=0; i<3; i++){
            for(int j=0; j<3; j++){
                taulell[i][j]="";
            }
        }
        jugador[0]="";
        jugador[1]="";
        contJugs=0;
        win=false;
        torn=1;
    }
    
    public String estatPartida(){
        String estat="";
        if(contJugs==2 && win){
            estat="Partida acabada";
        }
        else if(contJugs==2 && !win){
            estat="La partida està plena!";
        }
        else if(contJugs==1){
            estat="Paciència, aviat tindràs rival!";
        }
        else if(contJugs==0){
           estat="READY";
        }
        return estat;
    }  
}
