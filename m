Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A83E643
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 06:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677392933; x=1708928933;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xXkO0Ke61AWiwD7/idk5FDm90cpq7brwvBaAeKF8c0Y=;
  b=XEHL6zgGWZ7dLVM8KO5gNjt3vJgbuTo82U3/2O9VZD0BOd4PQSEWKP9v
   67b7j7dNcjMKQRBncRA75BUr8mrNRMQD0JSxh4+yX/uSHGTL+Jb1kQVbd
   dEx2WjeYzzxHLV0kQuOEUtDpY2LBqgol4hrDBML+DI/pUlXRZMMCHkacA
   ViToPCJF2eM3qN5LHtiIspejkA2W2UoLZmAttpsntLneElG+MAbxcPLwn
   0d8aDgVKiyynJfm8+a5o2WncLSMg11bauYLKY25Vmn94bDiITxFqbC6mt
   YyGlnLkW5mXhFpDMZc6F3JvkWN1uyxtSQJ3NvbGFIg0uAECv8Ys2wep+F
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="396237709"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="396237709"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 22:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="742114000"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="742114000"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2023 22:28:51 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWAWg-0003bv-0e;
	Sun, 26 Feb 2023 06:28:50 +0000
Date: Sun, 26 Feb 2023 14:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8336
 amdgpu_dm_atomic_commit_tail() error: we previously assumed
 'aconnector->dc_link' could be null (see line 8323)
Message-ID: <202302261411.GWe09a9G-lkp@intel.com>
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
TO: hersen wu <hersenxs.wu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2fcd07b7ccd5fd10b2120d298363e4e6c53ccf9c
commit: 82986fd631fa04bcedaefe11a6b3767601cbe84f drm/amd/display: save restore hdcp state when display is unplugged from mst hub
date:   10 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 weeks ago
config: m68k-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230226/202302261411.GWe09a9G-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302261411.GWe09a9G-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8336 amdgpu_dm_atomic_commit_tail() error: we previously assumed 'aconnector->dc_link' could be null (see line 8323)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1761 amdgpu_dm_fini() error: we previously assumed 'adev->dm.dc' could be null (see line 1757)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1788 amdgpu_dm_fini() warn: variable dereferenced before check 'adev->dm.dc' (see line 1761)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4029 amdgpu_dm_backlight_update_status() error: testing array offset 'i' after use.
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4071 amdgpu_dm_backlight_get_brightness() error: testing array offset 'i' after use.
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5899 create_stream_for_sink() error: we previously assumed 'aconnector->dc_sink' could be null (see line 5798)

vim +8336 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

