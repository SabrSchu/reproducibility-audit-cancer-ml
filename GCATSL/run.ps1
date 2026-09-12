$IMAGE_NAME = "gcatsl-repo"
$PLATFORM = "linux/amd64"

New-Item -ItemType Directory -Force -Path output | Out-Null

docker build --platform $PLATFORM -t $IMAGE_NAME .

# Starting to monitor resource consumption in a separate PowerShell process (only for windows)
$monitor = Start-Process powershell `
    -ArgumentList "-ExecutionPolicy Bypass -File `"$PWD\monitor.ps1`"" `
    -PassThru

Write-Host "Resource monitor started (PID $($monitor.Id))"

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

try {

    docker run --platform $PLATFORM -it `
      -v "${PWD}/output:/app/output" `
      $IMAGE_NAME `
      python source/main.py `
        --n_epoch 600 `
        --n_head 2 `
        --n_fold 5 `
        --n_node 6375 `
        --n_feature 3 `
        --learning_rate 0.005 `
        --weight_decay 0.0001 `
        --dropout 0.7 `
        --input_dir data/toy_examples/ `
        --output_dir output/ `
        --log_dir output/

}
finally {

    $stopwatch.Stop()

    Stop-Process -Id $monitor.Id -Force

    Write-Host "Resource monitor stopped."
}

Write-Host "Runtime: $($stopwatch.Elapsed.TotalSeconds) seconds"