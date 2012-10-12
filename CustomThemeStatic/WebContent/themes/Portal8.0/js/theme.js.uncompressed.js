(function(){
	var editModeInitialized = false;
	if(typeof wptheme === "undefined" || !wptheme) wptheme = {};
	i$.mash(wptheme, {
		togglePageMode: function () {
			return i$.modules.loadDeferred().then(function(){
				var hasEnabler = i$.fromPath("com.ibm.mashups"),
					runtimeModel = hasEnabler ? com.ibm.mashups.builder.model.Factory.getRuntimeModel() : null,
					userModel = hasEnabler ? com.ibm.mashups.enabler.user.Factory.getUserModel() : null,
					body = document.getElementsByTagName("body")[0],
					changePageMode = function(mode) {
						if(hasEnabler) {
							com.ibm.mashups.services.ServiceManager.getService("eventService").broadcastEvent("com.ibm.mashups.builder.changePageMode", mode);
							runtimeModel.getCurrentPage().setPageMode(mode);
						}
						i$.fireEvent('wptheme/contextMenu/invalidate/all');
					};
				if ( (!hasEnabler && !i$.hasClass(body,"edit-mode")) || (hasEnabler && userModel.getAnonymousMode() != com.ibm.mashups.enabler.user.AnonymousMode.ANONYMOUS && 
						runtimeModel.getCurrentPage().getPageMode() != "edit") ) {
					changePageMode("edit");
					i$.addClass(body, "edit-mode");
					if(!editModeInitialized){
						// Add an onbeforeunload to alert the user if s/he is leaving a page with unsaved changes
						// the onbeforeunload event is triggered in IE for javascript links, so it cannot be safely used
						// the onbeforeunload event is not supported in Opera
						if(!i$.isIE && !i$.isOpera && hasEnabler) {
							window.onbeforeunload = function(){
								if(com.ibm.mashups.builder.model.Factory.getRuntimeModel().getCurrentPage().isDirty()) {
									return com.ibm.mm.builder.coreWidgetsStrings.I_PAGE_SAVE_WARNING;
								}
							};
						}
						editModeInitialized = true;
					}
				} else {
					changePageMode("view");
					i$.removeClass(body, "edit-mode");
				}
			}, function(err) {
				console.log("Error going into edit mode. Most likely a session timeout. Refreshing. "+err);
				window.location.reload();
			});
		}
	});
    // only one of the following two alt help containers should be used on the page
    var altHelpLinkContainer = document.getElementById("wpthemeHelpLink"); //if the page supplies the link, we will open it the same way we open portal help
    var altHelpOnClickContainer = document.getElementById("wpthemeHelpOnClick"); //if the page wants to call its own help logic we add that to the onclick (this contains some javascript)
    var helpAnchor = document.getElementById("wpthemeHelpAnchor");
    if (!(altHelpLinkContainer === null && altHelpOnClickContainer === null) && helpAnchor != null) { //we can retrieve the help anchor and at least one container is populated
        if (altHelpLinkContainer != null) {
            var helpHref = altHelpLinkContainer.innerHTML;
            helpAnchor.onclick=function(){window.open(helpHref,'wpthemeHelp','width=800,height=600')};
        }
        else if (altHelpOnClickContainer != null) {
            var helpOnClick = altHelpOnClickContainer.innerHTML;
            helpAnchor.onclick=function(){eval(helpOnClick)};
        }
    }

})();
