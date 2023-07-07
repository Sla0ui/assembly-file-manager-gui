;Projet Gestion de Fichiers Salah eddine Slaoui
data segment
    S1 db 'Fichier'
    S2 db 'Chemin'
    S3 db 'Lister'
    S4 db 'Exit'
    S5 db 'Annuler'
    S6 db 'Creer'
    S7 db 'Supprimer'
    
    S11 db 'Creer'
    S12 db 'Ouvrir'
    S13 db 'Copier'
    S14 db 'Renommer'
    S15 db 'Supprimer'
    S16 db 'Exit'
    S17 db 'Menu'
    
    S21 db 'Creer'
    S22 db 'retirer'
    S23 db 'ChangerDIR'
    S24 db 'Exit'
    
    msg4 db 10, 13, 10, 13, ' Entrez le nom du  fichier a Renommer : $'
    msg1 db 10, 13, ' '     
    msg3 db 10, 13, 10, 13, ' Entrez le nom du  fichier a Supprimer : $'
    msg2 db 10, 13, 10, 13, ' Entrez le nom du  fichier a Creer : $'
    msg5 db 10, 13, ' Entrez le nom du  fichier : $'
    msg6 db 10, 13, 10, 13, ' Entrez le nom du  fichier a Copier : $'
    msg7 db 10, 13, ' Entrer la destination pour ce fichier : $'
    msg8 db 10, 13, 10, 13, ' Entrez le nom du  repertoire a Creer : $'
    msg9 db 10, 13, 10, 13, ' Entrez le nom du  repertoire a Supprimer : $'
    msg10 db 10, 13, 10, 13, ' Changer de repertoire pour : $'
    msg11 db 10, 13, 10, 13, ' Entrez le nom du  fichier a supprimer : $'
    msg12 db 10, 13, 10, 13, ' Entrez le nom du  fichier a supprimer : $'
    msg13 db 10, 13, 10, 13, ' Changer de lecteur pour : $'
    msg14 db 10, 13, 10, 13, ' Fichier introuvable!$'
    msg15 db 10, 13, 10, 13, ' Access refuse!$'
    msg16 db 10, 13, 10, 13, ' Fichier cree avec succes.$'
    msg17 db 10, 13, 10, 13, ' Fichier Supprime avec succes.$'
    msg18 db 10, 13, 10, 13, ' Fichier Renomme avec succes.$'
    msg19 db 10, 13, 10, 13, ' Repertoire cree avec succes.$'
    msg20 db 10, 13, 10, 13, ' Repertoire supprime avec succes.$'
    msg21 db 10, 13, 10, 13, ' Chemin introuvable!$'
    msg22 db 10, 13, 10, 13, ' Repertoire change avec succes.$'
    msg23 db 10, 13, 10, 13, ' Lecteur change avec succes.$'
    msg24 db '*.*', 0
    msg25 db 10, 13, 10, 13, ' Fichier copie avec succes.$'
    msg26 db 10, 13, '$'
    msg27 db 10, 13, 'Appuyez sur n importe quelle touche pour continuer$'
    msg28 db 10, 13, 10, 13, ' Voulez-vous saisir des donnees maintenante$'
    msg29 db 10, 13, ' Entrez les donnees (appuyez sur Esc pour arreter) :', 10, 13, '$'
    msg30 db 10, 13, 10, 13, ' Entrez le nom du  fichier a afficher : $'
    msg31 db ' $'
    MSG110 DB 'APPUYEZ SUR UNE TOUCHE POUR QUITTER$'  
    
    
    tab1 db 80, 0, 80 dup(0)
    tab2 db 80, 0, 80 dup(0)
data ends
    assume cs:code,ds:data
code segment
begin1:       
   
    start:MOV AX,DATA
    MOV DS,AX
    MOV ES,AX
    
begin : mov ax, 12h           ; Config mode graphique.
        int 10h
    
    

        ;Arriere-plan du  bouton  VERT

    mov cx,21d      ;colonne dans l'ecran
    mov dx,210d     ;ligne dans l'ecran
    mov al,02h  ;couleur du  pixel
    mov ah,0ch  ;print pixel
    sna1:int 10h
    inc cx
    cmp cx,155d 
    jne sna1
    inc dx
    mov cx,21d
    cmp dx,259d
    jne sna1

    ;Arriere-plan du  bouton
    


    
    
