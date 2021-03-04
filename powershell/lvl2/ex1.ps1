$custom_sentence = ""
$sentence = Read-Host -Prompt "Entrez une phrase"
 
$words_arr = $sentence -split " "
 
foreach($word in $words_arr){
 
   $reversed_word = "" 
 
   for ($i=$word.length-1; $i -ge 0; $i--) {
       $reversed_word += $word[$i]  
   } 
 
   $reversed_word += " "
   $custom_sentence += $reversed_word
}
 
Write-Host $custom_sentence -ForegroundColor Green
