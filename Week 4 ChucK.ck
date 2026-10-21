// sound chain
// The 2 is for the stereo file

SndBuf2 yeah => dac;
SndBuf2 yo => dac;

//read the file into a string

me.dir() + "/audio/stereo_fx_01.wav" => string filename;
// open up soundfile
filename => yeah.read;
5::second => now;

//read the file into a string

me.dir() + "/audio/stereo_fx_01.wav" => string funk;
// open up soundfile
funk => yo.read;
0::second => now;

// sequencer

// sound chain

Gain master => dac;
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;

// all the rest of the gains are relative to .6
.6 => master.gain;

//load soundfiles into sndbuf
me.dir() + "/audio/kick_03.wav" => kick.read;
me.dir() + "/audio/hihat_01.wav"=> hihat.read;
me.dir() + "/audio/snare_01.wav" => snare.read;

// set all playheads to end so no sound is made

kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;

//initialize counter variable
0 => int counter;

//infinite loop

while (true)
{
    // beat goes from 0 to 15 (16 positions)
    counter % 16 => int beat;
    // kick drum
    if (( beat == 0 ) || (beat == 2) || (beat == 6) || (beat == 8) || (beat == 13) || (beat == 15))
    {
        0 => kick.pos;
    }
    // snare drum
    if ((beat == 4) || (beat == 7) || (beat == 12) || (beat == 14) || (beat == 16))
    {
        0 => snare.pos;
    }
    // hihat
     0 => hihat.pos;
    .2 => hihat.gain;
    
       <<< "counter: ", counter, "Beat:", beat >>>;
    counter++; // counter + 1 => counter
    100::ms => now;
}



