#pragma once

#ifdef AN_PLATFORM_WINDOWS
	#ifdef AN_BUILD_DLL
		#define ANANAS_API __declspec(dllexport)
	#else
		#define ANANAS_API __declspec(dllimport)
	#endif
#else
	#error Ananas only supports Windows!
#endif

#define BIT(x) (1 << x)