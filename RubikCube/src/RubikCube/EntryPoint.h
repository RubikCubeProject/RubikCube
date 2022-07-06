#pragma once

#ifdef RC_PLATFORM_WINDOWS

extern RubikCube::Application* RubikCube::CreateApplication();

int main(int argc, char** argv)
{
	RubikCube::Log::Init();
	RC_CORE_WARN("Initialized Log!");
	int a = 5;
	RC_INFO("Hello! Var={0}", a);

	auto app = RubikCube::CreateApplication();
	app->Run();
	delete app;
}

#endif
