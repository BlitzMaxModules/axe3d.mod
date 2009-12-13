Import "graphicsbuffer.bmx"

Rem
bbdoc: <p> The <a href=#bbtext>bbText</a> command prints the <b>string</b> specified at the pixel coordinate <b>x</b>,<b>y.</b> </p> <p> <a href=#bbtext>bbText</a> uses the current font which can be modified with the <a href=#bbsetfont>bbSetFont</a> command and the current color which can be modified with the <a href=#bbcolor>bbColor</a> command.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel position of top left enclosing rectangle</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel position of the top left enclosing rectangle</td></tr>
<tr><td class=argname>str$</td><td class=argvalue>string/text to print</td></tr>
<tr><td class=argname>centerX</td><td class=argvalue>True to center text horizontally</td></tr>
<tr><td class=argname>centerY</td><td class=argvalue>True to center text vertically</td></tr>
</table>
</p>
<p>
The optional centering parameters allow the specified pixel
position to be used as the center of the text printed rather
than representing the top left position of the region.
</p>
See Also: <a href=#bbsetfont>bbSetFont</a> <a href=#bbstringwidth>bbStringWidth</a> <a href=#bbstringheight>bbStringHeight</a>
EndRem
Function Text(x,y,str$,centerX=False,centerY=False)
End Function


Rem
bbdoc: <p> The <a href=#bbsetbuffer>bbSetBuffer</a> command is used to set the current graphics buffer.
about:
<table class="arg">
<tr><td class=argname>buffer</td><td class=argvalue>a valid graphics buffer</td></tr>
</table>
</p>
<p>
After calling <a href=#bbsetbuffer>bbSetBuffer</a>, All 2D rendering commands will write to the specified
graphics buffer. 3D rendering always writes to the back buffer.
</p>
<p>
<a href=#bbsetbuffer>bbSetBuffer</a> also resets the <a href=#bborigin>bbOrigin</a> to 0,0 and the <a href=#bbviewport>bbViewport</a> to the
dimensions of the entire selected buffer.
</p>
<p>
<b>buffer</b> should be a valid graphics buffer returned by <a href=#bbfrontbuffer>bbFrontBuffer</a>,
<a href=#bbbackbuffer>bbBackBuffer</a>, <a href=#bbimagebuffer>bbImageBuffer</a>, <a href=#bbtexturebuffer>bbTextureBuffer</a> or the result of a previous call
to <a href=#bbgraphicsbuffer>bbGraphicsBuffer</a>.
</p>
<p>
At the beginning of program execution and following any call
to <a href=#bbgraphics>bbGraphics</a> the current graphics buffer is set to the display's
<a href=#bbfrontbuffer>bbFrontBuffer</a>.
</p>
<p>
After a call to <a href=#bbgraphics3d>bbGraphics3D</a> the current buffer is set to the
display's <a href=#bbbackbuffer>bbBackBuffer</a>.
</p>
See Also: <a href=#bbgraphicsbuffer>bbGraphicsBuffer</a> <a href=#bbfrontbuffer>bbFrontBuffer</a> <a href=#bbbackbuffer>bbBackBuffer</a> <a href=#bbimagebuffer>bbImageBuffer</a> <a href=#bbtexturebuffer>bbTextureBuffer</a>
EndRem
Function SetBuffer(buffer:TBuffer)
	If buffer
		TBuffer.Active=buffer
	EndIf
End Function

Rem
bbdoc: <p> The <a href=#bbreadpixel>bbReadPixel</a> function determines the color of a pixel at the specified location of the specified graphics buffer.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>buffer</td><td class=argvalue>valid graphics buffer</td></tr>
</table>
</p>
<p>
The return value is an integer with the red, green and blue
values packed int the low 24 binary bits and a transparency
value in the high 8 bits.
</p>
<p>
If the x,y coordinate falls outside the bounds of the buffer
a value of BLACK or in the case of an image buffer, the images
mask color is returned.
</p>
<p>
If no graphics buffer is specified <a href=#bbreadpixel>bbReadPixel</a> uses the current
graphics buffer, see <a href=#bbsetbuffer>bbSetBuffer</a> for more details.
</p>
See Also: <a href=#bbwritepixel>bbWritePixel</a> <a href=#bbcopypixel>bbCopyPixel</a> <a href=#bbgetcolor>bbGetColor</a> <a href=#bbreadpixelfast>bbReadPixelFast</a>
EndRem
Function ReadPixel(x,y,buffer:TBuffer=Null)
	If Not buffer buffer=TBuffer.Active
	Return buffer.pixmap.ReadPixel(x,y)
End Function

Rem
bbdoc: <p> The <a href=#bbwritepixel>bbWritePixel</a> command sets the color of a pixel at the specified location of the specified graphics buffer to the value <b>color.</b> </p> <p> The <b>color</b> value is an integer with the red, green and blue values packed into the low 24 binary bits and if required the transparency value in the high 8 bits.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>color</td><td class=argvalue>binary packed color value</td></tr>
<tr><td class=argname>buffer</td><td class=argvalue>valid graphics buffer</td></tr>
</table>
</p>
<p>
If the x,y coordinate falls outside the bounds of the buffer
the <a href=#bbwritepixel>bbWritePixel</a> command does nothing.
</p>
<p>
If no graphics buffer is specified <a href=#bbwritepixel>bbWritePixel</a> uses the current
graphics buffer, see <a href=#bbsetbuffer>bbSetBuffer</a> for more details.
</p>
See Also: <a href=#bbreadpixel>bbReadPixel</a> <a href=#bbcopypixel>bbCopyPixel</a> <a href=#bbwritepixelfast>bbWritePixelFast</a> <a href=#bblockbuffer>bbLockBuffer</a>
EndRem
Function WritePixel(x,y,Color,buffer:TBuffer=Null)
	If Not buffer buffer=TBuffer.Active
	buffer.pixmap.WritePixel x,y,Color
End Function

Rem
bbdoc: <p> The <a href=#bbcopypixel>bbCopyPixel</a> command sets the color of a pixel at the destination location of the destination graphics buffer to the color of the pixel at the source location of the source buffer.
about:
<table class="arg">
<tr><td class=argname>src_x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>src_y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>src_buffer</td><td class=argvalue>valid graphics buffer to read from</td></tr>
<tr><td class=argname>dest_x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>dest_y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>dest_buffer</td><td class=argvalue>valid graphics buffer to write to</td></tr>
</table>
</p>
<p>
If no destination graphics buffer is specified <a href=#bbcopypixel>bbCopyPixel</a>
writes to the the current graphics buffer.
</p>
See Also: <a href=#bbreadpixel>bbReadPixel</a> <a href=#bbwritepixel>bbWritePixel</a> <a href=#bbcopypixelfast>bbCopyPixelFast</a>
EndRem
Function CopyPixel(src_x,src_y,src_buffer:TBuffer,x,y,buffer:TBuffer=Null)
	If Not buffer buffer=TBuffer.Active
	buffer.pixmap.WritePixel x,y,src_buffer.pixmap.ReadPixel(src_x,src_y)
End Function

Rem
bbdoc: <p> The <a href=#bbcopyrect>bbCopyRect</a> command is similar to <a href=#bbcopypixel>bbCopyPixel</a> but copies a region of pixels <b>width</b>, <b>height</b> in size.
about:
<table class="arg">
<tr><td class=argname>src_x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>src_y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>width</td><td class=argvalue>horizontal size of pixel region to copy</td></tr>
<tr><td class=argname>height</td><td class=argvalue>vertical size of pixel region to copy</td></tr>
<tr><td class=argname>dest_x</td><td class=argvalue>horizontal destination pixel location</td></tr>
<tr><td class=argname>dest_y</td><td class=argvalue>vertical destination pixel location</td></tr>
<tr><td class=argname>src_buffer</td><td class=argvalue>valid graphics buffer</td></tr>
<tr><td class=argname>dest_buffer</td><td class=argvalue>valid graphics buffer</td></tr>
</table>
</p>
<p>
If src_buffer and dest_buffer are not specified <a href=#bbcopyrect>bbCopyRect</a> uses
the current graphics buffer, see <a href=#bbsetbuffer>bbSetBuffer</a> for more details.
</p>
See Also: <a href=#bbcopypixel>bbCopyPixel</a>
EndRem
Function CopyRect(src_x,src_y,width,height,dest_x,dest_y,src_buffer:TBuffer=Null,buffer:TBuffer=Null)'="bbCopyRect"
	If Not buffer buffer=TBuffer.Active
End Function

Rem
bbdoc: <p> <a href=#bblockbuffer>bbLockBuffer</a> locks the specified graphics buffer.
about:
<table class="arg">
<tr><td class=argname>buffer</td><td class=argvalue>any valid graphics buffer</td></tr>
</table>
</p>
<p>
High speed pixel functions such as <a href=#bbreadpixelfast>bbReadPixelFast</a>, <a href=#bbwritepixelfast>bbWritePixelFast</a>
and <a href=#bbcopypixelfast>bbCopyPixelFast</a> require the graphics buffer be in a locked state.
</p>
<p>
<a href=#bbunlockbuffer>bbUnlockBuffer</a> must be used once the high speed pixel manipulation
is complete.
</p>
<p>
Standard drawing commands should not be issued when a buffer is in
a locked state.
</p>
<p>
See the other commands for more
information.
</p>
See Also: <a href=#bbunlockbuffer>bbUnlockBuffer</a> <a href=#bbreadpixelfast>bbReadPixelFast</a> <a href=#bbwritepixelfast>bbWritePixelFast</a> <a href=#bbcopypixelfast>bbCopyPixelFast</a>
EndRem
Function LockBuffer(buffer:TBuffer=Null)'="bbLockBuffer"
	If Not buffer buffer=TBuffer.Active
End Function

