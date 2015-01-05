:- module(pager, [with_pager/1]).


%% with_pager(:Goal)
%
%  Send output of Goal through the user's preferred pager.
%  The pager is only used if current_output is connected
%  to a terminal.  Otherwise, send output directly to
%  current_output.
:- meta_predicate with_pager(0).
with_pager(Goal) :-
    stream_property(current_output,tty(true)),
    !,
    setup_call_cleanup(
        with_pager_setup(PagerIn,Pid),
        with_output_to(PagerIn,Goal),
        with_pager_cleanup(PagerIn,Pid)
    ).
with_pager(Goal) :-
    call(Goal).


% set up a pager
with_pager_setup(PagerIn,Pid) :-
    once( getenv('PAGER',Pager)
        ; Pager=less
        ),
    process_create(
        path(Pager),
        [],
        [
            stdin(pipe(PagerIn)),
            stdout(std),
            process(Pid)
        ]
    ).

% clean up after a pager
with_pager_cleanup(PagerIn,Pid) :-
    close(PagerIn),
    process_wait(Pid,_Status).
