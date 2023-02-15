Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EFE6109
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Feb 2023 15:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676473313; x=1708009313;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DFKJsOB9dFRa1h8DsxOzr2ZPRPzzDt+WcsfaBTGOguE=;
  b=nLy9brvm45Ac0wHEBSv9k9ttDGpBrQgY7JW7wYCzw3IJA0AzoxDLEIHf
   y0kpziQqJWMoVnR6Bu5/vy1n8CzeTDBuM+7cEOHZgSkQ5nG1v7ncR7OvE
   AvhfiMx4jWB/A0wuOjekIOZcWarVv45+7sCF11TYZvphTEYoaFPWSW9mD
   aIKD4DfFK1t9SKT66ZSNxOkJ43nl+J1E9S2wgJwYYoEHqSH12npgqJ4XD
   vqNGt/FGifEtO6vGrdYoCkhTA+XiIsEIvfMsmaXFTlFkUdbMI9tmOSvyE
   V6/0QbQwEzCXm9IQbkCEON/HrBI2ReCnPlyPcTPvN0YIwBq0v8nsERnwL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="331445875"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="331445875"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 07:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699996222"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="699996222"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Feb 2023 07:01:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSJI5-0009Tb-3A;
	Wed, 15 Feb 2023 15:01:49 +0000
Date: Wed, 15 Feb 2023 23:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/display/intel_fb_pin.c:83
 intel_pin_fb_obj_dpt() error: potentially dereferencing uninitialized 'vma'.
Message-ID: <202302152212.qMuf4OLQ-lkp@intel.com>
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
TO: Matthew Auld <matthew.auld@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1c04510f521e853019afeca2a5991a5ef8d6a5b
commit: c5e595e752b3a1c68cca57c3559521237332fbec drm/i915/display: handle migration for dpt
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230215/202302152212.qMuf4OLQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302152212.qMuf4OLQ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_fb_pin.c:83 intel_pin_fb_obj_dpt() error: potentially dereferencing uninitialized 'vma'.
drivers/gpu/drm/i915/display/intel_fb_pin.c:83 intel_pin_fb_obj_dpt() error: 'vma' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:194 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 183)

vim +/vma +83 drivers/gpu/drm/i915/display/intel_fb_pin.c

