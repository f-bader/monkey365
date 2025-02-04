﻿# Monkey365 - the PowerShell Cloud Security Tool for Azure and Microsoft 365 (copyright 2022) by Juan Garrido
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

Function Get-MonkeyAzUserId{
    <#
        .SYNOPSIS

        .DESCRIPTION

        .INPUTS

        .OUTPUTS

        .EXAMPLE

        .NOTES
	        Author		: Juan Garrido
            Twitter		: @tr1ana
            File Name	: Get-MonkeyAzUserId
            Version     : 1.0

        .LINK
            https://github.com/silverhack/monkey365
    #>
    [CmdletBinding()]
    Param()
    if($O365Object.isConfidentialApp){
        $UserObjectId = ""
    }
    else{
        if($null -ne ($Script:o365_connections.ResourceManager.PsObject.Properties.Item('UserInfo'))){
            try{
                $UserObjectId = @($Script:o365_connections.ResourceManager.UserInfo.UniqueId)
            }
            catch{
                Write-Warning -Message ("Unable to get userId")
                $UserObjectId = $null
            }
        }
        elseif($null -ne ($Script:o365_connections.ResourceManager.PsObject.Properties.Item('UniqueId'))){
            try{
                $UserObjectId = $Script:o365_connections.ResourceManager.UniqueId
            }
            catch{
                Write-Warning -Message ("Unable to get userId")
                $UserObjectId = $null
            }
        }
        else{
            Write-Warning -Message ("Unable to get userId")
            $UserObjectId = $null
        }
    }
    return $UserObjectId
}
