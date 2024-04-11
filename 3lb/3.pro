not(1, 0).
not(0, 1).

and(1, 1, 1).
and(_, _, 0).

or(0, 0, 0).
or(_, _, 1).

function(X, Y, Z, Result) :-
    or(and(X, Y, Tmp), not(Z, Tmp), Result);
    
    or(not(X, XTmp), not(Y, YTmp), Result),
    and(XTmp, YTmp, Result);
    
    or(or(not(X, XTmp), not(Y, YTmp), Tmp1), not(Z, ZTmp), Tmp2),
    and(Tmp1, Tmp2, Result);
    
    and(X, Y, Tmp1),
    and(Tmp1, Z, Result).

truth_table :-
    write('X-Y-Z  |  Result'), nl,
    write('-------------------'), nl,
    truth_value(1, 1, 1),
    truth_value(1, 1, 0),
    truth_value(1, 0, 1),
    truth_value(1, 0, 0),
    truth_value(0, 1, 1),
    truth_value(0, 1, 0),
    truth_value(0, 0, 1),
    truth_value(0, 0, 0).

truth_value(X, Y, Z) :-
    function(X, Y, Z, Result),
    write(X-Y-Z), write(' |  '), write(Result), nl.

:- truth_table.
