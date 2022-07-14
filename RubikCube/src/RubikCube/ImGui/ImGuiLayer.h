#pragma once


#include "RubikCube/Layer.h"

#include "RubikCube/Events/ApplicationEvent.h"
#include "RubikCube/Events/KeyEvent.h"
#include "RubikCube/Events/MouseEvent.h"

namespace RubikCube {

	class RUBIKCUBE_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		virtual void OnAttach() override;
		virtual void OnDetach() override;
		virtual void OnImGuiRender() override;

		void Begin();
		void End();
	private:
		float m_Time = 0.0f;
	};
}