/* Declaraciones*/

%{ 
#include <stdio.h>

int correcto, incorrecto;
void resultados(int a, int b);
%} 

primer_digito   [6|8]
digitos         [0-9]

/* Reglas */
%% 
  
{primer_digito}{digitos}{8} {printf("%s es correcto\n",yytext);correcto++;} 
  
{digitos}+                  {printf("%s es incorrecto\n",yytext);incorrecto++;} 

.+                          {printf("%s no es un numero\n",yytext);incorrecto++;}
  
%% 
   
/* Procedimientos de Usuario*/

int main(int argc, char *argv[]){
    if(argc==2){
        yyin=fopen(argv[1], "r");
        if(yyin == NULL){
            printf("El fichero %s no se puede abrir\n", argv[1]);
            exit(-1);
        }
    }
    
    else 
        yyin=stdin;   

    correcto=0;
    incorrecto=0;

    yylex();
    resultados(correcto, incorrecto);
    
    fclose(yyin);

    return 0; 
}

void resultados(int a, int b){
    printf("\nNumeros correctos: %d \nNumeros incorrectos: %d  \n", a, b);
}
