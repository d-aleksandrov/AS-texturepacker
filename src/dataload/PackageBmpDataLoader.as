package dataload
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.filesystem.File;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	public class PackageBmpDataLoader extends EventDispatcher
	{
		//---------------------------------------------------------------
		//
		// Variables
		//
		//---------------------------------------------------------------
		
		protected var _inDirectories:Boolean;
		
		//---------------------------------------------------------------
		//
		// Components
		//
		//---------------------------------------------------------------
		
		private var _file:File;
		private var _fileCounter:int = 0;
		private var _loadStarted:Boolean = false;
		
	//	private var _pictures:Vector.<BitmapData> = new Vector.<BitmapData>;
		private var _pictures:Dictionary = new Dictionary();
		
		//---------------------------------------------------------------
		//
		// Construct
		//
		//---------------------------------------------------------------
		public function PackageBmpDataLoader(file:File, inDirectories:Boolean = true)
		{
			super(null);
			
			_file = file;
			_inDirectories = inDirectories;
			mainFileLoad(_file);
			
			_loadStarted = true;
			checkForLoaded();
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
		
		public function get pictures():Dictionary
		{
			return _pictures;
		}

		public function mainFileLoad(inpFile:File):void
		{
			var _files:Array = inpFile.getDirectoryListing();
			var currFile:File;
			var loader:Loader;
			var url:URLRequest;
			for (var i:int = 0; i < _files.length; i++) 
			{
				currFile = _files[i];
				switch (true)
				{
					case currFile.isDirectory && _inDirectories :
						mainFileLoad(currFile);
						break;
					case currFile.type == '.png':
						_fileCounter++;
						loader = new Loader();
						loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onFileLoad);
						url = new URLRequest(currFile.nativePath);
						loader.load(url);
						break;		
				}
			}	
			
		}
		
		public function onFileLoad(event:Event):void
		{
			_fileCounter--;
			
			var name:String = event.target.url;
			name = name.substr(name.lastIndexOf('/'));
			name = name.substr(1, (name.lastIndexOf('.')-1));
			_pictures[name] = event.target.content.bitmapData;
			
			checkForLoaded();
		}
		
		protected function checkForLoaded():void
		{
			if(_loadStarted && _fileCounter == 0)
			{
				dispatchEvent(new PackageLoaderEvent(PackageLoaderEvent.LOAD_COMPLETE, this));
			}
		}
	}
}