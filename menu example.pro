domains
list_d = integer*
EL = integer
POS = integer
R = integer
predicates
 nondeterm change_single_list_element(list_d, integer, integer, list_d)
 readlist(list_d)
nondeterm main_menu
nondeterm main_menu_item(integer)
nondeterm list_menu
nondeterm list_menu_item(integer)
clauses

readlist([H|Tail]):-readInt(H),!,readlist(Tail).
readlist([]).


 change_single_list_element([], _A, _B, []):-!.
    change_single_list_element([A|Tail], A, B, [B|Tail]):-!.
    change_single_list_element([Head|Tail], A, B, [Head|ChangedTail]):-
      change_single_list_element(Tail, A, B, ChangedTail).
      

main_menu:-
	write("1 - choose your operation"),nl,
	write("0 - exit"),nl,
	readInt(Item), main_menu_item(Item).
	
main_menu_item(0):-!.
main_menu_item(1):-
	list_menu,main_menu,!.

list_menu:-
	write("1 - enter list and show result"),nl,
	write("0 - back to main menu"),nl,
		readInt(Item), list_menu_item(Item).
		
list_menu_item(0):- !.
list_menu_item(1):-
	write("INPUT>>"),nl,
	readlist(L),nl,
	write("L="),write(L),nl,
write("Enter a digit witch you want to change in your list"),readInt(EL),nl,
write("Enter a pos witch you want to change on your list"),readInt(POS),nl,
change_single_list_element(L,POS,EL,R),nl,!,
 
	
	list_menu.
list_menu_item(_Item):-
	write("Bad choice. Enter correct [0-1] please"),nl,
	list_menu.
goal
main_menu.