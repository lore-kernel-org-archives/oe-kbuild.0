Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D22418D
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 00:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695342200; x=1726878200;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VoSBkQKzJEz0vs9fquZAHDrDFxJhVC+GSHHtRTaj3CE=;
  b=S5fRXW9btZuNsvki3NPlPawwkIHgKBFCTRxoqu5IFPr/FClH6kDIw8sJ
   k7MQzL5L107FOvV6DGydNqmvRPiNT7TlielJQ6He1aYFOlH3GCuCgTASj
   Na0eo/DWDmpJvVOrz2hwqkrfv/myjmsBcNlEb72hpBl70BlMBc07aOobN
   H1tDP0fr87v5WuaRnC+ggYPelonvT7wZI4A6uH5Tg5a/JcxvUrbCUIWNw
   cCWQ1Y3kBCJEsvebco7kYNBAgVxx5AenV/tzC2sbyve80tF2DPWzmPVmz
   KO8K58EIQ9Rd2J4B/9ldGGl7lbrEAQrOql0htibn4QGZfJ1RgEd5DMFXD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="365764558"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="365764558"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 17:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817579912"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="817579912"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2023 17:23:18 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjTwx-0000a7-2q;
	Fri, 22 Sep 2023 00:23:15 +0000
Date: Fri, 22 Sep 2023 08:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/i915/gem: Allow users to disable waitboost
Message-ID: <202309220821.vLD8SEpD-lkp@intel.com>
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
In-Reply-To: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
References: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
TO: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
TO: intel-gfx@lists.freedesktop.org
TO: dri-devel@lists.freedesktop.org
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

