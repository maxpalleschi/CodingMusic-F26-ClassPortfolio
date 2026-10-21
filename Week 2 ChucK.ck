// Author: Max Palleschi
// Date: 9/23/2026

// sound network
SinOsc s => dac;
SqrOsc sq => dac;
TriOsc t => dac;

// only play s 
0.5 => s.gain;
0 => sq.gain;
0 => t.gain;

for( 0 => int i; i < 500; i++)
{
    i => s.freq;
    0.005::second => now;
}

//only play sq and t at the same time
0.2 => t.gain;
0.03 => sq.gain;
0 => s.gain;

for( 0 => int i; i < 500; i++)
{
    i => sq.freq;
    i*2 => t.freq;
    0.005::second => now;
}

// play s, sq, and t at the same time
0.2 => s.gain;
0.08 => sq.gain;
0.2 => t.gain; 
for( 0 => int i; i < 500; i++)
{
    i => t.freq;
    i*4 => sq.freq;
    i*2 => s.freq;
    0.001::second => now;
}

// sound network
TriOsc t1 => dac;
SinOsc s1 => dac;
SawOsc s2 => dac;

// prints program name
<<< "hello Sine!" >>>;

0.4 => t1.gain;
300 => t1.freq;

0.3 => s1.gain;
100 => s1.freq;

0.1 => s2.gain;
50 => s2.freq;

.3::second => now;

0.4 => t1.gain;
500 => t1.freq;

0.3 => s1.gain;
900 => s1.freq;

0.1 => s2.gain;
100 => s2.freq;

.3::second => now;

now + 2::second => time later;

while( now < later)
{
    <<<"time left:" , (later-now)/second >>>;
    1::second => now;
}

<<< "It's TIME!!" >>>;

// sound network
SqrOsc s3 => dac;
SinOsc s4 => dac;
TriOsc t2 => dac;

0.09 => s3.gain;
0.5 => s4.gain;
1 => t2.gain;
for( 0 => int i; i < 800; i++)
{
    i*2 => s3.freq;
    i => s4.freq;
    i*.25 => t2.freq;
    0.0008::second => now;
}
2::second => now;
