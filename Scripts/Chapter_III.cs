using Godot;
using System;

public class Chapter_III : Node2D
{
    public override void _Ready()
    {
        var dialogIII = DialogicSharp.Start("Chapter_III", "Chapter_II", false);
        AddChild(dialogIII);
    }

}
