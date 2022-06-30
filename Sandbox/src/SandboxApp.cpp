#include "RubikCube.h"

class Sandbox : public RubikCube::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}

};

RubikCube::Application* RubikCube::CreateApplication()
{
	return new Sandbox();
}