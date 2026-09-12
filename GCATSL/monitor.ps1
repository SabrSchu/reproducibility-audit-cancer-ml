param(
    [int]$IntervalSeconds = 1,
    [string]$OutputFile = "output/resource_measurements.csv"
)

$maxRamGB = 0
$maxGpuMemoryGB = 0

"Timestamp,RAM_GB,GPU_Memory_GB" | Out-File $OutputFile

while ($true) {

    # measuring the RAM currently in use
    $computer = Get-CimInstance Win32_OperatingSystem

    $totalRamGB = $computer.TotalVisibleMemorySize / 1MB
    $freeRamGB = $computer.FreePhysicalMemory / 1MB
    $usedRamGB = $totalRamGB - $freeRamGB

    # measuring the GPU memory usage
    $gpu = Get-Counter '\GPU Process Memory(*)\Dedicated Usage' -ErrorAction SilentlyContinue

    $gpuMemoryGB = 0

    if ($gpu) {
        $gpuMemoryBytes = ($gpu.CounterSamples |
            Measure-Object -Property CookedValue -Sum).Sum

        $gpuMemoryGB = $gpuMemoryBytes / 1GB
    }

    if ($usedRamGB -gt $maxRamGB) {
        $maxRamGB = $usedRamGB
    }

    if ($gpuMemoryGB -gt $maxGpuMemoryGB) {
        $maxGpuMemoryGB = $gpuMemoryGB
    }

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    "$timestamp,$usedRamGB,$gpuMemoryGB" |
        Add-Content $OutputFile

    Start-Sleep -Seconds $IntervalSeconds
}