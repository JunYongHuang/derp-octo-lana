
package com.derp_octo_lana.app.views
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	import com.derp_octo_lana.app.consts.FlexGlobals;
	import com.derp_octo_lana.app.context.MainStarlingViewContext;
	import com.godpaper.as3.utils.LogUtil;
	
	import flash.ui.Mouse;
	import flash.utils.setTimeout;
	
	import mx.logging.ILogger;
	
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.skins.IFeathersTheme;
	import feathers.themes.AzureTheme;
	import feathers.themes.MetalWorksMobileTheme;
	
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * MainView.as class. 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Mar 8, 2013 10:50:30 PM
	 * @history 05/00/12,
	 */ 
	public class MainView extends Sprite
	{ 
		//--------------------------------------------------------------------------
		//
		// Variables
		//
		//--------------------------------------------------------------------------
		private var _starlingContext:StarlingContext;
		//Feather UI components
		private var _theme:MetalWorksMobileTheme;
		private var _navigator:ScreenNavigator;
		private var _transitionManager:ScreenSlidingStackTransitionManager;
		//		private var _fps:FPSDisplay;
		//----------------------------------
		// CONSTANTS
		//----------------------------------
		private static const LOG:ILogger = LogUtil.getLogger(MainView);
		//--------------------------------------------------------------------------
		//
		// Public properties
		//
		//--------------------------------------------------------------------------
		
		
		//--------------------------------------------------------------------------
		//
		// Protected properties
		//
		//--------------------------------------------------------------------------
		
		
		//--------------------------------------------------------------------------
		//
		// Constructor
		//
		//--------------------------------------------------------------------------
		public function MainView()
		{
			super();
			//
			this._starlingContext = new MainStarlingViewContext(this);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		} 
		
		//--------------------------------------------------------------------------
		//
		// Public methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		// Protected methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		// Private methods
		//
		//--------------------------------------------------------------------------
		private function onAddedToStage():void
		{
//			LOG.info("application start {0}", "MainView");
//			var subView:SubView = new SubView();
//			this.addChild(subView);
//			//Test mediator on remove,3 sec.
//			setTimeout(subView.parent.removeChild,3000,subView);
			//this is supposed to be an example mobile app, but it is also shown
			//as a preview in Flash Player on the web. we're making a special
			//case to pretend that the web SWF is running in the theme's "ideal"
			//DPI. official themes usually target an iPhone Retina display.
			const isDesktop:Boolean = Mouse.supportsCursor;
			//			this._theme = new MinimalTheme(this.stage, !isDesktop);
			//			this._theme = new AeonDesktopTheme(this.stage);
			//			this._theme = new AzureTheme(this.stage, !isDesktop);
			this._theme = new MetalWorksMobileTheme(this.stage, !isDesktop);
			const originalThemeDPI:int = this._theme.originalDPI;
			
			this._navigator = new ScreenNavigator();
			this.addChild(this._navigator);
			//
			this._navigator.addScreen(FlexGlobals.SCREEN_SPLASH, new ScreenNavigatorItem(SplashScreen));
			this._navigator.addScreen(FlexGlobals.SCREEN_MAIN_MENU, new ScreenNavigatorItem(MainMenuScreen));
			
			//Store the navigator ref to FlexGlobals.
			FlexGlobals.screenNavigator = this._navigator;
			FlexGlobals.screenNavigator.showScreen(FlexGlobals.SCREEN_SPLASH);//Screen swither here.
			
			//			this._transitionManager = new ScreenSlidingStackTransitionManager(this._navigator);
			//			this._transitionManager.duration = 0.4;
			//			this._transitionManager.ease = Cubic.easeOut;
			
			//			this._fps = new FPSDisplay();
			//			this.stage.addChild(this._fps);
			//			this._fps.validate();
			//			this._fps.y = this.stage.stageHeight - this._fps.height;
			//			this.stage.addEventListener(ResizeEvent.RESIZE, stage_resizeHandler);
		}
	}
	
}