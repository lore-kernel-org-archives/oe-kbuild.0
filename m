Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D186EBA22
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Dec 2023 21:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeU+BAj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704058695; x=1735594695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OwXl3Jw2AzNnhgu7L94vKW+WT9whODyx7ytxCTEqfDA=;
  b=MeU+BAj9MBqPfU7D7IAWA2gVCntwMtsPOR97wr0x9XeeSa0z+UqRutUK
   8st5lk9bdiQu1T9V2QVE1JkE3s14qVGKm2hIpIvh+/eb9IkWsyZaRZbqF
   fAijZBEHJyJoFVJ6eDrltfvOvybR9thfwaH10wHfw6kHFAU5hKZ5tZGd5
   wvS83NgA7MkJ8FMAcUBOkfx12qdiUROUA/sm+499sCluwqdEhfw51LV1t
   H+lCRZ/9fZMjJIvkQ5R1mE2HTpsAeEFFUCd2+eRyjOGESq+xMll2nuUTP
   4gg2P89PlJevxlodF6rB4DoJIT585+ckc24J/nJ13MmmUA3RbON7AUsQS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="10363988"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="10363988"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 13:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="902731551"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="902731551"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Dec 2023 13:38:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rK3VW-000JlL-0C;
	Sun, 31 Dec 2023 21:38:06 +0000
Date: Mon, 1 Jan 2024 05:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4679/10295]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9280
 amdgpu_dm_atomic_commit_tail() error: we previously assumed 'acrtc' could be
 null (see line 9277)
