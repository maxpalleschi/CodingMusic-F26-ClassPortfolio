TriOsc t1 => dac;
SinOsc s1 => dac;
SawOsc s2 => dac;

0.4 => t1.gain;
300 => t1.freq;

0.3 => s1.gain;
100 => s1.freq;

0.1 => s2.gain;
50 => s2.freq;

.5::second => now;

0.4 => t1.gain;
500 => t1.freq;

0.3 => s1.gain;
900 => s1.freq;

0.1 => s2.gain;
100 => s2.freq;

1::second => now;

0.4 => t1.gain;
100 => t1.freq;

0.3 => s1.gain;
600 => s1.freq;

0.1 => s2.gain;
100 => s2.freq;

.5::second => now;

0.4 => t1.gain;
400 => t1.freq;

0.3 => s1.gain;
500 => s1.freq;

0.1 => s2.gain;
50 => s2.freq;

1::second => now;

TriOsc t2 => dac;
SinOsc s3 => dac;

0.4 => t1.gain;
500 => t1.freq;

0.3 => t2.gain;
900 => t2.freq;

0.3 => s1.gain;
600 => s1.freq;

0.1 => s2.gain;
100 => s2.freq;

0.2 => s3.gain;
900 => s3.freq;

.5::second => now;

SqrOsc s4 => dac;

0.4 => t1.gain;
400 => t1.freq;

0.4 => t2.gain;
1000 => t2.freq;

0.3 => s1.gain;
500 => s1.freq;

0.1 => s2.gain;
50 => s2.freq;

0.2 => s3.gain;
2000 => s3.freq;

0.09 => s4.gain;
1600 => s4.freq;

1::second => now;




