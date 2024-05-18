Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7828C8BEA
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716025077; cv=none; b=RnaAj04CmeZdEUFMSyobbkclSGNfF2jNp97It2wgAOII6F8MaLj+rTbvSCoGgtvwPgUWZjXT8uOWOpB6gUCThW9BzmLoqJxB7lU21J2HEPg7bZ9YMKAByk1VbjkwmYjFl+scbwWBrA5WropftIUtKFC3yY60/HxylpPsiCW6Ikw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716025077; c=relaxed/simple;
	bh=Zma9iYUCYzTUPP/hwtkuzxsITL8imgjBppiQZSKvTLA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MrdV/Zrx5iiC3rAMkfoq1RIxp7dyUvjAUHPrEfzc64NsT9h133+z4n+K3WUiiCzRhymRx3OBPdaCi7A5FEwJZaxxHEhXZ2zXxXgHvh3Z9LZFgm1wdOabbr2cJ3C8j+GL2DlAjTboJaBcKeQ0iBSbTobe0TNa+1jINKer49a6FQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3+9o+ua; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3+9o+ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716025074; x=1747561074;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zma9iYUCYzTUPP/hwtkuzxsITL8imgjBppiQZSKvTLA=;
  b=A3+9o+uaem82Gm/Xg6UAYJrUvKzF3bZLNlOWoila9ouoV4YOb10Mm8Er
   ASqIShdYRC1vwv7XqnmaKnKGCX4xCrb4mkSRaHPeoGQCVgeoK6j0uUImH
   ESBOtJzGiF8eaaImSTztKmTNtOauimTmAWMunHJ8nJY/55IxILKAJpe5q
   PuNhTjldI7slzm/b+K+7kifSplm7UKqtLFfd3VHuKi7NvkkTkzXzYECjK
   gx1/QurFPkcZpXiXYf25aMVZNzuBiEpZohSHkHhD+MU66HikvlmDSLTHO
   uRaCOe/ifZixskc+f/NgYnGUYIqM73I+Z6pFySbTHSb9Q9ZHM1lfkOsak
   A==;
X-CSE-ConnectionGUID: rsz61MAeTLyuJE0v8rzCIA==
X-CSE-MsgGUID: R21BZMoERSWP/b0kFCO5LQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12150987"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12150987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 02:37:53 -0700
X-CSE-ConnectionGUID: gOv8aUW4TwKAg0yn3ViNyQ==
X-CSE-MsgGUID: OKwusXDwRfWkDMP6hkTobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="32657061"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2024 02:37:52 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8GVh-0001ym-2S;
	Sat, 18 May 2024 09:37:49 +0000
Date: Sat, 18 May 2024 17:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 05/17] drm/i915/psr: modify psr status debugfs to support
 eDP Panel Replay
Message-ID: <202405181748.E5oIyJfs-lkp@intel.com>
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
In-Reply-To: <20240516084957.1557028-6-jouni.hogander@intel.com>
References: <20240516084957.1557028-6-jouni.hogander@intel.com>
TO: "Jouni Högander" <jouni.hogander@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: animesh.manna@intel.com
CC: "Jouni Högander" <jouni.hogander@intel.com>

Hi Jouni,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20240517]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jouni-H-gander/drm-i915-psr-Store-pr_dpcd-in-intel_dp/20240516-165152
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240516084957.1557028-6-jouni.hogander%40intel.com
patch subject: [PATCH 05/17] drm/i915/psr: modify psr status debugfs to support eDP Panel Replay
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181748.E5oIyJfs-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405181748.E5oIyJfs-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:3668 intel_psr_status() error: uninitialized symbol 'psr2_ctl'.

vim +/psr2_ctl +3668 drivers/gpu/drm/i915/display/intel_psr.c

