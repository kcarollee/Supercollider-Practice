// The Pattern Family
// PBind
// combines several value streams into one event stream
Pbind(
	\degree,
	Pseries(0, 1, 30),
	\dur,
	0.05
).play;

// play the note MIDDLE C, one time per second
// \degree: scale degrees
// 0: first scale degree
Pbind(\degree, 1).play;
Pbind(\degree, 0, \dur, 0.5).play;

// Pseq: play once all the items of the list, in sequence
(
Pbind(
	// providing a whole Pseq as the input value for \degree
	\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 1),
	// providing a float as the input value for \dur
	\dur, 0.2
).play;
)

// Pseq has no limit on the number of times it can repeat its sequence
(
Pbind(
	\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], inf),
	\dur, Pseq([0.2, 0.1, 0.1, 0.2, 0.2, 0.35], inf)
).play;
)

Pbind(\degree, 5).play;
Pbind(\note, 9).play;
Pbind(\midinote, 69).play;
Pbind(\freq, 440).play;

for(3, 7){
	arg i;
	i.postln
};

8.do{
	arg i;
	i.postln
};


(
var seqLen = 100;
var testList = Array.rand(seqLen, -10, 10);

testList;
Pbind(
	\degree, Pseq(testList, 1),
	// duration: in beats, default: 1 beat per second
	\dur, Pseq([0.2, 0.1, 0.1], inf),

	// amplitude: 0-1
	\amp, Pseq([0.7, 0.5, 0.3, 0.2], inf),

	// 0-1, lesser the val -> more staccatoy
	\legato, 0.5
).play;
)

(
Pbind(
	// Prand picks a random item from the list everytime
	\degree, Prand([2, 3, 4, 5, 6], inf),
	\dur, Prand([0.2, 0.5, 1, 0.2, 0.1], inf),
	\amp, 0.2,
	\legato, 0.1
).play
)


// Pwhite: equal distribution RNG

(
Pbind(
	\freq, Pwhite(100, 500),
	\dur, Prand([0.15, 0.25, 0.3], inf),
	\amp, 0.2,
	\legato, 0.3
).trace.play; // trace before play: helpful when debugging
)

// Pser
(
Pbind(
	\note, Pser([0, 2, 3, 5, 7, 8, 11, 12], 10),
	\dur, 0.15
).play
)

// Pxrand never repeats the same element in a row
(
p = Pbind(
	\note, Pxrand([0, 2, 3, 5, 7, 11, 12], inf),
	\dur, 0.5
).play;
)

// shuffle the elements in the list once
(
p = Pbind(
	\note, Pshuf([0, 2, 3, 5, 7, 8, 11, 12], 6),
	\dur, 0.15
).play;
)

//Pslide
// list, repeats, length, step
// slide over notes
(
p = Pbind(
	\note, Pslide([0, 2, 3, 5, 7, 8, 11, 12], 7, 4, 5),
	\dur, 0.15
).play;
)

// Pseries
// start, step, length
(
Pbind(
	\note, Pseries(0, 7, 5),
	\dur, 0.15;
).play;
)

(
Pbind(
	\note, Pseq([0, 2, 3, 5, 7, 8, 11, 12], inf),
	\dur, Pgeom(0.1, 1.1, 25);
).play;
)

// Pn(a, b) ->  repeat 'a' 'b' times.
(
Pbind(
	\note, Pseq([0, Pn(2, 3), 3, Pn(5, 3), 7, Pn(8, 3), 11, 12], 1),
	\dur, 0.15
).play;
)

// Chords

(
Pbind(
	\note, Pseq([[0, 3, 7], [2, 5, 8], [3, 7, 10], [5, 8, 12]], 3),
	\dur, 0.15
).play;
)

(
Pbind(
	\note, Pseq([[-7, 3, 7, 10], [0, 3, 5, 7]], 2),
	\dur, 1,
	\legato, 0.2,
	\strum, 0.15
).play;
)

// scales
(
Pbind(
	// this only works with \degree
	\scale, Scale.harmonicMajor,
	\degree, Pseq([0, 1, 2, 3, 4, 5, 6, 7], 1),
	\dur, 0.15
).play;
)

