% Expert system should be started from here
main :-
  write('Which programming language should I learn first?'),
  nl,
  find_language(Language),
  write(Language).


find_language(Language) :-
  language(Language), !.


% Store user answers to be able to track his progress
:- dynamic(answers/2).


% Rules for the knowledge base
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


% Assigns an answer to questions from the knowledge base
why(Answer) :-
  answers(why, Answer).
why(Answer) :-
  ask(why, Answer, [for_my_kids, i_dont_know, make_money]).

which_platform(Answer) :-
  answers(which_platform, Answer).
which_platform(Answer) :-
  ask(which_platform, Answer, [doesn_t_matter, gaming, mobile, facebook, google, windows, apple]).

which_mobile_os(Answer) :-
  answers(which_mobile_os, Answer).
which_mobile_os(Answer) :-
  ask(which_mobile_os, Answer, [ios, android]).


% Asks the Question to the user and saves the Answer
ask(Question, Answer, Choices) :-
  write(Choices),
  nl,
  read(Answer),
  asserta(answers(Question, Answer)).
