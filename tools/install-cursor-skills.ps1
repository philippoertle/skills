<#
.SYNOPSIS
  Copies skills from ./skills (and optional ./template) for Cursor IDE.

.DESCRIPTION
  By default installs to the current user's global Cursor skills directory
  (%USERPROFILE%\.cursor\skills on Windows) so skills apply in every workspace.
  Use -Project to install into this repository's .cursor/skills instead.

.PARAMETER Clean
  With -Project: remove everything under .cursor/skills before copying.
  Without -Project: ignored (each skill folder is replaced individually).

.PARAMETER NoTemplate
  Skip copying ./template.

.PARAMETER Project
  Install to <repo>/.cursor/skills instead of the user directory.

.EXAMPLE
  .\tools\install-cursor-skills.ps1
  .\tools\install-cursor-skills.ps1 -Project -Clean
#>
[CmdletBinding()]
param(
    [switch] $Clean,
    [switch] $NoTemplate,
    [switch] $Project
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$RepoRoot = Split-Path -Parent $PSScriptRoot
$SkillsSrc = Join-Path $RepoRoot 'skills'
$TemplateSrc = Join-Path $RepoRoot 'template'

if ($Project) {
    $Dest = Join-Path (Join-Path $RepoRoot '.cursor') 'skills'
} else {
    $Dest = Join-Path (Join-Path $env:USERPROFILE '.cursor') 'skills'
}

if (-not (Test-Path -LiteralPath $SkillsSrc -PathType Container)) {
    Write-Error "skills directory not found: $SkillsSrc"
}

New-Item -ItemType Directory -Force -Path $Dest | Out-Null

if ($Clean) {
    if ($Project) {
        Write-Host "Cleaning $Dest"
        Get-ChildItem -LiteralPath $Dest -Force -ErrorAction SilentlyContinue |
            Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    } else {
        Write-Warning "Clean is only used with -Project; user skills are updated per folder without removing other skills."
    }
}

$installed = 0
Get-ChildItem -LiteralPath $SkillsSrc -Directory | ForEach-Object {
    $skillMd = Join-Path $_.FullName 'SKILL.md'
    if (-not (Test-Path -LiteralPath $skillMd -PathType Leaf)) {
        return
    }
    $name = $_.Name
    $target = Join-Path $Dest $name
    Write-Host "Installing skill: $name"
    if (Test-Path -LiteralPath $target) {
        Remove-Item -LiteralPath $target -Recurse -Force
    }
    Copy-Item -LiteralPath $_.FullName -Destination $target -Recurse -Force
    $script:installed++
}

if (-not $NoTemplate) {
    $templateSkill = Join-Path $TemplateSrc 'SKILL.md'
    if (Test-Path -LiteralPath $templateSkill -PathType Leaf) {
        $target = Join-Path $Dest 'template'
        Write-Host 'Installing skill: template'
        if (Test-Path -LiteralPath $target) {
            Remove-Item -LiteralPath $target -Recurse -Force
        }
        Copy-Item -LiteralPath $TemplateSrc -Destination $target -Recurse -Force
        $script:installed++
    }
}

$scope = if ($Project) { 'project' } else { 'user' }
Write-Host "Done ($scope scope). Installed $installed skill(s) into $Dest"
