uniform highp mat4 u_ModelViewMatrix;

attribute vec4 a_Position;
attribute vec4 a_Color;

varying lowp vec4 frag_Color;

void main(void){
    gl_Position = u_ModelViewMatrix * a_Position;
    frag_Color = a_Color;
}