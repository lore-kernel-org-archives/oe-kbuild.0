Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67997C
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jul 2023 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690104998; x=1721640998;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WvZH/yHoQa9avmtfGv4iTtHePBskoAsrDTcfN/2hPaU=;
  b=UQXxfnDrqs3D1Jos1wHJpN8n49bdowk7USd8FwkbpSejKlog7aYSEUwd
   oXYZw0bp82kZOlVU/STUaRTf5YfnJaKqCBEoZ84j7RwUsywRPlV1ssypc
   n3ldWvbegcGf/76n1Rpl/sGBGwR6KzpCPH9yMYs+abffEjTf9/phFnXeO
   k6njt4uxcDqbFd+FVJwY+NByVAn5vW5VkejPXMfwsqleXDaDVKqmlw2V7
   jV2dMLeZ/FFQ1zGHdbV9oPXMbG0BVw7dyAJ7wjNybcQ3p32MvO2wYa7Er
   jbqbsesIUCwYyMSjIY0iMdl5QFPvaxR/cjKJwjNJ6Sxrpu5UyJ2Gg7qvO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="433500962"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="433500962"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 02:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="790651136"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="790651136"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jul 2023 02:36:30 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNVVu-0008wh-0e;
	Sun, 23 Jul 2023 09:36:30 +0000
Date: Sun, 23 Jul 2023 17:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/display/intel_modeset_setup.c:871
 intel_modeset_readout_hw_state() error: uninitialized symbol 'pipe'.
