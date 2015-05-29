//
//  Shader.fsh
//  beeautiful
//
//  Created by Christopher McFee on 5/28/15.
//  Copyright (c) 2015 java tigers. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
