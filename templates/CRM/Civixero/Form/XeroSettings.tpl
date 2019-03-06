{* HEADER *}

<div class="crm-submit-buttons">
{include file="CRM/common/formButtons.tpl" location="top"}
</div>

{* FIELD EXAMPLE: OPTION 1 (AUTOMATIC LAYOUT) *}

{foreach from=$elementNames item=elementName}
  <div class="crm-section">
    <div class="label">{$form.$elementName.label}</div>
    <div class="content">
      {$form.$elementName.html}
      {if $elementName == 'xero_public_certificate'}
        <br><br>
        <div class="{if $hasPublicKeySaved != ''}help{else}status{/if}">
          {if $hasPublicKeySaved != ''}
            <p>Public certificate is uploaded, If you want to change the Xero public certificate please reupload the file.</p>
          {else}
            {if $showPublicUpgradeMessage}
                <a href="{crmURL p='civicrm/admin/extensions/upgrade' }">Execute the updates</a> to copy the Xero public certificate in database.
            {else}
                <p>Public certificate is not uploaded, To sync contacts and contributions with Xero please upload the Xero public certificate file.</p>
            {/if}
          {/if}
        </div>
      {/if}

      {if $elementName == 'xero_private_key'}
        <br><br>
        <div class="{if $hasPrivateKeySaved != ''}help{else}status{/if}">
          {if $hasPublicKeySaved != ''}
            <p>Private key is uploaded, If you want to change the Xero private key please reupload the file.</p>
          {else}
            {if $showPrivateUpgradeMessage}
                <a href="{crmURL p='civicrm/admin/extensions/upgrade' }">Execute the updates</a> to copy the Xero private key in database.
            {else}
                <p>Private key is not uploaded, To sync contacts and contributions with Xero please upload the Xero private key file.</p>
            {/if}
          {/if}
        </div>
      {/if}

    </div>
    <div class="clear"></div>
  </div>
{/foreach}

{* FIELD EXAMPLE: OPTION 2 (MANUAL LAYOUT)

  <div>
    <span>{$form.favorite_color.label}</span>
    <span>{$form.favorite_color.html}</span>
  </div>

{* FOOTER *}
<div class="crm-submit-buttons">
{include file="CRM/common/formButtons.tpl" location="bottom"}
</div>