;;;;;;;;;;;;;;;     ;Arriere-plan du  bouton

    mov cx,176d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna2:int 10h
    inc cx
    cmp cx,310d
    jne sna2
    inc dx
    mov cx,176d
    cmp dx,259d
    jne sna2

    ;Arriere-plan du  bouton
    

    

    
    
    ;;;;;;;;;;;;;;;     ;Arriere-plan du  bouton

    mov cx,331d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna3:int 10h
    inc cx
    cmp cx,465d
    jne sna3
    inc dx
    mov cx,331d
    cmp dx,259d
    jne sna3

    ;Arriere-plan du  bouton
    

    
    
    ;;;;;;;;;;;;;;;     ;Arriere-plan du  bouton

    mov cx,486d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna4:int 10h
    inc cx
    cmp cx,620d
    jne sna4
    inc dx
    mov cx,486d
    cmp dx,259d
    jne sna4

    ;Arriere-plan du  bouton
    
    
    ;;;;;;;;;;;;;;;;impression de texte de bouton;;;;;;;;
    
    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h      ; text color change
    mov cx,07d      ; No de caracteres dans la chaine
    mov dl,7d       ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S1
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton

;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,06d      ; No de caracteres dans la chaine
    mov dl,26d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S2
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton

    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,06d      ; No de caracteres dans la chaine
    mov dl,43d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S3
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton
    
    
    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,04d      ; No de caracteres dans la chaine
    mov dl,63d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S4
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton


    ;initialisation sourissssssssssssssssss

    again:
    mov ax,0000h
    int 33h
    cmp ax,0000h
    je again

    ;Endsssssssssss initialisation sourissssssssssssssssss
    


    ;afficher souris intialise

    mov ax, 0001h
    int 33h

    ;endsssssssss afficher souris intialise


    ;verifier si le boutton est clicke sna4
    
    
check4:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check4
    
    cmp cx,486d ;superieur ou egal a 486d qu'on veut
    jc check3   ;boutton suivant
    cmp cx,620d ;inferieur a 620D
    jnc check4  
    cmp dx,210d ;superieur ou egal a 210d qu'on veut
    jc check1   ;vers le premier boutton
    cmp dx,260d ;inferieur a 260d
    jnc check1  ;vers le premier boutton
    call BT4    ;Action si le boutton est clicke

check3:
mov ax,0003h
    int 33h
    cmp bx,1h
    jne check3
    
    cmp cx,331d ;superieur ou egal a 1B qu'on veut!!!!
    jc check2
    cmp cx,465d ;inferieur a 5E!!!!
    jnc check4
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check1
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check1
    jmp LISTING
    
check2:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check2
    
    

    cmp cx,176d ;superieur ou egal a 1B qu'on veut!!!!
    jc check1
    cmp cx,311d ;inferieur a 5E!!!!
    jnc check3
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check1
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check1
    call BT2    
    
check1:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check1
    
    

    cmp cx,21d  ;superieur ou egal a 1B qu'on veut!!!!
    jc check4
    cmp cx,156d ;inferieur a 5E!!!!
    jnc check2
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check1
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check1
    call BT1
    jmp check4
    
    
    ;Similaire a getch() !!!!!!

    mov ah,07h
    int 21h

    ;changer vers mode texte....

    mov al,03h
    mov ah,00h
    int 10h
    
    
    ;endsssssss changer vers mode texte....


 ;;;;;;;;;;;;;;;;;;;Boutton avances du  fichier;;;;;;
 
BT1 proc
        mov ax, 12h           ; Config mode graphique.
        int 10h
    
        ;Arriere-plan du  bouton  VERT 

    mov cx,10d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna11:int 10h
    inc cx
    cmp cx,89d
    jne sna11
    inc dx
    mov cx,10d
    cmp dx,259d
    jne sna11

    ;Arriere-plan du  bouton

