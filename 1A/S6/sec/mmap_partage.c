/*
    Le processus père :
        - crée un fichier tempo contenant trois pages de caractères 'a'
        - ouvre ce fichier en lecture/écriture
        - crée un processus fils
        - couple un segment de taille 3 pages à ce fichier en mode partagé et lecture/écriture
        - attend 2 secondes
        - remplit les pages 1 et 2 de caractères 'b'
        - attend 6 secondes 
        - affiche le premier caractère des pages 1 et 2
        - remplit la page 2 de caractères 'c'
        - termine.
    Le processus fils :
        - couple un segment de taille 3 pages au fichier tempo en mode privé et lecture/écriture
        - affiche le premier caractère de la page 1. 
        - attend 4 secondes
        - affiche le premier caractère de chacune des pages 1, 2 et 3
        - remplit la page 2 de caractères 'd'
        - attend 8 secondes
        - afficher le premier caractère de chacune des pages 1, 2 et 3
        - termine.
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

void garnir(char tab[], int size, char caractere) {
    for (int i= 0; i<size; i++) {
        tab[i]= caractere;
    }
}

int main(int argc, char *argv[]) {

    long pagesize= sysconf(_SC_PAGESIZE);
    
    int fd_tempo;
    char tab[3*pagesize];
    if ((fd_tempo= open("tempo", O_WRONLY|O_CREAT, 0644)) == -1) {
        perror("Erreur ouverture fichier tempo");
        exit(EXIT_FAILURE);
    }
    garnir(tab, 3*pagesize, 'a');
    if (write(fd_tempo, tab, 3*pagesize) == -1) {
        perror("Erreur ecriture fichier tempo");
        exit(EXIT_FAILURE);
    } else {
        printf("Ecriture de %ld caractères dans le fichier tempo\n", 3*pagesize);
    }
    if (close(fd_tempo) == -1) {
        perror("Erreur fermeture tempo");
        exit(EXIT_FAILURE);
    };

    if ((fd_tempo= open("tempo", O_RDWR)) == -1) {
        perror("Erreur ouverture tempo en RW");
        exit(EXIT_FAILURE);
    }

    int pid= fork();
    if (pid == -1) {
        perror("Erreur fork");
        exit(EXIT_FAILURE);
    } else if (pid == 0) {
        // processus fils
        char *base;
        if ((base= mmap(NULL, 3*pagesize, PROT_READ|PROT_WRITE, MAP_PRIVATE, fd_tempo, 0)) == MAP_FAILED) {
            perror("fils - erreur mmap");
            exit(EXIT_FAILURE);
        }
        printf("fils - page 1 : %c\n", base[0]);
        sleep(4);
        printf("fils - page 1 : %c, page 2 : %c, page 3 : %c\n", base[0], base[pagesize], base[pagesize*2]);
        garnir(base+pagesize, pagesize, 'd');
        sleep(8);
        printf("fils - page 1 : %c, page 2 : %c, page 3 : %c\n", base[0], base[pagesize], base[pagesize*2]);
    } else {
        // processus pere
        char *base;
        if ((base= mmap(NULL, 3*pagesize, PROT_READ|PROT_WRITE, MAP_SHARED, fd_tempo, 0)) == MAP_FAILED) {
            perror("pere - erreur mmap");
            exit(EXIT_FAILURE);
        }
        sleep(2);
        garnir(base, 2*pagesize, 'b');
        sleep(6);
        printf("pere - page 1 : %c, page 2 : %c\n", base[0], base[pagesize]);
        garnir(base+2*pagesize, pagesize, 'c');
    }
 
    return EXIT_SUCCESS;
}