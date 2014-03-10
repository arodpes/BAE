#include <stdio.h>
#include <string.h>


struct {
        char nombre[20];
        char apellido[20];
        char telefono[15];
        } registro;

int main()
    {
    FILE *fichero;
   

    fichero = fopen( "nombres.txt", "a" );
    do {
       printf( "Nombre: " ); fflush(stdout);
       gets(registro.nombre);
       if (strcmp(registro.nombre,""))
          {
          printf( "Apellido: " ); fflush(stdout);
          gets(registro.apellido);
          printf( "Teléfono: " ); fflush(stdout);
          gets(registro.telefono);
          fwrite( &registro, 1, sizeof(registro), fichero );
          }
       } while (strcmp(registro.nombre,"")!=0);
    fclose( fichero );
    }

