#pragma once

#ifdef RC_PLATFORM_WINDOWS

extern RubikCube::Application* RubikCube::CreateApplication();

int main(int argc, char** argv)
{
	printf("RubikCube Engine\n");
	auto app = RubikCube::CreateApplication();
	app->Run();
	delete app;
}

#endif
