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

language(javascript) :-
  why(make_money),
  which_platform(web),
  web(back_end),
  want_to_work_for(startup),
  try_something_new(yes).

language(python) :-
  why(make_money),
  which_platform(web),
  web(back_end),
  want_to_work_for(startup),
  try_something_new(no),
  favourite_toy(lego).

language(ruby) :-
  why(make_money),
  which_platform(web),
  web(back_end),
  want_to_work_for(startup),
  try_something_new(no),
  favourite_toy(play_doh).

language(php) :-
  why(make_money),
  which_platform(web),
  web(back_end),
  want_to_work_for(startup),
  try_something_new(no),
  favourite_toy(old_ugly).

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

language(python) :-
  why(just_for_fun),
  prefer_to_learn(easy_way).

language(python) :-
  why(just_for_fun),
  prefer_to_learn(best_way).

language(java) :-
  why(just_for_fun),
  prefer_to_learn(harder_way),
  car(auto).

language(c) :-
  why(just_for_fun),
  prefer_to_learn(harder_way),
  car(manual).

language(cpp) :-
  why(just_for_fun),
  prefer_to_learn(hardest_way).

language(python) :-
  why(im_interested),
  prefer_to_learn(easy_way).

language(python) :-
  why(im_interested),
  prefer_to_learn(best_way).

language(java) :-
  why(im_interested),
  prefer_to_learn(harder_way),
  car(auto).

language(c) :-
  why(im_interested),
  prefer_to_learn(harder_way),
  car(manual).

language(cpp) :-
  why(im_interested),
  prefer_to_learn(hardest_way).

language(python) :-
  why(improve_myself),
  prefer_to_learn(easy_way).

language(python) :-
  why(improve_myself),
  prefer_to_learn(best_way).

language(java) :-
  why(improve_myself),
  prefer_to_learn(harder_way),
  car(auto).

language(c) :-
  why(improve_myself),
  prefer_to_learn(harder_way),
  car(manual).

language(cpp) :-
  why(improve_myself),
  prefer_to_learn(hardest_way).


% Questions for the knowledge base
question(why) :-
  write('Why do you want to learn programming?'), nl.

question(which_platform) :-
  write('Which platform/field?'), nl.

question(which_mobile_os) :-
  write('Which OS?'), nl.

question(web) :-
  write('Which "end"?'), nl.

question(want_to_work_for) :-
  write('I want to work for...'), nl.

question(think_about_microsoft) :-
  write('What do you think about Microsoft?'), nl.

question(try_something_new) :-
  write('Do you want to try something new, with huge potential, but less mature?'), nl.

question(favourite_toy) :-
  write('Which one is your favourite toy?'), nl.

question(prefer_to_learn) :-
  write('I prefer to learn things...'), nl.

question(car) :-
  write('Auto or Manual car?'), nl.


% Assigns an answer to questions from the knowledge base
why(Answer) :-
  answers(why, Answer).
why(Answer) :-
  \+ answers(why, _),
  ask(why, Answer, [for_my_kids, i_dont_know, make_money, just_for_fun, im_interested, improve_myself]).

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
web(Answer) :-
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

try_something_new(Answer) :-
  answers(try_something_new, Answer).
try_something_new(Answer) :-
  \+ answers(try_something_new, _),
  ask(try_something_new, Answer, [yes, no]).

favourite_toy(Answer) :-
  answers(favourite_toy, Answer).
favourite_toy(Answer) :-
  \+ answers(favourite_toy, _),
  ask(favourite_toy, Answer, [lego, play_doh, old_ugly]).

prefer_to_learn(Answer) :-
  answers(prefer_to_learn, Answer).
prefer_to_learn(Answer) :-
  \+ answers(prefer_to_learn, _),
  ask(prefer_to_learn, Answer, [easy_way, best_way, harder_way, hardest_way]).

car(Answer) :-
  answers(car, Answer).
car(Answer) :-
  \+ answers(car, _),
  ask(car, Answer, [auto, manual]).


% Asks the Question to the user and saves the Answer
ask(Question, Answer, Choices) :-
  question(Question),
  write(Choices),
  nl,
  read(Response),
  asserta(answers(Question, Response)),
  Response = Answer.
