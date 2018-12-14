#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    
    //TEXT
    myFont.load("SpaceMono-Regular-copy.ttf", 100);
    myWidth = myFont.stringWidth("HexCode");
    text = "HexCode";
    
    //PHOTO
    screenshot[0].load("IMG_8333.jpg");
    screenshot[1].load("IMG_8334.jpg");
    screenshot[2].load("IMG_8335.jpg");
    
    origin[0].set(0,1700);
    origin[1].set(360,1700);
    origin[2].set(720,1700);
    currentSection=0;
    for (int i=0; i<NUM_SECTIONS;i++){
        button[i].set(origin[i],360,220);
    }
}

//--------------------------------------------------------------
void ofApp::update(){
//    for(int i=0;i<NUM_SECTIONS;i++){
//        pixels= screenshot[i].getPixels();
//    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    //DRAW LINE
    ofDrawLine(0,1700,ofGetWidth(),1700);
    
    //DRAW TEXT
    ofColor(myColor.r+50,myColor.g+50,myColor.b+50);
    myFont.drawString(text, ofGetWidth()/2-myWidth/2, 1520);
    myFont.drawString(redText, ofGetWidth()/2-225, 1520);
    myFont.drawString(greenText, ofGetWidth()/2-75, 1520);
    myFont.drawString(blueText, ofGetWidth()/2+75, 1520);
    
    //DRAW PHOTO
    ofSetColor(255);
    screenshot[currentSection].draw(0,0);
    for(int i=0;i<NUM_SECTIONS;i++){
        ofNoFill();
        ofSetColor(0,0,0);
        ofDrawRectangle(button[i]);
    }
}

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    if(touch.y>1700){
    for(int i=0;i<NUM_SECTIONS;i++){
        if(button[i].inside(touch)) currentSection=i;
    }
    } else {
        //DISAPPEAR TITLE
        text=" ";
        
        //GET COLOR OF PIXELS
        pixels= screenshot[currentSection].getPixels();
        myColor.set(pixels.getColor(touch.x, touch.y));
       
        //COLOR AS INTS
        int red = int(myColor.r);
        int green = int(myColor.g);
        int blue = int(myColor.b);
        cout << "R:" << red << " G:"<< green << " B:" << blue << endl;
        
        //HEX CONVERSION
        std::stringstream stringRed;
        stringRed << std::hex << red; // int decimal_value
        std::string redHex ( stringRed.str() );
        std::stringstream stringGreen;
        stringGreen << std::hex << green; // int decimal_value
        std::string greenHex ( stringGreen.str() );
        std::stringstream stringBlue;
        stringBlue << std::hex << blue; // int decimal_value
        std::string blueHex ( stringBlue.str() );
        cout << "R:" << redHex << " G:"<< greenHex << " B:" << blueHex << endl;
        
        //TEXT
        redText=redHex;
        greenText=greenHex;
        blueText=blueHex;
        
        //BACKGROUND
        ofBackground(myColor.r, myColor.g, myColor.b);
        
    }
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}
