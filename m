Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF57F
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Feb 2023 07:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676619785; x=1708155785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2vdRVWnRIpGdyaBoYGbGRqXDgovzVWP223HQ8y87WZw=;
  b=VFiLoAgsstNs9pU/Ilk+Iu+B4QlT4XBiVmcZ9vJL+uDp3ReGI0ja8G+F
   z2gCIU2v7WMCanZPRz+4oR6FfYKj/DJLagdTC70Fo4X90fo7pDN6xHxOm
   ZodyAcuThvXjuPjHsyYG9JmiWo7nH06Og1QjyqNEY5sv4Tf0/NnwPuTwq
   uMfDblds5ADTAVlnwro6o5hh05kGLWZfT6cr5B/bSJtcFGZma9akY8+z9
   MhMb0vw/p++VgW/GWzhkvV8VMVnVme36IIAXIMYoPYLfUtq+S7ZQLmU8e
   SJATWjDk/kzsdvG3UgKvS9V8fknfPlGF/wCzkga2m/OxLUPKxgvHwGsmu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="418153657"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="418153657"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 23:43:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670459597"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="670459597"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Feb 2023 23:43:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSvOY-000BCr-0a;
	Fri, 17 Feb 2023 07:43:02 +0000
Date: Fri, 17 Feb 2023 15:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/gt/intel_gt_mcr.c:297 rw_with_mcr_steering_fw()
 error: uninitialized symbol 'old_mcr'.
Message-ID: <202302171539.nKHLPvnt-lkp@intel.com>
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
TO: Matt Roper <matthew.d.roper@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec35307e18ba8174e2a3f701956059f6a36f22fb
commit: f32898c94a105c221e6fe957aee833e7fc98f95f drm/i915/xelpg: Add multicast steering
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230217/202302171539.nKHLPvnt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302171539.nKHLPvnt-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/gt/intel_gt_mcr.c:297 rw_with_mcr_steering_fw() error: uninitialized symbol 'old_mcr'.

vim +/old_mcr +297 drivers/gpu/drm/i915/gt/intel_gt_mcr.c

