#include <stdio.h>

int main()
    {
    FILE *origen, *destino;
    char letra;

    origen=fopen("origen.txt","r");
    destino=fopen("destino.txt","w");
    if (origen==NULL || destino==NULL)
       {
       printf( "Problemas con los ficheros.\n" );
       getchar();
       return( 1 );
       }
    letra=getc(origen);
    while (feof(origen)==0)
          {
          putc(letra,destino);
          printf( "%c",letra );
          letra=getc(origen);
          }
    if (fclose(origen)!=0)
       printf( "Problemas al cerrar el fichero origen.txt\n" );
    if (fclose(destino)!=0)
       printf( "Problemas al cerrar el fichero destino.txt\n" );
    getchar();
    }

