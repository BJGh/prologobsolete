domains
int = integer
list = int*

predicates
nondeterm run
nondeterm do(char)
    nondeterm readlist(list)
    nondeterm max(list, integer)
    nondeterm min(list, integer)
    nondeterm inner(list, integer)
    nondeterm outer(list, integer, integer)


clauses
  readlist([H|T]):-
        write(">> "), readint(H), !, readlist(T). 
    readlist([]).
    
     max([X], X).
    max([H|T],H):-max(T,M),H>M,!.
    max([_|T],M):-max(T,M).
    
    min([X], X).
    min([H|T],H):-min(T,M),H<M,!.
    min([_|T],M):-min(T,M).
    
    
    inner([], C):-write("\t", C),nl.
    
        inner([_|T], C):-
            C = 0, !,
            write(" -   "),
            inner(T, C).
            
        inner([H|T], C) :-
            C > 0,
            H >= C, !,
            write(" |   "),
            inner(T, C).
            
        inner([H|T], C) :-
            C < 0,
            H <= C, !,
            write(" |   "),
            inner(T, C).
        
        inner([_|T], C) :-
            write("     "),
            inner(T, C).
        
        outer(L, C, N):-
            C >= N, 
            NewC = C - 1,
            inner(L, C),  
            outer(L, NewC, N).
        
    outer(_, C, C):-nl.
    
    run:-
write("Welcome"),nl,
write("enter 1 to start the program"),nl,
write("enter 0 to exit"),nl,
write("Choose the command >>"),readchar(N),write(N),nl,
do(N),
run.



do('1'):-
readlist(L),nl,
max([0|L],Max),min([0|L],Min),nl,
outer(L,Max,Min).
do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").

goal
run.


    
    
	