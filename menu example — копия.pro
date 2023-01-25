predicates
nondeterm main_menu
nondeterm main_menu_item(integer)
nondeterm list_menu
nondeterm list_menu_item(integer)
clauses
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
	write("INPUT>>"),
	
	list_menu.
list_menu_item(_Item):-
	write("Bad choice. Enter correct [0-1] please"),nl,
	list_menu.
goal
main_menu.