58bc2453ab8a4b Matt Roper 2022-10-14  212  
3fe6c7f53eaa62 Matt Roper 2022-06-14  213  /*
3fe6c7f53eaa62 Matt Roper 2022-06-14  214   * rw_with_mcr_steering_fw - Access a register with specific MCR steering
e7858254f9af9a Matt Roper 2022-06-14  215   * @uncore: pointer to struct intel_uncore
e7858254f9af9a Matt Roper 2022-06-14  216   * @reg: register being accessed
e7858254f9af9a Matt Roper 2022-06-14  217   * @rw_flag: FW_REG_READ for read access or FW_REG_WRITE for write access
3fe6c7f53eaa62 Matt Roper 2022-06-14  218   * @group: group number (documented as "sliceid" on older platforms)
3fe6c7f53eaa62 Matt Roper 2022-06-14  219   * @instance: instance number (documented as "subsliceid" on older platforms)
e7858254f9af9a Matt Roper 2022-06-14  220   * @value: register value to be written (ignored for read)
e7858254f9af9a Matt Roper 2022-06-14  221   *
e7858254f9af9a Matt Roper 2022-06-14  222   * Return: 0 for write access. register value for read access.
e7858254f9af9a Matt Roper 2022-06-14  223   *
e7858254f9af9a Matt Roper 2022-06-14  224   * Caller needs to make sure the relevant forcewake wells are up.
e7858254f9af9a Matt Roper 2022-06-14  225   */
3fe6c7f53eaa62 Matt Roper 2022-06-14  226  static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
58bc2453ab8a4b Matt Roper 2022-10-14  227  				   i915_mcr_reg_t reg, u8 rw_flag,
3fe6c7f53eaa62 Matt Roper 2022-06-14  228  				   int group, int instance, u32 value)
e7858254f9af9a Matt Roper 2022-06-14  229  {
e7858254f9af9a Matt Roper 2022-06-14  230  	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
e7858254f9af9a Matt Roper 2022-06-14  231  
e7858254f9af9a Matt Roper 2022-06-14  232  	lockdep_assert_held(&uncore->lock);
e7858254f9af9a Matt Roper 2022-06-14  233  
f32898c94a105c Matt Roper 2022-10-14  234  	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70)) {
f32898c94a105c Matt Roper 2022-10-14  235  		/*
f32898c94a105c Matt Roper 2022-10-14  236  		 * Always leave the hardware in multicast mode when doing reads
f32898c94a105c Matt Roper 2022-10-14  237  		 * (see comment about Wa_22013088509 below) and only change it
f32898c94a105c Matt Roper 2022-10-14  238  		 * to unicast mode when doing writes of a specific instance.
f32898c94a105c Matt Roper 2022-10-14  239  		 *
f32898c94a105c Matt Roper 2022-10-14  240  		 * No need to save old steering reg value.
f32898c94a105c Matt Roper 2022-10-14  241  		 */
f32898c94a105c Matt Roper 2022-10-14  242  		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
f32898c94a105c Matt Roper 2022-10-14  243  				      REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
f32898c94a105c Matt Roper 2022-10-14  244  				      REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
f32898c94a105c Matt Roper 2022-10-14  245  				      (rw_flag == FW_REG_READ) ? GEN11_MCR_MULTICAST : 0);
f32898c94a105c Matt Roper 2022-10-14  246  	} else if (GRAPHICS_VER(uncore->i915) >= 11) {
e7858254f9af9a Matt Roper 2022-06-14  247  		mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
3fe6c7f53eaa62 Matt Roper 2022-06-14  248  		mcr_ss = GEN11_MCR_SLICE(group) | GEN11_MCR_SUBSLICE(instance);
e7858254f9af9a Matt Roper 2022-06-14  249  
e7858254f9af9a Matt Roper 2022-06-14  250  		/*
e7858254f9af9a Matt Roper 2022-06-14  251  		 * Wa_22013088509
e7858254f9af9a Matt Roper 2022-06-14  252  		 *
e7858254f9af9a Matt Roper 2022-06-14  253  		 * The setting of the multicast/unicast bit usually wouldn't
e7858254f9af9a Matt Roper 2022-06-14  254  		 * matter for read operations (which always return the value
e7858254f9af9a Matt Roper 2022-06-14  255  		 * from a single register instance regardless of how that bit
e7858254f9af9a Matt Roper 2022-06-14  256  		 * is set), but some platforms have a workaround requiring us
e7858254f9af9a Matt Roper 2022-06-14  257  		 * to remain in multicast mode for reads.  There's no real
e7858254f9af9a Matt Roper 2022-06-14  258  		 * downside to this, so we'll just go ahead and do so on all
e7858254f9af9a Matt Roper 2022-06-14  259  		 * platforms; we'll only clear the multicast bit from the mask
e7858254f9af9a Matt Roper 2022-06-14  260  		 * when exlicitly doing a write operation.
e7858254f9af9a Matt Roper 2022-06-14  261  		 */
e7858254f9af9a Matt Roper 2022-06-14  262  		if (rw_flag == FW_REG_WRITE)
e7858254f9af9a Matt Roper 2022-06-14  263  			mcr_mask |= GEN11_MCR_MULTICAST;
f32898c94a105c Matt Roper 2022-10-14  264  
f32898c94a105c Matt Roper 2022-10-14  265  		mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
f32898c94a105c Matt Roper 2022-10-14  266  		old_mcr = mcr;
f32898c94a105c Matt Roper 2022-10-14  267  
f32898c94a105c Matt Roper 2022-10-14  268  		mcr &= ~mcr_mask;
f32898c94a105c Matt Roper 2022-10-14  269  		mcr |= mcr_ss;
f32898c94a105c Matt Roper 2022-10-14  270  		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
e7858254f9af9a Matt Roper 2022-06-14  271  	} else {
e7858254f9af9a Matt Roper 2022-06-14  272  		mcr_mask = GEN8_MCR_SLICE_MASK | GEN8_MCR_SUBSLICE_MASK;
3fe6c7f53eaa62 Matt Roper 2022-06-14  273  		mcr_ss = GEN8_MCR_SLICE(group) | GEN8_MCR_SUBSLICE(instance);
e7858254f9af9a Matt Roper 2022-06-14  274  
f32898c94a105c Matt Roper 2022-10-14  275  		mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
f32898c94a105c Matt Roper 2022-10-14  276  		old_mcr = mcr;
e7858254f9af9a Matt Roper 2022-06-14  277  
e7858254f9af9a Matt Roper 2022-06-14  278  		mcr &= ~mcr_mask;
e7858254f9af9a Matt Roper 2022-06-14  279  		mcr |= mcr_ss;
e7858254f9af9a Matt Roper 2022-06-14  280  		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
f32898c94a105c Matt Roper 2022-10-14  281  	}
e7858254f9af9a Matt Roper 2022-06-14  282  
e7858254f9af9a Matt Roper 2022-06-14  283  	if (rw_flag == FW_REG_READ)
58bc2453ab8a4b Matt Roper 2022-10-14  284  		val = intel_uncore_read_fw(uncore, mcr_reg_cast(reg));
e7858254f9af9a Matt Roper 2022-06-14  285  	else
58bc2453ab8a4b Matt Roper 2022-10-14  286  		intel_uncore_write_fw(uncore, mcr_reg_cast(reg), value);
e7858254f9af9a Matt Roper 2022-06-14  287  
f32898c94a105c Matt Roper 2022-10-14  288  	/*
f32898c94a105c Matt Roper 2022-10-14  289  	 * For pre-MTL platforms, we need to restore the old value of the
f32898c94a105c Matt Roper 2022-10-14  290  	 * steering control register to ensure that implicit steering continues
f32898c94a105c Matt Roper 2022-10-14  291  	 * to behave as expected.  For MTL and beyond, we need only reinstate
f32898c94a105c Matt Roper 2022-10-14  292  	 * the 'multicast' bit (and only if we did a write that cleared it).
f32898c94a105c Matt Roper 2022-10-14  293  	 */
f32898c94a105c Matt Roper 2022-10-14  294  	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70) && rw_flag == FW_REG_WRITE)
f32898c94a105c Matt Roper 2022-10-14  295  		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR, GEN11_MCR_MULTICAST);
f32898c94a105c Matt Roper 2022-10-14  296  	else if (GRAPHICS_VER_FULL(uncore->i915) < IP_VER(12, 70))
f32898c94a105c Matt Roper 2022-10-14 @297  		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, old_mcr);
e7858254f9af9a Matt Roper 2022-06-14  298  
e7858254f9af9a Matt Roper 2022-06-14  299  	return val;
e7858254f9af9a Matt Roper 2022-06-14  300  }
e7858254f9af9a Matt Roper 2022-06-14  301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
