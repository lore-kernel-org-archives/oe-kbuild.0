Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433A0804
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716000036; cv=none; b=NjKkZS/QmxBfCHyqMmZwzeJm96REZG7Q8E5CwWTPN6hRQXzYEOqkJGxxHv+W4LDk9BKJlIBk+pCo9wD+asiFtt052E2fnlFtChQfec89p4IcBWFkTg2FnD0JHpKZHKeGnyZhxmygsTgefBlc/u9kZ5wA5jfcxTJc+p3LzcEJBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716000036; c=relaxed/simple;
	bh=wInyfTFtGTMZKA8rfUqT4b/M6WdIyGuuX37RW4LVPDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JdtH4ufTUPCf8Q/CWos43whhkCjUQ8Ge1iUFsR+e07AnzZwg5NCfh0JXjkhbXqK8YMLw2gmaCnRrXTGMOrXltlfp+sWGsbG0u5JZqGFdOKfOgmeA1qRQg39IttbgfaspmQNsF6wLIJ4yNrD6M3b6pmKVjZ687n3oDTBD+R8ITTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RnhCbL7z; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RnhCbL7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716000034; x=1747536034;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wInyfTFtGTMZKA8rfUqT4b/M6WdIyGuuX37RW4LVPDI=;
  b=RnhCbL7z3A5McXccS++toLU14M5l1mfP5xIVVKY9igSo9h0ccEvqCiyx
   O+KgRlRz4JcymUXh5EdrV6/gZWBHRnZ9s0xXQ7QSgxA35AcLJykBXlL4r
   eU023zKT06cvELyTI/WWm/LeLwfEbm2HXeyc6GnU2Hr851BnycvaFn0BL
   l70O1FldNJOPWKPgmbgSlrsrc0fdW30AN6wMv31G9IfkJJF2dF/HyL7zy
   jHH0kEFxgTg1DayqhvWKumN0CBKTJMgEQxyDMGIlvMFud70OjRLQWQPIV
   qh1RMt++1jT225cub1lgjR2YC80UBQTNkoY6LDjwYvScONDS322eN70kD
   A==;
X-CSE-ConnectionGUID: SQ3+i5Z0RS+qLYjTjUSeEg==
X-CSE-MsgGUID: EknE6jDpQwyAJF3X4ZLjng==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12071809"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="12071809"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 19:40:32 -0700
X-CSE-ConnectionGUID: jxx6Od78QpK5p86CJfcjmg==
X-CSE-MsgGUID: 8bvtjIbCTxK2XgugzdoDzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="32552455"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 May 2024 19:40:31 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s89zo-0001Xo-2Q;
	Sat, 18 May 2024 02:40:28 +0000
Date: Sat, 18 May 2024 10:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12443/13355]
 drivers/gpu/drm/i915/display/intel_dpt.c:173 intel_dpt_pin_to_ggtt() error:
 uninitialized symbol 'vma'.
Message-ID: <202405181057.d5K5ENqy-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>

Hi Ville,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c75962170e49f24399141276ae119e6a879f36dc
commit: c7df997b260919e4d18b2dee21cae6bcf765babc [12443/13355] drm/i915: Rename the fb pinning functions to indicate the address space
:::::: branch date: 23 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181057.d5K5ENqy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405181057.d5K5ENqy-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_dpt.c:173 intel_dpt_pin_to_ggtt() error: uninitialized symbol 'vma'.
drivers/gpu/drm/i915/display/intel_fb_pin.c:93 intel_fb_pin_to_dpt() error: uninitialized symbol 'vma'.
drivers/gpu/drm/i915/display/intel_fb_pin.c:93 intel_fb_pin_to_dpt() error: 'vma' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:183 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 172)
drivers/gpu/drm/i915/gem/i915_gem_object.h:183 __i915_gem_object_lock() error: we previously assumed 'ww' could be null (see line 172)

vim +/vma +173 drivers/gpu/drm/i915/display/intel_dpt.c