;;;;;;;;;;;;;;;     ;Arriere-plan du  bouton

    mov cx,100d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna12:int 10h
    inc cx
    cmp cx,179d
    jne sna12
    inc dx
    mov cx,100d
    cmp dx,259d
    jne sna12

    ;Arriere-plan du  bouton
        
    ;;;;;;;;;;;;;;;     ;Arriere-plan du  bouton

    mov cx,190d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna13:int 10h
    inc cx
    cmp cx,269d
    jne sna13
    inc dx
    mov cx,190d
    cmp dx,259d
    jne sna13

    ;Arriere-plan du  bouton
    
    ;;;;;;;;;;;;;;;     ;Arriere-plan du  bouton

    mov cx,280d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna14:int 10h
    inc cx
    cmp cx,365d
    jne sna14
    inc dx
    mov cx,280d
    cmp dx,259d
    jne sna14

    ;Arriere-plan du  bouton
    
    mov cx,370d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna15:int 10h
    inc cx
    cmp cx,455d
    jne sna15
    inc dx
    mov cx,370d
    cmp dx,259d
    jne sna15

    ;Arriere-plan du  bouton
    
    mov cx,465d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna16:int 10h
    inc cx
    cmp cx,519d
    jne sna16
    inc dx
    mov cx,465d
    cmp dx,259d
    jne sna16

    ;Arriere-plan du  bouton
    
    mov cx,530d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna17:int 10h
    inc cx
    cmp cx,609d
    jne sna17
    inc dx
    mov cx,530d
    cmp dx,259d
    jne sna17

    ;Arriere-plan du  bouton3
    
    
    
    
    ;;;;;;;;;;;;;;;;impression de texte de bouton;;;;;;;;
    
    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,05d      ; No de caracteres dans la chaine
    mov dl,2d       ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S11
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton

;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,06d      ; No de caracteres dans la chaine
    mov dl,14d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S12
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton

    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,06d      ; No de caracteres dans la chaine
    mov dl,26d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S13
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton
    
    
    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,08d      ; No de caracteres dans la chaine
    mov dl,36d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S14
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton
    
    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,09d      ; No de caracteres dans la chaine
    mov dl,47d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S15
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton
    
    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,04d      ; No de caracteres dans la chaine
    mov dl,59d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S16
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton
    
    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,04d      ; No de caracteres dans la chaine
    mov dl,69d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S17
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton


    ;initialisation sourissssssssssssssssss

    again3:
    mov ax,0000h
    int 33h
    cmp ax,0000h
    je again3

    ;Endsssssssssss initialisation sourissssssssssssssssss
    


    ;afficher souris intialise

    mov ax, 0001h
    int 33h

    ;endsssssssss afficher souris intialise


    ;verifier si le boutton est clicke sna4
    
    
check177:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check177
    
    cmp cx,530d ;superieur ou egal a 1B qu'on veut!!!!
    jc check16
    cmp cx,609d ;inferieur a 5E!!!!
    jnc check177
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check11
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check11
    jmp begin1

check16:
mov ax,0003h
    int 33h
    cmp bx,1h
    jne check16
    
    cmp cx,465d ;superieur ou egal a 1B qu'on veut!!!!
    jc check15
    cmp cx,519d ;inferieur a 5E!!!!
    jnc check177
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check11
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check11
    call BT4
    
check15:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check15
    
    

    cmp cx,370d ;superieur ou egal a 1B qu'on veut!!!!
    jc check14
    cmp cx,455d ;inferieur a 5E!!!!
    jnc check16
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check11
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check11
    jmp DELETE  

check11: jmp check111   
check14:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check14
    
    

    cmp cx,280d ;superieur ou egal a 1B qu'on veut!!!!
    jc check13
    cmp cx,369d ;inferieur a 5E!!!!
    jnc check15
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check11
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check11
    jmp RENAME

    
    
check13:
mov ax,0003h
    int 33h
    cmp bx,1h
    jne check13
    
    cmp cx,190d ;superieur ou egal a 1B qu'on veut!!!!
    jc check12
    cmp cx,269d ;inferieur a 5E!!!!
    jnc check14
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check11
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check11
    jmp COPY
    
check12:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check12
    
    

    cmp cx,100d ;superieur ou egal a 1B qu'on veut!!!!
    jc check11
    cmp cx,179d ;inferieur a 5E!!!!
    jnc check13
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check11
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check11
    jmp VIEW    
    
check111:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check111
    
    
    cmp cx,10d  ;superieur ou egal a 1B qu'on veut!!!!
    jc check17
    cmp cx,89d  ;inferieur a 5E!!!!
    jnc check12
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check111
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check111
    jmp CREATION
check17 : jmp check177  
    ;endsssssssss afficher souris intialise
ret
endp BT1

;;;;;;;;;;;;;;;;;;;;;Click boutton repertoire;;;;;;;;;;;;;;;;

