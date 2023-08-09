pragma circom 2.0.0;

template Multiplier3 () {  
   // Signal inputs
   signal input a;
   signal input b;
   signal input c;

   // Signal from gates
   signal x;
   signal y;

   //  final signal output
   signal output Q;

   // component gates used to create assessment circuit
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   // circuit logic
   andGate.a <== a;
   andGate.b <== b;
   x <== andGate.out;

   notGate.in <== b;
   y <== notGate.out;

   orGate.a <== x;
   orGate.b <== y;
   Q <== orGate.out;

   // Verify if c is the multiplication of a and b
   // c should be equal to (a * b) if Q is true
   enforce Q => (c === a * b);

   // print the value of Q on input of a=0 & b=1 & c=0;
   log("Q : ", Q);
}
