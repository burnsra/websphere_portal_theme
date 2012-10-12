<%@ page session="false" buffer="none" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:constants/><portal-core:defineObjects/>
<div class="wpthemeFooterCol wpthemeLeft">
	<h3><portal-fmt:text key="help.title" bundle="nls.commonUI"/></h3>
	<ul>
		<li><a href="http://www.ibm.com/websphere/portal/library"><portal-fmt:text key="help.documentation" bundle="nls.commonUI"/></a></li>
		<li><a href="http://www-10.lotus.com/ldd/portalwiki.nsf/"><portal-fmt:text key="help.wiki" bundle="nls.commonUI"/></a></li>
		<li><a href="http://www-10.lotus.com/ldd/portalwiki.nsf/archive?openview&amp;title=Demonstration%20Gallery&amp;type=cat&amp;cat=Demonstration%20Gallery/"><portal-fmt:text key="help.media" bundle="nls.commonUI"/></a></li>
		<li><a href="http://www.ibm.com/websphere/developer/zones/portal/"><portal-fmt:text key="help.zone" bundle="nls.commonUI"/></a></li>
	</ul>
</div>
<div class="wpthemeFooterCol wpthemeLeft">
	<h3><portal-fmt:text key="support.title" bundle="nls.commonUI"/></h3>
	<ul>
		<li><a href="http://www.ibm.com/software/genservers/portal/support/"><portal-fmt:text key="support.page" bundle="nls.commonUI"/></a></li>
		<li><a href="http://www-01.ibm.com/support/docview.wss?rs=1070&amp;uid=swg27007791"><portal-fmt:text key="support.hardware.software" bundle="nls.commonUI"/></a></li>
		<li><a href="http://www14.software.ibm.com/webapp/set2/sas/f/handbook/home.html"><portal-fmt:text key="support.guide" bundle="nls.commonUI"/></a></li>
	</ul>
</div>
<portal-logic:if loggedIn="yes">
<div class="wpthemeFooterCol wpthemeLeft">
	<h3><portal-fmt:text key="search.explore.title" bundle="nls.commonUI"/></h3>
	<ul>
		<li><a href="<portal-navigation:urlGeneration keepNavigationalState="false" contentNode='ibm.portal.Search'><% wpsURL.write(escapeXmlWriter); %></portal-navigation:urlGeneration>"><portal-fmt:text key="search.center.page" bundle="nls.commonUI"/></a></li>
		<li><a href="<portal-navigation:urlGeneration keepNavigationalState="false" contentNode='ibm.portal.Tagging'><% wpsURL.write(escapeXmlWriter); %></portal-navigation:urlGeneration>"><portal-fmt:text key="tagging.rating.page" bundle="nls.commonUI"/></a></li>
	</ul>
</div>
</portal-logic:if>