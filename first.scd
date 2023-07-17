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












