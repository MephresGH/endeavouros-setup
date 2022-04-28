#!/bin/bash
nvidia-settings -a "GpuPowerMizerMode=1" &
nvidia-settings -a "DigitalVibrance=200" &
nvidia-settings -a '[gpu:0]/GPUGraphicsClockOffset[2]=120' &
nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[2]=2000'
