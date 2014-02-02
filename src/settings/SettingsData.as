package settings
{
	import flash.geom.Point;

	public class SettingsData
	{
		//---------------------------------------------------------------
		//
		// Variables
		//
		//---------------------------------------------------------------
		
		protected var _size:Point;
		protected var _output:String;
		protected var _useInDir:Boolean;
		protected var _directory:String
		
		//---------------------------------------------------------------
		//
		// Components
		//
		//---------------------------------------------------------------
		
		//---------------------------------------------------------------
		//
		// Construct
		//
		//---------------------------------------------------------------
		
		public function SettingsData(size:Point, output:String, useInDir:Boolean, directory:String)
		{
			_size = size;
			_output = output;
			_useInDir = useInDir;
			_directory = directory;
		}
		
		//---------------------------------------------------------------
		//
		// Visual
		//
		//---------------------------------------------------------------
		
		//---------------------------------------------------------------
		//
		// Logic
		//
		//---------------------------------------------------------------
		
		//---------------------------------------------------------------
		//
		// Handlers
		//
		//---------------------------------------------------------------
		
		public function get targetDirectoruName():String
		{
			return _directory;
		}

		public function get findInDirectories():Boolean
		{
			return _useInDir;
		}

		public function get outputDirectoryName():String
		{
			return _output;
		}

		public function get atlasSize():Point
		{
			return _size;
		}

	}
}