Hi Vinay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinay-Belgaumkar/drm-i915-gem-Allow-users-to-disable-waitboost/20230921-060357
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230920215624.3482244-1-vinay.belgaumkar%40intel.com
patch subject: [PATCH] drm/i915/gem: Allow users to disable waitboost
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-161-20230921 (https://download.01.org/0day-ci/archive/20230922/202309220821.vLD8SEpD-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230922/202309220821.vLD8SEpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309220821.vLD8SEpD-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_wait.c:240 i915_gem_wait_ioctl() warn: was && intended here instead of ||?

vim +240 drivers/gpu/drm/i915/gem/i915_gem_wait.c

d45a1a533499d3 Chris Wilson     2019-05-28  207  
d45a1a533499d3 Chris Wilson     2019-05-28  208  /**
d45a1a533499d3 Chris Wilson     2019-05-28  209   * i915_gem_wait_ioctl - implements DRM_IOCTL_I915_GEM_WAIT
d45a1a533499d3 Chris Wilson     2019-05-28  210   * @dev: drm device pointer
d45a1a533499d3 Chris Wilson     2019-05-28  211   * @data: ioctl data blob
d45a1a533499d3 Chris Wilson     2019-05-28  212   * @file: drm file pointer
d45a1a533499d3 Chris Wilson     2019-05-28  213   *
d45a1a533499d3 Chris Wilson     2019-05-28  214   * Returns 0 if successful, else an error is returned with the remaining time in
d45a1a533499d3 Chris Wilson     2019-05-28  215   * the timeout parameter.
d45a1a533499d3 Chris Wilson     2019-05-28  216   *  -ETIME: object is still busy after timeout
d45a1a533499d3 Chris Wilson     2019-05-28  217   *  -ERESTARTSYS: signal interrupted the wait
d45a1a533499d3 Chris Wilson     2019-05-28  218   *  -ENONENT: object doesn't exist
d45a1a533499d3 Chris Wilson     2019-05-28  219   * Also possible, but rare:
d45a1a533499d3 Chris Wilson     2019-05-28  220   *  -EAGAIN: incomplete, restart syscall
d45a1a533499d3 Chris Wilson     2019-05-28  221   *  -ENOMEM: damn
d45a1a533499d3 Chris Wilson     2019-05-28  222   *  -ENODEV: Internal IRQ fail
d45a1a533499d3 Chris Wilson     2019-05-28  223   *  -E?: The add request failed
d45a1a533499d3 Chris Wilson     2019-05-28  224   *
d45a1a533499d3 Chris Wilson     2019-05-28  225   * The wait ioctl with a timeout of 0 reimplements the busy ioctl. With any
d45a1a533499d3 Chris Wilson     2019-05-28  226   * non-zero timeout parameter the wait ioctl will wait for the given number of
d45a1a533499d3 Chris Wilson     2019-05-28  227   * nanoseconds on an object becoming unbusy. Since the wait itself does so
d45a1a533499d3 Chris Wilson     2019-05-28  228   * without holding struct_mutex the object may become re-busied before this
d45a1a533499d3 Chris Wilson     2019-05-28  229   * function completes. A similar but shorter * race condition exists in the busy
d45a1a533499d3 Chris Wilson     2019-05-28  230   * ioctl
d45a1a533499d3 Chris Wilson     2019-05-28  231   */
d45a1a533499d3 Chris Wilson     2019-05-28  232  int
d45a1a533499d3 Chris Wilson     2019-05-28  233  i915_gem_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
d45a1a533499d3 Chris Wilson     2019-05-28  234  {
d45a1a533499d3 Chris Wilson     2019-05-28  235  	struct drm_i915_gem_wait *args = data;
d45a1a533499d3 Chris Wilson     2019-05-28  236  	struct drm_i915_gem_object *obj;
d45a1a533499d3 Chris Wilson     2019-05-28  237  	ktime_t start;
d45a1a533499d3 Chris Wilson     2019-05-28  238  	long ret;
d45a1a533499d3 Chris Wilson     2019-05-28  239  
54fef7ea35dadd Vinay Belgaumkar 2023-09-20 @240  	if (args->flags != 0 || args->flags != I915_GEM_WAITBOOST_DISABLE)
d45a1a533499d3 Chris Wilson     2019-05-28  241  		return -EINVAL;
d45a1a533499d3 Chris Wilson     2019-05-28  242  
d45a1a533499d3 Chris Wilson     2019-05-28  243  	obj = i915_gem_object_lookup(file, args->bo_handle);
d45a1a533499d3 Chris Wilson     2019-05-28  244  	if (!obj)
d45a1a533499d3 Chris Wilson     2019-05-28  245  		return -ENOENT;
d45a1a533499d3 Chris Wilson     2019-05-28  246  
d45a1a533499d3 Chris Wilson     2019-05-28  247  	start = ktime_get();
d45a1a533499d3 Chris Wilson     2019-05-28  248  
d45a1a533499d3 Chris Wilson     2019-05-28  249  	ret = i915_gem_object_wait(obj,
d45a1a533499d3 Chris Wilson     2019-05-28  250  				   I915_WAIT_INTERRUPTIBLE |
d45a1a533499d3 Chris Wilson     2019-05-28  251  				   I915_WAIT_PRIORITY |
54fef7ea35dadd Vinay Belgaumkar 2023-09-20  252  				   I915_WAIT_ALL |
54fef7ea35dadd Vinay Belgaumkar 2023-09-20  253  				   (args->flags & I915_GEM_WAITBOOST_DISABLE ?
54fef7ea35dadd Vinay Belgaumkar 2023-09-20  254  				    I915_WAITBOOST_DISABLE : 0),
d45a1a533499d3 Chris Wilson     2019-05-28  255  				   to_wait_timeout(args->timeout_ns));
d45a1a533499d3 Chris Wilson     2019-05-28  256  
d45a1a533499d3 Chris Wilson     2019-05-28  257  	if (args->timeout_ns > 0) {
d45a1a533499d3 Chris Wilson     2019-05-28  258  		args->timeout_ns -= ktime_to_ns(ktime_sub(ktime_get(), start));
d45a1a533499d3 Chris Wilson     2019-05-28  259  		if (args->timeout_ns < 0)
d45a1a533499d3 Chris Wilson     2019-05-28  260  			args->timeout_ns = 0;
d45a1a533499d3 Chris Wilson     2019-05-28  261  
d45a1a533499d3 Chris Wilson     2019-05-28  262  		/*
d45a1a533499d3 Chris Wilson     2019-05-28  263  		 * Apparently ktime isn't accurate enough and occasionally has a
d45a1a533499d3 Chris Wilson     2019-05-28  264  		 * bit of mismatch in the jiffies<->nsecs<->ktime loop. So patch
d45a1a533499d3 Chris Wilson     2019-05-28  265  		 * things up to make the test happy. We allow up to 1 jiffy.
d45a1a533499d3 Chris Wilson     2019-05-28  266  		 *
d45a1a533499d3 Chris Wilson     2019-05-28  267  		 * This is a regression from the timespec->ktime conversion.
d45a1a533499d3 Chris Wilson     2019-05-28  268  		 */
d45a1a533499d3 Chris Wilson     2019-05-28  269  		if (ret == -ETIME && !nsecs_to_jiffies(args->timeout_ns))
d45a1a533499d3 Chris Wilson     2019-05-28  270  			args->timeout_ns = 0;
d45a1a533499d3 Chris Wilson     2019-05-28  271  
d45a1a533499d3 Chris Wilson     2019-05-28  272  		/* Asked to wait beyond the jiffie/scheduler precision? */
d45a1a533499d3 Chris Wilson     2019-05-28  273  		if (ret == -ETIME && args->timeout_ns)
d45a1a533499d3 Chris Wilson     2019-05-28  274  			ret = -EAGAIN;
d45a1a533499d3 Chris Wilson     2019-05-28  275  	}
d45a1a533499d3 Chris Wilson     2019-05-28  276  
d45a1a533499d3 Chris Wilson     2019-05-28  277  	i915_gem_object_put(obj);
d45a1a533499d3 Chris Wilson     2019-05-28  278  	return ret;
d45a1a533499d3 Chris Wilson     2019-05-28  279  }
b6e913e19c54ed Thomas Hellström 2021-06-29  280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