e7b07ceef2a650 Harry Wentland      2017-08-10  8108  
b8592b48450b99 Leo Li              2018-09-14  8109  /**
b8592b48450b99 Leo Li              2018-09-14  8110   * amdgpu_dm_atomic_commit_tail() - AMDgpu DM's commit tail implementation.
b8592b48450b99 Leo Li              2018-09-14  8111   * @state: The atomic state to commit
b8592b48450b99 Leo Li              2018-09-14  8112   *
b8592b48450b99 Leo Li              2018-09-14  8113   * This will tell DC to commit the constructed DC state from atomic_check,
b8592b48450b99 Leo Li              2018-09-14  8114   * programming the hardware. Any failures here implies a hardware failure, since
b8592b48450b99 Leo Li              2018-09-14  8115   * atomic check should have filtered anything non-kosher.
b8592b48450b99 Leo Li              2018-09-14  8116   */
7578ecda14d521 Alex Deucher        2017-10-10  8117  static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
e7b07ceef2a650 Harry Wentland      2017-08-10  8118  {
e7b07ceef2a650 Harry Wentland      2017-08-10  8119  	struct drm_device *dev = state->dev;
1348969ab68cb8 Luben Tuikov        2020-08-24  8120  	struct amdgpu_device *adev = drm_to_adev(dev);
e7b07ceef2a650 Harry Wentland      2017-08-10  8121  	struct amdgpu_display_manager *dm = &adev->dm;
e7b07ceef2a650 Harry Wentland      2017-08-10  8122  	struct dm_atomic_state *dm_state;
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8123  	struct dc_state *dc_state = NULL, *dc_state_temp = NULL;
e7b07ceef2a650 Harry Wentland      2017-08-10  8124  	uint32_t i, j;
5cc6dcbd45a60b Leo (Sunpeng  Li    2017-10-12  8125) 	struct drm_crtc *crtc;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8126) 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
e7b07ceef2a650 Harry Wentland      2017-08-10  8127  	unsigned long flags;
e7b07ceef2a650 Harry Wentland      2017-08-10  8128  	bool wait_for_vblank = true;
e7b07ceef2a650 Harry Wentland      2017-08-10  8129  	struct drm_connector *connector;
c2cea7063b85fc Leo (Sunpeng  Li    2017-10-12  8130) 	struct drm_connector_state *old_con_state, *new_con_state;
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8131) 	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
fe2a19652918a5 Lyude Paul          2018-06-21  8132  	int crtc_disable_count = 0;
6ee90e88b97674 hersen wu           2020-07-08  8133  	bool mode_set_reset_required = false;
047de3f17a8321 Christian König     2022-05-09  8134  	int r;
e7b07ceef2a650 Harry Wentland      2017-08-10  8135  
e8a982355f9669 Rodrigo Siqueira    2020-09-04  8136  	trace_amdgpu_dm_atomic_commit_tail_begin(state);
e8a982355f9669 Rodrigo Siqueira    2020-09-04  8137  
047de3f17a8321 Christian König     2022-05-09  8138  	r = drm_atomic_helper_wait_for_fences(dev, state, false);
047de3f17a8321 Christian König     2022-05-09  8139  	if (unlikely(r))
047de3f17a8321 Christian König     2022-05-09  8140  		DRM_ERROR("Waiting for fences timed out!");
047de3f17a8321 Christian König     2022-05-09  8141  
e7b07ceef2a650 Harry Wentland      2017-08-10  8142  	drm_atomic_helper_update_legacy_modeset_state(dev, state);
a5c2c0d164e96d Lyude Paul          2022-08-17  8143  	drm_dp_mst_atomic_wait_for_dependencies(state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8144  
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8145  	dm_state = dm_atomic_get_new_state(state);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8146  	if (dm_state && dm_state->context) {
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8147  		dc_state = dm_state->context;
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8148  	} else {
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8149  		/* No state changes, retain current state. */
813d20dccf93f8 Aidan Wood          2019-02-22  8150  		dc_state_temp = dc_create_state(dm->dc);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8151  		ASSERT(dc_state_temp);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8152  		dc_state = dc_state_temp;
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8153  		dc_resource_state_copy_construct_current(dm->dc, dc_state);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8154  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8155  
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8156  	for_each_oldnew_crtc_in_state (state, crtc, old_crtc_state,
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8157  				       new_crtc_state, i) {
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8158  		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8159  
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8160  		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8161  
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8162  		if (old_crtc_state->active &&
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8163  		    (!new_crtc_state->active ||
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8164  		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8165  			manage_dm_interrupts(adev, acrtc, false);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8166  			dc_stream_release(dm_old_crtc_state->stream);
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8167  		}
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8168  	}
6d90a208cfff94 Aurabindo Pillai    2020-09-11  8169  
8976f73b676eb9 Rodrigo Siqueira    2020-11-17  8170  	drm_atomic_helper_calc_timestamping_constants(state);
8976f73b676eb9 Rodrigo Siqueira    2020-11-17  8171  
e7b07ceef2a650 Harry Wentland      2017-08-10  8172  	/* update changed items */
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8173) 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8174  		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
b830ebc910f641 Harry Wentland      2017-07-26  8175  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8176) 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8177) 		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8178  
9f07550b3c8a79 Sean Paul           2022-03-25  8179  		drm_dbg_state(state->dev,
e7b07ceef2a650 Harry Wentland      2017-08-10  8180  			"amdgpu_crtc id:%d crtc_state_flags: enable:%d, active:%d, "
e7b07ceef2a650 Harry Wentland      2017-08-10  8181  			"planes_changed:%d, mode_changed:%d,active_changed:%d,"
e7b07ceef2a650 Harry Wentland      2017-08-10  8182  			"connectors_changed:%d\n",
e7b07ceef2a650 Harry Wentland      2017-08-10  8183  			acrtc->crtc_id,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8184) 			new_crtc_state->enable,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8185) 			new_crtc_state->active,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8186) 			new_crtc_state->planes_changed,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8187) 			new_crtc_state->mode_changed,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8188) 			new_crtc_state->active_changed,
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8189) 			new_crtc_state->connectors_changed);
e7b07ceef2a650 Harry Wentland      2017-08-10  8190  
5c68c65295de0b Victor Lu           2020-10-23  8191  		/* Disable cursor if disabling crtc */
5c68c65295de0b Victor Lu           2020-10-23  8192  		if (old_crtc_state->active && !new_crtc_state->active) {
5c68c65295de0b Victor Lu           2020-10-23  8193  			struct dc_cursor_position position;
5c68c65295de0b Victor Lu           2020-10-23  8194  
5c68c65295de0b Victor Lu           2020-10-23  8195  			memset(&position, 0, sizeof(position));
5c68c65295de0b Victor Lu           2020-10-23  8196  			mutex_lock(&dm->dc_lock);
5c68c65295de0b Victor Lu           2020-10-23  8197  			dc_stream_set_cursor_position(dm_old_crtc_state->stream, &position);
5c68c65295de0b Victor Lu           2020-10-23  8198  			mutex_unlock(&dm->dc_lock);
5c68c65295de0b Victor Lu           2020-10-23  8199  		}
5c68c65295de0b Victor Lu           2020-10-23  8200  
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8201) 		/* Copy all transient state flags into dc state */
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8202) 		if (dm_new_crtc_state->stream) {
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8203) 			amdgpu_dm_crtc_copy_transient_flags(&dm_new_crtc_state->base,
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8204) 							    dm_new_crtc_state->stream);
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8205) 		}
27b3f4fc91e1df Leo (Sunpeng  Li    2017-11-10  8206) 
e7b07ceef2a650 Harry Wentland      2017-08-10  8207  		/* handles headless hotplug case, updating new_state and
e7b07ceef2a650 Harry Wentland      2017-08-10  8208  		 * aconnector as needed
e7b07ceef2a650 Harry Wentland      2017-08-10  8209  		 */
e7b07ceef2a650 Harry Wentland      2017-08-10  8210  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8211) 		if (modeset_required(new_crtc_state, dm_new_crtc_state->stream, dm_old_crtc_state->stream)) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8212  
4711c033f6d88e Luben Tuikov        2021-03-19  8213  			DRM_DEBUG_ATOMIC("Atomic commit: SET crtc id %d: [%p]\n", acrtc->crtc_id, acrtc);
e7b07ceef2a650 Harry Wentland      2017-08-10  8214  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8215) 			if (!dm_new_crtc_state->stream) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8216  				/*
e7b07ceef2a650 Harry Wentland      2017-08-10  8217  				 * this could happen because of issues with
e7b07ceef2a650 Harry Wentland      2017-08-10  8218  				 * userspace notifications delivery.
e7b07ceef2a650 Harry Wentland      2017-08-10  8219  				 * In this case userspace tries to set mode on
1f6010a96273c3 David Francis       2018-08-15  8220  				 * display which is disconnected in fact.
1f6010a96273c3 David Francis       2018-08-15  8221  				 * dc_sink is NULL in this case on aconnector.
e7b07ceef2a650 Harry Wentland      2017-08-10  8222  				 * We expect reset mode will come soon.
e7b07ceef2a650 Harry Wentland      2017-08-10  8223  				 *
e7b07ceef2a650 Harry Wentland      2017-08-10  8224  				 * This can also happen when unplug is done
e7b07ceef2a650 Harry Wentland      2017-08-10  8225  				 * during resume sequence ended
e7b07ceef2a650 Harry Wentland      2017-08-10  8226  				 *
e7b07ceef2a650 Harry Wentland      2017-08-10  8227  				 * In this case, we want to pretend we still
e7b07ceef2a650 Harry Wentland      2017-08-10  8228  				 * have a sink to keep the pipe running so that
e7b07ceef2a650 Harry Wentland      2017-08-10  8229  				 * hw state is consistent with the sw state
e7b07ceef2a650 Harry Wentland      2017-08-10  8230  				 */
f1ad2f5efd29dc Harry Wentland      2017-09-12  8231  				DRM_DEBUG_DRIVER("%s: Failed to create new stream for crtc %d\n",
e7b07ceef2a650 Harry Wentland      2017-08-10  8232  						__func__, acrtc->base.base.id);
e7b07ceef2a650 Harry Wentland      2017-08-10  8233  				continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8234  			}
e7b07ceef2a650 Harry Wentland      2017-08-10  8235  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8236) 			if (dm_old_crtc_state->stream)
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8237) 				remove_stream(adev, acrtc, dm_old_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8238  
97028037a38ae4 Lyude Paul          2018-06-04  8239  			pm_runtime_get_noresume(dev->dev);
97028037a38ae4 Lyude Paul          2018-06-04  8240  
e7b07ceef2a650 Harry Wentland      2017-08-10  8241  			acrtc->enabled = true;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8242) 			acrtc->hw_mode = new_crtc_state->mode;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8243) 			crtc->hwmode = new_crtc_state->mode;
6ee90e88b97674 hersen wu           2020-07-08  8244  			mode_set_reset_required = true;
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8245) 		} else if (modereset_required(new_crtc_state)) {
4711c033f6d88e Luben Tuikov        2021-03-19  8246  			DRM_DEBUG_ATOMIC("Atomic commit: RESET. crtc id %d:[%p]\n", acrtc->crtc_id, acrtc);
e7b07ceef2a650 Harry Wentland      2017-08-10  8247  			/* i.e. reset mode */
6ee90e88b97674 hersen wu           2020-07-08  8248  			if (dm_old_crtc_state->stream)
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8249) 				remove_stream(adev, acrtc, dm_old_crtc_state->stream);
a85ba00538cd4b Nikola Cornij       2021-03-15  8250  
6ee90e88b97674 hersen wu           2020-07-08  8251  			mode_set_reset_required = true;
8c322309e48e9f Roman Li            2019-09-20  8252  		}
e7b07ceef2a650 Harry Wentland      2017-08-10  8253  	} /* for_each_crtc_in_state() */
e7b07ceef2a650 Harry Wentland      2017-08-10  8254  
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8255  	if (dc_state) {
6ee90e88b97674 hersen wu           2020-07-08  8256  		/* if there mode set or reset, disable eDP PSR */
58aa1c50e5a231 Nicholas Kazlauskas 2021-08-03  8257  		if (mode_set_reset_required) {
06dd1888ee58d2 Nicholas Kazlauskas 2021-09-07  8258  			if (dm->vblank_control_workqueue)
58aa1c50e5a231 Nicholas Kazlauskas 2021-08-03  8259  				flush_workqueue(dm->vblank_control_workqueue);
cae5c1ab057197 Alex Hung           2022-04-25  8260  
6ee90e88b97674 hersen wu           2020-07-08  8261  			amdgpu_dm_psr_disable_all(dm);
58aa1c50e5a231 Nicholas Kazlauskas 2021-08-03  8262  		}
6ee90e88b97674 hersen wu           2020-07-08  8263  
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8264  		dm_enable_per_frame_crtc_master_sync(dc_state);
674e78acae0dfb Nicholas Kazlauskas 2018-12-05  8265  		mutex_lock(&dm->dc_lock);
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8266  		WARN_ON(!dc_commit_state(dm->dc, dc_state));
f3106c9424138f Jiapeng Chong       2022-05-12  8267  
5af50b0b1c200d Bindu Ramamurthy    2021-03-16  8268  		/* Allow idle optimization when vblank count is 0 for display off */
5af50b0b1c200d Bindu Ramamurthy    2021-03-16  8269  		if (dm->active_vblank_irq_count == 0)
5af50b0b1c200d Bindu Ramamurthy    2021-03-16  8270  			dc_allow_idle_optimizations(dm->dc, true);
674e78acae0dfb Nicholas Kazlauskas 2018-12-05  8271  		mutex_unlock(&dm->dc_lock);
fa2123dbccdc88 Mikita Lipski       2017-10-17  8272  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8273  
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8274) 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8275  		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
b830ebc910f641 Harry Wentland      2017-07-26  8276  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8277) 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
e7b07ceef2a650 Harry Wentland      2017-08-10  8278  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8279) 		if (dm_new_crtc_state->stream != NULL) {
e7b07ceef2a650 Harry Wentland      2017-08-10  8280  			const struct dc_stream_status *status =
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8281) 					dc_stream_get_status(dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8282  
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8283  			if (!status)
09f609c34fc8b9 Leo Li              2018-11-27  8284  				status = dc_stream_get_status_from_state(dc_state,
eb3dc8978596a0 Nicholas Kazlauskas 2018-11-22  8285  									 dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8286  			if (!status)
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8287) 				DC_ERR("got no status for stream %p on acrtc%p\n", dm_new_crtc_state->stream, acrtc);
e7b07ceef2a650 Harry Wentland      2017-08-10  8288  			else
e7b07ceef2a650 Harry Wentland      2017-08-10  8289  				acrtc->otg_inst = status->primary_otg_inst;
e7b07ceef2a650 Harry Wentland      2017-08-10  8290  		}
e7b07ceef2a650 Harry Wentland      2017-08-10  8291  	}
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8292  #ifdef CONFIG_DRM_AMD_DC_HDCP
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8293  	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8294  		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8295  		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8296  		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8297  
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8298  		new_crtc_state = NULL;
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8299  
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8300  		if (acrtc)
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8301  			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8302  
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8303  		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8304  
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8305  		if (dm_new_crtc_state && dm_new_crtc_state->stream == NULL &&
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8306  		    connector->state->content_protection == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8307  			hdcp_reset_display(adev->dm.hdcp_workqueue, aconnector->dc_link->link_index);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8308  			new_con_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
97f6c91787d9fc Bhawanpreet Lakha   2019-09-26  8309  			dm_new_con_state->update_hdcp = true;
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8310  			continue;
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8311  		}
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8312  
82986fd631fa04 hersen wu           2022-11-15  8313  		if (is_content_protection_different(new_con_state, old_con_state, connector, adev->dm.hdcp_workqueue)) {
82986fd631fa04 hersen wu           2022-11-15  8314  			/* when display is unplugged from mst hub, connctor will
82986fd631fa04 hersen wu           2022-11-15  8315  			 * be destroyed within dm_dp_mst_connector_destroy. connector
82986fd631fa04 hersen wu           2022-11-15  8316  			 * hdcp perperties, like type, undesired, desired, enabled,
82986fd631fa04 hersen wu           2022-11-15  8317  			 * will be lost. So, save hdcp properties into hdcp_work within
82986fd631fa04 hersen wu           2022-11-15  8318  			 * amdgpu_dm_atomic_commit_tail. if the same display is
82986fd631fa04 hersen wu           2022-11-15  8319  			 * plugged back with same display index, its hdcp properties
82986fd631fa04 hersen wu           2022-11-15  8320  			 * will be retrieved from hdcp_work within dm_dp_mst_get_modes
82986fd631fa04 hersen wu           2022-11-15  8321  			 */
82986fd631fa04 hersen wu           2022-11-15  8322  
82986fd631fa04 hersen wu           2022-11-15 @8323  			if (aconnector->dc_link && aconnector->dc_sink &&
82986fd631fa04 hersen wu           2022-11-15  8324  				aconnector->dc_link->type == dc_connection_mst_branch) {
82986fd631fa04 hersen wu           2022-11-15  8325  				struct hdcp_workqueue *hdcp_work = adev->dm.hdcp_workqueue;
82986fd631fa04 hersen wu           2022-11-15  8326  				struct hdcp_workqueue *hdcp_w =
82986fd631fa04 hersen wu           2022-11-15  8327  					&hdcp_work[aconnector->dc_link->link_index];
82986fd631fa04 hersen wu           2022-11-15  8328  
82986fd631fa04 hersen wu           2022-11-15  8329  				hdcp_w->hdcp_content_type[connector->index] =
82986fd631fa04 hersen wu           2022-11-15  8330  					new_con_state->hdcp_content_type;
82986fd631fa04 hersen wu           2022-11-15  8331  				hdcp_w->content_protection[connector->index] =
82986fd631fa04 hersen wu           2022-11-15  8332  					new_con_state->content_protection;
82986fd631fa04 hersen wu           2022-11-15  8333  			}
82986fd631fa04 hersen wu           2022-11-15  8334  
b1abe5586ffcb1 Bhawanpreet Lakha   2019-08-28  8335  			hdcp_update_display(
b1abe5586ffcb1 Bhawanpreet Lakha   2019-08-28 @8336  				adev->dm.hdcp_workqueue, aconnector->dc_link->link_index, aconnector,
23eb41917fc9f2 Bhawanpreet Lakha   2019-08-29  8337  				new_con_state->hdcp_content_type,
0e86d3d4fc5233 Yang Li             2021-02-18  8338  				new_con_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED);
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8339      }
82986fd631fa04 hersen wu           2022-11-15  8340  	}
0c8620d63d41fb Bhawanpreet Lakha   2019-09-16  8341  #endif
e7b07ceef2a650 Harry Wentland      2017-08-10  8342  
02d6a6fcdf68c4 David Francis       2018-12-18  8343  	/* Handle connector state changes */
c2cea7063b85fc Leo (Sunpeng  Li    2017-10-12  8344) 	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8345) 		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8346) 		struct dm_connector_state *dm_old_con_state = to_dm_connector_state(old_con_state);
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8347) 		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
efc8278eecfd5e Anson Jacob         2021-02-18  8348  		struct dc_surface_update dummy_updates[MAX_SURFACES];
19afd79951e630 Nathan Chancellor   2019-02-01  8349  		struct dc_stream_update stream_update;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8350  		struct dc_info_packet hdr_packet;
e7b07ceef2a650 Harry Wentland      2017-08-10  8351  		struct dc_stream_status *status = NULL;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8352  		bool abm_changed, hdr_changed, scaling_changed;
e7b07ceef2a650 Harry Wentland      2017-08-10  8353  
efc8278eecfd5e Anson Jacob         2021-02-18  8354  		memset(&dummy_updates, 0, sizeof(dummy_updates));
19afd79951e630 Nathan Chancellor   2019-02-01  8355  		memset(&stream_update, 0, sizeof(stream_update));
19afd79951e630 Nathan Chancellor   2019-02-01  8356  
44d09c6a577c8e Harry Wentland      2018-03-15  8357  		if (acrtc) {
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8358) 			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
44d09c6a577c8e Harry Wentland      2018-03-15  8359  			old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
44d09c6a577c8e Harry Wentland      2018-03-15  8360  		}
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8361) 
e7b07ceef2a650 Harry Wentland      2017-08-10  8362  		/* Skip any modesets/resets */
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  8363) 		if (!acrtc || drm_atomic_crtc_needs_modeset(new_crtc_state))
e7b07ceef2a650 Harry Wentland      2017-08-10  8364  			continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8365  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8366) 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
c1ee92f94ce3b9 David Francis       2018-11-26  8367  		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
c1ee92f94ce3b9 David Francis       2018-11-26  8368  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8369  		scaling_changed = is_scaling_state_different(dm_new_con_state,
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8370  							     dm_old_con_state);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8371  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8372  		abm_changed = dm_new_crtc_state->abm_level !=
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8373  			      dm_old_crtc_state->abm_level;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8374  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8375  		hdr_changed =
72921cdf8ac248 Maxime Ripard       2021-04-30  8376  			!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8377  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8378  		if (!scaling_changed && !abm_changed && !hdr_changed)
c1ee92f94ce3b9 David Francis       2018-11-26  8379  			continue;
e7b07ceef2a650 Harry Wentland      2017-08-10  8380  
b6e881c947417e Dmytro Laktyushkin  2019-09-13  8381  		stream_update.stream = dm_new_crtc_state->stream;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8382  		if (scaling_changed) {
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8383) 			update_stream_scaling_settings(&dm_new_con_state->base.crtc->mode,
b6e881c947417e Dmytro Laktyushkin  2019-09-13  8384  					dm_new_con_state, dm_new_crtc_state->stream);
e7b07ceef2a650 Harry Wentland      2017-08-10  8385  
02d6a6fcdf68c4 David Francis       2018-12-18  8386  			stream_update.src = dm_new_crtc_state->stream->src;
02d6a6fcdf68c4 David Francis       2018-12-18  8387  			stream_update.dst = dm_new_crtc_state->stream->dst;
02d6a6fcdf68c4 David Francis       2018-12-18  8388  		}
02d6a6fcdf68c4 David Francis       2018-12-18  8389  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8390  		if (abm_changed) {
02d6a6fcdf68c4 David Francis       2018-12-18  8391  			dm_new_crtc_state->stream->abm_level = dm_new_crtc_state->abm_level;
02d6a6fcdf68c4 David Francis       2018-12-18  8392  
02d6a6fcdf68c4 David Francis       2018-12-18  8393  			stream_update.abm_level = &dm_new_crtc_state->abm_level;
02d6a6fcdf68c4 David Francis       2018-12-18  8394  		}
70e8ffc55b98f3 Harry Wentland      2017-11-10  8395  
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8396  		if (hdr_changed) {
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8397  			fill_hdr_info_packet(new_con_state, &hdr_packet);
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8398  			stream_update.hdr_static_metadata = &hdr_packet;
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8399  		}
b232d4ed92eafb Nicholas Kazlauskas 2019-05-28  8400  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8401) 		status = dc_stream_get_status(dm_new_crtc_state->stream);
57738ae40f33c8 Nirmoy Das          2021-05-27  8402  
57738ae40f33c8 Nirmoy Das          2021-05-27  8403  		if (WARN_ON(!status))
57738ae40f33c8 Nirmoy Das          2021-05-27  8404  			continue;
57738ae40f33c8 Nirmoy Das          2021-05-27  8405  
3be5262e353b8a Harry Wentland      2017-07-27  8406  		WARN_ON(!status->plane_count);
e7b07ceef2a650 Harry Wentland      2017-08-10  8407  
02d6a6fcdf68c4 David Francis       2018-12-18  8408  		/*
02d6a6fcdf68c4 David Francis       2018-12-18  8409  		 * TODO: DC refuses to perform stream updates without a dc_surface_update.
02d6a6fcdf68c4 David Francis       2018-12-18  8410  		 * Here we create an empty update on each plane.
02d6a6fcdf68c4 David Francis       2018-12-18  8411  		 * To fix this, DC should permit updating only stream properties.
02d6a6fcdf68c4 David Francis       2018-12-18  8412  		 */
02d6a6fcdf68c4 David Francis       2018-12-18  8413  		for (j = 0; j < status->plane_count; j++)
efc8278eecfd5e Anson Jacob         2021-02-18  8414  			dummy_updates[j].surface = status->plane_states[0];
98e6436d3af5fe Anthony Koo         2018-08-21  8415  
02d6a6fcdf68c4 David Francis       2018-12-18  8416  
02d6a6fcdf68c4 David Francis       2018-12-18  8417  		mutex_lock(&dm->dc_lock);
02d6a6fcdf68c4 David Francis       2018-12-18  8418  		dc_commit_updates_for_stream(dm->dc,
efc8278eecfd5e Anson Jacob         2021-02-18  8419  						     dummy_updates,
3be5262e353b8a Harry Wentland      2017-07-27  8420  						     status->plane_count,
02d6a6fcdf68c4 David Francis       2018-12-18  8421  						     dm_new_crtc_state->stream,
efc8278eecfd5e Anson Jacob         2021-02-18  8422  						     &stream_update,
efc8278eecfd5e Anson Jacob         2021-02-18  8423  						     dc_state);
02d6a6fcdf68c4 David Francis       2018-12-18  8424  		mutex_unlock(&dm->dc_lock);
e7b07ceef2a650 Harry Wentland      2017-08-10  8425  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  8426  
8799c0be89ebb9 Yunxiang Li         2022-09-21  8427  	/**
8799c0be89ebb9 Yunxiang Li         2022-09-21  8428  	 * Enable interrupts for CRTCs that are newly enabled or went through
8799c0be89ebb9 Yunxiang Li         2022-09-21  8429  	 * a modeset. It was intentionally deferred until after the front end
8799c0be89ebb9 Yunxiang Li         2022-09-21  8430  	 * state was modified to wait until the OTG was on and so the IRQ
8799c0be89ebb9 Yunxiang Li         2022-09-21  8431  	 * handlers didn't access stale or invalid state.
8799c0be89ebb9 Yunxiang Li         2022-09-21  8432  	 */
8799c0be89ebb9 Yunxiang Li         2022-09-21  8433  	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
8799c0be89ebb9 Yunxiang Li         2022-09-21  8434  		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
8799c0be89ebb9 Yunxiang Li         2022-09-21  8435  #ifdef CONFIG_DEBUG_FS
8799c0be89ebb9 Yunxiang Li         2022-09-21  8436  		enum amdgpu_dm_pipe_crc_source cur_crc_src;
8799c0be89ebb9 Yunxiang Li         2022-09-21  8437  #endif
b5e83f6fe1f003 Nicholas Kazlauskas 2019-04-08  8438  		/* Count number of newly disabled CRTCs for dropping PM refs later. */
fe2a19652918a5 Lyude Paul          2018-06-21  8439  		if (old_crtc_state->active && !new_crtc_state->active)
fe2a19652918a5 Lyude Paul          2018-06-21  8440  			crtc_disable_count++;
fe2a19652918a5 Lyude Paul          2018-06-21  8441  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  8442) 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
e1fc2dca1295c4 Leo (Sunpeng  Li    2017-10-18  8443) 		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
66b0c973d7f74e Mario Kleiner       2019-03-29  8444  
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8445  		/* For freesync config update on crtc state and params for irq */
585d450c76d1d5 Aurabindo Pillai    2020-08-12  8446  		update_stream_irq_parameters(dm, dm_new_crtc_state);
057be086603feb Nicholas Kazlauskas 2019-04-15  8447  

:::::: The code at line 8336 was first introduced by commit
:::::: b1abe5586ffcb15cc51668bd1a0f97adfbfb0acd drm/amd/display: Refactor HDCP to handle multiple displays per link

:::::: TO: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
