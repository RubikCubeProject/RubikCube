#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"

namespace RubikCube {


	class RUBIKCUBE_API Log
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

// Core Log macros
#define RC_CORE_TRACE(...)     ::RubikCube::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define RC_CORE_INFO(...)      ::RubikCube::Log::GetCoreLogger()->info(__VA_ARGS__)
#define RC_CORE_WARN(...)      ::RubikCube::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define RC_CORE_ERROR(...)     ::RubikCube::Log::GetCoreLogger()->error(__VA_ARGS__)
#define RC_CORE_FATAL(...)     ::RubikCube::Log::GetCoreLogger()->fatal(__VA_ARGS__)


// Client Log macros
#define RC_TRACE(...)     ::RubikCube::Log::GetClientLogger()->trace(__VA_ARGS__)
#define RC_INFO(...)      ::RubikCube::Log::GetClientLogger()->info(__VA_ARGS__)
#define RC_WARN(...)      ::RubikCube::Log::GetClientLogger()->warn(__VA_ARGS__)
#define RC_ERROR(...)     ::RubikCube::Log::GetClientLogger()->error(__VA_ARGS__)
#define RC_FATAL(...)     ::RubikCube::Log::GetClientLogger()->fatal(__VA_ARGS__)