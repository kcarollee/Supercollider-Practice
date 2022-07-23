Server.default = s = Server.internal;
s.boot;

(
{

}.scope
)

FreqScope.new; // creates a frequency analyzer

// SUBTRACTIVE SYNTHESIS

// pure white noise source
{WhiteNoise.ar(0.1)}.scope

// using the low pass filter to tail off energy above its cutoff freq (1000Hz in this case)
{LPF.ar(WhiteNoise.ar(0.1), 1000)}.scope

// what if we want a varying filter cutoff?
 // we use a line generator UGen
(
{
	var noiseSource, line, filter;
	noiseSource = LFNoise0.ar(400);
	line = Line.kr(10000, 1000, 10);
	filter = Resonz.ar(noiseSource, line, 0.1);

}.scope
)


// ADDITIVE SYNTHESIS
{SinOsc.ar}.scope
{
var sin1, sin2;
	sin1 = SinOsc.ar(400, 0, 0.1);
	sin2 = SinOsc.ar(660, 0, 0.1);
	sin1 + sin2;
}.scope

// PANNING UGen
// panposition: -1: hard left, 1: hard right
{
	Pan2.ar(WhiteNoise.ar(0.1), MouseX.kr(-1, 1))
}.scope

// MULTICHANNEL SOUND: Use an array. Three channels in this case
{
	SinOsc.ar([400, 660, 870], 0, 0.1)
}.scope

// taking multiple channels and turning them into a mono or stereo signal: use a Mix UGen
{
	Pan2.ar(
		Mix(
			SinOsc.ar(
				[400, 660], 0, 0.1
			)
		), 0.0
	)

}.scope

{Mix(SinOsc.ar(500 * [0.5, 1, 1.19, 1.56, 2, 2.51, 2.66, 3.01, 1.0], 0, 0.1))}.scope

{Mix(SinOsc.ar(500*[0.5,1,1.19,1.56,2,2.51,2.66,3.01,4.1],0,0.1*[0.25,1,0.8,0.5,0.9,0.4,0.3,0.6,0.1]))}.scope

(1..10) // an array containing integers 1 through 10



(

var n = 10;



{Mix(SinOsc.ar(250*(1..n),0,1/n))}.scope;



)

(
{
	// kr: control rate. calculate a value for each block of samples (saves computing power and is fine for signal controls)
	// ar: audio rate. calculate a value for each sample in a block
	var noise = WhiteNoise.kr(0.1);
	var ampOsc = SinOsc.ar(0.5, 1.5pi, 0.5, noise);

	SinOsc.ar(440, 0, ampOsc);
}.play
)

























