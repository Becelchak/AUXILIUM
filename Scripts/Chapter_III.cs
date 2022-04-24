using Godot;
using System;

public class Chapter_III : Node2D
{
    public override void _Ready()
    {
        var dialog = DialogicSharp.Start("Chapter_III", "Chapter_II", false);
        AddChild(dialog);
    }

}
