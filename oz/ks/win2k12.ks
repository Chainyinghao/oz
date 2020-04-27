<?xml version="1.0" encoding="utf-8"?>
<unattend xmlns="urn:schemas-microsoft-com:unattend">
  <settings pass="windowsPE">
    <component name="Microsoft-Windows-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <DiskConfiguration>
    <WillShowUI>OnError</WillShowUI>
    <Disk>
      <CreatePartitions>
        <CreatePartition>
          <Order>1</Order>
          <Size>1</Size>
          <Type>Primary</Type>
        </CreatePartition>
      </CreatePartitions>
      <DiskID>0</DiskID>
      <WillWipeDisk>true</WillWipeDisk>
      <ModifyPartitions>
        <ModifyPartition>
          <Active>true</Active>
          <Extend>true</Extend>
          <Format>NTFS</Format>
          <Label>C drive</Label>
          <Letter>C</Letter>
          <Order>1</Order>
          <PartitionID>1</PartitionID>
        </ModifyPartition>
      </ModifyPartitions>
    </Disk>
      </DiskConfiguration>
      <ImageInstall>
    <OSImage>
      <InstallFrom>
        <MetaData wcm:action="add">
          <Key>/IMAGE/INDEX</Key>
          <Value>1</Value>
        </MetaData>
      </InstallFrom>
      <InstallTo>
        <DiskID>0</DiskID>
        <PartitionID>1</PartitionID>
      </InstallTo>
      <WillShowUI>OnError</WillShowUI>
    </OSImage>
      </ImageInstall>
      <UserData>
    <AcceptEula>true</AcceptEula>
      </UserData>
    </component>
    <component name="Microsoft-Windows-International-Core-WinPE" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <SetupUILanguage>
    <UILanguage>zh-CN</UILanguage>
      </SetupUILanguage>
      <SystemLocale>zh-CN</SystemLocale>
      <UILanguage>zh-CN</UILanguage>
      <UserLocale>zh-CN</UserLocale>
    </component>
  </settings>
  <settings pass="oobeSystem">
    <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <UserAccounts>
    <AdministratorPassword>
      <Value>!QAZ2wsx</Value>
      <PlainText>true</PlainText>
    </AdministratorPassword>
      </UserAccounts>
    <TimeZone>China Standard Time</TimeZone>
      <AutoLogon>
    <Password>
      <Value>!QAZ@wsx</Value>
      <PlainText>true</PlainText>
    </Password>
    <Enabled>true</Enabled>
    <LogonCount>5</LogonCount>
    <Username>Administrator</Username>
      </AutoLogon>
      <RegisteredOwner/>
      <OOBE>
    <HideEULAPage>true</HideEULAPage>
    <ProtectYourPC>3</ProtectYourPC>
      </OOBE>
      <FirstLogonCommands>
    <SynchronousCommand wcm:action="add">
      <Order>1</Order>
      <Description>Shutting down Windows</Description>
      <CommandLine>cmd /C shutdown /s /t 0</CommandLine>
    </SynchronousCommand>
      </FirstLogonCommands>
    </component>
  </settings>
</unattend>

