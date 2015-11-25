/*#version 330 core


layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;
layout (location = 2) in vec2 texCoord;
out vec3 ourColor;
out vec2 TexCoord;
uniform mat4 transform;
void main()
{
    gl_Position = transform * vec4(position, 1.0f);
    ourColor = color;
    TexCoord = vec2(texCoord.x, 1.0f - texCoord.y);
}


#version 330 core
layout (location = 0) in vec3 position;
layout (location = 2) in vec2 texCoord;

out vec2 TexCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    gl_Position = projection * view * model * vec4(position, 1.0f);
    TexCoord = vec2(texCoord.x, 1.0 - texCoord.y);
}
*/
/*
#version 330 core
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 color;
layout (location = 2) in vec2 texCoord;

out vec3 ourColor;
out vec2 TexCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main() {
    gl_Position = projection * view * model * vec4(position, 1.0f);
    ourColor = color;
    TexCoord = vec2(texCoord.x, 1.0 - texCoord.y);
}
*/
/*
#version 330 core

layout (location = 0) in vec3 position; // 位置变量的属性为0

out vec4 vertexColor; // 为片段着色器指定一个颜色输出

void main() {
    float gray = dot(gl_Color.rgb, vec3(0.299,0.587, 0.114));
    vertexColor = vec4(gray * vec3(1.2, 1.0, 0.8), 1.0);
}

*/

#version 330 core

layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec2 texCoords;
layout (location = 3) in vec4 color;

out vec3 Normal;
out vec3 FragPos;
out vec2 TexCoords;
out vec4 Color;

uniform mat4 model;
uniform mat3 normalMatrix;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    gl_Position = projection * view * model * vec4(position, 1.0f);
    Normal = normalMatrix * normal;
    FragPos = vec3(model * vec4(position, 1.0f));
    TexCoords = texCoords;
    Color = color + vec4(0.0, 1.0, 1.0, 1.0);
}
