package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxMath;

class ScoreDisplay extends flixel.FlxBasic
{
    public var score:Int = 0;
    public var misses:Int = 0;
    public var rating:Float = 1.0;
    public var ratingFC:String = "";
    
    var scoreText:FlxText;

    public function new()
    {
        super();
        
        // Cria o texto
        scoreText = new FlxText(0, 0, FlxG.width, "", 16);
        scoreText.setFormat(null, 16, 0xFFFFFFFF, "center");
        scoreText.scrollFactor.set();
        FlxG.state.add(scoreText); // Adiciona à tela
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
        onUpdatePost();
    }

    function onUpdatePost():Void
    {
        var accText:String;

        if (ratingFC == "")
        {
            accText = "Score: " + score + " | Combo Breaks: " + misses + " | Accuracy: 100%";
        }
        else
        {
            var acc:Float = round(rating * 100, 2);
            accText = "Score: " + score + " | Combo Breaks: " + misses + " | Accuracy: " + acc + "% [" + ratingFC + "]";
        }

        scoreText.text = accText;
    }

    function round(x:Float, n:Int):Float
    {
        var factor = Math.pow(10, n);
        return Math.round(x * factor) / factor;
    }
}