Rem
bbdoc: <p> <a href=#bbunlockbuffer>bbUnlockBuffer</a> must be used once the high speed pixel manipulation is complete on a locked buffer.
about:
<table class="arg">
<tr><td class=argname>buffer</td><td class=argvalue>any valid locked graphics buffer</td></tr>
</table>
</p>
<p>
See <a href=#bblockbuffer>bbLockBuffer</a> for more information.
</p>
See Also: <a href=#bblockbuffer>bbLockBuffer</a> <a href=#bbreadpixelfast>bbReadPixelFast</a> <a href=#bbwritepixelfast>bbWritePixelFast</a> <a href=#bbcopypixelfast>bbCopyPixelFast</a>
EndRem
Function UnlockBuffer(buffer:TBuffer=Null)'="bbUnlockBuffer"
	If Not buffer buffer=TBuffer.Active
End Function

Rem
bbdoc: <p> <a href=#bbreadpixelfast>bbReadPixelFast</a> is similar in function to <a href=#bbreadpixel>bbReadPixel</a> but the buffer must be locked with the <a href=#bblockbuffer>bbLockBuffer</a> command and no bounds checking is performed in the interests of speed.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>buffer</td><td class=argvalue>valid graphics buffer</td></tr>
</table>
</p>
<p>
Warning: like <a href=#bbwritepixelfast>bbWritePixelFast</a> extreme care must be taken to ensure
the pixel position specified falls inside the specified buffers
area to avoid crashing the computer.
</p>
See Also: <a href=#bbreadpixel>bbReadPixel</a> <a href=#bblockbuffer>bbLockBuffer</a> <a href=#bbunlockbuffer>bbUnlockBuffer</a> <a href=#bbwritepixelfast>bbWritePixelFast</a>
EndRem
Function ReadPixelFast(x,y,buffer:TBuffer=Null)'="bbReadPixelFast"
	If Not buffer buffer=TBuffer.Active
	Return buffer.pixmap.ReadPixel(x,y)
End Function

Rem
bbdoc: <p> <a href=#bbwritepixelfast>bbWritePixelFast</a> is similar in function to <a href=#bbreadpixel>bbReadPixel</a> but the buffer must be locked with the <a href=#bblockbuffer>bbLockBuffer</a> command and no bounds checking is performed in the interests of speed.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>color</td><td class=argvalue>binary packed color value</td></tr>
<tr><td class=argname>buffer</td><td class=argvalue>valid graphics buffer</td></tr>
</table>
</p>
<p>
Warning: like <a href=#bbreadpixelfast>bbReadPixelFast</a> extreme care must be taken to ensure
the pixel position specified falls inside the specified buffers
area to avoid crashing the computer.
</p>
See Also: <a href=#bbwritepixel>bbWritePixel</a> <a href=#bblockbuffer>bbLockBuffer</a> <a href=#bbunlockbuffer>bbUnlockBuffer</a> <a href=#bbreadpixelfast>bbReadPixelFast</a>
EndRem
Function WritePixelFast(x,y,c,buffer:TBuffer=Null)'="bbWritePixelFast"
	If Not buffer buffer=TBuffer.Active
	buffer.pixmap.WritePixel x,y,c
End Function

Rem
bbdoc: <p> <a href=#bbcopypixelfast>bbCopyPixelFast</a> is similar in function to <a href=#bbcopypixel>bbCopyPixel</a> but the buffer must be locked with the <a href=#bblockbuffer>bbLockBuffer</a> command and no bounds checking is performed in the interests of speed.
about:
<table class="arg">
<tr><td class=argname>src_x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>src_y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>src_buffer</td><td class=argvalue>valid graphics buffer to read from</td></tr>
<tr><td class=argname>dest_x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>dest_y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>dest_buffer</td><td class=argvalue>valid graphics buffer to write to</td></tr>
</table>
</p>
<p>
Warning: like <a href=#bbreadpixelfast>bbReadPixelFast</a> extreme care must be taken to ensure
the pixel position specified falls inside the specified buffers
area to avoid crashing the computer.
</p>
See Also: <a href=#bbcopypixel>bbCopyPixel</a> <a href=#bbreadpixelfast>bbReadPixelFast</a> <a href=#bbwritepixelfast>bbWritePixelFast</a>
EndRem
Function CopyPixelFast(src_x,src_y,src_buffer:TBuffer,dest_x,dest_y,buffer:TBuffer=Null)'="bbCopyPixelFast"
	If Not buffer buffer=TBuffer.Active
	buffer.pixmap.WritePixel x,y,src_buffer.pixmap.ReadPixel(src_x,src_y)
End Function


Extern

Rem
bbdoc: <p> The <a href=#bbgraphics>bbGraphics</a> command resizes the graphics display to the specified size in pixels and with the specified display properties including the color depth and fullscreen options.
about:
<table class="arg">
<tr><td class=argname>width</td><td class=argvalue>width of display in pixels</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height of display in pixels</td></tr>
<tr><td class=argname>depth</td><td class=argvalue>color depth in bits, 0 = default</td></tr>
<tr><td class=argname>mode</td><td class=argvalue>video mode flags, 0 = default</td></tr>
</table>
</p>
<p>
When a Blitz program begins a default 400x300 pixel
graphics window is created.
</p>
<p>
The depth parameter is optional, the default value of 0
specifies that Blitz3D select the most appropriate color
depth.
</p>
<p>
The mode parameter may be any of the following values:
</p>
<table class="data">
<tr><th class=data>Mode</th><th class=data>Value</th><th class=data>Description</th></tr>
<tr><td class=data>GFX_DEFAULT</td><td class=data>0</td><td class=data>FixedWindowed in Debug mode and FullScreen in Release</td></tr>
<tr><td class=data>GFX_FULLSCREEN</td><td class=data>1</td><td class=data>Own entire screen for optimal performance</td></tr>
<tr><td class=data>GFX_WINDOWED</td><td class=data>2</td><td class=data>A fixed size window placed on the desktop</td></tr>
<tr><td class=data>GFX_WINDOWEDSCALED</td><td class=data>3</td><td class=data>Graphics scaled according to current size of Window</td></tr>
</table>
<p>
Before using <a href=#bbgraphics>bbGraphics</a> to configure a fullscreen display,
the specified resolution should be verified as available
on the current graphics driver.
</p>
<p>
The <a href=#bbgfxmodeexists>bbGfxModeExists</a> function will return False
resolution is not available. Calling <a href=#bbgraphics>bbGraphics</a> with an unsupported
resolution will cause the program to fail with an &quot;Unable to Set
Graphics Mode&quot; error message.
</p>
<p class="hint">
The <a href=#bbgraphics>bbGraphics</a> command causes all images to be destroyed meaning
all images should be (re)loaded after any use of the <a href=#bbgraphics>bbGraphics</a> command.
</p>
<p>
See the Blitz3D command <a href=#bbgraphics3d>bbGraphics3D</a> for configuring the display
for use with 3D graphics.
</p>
See Also: <a href=#bbgfxmodeexists>bbGfxModeExists</a> <a href=#bbgraphics3d>bbGraphics3D</a> <a href=#bbfrontbuffer>bbFrontBuffer</a> <a href=#bbbackbuffer>bbBackBuffer</a> <a href=#bbflip>bbFlip</a> <a href=#bbendgraphics>bbEndGraphics</a>
EndRem
'simon Function Graphics(width,height,depth=0,mode=0)="bbGraphics"

Rem
bbdoc: <p> The <a href=#bbflip>bbFlip</a> command switches the FrontBuffer() and BackBuffer() of the current <a href=#bbgraphics>bbGraphics</a> display.
about:
<table class="arg">
<tr><td class=argname>synch</td><td class=argvalue>True
</table>
</p>
<p>
See the <a href=#bbbackbuffer>bbBackBuffer</a> command for a description on setting a
standard <a href=#bbgraphics>bbGraphics</a> display up for double buffered drawing.
</p>
<p>
The ability to draw graphics to a hidden buffer and then
transfer the completed drawing to the display is called
double buffering.
</p>
<p>
The <a href=#bbflip>bbFlip</a> command is used at the end of each drawing cycle
to display the results onto the display in a flicker free
manner.
</p>
<p>
The optional <b>synch</b> value may be set to False to override
the default True setting. Unsynchronized flipping should
only ever be used monitoring rendering performance as
it results in an ugly screen tearing.
</p>
See Also: <a href=#bbbackbuffer>bbBackBuffer</a> <a href=#bbfrontbuffer>bbFrontBuffer</a>
EndRem
'simon Function Flip(synch=True)="bbFlip"

Rem
bbdoc: <p> The <a href=#bbbackbuffer>bbBackBuffer</a> function returns a buffer that corresponds to the hidden area that will be flipped to the display when the <a href=#bbflip>bbFlip</a> command is called.
about:
</p>
<p>
The <a href=#bbbackbuffer>bbBackBuffer</a> is the current drawing buffer after a call
to <a href=#bbgraphics3d>bbGraphics3D</a>.
</p>
<p>
Unlike <a href=#bbgraphics3d>bbGraphics3D</a> the <a href=#bbgraphics>bbGraphics</a> command does not make the
<a href=#bbbackbuffer>bbBackBuffer</a> the default drawing surface so a <a href=#bbsetbuffer>bbSetBuffer</a> <a href=#bbbackbuffer>bbBackBuffer</a>
command sequence is required after the <a href=#bbgraphics>bbGraphics</a> command
in order for the display to be configured for double buffered drawing.
</p>
See Also: <a href=#bbflip>bbFlip</a> <a href=#bbsetbuffer>bbSetBuffer</a> <a href=#bbfrontbuffer>bbFrontBuffer</a>
EndRem
Function BackBuffer()="bbBackBuffer"

Rem
bbdoc: <p> The <a href=#bbfrontbuffer>bbFrontBuffer</a> function returns a buffer that corresponds to that viewable on the display.
about:
</p>
<p>
Drawing to the FrontBuffer() can be used to display an image
that is progressively rendered. That is each main loop the
program does not include a <a href=#bbcls>bbCls</a> or <a href=#bbflip>bbFlip</a> but continually draws
to the FrontBuffer allowing the user to view the image as it
is created over the period of minutes or hours.
</p>
See Also: <a href=#bbbackbuffer>bbBackBuffer</a>
EndRem
Function FrontBuffer()="bbFrontBuffer"

