package
{

import flash.display.*;
import flash.events.Event;
import flash.media.Sound;

import spark.components.Label;

public class Saite extends Shape
    { 
 
private var xpos: Number;

// String length
private var len: Number=100.0;

// String vibrational constants
private var M: Number = 0.1;   // Mass
private var K: Number = 0.2;   // Hooke's constant
private var D: Number = 0.92;  // Damping
   
// vibrational variables

private var pos: Number = 0;     // Position
private var vel: Number = 0;     // Velocity
private var acc: Number = 0;     // Acceleration
private var f: Number = 0;       // Force
private var ps0: Number = 10.0;  // pluck displacement

private var tone:Sound;

public var colour:int= 0xaaaaaa;
private var monitor:Label;
private var saiten:Vector.<Saite>;


public function Saite(monitor:Label,saiten:Vector.<Saite>, xpos:Number, tone: Sound){        
   super();
   this.monitor=monitor;
   this.saiten=saiten;
   this.xpos=xpos;
   this.tone=tone;
 
  draw();

}

public function setColour(colour:int):void { 
this.colour=colour;
draw();
}

        
private function update(event:Event):void { 

    f = -K * pos;    // f=-ky
    acc = f / M;           // Set the acceleration, f=ma == a=f/m
    vel = D * (vel + acc);   // Set the velocity
    pos = pos + vel;         // Updated position

    draw(); 
   this.graphics.moveTo(xpos, 0);   
}

private  function draw():void  
 { 
   this.graphics.clear();
   this.graphics.lineStyle(2, colour, .75);

   if (!isVibrating()) {
    pos=0; vel=0;
    this.graphics.lineStyle(2, colour+200, .75);
    this.removeEventListener(Event.ENTER_FRAME, update);

    if (!checkMonitor()) monitor.text="";
     }
   
   this.graphics.moveTo(xpos, 0);   
   this.graphics.curveTo(xpos+pos, len/2, xpos,len);

  
 } 
 

private function checkMonitor(): Boolean {
 for (var i:uint = 0; i < saiten.length; i++) { 
       if (saiten[i].isVibrating()) return true;
          }
  return false;
}


public function pluck(): void 
  {
   pos=ps0;
   tone.play(200,0);
  this.addEventListener(Event.ENTER_FRAME, update);
}




public function isVibrating(): Boolean
 {
  // stored energy KE+PE relative to initial pluck energy 
  
  var energy:Number=(M*vel*vel/K + pos*pos)/ps0/ps0;
  if (energy>0.01)return true; else return false;
  
}

}
}


