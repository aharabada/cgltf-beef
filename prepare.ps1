$option = $args[0]

if(!$option -or $option -eq "help")
{
	echo "Arguments:"
	echo "make... runs cmake"
	echo "clean... deletes the build-directory"
	echo "build [DEBUG|RELEASE|ALL]... builds the debug or release library"
}
elseif(($option -eq "make") -or (!$option))
{
    if(!(Test-Path build))
    {
		mkdir build
    }
    cd build
    cmake ../
    cd ..
}
elseif($option -eq "clean")
{
    if(Test-Path build)
    {
        echo "Removing old build directory..."
        rm -Recurse build
        #Remove-Item -Path build -Recurse
    }
    else
    {
        echo "Already clean."
    }
}
elseif($option -eq "build")
{
	if(!(Test-Path build))
    {
        echo "Build directory doesn't exist."
    }
    else
    {
		if(!$args[1] -or $args[1] -eq "help")
		{
			echo "Build targets: DEBUG or RELEASE"
		}
		
		[bool] $built = $false
		
        cd build
        if($args[1] -eq "DEBUG" -or $args[1] -eq "ALL")
        {
            echo "Building debug..."
            devenv /build Debug cgltf.sln
            echo "Finished build."
            echo "Copying library..."
			
            $targetPath = "../cgltf-beef/dist/Debug-Win64/"

            if(!(Test-Path $targetPath))
            {
		        mkdir $targetPath
            }
			copy-item "./Debug/cgltf.lib" ($targetPath + "cgltf.lib") -Force
			$built = $true
        }
        
		if($args[1] -eq "RELEASE" -or $args[1] -eq "ALL")
        {
            echo "Building release..."
            devenv /build Release cgltf.sln
            echo "Finished build."
            echo "Copying library..."
			
            $targetPath = "../cgltf-beef/dist/Release-Win64/"

            if(!(Test-Path $targetPath))
            {
		        mkdir $targetPath
            }
			copy-item "./Release/cgltf.lib"  ($targetPath + "cgltf.lib")  -Force
			$built = $true
        }
		
		if($built -eq $false)
		{
			echo "No built attempted."
		}
        cd ..
    }
}