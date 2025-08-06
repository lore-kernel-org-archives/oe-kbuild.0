Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024311FB3
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 01:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754443981; cv=none; b=cqtL+HxD1hO1U6DIYbQuS1zhgFEKQMt4FeUcIHTvr6JkzXGJILyPKl4ohxWoTgA71rfwJa2hXk6ls0YLKk92qg6voIPr30tvx57FgISNH74/OxYCkvGpH+lWwkLz2Uyt/qCfWnUzp114U0Comv9rcuLQLeQgGJuAAEUX1NL4klU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754443981; c=relaxed/simple;
	bh=QsZGhkS9gT3Su/EFmloT+ndpRWZRn+idvx1e3WpeNx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEiw7569c5oX5t6I3jTYi8BffINxHcdAZc/KxmGzuJvm5/2nbseREWjRVIz+NXEzUwDE6wfRH1dbagrd37jOIvOV638N/TFu3hfDFsK/KPVKBK4S1+NSC4KjYtolSX0VQKUO/E18juEXZ2In64lTyWhrRAV0mPsdTjS1NL1B7hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDZYC9p0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDZYC9p0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754443980; x=1785979980;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QsZGhkS9gT3Su/EFmloT+ndpRWZRn+idvx1e3WpeNx4=;
  b=LDZYC9p0iAPBUsRW4cqHxMSIbhggTDncjTfL85JA/N5tmGCwvQDJ0156
   Itqov2Y3g95npx0d7Zif2cmsMwkh2RqBt1IzZs3UuEIj6TOMbdR2M62jF
   QNg6LGLaGxZ5avKmB55yoZHF7hSwcDmeg3h/yyN/8VTPQP815cj0WGKx/
   X20D4ay1uNe/cD8QqksT5pMWOtoVn3bfjGlIkKAtRMgRD/x/NMbSYLYAK
   i6hsGuadISSv6rpGR4uKLbSq7ZvYqcFxgyqKpPjBXNJc3jCn/LM1H8HTG
   69L5EXgEt2YbmhotM9I36kWK/2rRTsRLAKPSTbHrbMtcKIMS8xGYt0ZSd
   g==;
X-CSE-ConnectionGUID: k4YV3YVfSwqTzR4nZlhQcw==
X-CSE-MsgGUID: WY8gnywkT5iv2xk2rk4xtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56836965"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56836965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 18:32:59 -0700
X-CSE-ConnectionGUID: jxEBqT8gTxuY2p3ZLi/nbQ==
X-CSE-MsgGUID: FufikMBfR8+nqnJ6SQzr1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="201822892"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Aug 2025 18:32:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujT1N-0000sM-0U;
	Wed, 06 Aug 2025 01:32:51 +0000
Date: Wed, 6 Aug 2025 09:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13146/13293]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:623
 dm_vupdate_high_irq() warn: variable dereferenced before check
 'acrtc->dm_irq_params.stream' (see line 615)
