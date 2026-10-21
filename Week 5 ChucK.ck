// sound chain
TriOsc t1 => dac;
SinOsc s1 => dac;
SawOsc s2 => dac;
SndBuf hihat => dac;
SndBuf kick => dac;
SndBuf snare => dac;
SndBuf hihat2 => dac;

// open sound files
me.dir() + "/audio/kick_03.wav" => kick.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_04.wav" => string crash;
// take away playback at initialization
kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;
// global variables
[1,0,0,0,1,0,0,0] @=> int kick_ptrn_1[];
[1,0,0,0,0,0,0,0] @=> int kick_ptrn_2[];
[1,0,0,0,1,1,0,0] @=> int kick_ptrn_3[];
[1,0,0,1,0,1,0,1] @=> int kick_ptrn_4[];
[1,1,1,1,1,1,1,1] @=> int hihat_ptrn_1[];
[1,0,1,1,1,1,1,1] @=> int hihat_ptrn_2[];
[1,1,1,1,0,0,0,0] @=> int hihat_ptrn_3[];
[0,0,1,0,0,0,1,0] @=> int snare_ptrn_1[];
[0,0,0,0,1,0,0,0] @=> int snare_ptrn_2[];
[0,0,1,0,1,0,1,0] @=> int snare_ptrn_3[];

//function
fun void section( int kickArray[], int hihatArray[], int snareArray[], float beattime)
{
    //sequencer: for bass drum and snare drum beats
    // we can use kickArray.cap() just because all the arrays are the same size
    for ( 0 => int i; i < kickArray.cap(); i++)
    {
        // if 1 in array then play kick
        if (kickArray[i] == 1)
        {
            0 => kick.pos; 
        }
        if(hihatArray[i] == 1)
        {
            0 => hihat.pos;
           .2 => hihat.gain;
        }
        if(snareArray[i] == 1)
        {
            0 => snare.pos;
        }
        beattime::second => now;
    }
}

// MAIN PROGRAM
// infinite loop
while( true )
{
0.09 => t1.gain;
100 => t1.freq;

0.08 => s1.gain;
100 => s1.freq;

0.06 => s2.gain;
50 => s2.freq;

2::second => now;
    // Procedural: ABA form
    section(kick_ptrn_1, hihat_ptrn_1, snare_ptrn_1, .2);
    section(kick_ptrn_3, hihat_ptrn_1, snare_ptrn_1, .2);
0.09 => t1.gain;
400 => t1.freq;

0.07 => s1.gain;
200 => s1.freq;

0.04 => s2.gain;
100 => s2.freq;

0::second => now;
    section(kick_ptrn_1, hihat_ptrn_1, snare_ptrn_1, .2);
0.09 => t1.gain;
200 => t1.freq;

0.07 => s1.gain;
100 => s1.freq;

0.04 => s2.gain;
100 => s2.freq;

0::second => now;
    section(kick_ptrn_4, hihat_ptrn_3, snare_ptrn_3, .2);
0.1 => t1.gain;
400 => t1.freq;

0.1 => s1.gain;
200 => s1.freq;

0.1 => s2.gain;
100 => s2.freq;

crash => hihat2.read;

0::second => now;
    section(kick_ptrn_2, hihat_ptrn_2, snare_ptrn_2, .1);
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
0.1 => t1.gain;
200 => t1.freq;

0.1 => s1.gain;
100 => s1.freq;

0.1 => s2.gain;
400 => s2.freq;

0::second => now;
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
0.1 => t1.gain;
400 => t1.freq;

0.1 => s1.gain;
300 => s1.freq;

0.1 => s2.gain;
100 => s2.freq;

0::second => now;
     section(kick_ptrn_4, hihat_ptrn_3, snare_ptrn_3, .4);
}