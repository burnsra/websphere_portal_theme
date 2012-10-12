<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>

<c:if test="${fn:length(wp.selectionModel.selectionPath) > (param.startLevel+1)}">
<div class="${param.rootClass} wpthemeLeft">
	<c:forEach var="node" items="${wp.selectionModel.selectionPath}" begin="${param.startLevel}">
		<c:set var="nodeID" value="${wp.identification[node]}"/>
		<c:set var="separator" value="&gt;" />
		<c:if test="${!node.metadata['com.ibm.portal.Hidden']}">
			<c:if test="${isTrailStarted}">
				<span class="wpthemeCrumbTrailSeparator">${separator}</span>
			</c:if>
			<c:choose>
				<c:when test="${wp.identification[wp.selectionModel.selected] == nodeID}">
					<strong><span class="wpthemeSelected" lang="${node.title.xmlLocale}" dir="${node.title.direction}"><c:choose><c:when test="${node.projectID != null}">(<c:out value="${node.title}"/>)</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></span></strong>
				</c:when>
				<c:when test="${node.contentNode.contentNodeType == 'LABEL'}">
					<span lang="${node.title.xmlLocale}" dir="${node.title.direction}"><c:choose><c:when test="${node.projectID != null}">(<c:out value="${node.title}"/>)</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></span>
				</c:when>
				<c:otherwise>
					<a href="?uri=nm:oid:${nodeID}"><span lang="${node.title.xmlLocale}" dir="${node.title.direction}"><c:choose><c:when test="${node.projectID != null}">(<c:out value="${node.title}"/>)</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></span></a>
				</c:otherwise>
			</c:choose>
			<c:set var="isTrailStarted" value="true" />
		</c:if>
	</c:forEach>
</div>
</c:if>