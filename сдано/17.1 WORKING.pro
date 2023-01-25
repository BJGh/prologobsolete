domains
int=integer
list=int*
predicates
 change_single_list_element(list, integer, integer, list)
nondeterm run
nondeterm do(char)
nondeterm readlist(list)

clauses
clauses
readlist([Head|Tail]):-
write("enter element of the list. Entering an empty value will finish op. INPUT >> "),
readint(Head),!,readlist(Tail).
readlist([]).


 change_single_list_element([], _A, _B, []):-!.
    change_single_list_element([A|Tail], A, B, [B|Tail]):-!.
    change_single_list_element([Head|Tail], A, B, [Head|ChangedTail]):-
      change_single_list_element(Tail, A, B, ChangedTail).
      
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
write("Enter a digit witch you want to replace"),nl,
write("INPUT>>"),readint(A),nl,
write("Enter a new digit. (Will replace an inputted digit instead) "),nl,
write("INPUT>>"),readint(B),nl,
 change_single_list_element(L,A,B,X),write("Entered list L = "),write(L),nl,write("The new list is :",X),nl.
do('0'):-
write("Done"),exit.
do(_):-
write("wrong choice").
goal
run.
