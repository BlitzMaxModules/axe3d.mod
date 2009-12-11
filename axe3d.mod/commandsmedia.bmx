
Extern

Rem
bbdoc: <p> If successful returns the handle of a sound object to be used with the <a href=#bbplaysound>bbPlaySound</a> command.
about:
<table class="arg">
<tr><td class=argname>filename$</td><td class=argvalue>the name of an existing sound file</td></tr>
</table>
</p>
<p>
The following file formats are supported:
</p>
<table class="data">
<tr><th class=data>Format</th><th class=data>Compression</th><th class=data>Features</th></tr>
<tr><td class=data>wav</td><td class=data>none</td><td class=data>fast loading</td></tr>
<tr><td class=data>mp3</td><td class=data>yes</td><td class=data>license required</td></tr>
<tr><td class=data>ogg</td><td class=data>yes</td><td class=data>license free</td></tr>
</table>
<p>
The reader should be aware that an additional license is
required to distribute software that utilizes playback of
mp3 files.
</p>
See Also: <a href=#bbplaysound>bbPlaySound</a> <a href=#bbloopsound>bbLoopSound</a> <a href=#bbfreesound>bbFreeSound</a>
EndRem
Function LoadSound(filename$z)="bbLoadSound"

Rem
bbdoc: <p> Returns the channel allocated for playback.
about:
<table class="arg">
<tr><td class=argname>sound</td><td class=argvalue>valid sound handle</td></tr>
</table>
</p>
<p>
<a href=#bbplaysound>bbPlaySound</a> plays a sound previously loaded using the <a href=#bbloadsound>bbLoadSound</a> command.
</p>
<p>
The channel handle returned can subsequently be used to control
the playback of the sound sample specified.
</p>
<p>
The initial volume and pitch of the sound may be modified before
playback using the <a href=#bbsoundvolume>bbSoundVolume</a> and <a href=#bbsoundpitch>bbSoundPitch</a> commands.
</p>
See Also: <a href=#bbchannelplaying>bbChannelPlaying</a> <a href=#bbstopchannel>bbStopChannel</a> <a href=#bbpausechannel>bbPauseChannel</a> <a href=#bbresumechannel>bbResumeChannel</a> <a href=#bbchannelpitch>bbChannelPitch</a>
EndRem
Function PlaySound(sound)="bbPlaySound"

Rem
bbdoc: <p> The <a href=#bbfreesound>bbFreeSound</a> command releases the resources used by a sound created by a previous call to <a href=#bbloadsound>bbLoadSound</a>.
about:
<table class="arg">
<tr><td class=argname>sound</td><td class=argvalue>valid sound handle</td></tr>
</table>
</p>
<p>
Usually a program will load all its sound files at startup
and let Blitz3D automatically free the resources when the
program ends.
</p>
<p>
The <a href=#bbfreesound>bbFreeSound</a> command however provides a way of managing
system resources when large sound files are no longer needed
by a running program.
</p>
See Also: <a href=#bbloadsound>bbLoadSound</a>
EndRem
Function FreeSound(sound)="bbFreeSound"

Rem
bbdoc: <p> Enables a sound objects looping property
about:
<table class="arg">
<tr><td class=argname>sound</td><td class=argvalue>valid sound handle</td></tr>
</table>
Subsequent playback
of the sound object using <a href=#bbplaysound>bbPlaySound</a> will result in continuous
looped playback of the sound.
</p>
See Also: <a href=#bbloadsound>bbLoadSound</a> <a href=#bbplaysound>bbPlaySound</a>
EndRem
Function LoopSound(sound)="bbLoopSound"

