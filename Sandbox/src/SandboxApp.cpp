#include <Ananas.h>

class Sandbox : public Ananas::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}

};

Ananas::Application* Ananas::CreateApplication()
{
	return new Sandbox();
}