BT2 proc

;Arriere-plan du  bouton  VERT
mov ax, 12h           ; Config mode graphique.
    int 10h
    
    mov cx,21d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna21:int 10h
    inc cx
    cmp cx,155d
    jne sna21
    inc dx
    mov cx,21d
    cmp dx,259d
    jne sna21

    ;Arriere-plan du  bouton
    


    
    
;;;;;;;;;;;;;;;     ;Arriere-plan du  bouton

    mov cx,176d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna22:int 10h
    inc cx
    cmp cx,310d
    jne sna22
    inc dx
    mov cx,176d
    cmp dx,259d
    jne sna22

    ;Arriere-plan du  bouton
    

    

    
    
    ;;;;;;;;;;;;;;;     ;Arriere-plan du  bouton

    mov cx,331d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna23:int 10h
    inc cx
    cmp cx,465d
    jne sna23
    inc dx
    mov cx,331d
    cmp dx,259d
    jne sna23

    ;Arriere-plan du  bouton
    


    
    
    
    ;;;;;;;;;;;;;;;     ;Arriere-plan du  bouton

    mov cx,486d
    mov dx,210d
    mov al,02h
    mov ah,0ch
    sna24:int 10h
    inc cx
    cmp cx,620d
    jne sna24
    inc dx
    mov cx,486d
    cmp dx,259d
    jne sna24

    ;Arriere-plan du  bouton
    
    ;initialisation sourissssssssssssssssss

    again2:
    mov ax,0000h
    int 33h
    cmp ax,0000h
    je again2

    ;Endsssssssssss initialisation sourissssssssssssssssss
    


    ;afficher souris intialise

    mov ax, 0001h
    int 33h

    ;endsssssssss afficher souris intialise

    ;;;;;;;;;;;;;;;;impression de texte de bouton;;;;;;;;
    
    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,05d      ; No de caracteres dans la chaine
    mov dl,7d       ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S21
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton

;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,07d      ; No de caracteres dans la chaine
    mov dl,26d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S22
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton

    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,10d      ; No de caracteres dans la chaine
    mov dl,45d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S23
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton
    
    
    ;Dessin du  boutton

    mov al,01h      ; Mode d'ecriture
    mov bh,0h       ; page number
    mov bl,04h    ;Couleur du  texte
    mov cx,04d      ; No de caracteres dans la chaine
    mov dl,66d      ; Debut du  colonne
    mov dh,14d      ; Debut du  ligne
    mov bp,offset S24
    mov ah,13h      ; impression du  chaine
    int 10h         ; interruption

    ;endsssssssssss Dessin du  boutton
    ;verifier si le boutton est clicke sna4
    
    
check24:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check24
    
    cmp cx,486d ;superieur ou egal a 1B qu'on veut!!!!
    jc check23
    cmp cx,620d ;inferieur a 5E!!!!
    jnc check24
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check21
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check21
    call BT4

check23:
mov ax,0003h
    int 33h
    cmp bx,1h
    jne check23
    
    cmp cx,331d ;superieur ou egal a 1B qu'on veut!!!!
    jc check22
    cmp cx,465d ;inferieur a 5E!!!!
    jnc check24
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check21
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check21
    jmp ChDIR
    
check22:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check22
    

    cmp cx,176d ;superieur ou egal a 1B qu'on veut!!!!
    jc check21
    cmp cx,311d ;inferieur a 5E!!!!
    jnc check23
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check21
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check21
    jmp redir   
    
check21:
    mov ax,0003h
    int 33h
    cmp bx,1h
    jne check21
    
    ;shr cx,01h

    cmp cx,21d  ;superieur ou egal a 1B qu'on veut!!!!
    jc check24
    cmp cx,156d ;inferieur a 5E!!!!
    jnc check22
    cmp dx,210d ;superieur ou egal a 1B qu'on veut!!!!
    jc check21
    cmp dx,260d ;inferieur a 2E!!!!
    jnc check21
    jmp CRDIR
    jmp check24
    
ret
endp BT2
    
    ;;;;;;;;;;;; Botton Quitter programme;;;;;;;;;;;;;;;;;
BT4 proc
exit:   
mov al,03h
mov ah,00h
int 10h
mov ax, 4c00h             ; Quitter programme
int 21h

    endp BT4
    
