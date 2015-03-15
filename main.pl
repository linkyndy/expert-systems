language(python) :-
  why(for_my_kids).

language(python) :-
  why(i_dont_know).

language(java) :-
  why(make_money),
  which_platform(doesn_t_matter).

language(cpp) :-
  why(make_money),
  which_platform(gaming).

language(objectivec) :-
  why(make_money),
  which_platform(mobile),
  which_mobile_os(ios).

language(java) :-
  why(make_money),
  which_platform(mobile),
  which_mobile_os(android).

language(python) :-
  why(make_money),
  which_platform(facebook).

language(python) :-
  why(make_money),
  which_platform(google).

language(csharp) :-
  why(make_money),
  which_platform(windows).

language(objectivec) :-
  why(make_money),
  which_platform(apple).


why(Answer) :-
  ask(Answer, [for_my_kids, i_dont_know, make_money]).

which_platform(Answer) :-
  ask(Answer, [doesn_t_matter, gaming, mobile, facebook, google, windows, apple]).

which_mobile_os(Answer) :-
  ask(Answer, [ios, android]).


ask(Answer, Choices) :-
  write(Choices),
  nl,
  read(Answer).
