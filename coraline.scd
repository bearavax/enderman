// Start the SuperCollider server
s.boot;

// Define a simple synth template
(
SynthDef(\simpleSynth, {
    arg freq = 432, amp = 0.6, pan = 0;
    var env, osc;
    env = EnvGen.kr(Env.perc, doneAction: 2);
    osc = SinOsc.ar(freq) * env * amp;
    Out.ar(0, Pan2.ar(osc, pan));
}).add;
)

// Define a pattern template
(
Pdef(\simplePattern, Pbind(
    \instrument, \simpleSynth,
    \freq, Pseq([432, 660, 880], inf),
    \dur, 0.5,
    \amp, 0.5
));
)

// Control pad to toggle components
(
var controlPad = Dictionary[
    \synth -> 0,
    \pattern -> 0
];

~toggleComponent = { |component|
    controlPad[component] = 1 - controlPad[component];
    if (controlPad[component] == 1) {
        case
        { component == \synth } { Synth(\simpleSynth) }
        { component == \pattern } { Pdef(\simplePattern).play }
    } {
        case
        { component == \synth } { s.freeAll }
        { component == \pattern } { Pdef(\simplePattern).stop }
    };
};

// Example usage: Toggle synth and pattern
~toggleComponent.(\synth); // Type 0 or 1 to toggle
~toggleComponent.(\pattern); // Type 0 or 1 to toggle
)