class Clock {
  constructor() {
    // 1. Create a Date object.
    this.date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.h = this.date.getHours;
    this.m = this.date.getMinutes;
    this.s = this.date.getSeconds;
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    this._tick();
  }

  printTime() {
    console.log(`${this.date.getHours()}:${this.date.getMinutes()}:${this.date.getSeconds()}`);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    setInterval(() => {
        console.clear()
        // console.log(this)
      this.date.setSeconds(this.date.getSeconds() + 1);
      this.printTime();
    }, 1000);
  }
}

// const clock = new Clock();

Function.prototype.myBind = function(context){
    return (
        () => this.apply(context)
    )
    // or
    // const that = this;
    // return (
    //     function() {
    //         that.apply(context)
    //     }
    // )
}

class Lamp {
    constructor() {
      this.name = "a lamp";
    }
  }
  
  const turnOn = function() {
    console.log("Turning on " + this.name);
  };
  
  const lamp = new Lamp();
  
//   turnOn(); // should not work the way we want it to
  
  const boundTurnOn = turnOn.bind(lamp);
  const myBoundTurnOn = turnOn.myBind(lamp);
  
//   boundTurnOn(); // should say "Turning on a lamp"
//   myBoundTurnOn(); // should say "Turning on a lamp"
  


//---------------------------------------------------------------------------------

Function.prototype.myThrottle = function(interval) {

    let tooSoon = false;
    setInterval(() => {
      if (!tooSoon) {
       tooSoon = true; 
      }
    },interval)

    return (
      () => {
        if (tooSoon) {
          tooSoon = false; 
          this()
        } else {
          // console.log('Too Soon...')
        }
      }
    )
}

//   Using Function#myThrottle, we should be able to throttle
//   the #fire function of our neuron so that it can only fire
//   once every 500ms:
class Neuron {
    fire() {
      console.log("Firing!");
    }
  }
  
const neuron = new Neuron(); 
neuron.fire = neuron.fire.myThrottle(5000);
  
const interval = setInterval(() => {
  neuron.fire();
}, 10);
  
  // This time, if our Function#myThrottle worked correctly,
  // the Neuron#fire function should only be able to execute
  // every 500ms, even though we're still trying to invoke it
  // every 10ms!
  
  // If we want this behavior for ALL neurons, we can do the same logic in the constructor:



  //-
  
