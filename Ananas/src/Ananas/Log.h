#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"

namespace Ananas 
{
	class ANANAS_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};

}

//Core Log Macros
#define AN_CORE_TRACE(...) ::Ananas::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define AN_CORE_INFO(...)  ::Ananas::Log::GetCoreLogger()->info(__VA_ARGS__)
#define AN_CORE_WARN(...)  ::Ananas::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define AN_CORE_ERROR(...) ::Ananas::Log::GetCoreLogger()->error(__VA_ARGS__)
#define AN_CORE_FATAL(...) ::Ananas::Log::GetCoreLogger()->fatal(__VA_ARGS__)

//Client Log Macros
#define AN_TRACE(...) ::Ananas::Log::GetClientLogger()->trace(__VA_ARGS__)
#define AN_INFO(...)  ::Ananas::Log::GetClientLogger()->info(__VA_ARGS__)
#define AN_WARN(...)  ::Ananas::Log::GetClientLogger()->warn(__VA_ARGS__)
#define AN_ERROR(...) ::Ananas::Log::GetClientLogger()->error(__VA_ARGS__)
#define AN_FATAL(...) ::Ananas::Log::GetClientLogger()->fatal(__VA_ARGS__)