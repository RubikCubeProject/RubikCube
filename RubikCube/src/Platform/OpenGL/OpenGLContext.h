#pragma once

#include "RubikCube/Renderer/GraphicsContext.h"

struct GLFWwindow;

namespace RubikCube {

	class OpenGLContext : public GraphicsContext
	{
	public:
		OpenGLContext(GLFWwindow* windowHandle);

		virtual void Init() override;
		virtual void SwapBuffers() override;
	private:
		GLFWwindow* m_WindowHandle;
	};

}