CREATION:
call SIMPLE
lea dx, msg2                  ; Message creation fichier
    call afficher1
    call lire1                ; Lire le nom du  fichier
    lea dx, tab1[2]        ; a creer
    mov cx, 0                 ; Attribue 0 equivaut a mode lecture
    mov ah, 3ch               ; Creation fichier
    int 21h
    push ax                   ; temporairement stocker le fichier dans la pile.
    lea dx, msg28             ; donner la main 
    call afficher1                ; a ecrire
    call lirechar               ; Recuperer le choix
    and al, 0fh
    cmp al, 0fh                 ; si choix = 'O' ou 'o'
    jnz no
    lea dx, msg29
    call afficher1
    pop bx                    ; Reprendre le fichier du  pile
    mov tab1[1], 0
write : call lirechar           ; Lire caractere par caractere.
    mov tab1[0], al
    cmp tab1[0], 27        ; verifier si caractere 'Esc' (arret).
    jz no
    cmp tab1[0], 0dh
    jne neol
    lea dx, msg26
    call afficher1
    mov si, dx
    mov byte ptr ds:[si + 2], 0 
    mov cx, 3               ; cx nombre de bytes a ecrire 
    jmp com
neol :  mov cx, 1
    lea dx, tab1[0]
com :   mov ah, 40h            ; fprintf
    int 21h
    mov byte ptr ds:[si + 2], '$'
    jmp write
    ENDING: JMP ENDINGII
no :    lea dx, msg16          ; creation avec success
    call afficher1
    call lirechar
    jmp begin

DELETE:
call SIMPLE
lea dx, msg3              ; message suppression fichier
    call afficher1
    call lire1                ; Lire le nom du  fichier a supprimer
    lea dx, tab1[2]
    mov ah, 41h               ; supprimer le fichier
    int 21h
    cmp ax, 2                 ; erreur si le fichier est introuvable
    jnz err2
    lea dx, msg14
    call afficher1
    jmp endd
err2 :  cmp ax, 5                 ; erreur si l'access est interdit
    jnz done
    lea dx, msg15
    call afficher1
    jmp endd
done :  lea dx, msg17             ; Suppression avec success
    call afficher1
endd :  call lirechar
    jmp begin

ENDINGII: JMP ENDINGI

RENAME:
call SIMPLE
lea dx, msg4              ; procedu re de renaming a fichier
    call afficher1
    call lire1                ; Lire le nom du  fichier renomme
    lea dx, msg5
    call afficher1
    call lire2                ; Lire le nouveau nom
    push ds
    pop es
    lea dx, tab1[2]
    lea di, tab2[2]
    mov ah, 56h               ; renommer fichier
    int 21h
    cmp ax, 2                 ; erreur si le fichier est introuvable
    jnz err3
    lea dx, msg14
    call afficher1
    jmp ende
err3 :  cmp ax, 3                 ; Erreur si le chemin est intouvable
    jnz err4
    lea dx, msg14
    call afficher1
    jmp ende
err4 :  cmp ax, 5                 ; erreur si l'access est interdit
    jnz ren
    lea dx, msg15
    call afficher1
    jmp ende
    ren :   lea dx, msg18             ; Renommer avec succes
    call afficher1
ende :  call lirechar
    jmp begin

VIEW:
call SIMPLE
lea dx, msg30             ; procedure pour voir le
    call afficher1        ; contenue du fichier
    call lire1                ; recuperer nom du fichier
    lea dx, msg26
    call afficher1
    call afficher1
    lea dx, tab1[2]        ; ouvrir le fichier
    mov ax, 3d02h
    int 21h
    mov tab2[0], 0
    cmp ax, 2                 ; erreur si fichier introuvable
    jnz v_err
    lea dx, msg14
    call afficher1
    jmp endv
v_err : cmp ax, 3                 ; erreur si chemin introuvable
    jnz cont2
    lea dx, msg21
    call afficher1
    jmp endv
cont2 : mov bx, ax
    push ax
    mov cx, 1
    lea dx, tab1
    mov ah, 3fh               ; recuperer le fichier
    int 21h
    cmp ax, 0                 ; stop si end-of-fichier
        jz pus
        jnz show2
ENDINGI: JMP ENDINGS
show2 :     mov tab1[1], '$'
    lea dx, tab1
    call afficher1
    pop ax
    jmp cont2
    cmp tab1[0], 0dh
       
    inc tab2[0]
    cmp tab2[0], 23        ; verifier si end-du-page
    jnz show1temp
