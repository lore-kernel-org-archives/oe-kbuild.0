Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9631717EF
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677405838; x=1708941838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S//Gj0lhMzi5LjJQqA/ffdtpq+VSMinYF+rKxF3Fl3M=;
  b=OSwVRNv0BRVD9/TwycevZN613mVKGp5GEME0mGuxt+RTZCLSoPQmGvSB
   szROnJUzympjM0ulc52xRxzdbzn295KBffVb4iVPSr0dZuQgsfKvpn35S
   JgDBn3/+Kqqy94a2dLG6HB6FHV38XYGHonwfd+e9kDSZxZAaH4/LLg/5Z
   jyRIBvehItXknu0pZ6d6iCufqW0dMmsFLLFq9LNNlzZFLeAdgIXEQCMWg
   +JCc/sAM02eRZerpScaow/PWJhtXOinsGTA2P0WiAIgqSL1VytvwEfMT0
   JMfIscE2EiW3qZnPSojWkSF/N0jdTJbFWcTX/trlGSFrlXXNDEJ4KzdfF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="314125913"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="314125913"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 02:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="918939635"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="918939635"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Feb 2023 02:03:54 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWDsn-0003gl-0x;
	Sun, 26 Feb 2023 10:03:53 +0000
Date: Sun, 26 Feb 2023 18:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:365
 dc_link_construct_phy() warn: variable dereferenced before check
 'link->link_enc' (see line 362)
Message-ID: <202302261837.dKavRZA5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Wenjing Liu <wenjing.liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: George Shen <George.Shen@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2fcd07b7ccd5fd10b2120d298363e4e6c53ccf9c
commit: 54618888d1ea7a26f8bccfb89e3c2420350c8047 drm/amd/display: break down dc_link.c
date:   3 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 weeks ago
config: m68k-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230226/202302261837.dKavRZA5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302261837.dKavRZA5-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:365 dc_link_construct_phy() warn: variable dereferenced before check 'link->link_enc' (see line 362)
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.c:2307 link_set_dpms_on() warn: if statement not indented

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:145 get_ddc_line() warn: inconsistent indenting
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:201 dc_link_construct_phy() warn: inconsistent indenting

vim +365 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c

