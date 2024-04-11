function(X, Result) :-
    X > 1,
    !,
    Result is log(X + 1).
function(X, Result) :-
    A is 1,
    Result is sin(sqrt(abs(A * X))) ^ 2.


:- function(0.5, Result), write(Result), nl.
