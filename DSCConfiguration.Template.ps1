configuration TemplateBasic
{
    <#
        .DESCRIPTION
        Basic configuration template

        .EXAMPLE
        TemplateBasic -outpath c:\dsc\

        .NOTES
        This is the most basic configuration and does not take parameters or configdata
    #>

    Import-DscResource -module 'PSDesiredStateConfiguration'
    
    Node localhost
    {
        File testfile
        {
            Ensure          = 'Present'
            DestinationPath = 'c:\file.txt'
            Contents        = 'this is some text'
        }
    }
}

configuration TemplateWithResourceFromGallery
{
    <#
        .DESCRIPTION
        Basic configuration template using resource from PSGallery

        .EXAMPLE
        TemplateWithResourceFromGallery -outpath c:\dsc\

        .NOTES
        This is a very basic configuration that uses the most recent experimental resource from the gallery
    #>

    Import-DscResource -module 'xPSDesiredStateConfiguration'
    
    Node localhost
    {
        xGroup Group1
        {
            GroupName = 'Group1'
            Ensure = 'Present'
        }
    }
}

configuration TemplateWithConfigData
{
    <#
        .DESCRIPTION
        DSC Coniguration that uses ConfigData file

        .EXAMPLE
        TemplateWithConfigData -outpath c:\dsc\

        .NOTES
        This configuration requires the corresponding configdata file
    #>

    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    
    Node $AllNodes.NodeName
    {
        File testfile
        {
            Ensure          = 'Present'
            DestinationPath = $Node.Path
            Contents        = $Node.Contents
        }
    }
}
