% Expert system should be started from here
main :-
  write('Which programming language should I learn first?'),
  nl,
  reset_answers,
  find_language(Language),
  write(Language).


find_language(Language) :-
  language(Language), !.


% Store user answers to be able to track his progress
:- dynamic(answers/2).


% Clear stored user progress
% reset_answers must always return true; because retract can return either true
% or false, we fail the first and succeed with the second.
reset_answers :-
  write('Resetting progress...'),
  retract(answers(_, _)),
  fail.
reset_answers.


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

language(javascript) :-
  why(make_money),
  which_platform(web),
  web(front_end).

language(csharp) :-
  why(make_money),
  which_platform(web),
  web(back_end),
  want_to_work_for(corporate),
  think_about_microsoft(im_a_fan).

language(java) :-
  why(make_money),
  which_platform(web),
  web(back_end),
  want_to_work_for(corporate),
  think_about_microsoft(not_bad).

language(java) :-
  why(make_money),
  which_platform(web),
  web(back_end),
  want_to_work_for(corporate),
  think_about_microsoft(suck).

language(csharp) :-
  why(make_money),
  which_platform(enterprise),
  think_about_microsoft(im_a_fan).

language(java) :-
  why(make_money),
  want_to_work_for(enterprise),
  think_about_microsoft(not_bad).

language(java) :-
  why(make_money),
  want_to_work_for(enterprise),
  think_about_microsoft(suck).

% Assigns an answer to questions from the knowledge base
why(Answer) :-
  answers(why, Answer).
why(Answer) :-
  \+ answers(why, _),
  ask(why, Answer, [for_my_kids, i_dont_know, make_money]).

which_platform(Answer) :-
  answers(which_platform, Answer).
which_platform(Answer) :-
  \+ answers(which_platform, _),
  ask(which_platform, Answer, [doesn_t_matter, gaming, mobile, facebook, google, windows, apple, web, enterprise]).

which_mobile_os(Answer) :-
  answers(which_mobile_os, Answer).
which_mobile_os(Answer) :-
  \+ answers(which_mobile_os, _),
  ask(which_mobile_os, Answer, [ios, android]).

web(Answer) :-
  answers(web, Answer).
which_mobile_os(Answer) :-
  \+ answers(web, _),
  ask(web, Answer, [front_end, back_end]).

want_to_work_for(Answer) :-
  answers(want_to_work_for, Answer).
want_to_work_for(Answer) :-
  \+ answers(want_to_work_for, _),
  ask(want_to_work_for, Answer, [startup, corporate]).

think_about_microsoft(Answer) :-
  answers(think_about_microsoft, Answer).
think_about_microsoft(Answer) :-
  \+ answers(think_about_microsoft, _),
  ask(think_about_microsoft, Answer, [im_a_fan, not_bad, suck]).



% Asks the Question to the user and saves the Answer
ask(Question, Answer, Choices) :-
  write(Choices),
  nl,
  read(Response),
  asserta(answers(Question, Response)),
  Response = Answer.
