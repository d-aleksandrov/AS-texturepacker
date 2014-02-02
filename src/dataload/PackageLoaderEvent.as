package dataload
{
	import flash.events.Event;
	
	public class PackageLoaderEvent extends Event
	{
		//---------------------------------------------------------------
		//
		// Variables
		//
		//---------------------------------------------------------------
		
		public static const LOAD_COMPLETE		: String = "LOAD_COMPLETE";
		public static const LOAD_ERROR			: String = "LOAD_ERROR";
		
		//---------------------------------------------------------------
		//
		// Components
		//
		//---------------------------------------------------------------
		
		protected var _loader:PackageBmpDataLoader;
		
		//---------------------------------------------------------------
		//
		// Construct
		//
		//---------------------------------------------------------------
		public function PackageLoaderEvent(type:String, loader:PackageBmpDataLoader, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_loader = loader;
			super(type, bubbles, cancelable);
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

		public function get loader():PackageBmpDataLoader
		{
			return _loader;
		}

	}
}