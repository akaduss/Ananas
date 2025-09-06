#pragma once

#ifdef AN_PLATFORM_WINDOWS

extern Ananas::Application* Ananas::CreateApplication();

int main(int argc, char** argv)
{
	Ananas::Log::Init();
	AN_CORE_WARN("Initialized Log!");
	int a = 5;
	AN_INFO("Selam Var={0}",a);

	auto app = Ananas::CreateApplication();
	app->Run();
	delete app;
}
#endif