68287999e51138 Jouni Högander 2024-05-16  3620  
bce26c52e1194e Jouni Högander 2024-05-16  3621  static int intel_psr_status(struct seq_file *m, struct intel_dp *intel_dp)
bce26c52e1194e Jouni Högander 2024-05-16  3622  {
bce26c52e1194e Jouni Högander 2024-05-16  3623  	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
bce26c52e1194e Jouni Högander 2024-05-16  3624  	enum transcoder cpu_transcoder = intel_dp->psr.transcoder;
bce26c52e1194e Jouni Högander 2024-05-16  3625  	struct intel_psr *psr = &intel_dp->psr;
bce26c52e1194e Jouni Högander 2024-05-16  3626  	intel_wakeref_t wakeref;
bce26c52e1194e Jouni Högander 2024-05-16  3627  	bool enabled;
87ec5a5e0c01c3 Jouni Högander 2024-05-16  3628  	u32 val, psr2_ctl;
bce26c52e1194e Jouni Högander 2024-05-16  3629  
bce26c52e1194e Jouni Högander 2024-05-16  3630  	intel_psr_sink_capability(intel_dp, m);
5cc0de45674971 Jani Nikula    2023-03-17  3631  
ef75c25e8fedbf Animesh Manna  2023-11-08  3632  	if (!(psr->sink_support || psr->sink_panel_replay_support))
5cc0de45674971 Jani Nikula    2023-03-17  3633  		return 0;
5cc0de45674971 Jani Nikula    2023-03-17  3634  
5cc0de45674971 Jani Nikula    2023-03-17  3635  	wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
5cc0de45674971 Jani Nikula    2023-03-17  3636  	mutex_lock(&psr->lock);
5cc0de45674971 Jani Nikula    2023-03-17  3637  
68287999e51138 Jouni Högander 2024-05-16  3638  	intel_psr_psr_mode(intel_dp, m);
5cc0de45674971 Jani Nikula    2023-03-17  3639  
5cc0de45674971 Jani Nikula    2023-03-17  3640  	if (!psr->enabled) {
5cc0de45674971 Jani Nikula    2023-03-17  3641  		seq_printf(m, "PSR sink not reliable: %s\n",
5cc0de45674971 Jani Nikula    2023-03-17  3642  			   str_yes_no(psr->sink_not_reliable));
5cc0de45674971 Jani Nikula    2023-03-17  3643  
5cc0de45674971 Jani Nikula    2023-03-17  3644  		goto unlock;
5cc0de45674971 Jani Nikula    2023-03-17  3645  	}
5cc0de45674971 Jani Nikula    2023-03-17  3646  
ef75c25e8fedbf Animesh Manna  2023-11-08  3647  	if (psr->panel_replay_enabled) {
ef75c25e8fedbf Animesh Manna  2023-11-08  3648  		val = intel_de_read(dev_priv, TRANS_DP2_CTL(cpu_transcoder));
87ec5a5e0c01c3 Jouni Högander 2024-05-16  3649  
87ec5a5e0c01c3 Jouni Högander 2024-05-16  3650  		if (intel_dp_is_edp(intel_dp))
87ec5a5e0c01c3 Jouni Högander 2024-05-16  3651  			psr2_ctl = intel_de_read(dev_priv,
87ec5a5e0c01c3 Jouni Högander 2024-05-16  3652  						 EDP_PSR2_CTL(dev_priv,
87ec5a5e0c01c3 Jouni Högander 2024-05-16  3653  							      cpu_transcoder));
87ec5a5e0c01c3 Jouni Högander 2024-05-16  3654  
ef75c25e8fedbf Animesh Manna  2023-11-08  3655  		enabled = val & TRANS_DP2_PANEL_REPLAY_ENABLE;
ba7cf33f233efc Jouni Högander 2024-05-10  3656  	} else if (psr->sel_update_enabled) {
9b0dddd50e6810 Jani Nikula    2024-04-30  3657  		val = intel_de_read(dev_priv,
9b0dddd50e6810 Jani Nikula    2024-04-30  3658  				    EDP_PSR2_CTL(dev_priv, cpu_transcoder));
5cc0de45674971 Jani Nikula    2023-03-17  3659  		enabled = val & EDP_PSR2_ENABLE;
5cc0de45674971 Jani Nikula    2023-03-17  3660  	} else {
6a6b0ab2f3fb1f Ville Syrjälä  2023-06-09  3661  		val = intel_de_read(dev_priv, psr_ctl_reg(dev_priv, cpu_transcoder));
5cc0de45674971 Jani Nikula    2023-03-17  3662  		enabled = val & EDP_PSR_ENABLE;
5cc0de45674971 Jani Nikula    2023-03-17  3663  	}
ef75c25e8fedbf Animesh Manna  2023-11-08  3664  	seq_printf(m, "Source PSR/PanelReplay ctl: %s [0x%08x]\n",
5cc0de45674971 Jani Nikula    2023-03-17  3665  		   str_enabled_disabled(enabled), val);
87ec5a5e0c01c3 Jouni Högander 2024-05-16  3666  	if (psr->panel_replay_enabled && intel_dp_is_edp(intel_dp))
87ec5a5e0c01c3 Jouni Högander 2024-05-16  3667  		seq_printf(m, "PSR2_CTL: 0x%08x\n",
87ec5a5e0c01c3 Jouni Högander 2024-05-16 @3668  			   psr2_ctl);
5cc0de45674971 Jani Nikula    2023-03-17  3669  	psr_source_status(intel_dp, m);
5cc0de45674971 Jani Nikula    2023-03-17  3670  	seq_printf(m, "Busy frontbuffer bits: 0x%08x\n",
5cc0de45674971 Jani Nikula    2023-03-17  3671  		   psr->busy_frontbuffer_bits);
5cc0de45674971 Jani Nikula    2023-03-17  3672  
5cc0de45674971 Jani Nikula    2023-03-17  3673  	/*
5cc0de45674971 Jani Nikula    2023-03-17  3674  	 * SKL+ Perf counter is reset to 0 everytime DC state is entered
5cc0de45674971 Jani Nikula    2023-03-17  3675  	 */
6a6b0ab2f3fb1f Ville Syrjälä  2023-06-09  3676  	val = intel_de_read(dev_priv, psr_perf_cnt_reg(dev_priv, cpu_transcoder));
1d9582dc2b5f5c Ville Syrjälä  2023-04-11  3677  	seq_printf(m, "Performance counter: %u\n",
1d9582dc2b5f5c Ville Syrjälä  2023-04-11  3678  		   REG_FIELD_GET(EDP_PSR_PERF_CNT_MASK, val));
5cc0de45674971 Jani Nikula    2023-03-17  3679  
5cc0de45674971 Jani Nikula    2023-03-17  3680  	if (psr->debug & I915_PSR_DEBUG_IRQ) {
5cc0de45674971 Jani Nikula    2023-03-17  3681  		seq_printf(m, "Last attempted entry at: %lld\n",
5cc0de45674971 Jani Nikula    2023-03-17  3682  			   psr->last_entry_attempt);
5cc0de45674971 Jani Nikula    2023-03-17  3683  		seq_printf(m, "Last exit at: %lld\n", psr->last_exit);
5cc0de45674971 Jani Nikula    2023-03-17  3684  	}
5cc0de45674971 Jani Nikula    2023-03-17  3685  
ba7cf33f233efc Jouni Högander 2024-05-10  3686  	if (psr->sel_update_enabled) {
5cc0de45674971 Jani Nikula    2023-03-17  3687  		u32 su_frames_val[3];
5cc0de45674971 Jani Nikula    2023-03-17  3688  		int frame;
5cc0de45674971 Jani Nikula    2023-03-17  3689  
5cc0de45674971 Jani Nikula    2023-03-17  3690  		/*
5cc0de45674971 Jani Nikula    2023-03-17  3691  		 * Reading all 3 registers before hand to minimize crossing a
5cc0de45674971 Jani Nikula    2023-03-17  3692  		 * frame boundary between register reads
5cc0de45674971 Jani Nikula    2023-03-17  3693  		 */
5cc0de45674971 Jani Nikula    2023-03-17  3694  		for (frame = 0; frame < PSR2_SU_STATUS_FRAMES; frame += 3) {
a0d1cfa86cc9e4 Jani Nikula    2024-05-02  3695  			val = intel_de_read(dev_priv,
a0d1cfa86cc9e4 Jani Nikula    2024-05-02  3696  					    PSR2_SU_STATUS(dev_priv, cpu_transcoder, frame));
5cc0de45674971 Jani Nikula    2023-03-17  3697  			su_frames_val[frame / 3] = val;
5cc0de45674971 Jani Nikula    2023-03-17  3698  		}
5cc0de45674971 Jani Nikula    2023-03-17  3699  
5cc0de45674971 Jani Nikula    2023-03-17  3700  		seq_puts(m, "Frame:\tPSR2 SU blocks:\n");
5cc0de45674971 Jani Nikula    2023-03-17  3701  
5cc0de45674971 Jani Nikula    2023-03-17  3702  		for (frame = 0; frame < PSR2_SU_STATUS_FRAMES; frame++) {
5cc0de45674971 Jani Nikula    2023-03-17  3703  			u32 su_blocks;
5cc0de45674971 Jani Nikula    2023-03-17  3704  
5cc0de45674971 Jani Nikula    2023-03-17  3705  			su_blocks = su_frames_val[frame / 3] &
5cc0de45674971 Jani Nikula    2023-03-17  3706  				    PSR2_SU_STATUS_MASK(frame);
5cc0de45674971 Jani Nikula    2023-03-17  3707  			su_blocks = su_blocks >> PSR2_SU_STATUS_SHIFT(frame);
5cc0de45674971 Jani Nikula    2023-03-17  3708  			seq_printf(m, "%d\t%d\n", frame, su_blocks);
5cc0de45674971 Jani Nikula    2023-03-17  3709  		}
5cc0de45674971 Jani Nikula    2023-03-17  3710  
5cc0de45674971 Jani Nikula    2023-03-17  3711  		seq_printf(m, "PSR2 selective fetch: %s\n",
5cc0de45674971 Jani Nikula    2023-03-17  3712  			   str_enabled_disabled(psr->psr2_sel_fetch_enabled));
5cc0de45674971 Jani Nikula    2023-03-17  3713  	}
5cc0de45674971 Jani Nikula    2023-03-17  3714  
5cc0de45674971 Jani Nikula    2023-03-17  3715  unlock:
5cc0de45674971 Jani Nikula    2023-03-17  3716  	mutex_unlock(&psr->lock);
5cc0de45674971 Jani Nikula    2023-03-17  3717  	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
5cc0de45674971 Jani Nikula    2023-03-17  3718  
5cc0de45674971 Jani Nikula    2023-03-17  3719  	return 0;
5cc0de45674971 Jani Nikula    2023-03-17  3720  }
5cc0de45674971 Jani Nikula    2023-03-17  3721  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