dc6d6158a6e8b1 Jani Nikula          2021-08-23  123  
c7df997b260919 Ville Syrjälä        2024-05-06  124  struct i915_vma *intel_dpt_pin_to_ggtt(struct i915_address_space *vm,
c8bafa0d9898f3 Ville Syrjälä        2024-04-30  125  				       unsigned int alignment)
dc6d6158a6e8b1 Jani Nikula          2021-08-23  126  {
dc6d6158a6e8b1 Jani Nikula          2021-08-23  127  	struct drm_i915_private *i915 = vm->i915;
dc6d6158a6e8b1 Jani Nikula          2021-08-23  128  	struct i915_dpt *dpt = i915_vm_to_dpt(vm);
dc6d6158a6e8b1 Jani Nikula          2021-08-23  129  	intel_wakeref_t wakeref;
dc6d6158a6e8b1 Jani Nikula          2021-08-23  130  	struct i915_vma *vma;
dc6d6158a6e8b1 Jani Nikula          2021-08-23  131  	void __iomem *iomem;
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  132  	struct i915_gem_ww_ctx ww;
0dc987b699ce42 Juha-Pekka Heikkila  2022-06-10  133  	u64 pin_flags = 0;
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  134  	int err;
dc6d6158a6e8b1 Jani Nikula          2021-08-23  135  
0dc987b699ce42 Juha-Pekka Heikkila  2022-06-10  136  	if (i915_gem_object_is_stolen(dpt->obj))
0dc987b699ce42 Juha-Pekka Heikkila  2022-06-10  137  		pin_flags |= PIN_MAPPABLE;
0dc987b699ce42 Juha-Pekka Heikkila  2022-06-10  138  
dc6d6158a6e8b1 Jani Nikula          2021-08-23  139  	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
dc6d6158a6e8b1 Jani Nikula          2021-08-23  140  	atomic_inc(&i915->gpu_error.pending_fb_pin);
dc6d6158a6e8b1 Jani Nikula          2021-08-23  141  
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  142  	for_i915_gem_ww(&ww, err, true) {
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  143  		err = i915_gem_object_lock(dpt->obj, &ww);
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  144  		if (err)
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  145  			continue;
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  146  
c8bafa0d9898f3 Ville Syrjälä        2024-04-30  147  		vma = i915_gem_object_ggtt_pin_ww(dpt->obj, &ww, NULL, 0,
c8bafa0d9898f3 Ville Syrjälä        2024-04-30  148  						  alignment, pin_flags);
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  149  		if (IS_ERR(vma)) {
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  150  			err = PTR_ERR(vma);
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  151  			continue;
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  152  		}
dc6d6158a6e8b1 Jani Nikula          2021-08-23  153  
dc6d6158a6e8b1 Jani Nikula          2021-08-23  154  		iomem = i915_vma_pin_iomap(vma);
dc6d6158a6e8b1 Jani Nikula          2021-08-23  155  		i915_vma_unpin(vma);
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  156  
dc6d6158a6e8b1 Jani Nikula          2021-08-23  157  		if (IS_ERR(iomem)) {
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  158  			err = PTR_ERR(iomem);
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  159  			continue;
dc6d6158a6e8b1 Jani Nikula          2021-08-23  160  		}
dc6d6158a6e8b1 Jani Nikula          2021-08-23  161  
dc6d6158a6e8b1 Jani Nikula          2021-08-23  162  		dpt->vma = vma;
dc6d6158a6e8b1 Jani Nikula          2021-08-23  163  		dpt->iomem = iomem;
dc6d6158a6e8b1 Jani Nikula          2021-08-23  164  
dc6d6158a6e8b1 Jani Nikula          2021-08-23  165  		i915_vma_get(vma);
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29  166  	}
dc6d6158a6e8b1 Jani Nikula          2021-08-23  167  
e91a777a6e602b Radhakrishna Sripada 2023-07-18  168  	dpt->obj->mm.dirty = true;
e91a777a6e602b Radhakrishna Sripada 2023-07-18  169  
dc6d6158a6e8b1 Jani Nikula          2021-08-23  170  	atomic_dec(&i915->gpu_error.pending_fb_pin);
dc6d6158a6e8b1 Jani Nikula          2021-08-23  171  	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
dc6d6158a6e8b1 Jani Nikula          2021-08-23  172  
f0b6b01b3efe74 Maarten Lankhorst    2021-09-29 @173  	return err ? ERR_PTR(err) : vma;
dc6d6158a6e8b1 Jani Nikula          2021-08-23  174  }
dc6d6158a6e8b1 Jani Nikula          2021-08-23  175  

:::::: The code at line 173 was first introduced by commit
:::::: f0b6b01b3efe74afd2de59c894105e13b121a01e drm/i915: Add ww context to intel_dpt_pin, v2.

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
