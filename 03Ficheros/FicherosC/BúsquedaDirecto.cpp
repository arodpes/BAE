#include <stdio.h>

struct {
        char nombre[20];
        char apellido[20];
        char telefono[15];
        } registro;


int main()
    {
    FILE *fichero;
    long posicion;
 

    fichero = fopen( "nombres.txt", "r" );
    printf( "¿Qué posición quieres leer? " ); fflush(stdout);
    scanf( "%D", &posicion );
    
    
    fseek ( fichero , (posicion-1)*sizeof(registro) , SEEK_SET );

    if (fread( &registro, sizeof(registro), 1, fichero )) {
              printf( "En la posición %D está: \n", posicion );
              printf( "Nombre: %s\n", registro.nombre );
              printf( "Apellido: %s\n", registro.apellido);
              printf( "Teléfono: %s\n", registro.telefono);
              }
    else
        printf( "Problemas posicionando el cursor.\n" );
    
    fclose( fichero );
    getchar();getchar();
    }
