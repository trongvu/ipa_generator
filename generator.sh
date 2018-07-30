#!/bin/bash
VERSION=0.1
AUTHOR=vungoctrong@gmail.com

DATE=`date '+%Y-%m-%d_%H%M%S'`
APP_NAME=MyApp
#build xarchive file
xcodebuild -workspace $APP_NAME.xcworkspace -scheme $APP_NAME -sdk iphoneos archive -archivePath $APP_NAME.xcarchive

#build IPA file with development provisioning file
xcodebuild -exportArchive -archivePath $APP_NAME*.xcarchive -exportPath tmp -exportOptionsPlist ExportOptions.plist

#re-generate IPA file
cd tmp
mv $APP_NAME.ipa $APP_NAME.zip
unzip -qo $APP_NAME.zip
rm -rf $APP_NAME.zip

#adding Swift support folder (copy from xarchive file to IPA)
cp -R ../$APP_NAME*.xcarchive/SwiftSupport .
#replace Frameworks folder
rm -rf Payload/*.app/Frameworks/
cp -R ../$APP_NAME*.xcarchive/Products/Applications/*.app/Frameworks Payload/*.app/

#zipping
zip -qr $APP_NAME.zip Payload SwiftSupport
mv $APP_NAME.zip ../${APP_NAME}_${DATE}.ipa

cd ..
echo "IPA file @ `pwd`/${APP_NAME}_${DATE}.ipa"
rm -rf *.xcarchive
rm -rf tmp
echo "**IPA GENERATED**"
