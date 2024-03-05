// a gentle intro to sc
"Hello World".postln;
ServerOptions.inDevices;
ServerOptions.outDevices;
o = Server.default.options;
o.device = "ASIO : MiniFuse ASIO Driver";
Server.default.reboot;


// printing in sc
"HELLO WORLD".postln;

{SinOsc.ar}.play;
{SinOsc.ar(LFNoise0.kr(10).range(500, 1500), mul: 0.1)}.play;


// code blocks:
/*
 As long as your cursor is anywhere
within the parentheses, a single [ctrl+Enter] will evaluate all lines for you
*/

(
{
	RLPF.ar(
		Dust.ar([1, 15]),
		LFNoise1.ar([0.1, 0.9]).range(10, 3000),
		0.2
	)
}.play;
)

// ctrl + shift + p to clear the post window
(
100.do(
	{"PRINT THIS LINE OVER AND OVER".scramble.postln};
)
)

(
x = "TEST STRING";
x.postln;
x;
)

(
a = "TEST STRING";
b = [0, 1, 2, 3, 5];
c = Pbind(
	\note,
	Pwhite(0, 10),
	\dur,
	0.1
);

a.postln;
b + 100;
c.play;
)


// local variables: valid only within the code block
(
var testVar = 4;
testVar;
)
