#Macros
COMP = gcc
LEX = lex
FLAGS = -ll

ejecutable: lex.yy.c
		$(COMP) lex.yy.c -o ejecutable $(FLAGS)
lex.yy.c: plantilla.l
		$(LEX) plantilla.l

exec_fichero:
	./ejecutable ejemplo.txt
exec:
	./ejecutable
clean:
	rm -f *.c ejecutable	