Rem
bbdoc: <p> The <a href=#bbgraphicswidth>bbGraphicsWidth</a> command returns the current width of the display in pixels.
about:
</p>
See Also: <a href=#bbgraphics>bbGraphics</a> <a href=#bbgraphicsheight>bbGraphicsHeight</a> <a href=#bbgraphicsdepth>bbGraphicsDepth</a>
EndRem
'simon Function GraphicsWidth()="bbGraphicsWidth"

Rem
bbdoc: <p> The <a href=#bbgraphicsheight>bbGraphicsHeight</a> command returns the current height of the display in pixels.
about:
</p>
See Also: <a href=#bbgraphics>bbGraphics</a> <a href=#bbgraphicswidth>bbGraphicsWidth</a> <a href=#bbgraphicsdepth>bbGraphicsDepth</a>
EndRem
'simon Function GraphicsHeight()="bbGraphicsHeight"

Rem
bbdoc: <p> The <a href=#bbgraphicsdepth>bbGraphicsDepth</a> command returns the current color depth of the display.
about:
</p>
See Also: <a href=#bbgraphics>bbGraphics</a> <a href=#bbgraphicswidth>bbGraphicsWidth</a> <a href=#bbgraphicsheight>bbGraphicsHeight</a>
EndRem
'simon Function GraphicsDepth()="bbGraphicsDepth"

Rem
bbdoc: <p> Returns the Graphics mode to the original 400x300 fixed window.
about:
</p>
<p class="hint">
The <a href=#bbendgraphics>bbEndGraphics</a> command causes all images to be destroyed.
</p>
See Also: <a href=#bbgraphics>bbGraphics</a>
EndRem
'simon Function EndGraphics()="bbEndGraphics"

Rem
bbdoc: <p> <a href=#bbvwait>bbVWait</a> will cause the program to halt execution until the video display has completed its refresh and reached it's Vertical Blank cycle (the time during which the video beam returns to the top of the display to begin its next refresh).
about:
<table class="arg">
<tr><td class=argname>frames</td><td class=argvalue>optional number of frames to wait. Default is 1</td></tr>
</table>
</p>
<p>
The <a href=#bbvwait>bbVWait</a> command provides an alternative method to using
the synchronized version of the <a href=#bbflip>bbFlip</a> command (default)
which is useful on vintage computer hardware that does
not provide a properly synchonized Flip response.
</p>
<p>
Synching a game's display using the VWait command will also
cause the program to exhibit excess CPU usage and should
be made optional if utilized at all.
</p>
See Also: <a href=#bbflip>bbFlip</a> <a href=#bbscanline>bbScanLine</a>
EndRem
Function VWait(frames=1)="bbVWait"

Rem
bbdoc: <p> The <a href=#bbscanline>bbScanLine</a> function returns the actual scanline being refreshed by the video hardware or 0 if in vertical blank or unsupported by the hardware.
about:
</p>
See Also: <a href=#bbvwait>bbVWait</a> <a href=#bbflip>bbFlip</a>
EndRem
Function ScanLine()="bbScanLine"

Rem
bbdoc: <p> Returns the total amount of graphics memory present on the current graphics device.
about:
</p>
<p>
Use the <a href=#bbavailvidmem>bbAvailVidMem</a> command to find the available amount of video memory
and the difference to calculate the amount of video memory currently in
use.
</p>
See Also: <a href=#bbavailvidmem>bbAvailVidMem</a> <a href=#bbsetgfxdriver>bbSetGfxDriver</a>
EndRem
Function TotalVidMem()="bbTotalVidMem"

Rem
bbdoc: <p> Returns the available amount of graphics memory on the current graphics device.
about:
</p>
See Also: <a href=#bbtotalvidmem>bbTotalVidMem</a> <a href=#bbsetgfxdriver>bbSetGfxDriver</a>
EndRem
Function AvailVidMem()="bbAvailVidMem"

