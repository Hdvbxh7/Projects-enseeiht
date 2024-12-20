/* version 0.1 (PM, 12/5/20) printf -> write(1,
*/
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <ctype.h>
#include <fcntl.h>
#include <stdbool.h>

#define BUFSIZE 512
#define NBDESC FD_SETSIZE-1  /* pour le select (macros non definies si >= FD_SETSIZE) */

void traiter(char tampon [], char cde, int nb) {
    int i;
    switch(cde)
    {
    case 'X' :
        break;
    case 'Q' :
        exit(0);
        break;
    case 'R' :
        write(1,tampon,nb);
        break;
    case 'M' :
        for (i=0; i<nb; i++) {
            tampon[i]=toupper(tampon[i]);
        }
        write(1,tampon,nb);
        break;
    case 'm' :
        for (i=0; i<nb; i++) {
            tampon[i]=tolower(tampon[i]);
        }
        write(1,tampon,nb);
        break;
    default :
        printf("????\n");
    }
}

int main (int argc, char *argv[]) {
    int p[2];
    int pid,d,nlus,res;
    char buf[BUFSIZE];
    fd_set readfds;
    char commande='R'; /* mode normal */

    if (argc != 2) {
        printf("utilisation : %s <fichier source>\n", argv[0]);
        exit(1);
    }

    if (pipe (p) == -1) {
        perror ("pipe");
        exit (2);
    }

    pid = fork ();
    if (pid == -1) {
        perror ("fork");
        exit (3);
    }

    if (pid == 0) {		/* fils  */
        d = open (argv[1], O_RDONLY);
        if (d == -1) {
            fprintf (stderr, "Impossible d'ouvrir le fichier ");
            perror (argv[1]);
            exit (4);
        }
        close(p[0]); /* pour finir malgré tout, avec sigpipe */
        while (true) {
            while ((nlus = read (d, buf, BUFSIZE)) > 0) {
                /* read peut lire moins que le nombre d'octets demandÈs, en
                 * particulier lorsque la fin du fichier est atteinte. */
                write(p[1],buf,nlus);
                sleep(5);
            }
            sleep(5);
            printf("on recommence...\n");
            lseek(d,(off_t) 0,SEEK_SET);
        }
    } else {/* pere */
        close(p[1]);
        system("stty -icanon min 1");
        while (commande != 'Q') {
            FD_ZERO(&readfds);
            FD_SET(p[0], &readfds);
            FD_SET(0, &readfds);
            res=select(NBDESC,&readfds,NULL, NULL, NULL);
            if (res>0) {
                if  (FD_ISSET(0,&readfds)) {
                    read(0,&commande,sizeof(char));
                    printf("-->%c\n",commande);
                }
                if (FD_ISSET(p[0],&readfds)) {
                    bzero(buf, BUFSIZE);
                    nlus=read(p[0],buf,BUFSIZE);
                    traiter(buf,commande,nlus);
                }
            }
            sleep(1);
        }
    }
}