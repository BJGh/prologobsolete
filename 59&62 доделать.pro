domains
list = string*
expression = dig(real)
unar_minus(expression)
plus(expression,expression)
minus(expression,expression)
mult(expression,expression)
divide(expression,expression)

predicates

fronttoken
analysis(string,expression)
scan(string,list)
parser(list,list,expression)
divi(list,list,expression)
divi2(list,list,expression,expression)
multi1(list,list,expression)
multi2(list,list,expression,expression)
pls(list,list,expression)
pls1(list,list,expression,expression)
el_expression(list,list,expression)
next(string,list,list)
solver(expression,real)

clauses
analysis(String,Expression):-scan(String,List),parser(List,[],Expression).

scan(String,[Lex|List]):-fronttoken(String,Lex,String1),!,
scan(String1,List).
scan(_,[]).


parser(List,Ost,Expr):-pls(List,Ost,Expr).
pls(List,Ost,Expr2):-multi1(List,Ost1,Expr1),pls1(Ost1,Ost,Expr1,Expr2).

pls1(["+"|List],Ost,Expr1,Expr3):-!, multi1(List,Ost1,Expr2),
pls1(Ost1,Ost,plus(Expr1,Expr2),Expr3).
pls1("-"|List],Ost,Expr1,Expr3):-!,multi1(List,Ost1,Expr2),
pls1(Ost1,Ost,minus(Expr1,Expr2),Expr3).

pls1(List,List,Expr,Expr).

multi1(List,Ost,Expr2):-divi(List,Ost1,Expr1),
multi2(Ost1,Ost,Expr1,Expr2).

divi2(["*"|List],Ost,Expr1,Expr3):-!,

