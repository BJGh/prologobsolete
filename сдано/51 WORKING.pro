domains 
  list = integer*
predicates
    change_sublist_to_const(list, integer, integer, integer, list)
    nondeterm run
nondeterm do(char)
nondeterm readlist(list)
clauses
readlist([Head|Tail]):-
write("enter element of the list. Entering an empty value will finish op. INPUT >> "),
readint(Head),!,readlist(Tail).
readlist([]).

  change_sublist_to_const(List, 0, 0, _Val, List):-!.
  change_sublist_to_const([_Head|Tail], 0, M, Val, [Val|ChangedTail]):-
    NextM = M - 1, !,
    change_sublist_to_const(Tail, 0, NextM, Val, ChangedTail).
  change_sublist_to_const([Head|Tail], N, M, Val, [Head|ChangedTail]):-
    NextN = N - 1,
    change_sublist_to_const(Tail, NextN, M, Val, ChangedTail).
    
    run:-
write("Welcome"),nl,
write("enter 1 to start the program"),nl,
write("enter 0 to exit"),nl,
write("Choose the command >>"),readchar(N),write(N),nl,
do(N),
run.
      
do('1'):-
readlist(L),nl,
write("enter from which position you want to replace"),nl,
write("POS = "),readint(POS),nl,
write("enter quantity of elements you want to replace"),nl,
write("QUANTITY OF ELEMENTS = "),readint(Q),nl,
write("enter a constant"),nl,
write("CONSTANT = "),readint(C),nl,
change_sublist_to_const(L, POS, Q, C, X),write("Entered list L = "),write(L),nl,
write("Result  list is :",X),nl.
do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").
goal
run.
