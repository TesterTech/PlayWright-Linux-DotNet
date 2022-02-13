pipeline {
   agent { any {} }
   stages {
      stage('e2e-tests') {
         steps {
            sh '''
            dotnet new console -n PlayWright --force
            cd PlayWright
            dotnet add package Microsoft.Playwright
            dotnet build
            pwsh bin/Debug/netcoreapp3.1/playwright.ps1 install
            '''
            sh '''
            cat << EOF > Program.cs
using Microsoft.Playwright;
using System.Threading.Tasks;

class Program
{
    public static async Task Main()
    {
        using var playwright = await Playwright.CreateAsync();
        await using var browser = await playwright.Chromium.LaunchAsync();
        var page = await browser.NewPageAsync();
        await page.GotoAsync("https://playwright.dev/dotnet");
        await page.ScreenshotAsync(new PageScreenshotOptions { Path = "screenshot.png" });
    }
}
EOF
            '''
            sh 'dotnet run'
         }
      }
   }
}
