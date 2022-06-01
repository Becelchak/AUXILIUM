using Godot;
using System;

public class Chapter_I : Node2D
{
    public override void _Ready()
    {
        var dialogI = DialogicSharp.Start("Chapter_I", "Chapter_I", false);
        AddChild(dialogI);
    }

}
