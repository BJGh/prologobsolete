
domains i=integer il=i* 
predicates del(i,il,il) 
nondeterm run
nondeterm do(char)
nondeterm readlist(il)
clauses 
del(1,[_|T],T):-!. 
del(N,[_,Y|T],L):-N1=N-1,
del(N1,[Y|T],L). 

readlist([Head|Tail]):-
write("enter element of the list. Entering an empty value will finish op. INPUT >> "),
readint(Head),!,readlist(Tail).
readlist([]).
 
 run:-
write("Welcome"),nl,
write("enter 1 to start the program"),nl,
write("enter 0 to exit"),nl,
write("Choose the command >>"),readchar(N),write(N),nl,
do(N),
run.

do('1'):-
readlist(L),nl,
write("Entered list L = "),write(L),nl,
 write("INPUT A QUANTITY OF ELEMENTS WICH YOU WANT TO DELETE FROM THE LIST"),
nl,
readint(N), 
del(N,L,X),write("The new list is :",X),nl,
write("YOU DELETED ",N),write("NUMBERS"),nl.
do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").
goal 
run.
