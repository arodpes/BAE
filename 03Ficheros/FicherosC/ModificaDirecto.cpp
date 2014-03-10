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
    long posicion;
 

    fichero = fopen( "nombres.txt", "rb+");
    printf( "¿Qué posición quieres leer? " ); 
    scanf( "%D", &posicion );
    
    
    fseek ( fichero , (posicion-1)*sizeof(registro) , SEEK_SET );

    if (fread( &registro, sizeof(registro), 1, fichero )) {
              printf( "En la posición %D está: \n", posicion );
              printf( "Nombre: %s\n", registro.nombre );
              printf( "Apellido: %s\n", registro.apellido);
              printf( "Teléfono: %s\n", registro.telefono);
              printf("------------------------------\n");
              // ahora pedimos el dato de nuevo
              printf("Nombre: ");
              scanf ("%s",registro.nombre);  
              if (strcmp(registro.nombre,"")!=0)
                 {
                  printf( "Apellido: " ); 
                  scanf("%s",registro.apellido);
                  printf( "Teléfono: " ); 
                  scanf("%s",registro.telefono);
                  //nos reposicionamos y escibimos el registro
                  fseek ( fichero , (posicion-1)*sizeof(registro) , SEEK_SET );
                  fwrite( &registro,sizeof(registro), 1,fichero );
                  }          
              }
    else
        printf( "Problemas posicionando el cursor.\n" );
    
    // recorremos de nuevo el archivo colocándonos al principio con el rewind
    printf("------------------------------\n");
    printf("Recooremos todo el archivo\n");
    rewind(fichero);
    while (!feof(fichero)) {
       if (fread( &registro, sizeof(registro), 1, fichero )) {
              printf( "Nombre: %s\n", registro.nombre );
              printf( "Apellido: %s\n", registro.apellido);
              printf( "Teléfono: %s\n", registro.telefono);
              }
       }
    fclose( fichero );
    getchar();
    
    
    fclose( fichero );
    getchar();
    }
