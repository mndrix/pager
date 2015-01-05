# Synopsis

```prolog
:- use_module(library(pager)).
lots_of_lines :-
    forall(between(1,40,N),writeln(N)).

main :-
    with_pager(lots_of_lines).
```

# Description

Send the output of a predicate through the user's preferred pager.  It's helpful
for scripts which generate output for a user's terminal.  You can think of it
like calling a mythical `with_output_to(pager,Goal)`.

# Installation

Using SWI-Prolog 7.1 or later:

    ?- pack_install(pager).

This module uses [semantic versioning](http://semver.org/).

Source code available and pull requests accepted at
http://github.com/mndrix/pager

@author Michael Hendricks <michael@ndrix.org>
@license unlicense