814c8757115f9d7 Dave Airlie               2021-10-12  18  
814c8757115f9d7 Dave Airlie               2021-10-12  19  static struct i915_vma *
814c8757115f9d7 Dave Airlie               2021-10-12  20  intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
3bb6a44251b4d06 Niranjana Vishwanathapura 2022-09-01  21  		     const struct i915_gtt_view *view,
814c8757115f9d7 Dave Airlie               2021-10-12  22  		     bool uses_fence,
814c8757115f9d7 Dave Airlie               2021-10-12  23  		     unsigned long *out_flags,
814c8757115f9d7 Dave Airlie               2021-10-12  24  		     struct i915_address_space *vm)
814c8757115f9d7 Dave Airlie               2021-10-12  25  {
814c8757115f9d7 Dave Airlie               2021-10-12  26  	struct drm_device *dev = fb->dev;
814c8757115f9d7 Dave Airlie               2021-10-12  27  	struct drm_i915_private *dev_priv = to_i915(dev);
814c8757115f9d7 Dave Airlie               2021-10-12  28  	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
c5e595e752b3a1c Matthew Auld              2022-10-04  29  	struct i915_gem_ww_ctx ww;
814c8757115f9d7 Dave Airlie               2021-10-12  30  	struct i915_vma *vma;
814c8757115f9d7 Dave Airlie               2021-10-12  31  	u32 alignment;
814c8757115f9d7 Dave Airlie               2021-10-12  32  	int ret;
814c8757115f9d7 Dave Airlie               2021-10-12  33  
c5e595e752b3a1c Matthew Auld              2022-10-04  34  	/*
c5e595e752b3a1c Matthew Auld              2022-10-04  35  	 * We are not syncing against the binding (and potential migrations)
c5e595e752b3a1c Matthew Auld              2022-10-04  36  	 * below, so this vm must never be async.
c5e595e752b3a1c Matthew Auld              2022-10-04  37  	 */
c5e595e752b3a1c Matthew Auld              2022-10-04  38  	GEM_WARN_ON(vm->bind_async_flags);
c5e595e752b3a1c Matthew Auld              2022-10-04  39  
814c8757115f9d7 Dave Airlie               2021-10-12  40  	if (WARN_ON(!i915_gem_object_is_framebuffer(obj)))
814c8757115f9d7 Dave Airlie               2021-10-12  41  		return ERR_PTR(-EINVAL);
814c8757115f9d7 Dave Airlie               2021-10-12  42  
814c8757115f9d7 Dave Airlie               2021-10-12  43  	alignment = 4096 * 512;
814c8757115f9d7 Dave Airlie               2021-10-12  44  
814c8757115f9d7 Dave Airlie               2021-10-12  45  	atomic_inc(&dev_priv->gpu_error.pending_fb_pin);
814c8757115f9d7 Dave Airlie               2021-10-12  46  
c5e595e752b3a1c Matthew Auld              2022-10-04  47  	for_i915_gem_ww(&ww, ret, true) {
c5e595e752b3a1c Matthew Auld              2022-10-04  48  		ret = i915_gem_object_lock(obj, &ww);
c5e595e752b3a1c Matthew Auld              2022-10-04  49  		if (ret)
c5e595e752b3a1c Matthew Auld              2022-10-04  50  			continue;
c5e595e752b3a1c Matthew Auld              2022-10-04  51  
c5e595e752b3a1c Matthew Auld              2022-10-04  52  		if (HAS_LMEM(dev_priv)) {
c5e595e752b3a1c Matthew Auld              2022-10-04  53  			ret = i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM_0);
c5e595e752b3a1c Matthew Auld              2022-10-04  54  			if (ret)
c5e595e752b3a1c Matthew Auld              2022-10-04  55  				continue;
814c8757115f9d7 Dave Airlie               2021-10-12  56  		}
814c8757115f9d7 Dave Airlie               2021-10-12  57  
c5e595e752b3a1c Matthew Auld              2022-10-04  58  		ret = i915_gem_object_set_cache_level(obj, I915_CACHE_NONE);
c5e595e752b3a1c Matthew Auld              2022-10-04  59  		if (ret)
c5e595e752b3a1c Matthew Auld              2022-10-04  60  			continue;
c5e595e752b3a1c Matthew Auld              2022-10-04  61  
814c8757115f9d7 Dave Airlie               2021-10-12  62  		vma = i915_vma_instance(obj, vm, view);
c5e595e752b3a1c Matthew Auld              2022-10-04  63  		if (IS_ERR(vma)) {
c5e595e752b3a1c Matthew Auld              2022-10-04  64  			ret = PTR_ERR(vma);
c5e595e752b3a1c Matthew Auld              2022-10-04  65  			continue;
c5e595e752b3a1c Matthew Auld              2022-10-04  66  		}
814c8757115f9d7 Dave Airlie               2021-10-12  67  
814c8757115f9d7 Dave Airlie               2021-10-12  68  		if (i915_vma_misplaced(vma, 0, alignment, 0)) {
c5e595e752b3a1c Matthew Auld              2022-10-04  69  			ret = i915_vma_unbind(vma);
c5e595e752b3a1c Matthew Auld              2022-10-04  70  			if (ret)
c5e595e752b3a1c Matthew Auld              2022-10-04  71  				continue;
814c8757115f9d7 Dave Airlie               2021-10-12  72  		}
814c8757115f9d7 Dave Airlie               2021-10-12  73  
c5e595e752b3a1c Matthew Auld              2022-10-04  74  		ret = i915_vma_pin_ww(vma, &ww, 0, alignment, PIN_GLOBAL);
c5e595e752b3a1c Matthew Auld              2022-10-04  75  		if (ret)
c5e595e752b3a1c Matthew Auld              2022-10-04  76  			continue;
c5e595e752b3a1c Matthew Auld              2022-10-04  77  	}
814c8757115f9d7 Dave Airlie               2021-10-12  78  	if (ret) {
814c8757115f9d7 Dave Airlie               2021-10-12  79  		vma = ERR_PTR(ret);
814c8757115f9d7 Dave Airlie               2021-10-12  80  		goto err;
814c8757115f9d7 Dave Airlie               2021-10-12  81  	}
814c8757115f9d7 Dave Airlie               2021-10-12  82  
814c8757115f9d7 Dave Airlie               2021-10-12 @83  	vma->display_alignment = max_t(u64, vma->display_alignment, alignment);
814c8757115f9d7 Dave Airlie               2021-10-12  84  
814c8757115f9d7 Dave Airlie               2021-10-12  85  	i915_gem_object_flush_if_display(obj);
814c8757115f9d7 Dave Airlie               2021-10-12  86  
814c8757115f9d7 Dave Airlie               2021-10-12  87  	i915_vma_get(vma);
814c8757115f9d7 Dave Airlie               2021-10-12  88  err:
814c8757115f9d7 Dave Airlie               2021-10-12  89  	atomic_dec(&dev_priv->gpu_error.pending_fb_pin);
814c8757115f9d7 Dave Airlie               2021-10-12  90  
814c8757115f9d7 Dave Airlie               2021-10-12  91  	return vma;
814c8757115f9d7 Dave Airlie               2021-10-12  92  }
814c8757115f9d7 Dave Airlie               2021-10-12  93  

:::::: The code at line 83 was first introduced by commit
:::::: 814c8757115f9d7135126ac43d3a178b31e796dd drm/i915/display: move pin/unpin fb/plane code to a new file.

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