show1temp:  jmp show1
    
    lea dx, msg27
    call afficher1
    call lirechar
    mov tab2[0], 0
    lea dx, msg26
    call afficher1
    pus:   mov ah,02
        mov al,0
    mov cx,0
    mov dx,10
    int 21
    ;int 21h
    ;push ax                   ; temporairement stocker le fichier dans la pile.
    lea dx, msg28             ; donner la main 
    call afficher1                ; a ecrire
    call lirechar               ; Recuperer le choix
    and al, 0fh
    cmp al, 0fh               ; si choix = 'O' ou 'o'
    jnz no1
    lea dx, msg29
    call afficher1
    pop bx                    ; Reprendre le fichier du  pile
    mov tab1[1], 0
write1 :    call lirechar               ; Lire caractere par caractere.
    mov tab1[0], al
    cmp tab1[0], 27        ; verifier si caractere 'Esc' (arret).
    jz no1
    cmp tab1[0], 0dh
    jne neol1
    lea dx, msg26
    call afficher1
    mov si, dx
    mov byte ptr ds:[si + 2], 0
    mov cx, 3
    jmp com1
neol1 : mov cx, 1
    lea dx, tab1[0]
com1:   mov ah, 40h               ; fprintf
    int 21h
    mov byte ptr ds:[si + 2], '$'
    jmp write1
no1 :   lea dx, msg16             ; creation avec success
    call afficher1
    call lirechar
    jmp begin
show1 :     mov tab1[1], '$'
    lea dx, tab1
    call afficher1
    pop ax
    jmp cont2
endv :  call lirechar
    jmp begin


jmp DELETE
COPY:
call SIMPLE
lea dx, msg6              ; procedure de copiage d'un fichier
    call afficher1                ; recuperer nom du fichier 
    call lire1                ; a copier
    mov cx, bx
    lea dx, msg7
    call afficher1
    call lire2                ; recuperer chemin du destination
    mov tab2[bx], '\'      ; repertoire
    inc bx
    mov ax, 2
    cp :    mov si, ax                ; concatenation chemin et nom de fichier
    mov dl, tab1[si]
    mov tab2[bx], dl
    inc bx
    inc al
    cmp cx, ax
    jne cp
    mov cx, 0
    lea dx, tab2[2]        ; Creation fichier in
    mov ah, 3ch               ; destination repertoire
    int 21h
    cmp ax, 3                 ; afficher message d'erreur
    jnz cont                  ; si chemin introuvable
    lea dx, msg21
    call afficher1
    jmp COPY               ; en cas d'erreur recuperer data encore
cont :  push ax
    lea dx, tab1[2]        ; ouvrir source fichier
    mov ax, 3d00h
    int 21h
    push ax
rd :    pop bx
    lea dx, tab1
    mov cx, 80h               ; recuperer source fichier
    mov ah, 3fh
    int 21h
    cmp ax, 0                 ; verifier si tout le fichier
    jz fin                    ; est recuperer
    mov cx, bx
    pop bx
    push bx
    push cx
    mov cx, ax
    lea dx, tab1           ; ecrire dans un nouveau fichier pour
    mov ah, 40h               ; completer le copiage
    int 21h
    jmp rd                    ; recuperer fichier avance
    fin :   lea dx, msg25             ; copiage avec succes
    call afficher1
    call lirechar
    jmp begin

CRDIR :
call SIMPLE
lea dx, msg8              ; procedure de creation
    call afficher1                ; d'un repertoire
    call lire1                ; recuperer nom du repertoire
    lea dx, tab1[2]        ; a creer
    mov ah, 39h               ; creer un repertoire
    int 21h
    cmp ax, 3                 ; erreur si chemin introuvable
    jnz err5
    lea dx, msg21
    call afficher1
    jmp endf
err5 :  cmp ax, 5                 ; erreur si acces refuse
    jnz done1
    lea dx, msg15
    call afficher1
    jmp endf
done1 : lea dx, msg19         ; creation avec success
    call afficher1
endf :  call lirechar
    jmp begin

REDIR :
call SIMPLE
lea dx, msg9              ; procedure de suppression repertoire
    call afficher1
    call lire1                ; recuperer le nom du  repertoire 
    lea dx, tab1[2]        ; a supprimer
    mov ah, 3ah               ; supprimer repertoire
    int 21h
    cmp ax, 3                 ; erreur si chemin introuvable
    jnz err6
    lea dx, msg21
    call afficher1
    jmp endg
