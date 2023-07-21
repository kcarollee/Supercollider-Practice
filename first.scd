"THIS IS A STRING AND PRESS CONTROL AND ENTER TO EXECUTE"
Server.default = s = Server.internal.boot
"TO STOP THE SOUND, CTRL + ."
play({SinOsc.ar(LFNoise0.kr([100, 3], mul: [100, 200], add: [1000, 2000]), 0.9)})

play({RLPF.ar(Dust.ar([1, 10]), LFNoise1.ar(1 / [3, 4], 1500, 1600), 0.02)})

play({
	var sines = 40, speed = 20;
	Mix.fill(sines,
		{arg x;
			Pan2.ar(
				SinOsc.ar(x + 1 * 100,
					mul: max(0,
						LFNoise1.kr(speed) +
						Line.kr(-1, 1, 30)
					)
), rand2(1.0))}) / sines})

rand(100.0)
exprand(1.0, 100.0)

thisThread.randSeed = 66; {rand(10.0)} ! 10;

dup(2.0, 20)
round([3.141, 5.9265, 358.98], 0.01)

round(dup({exprand(1, 10)}, 100), 0.1)


[10, 1, 4].sort // sort

100.rand // pick a random number between 0 and 100
{100.rand}.dup(6);

1234.2.rand.round(1).post // receiver notation

[0, 1, 3].reverse
12 - [0, 1, 3].reverse

[60, 62, 64, 65].midicps.round(0.1)
[1, 3, 4, 5].choose

// braces define functions
exprand(1, 1000.0)
{exprand(1, 1000.0)}


dup(rand(1000.0), 5)
dup({rand(1000.0)}, 5)

{LFNoise0.ar(10000)}.scope


{10000.rand}.dup(1000).plot

{Blip.ar(25, LFNoise0.kr(5, 12, 14), 0.3)}.play // single channel
{Blip.ar(25, LFNoise0.kr([5, 10], 12, 14), 0.3)}.play // stereo
{Blip.ar(25, LFNoise0.kr([5, 10, 2, 25], 12, 14), 0.3)}.play // quad


{PMOsc.ar(440, 550, 7)}.play

{PMOsc.ar(440, MouseX.kr(1, 550), MouseX.kr(1, 15))}.play

{SinOsc.ar(mul: Line.kr(start: 0.0, end: 1.0))}.scope

{SinOsc.ar(
	freq: [Line.kr(220.0, 880.0, 0.5, 1.0), Line.kr(220.0, 440.0, 0.5, 1.0)],
	phase: Line.kr(-0.5, 0.5, 1.0),
	mul: 1.0
)}.scope

(
{
	Blip.ar(
		// frequency or VCO
		TRand.kr(
			100, 1000,
			Impulse.kr([Line.kr(1, 20, 60), Line.kr(1, 20, 60)])
		),
		// Number of harmonics or VCF
		TRand.kr(
			1, 10,
			Impulse.kr(Line.kr(1, 20, 60))
		),
		// Amplitude or VCA
		Linen.kr(
			Impulse.kr(Line.kr(1, 20, 60)),
			0,
			0.5,
			1 / Line.kr(1, 20, 60)
		)
	)
}.scope
)

{Blip.ar(freq: [SinOsc.kr(110, 2.0, 1.0), 220.0], numharm: 3.0, mul: 1.0, add: 0.0)}.scope

{Impulse.kr(10, 1.0, 1.0)}.scope
{Impulse.kr(Line.kr(1, 20, 1))}.scope


{Saw.kr(1)}.scope

(
{
	r = MouseX.kr(1/3, 10);
	SinOsc.ar(mul: Linen.kr(Impulse.kr(r), 0, 1, 1/(r * r)))
}.play
)

(
p = {
	//r = Line.kr(1, 20, 60); // rate
	r = LFTri.kr(1) * 3 + 6;
	t = Impulse.kr(r); // trigger
	e = Linen.kr(t, 0, 0.5, 1/r); // envelope
	f = TRand.kr(1, 10, t); // triggered random

	Blip.ar(f * 100, f, e)

}.play
)

p.free

(
{
	r = Impulse.kr(10);
	c = TRand.kr(100, 5000, r);
	m = TRand.kr(100, 5000, r);

	PMOsc.ar(c, m, 12) * 3
}.play
)

(
{
	var rate = 4, carrier, modRatio;
	carrier = LFNoise0.kr(rate) * 500 + 700;
	modRatio = MouseX.kr(1, 2.0);

	PMOsc.ar(carrier, carrier * modRatio, 12) * 0.3
}.play
)


(
SynthDef("first_synth", {
	var out, freq = 440;
	out = SinOsc.ar(freq);
	Out.ar(0, out)
}).add
)

Synth("first_synth")

SynthDef("different_tones", {
	arg freq = 440;
	var out;
	out = SinOsc.ar(freq) * 0.3;
	Out.ar(0, out)
}).play

Synth("different_tones", ["freq", 550]) // "freq" is different_tone's argument.


var testSynth1;

testSynth1 = Synth("different_tones", ["freq", 660]);

testSynth1.set("freq", [770]);

(
SynthDef("PMCrotale", {
	arg midi = 60, tone = 3, art = 1, amp = 0.8, pan = 0;
	var env, out, mod, freq;

	freq = midi.midicps;
	env = Env.perc(0, art);
	mod = 5 + (1 / IRand(2, 6));

	out = PMOsc.ar(freq, mod * freq,
		pmindex: EnvGen.kr(env, timeScale: art, levelScale: tone),
		mul: EnvGen.kr(env, timeScale: art, levelScale: 0.3)
	);

	out = out * EnvGen.kr(env, timeScale: 1.3 * art,
		levelScale: Rand(0.1, 0.5), doneAction: 2
	);

	Out.ar(0, out);
}).add;
)

Synth("PMCrotale", ["midi", rrand(48, 72).round(1), "tone", rrand(1, 6)])










