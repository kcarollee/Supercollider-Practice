// EVERYTHING, even numbers are objects in SC
[1, 2, 3, "wow"].reverse;
1.dup(4); // duplicate 1 4 times and put them in a list
100.rand.dup(4);
// choose a random float between 0 and 100.0, round it to 0.01 deg, duplicate this number 4 times in a list
100.0.rand.round(0.01).dup(4);

(
{
	CombN.ar(
		SinOsc.ar(
			midicps(
				LFNoise1.ar(3, 24,
					LFSaw.ar([5, 5.123], 0, 3, 80)
				)
			),
			0, 0.4
		),
		1, 0.3, 2
	)
}.play;
)

"STRING";
'SYMBOL';
\SYMBOL;

// Curly braces -> define functions
exprand(1, 1000.0);
{exprand(1, 1000.0)};

{rand(1000.0)}.dup(5).round(0.1);

// if statements in sc:
/*
if (cond, {true action}, {false action})
*/

if (100 > 50, {"TRUE".postln}, {"FALSE".postln});

// case
(
var num = 3;
case
{num == 0} {"NUM IS ZERO".postln}
{num == 1} {"NUM IS ONE".postln}
{num == 2} {"NUM IS TWO".postln}
{true} {"NONE".postln}
)


f = {
	arg a, b;
	["a plus b", a+b].postln
}

f.value(3, 2);

(
~testFunc = {
	arg a, b, c;
	("AHHH" ++ "AHHHH").postln;
	a + b + c;
}
)

~testFunc.value(1, 2, 4);

// ARRAYS IN SC

a = [1, 2, 3, 4, 5];
a.reverse;
a.scramble;
a.choose;
a.size;
a[0];
a.wrapAt(9);

["WOW", 99] ++ a;
a.add(4);
a.insert(2, "INSERTED");
a;

(
Array.series(size: 6, start: 10, step: 3);
Array.geom(size: 10, start: 0.1, grow: 4);
Array.fill(10, "SAME");
Array.fill(10, {rrand(1, 10)});
a = Array.fill(10, {
	arg index;
	index * 10
});
a.reverse;
a = Array.newClear(7);
a[3] = "wow";
)


(
30!4;
30.dup(4);
(50..79);
series(50, 51, 79);
// a series of step 3, ranging to 79
(50, 53 .. 79);
series(50, 53, 79);
Array.series(10, 50, 3);
)

(
~myFreqs = Array.fill(10, {rrand(440, 880)});
~myFreqs.do({
	arg item, count;
	(item + " " + count).postln
});
)

// ctrl + d for help on certain keywords



