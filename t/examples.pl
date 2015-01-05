:- use_module(library(pager), [with_pager/1]).

% Run this script manually to try different scenarios:
%
%   swipl -f dev.pl -q -t main -s t/examples.pl
%   swipl -f dev.pl -q -t main -s t/examples.pl | cat
%   swipl -f dev.pl -q -t main -s t/examples.pl > file.txt

lots_of_lines :-
    forall(between(1,40,N),writeln(N)).

main :-
    with_pager(lots_of_lines).