Scale.directory;

(
Pbind(
	// chromatic note in between scale degrees
	\degree, Pseq([0, 1, 2, 3, 3.1, 4], 1)
).play;
)


// \ctranspose: chromatic transposition
(
Pbind(
	\note, Pser([0, 2, 3, 5, 7, 8, 11, 12], 11),
	\ctranspose, 11,
	\dur, 0.15
).play;
)

// Microtones
Pbind(\note, Pseq([0, 0.5, 1, 1.5, 1.75, 2], 1)).play;

// default tempo: 60BPM
(
Pbind(
	\degree, Pseq([0, 0.1, 1, 2, 3, 4, 5, 6, 7]),
	\dur, 1
).play(TempoClock(120 / 60)); // 120 beats over 60 secs -> 120BPM
)

// Rests

(
Pbind(
	\degree, Pwhite(0, 10),
	\dur, Pseq([0.1, 0.1, 0.3, 0.6, Rest(0.3), 0.25], inf),
	\legato, Pseq([0.1, 0.5], inf)
).play;
)

// playing multiple pbinds

(
Pbind(
	\freq, Pseries(110, 111, 10),
	\dur, 0.2,
	\legato, Pwhite(0.1, 1)
).play;

Pbind(
	\freq, Pn(Pseries(220, 222, 10)),
	\dur, 0.25,
	\legato, Pwhite(0.1, 1)
).play

)


// {}.fork to play Pbinds in a time-ordered fashion
(
t = TempoClock(120 / 60);
{
	Pbind(
		\note, Pseq([[4, 11], [6, 9]], 32),
		\dur, 1/6,
		\amp, Pseq([0.05, 0.03], inf)
	).play(t);

	2.wait;

	Pbind(
		\note, Pseq([[-25, -13, -1], [-20, -8, 4], \rest], 3),
		\dur, Pseq([1, 1, Rest(1)], inf),
		\amp, 0.1
	).play(t);
}.fork(t)
)

(
c = [0, 2, 3, 5, 7, 8, 11, 12];
Pbind(
	\note, Pseq(c, 1),
	\dur, 0.15
).play;
)

~scale = [0, 1, 2, 3, 4, 5, 6, 7];
~durs = [0.4, 0.2, 0.2, 0.4, 0.8, 0.2, 0.2, 0.2];

(
Pbind(
	\degree, Pseq(~scale),
	\dur, Pseq(~durs)
).play;

Pbind(
	\degree, Pseq(~scale.reverse + 7),
	\dur, Pseq(~durs.reverse)
).play;
)

// Starting and stopping Pbinds independently

// define the score
(
p = Pbind(
	\midinote, Pseq([57, 62, 64, 65, 67, 69], inf),
	\dur, 1/7
);
)

// store an EventStreamPlayer into a variable
~myPlayer = p.play;
~myPlayer.stop;
~myPlayer.resume;
~myPlayer.stop.reset;
~myPlayer.start;


// post window clea; ctrl shift p
(

// myDurs is a local variable
var myDurs = Pseq([Pn(1, 5), 3, Pn(1, 5), 3, Pn(1, 6), 1/2, 1/2, 1, 1, 3, 1, 3], inf) * 0.4;


// environment variables upperMelody, loweerMelody that can be used anywhere in SC
~upperMelody = Pbind(
	\midinote, Pseq([69, 74, 76, 77, 79, 81, Pseq([81, 79, 81, 82, 79, 81], 2), 82, 81, 79, 77, 76, 74, 74], inf),
	\dur, myDurs
);

~lowerMelody = Pbind(
	\midinote, Pseq([57, 62, 61, 60, 59, 58, 57, 55, 53, 52, 50, 49, 50, 52, 50, 55, 53, 52, 53, 55, 57, 58, 61, 62, 62], inf),
	\dur, myDurs
);
)


(
~player1 = ~upperMelody.trace.play;
~player2 = ~lowerMelody.play;
)

// stop them separately
~player1.stop;
~player2.stop;