Message-ID: <202401010520.1VZfOvg0-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alex Hung <alex.hung@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Harry Wentland <harry.wentland@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: f872e2f5f0beabd34c03799a5c597f6ba47b51cc [4679/10295] drm/amd/display: Add writeback enable field (wb_enabled)
:::::: branch date: 10 days ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20231228 (https://download.01.org/0day-ci/archive/20240101/202401010520.1VZfOvg0-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401010520.1VZfOvg0-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9280 amdgpu_dm_atomic_commit_tail() error: we previously assumed 'acrtc' could be null (see line 9277)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1936 amdgpu_dm_fini() error: we previously assumed 'adev->dm.dc' could be null (see line 1920)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6246 create_stream_for_sink() error: we previously assumed 'aconnector->dc_sink' could be null (see line 6135)
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8862 dm_set_writeback() warn: possible memory leak of 'wb_info'
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8868 dm_set_writeback() warn: possible memory leak of 'wb_info'
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9096 amdgpu_dm_atomic_commit_tail() error: we previously assumed 'aconnector->dc_link' could be null (see line 9077)

vim +/acrtc +9280 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

585d450c76d1d5 Aurabindo Pillai    2020-08-12  9211  
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9212  		if (new_crtc_state->active &&
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9213  		    (!old_crtc_state->active ||
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9214  		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
585d450c76d1d5 Aurabindo Pillai    2020-08-12  9215  			dc_stream_retain(dm_new_crtc_state->stream);
585d450c76d1d5 Aurabindo Pillai    2020-08-12  9216  			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9217  			manage_dm_interrupts(adev, acrtc, true);
8799c0be89ebb9 Yunxiang Li         2022-09-21  9218  		}
8799c0be89ebb9 Yunxiang Li         2022-09-21  9219  		/* Handle vrr on->off / off->on transitions */
8799c0be89ebb9 Yunxiang Li         2022-09-21  9220  		amdgpu_dm_handle_vrr_transition(dm_old_crtc_state, dm_new_crtc_state);
e2881d6d0a2653 Rodrigo Siqueira    2021-01-07  9221  
24eb937416fde5 Rodrigo Siqueira    2021-01-07  9222  #ifdef CONFIG_DEBUG_FS
8799c0be89ebb9 Yunxiang Li         2022-09-21  9223  		if (new_crtc_state->active &&
8799c0be89ebb9 Yunxiang Li         2022-09-21  9224  		    (!old_crtc_state->active ||
8799c0be89ebb9 Yunxiang Li         2022-09-21  9225  		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9226  			/**
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9227  			 * Frontend may have changed so reapply the CRC capture
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9228  			 * settings for the stream.
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9229  			 */
8e7b6fee9b03d6 Wayne Lin           2021-02-09  9230  			if (amdgpu_dm_is_valid_crc_source(cur_crc_src)) {
86bc221918925a Wayne Lin           2021-03-02  9231  #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
d98af2725d42e8 Wayne Lin           2021-04-27  9232  				if (amdgpu_dm_crc_window_is_activated(crtc)) {
d98af2725d42e8 Wayne Lin           2021-04-27  9233  					spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
c0459bddd1955d Alan Liu            2022-10-20  9234  					acrtc->dm_irq_params.window_param.update_win = true;
1b11ff764aefc0 Alan Liu            2022-10-19  9235  
1b11ff764aefc0 Alan Liu            2022-10-19  9236  					/**
1b11ff764aefc0 Alan Liu            2022-10-19  9237  					 * It takes 2 frames for HW to stably generate CRC when
1b11ff764aefc0 Alan Liu            2022-10-19  9238  					 * resuming from suspend, so we set skip_frame_cnt 2.
1b11ff764aefc0 Alan Liu            2022-10-19  9239  					 */
c0459bddd1955d Alan Liu            2022-10-20  9240  					acrtc->dm_irq_params.window_param.skip_frame_cnt = 2;
d98af2725d42e8 Wayne Lin           2021-04-27  9241  					spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
d98af2725d42e8 Wayne Lin           2021-04-27  9242  				}
86bc221918925a Wayne Lin           2021-03-02  9243  #endif
bbc49fc0326be4 Wayne Lin           2021-04-28  9244  				if (amdgpu_dm_crtc_configure_crc_source(
bbc49fc0326be4 Wayne Lin           2021-04-28  9245  					crtc, dm_new_crtc_state, cur_crc_src))
bbc49fc0326be4 Wayne Lin           2021-04-28  9246  					DRM_DEBUG_DRIVER("Failed to configure crc source");
8799c0be89ebb9 Yunxiang Li         2022-09-21  9247  			}
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9248  		}
2130b87b227338 Nathan Chancellor   2022-10-14  9249  #endif
8fe684e97c86e3 Nicholas Kazlauskas 2020-07-13  9250  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  9251  
420cd472082697 David Francis       2019-03-01  9252  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
4d85f45c73a22b Daniel Vetter       2019-09-03  9253  		if (new_crtc_state->async_flip)
420cd472082697 David Francis       2019-03-01  9254  			wait_for_vblank = false;
420cd472082697 David Francis       2019-03-01  9255  
e7b07ceef2a650 Harry Wentland      2017-08-10  9256  	/* update planes when needed per crtc*/
5cc6dcbd45a60b Leo (Sunpeng  Li    2017-10-12  9257) 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j) {
54d76575246798 Leo (Sunpeng  Li    2017-10-12  9258) 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
e7b07ceef2a650 Harry Wentland      2017-08-10  9259  
54d76575246798 Leo (Sunpeng  Li    2017-10-12  9260) 		if (dm_new_crtc_state->stream)
fff7b95a5046be Alan Liu            2023-06-27  9261  			amdgpu_dm_commit_planes(state, dev, dm, crtc, wait_for_vblank);
e7b07ceef2a650 Harry Wentland      2017-08-10  9262  	}
e7b07ceef2a650 Harry Wentland      2017-08-10  9263  
c81e13b929df2f Alex Hung           2023-12-01  9264  	/* Enable writeback */
c81e13b929df2f Alex Hung           2023-12-01  9265  	for_each_new_connector_in_state(state, connector, new_con_state, i) {
c81e13b929df2f Alex Hung           2023-12-01  9266  		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
c81e13b929df2f Alex Hung           2023-12-01  9267  		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
c81e13b929df2f Alex Hung           2023-12-01  9268  
c81e13b929df2f Alex Hung           2023-12-01  9269  		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
c81e13b929df2f Alex Hung           2023-12-01  9270  			continue;
c81e13b929df2f Alex Hung           2023-12-01  9271  
c81e13b929df2f Alex Hung           2023-12-01  9272  		if (!new_con_state->writeback_job)
c81e13b929df2f Alex Hung           2023-12-01  9273  			continue;
c81e13b929df2f Alex Hung           2023-12-01  9274  
c81e13b929df2f Alex Hung           2023-12-01  9275  		new_crtc_state = NULL;
c81e13b929df2f Alex Hung           2023-12-01  9276  
c81e13b929df2f Alex Hung           2023-12-01 @9277  		if (acrtc)
c81e13b929df2f Alex Hung           2023-12-01  9278  			new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
c81e13b929df2f Alex Hung           2023-12-01  9279  
f872e2f5f0beab Alex Hung           2023-12-01 @9280  		if (acrtc->wb_enabled)
f872e2f5f0beab Alex Hung           2023-12-01  9281  			continue;
f872e2f5f0beab Alex Hung           2023-12-01  9282  
c81e13b929df2f Alex Hung           2023-12-01  9283  		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
c81e13b929df2f Alex Hung           2023-12-01  9284  
c81e13b929df2f Alex Hung           2023-12-01  9285  		dm_set_writeback(dm, dm_new_crtc_state, connector, new_con_state);
f872e2f5f0beab Alex Hung           2023-12-01  9286  		acrtc->wb_enabled = true;
c81e13b929df2f Alex Hung           2023-12-01  9287  	}
c81e13b929df2f Alex Hung           2023-12-01  9288  
6ce8f316673f61 Nicholas Kazlauskas 2019-07-11  9289  	/* Update audio instances for each connector. */
6ce8f316673f61 Nicholas Kazlauskas 2019-07-11  9290  	amdgpu_dm_commit_audio(dev, state);
6ce8f316673f61 Nicholas Kazlauskas 2019-07-11  9291  
7230362c78d441 Alex Deucher        2020-12-10  9292  	/* restore the backlight level */
7fd13baeb7a3a4 Alex Deucher        2021-07-08  9293  	for (i = 0; i < dm->num_of_edps; i++) {
7fd13baeb7a3a4 Alex Deucher        2021-07-08  9294  		if (dm->backlight_dev[i] &&
4052287a75eb3f Shirish S           2022-03-11  9295  		    (dm->actual_brightness[i] != dm->brightness[i]))
7fd13baeb7a3a4 Alex Deucher        2021-07-08  9296  			amdgpu_dm_backlight_set_level(dm, i, dm->brightness[i]);
7fd13baeb7a3a4 Alex Deucher        2021-07-08  9297  	}
83a3439ddb28e1 Hans de Goede       2022-06-20  9298  
e7b07ceef2a650 Harry Wentland      2017-08-10  9299  	/*
e7b07ceef2a650 Harry Wentland      2017-08-10  9300  	 * send vblank event on all events not handled in flip and
e7b07ceef2a650 Harry Wentland      2017-08-10  9301  	 * mark consumed event for drm_atomic_helper_commit_hw_done
e7b07ceef2a650 Harry Wentland      2017-08-10  9302  	 */
4a580877bdcb83 Luben Tuikov        2020-08-24  9303  	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  9304) 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
e7b07ceef2a650 Harry Wentland      2017-08-10  9305  
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  9306) 		if (new_crtc_state->event)
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  9307) 			drm_send_event_locked(dev, &new_crtc_state->event->base);
e7b07ceef2a650 Harry Wentland      2017-08-10  9308  
0bc9706db3a35b Leo (Sunpeng  Li    2017-10-12  9309) 		new_crtc_state->event = NULL;
e7b07ceef2a650 Harry Wentland      2017-08-10  9310  	}
4a580877bdcb83 Luben Tuikov        2020-08-24  9311  	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
e7b07ceef2a650 Harry Wentland      2017-08-10  9312  
29c8f23425e070 Leo Li              2019-01-07  9313  	/* Signal HW programming completion */
29c8f23425e070 Leo Li              2019-01-07  9314  	drm_atomic_helper_commit_hw_done(state);
e7b07ceef2a650 Harry Wentland      2017-08-10  9315  
e7b07ceef2a650 Harry Wentland      2017-08-10  9316  	if (wait_for_vblank)
320a127437e5d3 Andrey Grodzovsky   2017-11-14  9317  		drm_atomic_helper_wait_for_flip_done(dev, state);
e7b07ceef2a650 Harry Wentland      2017-08-10  9318  
e7b07ceef2a650 Harry Wentland      2017-08-10  9319  	drm_atomic_helper_cleanup_planes(dev, state);
97028037a38ae4 Lyude Paul          2018-06-04  9320  
e6b27cf515a781 Alex Deucher        2023-06-09  9321  	/* Don't free the memory if we are hitting this as part of suspend.
e6b27cf515a781 Alex Deucher        2023-06-09  9322  	 * This way we don't free any memory during suspend; see
e6b27cf515a781 Alex Deucher        2023-06-09  9323  	 * amdgpu_bo_free_kernel().  The memory will be freed in the first
e6b27cf515a781 Alex Deucher        2023-06-09  9324  	 * non-suspend modeset or when the driver is torn down.
e6b27cf515a781 Alex Deucher        2023-06-09  9325  	 */
e6b27cf515a781 Alex Deucher        2023-06-09  9326  	if (!adev->in_suspend) {
5f6fab247c7f20 Alex Deucher        2020-12-04  9327  		/* return the stolen vga memory back to VRAM */
5f6fab247c7f20 Alex Deucher        2020-12-04  9328  		if (!adev->mman.keep_stolen_vga_memory)
5f6fab247c7f20 Alex Deucher        2020-12-04  9329  			amdgpu_bo_free_kernel(&adev->mman.stolen_vga_memory, NULL, NULL);
5f6fab247c7f20 Alex Deucher        2020-12-04  9330  		amdgpu_bo_free_kernel(&adev->mman.stolen_extended_memory, NULL, NULL);
e6b27cf515a781 Alex Deucher        2023-06-09  9331  	}
5f6fab247c7f20 Alex Deucher        2020-12-04  9332  
1f6010a96273c3 David Francis       2018-08-15  9333  	/*
1f6010a96273c3 David Francis       2018-08-15  9334  	 * Finally, drop a runtime PM reference for each newly disabled CRTC,
97028037a38ae4 Lyude Paul          2018-06-04  9335  	 * so we can put the GPU into runtime suspend if we're not driving any
97028037a38ae4 Lyude Paul          2018-06-04  9336  	 * displays anymore
97028037a38ae4 Lyude Paul          2018-06-04  9337  	 */
fe2a19652918a5 Lyude Paul          2018-06-21  9338  	for (i = 0; i < crtc_disable_count; i++)
97028037a38ae4 Lyude Paul          2018-06-04  9339  		pm_runtime_put_autosuspend(dev->dev);
fe2a19652918a5 Lyude Paul          2018-06-21  9340  	pm_runtime_mark_last_busy(dev->dev);
e7b07ceef2a650 Harry Wentland      2017-08-10  9341  }
e7b07ceef2a650 Harry Wentland      2017-08-10  9342  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
