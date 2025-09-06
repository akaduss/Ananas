#pragma once
#include "Core.h"

namespace Ananas 
{
	class ANANAS_API Application 
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in CLIENT (eg. SandboxApp)
	Application* CreateApplication();
}