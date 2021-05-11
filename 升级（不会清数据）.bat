@echo off
cd %~dp0

ECHO.本次不会清楚手机存储数据，按任意键继续...
pause>nul

platform-tools-windows\fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *alioth" || echo Missmatching image and device
platform-tools-windows\fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *alioth" || exit /B 1

platform-tools-windows\fastboot %* flash cmnlib64_ab images\cmnlib64.img
platform-tools-windows\fastboot %* flash cmnlib_ab images\cmnlib.img
platform-tools-windows\fastboot %* flash dsp_ab images\dsp.img
platform-tools-windows\fastboot %* flash xbl_config_ab images\xbl_config.img
platform-tools-windows\fastboot %* flash boot_ab images\boot.img
platform-tools-windows\fastboot %* flash modem_ab images\modem.img
platform-tools-windows\fastboot %* flash vbmeta_system_ab images\vbmeta_system.img
platform-tools-windows\fastboot %* flash tz_ab images\tz.img
platform-tools-windows\fastboot %* flash vbmeta_ab images\vbmeta.img
platform-tools-windows\fastboot %* flash bluetooth_ab images\bluetooth.img
platform-tools-windows\fastboot %* flash abl_ab images\abl.img
platform-tools-windows\fastboot %* flash dtbo_ab images\dtbo.img
platform-tools-windows\fastboot %* flash featenabler_ab images\featenabler.img
platform-tools-windows\fastboot %* flash vendor_boot_ab images\vendor_boot.img
platform-tools-windows\fastboot %* flash keymaster_ab images\keymaster.img
platform-tools-windows\fastboot %* flash uefisecapp_ab images\uefisecapp.img
platform-tools-windows\fastboot %* flash qupfw_ab images\qupfw.img
platform-tools-windows\fastboot %* flash xbl_ab images\xbl.img
platform-tools-windows\fastboot %* flash devcfg_ab images\devcfg.img
platform-tools-windows\fastboot %* flash hyp_ab images\hyp.img
platform-tools-windows\fastboot %* flash imagefv_ab images\imagefv.img
platform-tools-windows\fastboot %* flash aop_ab images\aop.img
platform-tools-windows\fastboot %* erase super
platform-tools-windows\fastboot %* flash super images\super.img

platform-tools-windows\fastboot %* reboot fastboot
platform-tools-windows\fastboot %* flash odm_a images\odm.img
platform-tools-windows\fastboot %* flash system_a images\system.img
platform-tools-windows\fastboot %* flash vendor_a images\vendor.img
platform-tools-windows\fastboot %* flash product_a images\product.img
platform-tools-windows\fastboot %* flash system_ext_a images\system_ext.img

platform-tools-windows\fastboot %* set_active a
platform-tools-windows\fastboot %* reboot
echo.
echo.
echo. 刷机完毕

:Finish
goto Finish