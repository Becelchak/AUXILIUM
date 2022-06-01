using Godot;
using System;

public class Chapter_II_next : Node2D
{
    public override void _Ready()
    {
        var dialog = DialogicSharp.Start("Dialog2-1", "Dialog2-1", false);
        AddChild(dialog);
    }

}