Rem
bbdoc: <p> SetGamma allows you to modify the gamma tables.
about:
<table class="arg">
<tr><td class=argname>red</td><td class=argvalue>red input value</td></tr>
<tr><td class=argname>green</td><td class=argvalue>green input value</td></tr>
<tr><td class=argname>blue</td><td class=argvalue>blue input value</td></tr>
<tr><td class=argname>dest_red</td><td class=argvalue>red output value</td></tr>
<tr><td class=argname>dest_green</td><td class=argvalue>green output value</td></tr>
<tr><td class=argname>dest_blue</td><td class=argvalue>blue output value</td></tr>
</table>
</p>
<p>
Gamma can ONLY be used in fullscreen mode.
</p>
<p>
Gamma is performed on a per channel basis, with each red, green and blue
channel using a translation table of 256 entries to modify the resultant
color output. The <a href=#bbsetgamma>bbSetGamma</a> command allows you to modify the specified
entry with the specified value for each of the 3 channels.
</p>
<p>
Suitable translation tables can be configured to influence
any or all of the 3 primary color components allowing the
displayed channel (red, green or blue) to be amplified,
muted or even inverted.
</p>
<p>
After performing one or more <a href=#bbsetgamma>bbSetGamma</a> commands, call <a href=#bbupdategamma>bbUpdateGamma</a> in
order for the changes to become effective.
</p>
See Also: <a href=#bbupdategamma>bbUpdateGamma</a> <a href=#bbgammared>bbGammaRed</a> <a href=#bbgammablue>bbGammaBlue</a> <a href=#bbgammagreen>bbGammaGreen</a>
EndRem
Function SetGamma(red,green,blue,dest_red#,dest_green#,dest_blue#)="bbSetGamma"

Rem
bbdoc: <p> UpdateGamma should be used after a series of <a href=#bbsetgamma>bbSetGamma</a> commands in order to effect actual changes.
about:
<table class="arg">
<tr><td class=argname>calibrate</td><td class=argvalue>True if the gamma table should be calibrated to the display</td></tr>
</table>
</p>
See Also: <a href=#bbsetgamma>bbSetGamma</a>
EndRem
Function UpdateGamma(calibrate=0)="bbUpdateGamma"

Rem
bbdoc: <p> Returns the adjusted output value of the red channel given the specified input <b>value</b> by referencing the current gamma correction tables.
about:
<table class="arg">
<tr><td class=argname>value</td><td class=argvalue>an integer index into the red gamma table</td></tr>
</table>
</p>
<p>
See <b>SetGamma</b> for more information
</p>
See Also: <a href=#bbgammagreen>bbGammaGreen</a> <a href=#bbgammablue>bbGammaBlue</a> <a href=#bbsetgamma>bbSetGamma</a>
EndRem
Function GammaRed(value)="bbGammaRed"

Rem
bbdoc: <p> Returns the adjusted output value of the green channel given the specified input <b>value</b> by referencing the current gamma correction tables.
about:
<table class="arg">
<tr><td class=argname>value</td><td class=argvalue>an integer index into the green gamma table</td></tr>
</table>
</p>
<p>
See <b>SetGamma</b> for more information
</p>
See Also: <a href=#bbgammared>bbGammaRed</a> <a href=#bbgammablue>bbGammaBlue</a> <a href=#bbsetgamma>bbSetGamma</a>
EndRem
Function GammaGreen(value)="bbGammaGreen"

Rem
bbdoc: <p> Returns the adjusted output value of the blue channel given the specified input <b>value</b> by referencing the current gamma correction tables.
about:
<table class="arg">
<tr><td class=argname>value</td><td class=argvalue>an integer index into the blue gamma table</td></tr>
</table>
</p>
<p>
See <b>SetGamma</b> for more information
</p>
See Also: <a href=#bbgammared>bbGammaRed</a> <a href=#bbgammagreen>bbGammaGreen</a> <a href=#bbsetgamma>bbSetGamma</a>
EndRem
Function GammaBlue(value)="bbGammaBlue"

Rem
bbdoc: <p> The <a href=#bbprint>bbPrint</a> command writes a string version of <b>value</b> if specified to the current graphics buffer at the current cursor position and moves the cursor position to the next line.
about:
<table class="arg">
<tr><td class=argname>value</td><td class=argvalue>the text to be output (optional)</td></tr>
</table>
</p>
<p>
If the optional value parameter is omitted the <a href=#bbprint>bbPrint</a> command simply
moves the cursor position down a line.
</p>
<p>
As Blitz automatically converts any numeric or custom type to a string
the value parameter can in fact be any value.
</p>
See Also: <a href=#bbwrite>bbWrite</a> <a href=#bbinput>bbInput</a> <a href=#bblocate>bbLocate</a>
EndRem
Function bbPrint(value$z)="bbPrint"

Rem
bbdoc: <p> The <a href=#bbwrite>bbWrite</a> command is similar to the <a href=#bbprint>bbPrint</a> command but the cursor is not moved to a new line at the completion of the command.
about:
<table class="arg">
<tr><td class=argname>value</td><td class=argvalue>the text to be output (optional)</td></tr>
</table>
</p>
<p>
Instead, the cursor is moved to the end of the output text.
</p>
See Also: <a href=#bbprint>bbPrint</a> <a href=#bblocate>bbLocate</a>
EndRem
Function Write(value$z)="bbWrite"

Rem
bbdoc: <p> The <a href=#bbinput>bbInput</a> command accepts and prints keyboard entry from the user until a Return key is received at which time the Input command returns a string result.
about:
<table class="arg">
<tr><td class=argname>prompt$</td><td class=argvalue>optional text to be printed before keyboard input proceeds</td></tr>
</table>
</p>
See Also: <a href=#bbprint>bbPrint</a> <a href=#bblocate>bbLocate</a>
EndRem
'simon Function Input$z(prompt$z)="bbInput"

Rem
bbdoc: <p> The <a href=#bblocate>bbLocate</a> command positions the cursor position at the specified pixel position of the current graphics buffer.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal position on the current graphics buffer in pixels</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical position on the current graphics buffer in pixels</td></tr>
</table>
</p>
See Also: <a href=#bbprint>bbPrint</a> <a href=#bbwrite>bbWrite</a> <a href=#bbinput>bbInput</a>
EndRem
Function Locate(x,y)="bbLocate"

Rem
bbdoc: <p> The <a href=#bbcls>bbCls</a> command clears the current graphics buffer clean, using an optional color specified with a previous call to <a href=#bbclscolor>bbClsColor</a>.
about:
</p>
<p>
<a href=#bbcls>bbCls</a> is not commonly called when using <a href=#bbgraphics3d>bbGraphics3D</a> due to the
behavior of <a href=#bbrenderworld>bbRenderWorld</a> which clears the <a href=#bbbackbuffer>bbBackBuffer</a>
using the various <a href=#bbcameraclsmode>bbCameraClsMode</a> settings instead.
</p>
See Also: <a href=#bbclscolor>bbClsColor</a> <a href=#bbcameraclsmode>bbCameraClsMode</a>
EndRem
Function Cls()="bbCls"

Rem
bbdoc: <p> <a href=#bbplot>bbPlot</a> draws a single pixel at the coordinates specified using the current drawing color.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel position</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel position</td></tr>
</table>
</p>
See Also: <a href=#bbline>bbLine</a> <a href=#bbrect>bbRect</a> <a href=#bbcolor>bbColor</a>
EndRem
Function Plot(x,y)="bbPlot"

Rem
bbdoc: <p> The <a href=#bbline>bbLine</a> command draws a line, in the current drawing color, from one pixel position to another.
about:
<table class="arg">
<tr><td class=argname>x1</td><td class=argvalue>start pixel's horizontal position</td></tr>
<tr><td class=argname>y1</td><td class=argvalue>start pixel's vertical position</td></tr>
<tr><td class=argname>x2</td><td class=argvalue>end pixel's horizontal position</td></tr>
<tr><td class=argname>y2</td><td class=argvalue>end pixel's vertical position</td></tr>
</table>
</p>
See Also: <a href=#bbplot>bbPlot</a> <a href=#bbrect>bbRect</a> <a href=#bbcolor>bbColor</a>
EndRem
Function Line(x1,y1,x2,y2)="bbLine"

Rem
bbdoc: <p> The <a href=#bbrect>bbRect</a> command draws a rectangle.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontl pixel position</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel position</td></tr>
<tr><td class=argname>width</td><td class=argvalue>width in pixels</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height in pixels</td></tr>
<tr><td class=argname>solid</td><td class=argvalue>False draws an outline only</td></tr>
</table>
</p>
<p>
It uses the current drawing color to draw a solid rectangle or
outlined if a False setting is specified for the <b>solid</b> parameter.
</p>
See Also: <a href=#bbplot>bbPlot</a> <a href=#bbline>bbLine</a> <a href=#bbcolor>bbColor</a>
EndRem
Function Rect(x,y,width,height,solid=True)="bbRect"

Rem
bbdoc: <p> The <a href=#bboval>bbOval</a> command can be used to draw circles and ovals in solid or outline form.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontl pixel position</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel position</td></tr>
<tr><td class=argname>width</td><td class=argvalue>width in pixels</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height in pixels</td></tr>
<tr><td class=argname>solid</td><td class=argvalue>False draws an outline only</td></tr>
</table>
</p>
<p>
The shape of the <a href=#bboval>bbOval</a> drawn is the largest that can fit inside
the specified rectangle.
</p>
EndRem
Function Oval(x,y,width,height,solid=True)="bbOval"

Rem
bbdoc: <p> This command sets the current drawing color allowing Lines, Rectangles, Ovals, Pixels and Text to be drawn in any color of the rainbow.
about:
<table class="arg">
<tr><td class=argname>red</td><td class=argvalue>amount of red (0..255)</td></tr>
<tr><td class=argname>green</td><td class=argvalue>amount of green (0..255)</td></tr>
<tr><td class=argname>blue</td><td class=argvalue>amount of blue (0..255)</td></tr>
</table>
</p>
<p>
The actual color is specified by 3 numbers representing
the amount of red, green and blue mixed together.
</p>
<p>
The following table demonstrates values of red, green and blue
required to specify the named colors:
</p>
<table class="data">
<tr><th class=data>Color</th><th class=data>Red</th><th class=data>Green</th><th class=data>Blue</th></tr>
<tr><td class=data>Black</td><td class=data>0</td><td class=data>0</td><td class=data>0</td></tr>
<tr><td class=data>Red</td><td class=data>255</td><td class=data>0</td><td class=data>0</td></tr>
<tr><td class=data>Green</td><td class=data>0</td><td class=data>255</td><td class=data>0</td></tr>
<tr><td class=data>Blue</td><td class=data>0</td><td class=data>0</td><td class=data>255</td></tr>
<tr><td class=data>Yellow</td><td class=data>255</td><td class=data>255</td><td class=data>0</td></tr>
<tr><td class=data>Turquoise</td><td class=data>0</td><td class=data>255</td><td class=data>255</td></tr>
<tr><td class=data>Purple</td><td class=data>255</td><td class=data>0</td><td class=data>255</td></tr>
<tr><td class=data>White</td><td class=data>255</td><td class=data>255</td><td class=data>255</td></tr>
</table>
EndRem
Function Color(red,green,blue)="bbColor"

Rem
bbdoc: <p> The <a href=#bbclscolor>bbClsColor</a> command is used to change the Color used by the <a href=#bbcls>bbCls</a> command.
about:
<table class="arg">
<tr><td class=argname>red</td><td class=argvalue>amount of red (0..255)</td></tr>
<tr><td class=argname>green</td><td class=argvalue>amount of green (0..255)</td></tr>
<tr><td class=argname>blue</td><td class=argvalue>amount of blue (0..255)</td></tr>
</table>
</p>
<p>
See the <a href=#bbcolor>bbColor</a> command for combining values of red, green and blue
in order to specify some commonly used colors.
</p>
See Also: <a href=#bbcls>bbCls</a> <a href=#bbcolor>bbColor</a>
EndRem
Function ClsColor(red,green,blue)="bbClsColor"

Rem
bbdoc: <p> The <a href=#bborigin>bbOrigin</a> command sets a point of origin for all subsequent drawing commands.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel position</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel position</td></tr>
</table>
</p>
<p>
The default <a href=#bborigin>bbOrigin</a> of a drawing buffer is the top left pixel.
</p>
<p>
After calling <a href=#bborigin>bbOrigin</a>, all drawing commands will treat the pixel
at location <b>x</b>,<b>y</b> as coordinate 0,0
</p>
See Also: <a href=#bbplot>bbPlot</a> <a href=#bbline>bbLine</a> <a href=#bbrect>bbRect</a> <a href=#bboval>bbOval</a>
EndRem
Function Origin(x,y)="bbOrigin"

Rem
bbdoc: <p> The <a href=#bbviewport>bbViewport</a> command allows the cropping of subsequent drawing commands to a rectangular region of the current graphics buffer.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel position</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel position</td></tr>
<tr><td class=argname>width</td><td class=argvalue>width in pixels</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height in pixels</td></tr>
</table>
</p>
<p>
This is useful for partitioning the screen into separate errors such as the split screen mode common in two player video games.
</p>
See Also: <a href=#bborigin>bbOrigin</a>
EndRem
Function Viewport(x,y,width,height)="bbViewport"

Rem
bbdoc: <p> The <a href=#bbgetcolor>bbGetColor</a> command sets the current drawing color to that of the pixel at the specified screen coordinates.
about:
<table class="arg">
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel position</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel position</td></tr>
</table>
</p>
<p>
The <a href=#bbcolorred>bbColorRed</a>, <a href=#bbcolorgreen>bbColorGreen</a> and <a href=#bbcolorblue>bbColorBlue</a> functions can
be used to retrieve the current drawing color, allowing you
to determine a pixel's color.
</p>
See Also: <a href=#bbcolor>bbColor</a> <a href=#bbcolorred>bbColorRed</a> <a href=#bbcolorgreen>bbColorGreen</a> <a href=#bbcolorblue>bbColorBlue</a>
EndRem
Function GetColor(x,y)="bbGetColor"

Rem
bbdoc: <p> The <a href=#bbcolorred>bbColorRed</a> function returns the red component of the current drawing color.
about:
</p>
See Also: <a href=#bbcolor>bbColor</a> <a href=#bbgetcolor>bbGetColor</a> <a href=#bbcolorgreen>bbColorGreen</a> <a href=#bbcolorblue>bbColorBlue</a>
EndRem
Function ColorRed()="bbColorRed"

Rem
bbdoc: <p> The <a href=#bbcolorgreen>bbColorGreen</a> function returns the green component of the current drawing color.
about:
</p>
See Also: <a href=#bbcolor>bbColor</a> <a href=#bbgetcolor>bbGetColor</a> <a href=#bbcolorred>bbColorRed</a> <a href=#bbcolorblue>bbColorBlue</a>
EndRem
Function ColorGreen()="bbColorGreen"

Rem
bbdoc: <p> The <a href=#bbcolorblue>bbColorBlue</a> function returns the blue component of the current drawing color.
about:
</p>
See Also: <a href=#bbcolor>bbColor</a> <a href=#bbgetcolor>bbGetColor</a> <a href=#bbcolorred>bbColorRed</a> <a href=#bbcolorgreen>bbColorGreen</a>
EndRem
Function ColorBlue()="bbColorBlue"

Rem
bbdoc: <p> The <a href=#bbloadfont>bbLoadFont</a> function loads a font and returns a font handle which can subsequently used with commands such as <a href=#bbsetfont>bbSetFont</a> and <a href=#bbfreefont>bbFreeFont</a>.
about:
<table class="arg">
<tr><td class=argname>fontname$</td><td class=argvalue>name of font to be loaded, e.g. &quot;arial&quot;</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height of font in points (default is 12)</td></tr>
<tr><td class=argname>bold</td><td class=argvalue>True to load bold version of font</td></tr>
<tr><td class=argname>italic</td><td class=argvalue>True to load italic version of font</td></tr>
<tr><td class=argname>underlined</td><td class=argvalue>True to load underlined version of font</td></tr>
</table>
</p>
See Also: <a href=#bbsetfont>bbSetFont</a>
EndRem
Function LoadFont(FontName$z,height=12,bold=False,italic=False,underlined=False)="bbLoadFont"

Rem
bbdoc: <p> The <a href=#bbsetfont>bbSetFont</a> command is used in combination with a prior LoadFont command to specify which font subsequent <a href=#bbtext>bbText</a>, <a href=#bbprint>bbPrint</a>, <a href=#bbwrite>bbWrite</a>, <a href=#bbfontwidth>bbFontWidth</a>, <a href=#bbfontheigtht>bbFontHeigtht</a>, <a href=#bbstringwidth>bbStringWidth</a> and <a href=#bbstringheight>bbStringHeight</a> commands will use.
about:
<table class="arg">
<tr><td class=argname>fonthandle</td><td class=argvalue>handle of a font successfully returned by <a href=#bbloadfont>bbLoadFont</a></td></tr>
</table>
</p>
See Also: <a href=#bbtext>bbText</a> <a href=#bbfreefont>bbFreeFont</a> <a href=#bbprint>bbPrint</a> <a href=#bbwrite>bbWrite</a> <a href=#bbfontwidth>bbFontWidth</a> <a href=#bbfontheight>bbFontHeight</a> <a href=#bbstringwidth>bbStringWidth</a> <a href=#bbstringheight>bbStringHeight</a>
EndRem
Function SetFont(fonthandle)="bbSetFont"

Rem
bbdoc: <p> Use the <a href=#bbfreefont>bbFreeFont</a> command when a font returned by the <a href=#bbloadfont>bbLoadFont</a> command is no longer required for text drawing duties.
about:
<table class="arg">
<tr><td class=argname>fonthandle</td><td class=argvalue>A handle to a previously loaded font.</td></tr>
</table>
</p>
EndRem
Function FreeFont(fonthandle)="bbFreeFont"

Rem
bbdoc: <p> Returns the current width in pixels of the WIDEST character in the font.
about:
</p>
See Also: <a href=#bbfontheight>bbFontHeight</a> <a href=#bbsetfont>bbSetFont</a>
EndRem
Function FontWidth()="bbFontWidth"

Rem
bbdoc: <p> Returns the current height in pixels of the currently selected font.
about:
</p>
See Also: <a href=#bbfontwidth>bbFontWidth</a> <a href=#bbsetfont>bbSetFont</a>
EndRem
Function FontHeight()="bbFontHeight"

Rem
bbdoc: <p> Returns the width in pixels of the specified string accounting for the current font selected with the most recent <a href=#bbsetfont>bbSetFont</a> command for the current graphics buffer.
about:
<table class="arg">
<tr><td class=argname>str$</td><td class=argvalue>any valid string or string variable</td></tr>
</table>
</p>
See Also: <a href=#bbsetfont>bbSetFont</a> <a href=#bbstringheight>bbStringHeight</a>
EndRem
Function StringWidth(str$z)="bbStringWidth"

Rem
bbdoc: <p> Returns the height in pixels of the specified string accounting for the current font selected with the most recent <a href=#bbsetfont>bbSetFont</a> command for the current graphics buffer.
about:
<table class="arg">
<tr><td class=argname>str</td><td class=argvalue>any valid string or string variable</td></tr>
</table>
</p>
See Also: <a href=#bbsetfont>bbSetFont</a> <a href=#bbstringwidth>bbStringWidth</a>
EndRem
Function StringHeight(str$z)="bbStringHeight"

Rem
bbdoc: <p> Reads an image file from disk.
about:
<table class="arg">
<tr><td class=argname>filename$</td><td class=argvalue>the name of the image file to be loaded</td></tr>
</table>
</p>
<p>
Blitz3D supports BMP, JPG and PNG image formats.
</p>
<table class="data">
<tr><th class=data>Extension</th><th class=data>Compression</th><th class=data>Features</th></tr>
<tr><td class=data>bmp</td><td class=data> none</td><td class=data> can be created with <a href=#bbsaveimage>bbSaveImage</a> command</td></tr>
<tr><td class=data>png</td><td class=data> good</td><td class=data> loss-less compression</td></tr>
<tr><td class=data>jpg</td><td class=data> excellent</td><td class=data> small loss in image quality</td></tr>
</table>
<p>
The PNG image format is recomended for general use.
</p>
<p>
The <a href=#bbloadimage>bbLoadImage</a> function returns an image handle that
can then be used with <a href=#bbdrawimage>bbDrawImage</a> to draw the image
on the current graphics buffer.
</p>
<p>
If the image file contains multiple frames of animation
use the <a href=#bbloadanimimage>bbLoadAnimImage</a> function instead.
</p>
<p>
If the image file cannot be located or there is a
problem loading, <a href=#bbloadimage>bbLoadImage</a> will fail and return 0.
</p>
See Also: <a href=#bbdrawimage>bbDrawImage</a> <a href=#bbloadanimimage>bbLoadAnimImage</a> <a href=#bbcreateimage>bbCreateImage</a> <a href=#bbfreeimage>bbFreeImage</a> <a href=#bbsaveimage>bbSaveImage</a>
EndRem
Function LoadImage(filename$z)="bbLoadImage"

Rem
bbdoc: <p> The <a href=#bbloadanimimage>bbLoadAnimImage</a> function is an alternative to <a href=#bbloadimage>bbLoadImage</a> that can load many frames of animation from a single image file.
about:
<table class="arg">
<tr><td class=argname>filename$</td><td class=argvalue>the name of the image file to be loaded</td></tr>
<tr><td class=argname>width</td><td class=argvalue>width in pixels of each frame in the image.</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height in pixels of each frame in the image.</td></tr>
<tr><td class=argname>first</td><td class=argvalue>index of first animation frame in source image to load(usually 0)</td></tr>
<tr><td class=argname>count</td><td class=argvalue>number of frames to load</td></tr>
</table>
</p>
<p>
The frames must be drawn in similar sized rectangles
arranged from left to right, top to bottom on the
image source.
</p>
<p>
Animation is achieved by selecting a different frame
of animation to be used each time the image is drawn.
The optional <b>frame</b> parameter of commands such as
<a href=#bbdrawimage>bbDrawImage</a> select a specific frame of animation
to draw of the specified <b>image</b> loaded with this
command.
</p>
<p>
If the image file cannot be located or there is a
problem loading, <a href=#bbloadanimimage>bbLoadAnimImage</a> will fail and return 0.
</p>
See Also: <a href=#bbdrawimage>bbDrawImage</a> <a href=#bbloadimage>bbLoadImage</a>
EndRem
Function LoadAnimImage(filename$z,width,height,first,count)="bbLoadAnimImage"

Rem
bbdoc: <p> The <a href=#bbcreateimage>bbCreateImage</a> function returns a new image with the specified dimensions in pixels containing an optional number of animation frames.
about:
<table class="arg">
<tr><td class=argname>width</td><td class=argvalue>width in pixels of the new image</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height in pixels of the new image</td></tr>
<tr><td class=argname>frames</td><td class=argvalue>optional number of frames</td></tr>
</table>
</p>
<p>
Images need not be loaded from files but can instead be
created and modified by the program. Once an image
is created with <a href=#bbcreateimage>bbCreateImage</a> it can be used as the destination
of a <a href=#bbgrabimage>bbGrabImage</a> command or its pixel buffer can be
accessed directly with the <a href=#bbimagebuffer>bbImageBuffer</a> command.
</p>
See Also: <a href=#bbimagebuffer>bbImageBuffer</a> <a href=#bbfreeimage>bbFreeImage</a>
EndRem
Function CreateImage(width,height,frames=1)="bbCreateImage"

Rem
bbdoc: <p> The color specified by mixing the <b>red</b>, <b>green</b> and <b>blue</b> amounts is assigned as the mask color of the specified image.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>red</td><td class=argvalue>amount of red (0..255)</td></tr>
<tr><td class=argname>green</td><td class=argvalue>amount of green (0..255)</td></tr>
<tr><td class=argname>blue</td><td class=argvalue>amount of blue (0..255)</td></tr>
</table>
</p>
<p>
When an image is drawn with <a href=#bbdrawimage>bbDrawImage</a>, <a href=#bbtileimage>bbTileImage</a>
or <a href=#bbdrawimagerect>bbDrawImageRect</a>, any pixels in the image that are the
same color as the mask color are not drawn.
</p>
<p>
<a href=#bbdrawblock>bbDrawBlock</a> and other block based commands can be used to
draw an image and ignore the image's mask color.
</p>
<p>
By default an image has a mask color of black.
</p>
See Also: <a href=#bbdrawimage>bbDrawImage</a>
EndRem
Function MaskImage(image,red,green,blue)="bbMaskImage"

Rem
bbdoc: <p> Returns the width in pixels of the specified image.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
</table>
</p>
<p>
Use this function and <a href=#bbimageheight>bbImageHeight</a> to ascertain the
exact pixel size of an image's bounding rectangle.
</p>
See Also: <a href=#bbimageheight>bbImageHeight</a>
EndRem
Function ImageWidth(image)="bbImageWidth"

Rem
bbdoc: <p> Returns the height in pixels of the specified image.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
</table>
</p>
<p>
Use this function and <a href=#bbimagewidth>bbImageWidth</a> to ascertain the
exact pixel size of an image's bounding rectangle.
</p>
See Also: <a href=#bbimagewidth>bbImageWidth</a>
EndRem
Function ImageHeight(image)="bbImageHeight"

Rem
bbdoc: <p> <a href=#bbsaveimage>bbSaveImage</a> saves an image or one of its frames to a .bmp format image file.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>bmpfile$</td><td class=argvalue>the filename to be used when the image file is created</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>optional frame of the image to save</td></tr>
</table>
</p>
<p>
Returns True
</p>
<p class="hint">
The .bmp suffix should be included at the end of the filename if the
image file created by <a href=#bbsaveimage>bbSaveImage</a> is to be recognized as a valid image
by the system and other applications.
</p>
See Also: <a href=#bbloadimage>bbLoadImage</a> <a href=#bbsavebuffer>bbSaveBuffer</a>
EndRem
Function SaveImage(image,bmpfile$z,frame=0)="bbSaveImage"

Rem
bbdoc: <p> The <a href=#bbfreeimage>bbFreeImage</a> command releases all memory used by the image specified.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
</table>
</p>
<p>
Following a call to <a href=#bbfreeimage>bbFreeImage</a> the specified image handle
is no longer valid and must not be used.
</p>
See Also: <a href=#bbloadimage>bbLoadImage</a> <a href=#bbcreateimage>bbCreateImage</a> <a href=#bbcopyimage>bbCopyImage</a>
EndRem
Function FreeImage(image)="bbFreeImage"

Rem
bbdoc: <p> The <a href=#bbdrawimage>bbDrawImage</a> command draws an image to the current graphics buffer at the specified pixel location.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>optional frame number</td></tr>
</table>
</p>
<p>
The <b>image</b> parameter must be a valid image loaded
with <a href=#bbloadimage>bbLoadImage</a> or <a href=#bbloadanimimage>bbLoadAnimImage</a> or alternatively
created with <a href=#bbcreateimage>bbCreateImage</a>.
</p>
<p>
If specified, a particular frame of animation from the
image may be drawn. The image in this situation must
be the result of a call to <a href=#bbloadanimimage>bbLoadAnimImage</a> and contain
the <b>frame</b> specified.
</p>
<p>
A faster version of <a href=#bbdrawimage>bbDrawImage</a> is available for images
that do not contain a mask or alpha channel called
<a href=#bbdrawblock>bbDrawBlock</a>.
</p>
See Also: <a href=#bbmaskimage>bbMaskImage</a> <a href=#bbdrawimagerect>bbDrawImageRect</a> <a href=#bbtileimage>bbTileImage</a> <a href=#bbloadimage>bbLoadImage</a> <a href=#bbdrawblock>bbDrawBlock</a>
EndRem
Function DrawImage(image,x,y,frame=0)="bbDrawImage"

Rem
bbdoc: <p> <a href=#bbdrawblock>bbDrawBlock</a> is similar to <a href=#bbdrawimage>bbDrawImage</a> except all masking and image transparency is ignored.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>optional frame number</td></tr>
</table>
</p>
See Also: <a href=#bbdrawblockrect>bbDrawBlockRect</a> <a href=#bbtileblock>bbTileBlock</a> <a href=#bbdrawimage>bbDrawImage</a>
EndRem
Function DrawBlock(image,x,y,frame=0)="bbDrawBlock"

Rem
bbdoc: <p> The <a href=#bbdrawimagerect>bbDrawImageRect</a> command draws a part of an Image on to the current graphics buffer at location <b>x</b>, <b>y.</b> </p> <p> The region of the image used is defined by the rectangle at location <b>image_x</b>,<b>image_y</b> of size <b>width</b>,<b>height.</b> </p> <p> See <a href=#bbdrawimage>bbDrawImage</a> for more details about drawing with images.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>image_x</td><td class=argvalue>horizontal pixel location in image</td></tr>
<tr><td class=argname>image_y</td><td class=argvalue>vertical pixel location in image</td></tr>
<tr><td class=argname>width</td><td class=argvalue>width of rectangle to Draw</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height of rectangle to Draw</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>optional frame number</td></tr>
</table>
</p>
See Also: <a href=#bbdrawimage>bbDrawImage</a> <a href=#bbdrawblockrect>bbDrawBlockRect</a> <a href=#bbtileimage>bbTileImage</a>
EndRem
Function DrawImageRect(image,x,y,image_x,image_y,width,height,frame=0)="bbDrawImageRect"

Rem
bbdoc: <p> The <a href=#bbdrawblockrect>bbDrawBlockRect</a> command is similar to <a href=#bbdrawimagerect>bbDrawImageRect</a> but ignores any masking and transparency in the source image.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location</td></tr>
<tr><td class=argname>image_x</td><td class=argvalue>horizontal pixel location in image</td></tr>
<tr><td class=argname>image_y</td><td class=argvalue>vertical pixel location in image</td></tr>
<tr><td class=argname>width</td><td class=argvalue>width of rectangle to Draw</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height of rectangle to Draw</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>optional frame number</td></tr>
</table>
</p>
See Also: <a href=#bbdrawimagerect>bbDrawImageRect</a>
EndRem
Function DrawBlockRect(image,x,y,image_x,image_y,width,height,frame=0)="bbDrawBlockRect"

Rem
bbdoc: <p> The <a href=#bbtileimage>bbTileImage</a> command tiles the entire viewport of the current graphics buffer with the specified image.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel offset</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel offset</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>optional frame number</td></tr>
</table>
</p>
<p>
The optional pixel offsets effectively scroll the
tilemap drawn in the direction specified.
</p>
<p>
See <a href=#bbdrawimage>bbDrawImage</a> for more drawing images details.
</p>
See Also: <a href=#bbtileblock>bbTileBlock</a> <a href=#bbdrawimage>bbDrawImage</a>
EndRem
Function TileImage(image,x,y,frame=0)="bbTileImage"

Rem
bbdoc: <p> Similar to <a href=#bbtileimage>bbTileImage</a> but ignores transparency.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel offset</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel offset</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>optional frame number</td></tr>
</table>
</p>
<p>
Use this to tile an entire or portion of the screen
with a single repetitive image.
</p>
EndRem
Function TileBlock(image,x,y,frame=0)="bbTileBlock"

Rem
bbdoc: <p> Sets an image's drawing handle to the specified pixel offset.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel offset</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel offset</td></tr>
</table>
</p>
<p>
An image's handle is an offset added to the pixel
coordinate specified in a <a href=#bbdrawimage>bbDrawImage</a> command.
</p>
<p>
Images typically have their handle set to 0,0 which means
drawing commands draw the image with its top left pixel
at the drawing location specified.
</p>
<p>
The <a href=#bbautomidhandle>bbAutoMidHandle</a> command changes this behavior so that
all subsequent Images are loaded or created with their
handle set to the center of the Image.
</p>
<p>
The <a href=#bbhandleimage>bbHandleImage</a> command is used to position the handle
to any given pixel offset after it has been created.
</p>
<p>
Also See:
MidHandle;AutoMidHandle;DrawImage;RotateImage
</p>
EndRem
Function HandleImage(image,x,y)="bbHandleImage"

Rem
bbdoc: <p> The <a href=#bbmidhandle>bbMidHandle</a> command sets the specified image's handle to the center of the image
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
</table>
See <a href=#bbhandleimage>bbHandleImage</a> for more
details on using image handles.
</p>
See Also: <a href=#bbhandleimage>bbHandleImage</a>
EndRem
Function MidHandle(image)="bbMidHandle"

Rem
bbdoc: <p> Enabling <a href=#bbautomidhandle>bbAutoMidHandle</a> causes all subsequent loaded and created images to have their handles initialized to the center of the image.
about:
<table class="arg">
<tr><td class=argname>enable</td><td class=argvalue>True to enable automtic MidHandles, False to disable</td></tr>
</table>
</p>
<p>
The default setting of the AutoMidHandle setting is disabled
which dictates all newly create images have their handles set
to the top left pixel position of the image.
</p>
See Also: <a href=#bbmidhandle>bbMidHandle</a>
EndRem
Function AutoMidHandle(enable)="bbAutoMidHandle"

Rem
bbdoc: <p> Returns the horizontal pixel position of an image's handle.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
</table>
</p>
See Also: <a href=#bbimageyhandle>bbImageYHandle</a> <a href=#bbhandleimage>bbHandleImage</a>
EndRem
Function ImageXHandle(image)="bbImageXHandle"

Rem
bbdoc: <p> Returns the vertical pixel position of an image's handle.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
</table>
</p>
See Also: <a href=#bbimagexhandle>bbImageXHandle</a> <a href=#bbhandleimage>bbHandleImage</a>
EndRem
Function ImageYHandle(image)="bbImageYHandle"

Rem
bbdoc: <p> Returns an identical copy of the specified image.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
</table>
</p>
See Also: <a href=#bbfreeimage>bbFreeImage</a>
EndRem
Function CopyImage(image)="bbCopyImage"

Rem
bbdoc: <p> Copies pixels at the specified offset in the current graphics buffer to the image specified.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>left most horizontal pixel position to grab from</td></tr>
<tr><td class=argname>y</td><td class=argvalue>top most vertical pixel position to grab from</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>optional frame in which to store grabbed pixels</td></tr>
</table>
</p>
<p>
<a href=#bbgrabimage>bbGrabImage</a> is a useful way of capturing the result of
a sequence of drawing commands in an image's pixel
buffer.
</p>
See Also: <a href=#bbcreateimage>bbCreateImage</a> <a href=#bbdrawimage>bbDrawImage</a>
EndRem
Function GrabImage(image,x,y,frame=0)="bbGrabImage"

Rem
bbdoc: <p> The <a href=#bbimagebuffer>bbImageBuffer</a> function returns a graphics buffer that can be used with such commands as <a href=#bbsetbuffer>bbSetBuffer</a> and <a href=#bblockbuffer>bbLockBuffer</a>.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>optional animation frame</td></tr>
</table>
</p>
See Also: <a href=#bbsetbuffer>bbSetBuffer</a> <a href=#bblockbuffer>bbLockBuffer</a>
EndRem
Function ImageBuffer(image,frame=0)="bbImageBuffer"

Rem
bbdoc: <p> The <a href=#bbscaleimage>bbScaleImage</a> function returns a copy of an image scaled in each axis by the specified factors.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>xscale#</td><td class=argvalue>horizontal scale factor</td></tr>
<tr><td class=argname>yscale#</td><td class=argvalue>vertical scale factor</td></tr>
</table>
</p>
<p>
A negative scale factor also causes the resulting image to be
flipped in that axis, i.e. ScaleImage image,1,-1 will return
a copy of image flipped vertically. Other common scale
factors are 2,2 which produce a double sized image and
0.5,0.5 which will produce an image half the size of the
original.
</p>
<p>
The quality of the transformed result can be controlled
with the <a href=#bbtformfilter>bbTFormFilter</a> command.
</p>
<p>
See the <a href=#bbresizeimage>bbResizeImage</a> command for a similar command that
uses a target image size to calculate scale factors.
</p>
<p class="hint">
This command is not particularly fast and hence like loading
it is recomended images are scaled before a game level
commences.
</p>
See Also: <a href=#bbresizeimage>bbResizeImage</a> <a href=#bbrotateimage>bbRotateImage</a> <a href=#bbtformfilter>bbTFormFilter</a> <a href=#bbtformimage>bbTFormImage</a>
EndRem
Function ScaleImage(image,xscale#,yscale#)="bbScaleImage"

Rem
bbdoc: <p> The <a href=#bbresizeimage>bbResizeImage</a> function returns a copy of the specified image scaled to the specified pixel dimensions.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>width#</td><td class=argvalue>horizontal pixel size of new image</td></tr>
<tr><td class=argname>height#</td><td class=argvalue>vertical pixel size of new image</td></tr>
</table>
</p>
<p class="hint">
This command is not particularly fast and hence like loading
it is recomended images are sized before a game level
commences.
</p>
See Also: <a href=#bbscaleimage>bbScaleImage</a> <a href=#bbrotateimage>bbRotateImage</a> <a href=#bbtformfilter>bbTFormFilter</a>
EndRem
Function ResizeImage(image,width#,height#)="bbResizeImage"

Rem
bbdoc: <p> The RotateImage function creates a new image by copying the specified image and rotating it <b>angle</b> degrees around its current handle.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>angle#</td><td class=argvalue>angle in degree to rotate the image clockwise</td></tr>
</table>
</p>
<p class="hint">
This command is not particularly fast and hence like loading
it is recomended images are prerotated before a game level
commences.
</p>
See Also: <a href=#bbhandleimage>bbHandleImage</a> <a href=#bbscaleimage>bbScaleImage</a> <a href=#bbtformimage>bbTFormImage</a> <a href=#bbtformfilter>bbTFormFilter</a>
EndRem
Function RotateImage(image,angle#)="bbRotateImage"

Rem
bbdoc: <p> The <a href=#bbtformimage>bbTFormImage</a> function is similar in function to the <a href=#bbscaleimage>bbScaleImage</a> and <a href=#bbrotateimage>bbRotateImage</a> functions where the image returned is a transformed copy of the original image </p> <p> Instead of using a scale factor or angle of rotation, <a href=#bbtformimage>bbTFormImage</a> accepts 4 values that define a 2x2 matrix that allows the resultant copy to be the product of a transform that is a combination of both scale and rotation.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>m11#</td><td class=argvalue>first element of 2x2 matrix</td></tr>
<tr><td class=argname>m12#</td><td class=argvalue>second element of 2x2 matrix</td></tr>
<tr><td class=argname>m21#</td><td class=argvalue>third element of 2x2 matrix</td></tr>
<tr><td class=argname>m22#</td><td class=argvalue>fourth element of 2x2 matrix</td></tr>
</table>
</p>
<p>
<a href=#bbtformimage>bbTFormImage</a> is also useful for shearing an Image.
</p>
<p class="hint">
This command is not particularly fast and hence like loading
it is recomended images are transformed before a game level
commences.
</p>
See Also: <a href=#bbhandleimage>bbHandleImage</a> <a href=#bbscaleimage>bbScaleImage</a> <a href=#bbrotateimage>bbRotateImage</a> <a href=#bbtformfilter>bbTFormFilter</a>
EndRem
Function TFormImage(image,m11#,m12#,m21#,m22#)="bbTFormImage"

Rem
bbdoc: <p> The <a href=#bbtformfilter>bbTFormFilter</a> command controls the quality of transformation achieved when using the <a href=#bbscaleimage>bbScaleImage</a>, <a href=#bbrotateimage>bbRotateImage</a> and <a href=#bbtformimage>bbTFormImage</a> commands.
about:
<table class="arg">
<tr><td class=argname>enable</td><td class=argvalue>True to enable filtering, False to disable</td></tr>
</table>
</p>
<p>
Use a paramter of True to enable filtering, which although
slower produces a higher quality result.
</p>
See Also: <a href=#bbscaleimage>bbScaleImage</a> <a href=#bbrotateimage>bbRotateImage</a> <a href=#bbtformimage>bbTFormImage</a>
EndRem
Function TFormFilter(enable)="bbTFormFilter"

Rem
bbdoc: <p> <a href=#bbrectsoverlap>bbRectsOverlap</a> returns True if the two rectangular regions described overlap.
about:
<table class="arg">
<tr><td class=argname>x1</td><td class=argvalue>top left horizontal position of first rectangle</td></tr>
<tr><td class=argname>y1</td><td class=argvalue>top left vertical position of first rectangle</td></tr>
<tr><td class=argname>w1</td><td class=argvalue>width of first rectangle</td></tr>
<tr><td class=argname>h1</td><td class=argvalue>height of first rectangle</td></tr>
<tr><td class=argname>x2</td><td class=argvalue>top left horizontal position of second rectangle</td></tr>
<tr><td class=argname>y2</td><td class=argvalue>top left vertical position of seconf rectangle</td></tr>
<tr><td class=argname>w2</td><td class=argvalue>width of second rectangle</td></tr>
<tr><td class=argname>h2</td><td class=argvalue>height of second rectangle</td></tr>
</table>
</p>
EndRem
Function RectsOverlap(x1,y1,w1,h1,x2,y2,w2,h2)="bbRectsOverlap"

Rem
bbdoc: <p> The <a href=#bbimagesoverlap>bbImagesOverlap</a> function returns True if image1 drawn at the specified pixel location would overlap with image2 if drawn at its specified location.
about:
<table class="arg">
<tr><td class=argname>image1</td><td class=argvalue>first image to test</td></tr>
<tr><td class=argname>x1</td><td class=argvalue>image1's x location</td></tr>
<tr><td class=argname>y1</td><td class=argvalue>image1's y location</td></tr>
<tr><td class=argname>image2</td><td class=argvalue>second image to test</td></tr>
<tr><td class=argname>x2</td><td class=argvalue>image2's x location</td></tr>
<tr><td class=argname>y2</td><td class=argvalue>image2's y location</td></tr>
</table>
</p>
<p>
<a href=#bbimagesoverlap>bbImagesOverlap</a> does not take into account any transparent pixels and
hence is faster but less accurate than the comparable <a href=#bbimagescollide>bbImagesCollide</a>
function.
</p>
See Also: <a href=#bbimagescollide>bbImagesCollide</a>
EndRem
Function ImagesOverlap(image1,x1,y1,image2,x2,y2)="bbImagesOverlap"

Rem
bbdoc: <p> Unlike <a href=#bbimagesoverlap>bbImagesOverlap</a>, <a href=#bbimagescollide>bbImagesCollide</a> does respect transparent pixels in the source images and will only return True if actual solid pixels would overlap if the images were drawn in the specified locations.
about:
<table class="arg">
<tr><td class=argname>image1</td><td class=argvalue>first image to test</td></tr>
<tr><td class=argname>x1</td><td class=argvalue>image1's x location</td></tr>
<tr><td class=argname>y1</td><td class=argvalue>image1's y location</td></tr>
<tr><td class=argname>frame1</td><td class=argvalue>image1's frame to test (optional)</td></tr>
<tr><td class=argname>image2</td><td class=argvalue>second image to test</td></tr>
<tr><td class=argname>x2</td><td class=argvalue>image2's x location</td></tr>
<tr><td class=argname>y2</td><td class=argvalue>image2's y location</td></tr>
<tr><td class=argname>frame2</td><td class=argvalue>image2's frame to test (optional)</td></tr>
</table>
</p>
<p>
As <a href=#bbimagescollide>bbImagesCollide</a> tests actual pixels from the two images it
is slower but more exact than the <a href=#bbimagesoverlap>bbImagesOverlap</a> function.
</p>
See Also: <a href=#bbimagesoverlap>bbImagesOverlap</a> <a href=#bbrectsoverlap>bbRectsOverlap</a>
EndRem
Function ImagesCollide(image1,x1,y1,frame1,image2,x2,y2,frame2)="bbImagesCollide"

Rem
bbdoc: <p> The <a href=#bbimagerectoverlap>bbImageRectOverlap</a> function returns True if the image specified drawn at the location specified would overlap with the rectangle described.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location of image</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location of image</td></tr>
<tr><td class=argname>rectx</td><td class=argvalue>horizontal pixel location of rect</td></tr>
<tr><td class=argname>recty</td><td class=argvalue>vertical pixel location of rect</td></tr>
<tr><td class=argname>rectw</td><td class=argvalue>width of the rect</td></tr>
<tr><td class=argname>recth</td><td class=argvalue>height of the rect</td></tr>
</table>
</p>
<p>
<a href=#bbimagerectoverlap>bbImageRectOverlap</a> perform a fast rectangular based test ignoring
the shape of any image mask, see <a href=#bbimagerectcollide>bbImageRectCollide</a> for a more
exact collision test.
</p>
See Also: <a href=#bbimagesoverlap>bbImagesOverlap</a> <a href=#bbrectsoverlap>bbRectsOverlap</a> <a href=#bbimagerectcollide>bbImageRectCollide</a>
EndRem
Function ImageRectOverlap(image,x,y,rectx,recty,rectw,recth)="bbImageRectOverlap"

Rem
bbdoc: <p> The <a href=#bbimagerectcollide>bbImageRectCollide</a> function returns True if the image specified drawn at the location specified will result in any non transparent pixels being drawn inside the rectangle described.
about:
<table class="arg">
<tr><td class=argname>image</td><td class=argvalue>a valid image handle</td></tr>
<tr><td class=argname>x</td><td class=argvalue>horizontal pixel location of image</td></tr>
<tr><td class=argname>y</td><td class=argvalue>vertical pixel location of image</td></tr>
<tr><td class=argname>frame</td><td class=argvalue>image's frame</td></tr>
<tr><td class=argname>rectx</td><td class=argvalue>horizontal pixel location of rect</td></tr>
<tr><td class=argname>recty</td><td class=argvalue>vertical pixel location of rect</td></tr>
<tr><td class=argname>rectw</td><td class=argvalue>width of the rect</td></tr>
<tr><td class=argname>recth</td><td class=argvalue>height of the rect</td></tr>
</table>
</p>
<p>
Because <a href=#bbimagerectcollide>bbImageRectCollide</a> respects the transparent pixels in an
image's mask it is slower but more accurate than using the
<a href=#bbimagerectoverlap>bbImageRectOverlap</a> command.
</p>
See Also: <a href=#bbimagerectoverlap>bbImageRectOverlap</a>
EndRem
Function ImageRectCollide(image,x,y,frame,rectx,recty,rectw,recth)="bbImageRectCollide"

Rem
bbdoc: <p> Returns the currently selected graphics buffer.
about:
</p>
<p>
The <a href=#bbgraphicsbuffer>bbGraphicsBuffer</a> function is useful for storing the current
graphics buffer so it can be restored later.
</p>
<p>
See <a href=#bbsetbuffer>bbSetBuffer</a> for more information.
</p>
See Also: <a href=#bbsetbuffer>bbSetBuffer</a> <a href=#bbfrontbuffer>bbFrontBuffer</a> <a href=#bbbackbuffer>bbBackBuffer</a> <a href=#bbimagebuffer>bbImageBuffer</a>
EndRem
Function GraphicsBuffer()="bbGraphicsBuffer"

Rem
bbdoc: <p> Instead of calling <a href=#bbloadimage>bbLoadImage</a> and creating a new image the <a href=#bbloadbuffer>bbLoadBuffer</a> command reads the contents of a valid image file into the contents of an existing image, texture or if required the front or back buffer of the current display.
about:
<table class="arg">
<tr><td class=argname>buffer</td><td class=argvalue>a valid graphics buffer</td></tr>
<tr><td class=argname>filename$</td><td class=argvalue>the filename of an existing image file</td></tr>
</table>
</p>
EndRem
Function LoadBuffer(buffer:TBuffer,filename$z)="bbLoadBuffer"

Rem
bbdoc: <p> The <a href=#bbsavebuffer>bbSaveBuffer</a> function is similar to the <a href=#bbsaveimage>bbSaveImage</a> function in that it creates a .bmp image file with the specified <b>filename.</b> </p> <p> Unlike <a href=#bbsaveimage>bbSaveImage</a>, <a href=#bbsavebuffer>bbSaveBuffer</a> uses the pixels from the specified graphics buffer and so is useful for making screenshots.
about:
<table class="arg">
<tr><td class=argname>buffer</td><td class=argvalue>a valid graphics buffer</td></tr>
<tr><td class=argname>filename$</td><td class=argvalue>a legal filename</td></tr>
</table>
</p>
<p class="hint">
The .bmp suffix should be included at the end of the filename if the
image file created by <a href=#bbsavebuffer>bbSaveBuffer</a> is to be recognized as a valid image
by the system and other applications.
</p>
See Also: <a href=#bbsaveimage>bbSaveImage</a> <a href=#bbsetbuffer>bbSetBuffer</a>
EndRem
Function SaveBuffer(buffer:TBuffer,filename$z)="bbSaveBuffer"

Rem
bbdoc: Mark a buffer as dirty
End Rem
Function BufferDirty(buffer)="bbBufferDirty"


Rem
bbdoc: <p> The <a href=#bbcountgfxmodes>bbCountGfxModes</a> function returns the number of graphics modes supported by the current graphics driver.
about:
</p>
<p>
Use the <a href=#bbgfxmodewidth>bbGfxModeWidth</a>, <a href=#bbgfxmodeheight>bbGfxModeHeight</a> and <a href=#bbgfxmodedepth>bbGfxModeDepth</a> to obtain
information about each mode for use with the <a href=#bbgraphics>bbGraphics</a> command.
</p>
<p>
Legal graphics modes for these functions are numbered from 1 up
to and including the value returned by <a href=#bbcountgfxmodes>bbCountGfxModes</a>.
</p>
<p class="hint">
Use <a href=#bbcountgfxmodes3d>bbCountGfxModes3D</a>() instead if <a href=#bbgraphics3d>bbGraphics3D</a> use is required as older
hardware may support 3D acceleration on only a subset of its video modes.
</p>
See Also: <a href=#bbgfxmodewidth>bbGfxModeWidth</a> <a href=#bbgfxmodeheight>bbGfxModeHeight</a> <a href=#bbgfxmodedepth>bbGfxModeDepth</a> <a href=#bbgraphics>bbGraphics</a> <a href=#bbsetgfxdriver>bbSetGfxDriver</a> <a href=#bbcountgfxmodes3d>bbCountGfxModes3D</a>
EndRem
Function CountGfxModes()="bbCountGfxModes"

Rem
bbdoc: <p> Returns the width in pixels of the specified graphics mode where mode is a value from 1 up to and including the result of the CountGfxModes() Function.
about:
</p>
See Also: <a href=#bbcountgfxmodes>bbCountGfxModes</a> <a href=#bbgfxmodeheight>bbGfxModeHeight</a> <a href=#bbgfxmodedepth>bbGfxModeDepth</a>
EndRem
Function GfxModeWidth(mode)="bbGfxModeWidth"

Rem
bbdoc: <p> Returns the height in pixels of the specified graphics mode where mode is a value from 1 up to and including the result of the CountGfxModes() Function.
about:
</p>
See Also: <a href=#bbcountgfxmodes>bbCountGfxModes</a> <a href=#bbgfxmodeheight>bbGfxModeHeight</a> <a href=#bbgfxmodedepth>bbGfxModeDepth</a>
EndRem
Function GfxModeHeight(mode)="bbGfxModeHeight"

Rem
bbdoc: <p> Returns the depth in pixels of the specified graphics mode where mode is a value from 1 up to and including the result of the CountGfxModes() Function.
about:
</p>
See Also: <a href=#bbcountgfxmodes>bbCountGfxModes</a> <a href=#bbgfxmodeheight>bbGfxModeHeight</a> <a href=#bbgfxmodedepth>bbGfxModeDepth</a>
EndRem
Function GfxModeDepth(mode)="bbGfxModeDepth"

Rem
bbdoc: <p> Returns True if the resolution specified is supported by the current graphics driver
about:
<table class="arg">
<tr><td class=argname>width</td><td class=argvalue>width in pixels</td></tr>
<tr><td class=argname>height</td><td class=argvalue>height in pixels</td></tr>
<tr><td class=argname>depth</td><td class=argvalue>color depth in bits</td></tr>
</table>
Calling <a href=#bbgraphics>bbGraphics</a> with settings that
cause this function to return False
to halt.
</p>
<p>
For more information see <a href=#bbgraphics>bbGraphics</a>.
</p>
<p>
For an alternative method for verifying legal resolutions
see the <a href=#bbcountgfxmodes>bbCountGfxModes</a> function.
</p>
See Also: <a href=#bbgraphics>bbGraphics</a> <a href=#bbcountgfxmodes>bbCountGfxModes</a>
EndRem
Function GfxModeExists(width,height,depth)="bbGfxModeExists"

Rem
bbdoc: <p> <a href=#bbcountgfxdrivers>bbCountGfxDrivers</a> returns the number of graphcis drivers connected to the system.
about:
</p>
<p>
The <a href=#bbsetgfxdriver>bbSetGfxDriver</a> command is used to change the current graphics driver.
</p>
<p>
A return value of larger than 1 means a secondary monitor is present
and your program may wish to give the user an option for it to be used
for the purposes of playing your game.
</p>
See Also: <a href=#bbgfxdrivername>bbGfxDriverName</a> <a href=#bbsetgfxdriver>bbSetGfxDriver</a>
EndRem
Function CountGfxDrivers()="bbCountGfxDrivers"

Rem
bbdoc: <p> The <a href=#bbgfxdrivername>bbGfxDriverName</a> function returns the name of the graphics driver at the specified index.
about:
<table class="arg">
<tr><td class=argname>index</td><td class=argvalue>index number of display device</td></tr>
</table>
</p>
<p>
The index parameter should be in the range of 1 up to and
including the value returned by <a href=#bbcountgfxdrivers>bbCountGfxDrivers</a>.
</p>
See Also: <a href=#bbcountgfxdrivers>bbCountGfxDrivers</a> <a href=#bbsetgfxdriver>bbSetGfxDriver</a>
EndRem
Function GfxDriverName$z(index)="bbGfxDriverName"

Rem
bbdoc: <p> The <a href=#bbsetgfxdriver>bbSetGfxDriver</a> command is used to change the current graphics driver.
about:
<table class="arg">
<tr><td class=argname>index</td><td class=argvalue>index number of display device</td></tr>
</table>
</p>
<p>
The current graphics driver dictates which display device is used on
a multimonitor system when the <a href=#bbgraphics>bbGraphics</a> command is used. It also
affects the graphics modes reported by <a href=#bbcountgfxmodes>bbCountGfxModes</a>.
</p>
<p>
The index parameter should be in the range of 1 up to and
including the value returned by <a href=#bbcountgfxdrivers>bbCountGfxDrivers</a>.
</p>
See Also: <a href=#bbgraphics>bbGraphics</a> <a href=#bbcountgfxdrivers>bbCountGfxDrivers</a> <a href=#bbcountgfxmodes>bbCountGfxModes</a>
EndRem
Function SetGfxDriver(index)="bbSetGfxDriver"

EndExtern
