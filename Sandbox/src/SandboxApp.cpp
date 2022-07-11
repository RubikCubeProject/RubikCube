#include "RubikCube.h"

class ExampleLayer : public RubikCube::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		RC_INFO("ExampleLayer::Update");

		if(RubikCube::Input::IsKeyPressed(RC_KEY_TAB))
		RC_TRACE("Tab key is pressed (poll)!");
	}

	void OnEvent(RubikCube::Event& event) override
	{
		if (event.GetEventType() == RubikCube::EventType::KeyPressed)
		{
			RubikCube::KeyPressedEvent& e = (RubikCube::KeyPressedEvent&)event;
			if (e.GetKeyCode() == RC_KEY_TAB)
				RC_TRACE("Tab key is pressed (event)!");
			RC_TRACE("{0}", (char)e.GetKeyCode());
		}
	}

};
class Sandbox : public RubikCube::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new RubikCube::ImGuiLayer());
	}

	~Sandbox()
	{

	}

};

RubikCube::Application* RubikCube::CreateApplication()
{
	return new Sandbox();
}