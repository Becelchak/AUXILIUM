using Godot;
using System;

public class Chapter_II : Node2D
{
    public override void _Ready()
    {
        var dialogII = DialogicSharp.Start("Chapter_II", "Prolog", false);
        AddChild(dialogII);
    }

}