Message-ID: <202307231705.DNNFNvPF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mika Kahola <mika.kahola@intel.com>
CC: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
CC: "José Roberto de Souza" <jose.souza@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Vinod Govindapillai <vinod.govindapillai@intel.com>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
CC: Imre Deak <imre.deak@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2782531397f5cb19ca3f8f9c17727f1cdf5bee8
commit: 4c4cc7ac207f56ed5db5272dab4169d2d40e418d drm/i915/mtl: Add support for PM DEMAND
date:   7 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m001-20230723 (https://download.01.org/0day-ci/archive/20230723/202307231705.DNNFNvPF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307231705.DNNFNvPF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307231705.DNNFNvPF-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_modeset_setup.c:871 intel_modeset_readout_hw_state() error: uninitialized symbol 'pipe'.

vim +/pipe +871 drivers/gpu/drm/i915/display/intel_modeset_setup.c

2c7676b6b1f5771 Jani Nikula   2022-06-17  674  
47fa33cc5461516 Jani Nikula   2022-06-17  675  static void intel_modeset_readout_hw_state(struct drm_i915_private *i915)
2c7676b6b1f5771 Jani Nikula   2022-06-17  676  {
2c7676b6b1f5771 Jani Nikula   2022-06-17  677  	struct intel_cdclk_state *cdclk_state =
d51309b4e9aa796 Jani Nikula   2022-08-29  678  		to_intel_cdclk_state(i915->display.cdclk.obj.state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  679  	struct intel_dbuf_state *dbuf_state =
b7d1559038b6c94 Jani Nikula   2022-08-29  680  		to_intel_dbuf_state(i915->display.dbuf.obj.state);
4c4cc7ac207f56e Mika Kahola   2023-06-06  681  	struct intel_pmdemand_state *pmdemand_state =
4c4cc7ac207f56e Mika Kahola   2023-06-06  682  		to_intel_pmdemand_state(i915->display.pmdemand.obj.state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  683  	enum pipe pipe;
2c7676b6b1f5771 Jani Nikula   2022-06-17  684  	struct intel_crtc *crtc;
2c7676b6b1f5771 Jani Nikula   2022-06-17  685  	struct intel_encoder *encoder;
2c7676b6b1f5771 Jani Nikula   2022-06-17  686  	struct intel_connector *connector;
2c7676b6b1f5771 Jani Nikula   2022-06-17  687  	struct drm_connector_list_iter conn_iter;
2c7676b6b1f5771 Jani Nikula   2022-06-17  688  	u8 active_pipes = 0;
2c7676b6b1f5771 Jani Nikula   2022-06-17  689  
47fa33cc5461516 Jani Nikula   2022-06-17  690  	for_each_intel_crtc(&i915->drm, crtc) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  691  		struct intel_crtc_state *crtc_state =
2c7676b6b1f5771 Jani Nikula   2022-06-17  692  			to_intel_crtc_state(crtc->base.state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  693  
2c7676b6b1f5771 Jani Nikula   2022-06-17  694  		__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
2c7676b6b1f5771 Jani Nikula   2022-06-17  695  		intel_crtc_free_hw_state(crtc_state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  696  		intel_crtc_state_reset(crtc_state, crtc);
2c7676b6b1f5771 Jani Nikula   2022-06-17  697  
2c7676b6b1f5771 Jani Nikula   2022-06-17  698  		intel_crtc_get_pipe_config(crtc_state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  699  
2c7676b6b1f5771 Jani Nikula   2022-06-17  700  		crtc_state->hw.enable = crtc_state->hw.active;
2c7676b6b1f5771 Jani Nikula   2022-06-17  701  
2c7676b6b1f5771 Jani Nikula   2022-06-17  702  		crtc->base.enabled = crtc_state->hw.enable;
2c7676b6b1f5771 Jani Nikula   2022-06-17  703  		crtc->active = crtc_state->hw.active;
2c7676b6b1f5771 Jani Nikula   2022-06-17  704  
2c7676b6b1f5771 Jani Nikula   2022-06-17  705  		if (crtc_state->hw.active)
2c7676b6b1f5771 Jani Nikula   2022-06-17  706  			active_pipes |= BIT(crtc->pipe);
2c7676b6b1f5771 Jani Nikula   2022-06-17  707  
47fa33cc5461516 Jani Nikula   2022-06-17  708  		drm_dbg_kms(&i915->drm,
2c7676b6b1f5771 Jani Nikula   2022-06-17  709  			    "[CRTC:%d:%s] hw state readout: %s\n",
2c7676b6b1f5771 Jani Nikula   2022-06-17  710  			    crtc->base.base.id, crtc->base.name,
2c7676b6b1f5771 Jani Nikula   2022-06-17  711  			    str_enabled_disabled(crtc_state->hw.active));
2c7676b6b1f5771 Jani Nikula   2022-06-17  712  	}
2c7676b6b1f5771 Jani Nikula   2022-06-17  713  
2c7676b6b1f5771 Jani Nikula   2022-06-17  714  	cdclk_state->active_pipes = active_pipes;
2c7676b6b1f5771 Jani Nikula   2022-06-17  715  	dbuf_state->active_pipes = active_pipes;
2c7676b6b1f5771 Jani Nikula   2022-06-17  716  
47fa33cc5461516 Jani Nikula   2022-06-17  717  	readout_plane_state(i915);
2c7676b6b1f5771 Jani Nikula   2022-06-17  718  
47fa33cc5461516 Jani Nikula   2022-06-17  719  	for_each_intel_encoder(&i915->drm, encoder) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  720  		struct intel_crtc_state *crtc_state = NULL;
2c7676b6b1f5771 Jani Nikula   2022-06-17  721  
2c7676b6b1f5771 Jani Nikula   2022-06-17  722  		pipe = 0;
2c7676b6b1f5771 Jani Nikula   2022-06-17  723  
2c7676b6b1f5771 Jani Nikula   2022-06-17  724  		if (encoder->get_hw_state(encoder, &pipe)) {
47fa33cc5461516 Jani Nikula   2022-06-17  725  			crtc = intel_crtc_for_pipe(i915, pipe);
2c7676b6b1f5771 Jani Nikula   2022-06-17  726  			crtc_state = to_intel_crtc_state(crtc->base.state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  727  
2c7676b6b1f5771 Jani Nikula   2022-06-17  728  			encoder->base.crtc = &crtc->base;
2c7676b6b1f5771 Jani Nikula   2022-06-17  729  			intel_encoder_get_config(encoder, crtc_state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  730  
2c7676b6b1f5771 Jani Nikula   2022-06-17  731  			/* read out to slave crtc as well for bigjoiner */
2c7676b6b1f5771 Jani Nikula   2022-06-17  732  			if (crtc_state->bigjoiner_pipes) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  733  				struct intel_crtc *slave_crtc;
2c7676b6b1f5771 Jani Nikula   2022-06-17  734  
2c7676b6b1f5771 Jani Nikula   2022-06-17  735  				/* encoder should read be linked to bigjoiner master */
2c7676b6b1f5771 Jani Nikula   2022-06-17  736  				WARN_ON(intel_crtc_is_bigjoiner_slave(crtc_state));
2c7676b6b1f5771 Jani Nikula   2022-06-17  737  
47fa33cc5461516 Jani Nikula   2022-06-17  738  				for_each_intel_crtc_in_pipe_mask(&i915->drm, slave_crtc,
2c7676b6b1f5771 Jani Nikula   2022-06-17  739  								 intel_crtc_bigjoiner_slave_pipes(crtc_state)) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  740  					struct intel_crtc_state *slave_crtc_state;
2c7676b6b1f5771 Jani Nikula   2022-06-17  741  
2c7676b6b1f5771 Jani Nikula   2022-06-17  742  					slave_crtc_state = to_intel_crtc_state(slave_crtc->base.state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  743  					intel_encoder_get_config(encoder, slave_crtc_state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  744  				}
2c7676b6b1f5771 Jani Nikula   2022-06-17  745  			}
4c4cc7ac207f56e Mika Kahola   2023-06-06  746  
4c4cc7ac207f56e Mika Kahola   2023-06-06  747  			intel_pmdemand_update_phys_mask(i915, encoder,
4c4cc7ac207f56e Mika Kahola   2023-06-06  748  							pmdemand_state,
4c4cc7ac207f56e Mika Kahola   2023-06-06  749  							true);
2c7676b6b1f5771 Jani Nikula   2022-06-17  750  		} else {
4c4cc7ac207f56e Mika Kahola   2023-06-06  751  			intel_pmdemand_update_phys_mask(i915, encoder,
4c4cc7ac207f56e Mika Kahola   2023-06-06  752  							pmdemand_state,
4c4cc7ac207f56e Mika Kahola   2023-06-06  753  							false);
4c4cc7ac207f56e Mika Kahola   2023-06-06  754  
2c7676b6b1f5771 Jani Nikula   2022-06-17  755  			encoder->base.crtc = NULL;
2c7676b6b1f5771 Jani Nikula   2022-06-17  756  		}
2c7676b6b1f5771 Jani Nikula   2022-06-17  757  
2c7676b6b1f5771 Jani Nikula   2022-06-17  758  		if (encoder->sync_state)
2c7676b6b1f5771 Jani Nikula   2022-06-17  759  			encoder->sync_state(encoder, crtc_state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  760  
47fa33cc5461516 Jani Nikula   2022-06-17  761  		drm_dbg_kms(&i915->drm,
2c7676b6b1f5771 Jani Nikula   2022-06-17  762  			    "[ENCODER:%d:%s] hw state readout: %s, pipe %c\n",
2c7676b6b1f5771 Jani Nikula   2022-06-17  763  			    encoder->base.base.id, encoder->base.name,
2c7676b6b1f5771 Jani Nikula   2022-06-17  764  			    str_enabled_disabled(encoder->base.crtc),
2c7676b6b1f5771 Jani Nikula   2022-06-17  765  			    pipe_name(pipe));
2c7676b6b1f5771 Jani Nikula   2022-06-17  766  	}
2c7676b6b1f5771 Jani Nikula   2022-06-17  767  
47fa33cc5461516 Jani Nikula   2022-06-17  768  	intel_dpll_readout_hw_state(i915);
2c7676b6b1f5771 Jani Nikula   2022-06-17  769  
47fa33cc5461516 Jani Nikula   2022-06-17  770  	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
2c7676b6b1f5771 Jani Nikula   2022-06-17  771  	for_each_intel_connector_iter(connector, &conn_iter) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  772  		if (connector->get_hw_state(connector)) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  773  			struct intel_crtc_state *crtc_state;
2c7676b6b1f5771 Jani Nikula   2022-06-17  774  			struct intel_crtc *crtc;
2c7676b6b1f5771 Jani Nikula   2022-06-17  775  
2c7676b6b1f5771 Jani Nikula   2022-06-17  776  			connector->base.dpms = DRM_MODE_DPMS_ON;
2c7676b6b1f5771 Jani Nikula   2022-06-17  777  
2c7676b6b1f5771 Jani Nikula   2022-06-17  778  			encoder = intel_attached_encoder(connector);
2c7676b6b1f5771 Jani Nikula   2022-06-17  779  			connector->base.encoder = &encoder->base;
2c7676b6b1f5771 Jani Nikula   2022-06-17  780  
2c7676b6b1f5771 Jani Nikula   2022-06-17  781  			crtc = to_intel_crtc(encoder->base.crtc);
2c7676b6b1f5771 Jani Nikula   2022-06-17  782  			crtc_state = crtc ? to_intel_crtc_state(crtc->base.state) : NULL;
2c7676b6b1f5771 Jani Nikula   2022-06-17  783  
2c7676b6b1f5771 Jani Nikula   2022-06-17  784  			if (crtc_state && crtc_state->hw.active) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  785  				/*
2c7676b6b1f5771 Jani Nikula   2022-06-17  786  				 * This has to be done during hardware readout
2c7676b6b1f5771 Jani Nikula   2022-06-17  787  				 * because anything calling .crtc_disable may
2c7676b6b1f5771 Jani Nikula   2022-06-17  788  				 * rely on the connector_mask being accurate.
2c7676b6b1f5771 Jani Nikula   2022-06-17  789  				 */
2c7676b6b1f5771 Jani Nikula   2022-06-17  790  				crtc_state->uapi.connector_mask |=
2c7676b6b1f5771 Jani Nikula   2022-06-17  791  					drm_connector_mask(&connector->base);
2c7676b6b1f5771 Jani Nikula   2022-06-17  792  				crtc_state->uapi.encoder_mask |=
2c7676b6b1f5771 Jani Nikula   2022-06-17  793  					drm_encoder_mask(&encoder->base);
2c7676b6b1f5771 Jani Nikula   2022-06-17  794  			}
2c7676b6b1f5771 Jani Nikula   2022-06-17  795  		} else {
2c7676b6b1f5771 Jani Nikula   2022-06-17  796  			connector->base.dpms = DRM_MODE_DPMS_OFF;
2c7676b6b1f5771 Jani Nikula   2022-06-17  797  			connector->base.encoder = NULL;
2c7676b6b1f5771 Jani Nikula   2022-06-17  798  		}
47fa33cc5461516 Jani Nikula   2022-06-17  799  		drm_dbg_kms(&i915->drm,
2c7676b6b1f5771 Jani Nikula   2022-06-17  800  			    "[CONNECTOR:%d:%s] hw state readout: %s\n",
2c7676b6b1f5771 Jani Nikula   2022-06-17  801  			    connector->base.base.id, connector->base.name,
2c7676b6b1f5771 Jani Nikula   2022-06-17  802  			    str_enabled_disabled(connector->base.encoder));
2c7676b6b1f5771 Jani Nikula   2022-06-17  803  	}
2c7676b6b1f5771 Jani Nikula   2022-06-17  804  	drm_connector_list_iter_end(&conn_iter);
2c7676b6b1f5771 Jani Nikula   2022-06-17  805  
47fa33cc5461516 Jani Nikula   2022-06-17  806  	for_each_intel_crtc(&i915->drm, crtc) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  807  		struct intel_bw_state *bw_state =
f0acaf9d6912240 Jani Nikula   2022-08-29  808  			to_intel_bw_state(i915->display.bw.obj.state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  809  		struct intel_crtc_state *crtc_state =
2c7676b6b1f5771 Jani Nikula   2022-06-17  810  			to_intel_crtc_state(crtc->base.state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  811  		struct intel_plane *plane;
2c7676b6b1f5771 Jani Nikula   2022-06-17  812  		int min_cdclk = 0;
2c7676b6b1f5771 Jani Nikula   2022-06-17  813  
2c7676b6b1f5771 Jani Nikula   2022-06-17  814  		if (crtc_state->hw.active) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  815  			/*
2c7676b6b1f5771 Jani Nikula   2022-06-17  816  			 * The initial mode needs to be set in order to keep
2c7676b6b1f5771 Jani Nikula   2022-06-17  817  			 * the atomic core happy. It wants a valid mode if the
2c7676b6b1f5771 Jani Nikula   2022-06-17  818  			 * crtc's enabled, so we do the above call.
2c7676b6b1f5771 Jani Nikula   2022-06-17  819  			 *
2c7676b6b1f5771 Jani Nikula   2022-06-17  820  			 * But we don't set all the derived state fully, hence
2c7676b6b1f5771 Jani Nikula   2022-06-17  821  			 * set a flag to indicate that a full recalculation is
2c7676b6b1f5771 Jani Nikula   2022-06-17  822  			 * needed on the next commit.
2c7676b6b1f5771 Jani Nikula   2022-06-17  823  			 */
2c7676b6b1f5771 Jani Nikula   2022-06-17  824  			crtc_state->inherited = true;
2c7676b6b1f5771 Jani Nikula   2022-06-17  825  
ecaeecea9263496 Ville Syrjälä 2023-03-20  826  			intel_crtc_update_active_timings(crtc_state,
ecaeecea9263496 Ville Syrjälä 2023-03-20  827  							 crtc_state->vrr.enable);
2c7676b6b1f5771 Jani Nikula   2022-06-17  828  
2c7676b6b1f5771 Jani Nikula   2022-06-17  829  			intel_crtc_copy_hw_to_uapi_state(crtc_state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  830  		}
2c7676b6b1f5771 Jani Nikula   2022-06-17  831  
47fa33cc5461516 Jani Nikula   2022-06-17  832  		for_each_intel_plane_on_crtc(&i915->drm, crtc, plane) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  833  			const struct intel_plane_state *plane_state =
2c7676b6b1f5771 Jani Nikula   2022-06-17  834  				to_intel_plane_state(plane->base.state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  835  
2c7676b6b1f5771 Jani Nikula   2022-06-17  836  			/*
2c7676b6b1f5771 Jani Nikula   2022-06-17  837  			 * FIXME don't have the fb yet, so can't
2c7676b6b1f5771 Jani Nikula   2022-06-17  838  			 * use intel_plane_data_rate() :(
2c7676b6b1f5771 Jani Nikula   2022-06-17  839  			 */
2c7676b6b1f5771 Jani Nikula   2022-06-17  840  			if (plane_state->uapi.visible)
2c7676b6b1f5771 Jani Nikula   2022-06-17  841  				crtc_state->data_rate[plane->id] =
2c7676b6b1f5771 Jani Nikula   2022-06-17  842  					4 * crtc_state->pixel_rate;
2c7676b6b1f5771 Jani Nikula   2022-06-17  843  			/*
2c7676b6b1f5771 Jani Nikula   2022-06-17  844  			 * FIXME don't have the fb yet, so can't
2c7676b6b1f5771 Jani Nikula   2022-06-17  845  			 * use plane->min_cdclk() :(
2c7676b6b1f5771 Jani Nikula   2022-06-17  846  			 */
2c7676b6b1f5771 Jani Nikula   2022-06-17  847  			if (plane_state->uapi.visible && plane->min_cdclk) {
47fa33cc5461516 Jani Nikula   2022-06-17  848  				if (crtc_state->double_wide || DISPLAY_VER(i915) >= 10)
2c7676b6b1f5771 Jani Nikula   2022-06-17  849  					crtc_state->min_cdclk[plane->id] =
2c7676b6b1f5771 Jani Nikula   2022-06-17  850  						DIV_ROUND_UP(crtc_state->pixel_rate, 2);
2c7676b6b1f5771 Jani Nikula   2022-06-17  851  				else
2c7676b6b1f5771 Jani Nikula   2022-06-17  852  					crtc_state->min_cdclk[plane->id] =
2c7676b6b1f5771 Jani Nikula   2022-06-17  853  						crtc_state->pixel_rate;
2c7676b6b1f5771 Jani Nikula   2022-06-17  854  			}
47fa33cc5461516 Jani Nikula   2022-06-17  855  			drm_dbg_kms(&i915->drm,
2c7676b6b1f5771 Jani Nikula   2022-06-17  856  				    "[PLANE:%d:%s] min_cdclk %d kHz\n",
2c7676b6b1f5771 Jani Nikula   2022-06-17  857  				    plane->base.base.id, plane->base.name,
2c7676b6b1f5771 Jani Nikula   2022-06-17  858  				    crtc_state->min_cdclk[plane->id]);
2c7676b6b1f5771 Jani Nikula   2022-06-17  859  		}
2c7676b6b1f5771 Jani Nikula   2022-06-17  860  
2c7676b6b1f5771 Jani Nikula   2022-06-17  861  		if (crtc_state->hw.active) {
2c7676b6b1f5771 Jani Nikula   2022-06-17  862  			min_cdclk = intel_crtc_compute_min_cdclk(crtc_state);
47fa33cc5461516 Jani Nikula   2022-06-17  863  			if (drm_WARN_ON(&i915->drm, min_cdclk < 0))
2c7676b6b1f5771 Jani Nikula   2022-06-17  864  				min_cdclk = 0;
2c7676b6b1f5771 Jani Nikula   2022-06-17  865  		}
2c7676b6b1f5771 Jani Nikula   2022-06-17  866  
2c7676b6b1f5771 Jani Nikula   2022-06-17  867  		cdclk_state->min_cdclk[crtc->pipe] = min_cdclk;
2c7676b6b1f5771 Jani Nikula   2022-06-17  868  		cdclk_state->min_voltage_level[crtc->pipe] =
2c7676b6b1f5771 Jani Nikula   2022-06-17  869  			crtc_state->min_voltage_level;
2c7676b6b1f5771 Jani Nikula   2022-06-17  870  
4c4cc7ac207f56e Mika Kahola   2023-06-06 @871  		intel_pmdemand_update_port_clock(i915, pmdemand_state, pipe,
4c4cc7ac207f56e Mika Kahola   2023-06-06  872  						 crtc_state->port_clock);
4c4cc7ac207f56e Mika Kahola   2023-06-06  873  
2c7676b6b1f5771 Jani Nikula   2022-06-17  874  		intel_bw_crtc_update(bw_state, crtc_state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  875  	}
4c4cc7ac207f56e Mika Kahola   2023-06-06  876  
4c4cc7ac207f56e Mika Kahola   2023-06-06  877  	intel_pmdemand_init_pmdemand_params(i915, pmdemand_state);
2c7676b6b1f5771 Jani Nikula   2022-06-17  878  }
2c7676b6b1f5771 Jani Nikula   2022-06-17  879  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
