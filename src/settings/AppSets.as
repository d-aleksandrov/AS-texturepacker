package settings
{
	import flash.geom.Point;

	public class AppSets
	{
		//---------------------------------------------------------------
		//
		// Variables
		//
		//---------------------------------------------------------------
		
		[Embed(source="../settings/sets.json", mimeType="application/octet-stream")] 
		protected static const data:Class;
		
		//---------------------------------------------------------------
		//
		// Components
		//
		//---------------------------------------------------------------
		
		protected static var _instance:SettingsData;
		
		//---------------------------------------------------------------
		//
		// Construct
		//
		//---------------------------------------------------------------
		
		public static function get sets():SettingsData
		{
			if (_instance)
				return _instance;
			else
				return initInstance();
		}
		
		private static function initInstance():SettingsData
		{
			var currData:Object = JSON.parse(new data())
			
			var size:Point = currData.hasOwnProperty('maxAtlasSize')? new Point(currData['maxAtlasSize'][0], currData['maxAtlasSize'][1]) : new Point(1024,1024);
			var out:String = currData.hasOwnProperty('output')? currData['output'] : 'OUT_DIR';
			var inp:String = currData.hasOwnProperty('input')? currData['input'] : 'resources';
			var useDir:Boolean = currData.hasOwnProperty('useSubDirectories') ? currData['useSubDirectories'] : true;
			
			_instance = new SettingsData(size, out, useDir, inp);
			
			return _instance;
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
		
	}
}