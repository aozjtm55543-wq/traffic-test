param(
    [string]$BaseUrl = "http://localhost:8080",
    [int]$Iterations = 200
)

$uri = "$BaseUrl/boards?hashTag=HASH1&subjectLike=hello"
$times = New-Object System.Collections.Generic.List[double]

for ($i = 0; $i -lt $Iterations; $i++) {
    $elapsed = (Measure-Command { Invoke-WebRequest -Uri $uri -UseBasicParsing | Out-Null }).TotalMilliseconds
    $times.Add($elapsed)
}

$avg = ($times | Measure-Object -Average).Average
$min = ($times | Measure-Object -Minimum).Minimum
$max = ($times | Measure-Object -Maximum).Maximum

$sorted = $times | Sort-Object
$index95 = [Math]::Floor(($sorted.Count - 1) * 0.95)
$p95 = $sorted[$index95]

"Iterations: $Iterations"
"Avg(ms): {0:N2}" -f $avg
"Min(ms): {0:N2}" -f $min
"P95(ms): {0:N2}" -f $p95
"Max(ms): {0:N2}" -f $max
