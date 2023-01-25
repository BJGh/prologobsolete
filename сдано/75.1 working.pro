domains
int = integer
intl = int*
treetype = node(treetype,treetype,int);null
predicates
nondeterm run
nondeterm do(char)
nondeterm take(int,intl,intl)
nondeterm drop(int,intl,intl)
append(intl,intl,intl)
len(intl,int)
nondeterm rotl(int,intl,intl)
nondeterm readlist(intl)




clauses



 
readlist([H|T]) :- readint(H),!,readlist(T).
readlist([]).

take(0,_,[]).
take(K,[H|X],[H|Y]) :- K1=K-1, take(K1,X,Y).
 
drop(0,X,X).
drop(K,[_|H],Z) :- K1=K-1, drop(K1,H,Z).
 
append([],X,X).
append([H|T],X,[H|Y]) :- append(T,X,Y).
 
len([],0).
len([_|T],N):- len(T,N1), N=N1+1.
 
rotl(N,X,Y) :- len(X,L), M=N mod L, take(M,X,X1), drop(M,X,X2), append(X2,X1,Y).


run:-
write("Welcome"),nl,
write("enter 1 to start the program"),nl,
write("enter 0 to exit"),nl,
write("Choose the command >>"),readchar(N),write(N),nl,
do(N),
run.

do('1'):-
write("INPUT>>"),nl,
readlist(L),
write("Enter a digit of the List which will be slided LEFT"),nl,
readint(N),nl,
write("Your entered list L = "),write(L),nl,


rotl(N, L, Y),write("The result list Y = "),write(Y).

do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").
goal
run.