err6 :  cmp ax, 5         ; erreur si acces refuse
    jnz done2
    lea dx, msg15
    call afficher1
    jmp endg
    done2 : lea dx, msg20             ; Supression avec succes
    call afficher1
endg :  call lirechar
        jmp begin
         
ChDIR :
CALL SIMPLE
lea dx, msg10             ; procedure de changement repertoire
    call afficher1
    call lire1                ; recuperer nom du repertoire
    lea dx, tab1[2]        ; a changer
    mov ah, 3bh               ; changer repertoire
    int 21h
    cmp ax, 3                 ; erreur si chemin introuvable
    jnz done3
    lea dx, msg21
    call afficher1
    jmp endh
    done3 : lea dx, msg22             ; changement avec succes
    call afficher1
endh :  call lirechar
    jmp begin


LISTING:   
call SIMPLE
    mov ax, 3h                ; procedure qui affiche
    int 10h                   ; contenue d'un repertoire
    lea dx, msg24
    mov cx, 0
    mov ah, 4eh               ; recuperer le premier fichier
    int 21h                   ; dans la repertoire
    cmp ax, 18                ; verifier s'il y a pas de fichier
    jnz list                  ; dans la repertoire
    lea dx, msg14             ; afficher message
    call afficher1                ; Fichier introuvable
    call lirechar
    jmp begin
list :  mov ah, 2fh               ; recuperer dta address
    int 21h
    mov byte ptr es:[bx + 42], 0
    add bx, 1eh
    mov tab1[0], 0
    char :  mov dl, byte ptr es:[bx]  ; recuperer caractere du
    inc bx                    ; nom de fichier from DTA
    inc tab1[0]
    cmp dl, '.'               ; verifier si extension
    jnz cont3                 ; marche
cont4 : lea dx, msg31
    call afficher1
    inc tab1[0]
    cmp tab1[0], 0bh       ; verifier la fin du  nom de fichier
    jne cont4                 ; Tableu - 13 caracteres
    jmp char
cont3 : mov ah, 02h               ; Afficher caractere
    int 21h                   ; du  nom de fichier
    cmp dl, 0                 ; verifier la fin
    jne char                  ; du  nom de fichier
    lea dx, msg26
    call afficher1
    inc cx
    cmp cx, 23                ; verifier la fin de la page
    jne cont1
    lea dx, msg27
    call afficher1
    call lirechar
    mov cx, 0
    lea dx, msg26
    call afficher1
cont1 : mov ah, 4fh               ; Fichier suivant
    int 21h
    jnc list
    lea dx, msg27
    call afficher1
    call lirechar
    jmp begin1
    
ENDINGS:
CALL SIMPLE
mov al,01h
    mov bh,0h
    mov bl, 0fh
    mov cx,15h
    mov dl,00h
    mov dh,00H
    mov bp,offset msg110
    mov ah,13h
    int 10h
    mov ah,07h
    int 21h
    CALL SIMPLE
    MOV AH,4CH
    INT 21h


    afficher1 proc                ; procedure pour afficher
      mov ah, 09h             ; une chaine sur l'ecran
      int 21h
      ret
    afficher1 endp

    lirechar proc               ; procedure lire une
      mov ah, 01h             ; caractere du clavier
      int 21h
      ret
    lirechar endp

    lire1 proc                ; procedure lecture
      mov [tab1], 80       ; premiere chaine
      lea dx, tab1
      mov ah, 0ah             ; lire une chaine du  clavier
      int 21h
      mov bl, tab1[1]
      mov bh, 0
      add bx, 2
      mov tab1[bx], 0      ;  chaine de caractere ASCIIZ
      ret                     ; mettre fin avec une valeur 0
    lire1 endp

    lire2 proc                ; procedure lecture
      lea dx, tab2         ; deuxieme chaine de caracteres
      mov ah, 0ah
      int 21h
      mov bl, tab2[1]
      mov bh, 0
      add bx, 2
      mov tab2[bx], 0
      ret
    lire2 endp
    
    SIMPLE proc
    MOV AL,03H                ; input text mode
    MOV AH,00H                ; mode video
    INT 10H
    RET
    SIMPLE endp
code ends
END start
