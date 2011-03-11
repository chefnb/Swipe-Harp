package 
{ 

    import flash.media.Sound; 

    public class Samples{

        [Embed(source="mp3/Eb.mp3")]       
        private var sample_Eb:Class; 

        [Embed(source="mp3/Bb.mp3")]       
        private var sample_Bb:Class; 

        [Embed(source="mp3/F.mp3")]       
        private var sample_F:Class; 

        [Embed(source="mp3/C.mp3")]       
        private var sample_C:Class; 
        [Embed(source="mp3/G.mp3")]       
        private var sample_G:Class; 
        [Embed(source="mp3/D.mp3")]       
        private var sample_D:Class; 
        [Embed(source="mp3/A.mp3")]       
        private var sample_A:Class; 
        [Embed(source="mp3/E.mp3")]       
        private var sample_E:Class; 
        [Embed(source="mp3/B.mp3")]       
        private var sample_B:Class; 
        [Embed(source="mp3/F#.mp3")]       
        private var sample_Fs:Class; 
        [Embed(source="mp3/G#.mp3")]       
        private var sample_Gs:Class; 
        [Embed(source="mp3/C#.mp3")]       
        private var sample_Cs:Class; 
        
        public var co5:Vector.<Sound>;

        public function Samples() {

           co5 = new Vector.<Sound>();

           co5[0] = new sample_Eb() as Sound; 
           co5[1] = new sample_Bb() as Sound; 
           co5[2] = new sample_F() as Sound; 
           co5[3] = new sample_C() as Sound; 
           co5[4] = new sample_G() as Sound; 
           co5[5] = new sample_D() as Sound; 
           co5[6] = new sample_A() as Sound; 
           co5[7] = new sample_E() as Sound; 
           co5[8] = new sample_B() as Sound; 
           co5[9] = new sample_Fs() as Sound; 
          co5[10] = new sample_Cs() as Sound; 
          co5[11] = new sample_Gs() as Sound; 
  

         } 


}
}


