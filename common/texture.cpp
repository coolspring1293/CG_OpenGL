#include <iostream>
//
#include <SOIL.h>
//#include <IL/il.h>
#include <GL/glew.h>
#include "common/texture.h"

void init_texture_loading() {
  glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT );
  glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT );
  glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR );
  glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
  ilInit();
}

GLuint load_texture(const std::string& filename, GLenum target) {
  int width, height;
  std::cout << "loading texture: " << filename << std::endl;
  unsigned char * data = SOIL_load_image(filename.c_str(), &width, &height, 0, SOIL_LOAD_RGBA);
  
  GLuint id;
  glGenTextures(1, &id);
  glBindTexture(target, id);
  glTexImage2D(target, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
  glGenerateMipmap(target);
  SOIL_free_image_data(data);

  glBindTexture(target, 0);
  return id;
}


