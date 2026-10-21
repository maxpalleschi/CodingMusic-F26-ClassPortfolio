// sound chain
SawOsc s1 => dac;
SinOsc s2 => dac;
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
[1,1,1,1,0,0,0,0] @=> int hihat_ptrn_2[];
[0,0,1,0,0,0,1,0] @=> int snare_ptrn_1[];
[0,0,0,0,1,0,0,0] @=> int snare_ptrn_2[];
[0,0,1,0,1,0,1,0] @=> int snare_ptrn_3[];
[0,0,1,1,1,1,1,1] @=> int snare_ptrn_4[];

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
            1.5 => kick.gain; 
        }    
         if (hihatArray[i] == 1)
        {
            0 => hihat.pos;
            .2 => hihat.gain;
        }
        if(snareArray[i] == 1)
        {
            0 => snare.pos;
            1.5 => snare.gain; 
        }
        beattime::second => now;
    }
}

// MAIN PROGRAM
// infinite loop
while( true )
{
    0.1 => s1.gain;
    55 => s1.freq;
    
    5 => s2.gain;
    55 => s2.freq;
    
    2 :: second => now;
    TriOsc chord[3];
    chord[0] => dac;
    chord[1] => dac;
    chord[2] => dac;
    Std.mtof(45) => chord[0].freq; // Note 1
    Std.mtof(48) => chord[1].freq; // Note 2
    Std.mtof(52) => chord[2].freq; // Note 3
    
    0.1 => s1.gain;
    55 => s1.freq;
    
    5 => s2.gain;
    110 => s2.freq;    
    0::second => now;
    section(kick_ptrn_1, hihat_ptrn_1, snare_ptrn_1, .2);
    Std.mtof(45) => chord[0].freq; // Note 1
    Std.mtof(50) => chord[1].freq; // Note 2
    Std.mtof(54) => chord[2].freq; // Note 3
    
    0.2 => s1.gain;
    36.7 => s1.freq;
    
    5 => s2.gain;
    73.4 => s2.freq;    
    0::second => now;
    section(kick_ptrn_3, hihat_ptrn_1, snare_ptrn_1, .2); 
    Std.mtof(43) => chord[0].freq; // Note 1
    Std.mtof(47) => chord[1].freq; // Note 2
    Std.mtof(50) => chord[2].freq; // Note 3
    
    0.1 => s1.gain;
    49 => s1.freq;
    
    5 => s2.gain;
    98 => s2.freq;    
    
    0::second => now;
section(kick_ptrn_1, hihat_ptrn_1, snare_ptrn_1, .2);
    Std.mtof(43) => chord[0].freq; // Note 1
    Std.mtof(48) => chord[1].freq; // Note 2
    Std.mtof(52) => chord[2].freq; // Note 3
    0.1 => s1.gain;
    32.7 => s1.freq;
    
    5 => s2.gain;
    65.4 => s2.freq;    
    
    0 :: second => now;
section(kick_ptrn_4, hihat_ptrn_2, snare_ptrn_3, .2);
    Std.mtof(45) => chord[0].freq; // Note 1
    Std.mtof(48) => chord[1].freq; // Note 2
    Std.mtof(52) => chord[2].freq; // Note 3
    
    0.1 => s1.gain;
    55 => s1.freq;
    
    5 => s2.gain;
    110 => s2.freq;    
    
    crash => hihat2.read;
    0::second => now;
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
    Std.mtof(45) => chord[0].freq; // Note 1
    Std.mtof(50) => chord[1].freq; // Note 2
    Std.mtof(54) => chord[2].freq; // Note 3
    
    0.2 => s1.gain;
    36.7 => s1.freq;
    
    5 => s2.gain;
    73.4 => s2.freq;    
    0::second => now;
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1); 
    Std.mtof(43) => chord[0].freq; // Note 1
    Std.mtof(47) => chord[1].freq; // Note 2
    Std.mtof(50) => chord[2].freq; // Note 3
    
    0.1 => s1.gain;
    49 => s1.freq;
    
    5 => s2.gain;
    98 => s2.freq;    
    
    0::second => now;
section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
    Std.mtof(43) => chord[0].freq; // Note 1
    Std.mtof(48) => chord[1].freq; // Note 2
    Std.mtof(52) => chord[2].freq; // Note 3
    0.1 => s1.gain;
    32.7 => s1.freq;
    
    5 => s2.gain;
    65.4 => s2.freq;    
    
    0 :: second => now;
section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
section(kick_ptrn_2, hihat_ptrn_2, snare_ptrn_4, .1);
Std.mtof(45) => chord[0].freq; // Note 1
    Std.mtof(48) => chord[1].freq; // Note 2
    Std.mtof(52) => chord[2].freq; // Note 3
    
    0.1 => s1.gain;
    55 => s1.freq;
    
    5 => s2.gain;
    110 => s2.freq;    
    
    crash => hihat2.read;
    0::second => now;
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
    Std.mtof(45) => chord[0].freq; // Note 1
    Std.mtof(50) => chord[1].freq; // Note 2
    Std.mtof(54) => chord[2].freq; // Note 3
    
    0.2 => s1.gain;
    36.7 => s1.freq;
    
    5 => s2.gain;
    73.4 => s2.freq;    
    0::second => now;
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
    section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1); 
    Std.mtof(43) => chord[0].freq; // Note 1
    Std.mtof(47) => chord[1].freq; // Note 2
    Std.mtof(50) => chord[2].freq; // Note 3
    
    0.1 => s1.gain;
    49 => s1.freq;
    
    5 => s2.gain;
    98 => s2.freq;    
    
    0::second => now;
section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
    Std.mtof(43) => chord[0].freq; // Note 1
    Std.mtof(48) => chord[1].freq; // Note 2
    Std.mtof(52) => chord[2].freq; // Note 3
    0.1 => s1.gain;
    32.7 => s1.freq;
    
    5 => s2.gain;
    65.4 => s2.freq;    
    
    0 :: second => now;
section(kick_ptrn_2, hihat_ptrn_1, snare_ptrn_2, .1);
section(kick_ptrn_2, hihat_ptrn_2, snare_ptrn_4, .1);
}
