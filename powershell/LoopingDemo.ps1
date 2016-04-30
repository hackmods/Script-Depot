[String] $result = ""; #hold string
[String]$temp = "Sample String" #Change input

for($x=0;$x -lt 3; $x++) #loop though 3 rows
{
    if($x -eq 1) #if element 1 (2nd loop)
    {
        $result += "* $temp * `n"
    }
    else #form dynamic flowerbox
    {
        for($y=0;$y -lt $temp.Length + 4; $y++) # output for length + 4 for boarder
        {
            $result += "*"
        }
        $result += "`n"
    }
}
$result #output string