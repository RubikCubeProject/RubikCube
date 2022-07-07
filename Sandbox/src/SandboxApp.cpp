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
	}

	void OnEvent(RubikCube::Event& event) override
	{
		RC_TRACE("{0}", event);
	}

};
class Sandbox : public RubikCube::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}

};

RubikCube::Application* RubikCube::CreateApplication()
{
	return new Sandbox();
}