
gcd_recursive_descending(X, 0, X) :- !.
gcd_recursive_descending(X, Y, G) :-
    X >= Y,
    Z is X mod Y,
    gcd_recursive_descending(Y, Z, G).
gcd_recursive_descending(X, Y, G) :-
    X < Y,
    gcd_recursive_descending(Y, X, G).

gcd_recursive_ascending(X, Y, G) :-
    X >= Y,
    gcd_recursive_ascending_helper(X, Y, G).
gcd_recursive_ascending(X, Y, G) :-
    X < Y,
    gcd_recursive_ascending_helper(Y, X, G).

gcd_recursive_ascending_helper(X, 0, X) :- !.
gcd_recursive_ascending_helper(X, Y, G) :-
    Z is X mod Y,
    gcd_recursive_ascending_helper(Y, Z, G).

main :-
    gcd_recursive_descending(48, 18, G1),
    write('Greatest common divisor (descending): '), write(G1), nl,

    gcd_recursive_ascending(48, 18, G2),
    write('Greatest common divisor (ascending): '), write(G2), nl,
    halt.

:- main
