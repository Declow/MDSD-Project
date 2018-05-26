package dk.sdu.mmmi.mdsd.project.generator

import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import org.eclipse.emf.ecore.resource.Resource
import java.util.zip.ZipInputStream
import java.util.zip.ZipEntry
import java.nio.file.Path
import java.nio.file.Paths
import java.io.FileOutputStream
import org.eclipse.xtext.generator.JavaIoFileSystemAccess
import java.io.File
import java.io.OutputStreamWriter
import java.io.BufferedOutputStream
import com.google.common.io.ByteStreams
import java.io.IOException
import org.eclipse.xtext.util.RuntimeIOException
import com.google.inject.Inject
import org.eclipse.xtext.generator.IOutputConfigurationProvider
import org.eclipse.xtext.generator.OutputConfiguration

class StaticFileGenerator {
	
	
	Resource resource;
	IFileSystemAccess2 fsa;
	IGeneratorContext context;
	
	
	IOutputConfigurationProvider config

	new (Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context, IOutputConfigurationProvider config) {
		this.resource = resource
		this.fsa = fsa
		this.context = context
		
		for (OutputConfiguration d : config.outputConfigurations.toList) {
			System.out.println(d.outputDirectory)
		}
		
		System.out.println(System.getProperty("user.home"))
			
		//generateStaticFiles()
		generateFilesNotZip()
	}
	
	def generateFilesNotZip() {
		val input = this.class.getResourceAsStream("files/p")
		
		System.out.println(input)
	}
	
	
	def generateStaticFiles() {
		fsa.generateFile('/src/robotdefinitionsample/robot.png', this.class.getResourceAsStream('files/robot.png'))
		
		val buffer = newByteArrayOfSize(2024)
		var zip = this.class.getResourceAsStream('files/ZipStatic.zip');
        val input = new ZipInputStream(zip)
        
        
        
        var entry = input.nextEntry
        
        while(entry !== null) {
        	var file = new File("./src-gen/" + entry.name)
        	
        	
        	
        	System.out.println(file.absolutePath + " " + entry.name.endsWith("/"))
        	
        	if (entry.name.endsWith(File.separator))
        		System.out.println(file.mkdirs())
        	else {
				try {
					createFolder(file.parentFile)
					var out = new FileOutputStream(file);
					var len = 0;
	                    while ((len = input.read(buffer)) > 0)
	                    {
	                        out.write(buffer, 0, len);
	                    }
				} catch (IOException e) {
					throw new RuntimeIOException(e);
				}
			}
            
        	entry = input.nextEntry
        }
	}
	
	def createFolder(File parent) {
		if (parent != null && !parent.mkdirs() && !parent.isDirectory())
			throw new RuntimeIOException("Could not create directory " + parent);
	}
	
}