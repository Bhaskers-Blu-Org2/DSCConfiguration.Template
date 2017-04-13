configuration Template
{
    <#
        .DESCRIPTION
        DSC Coniguration that uses ConfigData file

        .EXAMPLE
        TemplateWithConfigData -outpath c:\dsc\

        .NOTES
        This configuration requires the corresponding configdata file
    #>

    Import-DscResource -ModuleName 'PSDesiredStateConfiguration','xPSDesiredStateConfiguration'
    
    Node $AllNodes.NodeName
    {
        File testfile
        {
            Ensure          = 'Present'
            DestinationPath = $Node.Path
            Contents        = $Node.Contents
        }

        xGroup testGroup
        {
            Ensure = 'Present'
            GroupName = $Node.GroupName
        }
    }
}
