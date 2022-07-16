#include "rcpch.h"
#include "OpenGLContext.h"

#include <GLFW/glfw3.h>
#include <glad/glad.h>
#include <gl/GL.h>

namespace RubikCube {

	OpenGLContext::OpenGLContext(GLFWwindow* windowHandle)
		: m_WindowHandle(windowHandle)
	{
		RC_CORE_ASSERT(windowHandle, "Window Handle is null!")
	}
	void OpenGLContext::Init()
	{
		glfwMakeContextCurrent(m_WindowHandle);
		int status = gladLoadGLLoader((GLADloadproc)glfwGetProcAddress);
		RC_CORE_ASSERT(status, "Failed to intialize Glad!")

		RC_CORE_INFO("OpenGL Info:");
		RC_CORE_INFO("  Vendor: {0}", glGetString(GL_VENDOR));
		RC_CORE_INFO("  Renderer: {0}", glGetString(GL_RENDERER));
		RC_CORE_INFO("  Version: {0}", glGetString(GL_VERSION));
	}
	void OpenGLContext::SwapBuffers()
	{
		glfwSwapBuffers(m_WindowHandle);
	}
}