Message-ID: <202508060905.UfJvsVLK-lkp@intel.com>
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
TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
CC: Ray Wu <ray.wu@amd.com>
CC: Roman Li <roman.li@amd.com>
CC: ChiaHsuan Chung <chiahsuan.chung@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   afec768a6a8fe7fb02a08ffce5f2f556f51d4b52
commit: 6d31602a9f57a7bb3c6c8dbde1d00af67e250a3f [13146/13293] drm/amd/display: more liberal vmin/vmax update for freesync
:::::: branch date: 22 hours ago
:::::: commit date: 31 hours ago
config: xtensa-randconfig-r071-20250805 (https://download.01.org/0day-ci/archive/20250806/202508060905.UfJvsVLK-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508060905.UfJvsVLK-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:623 dm_vupdate_high_irq() warn: variable dereferenced before check 'acrtc->dm_irq_params.stream' (see line 615)

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6036 fill_dc_dirty_rects() warn: iterator 'i' not incremented
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:12509 parse_edid_displayid_vrr() warn: variable dereferenced before check 'edid_ext' (see line 12505)

vim +623 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

c210b757b40095 Aurabindo Pillai 2025-07-21  576  
d2574c33bb7195 Mario Kleiner    2019-03-29  577  static void dm_vupdate_high_irq(void *interrupt_params)
d2574c33bb7195 Mario Kleiner    2019-03-29  578  {
d2574c33bb7195 Mario Kleiner    2019-03-29  579  	struct common_irq_params *irq_params = interrupt_params;
d2574c33bb7195 Mario Kleiner    2019-03-29  580  	struct amdgpu_device *adev = irq_params->adev;
d2574c33bb7195 Mario Kleiner    2019-03-29  581  	struct amdgpu_crtc *acrtc;
4758823355a0ed Rodrigo Siqueira 2021-03-10  582  	struct drm_device *drm_dev;
4758823355a0ed Rodrigo Siqueira 2021-03-10  583  	struct drm_vblank_crtc *vblank;
4758823355a0ed Rodrigo Siqueira 2021-03-10  584  	ktime_t frame_duration_ns, previous_timestamp;
09aef2c48e799b Mario Kleiner    2019-04-26  585  	unsigned long flags;
585d450c76d1d5 Aurabindo Pillai 2020-08-12  586  	int vrr_active;
d2574c33bb7195 Mario Kleiner    2019-03-29  587  
d2574c33bb7195 Mario Kleiner    2019-03-29  588  	acrtc = get_crtc_by_otg_inst(adev, irq_params->irq_src - IRQ_TYPE_VUPDATE);
d2574c33bb7195 Mario Kleiner    2019-03-29  589  
d2574c33bb7195 Mario Kleiner    2019-03-29  590  	if (acrtc) {
6c5e25a0255d56 David Tadokoro   2023-03-07  591  		vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
4758823355a0ed Rodrigo Siqueira 2021-03-10  592  		drm_dev = acrtc->base.dev;
d26238c6806d56 Ville Syrjälä    2024-04-08  593  		vblank = drm_crtc_vblank_crtc(&acrtc->base);
4758823355a0ed Rodrigo Siqueira 2021-03-10  594  		previous_timestamp = atomic64_read(&irq_params->previous_timestamp);
4758823355a0ed Rodrigo Siqueira 2021-03-10  595  		frame_duration_ns = vblank->time - previous_timestamp;
4758823355a0ed Rodrigo Siqueira 2021-03-10  596  
4758823355a0ed Rodrigo Siqueira 2021-03-10  597  		if (frame_duration_ns > 0) {
4758823355a0ed Rodrigo Siqueira 2021-03-10  598  			trace_amdgpu_refresh_rate_track(acrtc->base.index,
4758823355a0ed Rodrigo Siqueira 2021-03-10  599  						frame_duration_ns,
4758823355a0ed Rodrigo Siqueira 2021-03-10  600  						ktime_divns(NSEC_PER_SEC, frame_duration_ns));
4758823355a0ed Rodrigo Siqueira 2021-03-10  601  			atomic64_set(&irq_params->previous_timestamp, vblank->time);
4758823355a0ed Rodrigo Siqueira 2021-03-10  602  		}
d2574c33bb7195 Mario Kleiner    2019-03-29  603  
5d72e247e58c96 Hamza Mahfooz    2023-09-20  604  		drm_dbg_vbl(drm_dev,
5d72e247e58c96 Hamza Mahfooz    2023-09-20  605  			    "crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
585d450c76d1d5 Aurabindo Pillai 2020-08-12  606  			    vrr_active);
d2574c33bb7195 Mario Kleiner    2019-03-29  607  
d2574c33bb7195 Mario Kleiner    2019-03-29  608  		/* Core vblank handling is done here after end of front-porch in
d2574c33bb7195 Mario Kleiner    2019-03-29  609  		 * vrr mode, as vblank timestamping will give valid results
d2574c33bb7195 Mario Kleiner    2019-03-29  610  		 * while now done after front-porch. This will also deliver
d2574c33bb7195 Mario Kleiner    2019-03-29  611  		 * page-flip completion events that have been queued to us
d2574c33bb7195 Mario Kleiner    2019-03-29  612  		 * if a pageflip happened inside front-porch.
d2574c33bb7195 Mario Kleiner    2019-03-29  613  		 */
585d450c76d1d5 Aurabindo Pillai 2020-08-12  614  		if (vrr_active) {
6d31602a9f57a7 Aurabindo Pillai 2025-04-16 @615  			bool replay_en = acrtc->dm_irq_params.stream->link->replay_settings.replay_feature_enabled;
6d31602a9f57a7 Aurabindo Pillai 2025-04-16  616  			bool psr_en = acrtc->dm_irq_params.stream->link->psr_settings.psr_feature_enabled;
6d31602a9f57a7 Aurabindo Pillai 2025-04-16  617  			bool fs_active_var_en = acrtc->dm_irq_params.freesync_config.state
6d31602a9f57a7 Aurabindo Pillai 2025-04-16  618  				== VRR_STATE_ACTIVE_VARIABLE;
6d31602a9f57a7 Aurabindo Pillai 2025-04-16  619  
6c5e25a0255d56 David Tadokoro   2023-03-07  620  			amdgpu_dm_crtc_handle_vblank(acrtc);
09aef2c48e799b Mario Kleiner    2019-04-26  621  
09aef2c48e799b Mario Kleiner    2019-04-26  622  			/* BTR processing for pre-DCE12 ASICs */
585d450c76d1d5 Aurabindo Pillai 2020-08-12 @623  			if (acrtc->dm_irq_params.stream &&
09aef2c48e799b Mario Kleiner    2019-04-26  624  			    adev->family < AMDGPU_FAMILY_AI) {
4a580877bdcb83 Luben Tuikov     2020-08-24  625  				spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
09aef2c48e799b Mario Kleiner    2019-04-26  626  				mod_freesync_handle_v_update(
09aef2c48e799b Mario Kleiner    2019-04-26  627  				    adev->dm.freesync_module,
585d450c76d1d5 Aurabindo Pillai 2020-08-12  628  				    acrtc->dm_irq_params.stream,
585d450c76d1d5 Aurabindo Pillai 2020-08-12  629  				    &acrtc->dm_irq_params.vrr_params);
09aef2c48e799b Mario Kleiner    2019-04-26  630  
6d31602a9f57a7 Aurabindo Pillai 2025-04-16  631  				if (fs_active_var_en || (!fs_active_var_en && !replay_en && !psr_en)) {
c210b757b40095 Aurabindo Pillai 2025-07-21  632  					schedule_dc_vmin_vmax(adev,
585d450c76d1d5 Aurabindo Pillai 2020-08-12  633  						acrtc->dm_irq_params.stream,
585d450c76d1d5 Aurabindo Pillai 2020-08-12  634  						&acrtc->dm_irq_params.vrr_params.adjust);
6d31602a9f57a7 Aurabindo Pillai 2025-04-16  635  				}
4a580877bdcb83 Luben Tuikov     2020-08-24  636  				spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
09aef2c48e799b Mario Kleiner    2019-04-26  637  			}
09aef2c48e799b Mario Kleiner    2019-04-26  638  		}
d2574c33bb7195 Mario Kleiner    2019-03-29  639  	}
d2574c33bb7195 Mario Kleiner    2019-03-29  640  }
d2574c33bb7195 Mario Kleiner    2019-03-29  641  

:::::: The code at line 623 was first introduced by commit
:::::: 585d450c76d1d5807a50cb6c22487ae5aed0906b drm/amd/display: Refactor to prevent crtc state access in DM IRQ handler

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