Rem
bbdoc: <p> Modifies the pitch of an existing sound object by changing its playback rate.
about:
<table class="arg">
<tr><td class=argname>sound</td><td class=argvalue>valid sound handle</td></tr>
<tr><td class=argname>samplerate</td><td class=argvalue>playback rate in samples per second</td></tr>
</table>
</p>
<p>
Sounds are commonly recorded at rates such as 22050 and 44100
samples per second and their playback rate defaults to the
recorded rate.
</p>
<p>
Changing the sounds playback rate with the <a href=#bbsoundpitch>bbSoundPitch</a> command
will modify the pitch at which it is next played with the
<a href=#bbplaysound>bbPlaySound</a> command.
</p>
<p>
For more dynamic control see the <a href=#bbchannelpitch>bbChannelPitch</a> command that
allows modifying the pitch of a channel during playback of
a sound.
</p>
See Also: <a href=#bbsoundvolume>bbSoundVolume</a> <a href=#bbplaysound>bbPlaySound</a>
EndRem
Function SoundPitch(sound,samplerate)="bbSoundPitch"

Rem
bbdoc: <p> Modifies the default volume of an existing sound object by changing its amplitude setting.
about:
<table class="arg">
<tr><td class=argname>sound</td><td class=argvalue>valid sound handle</td></tr>
<tr><td class=argname>volume#</td><td class=argvalue>amplitude setting</td></tr>
</table>
</p>
<p>
The default volume of a sound returned by <a href=#bbloadsound>bbLoadSound</a> is 1.0.
</p>
<p>
Use values between 0.0 and 1.0 to cause <a href=#bbplaysound>bbPlaySound</a> to begin
playback of the specified sound at a quieter volume and values
greater than 1.0 for their volume to be amplified.
</p>
<p>
Use the <a href=#bbchannelvolume>bbChannelVolume</a> command to modify volumes during sound
playback.
</p>
EndRem
Function SoundVolume(sound,volume#)="bbSoundVolume"

Rem
bbdoc: <p> Modifies the default balance of an existing sound object by changing its pan setting.
about:
<table class="arg">
<tr><td class=argname>sound</td><td class=argvalue>valid sound handle</td></tr>
<tr><td class=argname>pan#</td><td class=argvalue>stereo position</td></tr>
</table>
</p>
<p>
The <b>pan</b> value can be any float between -1.0 and 1.0 and
modifies the stereo position used the next time the sound
is played using the <a href=#bbplaysound>bbPlaySound</a> command.
</p>
<table class="data">
<tr><th class=data>Pan Value</th><th class=data>Effect</th></tr>
<tr><td class=data>-1</td><td class=data>sound played through left speaker</td></tr>
<tr><td class=data>0</td><td class=data>sound played through both speakers</td></tr>
<tr><td class=data>1</td><td class=data>sound played through right speaker</td></tr>
</table>
<p>
Use the <a href=#bbchannelpan>bbChannelPan</a> command to pan the sound during playback.
</p>
See Also: <a href=#bbplaysound>bbPlaySound</a> <a href=#bbchannelpan>bbChannelPan</a>
EndRem
Function SoundPan(sound,pan#)="bbSoundPan"

Rem
bbdoc: <p> Returns a valid channel handle or 0 if unsuccessful.
about:
<table class="arg">
<tr><td class=argname>filename$</td><td class=argvalue>name of music file</td></tr>
</table>
</p>
<p>
<a href=#bbplaymusic>bbPlayMusic</a> opens the music file specified and begins
playback.
</p>
<p>
Unlike a combination of <a href=#bbloadsound>bbLoadSound</a> and <a href=#bbplaysound>bbPlaySound</a>, <a href=#bbplaymusic>bbPlayMusic</a>
allocates only a small buffer of resources and the music
file is streamed directly from the file.
</p>
<table class="data">
<tr><th class=data>Format</th><th class=data>FileSize</th><th class=data>Features</th></tr>
<tr><td class=data>raw;wav</td><td class=data>large</td><td class=data>industry standard uncompressed</td></tr>
<tr><td class=data>mod;s3m;xm;it</td><td class=data>medium</td><td class=data>8 channel module files</td></tr>
<tr><td class=data>mid</td><td class=data>small</td><td class=data>midi files depend on the system's music synthesizer</td></tr>
<tr><td class=data>mp3</td><td class=data>medium</td><td class=data>requires additional license</td></tr>
<tr><td class=data>ogg;wma;asf</td><td class=data>medium</td><td class=data>compressed and freely distributable</td></tr>
</table>
<p>
The channel handle returned can be used to change various
playback settings including volume, pitch as well as
pause and resume playback itself.
</p>
See Also: <a href=#bbstopchannel>bbStopChannel</a> <a href=#bbpausechannel>bbPauseChannel</a> <a href=#bbresumechannel>bbResumeChannel</a> <a href=#bbplaysound>bbPlaySound</a>
EndRem
Function PlayMusic(filename$z)="bbPlayMusic"

Rem
bbdoc: <p> Plays a CD track and returns a sound channel.
about:
<table class="arg">
<tr><td class=argname>track</td><td class=argvalue>track number to play</td></tr>
<tr><td class=argname>mode</td><td class=argvalue>playback mode</td></tr>
</table>
</p>
<p>
The behavior of the <a href=#bbplaycdtrack>bbPlayCDTrack</a> may be modified
with the optional <b>mode</b> parameter:
</p>
<table class="data">
<tr><th class=data>Mode</th><th class=data>Value</th><th class=data>Description</th></tr>
<tr><td class=data>PLAYCD_SINGLE</td><td class=data>1</td><td class=data>play track once - default</td></tr>
<tr><td class=data>PLAYCD_LOOP</td><td class=data>2</td><td class=data>loop track</td></tr>
<tr><td class=data>PLAYCD_ALL</td><td class=data>3</td><td class=data>play track once then continue to next track</td></tr>
</table>
<p>
The <a href=#bbplaycdtrack>bbPlayCDTrack</a> requires the user has a CD playback
facility on their system and that a CD containing
music tracks is currently inserted.
</p>
See Also: <a href=#bbstopchannel>bbStopChannel</a> <a href=#bbpausechannel>bbPauseChannel</a> <a href=#bbresumechannel>bbResumeChannel</a>
EndRem
Function PlayCDTrack(track,mode=1)="bbPlayCDTrack"

Rem
bbdoc: <p> Stop any audio being output on a currently playing channel.
about:
<table class="arg">
<tr><td class=argname>channel</td><td class=argvalue>valid playback channel</td></tr>
</table>
</p>
<p>
The <a href=#bbplaysound>bbPlaySound</a>, <a href=#bbplaymusic>bbPlayMusic</a> and <a href=#bbplaycdtrack>bbPlayCDTrack</a> functions all return
a channel handle that can be used with <a href=#bbstopchannel>bbStopChannel</a> to cancel the
resulting sound playback.
</p>
See Also: <a href=#bbplaysound>bbPlaySound</a> <a href=#bbplaymusic>bbPlayMusic</a> <a href=#bbplaycdtrack>bbPlayCDTrack</a> <a href=#bbpausechannel>bbPauseChannel</a>
EndRem
Function StopChannel(channel)="bbStopChannel"

Rem
bbdoc: <p> Pauses playback in the specified audio channel.
about:
<table class="arg">
<tr><td class=argname>channel</td><td class=argvalue>valid playback channel</td></tr>
</table>
</p>
<p>
Any sound playing from the result of a <a href=#bbplaysound>bbPlaySound</a>, <a href=#bbplaymusic>bbPlayMusic</a>
or <a href=#bbplaycdtrack>bbPlayCDTrack</a> may be paused with the <a href=#bbpausechannel>bbPauseChannel</a> command.
</p>
<p>
Use the <a href=#bbresumechannel>bbResumeChannel</a> command to continue playback after
pausing an audio channel with <a href=#bbpausechannel>bbPauseChannel</a>.
</p>
See Also: <a href=#bbresumechannel>bbResumeChannel</a> <a href=#bbstopchannel>bbStopChannel</a> <a href=#bbplaysound>bbPlaySound</a>
EndRem
Function PauseChannel(channel)="bbPauseChannel"

Rem
bbdoc: <p> Continue playback of a previously paused audio channel.
about:
<table class="arg">
<tr><td class=argname>channel</td><td class=argvalue>valid playback channel</td></tr>
</table>
</p>
EndRem
Function ResumeChannel(channel)="bbResumeChannel"

Rem
bbdoc: <p> Modifies the pitch of an active audio channel by changing its playback rate.
about:
<table class="arg">
<tr><td class=argname>channel</td><td class=argvalue>valid playback channel</td></tr>
<tr><td class=argname>samplerate</td><td class=argvalue>playback rate in samples per second</td></tr>
</table>
</p>
<p>
Sound sources are commonly recorded at rates such as 22050
and 44100 samples per second and their playback rate defaults
to the recorded rate.
</p>
<p>
Changing a channel's playback rate with the <a href=#bbchannelpitch>bbChannelPitch</a> command
will modify the pitch of the recorded audio currently used as
a playback source.
</p>
See Also: <a href=#bbloadsound>bbLoadSound</a> <a href=#bbsoundpitch>bbSoundPitch</a>
EndRem
Function ChannelPitch(channel,samplerate)="bbChannelPitch"

Rem
bbdoc: <p> Modifies the amplitude of the specified audio channel.
about:
<table class="arg">
<tr><td class=argname>channel</td><td class=argvalue>valid playback channel</td></tr>
<tr><td class=argname>volume#</td><td class=argvalue>volume level</td></tr>
</table>
</p>
<p>
A floating point of less than 1.0 will reduce volume
while a value of larger than 1.0 will increase the volume
of the specified channel.
</p>
<p>
Increasing a channel volume above 1.0 should not be
attempted if distortion and clamping of the audio output
is to be avoided.
</p>
<p>
To make a channel silent use <a href=#bbstopchannel>bbStopChannel</a> or <a href=#bbpausechannel>bbPauseChannel</a>
as an alternative to a volume setting of 0.0.
</p>
See Also: <a href=#bbsoundvolume>bbSoundVolume</a>
EndRem
Function ChannelVolume(channel,volume#)="bbChannelVolume"

Rem
bbdoc: <p> Position the output of an audio channel in left right stereo space.
about:
<table class="arg">
<tr><td class=argname>channel</td><td class=argvalue>valid playback channel</td></tr>
<tr><td class=argname>pan#</td><td class=argvalue>left right stereo position</td></tr>
</table>
</p>
<table class="data">
<tr><th class=data>Value</th><th class=data>Effective pan</th></tr>
<tr><td class=data>0.0</td><td class=data>Left</td></tr>
<tr><td class=data>0.25</td><td class=data>Center Left</td></tr>
<tr><td class=data>0.5</td><td class=data>Center</td></tr>
<tr><td class=data>0.75</td><td class=data>Center Right</td></tr>
<tr><td class=data>1.0</td><td class=data>Right</td></tr>
</table>
<p>
Panning the position of sound effects in a video game is a
useful technique for adding to the immersive experience.
</p>
EndRem
Function ChannelPan(channel,pan#)="bbChannelPan"

Rem
bbdoc: <p> Returns True mode.
about:
<table class="arg">
<tr><td class=argname>channel</td><td class=argvalue>valid playback channel</td></tr>
</table>
</p>
See Also: <a href=#bbplaysound>bbPlaySound</a> <a href=#bbpausechannel>bbPauseChannel</a> <a href=#bbstopchannel>bbStopChannel</a>
EndRem
Function ChannelPlaying(channel)="bbChannelPlaying"

Rem
bbdoc: <p> Locates and starts a movie file playing.
about:
<table class="arg">
<tr><td class=argname>moviefile$</td><td class=argvalue>filename of a movie file</td></tr>
</table>
</p>
<p>
Returns a valid movie handle if the function is successful
or 0 if the command fails for any reason.
</p>
<p>
Use the <a href=#bbdrawmovie>bbDrawMovie</a> command to see the movie playing.
</p>
<p>
Movie files will typically have the AVI, MPEG and MPG
file extensions.
</p>
<p>
Blitz3D applications may need to specify DirectX8
requirements or the installation of a particular
version of Window's media  player software if they
are to support movie files using codecs other than
MPEG1, CinePak, MotionJPEG and the like.
</p>
See Also: <a href=#bbdrawmovie>bbDrawMovie</a> <a href=#bbclosemovie>bbCloseMovie</a> <a href=#bbmovieplaying>bbMoviePlaying</a> <a href=#bbmoviewidth>bbMovieWidth</a> <a href=#bbmovieheight>bbMovieHeight</a>
EndRem
Function OpenMovie(moviefile$z)="bbOpenMovie"

Rem
bbdoc: <p> Stops and closes an open movie.
about:
<table class="arg">
<tr><td class=argname>movie</td><td class=argvalue>valid open movie file</td></tr>
</table>
</p>
See Also: <a href=#bbopenmovie>bbOpenMovie</a>
EndRem
Function CloseMovie(movie)="bbCloseMovie"

Rem
bbdoc: <p> Draws the current frame of the specified playing movie onto the current graphics buffer.
about:
<table class="arg">
<tr><td class=argname>movie</td><td class=argvalue>movie handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal position</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical position</td></tr>
<tr><td class=argname>width</td><td class=argvalue>width of movie in pixels</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height of movie in pixels</td></tr>
</table>
</p>
<p>
The movie must not overlap the edges of the current graphics
buffer or else nothing is drawn.
</p>
<p>
The Viewport and Origin are not taken into account.
</p>
<p>
See the <a href=#bbopenmovie>bbOpenMovie</a> command for more details regarding supported
movie files and how to open them before using the <a href=#bbdrawmovie>bbDrawMovie</a>
command.
</p>
See Also: <a href=#bbopenmovie>bbOpenMovie</a> <a href=#bbclosemovie>bbCloseMovie</a> <a href=#bbmovieplaying>bbMoviePlaying</a> <a href=#bbmoviewidth>bbMovieWidth</a> <a href=#bbmovieheight>bbMovieHeight</a>
EndRem
Function DrawMovie(movie,x,y,width,height=0)="bbDrawMovie"

Rem
bbdoc: <p> Returns the width of a movie.
about:
<table class="arg">
<tr><td class=argname>movie</td><td class=argvalue>movie handle</td></tr>
</table>
</p>
See Also: <a href=#bbopenmovie>bbOpenMovie</a> <a href=#bbdrawmovie>bbDrawMovie</a> <a href=#bbclosemovie>bbCloseMovie</a> <a href=#bbmovieplaying>bbMoviePlaying</a> <a href=#bbmovieheight>bbMovieHeight</a>
EndRem
Function MovieWidth(movie)="bbMovieWidth"

Rem
bbdoc: <p> Returns the height of a movie.
about:
<table class="arg">
<tr><td class=argname>movie</td><td class=argvalue>movie handle</td></tr>
</table>
</p>
See Also: <a href=#bbopenmovie>bbOpenMovie</a> <a href=#bbdrawmovie>bbDrawMovie</a> <a href=#bbclosemovie>bbCloseMovie</a> <a href=#bbmovieplaying>bbMoviePlaying</a> <a href=#bbmoviewidth>bbMovieWidth</a>
EndRem
Function MovieHeight(movie)="bbMovieHeight"

Rem
bbdoc: <p> Returns True if the specified movie is playing.
about:
<table class="arg">
<tr><td class=argname>movie</td><td class=argvalue>movie handle</td></tr>
</table>
</p>
See Also: <a href=#bbopenmovie>bbOpenMovie</a> <a href=#bbdrawmovie>bbDrawMovie</a> <a href=#bbclosemovie>bbCloseMovie</a> <a href=#bbmoviewidth>bbMovieWidth</a> <a href=#bbmovieheight>bbMovieHeight</a>
EndRem
Function MoviePlaying(movie)="bbMoviePlaying"


EndExtern
