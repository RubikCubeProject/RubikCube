#pragma once

#include "Core.h"


#include "Events/Event.h"
#include "Window.h"
#include "Events/ApplicationEvent.h"

namespace RubikCube {

	class  RUBIKCUBE_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

	private:
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// To be defined in CLIENT
	Application* CreateApplication();
}