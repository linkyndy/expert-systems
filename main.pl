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
:- dynamic(progress/2).


% Clear stored user progress
% reset_answers must always return true; because retract can return either true
% or false, we fail the first and succeed with the second.
reset_answers :-
  write('Resetting progress...'),
  retract(progress(_, _)),
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


% Answers for the knowledge base
answer(for_my_kids) :-
  write('For my kids').

answer(i_dont_know) :-
  write('I don\'t know').

answer(make_money) :-
  write('Make money').

answer(just_for_fun) :-
  write('Just for fun').

answer(im_interested) :-
  write('I\'m interested').

answer(improve_myself) :-
  write('Improve myself').

answer(doesn_t_matter) :-
  write('Doesn\'t matter, I just want $$$').

answer(gaming) :-
  write('3D/Gaming').

answer(mobile) :-
  write('Mobile').

answer(facebook) :-
  write('Facebook').

answer(google) :-
  write('Google').

answer(windows) :-
  write('Windows').

answer(apple) :-
  write('Apple').

answer(web) :-
  write('Web').

answer(enterprise) :-
  write('Enterprise').

answer(ios) :-
  write('iOS').

answer(android) :-
  write('Android').

answer(front_end) :-
  write('Front-end (web interface)').

answer(back_end) :-
  write('Back-end ("brain" behind a website)').

answer(startup) :-
  write('Startup').

answer(corporate) :-
  write('Corporate').

answer(im_a_fan) :-
  write('I\'m a fan!').

answer(not_bad) :-
  write('Not Bad').

answer(suck) :-
  write('Suck').

answer(yes) :-
  write('Yes').

answer(no) :-
  write('No').

answer(lego) :-
  write('Lego').

answer(play_doh) :-
  write('Play-Doh').

answer(old_ugly) :-
  write('I\'ve an old & ugly toy, but I love it so much!').

answer(easy_way) :-
  write('The easy way').

answer(best_way) :-
  write('The best way').

answer(harder_way) :-
  write('The slightly harder way').

answer(hardest_way) :-
  write('The really hard way (but easier to pick up other languages in the future)').

answer(auto) :-
  write('Auto').

answer(manual) :-
  write('Manual').


% Assigns an answer to questions from the knowledge base
why(Answer) :-
  progress(why, Answer).
why(Answer) :-
  \+ progress(why, _),
  ask(why, Answer, [for_my_kids, i_dont_know, make_money, just_for_fun, im_interested, improve_myself]).

which_platform(Answer) :-
  progress(which_platform, Answer).
which_platform(Answer) :-
  \+ progress(which_platform, _),
  ask(which_platform, Answer, [doesn_t_matter, gaming, mobile, facebook, google, windows, apple, web, enterprise]).

which_mobile_os(Answer) :-
  progress(which_mobile_os, Answer).
which_mobile_os(Answer) :-
  \+ progress(which_mobile_os, _),
  ask(which_mobile_os, Answer, [ios, android]).

web(Answer) :-
  progress(web, Answer).
web(Answer) :-
  \+ progress(web, _),
  ask(web, Answer, [front_end, back_end]).

want_to_work_for(Answer) :-
  progress(want_to_work_for, Answer).
want_to_work_for(Answer) :-
  \+ progress(want_to_work_for, _),
  ask(want_to_work_for, Answer, [startup, corporate]).

think_about_microsoft(Answer) :-
  progress(think_about_microsoft, Answer).
think_about_microsoft(Answer) :-
  \+ progress(think_about_microsoft, _),
  ask(think_about_microsoft, Answer, [im_a_fan, not_bad, suck]).

try_something_new(Answer) :-
  progress(try_something_new, Answer).
try_something_new(Answer) :-
  \+ progress(try_something_new, _),
  ask(try_something_new, Answer, [yes, no]).

favourite_toy(Answer) :-
  progress(favourite_toy, Answer).
favourite_toy(Answer) :-
  \+ progress(favourite_toy, _),
  ask(favourite_toy, Answer, [lego, play_doh, old_ugly]).

prefer_to_learn(Answer) :-
  progress(prefer_to_learn, Answer).
prefer_to_learn(Answer) :-
  \+ progress(prefer_to_learn, _),
  ask(prefer_to_learn, Answer, [easy_way, best_way, harder_way, hardest_way]).

car(Answer) :-
  progress(car, Answer).
car(Answer) :-
  \+ progress(car, _),
  ask(car, Answer, [auto, manual]).


% Outputs a nicely formatted list of answers
% [First|Rest] is the Choices list, Index is the index of First in Choices
answers([], _).
answers([First|Rest], Index) :-
  write(Index), write(' '), answer(First), nl,
  NextIndex is Index + 1,
  answers(Rest, NextIndex).


% Parses an Index and returns a Response representing the "Indexth" element in
% Choices (the [First|Rest] list)
parse(0, [First|_], First).
parse(Index, [First|Rest], Response) :-
  Index > 0,
  NextIndex is Index - 1,
  parse(NextIndex, Rest, Response).


% Asks the Question to the user and saves the Answer
ask(Question, Answer, Choices) :-
  question(Question),
  answers(Choices, 0),
  read(Index),
  parse(Index, Choices, Response),
  asserta(progress(Question, Response)),
  Response = Answer.
