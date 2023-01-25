domains
int=integer
list=int*
predicates
nondeterm run
nondeterm do(char)
nondeterm readlist(list)
nondeterm p(list,int)

clauses
readlist([Head|Tail]):-
write("enter element of the list. Entering an empty value will finish op. INPUT >> "),
readint(Head),!,readlist(Tail).
readlist([]).

p([X,_],X).
p([_|T],X):-p(T,X).

run:-
write("Welcome"),nl,
write("enter 1 to start the program"),nl,
write("enter 0 to exit"),nl,
write("Choose the command >>"),readchar(N),write(N),nl,
do(N),
run.

do('1'):-
readlist(L),nl,
p(L,X),write("Entered list L = "),write(L),write("Penultimate element is :",X),nl.
do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").
goal
run.