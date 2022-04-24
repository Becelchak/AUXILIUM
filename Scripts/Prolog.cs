using Godot;
using System;

public class Prolog : Node2D
{
	
	public override void _Ready()
	{
		var prolog = DialogicSharp.Start("Prolog", "Prolog", false);
		AddChild(prolog);
    }

}
