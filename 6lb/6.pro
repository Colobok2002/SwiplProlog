a_n(N, Result) :-
    Denominator is N*N + 7*N + 12,
    Result is 9 / Denominator.

partial_sum(0, 0).
partial_sum(N, Result) :-
    N > 0,
    N1 is N - 1,
    partial_sum(N1, SumN1),
    a_n(N, AN),
    Result is SumN1 + AN.

partial_product(0, 1). 
partial_product(N, Result) :-
    N > 0,
    N1 is N - 1,
    partial_product(N1, ProdN1),
    a_n(N, AN),
    Result is ProdN1 * AN.

main :-
    N = 5,
    partial_sum(N, Sum),
    partial_product(N, Prod),
    format('Partial sum of series S for N = ~w: ~w~n', [N, Sum]),
    format('Partial product of series P for N = ~w: ~w~n', [N, Prod]).

:- main.

