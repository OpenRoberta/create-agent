"%WIX%bin\candle.exe" setup.wxs
"%WIX%bin\light.exe" -out OpenRobertaCreateAgent-0.0.1-setupDE.msi -ext WixUIExtension -cultures:de-DE setup.wixobj
"%WIX%bin\light.exe" -out OpenRobertaCreateAgent-0.0.1-setupEN.msi -ext WixUIExtension -cultures:en-US setup.wixobj
@pause
