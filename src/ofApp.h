#pragma once

#include "ofxiOS.h"

#define NUM_SECTIONS 3

class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    int redC;
    int greenC;
    int blueC;
    ofVec2f touchPoint;
    int hexColor;
    ofTrueTypeFont myFont;
    string text, redText,greenText,blueText;
    float myWidth;
    ofImage exampleImage;
    ofPixels pixels;
    ofColor myColor;
    
    ofImage screenshot[NUM_SECTIONS];
    ofRectangle button[NUM_SECTIONS];
    ofVec2f origin[NUM_SECTIONS];
    int currentSection;
};


