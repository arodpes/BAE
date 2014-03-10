#include <stdio.h>

struct {
        char nombre[20];
        char apellido[20];
        char telefono[15];
        } registro;

int main()
    {
    FILE *fichero;

    fichero = fopen( "nombres.txt", "rb" );
    while (!feof(fichero)) {
       if (fread( &registro, sizeof(registro), 1, fichero )) {
              printf( "Nombre: %s\n", registro.nombre );
              printf( "Apellido: %s\n", registro.apellido);
              printf( "Teléfono: %s\n", registro.telefono);
              }
       }
    fclose( fichero );
    getchar();
    }

