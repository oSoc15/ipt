<#escape x as x?html>
<#setting number_format="#####.##">
<#include "/WEB-INF/pages/inc/header.ftl">
<title><@s.text name='manage.metadata.citations.title'/></title>
<script type="text/javascript">
	$(document).ready(function(){
		initHelp();
	});
</script>
<#include "/WEB-INF/pages/macros/metadata.ftl"/>
<#assign sideMenuEml=true />
<#assign currentMenu="manage"/>
<#include "/WEB-INF/pages/inc/menu.ftl">
<#include "/WEB-INF/pages/macros/forms.ftl"/>

<h1><span class="superscript"><@s.text name='manage.overview.title.label'/></span>
    <a href="resource.do?r=${resource.shortname}" title="${resource.title!resource.shortname}">${resource.title!resource.shortname}</a>
</h1>
<div class="grid_17 suffix_1">
<h2 class="subTitle"><@s.text name='manage.metadata.citations.title'/></h2>
<form class="topForm" action="metadata-${section}.do" method="post">
    <p><@s.text name='manage.metadata.citations.intro'/></p>

    <!-- retrieve some link names one time -->
    <#assign removeLink><@s.text name='manage.metadata.removethis'/> <@s.text name='manage.metadata.citations.item'/></#assign>
    <#assign addLink><@s.text name='manage.metadata.addnew'/> <@s.text name='manage.metadata.citations.item'/></#assign>

    <div>
      <@text name="eml.citation.citation" help="i18n" requiredField=true />
		  <@input name="eml.citation.identifier" help="i18n"/>
	  </div>

    <div class="listBlock">
      <@textinline name="manage.metadata.citations.bibliography" help="i18n"/>
      <div id="items">
        <#list eml.bibliographicCitationSet.bibliographicCitations as item>
            <div id="item-${item_index}" class="item">
                <div class="right">
                    <a id="removeLink-${item_index}" class="removeLink" href="">[ ${removeLink?lower_case?cap_first} ]</a>
                </div>
              <@text name="eml.bibliographicCitationSet.bibliographicCitations[${item_index}].citation" help="i18n" i18nkey="eml.bibliographicCitationSet.bibliographicCitations.citation" size=40 requiredField=true />
              <@input name="eml.bibliographicCitationSet.bibliographicCitations[${item_index}].identifier" help="i18n" i18nkey="eml.bibliographicCitationSet.bibliographicCitations.identifier" />
            </div>
        </#list>
      </div>
    </div>

  <div class="addNew"><a id="plus" href="">${addLink?lower_case?cap_first}</a></div>
	<div class="buttons">
		<@s.submit cssClass="button" name="save" key="button.save" />
		<@s.submit cssClass="button" name="cancel" key="button.cancel" />
	</div>
	<!-- internal parameter -->
	<input name="r" type="hidden" value="${resource.shortname}" />
</form>
</div>

<div id="baseItem" class="item" style="display:none;">
	<div class="right">
		<a id="removeLink" class="removeLink" href="">[ <@s.text name='manage.metadata.removethis'/> <@s.text name='manage.metadata.citations.item'/> ]</a>
	</div>
  <@text name="citation" help="i18n" i18nkey="eml.bibliographicCitationSet.bibliographicCitations.citation"  value="" size=40 requiredField=true />
  <@input name="identifier" help="i18n" i18nkey="eml.bibliographicCitationSet.bibliographicCitations.identifier" />
</div>

<#include "/WEB-INF/pages/inc/footer.ftl">
</#escape>
