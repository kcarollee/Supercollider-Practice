// this is how i comment, okay
// shift + enter to play, ctrl + . to stop
// plugging a sine oscillator into a panner:
//{Pan2.ar(SinOsc.ar(440, 0, 0.1), 0.0)}.play

(
{
	SinOsc.ar(440, 0, 0.1)
	+
	Pulse.ar(443, 0.6, 0.05)
}.play
)

// (): for grouping expressions together
// {}: for a function
// []: for an array


if (4 == 4, {"HEY".postln});


2.postln;

Post << [2, 3, 4, 5] << nl;