54618888d1ea7a Wenjing Liu 2023-01-18  183  
54618888d1ea7a Wenjing Liu 2023-01-18  184  static bool dc_link_construct_phy(struct dc_link *link,
54618888d1ea7a Wenjing Liu 2023-01-18  185  			      const struct link_init_data *init_params)
54618888d1ea7a Wenjing Liu 2023-01-18  186  {
54618888d1ea7a Wenjing Liu 2023-01-18  187  	uint8_t i;
54618888d1ea7a Wenjing Liu 2023-01-18  188  	struct ddc_service_init_data ddc_service_init_data = { 0 };
54618888d1ea7a Wenjing Liu 2023-01-18  189  	struct dc_context *dc_ctx = init_params->ctx;
54618888d1ea7a Wenjing Liu 2023-01-18  190  	struct encoder_init_data enc_init_data = { 0 };
54618888d1ea7a Wenjing Liu 2023-01-18  191  	struct panel_cntl_init_data panel_cntl_init_data = { 0 };
54618888d1ea7a Wenjing Liu 2023-01-18  192  	struct integrated_info info = { 0 };
54618888d1ea7a Wenjing Liu 2023-01-18  193  	struct dc_bios *bios = init_params->dc->ctx->dc_bios;
54618888d1ea7a Wenjing Liu 2023-01-18  194  	const struct dc_vbios_funcs *bp_funcs = bios->funcs;
54618888d1ea7a Wenjing Liu 2023-01-18  195  	struct bp_disp_connector_caps_info disp_connect_caps_info = { 0 };
54618888d1ea7a Wenjing Liu 2023-01-18  196  
54618888d1ea7a Wenjing Liu 2023-01-18  197  	DC_LOGGER_INIT(dc_ctx->logger);
54618888d1ea7a Wenjing Liu 2023-01-18  198  
54618888d1ea7a Wenjing Liu 2023-01-18  199  		link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
54618888d1ea7a Wenjing Liu 2023-01-18  200  		link->irq_source_hpd_rx = DC_IRQ_SOURCE_INVALID;
54618888d1ea7a Wenjing Liu 2023-01-18  201  	link->link_status.dpcd_caps = &link->dpcd_caps;
54618888d1ea7a Wenjing Liu 2023-01-18  202  
54618888d1ea7a Wenjing Liu 2023-01-18  203  	link->dc = init_params->dc;
54618888d1ea7a Wenjing Liu 2023-01-18  204  	link->ctx = dc_ctx;
54618888d1ea7a Wenjing Liu 2023-01-18  205  	link->link_index = init_params->link_index;
54618888d1ea7a Wenjing Liu 2023-01-18  206  
54618888d1ea7a Wenjing Liu 2023-01-18  207  	memset(&link->preferred_training_settings, 0,
54618888d1ea7a Wenjing Liu 2023-01-18  208  	       sizeof(struct dc_link_training_overrides));
54618888d1ea7a Wenjing Liu 2023-01-18  209  	memset(&link->preferred_link_setting, 0,
54618888d1ea7a Wenjing Liu 2023-01-18  210  	       sizeof(struct dc_link_settings));
54618888d1ea7a Wenjing Liu 2023-01-18  211  
54618888d1ea7a Wenjing Liu 2023-01-18  212  	link->link_id =
54618888d1ea7a Wenjing Liu 2023-01-18  213  		bios->funcs->get_connector_id(bios, init_params->connector_index);
54618888d1ea7a Wenjing Liu 2023-01-18  214  
54618888d1ea7a Wenjing Liu 2023-01-18  215  	link->ep_type = DISPLAY_ENDPOINT_PHY;
54618888d1ea7a Wenjing Liu 2023-01-18  216  
54618888d1ea7a Wenjing Liu 2023-01-18  217  	DC_LOG_DC("BIOS object table - link_id: %d", link->link_id.id);
54618888d1ea7a Wenjing Liu 2023-01-18  218  
54618888d1ea7a Wenjing Liu 2023-01-18  219  	if (bios->funcs->get_disp_connector_caps_info) {
54618888d1ea7a Wenjing Liu 2023-01-18  220  		bios->funcs->get_disp_connector_caps_info(bios, link->link_id, &disp_connect_caps_info);
54618888d1ea7a Wenjing Liu 2023-01-18  221  		link->is_internal_display = disp_connect_caps_info.INTERNAL_DISPLAY;
54618888d1ea7a Wenjing Liu 2023-01-18  222  		DC_LOG_DC("BIOS object table - is_internal_display: %d", link->is_internal_display);
54618888d1ea7a Wenjing Liu 2023-01-18  223  	}
54618888d1ea7a Wenjing Liu 2023-01-18  224  
54618888d1ea7a Wenjing Liu 2023-01-18  225  	if (link->link_id.type != OBJECT_TYPE_CONNECTOR) {
54618888d1ea7a Wenjing Liu 2023-01-18  226  		dm_output_to_console("%s: Invalid Connector ObjectID from Adapter Service for connector index:%d! type %d expected %d\n",
54618888d1ea7a Wenjing Liu 2023-01-18  227  				     __func__, init_params->connector_index,
54618888d1ea7a Wenjing Liu 2023-01-18  228  				     link->link_id.type, OBJECT_TYPE_CONNECTOR);
54618888d1ea7a Wenjing Liu 2023-01-18  229  		goto create_fail;
54618888d1ea7a Wenjing Liu 2023-01-18  230  	}
54618888d1ea7a Wenjing Liu 2023-01-18  231  
54618888d1ea7a Wenjing Liu 2023-01-18  232  	if (link->dc->res_pool->funcs->link_init)
54618888d1ea7a Wenjing Liu 2023-01-18  233  		link->dc->res_pool->funcs->link_init(link);
54618888d1ea7a Wenjing Liu 2023-01-18  234  
54618888d1ea7a Wenjing Liu 2023-01-18  235  	link->hpd_gpio = link_get_hpd_gpio(link->ctx->dc_bios, link->link_id,
54618888d1ea7a Wenjing Liu 2023-01-18  236  				      link->ctx->gpio_service);
54618888d1ea7a Wenjing Liu 2023-01-18  237  
54618888d1ea7a Wenjing Liu 2023-01-18  238  	if (link->hpd_gpio) {
54618888d1ea7a Wenjing Liu 2023-01-18  239  		dal_gpio_open(link->hpd_gpio, GPIO_MODE_INTERRUPT);
54618888d1ea7a Wenjing Liu 2023-01-18  240  		dal_gpio_unlock_pin(link->hpd_gpio);
54618888d1ea7a Wenjing Liu 2023-01-18  241  		link->irq_source_hpd = dal_irq_get_source(link->hpd_gpio);
54618888d1ea7a Wenjing Liu 2023-01-18  242  
54618888d1ea7a Wenjing Liu 2023-01-18  243  		DC_LOG_DC("BIOS object table - hpd_gpio id: %d", link->hpd_gpio->id);
54618888d1ea7a Wenjing Liu 2023-01-18  244  		DC_LOG_DC("BIOS object table - hpd_gpio en: %d", link->hpd_gpio->en);
54618888d1ea7a Wenjing Liu 2023-01-18  245  	}
54618888d1ea7a Wenjing Liu 2023-01-18  246  
54618888d1ea7a Wenjing Liu 2023-01-18  247  	switch (link->link_id.id) {
54618888d1ea7a Wenjing Liu 2023-01-18  248  	case CONNECTOR_ID_HDMI_TYPE_A:
54618888d1ea7a Wenjing Liu 2023-01-18  249  		link->connector_signal = SIGNAL_TYPE_HDMI_TYPE_A;
54618888d1ea7a Wenjing Liu 2023-01-18  250  
54618888d1ea7a Wenjing Liu 2023-01-18  251  		break;
54618888d1ea7a Wenjing Liu 2023-01-18  252  	case CONNECTOR_ID_SINGLE_LINK_DVID:
54618888d1ea7a Wenjing Liu 2023-01-18  253  	case CONNECTOR_ID_SINGLE_LINK_DVII:
54618888d1ea7a Wenjing Liu 2023-01-18  254  		link->connector_signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
54618888d1ea7a Wenjing Liu 2023-01-18  255  		break;
54618888d1ea7a Wenjing Liu 2023-01-18  256  	case CONNECTOR_ID_DUAL_LINK_DVID:
54618888d1ea7a Wenjing Liu 2023-01-18  257  	case CONNECTOR_ID_DUAL_LINK_DVII:
54618888d1ea7a Wenjing Liu 2023-01-18  258  		link->connector_signal = SIGNAL_TYPE_DVI_DUAL_LINK;
54618888d1ea7a Wenjing Liu 2023-01-18  259  		break;
54618888d1ea7a Wenjing Liu 2023-01-18  260  	case CONNECTOR_ID_DISPLAY_PORT:
54618888d1ea7a Wenjing Liu 2023-01-18  261  	case CONNECTOR_ID_USBC:
54618888d1ea7a Wenjing Liu 2023-01-18  262  		link->connector_signal = SIGNAL_TYPE_DISPLAY_PORT;
54618888d1ea7a Wenjing Liu 2023-01-18  263  
54618888d1ea7a Wenjing Liu 2023-01-18  264  		if (link->hpd_gpio)
54618888d1ea7a Wenjing Liu 2023-01-18  265  			link->irq_source_hpd_rx =
54618888d1ea7a Wenjing Liu 2023-01-18  266  					dal_irq_get_rx_source(link->hpd_gpio);
54618888d1ea7a Wenjing Liu 2023-01-18  267  
54618888d1ea7a Wenjing Liu 2023-01-18  268  		break;
54618888d1ea7a Wenjing Liu 2023-01-18  269  	case CONNECTOR_ID_EDP:
54618888d1ea7a Wenjing Liu 2023-01-18  270  		link->connector_signal = SIGNAL_TYPE_EDP;
54618888d1ea7a Wenjing Liu 2023-01-18  271  
54618888d1ea7a Wenjing Liu 2023-01-18  272  		if (link->hpd_gpio) {
54618888d1ea7a Wenjing Liu 2023-01-18  273  			if (!link->dc->config.allow_edp_hotplug_detection)
54618888d1ea7a Wenjing Liu 2023-01-18  274  				link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
54618888d1ea7a Wenjing Liu 2023-01-18  275  
54618888d1ea7a Wenjing Liu 2023-01-18  276  			switch (link->dc->config.allow_edp_hotplug_detection) {
54618888d1ea7a Wenjing Liu 2023-01-18  277  			case 1: // only the 1st eDP handles hotplug
54618888d1ea7a Wenjing Liu 2023-01-18  278  				if (link->link_index == 0)
54618888d1ea7a Wenjing Liu 2023-01-18  279  					link->irq_source_hpd_rx =
54618888d1ea7a Wenjing Liu 2023-01-18  280  						dal_irq_get_rx_source(link->hpd_gpio);
54618888d1ea7a Wenjing Liu 2023-01-18  281  				else
54618888d1ea7a Wenjing Liu 2023-01-18  282  					link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
54618888d1ea7a Wenjing Liu 2023-01-18  283  				break;
54618888d1ea7a Wenjing Liu 2023-01-18  284  			case 2: // only the 2nd eDP handles hotplug
54618888d1ea7a Wenjing Liu 2023-01-18  285  				if (link->link_index == 1)
54618888d1ea7a Wenjing Liu 2023-01-18  286  					link->irq_source_hpd_rx =
54618888d1ea7a Wenjing Liu 2023-01-18  287  						dal_irq_get_rx_source(link->hpd_gpio);
54618888d1ea7a Wenjing Liu 2023-01-18  288  				else
54618888d1ea7a Wenjing Liu 2023-01-18  289  					link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
54618888d1ea7a Wenjing Liu 2023-01-18  290  				break;
54618888d1ea7a Wenjing Liu 2023-01-18  291  			default:
54618888d1ea7a Wenjing Liu 2023-01-18  292  				break;
54618888d1ea7a Wenjing Liu 2023-01-18  293  			}
54618888d1ea7a Wenjing Liu 2023-01-18  294  		}
54618888d1ea7a Wenjing Liu 2023-01-18  295  
54618888d1ea7a Wenjing Liu 2023-01-18  296  		break;
54618888d1ea7a Wenjing Liu 2023-01-18  297  	case CONNECTOR_ID_LVDS:
54618888d1ea7a Wenjing Liu 2023-01-18  298  		link->connector_signal = SIGNAL_TYPE_LVDS;
54618888d1ea7a Wenjing Liu 2023-01-18  299  		break;
54618888d1ea7a Wenjing Liu 2023-01-18  300  	default:
54618888d1ea7a Wenjing Liu 2023-01-18  301  		DC_LOG_WARNING("Unsupported Connector type:%d!\n",
54618888d1ea7a Wenjing Liu 2023-01-18  302  			       link->link_id.id);
54618888d1ea7a Wenjing Liu 2023-01-18  303  		goto create_fail;
54618888d1ea7a Wenjing Liu 2023-01-18  304  	}
54618888d1ea7a Wenjing Liu 2023-01-18  305  
54618888d1ea7a Wenjing Liu 2023-01-18  306  	/* TODO: #DAL3 Implement id to str function.*/
54618888d1ea7a Wenjing Liu 2023-01-18  307  	LINK_INFO("Connector[%d] description:"
54618888d1ea7a Wenjing Liu 2023-01-18  308  		  "signal %d\n",
54618888d1ea7a Wenjing Liu 2023-01-18  309  		  init_params->connector_index,
54618888d1ea7a Wenjing Liu 2023-01-18  310  		  link->connector_signal);
54618888d1ea7a Wenjing Liu 2023-01-18  311  
54618888d1ea7a Wenjing Liu 2023-01-18  312  	ddc_service_init_data.ctx = link->ctx;
54618888d1ea7a Wenjing Liu 2023-01-18  313  	ddc_service_init_data.id = link->link_id;
54618888d1ea7a Wenjing Liu 2023-01-18  314  	ddc_service_init_data.link = link;
54618888d1ea7a Wenjing Liu 2023-01-18  315  	link->ddc = link_create_ddc_service(&ddc_service_init_data);
54618888d1ea7a Wenjing Liu 2023-01-18  316  
54618888d1ea7a Wenjing Liu 2023-01-18  317  	if (!link->ddc) {
54618888d1ea7a Wenjing Liu 2023-01-18  318  		DC_ERROR("Failed to create ddc_service!\n");
54618888d1ea7a Wenjing Liu 2023-01-18  319  		goto ddc_create_fail;
54618888d1ea7a Wenjing Liu 2023-01-18  320  	}
54618888d1ea7a Wenjing Liu 2023-01-18  321  
54618888d1ea7a Wenjing Liu 2023-01-18  322  	if (!link->ddc->ddc_pin) {
54618888d1ea7a Wenjing Liu 2023-01-18  323  		DC_ERROR("Failed to get I2C info for connector!\n");
54618888d1ea7a Wenjing Liu 2023-01-18  324  		goto ddc_create_fail;
54618888d1ea7a Wenjing Liu 2023-01-18  325  	}
54618888d1ea7a Wenjing Liu 2023-01-18  326  
54618888d1ea7a Wenjing Liu 2023-01-18  327  	link->ddc_hw_inst =
54618888d1ea7a Wenjing Liu 2023-01-18  328  		dal_ddc_get_line(get_ddc_pin(link->ddc));
54618888d1ea7a Wenjing Liu 2023-01-18  329  
54618888d1ea7a Wenjing Liu 2023-01-18  330  
54618888d1ea7a Wenjing Liu 2023-01-18  331  	if (link->dc->res_pool->funcs->panel_cntl_create &&
54618888d1ea7a Wenjing Liu 2023-01-18  332  		(link->link_id.id == CONNECTOR_ID_EDP ||
54618888d1ea7a Wenjing Liu 2023-01-18  333  			link->link_id.id == CONNECTOR_ID_LVDS)) {
54618888d1ea7a Wenjing Liu 2023-01-18  334  		panel_cntl_init_data.ctx = dc_ctx;
54618888d1ea7a Wenjing Liu 2023-01-18  335  		panel_cntl_init_data.inst =
54618888d1ea7a Wenjing Liu 2023-01-18  336  			panel_cntl_init_data.ctx->dc_edp_id_count;
54618888d1ea7a Wenjing Liu 2023-01-18  337  		link->panel_cntl =
54618888d1ea7a Wenjing Liu 2023-01-18  338  			link->dc->res_pool->funcs->panel_cntl_create(
54618888d1ea7a Wenjing Liu 2023-01-18  339  								&panel_cntl_init_data);
54618888d1ea7a Wenjing Liu 2023-01-18  340  		panel_cntl_init_data.ctx->dc_edp_id_count++;
54618888d1ea7a Wenjing Liu 2023-01-18  341  
54618888d1ea7a Wenjing Liu 2023-01-18  342  		if (link->panel_cntl == NULL) {
54618888d1ea7a Wenjing Liu 2023-01-18  343  			DC_ERROR("Failed to create link panel_cntl!\n");
54618888d1ea7a Wenjing Liu 2023-01-18  344  			goto panel_cntl_create_fail;
54618888d1ea7a Wenjing Liu 2023-01-18  345  		}
54618888d1ea7a Wenjing Liu 2023-01-18  346  	}
54618888d1ea7a Wenjing Liu 2023-01-18  347  
54618888d1ea7a Wenjing Liu 2023-01-18  348  	enc_init_data.ctx = dc_ctx;
54618888d1ea7a Wenjing Liu 2023-01-18  349  	bp_funcs->get_src_obj(dc_ctx->dc_bios, link->link_id, 0,
54618888d1ea7a Wenjing Liu 2023-01-18  350  			      &enc_init_data.encoder);
54618888d1ea7a Wenjing Liu 2023-01-18  351  	enc_init_data.connector = link->link_id;
54618888d1ea7a Wenjing Liu 2023-01-18  352  	enc_init_data.channel = get_ddc_line(link);
54618888d1ea7a Wenjing Liu 2023-01-18  353  	enc_init_data.hpd_source = get_hpd_line(link);
54618888d1ea7a Wenjing Liu 2023-01-18  354  
54618888d1ea7a Wenjing Liu 2023-01-18  355  	link->hpd_src = enc_init_data.hpd_source;
54618888d1ea7a Wenjing Liu 2023-01-18  356  
54618888d1ea7a Wenjing Liu 2023-01-18  357  	enc_init_data.transmitter =
54618888d1ea7a Wenjing Liu 2023-01-18  358  		translate_encoder_to_transmitter(enc_init_data.encoder);
54618888d1ea7a Wenjing Liu 2023-01-18  359  	link->link_enc =
54618888d1ea7a Wenjing Liu 2023-01-18  360  		link->dc->res_pool->funcs->link_enc_create(dc_ctx, &enc_init_data);
54618888d1ea7a Wenjing Liu 2023-01-18  361  
54618888d1ea7a Wenjing Liu 2023-01-18 @362  	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
54618888d1ea7a Wenjing Liu 2023-01-18  363  	DC_LOG_DC("BIOS object table - IS_DP2_CAPABLE: %d", link->link_enc->features.flags.bits.IS_DP2_CAPABLE);
54618888d1ea7a Wenjing Liu 2023-01-18  364  
54618888d1ea7a Wenjing Liu 2023-01-18 @365  	if (!link->link_enc) {
54618888d1ea7a Wenjing Liu 2023-01-18  366  		DC_ERROR("Failed to create link encoder!\n");
54618888d1ea7a Wenjing Liu 2023-01-18  367  		goto link_enc_create_fail;
54618888d1ea7a Wenjing Liu 2023-01-18  368  	}
54618888d1ea7a Wenjing Liu 2023-01-18  369  
54618888d1ea7a Wenjing Liu 2023-01-18  370  	/* Update link encoder tracking variables. These are used for the dynamic
54618888d1ea7a Wenjing Liu 2023-01-18  371  	 * assignment of link encoders to streams.
54618888d1ea7a Wenjing Liu 2023-01-18  372  	 */
54618888d1ea7a Wenjing Liu 2023-01-18  373  	link->eng_id = link->link_enc->preferred_engine;
54618888d1ea7a Wenjing Liu 2023-01-18  374  	link->dc->res_pool->link_encoders[link->eng_id - ENGINE_ID_DIGA] = link->link_enc;
54618888d1ea7a Wenjing Liu 2023-01-18  375  	link->dc->res_pool->dig_link_enc_count++;
54618888d1ea7a Wenjing Liu 2023-01-18  376  
54618888d1ea7a Wenjing Liu 2023-01-18  377  	link->link_enc_hw_inst = link->link_enc->transmitter;
54618888d1ea7a Wenjing Liu 2023-01-18  378  	for (i = 0; i < 4; i++) {
54618888d1ea7a Wenjing Liu 2023-01-18  379  		if (bp_funcs->get_device_tag(dc_ctx->dc_bios,
54618888d1ea7a Wenjing Liu 2023-01-18  380  					     link->link_id, i,
54618888d1ea7a Wenjing Liu 2023-01-18  381  					     &link->device_tag) != BP_RESULT_OK) {
54618888d1ea7a Wenjing Liu 2023-01-18  382  			DC_ERROR("Failed to find device tag!\n");
54618888d1ea7a Wenjing Liu 2023-01-18  383  			goto device_tag_fail;
54618888d1ea7a Wenjing Liu 2023-01-18  384  		}
54618888d1ea7a Wenjing Liu 2023-01-18  385  
54618888d1ea7a Wenjing Liu 2023-01-18  386  		/* Look for device tag that matches connector signal,
54618888d1ea7a Wenjing Liu 2023-01-18  387  		 * CRT for rgb, LCD for other supported signal tyes
54618888d1ea7a Wenjing Liu 2023-01-18  388  		 */
54618888d1ea7a Wenjing Liu 2023-01-18  389  		if (!bp_funcs->is_device_id_supported(dc_ctx->dc_bios,
54618888d1ea7a Wenjing Liu 2023-01-18  390  						      link->device_tag.dev_id))
54618888d1ea7a Wenjing Liu 2023-01-18  391  			continue;
54618888d1ea7a Wenjing Liu 2023-01-18  392  		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_CRT &&
54618888d1ea7a Wenjing Liu 2023-01-18  393  		    link->connector_signal != SIGNAL_TYPE_RGB)
54618888d1ea7a Wenjing Liu 2023-01-18  394  			continue;
54618888d1ea7a Wenjing Liu 2023-01-18  395  		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_LCD &&
54618888d1ea7a Wenjing Liu 2023-01-18  396  		    link->connector_signal == SIGNAL_TYPE_RGB)
54618888d1ea7a Wenjing Liu 2023-01-18  397  			continue;
54618888d1ea7a Wenjing Liu 2023-01-18  398  
54618888d1ea7a Wenjing Liu 2023-01-18  399  		DC_LOG_DC("BIOS object table - device_tag.acpi_device: %d", link->device_tag.acpi_device);
54618888d1ea7a Wenjing Liu 2023-01-18  400  		DC_LOG_DC("BIOS object table - device_tag.dev_id.device_type: %d", link->device_tag.dev_id.device_type);
54618888d1ea7a Wenjing Liu 2023-01-18  401  		DC_LOG_DC("BIOS object table - device_tag.dev_id.enum_id: %d", link->device_tag.dev_id.enum_id);
54618888d1ea7a Wenjing Liu 2023-01-18  402  		break;
54618888d1ea7a Wenjing Liu 2023-01-18  403  	}
54618888d1ea7a Wenjing Liu 2023-01-18  404  
54618888d1ea7a Wenjing Liu 2023-01-18  405  	if (bios->integrated_info)
54618888d1ea7a Wenjing Liu 2023-01-18  406  		info = *bios->integrated_info;
54618888d1ea7a Wenjing Liu 2023-01-18  407  
54618888d1ea7a Wenjing Liu 2023-01-18  408  	/* Look for channel mapping corresponding to connector and device tag */
54618888d1ea7a Wenjing Liu 2023-01-18  409  	for (i = 0; i < MAX_NUMBER_OF_EXT_DISPLAY_PATH; i++) {
54618888d1ea7a Wenjing Liu 2023-01-18  410  		struct external_display_path *path =
54618888d1ea7a Wenjing Liu 2023-01-18  411  			&info.ext_disp_conn_info.path[i];
54618888d1ea7a Wenjing Liu 2023-01-18  412  
54618888d1ea7a Wenjing Liu 2023-01-18  413  		if (path->device_connector_id.enum_id == link->link_id.enum_id &&
54618888d1ea7a Wenjing Liu 2023-01-18  414  		    path->device_connector_id.id == link->link_id.id &&
54618888d1ea7a Wenjing Liu 2023-01-18  415  		    path->device_connector_id.type == link->link_id.type) {
54618888d1ea7a Wenjing Liu 2023-01-18  416  			if (link->device_tag.acpi_device != 0 &&
54618888d1ea7a Wenjing Liu 2023-01-18  417  			    path->device_acpi_enum == link->device_tag.acpi_device) {
54618888d1ea7a Wenjing Liu 2023-01-18  418  				link->ddi_channel_mapping = path->channel_mapping;
54618888d1ea7a Wenjing Liu 2023-01-18  419  				link->chip_caps = path->caps;
54618888d1ea7a Wenjing Liu 2023-01-18  420  				DC_LOG_DC("BIOS object table - ddi_channel_mapping: 0x%04X", link->ddi_channel_mapping.raw);
54618888d1ea7a Wenjing Liu 2023-01-18  421  				DC_LOG_DC("BIOS object table - chip_caps: %d", link->chip_caps);
54618888d1ea7a Wenjing Liu 2023-01-18  422  			} else if (path->device_tag ==
54618888d1ea7a Wenjing Liu 2023-01-18  423  				   link->device_tag.dev_id.raw_device_tag) {
54618888d1ea7a Wenjing Liu 2023-01-18  424  				link->ddi_channel_mapping = path->channel_mapping;
54618888d1ea7a Wenjing Liu 2023-01-18  425  				link->chip_caps = path->caps;
54618888d1ea7a Wenjing Liu 2023-01-18  426  				DC_LOG_DC("BIOS object table - ddi_channel_mapping: 0x%04X", link->ddi_channel_mapping.raw);
54618888d1ea7a Wenjing Liu 2023-01-18  427  				DC_LOG_DC("BIOS object table - chip_caps: %d", link->chip_caps);
54618888d1ea7a Wenjing Liu 2023-01-18  428  			}
54618888d1ea7a Wenjing Liu 2023-01-18  429  
54618888d1ea7a Wenjing Liu 2023-01-18  430  			if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) {
54618888d1ea7a Wenjing Liu 2023-01-18  431  				link->bios_forced_drive_settings.VOLTAGE_SWING =
54618888d1ea7a Wenjing Liu 2023-01-18  432  						(info.ext_disp_conn_info.fixdpvoltageswing & 0x3);
54618888d1ea7a Wenjing Liu 2023-01-18  433  				link->bios_forced_drive_settings.PRE_EMPHASIS =
54618888d1ea7a Wenjing Liu 2023-01-18  434  						((info.ext_disp_conn_info.fixdpvoltageswing >> 2) & 0x3);
54618888d1ea7a Wenjing Liu 2023-01-18  435  			}
54618888d1ea7a Wenjing Liu 2023-01-18  436  
54618888d1ea7a Wenjing Liu 2023-01-18  437  			break;
54618888d1ea7a Wenjing Liu 2023-01-18  438  		}
54618888d1ea7a Wenjing Liu 2023-01-18  439  	}
54618888d1ea7a Wenjing Liu 2023-01-18  440  
54618888d1ea7a Wenjing Liu 2023-01-18  441  	if (bios->funcs->get_atom_dc_golden_table)
54618888d1ea7a Wenjing Liu 2023-01-18  442  		bios->funcs->get_atom_dc_golden_table(bios);
54618888d1ea7a Wenjing Liu 2023-01-18  443  
54618888d1ea7a Wenjing Liu 2023-01-18  444  	/*
54618888d1ea7a Wenjing Liu 2023-01-18  445  	 * TODO check if GPIO programmed correctly
54618888d1ea7a Wenjing Liu 2023-01-18  446  	 *
54618888d1ea7a Wenjing Liu 2023-01-18  447  	 * If GPIO isn't programmed correctly HPD might not rise or drain
54618888d1ea7a Wenjing Liu 2023-01-18  448  	 * fast enough, leading to bounces.
54618888d1ea7a Wenjing Liu 2023-01-18  449  	 */
54618888d1ea7a Wenjing Liu 2023-01-18  450  	program_hpd_filter(link);
54618888d1ea7a Wenjing Liu 2023-01-18  451  
54618888d1ea7a Wenjing Liu 2023-01-18  452  	link->psr_settings.psr_vtotal_control_support = false;
54618888d1ea7a Wenjing Liu 2023-01-18  453  	link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
54618888d1ea7a Wenjing Liu 2023-01-18  454  
54618888d1ea7a Wenjing Liu 2023-01-18  455  	DC_LOG_DC("BIOS object table - dc_link_contruct finished successfully.\n");
54618888d1ea7a Wenjing Liu 2023-01-18  456  	return true;
54618888d1ea7a Wenjing Liu 2023-01-18  457  device_tag_fail:
54618888d1ea7a Wenjing Liu 2023-01-18  458  	link->link_enc->funcs->destroy(&link->link_enc);
54618888d1ea7a Wenjing Liu 2023-01-18  459  link_enc_create_fail:
54618888d1ea7a Wenjing Liu 2023-01-18  460  	if (link->panel_cntl != NULL)
54618888d1ea7a Wenjing Liu 2023-01-18  461  		link->panel_cntl->funcs->destroy(&link->panel_cntl);
54618888d1ea7a Wenjing Liu 2023-01-18  462  panel_cntl_create_fail:
54618888d1ea7a Wenjing Liu 2023-01-18  463  	link_destroy_ddc_service(&link->ddc);
54618888d1ea7a Wenjing Liu 2023-01-18  464  ddc_create_fail:
54618888d1ea7a Wenjing Liu 2023-01-18  465  create_fail:
54618888d1ea7a Wenjing Liu 2023-01-18  466  
54618888d1ea7a Wenjing Liu 2023-01-18  467  	if (link->hpd_gpio) {
54618888d1ea7a Wenjing Liu 2023-01-18  468  		dal_gpio_destroy_irq(&link->hpd_gpio);
54618888d1ea7a Wenjing Liu 2023-01-18  469  		link->hpd_gpio = NULL;
54618888d1ea7a Wenjing Liu 2023-01-18  470  	}
54618888d1ea7a Wenjing Liu 2023-01-18  471  
54618888d1ea7a Wenjing Liu 2023-01-18  472  	DC_LOG_DC("BIOS object table - dc_link_contruct failed.\n");
54618888d1ea7a Wenjing Liu 2023-01-18  473  	return false;
54618888d1ea7a Wenjing Liu 2023-01-18  474  }
54618888d1ea7a Wenjing Liu 2023-01-18  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
