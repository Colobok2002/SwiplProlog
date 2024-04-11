gcd(X, Y, G) :-
    X > 0,
    Y > 0,
    gcd_iter(X, Y, G).

gcd_iter(X, Y, G) :-
    X =< Y, !,
    gcd_iter(Y, X, G).
gcd_iter(X, Y, G) :-
    X > Y,
    Z is X mod Y,
    (Z = 0 ->
        G = Y
    ;
        gcd_iter(Y, Z, G)
    ).

find_gcd :-
    gcd(48, 18, GCD),
    write('NOD 48 and 18 = '), write(GCD), write('.\n').

:- initialization(find_gcd).
