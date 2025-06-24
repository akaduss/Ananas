#pragma once

#ifdef AN_PLATFORM_WINDOWS

extern Ananas::Application* Ananas::CreateApplication();

int main(int argc, char** argv)
{
	auto app = Ananas::CreateApplication();
	app->Run();
	delete app;
}
#endif