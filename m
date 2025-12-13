Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156E2D47F2
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618050; cv=none; b=pre+twF36kudXaR+3jLDOHPp3xsD4o7UEu3yIlj9vNTIWUGgWqHN6RNvIBQjkWxDoujbrOsbc8T7Tbgrz/mL8aI/3feYGdtMzguxjziqXmofRUnlBMcUtYZYeQgQM1+CQhsMaIzFRAo+KCjBVU/Q0Vl/PzzDRZahwhKB09Jcx7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618050; c=relaxed/simple;
	bh=d3nGAqBKmAqzgnokMcofyQ+n1zCUPi05itKIyNwT9tY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLWxnbY1Rptm9BupVlHEFnG2On14cQZHmVyVlCYjgw5Y67u+39X2xFFj67SxSKJS94XkBQCjstSyxwVzS7TiVGs6C5o/j4fjaVmzCVkrR4HO/1bAf0FVagvVH1DXsCTXutJNwRzZfIWk3JeuguMOxNFkXzXsqrbnzIcFRJ5/x94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JikseE/B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JikseE/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765618048; x=1797154048;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d3nGAqBKmAqzgnokMcofyQ+n1zCUPi05itKIyNwT9tY=;
  b=JikseE/Bj5rw6b8ABex9HcdS6rjMOz7KnwEn1C7cTQBv8X9zXn3guB1e
   hCVfoe6/VZM7OhcipdELljsm4KdEhEc4KIxPrXZURrNycV7CgkqczmucG
   pXA98UrewYR+0OCJBNB0/FYCx/P3ZT8wgIBVnehrJKGdvr/SKxpnA5unH
   mxYnvfWhagZ/cxHVSRE5hLwCpKDO0f0nlJFVDzRRbq+zW417cwReBQF0m
   iDwMzoXpZsr6FHMG5U3TIC+oGDXwA/6JV7k9YepVAyC9SNkWRG/nrmvpN
   OlOY/UKOB879HFF0INGnEX6a+/wPVloi5ZQuHe+fA++xV4yRb9nrUt8+U
   Q==;
X-CSE-ConnectionGUID: JFwQC6iOSMGajUrY6LV4jA==
X-CSE-MsgGUID: 3b3iigkbSAiTl5Ylu1BEdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66594702"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="66594702"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 01:27:26 -0800
X-CSE-ConnectionGUID: Tdec/TWXS0a0XO1nuUXLPw==
X-CSE-MsgGUID: 3znteJ6lR7ml9A5lgzKw6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197185102"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 01:27:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vULuN-000000007QF-0T1f;
	Sat, 13 Dec 2025 09:27:23 +0000
Date: Sat, 13 Dec 2025 17:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:1176:6: warning:
 variable 'mock_file' is used uninitialized whenever 'if' condition is true
Message-ID: <202512131745.MHLFf8ey-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Krzysztof-Karas/drm-i915-selftests-Keep-mock-file-open-during-unfaultable-migrate-with-fill/20251204-171341, commit: 4ff550cf67a169b910b5254a6a5e5aab15acca2e"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Karas <krzysztof.karas@intel.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Karas/drm-i915-selftests-Keep-mock-file-open-during-unfaultable-migrate-with-fill/20251204-171341
head:   4ff550cf67a169b910b5254a6a5e5aab15acca2e
commit: 4ff550cf67a169b910b5254a6a5e5aab15acca2e drm/i915/selftests: Keep mock file open during unfaultable migrate with fill
date:   9 days ago
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-buildonly-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131745.MHLFf8ey-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131745.MHLFf8ey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512131745.MHLFf8ey-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gem/i915_gem_mman.c:1154:
>> drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:1176:6: warning: variable 'mock_file' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1176 |         if (err)
         |             ^~~
   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:1306:7: note: uninitialized use occurs here
    1306 |         fput(mock_file);
         |              ^~~~~~~~~
   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:1176:2: note: remove the 'if' if its condition is always false
    1176 |         if (err)
         |         ^~~~~~~~
    1177 |                 goto out_put;
         |                 ~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:1160:24: note: initialize the variable 'mock_file' to silence this warning
    1160 |         struct file *mock_file;
         |                               ^
         |                                = NULL
   1 warning generated.


vim +1176 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c

fb87550d251787 Matthew Auld    2022-02-28  1145  
fb87550d251787 Matthew Auld    2022-02-28  1146  #define IGT_MMAP_MIGRATE_TOPDOWN     (1 << 0)
fb87550d251787 Matthew Auld    2022-02-28  1147  #define IGT_MMAP_MIGRATE_FILL        (1 << 1)
fb87550d251787 Matthew Auld    2022-02-28  1148  #define IGT_MMAP_MIGRATE_EVICTABLE   (1 << 2)
fb87550d251787 Matthew Auld    2022-02-28  1149  #define IGT_MMAP_MIGRATE_UNFAULTABLE (1 << 3)
bfe53be268afd2 Matthew Auld    2022-06-29  1150  #define IGT_MMAP_MIGRATE_FAIL_GPU    (1 << 4)
fb87550d251787 Matthew Auld    2022-02-28  1151  static int __igt_mmap_migrate(struct intel_memory_region **placements,
fb87550d251787 Matthew Auld    2022-02-28  1152  			      int n_placements,
fb87550d251787 Matthew Auld    2022-02-28  1153  			      struct intel_memory_region *expected_mr,
fb87550d251787 Matthew Auld    2022-02-28  1154  			      unsigned int flags)
fb87550d251787 Matthew Auld    2022-02-28  1155  {
fb87550d251787 Matthew Auld    2022-02-28  1156  	struct drm_i915_private *i915 = placements[0]->i915;
fb87550d251787 Matthew Auld    2022-02-28  1157  	struct drm_i915_gem_object *obj;
fb87550d251787 Matthew Auld    2022-02-28  1158  	struct i915_request *rq = NULL;
f768ebbba91108 Krzysztof Karas 2025-07-30  1159  	struct vm_area_struct *area;
4ff550cf67a169 Krzysztof Karas 2025-12-04  1160  	struct file *mock_file;
fb87550d251787 Matthew Auld    2022-02-28  1161  	unsigned long addr;
fb87550d251787 Matthew Auld    2022-02-28  1162  	LIST_HEAD(objects);
fb87550d251787 Matthew Auld    2022-02-28  1163  	u64 offset;
fb87550d251787 Matthew Auld    2022-02-28  1164  	int err;
fb87550d251787 Matthew Auld    2022-02-28  1165  
fb87550d251787 Matthew Auld    2022-02-28  1166  	obj = __i915_gem_object_create_user(i915, PAGE_SIZE,
fb87550d251787 Matthew Auld    2022-02-28  1167  					    placements,
fb87550d251787 Matthew Auld    2022-02-28  1168  					    n_placements);
fb87550d251787 Matthew Auld    2022-02-28  1169  	if (IS_ERR(obj))
fb87550d251787 Matthew Auld    2022-02-28  1170  		return PTR_ERR(obj);
fb87550d251787 Matthew Auld    2022-02-28  1171  
fb87550d251787 Matthew Auld    2022-02-28  1172  	if (flags & IGT_MMAP_MIGRATE_TOPDOWN)
fb87550d251787 Matthew Auld    2022-02-28  1173  		obj->flags |= I915_BO_ALLOC_GPU_ONLY;
fb87550d251787 Matthew Auld    2022-02-28  1174  
fb87550d251787 Matthew Auld    2022-02-28  1175  	err = __assign_mmap_offset(obj, I915_MMAP_TYPE_FIXED, &offset, NULL);
fb87550d251787 Matthew Auld    2022-02-28 @1176  	if (err)
fb87550d251787 Matthew Auld    2022-02-28  1177  		goto out_put;
fb87550d251787 Matthew Auld    2022-02-28  1178  
fb87550d251787 Matthew Auld    2022-02-28  1179  	/*
4ff550cf67a169 Krzysztof Karas 2025-12-04  1180  	 * Pretend to open("/dev/dri/card0"), which will eventually create a GEM
4ff550cf67a169 Krzysztof Karas 2025-12-04  1181  	 * context along with multiple GEM objects (for paging structures and
4ff550cf67a169 Krzysztof Karas 2025-12-04  1182  	 * scratch) that are placed in mappable portion of GPU memory.
4ff550cf67a169 Krzysztof Karas 2025-12-04  1183  	 * Calling fput() on the file places objects' cleanup routines in delayed
4ff550cf67a169 Krzysztof Karas 2025-12-04  1184  	 * worqueues, which execute after unspecified amount of time.
4ff550cf67a169 Krzysztof Karas 2025-12-04  1185  	 * Keep the file open until migration and page fault checks are done to
4ff550cf67a169 Krzysztof Karas 2025-12-04  1186  	 * make sure object cleanup is not executed after igt_fill_mappable()
4ff550cf67a169 Krzysztof Karas 2025-12-04  1187  	 * finishes and before migration is attempted - that would leave a gap
4ff550cf67a169 Krzysztof Karas 2025-12-04  1188  	 * large enough for the migration to succeed, when we'd expect it to fail.
fb87550d251787 Matthew Auld    2022-02-28  1189  	 */
4ff550cf67a169 Krzysztof Karas 2025-12-04  1190  	mock_file = mock_drm_getfile(i915->drm.primary, O_RDWR);
4ff550cf67a169 Krzysztof Karas 2025-12-04  1191  	if (IS_ERR(mock_file))
4ff550cf67a169 Krzysztof Karas 2025-12-04  1192  		return PTR_ERR(mock_file);
4ff550cf67a169 Krzysztof Karas 2025-12-04  1193  
4ff550cf67a169 Krzysztof Karas 2025-12-04  1194  	addr = igt_mmap_offset_with_file(i915, offset, obj->base.size,
4ff550cf67a169 Krzysztof Karas 2025-12-04  1195  					 PROT_WRITE, MAP_SHARED, mock_file);
fb87550d251787 Matthew Auld    2022-02-28  1196  	if (IS_ERR_VALUE(addr)) {
fb87550d251787 Matthew Auld    2022-02-28  1197  		err = addr;
fb87550d251787 Matthew Auld    2022-02-28  1198  		goto out_put;
fb87550d251787 Matthew Auld    2022-02-28  1199  	}
fb87550d251787 Matthew Auld    2022-02-28  1200  
f768ebbba91108 Krzysztof Karas 2025-07-30  1201  	mmap_read_lock(current->mm);
f768ebbba91108 Krzysztof Karas 2025-07-30  1202  	area = vma_lookup(current->mm, addr);
f768ebbba91108 Krzysztof Karas 2025-07-30  1203  	mmap_read_unlock(current->mm);
f768ebbba91108 Krzysztof Karas 2025-07-30  1204  	if (!area) {
f768ebbba91108 Krzysztof Karas 2025-07-30  1205  		pr_err("%s: Did not create a vm_area_struct for the mmap\n",
f768ebbba91108 Krzysztof Karas 2025-07-30  1206  		       obj->mm.region->name);
f768ebbba91108 Krzysztof Karas 2025-07-30  1207  		err = -EINVAL;
f768ebbba91108 Krzysztof Karas 2025-07-30  1208  		goto out_addr;
f768ebbba91108 Krzysztof Karas 2025-07-30  1209  	}
f768ebbba91108 Krzysztof Karas 2025-07-30  1210  
fb87550d251787 Matthew Auld    2022-02-28  1211  	if (flags & IGT_MMAP_MIGRATE_FILL) {
fb87550d251787 Matthew Auld    2022-02-28  1212  		err = igt_fill_mappable(placements[0], &objects);
fb87550d251787 Matthew Auld    2022-02-28  1213  		if (err)
f768ebbba91108 Krzysztof Karas 2025-07-30  1214  			goto out_addr;
fb87550d251787 Matthew Auld    2022-02-28  1215  	}
fb87550d251787 Matthew Auld    2022-02-28  1216  
fb87550d251787 Matthew Auld    2022-02-28  1217  	err = i915_gem_object_lock(obj, NULL);
fb87550d251787 Matthew Auld    2022-02-28  1218  	if (err)
f768ebbba91108 Krzysztof Karas 2025-07-30  1219  		goto out_addr;
fb87550d251787 Matthew Auld    2022-02-28  1220  
fb87550d251787 Matthew Auld    2022-02-28  1221  	err = i915_gem_object_pin_pages(obj);
fb87550d251787 Matthew Auld    2022-02-28  1222  	if (err) {
fb87550d251787 Matthew Auld    2022-02-28  1223  		i915_gem_object_unlock(obj);
f768ebbba91108 Krzysztof Karas 2025-07-30  1224  		goto out_addr;
fb87550d251787 Matthew Auld    2022-02-28  1225  	}
fb87550d251787 Matthew Auld    2022-02-28  1226  
fb87550d251787 Matthew Auld    2022-02-28  1227  	err = intel_context_migrate_clear(to_gt(i915)->migrate.context, NULL,
9275277d53248d Fei Yang        2023-05-09  1228  					  obj->mm.pages->sgl, obj->pat_index,
fb87550d251787 Matthew Auld    2022-02-28  1229  					  i915_gem_object_is_lmem(obj),
fb87550d251787 Matthew Auld    2022-02-28  1230  					  expand32(POISON_INUSE), &rq);
fb87550d251787 Matthew Auld    2022-02-28  1231  	i915_gem_object_unpin_pages(obj);
c4d0f59ded1efb Krzysztof Karas 2025-07-30  1232  	if (rq && !err) {
11f01dcf3b32d0 Matthew Auld    2022-06-29  1233  		err = dma_resv_reserve_fences(obj->base.resv, 1);
11f01dcf3b32d0 Matthew Auld    2022-06-29  1234  		if (!err)
73511edf8b196e Christian König 2021-11-09  1235  			dma_resv_add_fence(obj->base.resv, &rq->fence,
1d7f5e6c5240c3 Christian König 2021-12-22  1236  					   DMA_RESV_USAGE_KERNEL);
fb87550d251787 Matthew Auld    2022-02-28  1237  		i915_request_put(rq);
fb87550d251787 Matthew Auld    2022-02-28  1238  	}
fb87550d251787 Matthew Auld    2022-02-28  1239  	i915_gem_object_unlock(obj);
fb87550d251787 Matthew Auld    2022-02-28  1240  	if (err)
f768ebbba91108 Krzysztof Karas 2025-07-30  1241  		goto out_addr;
fb87550d251787 Matthew Auld    2022-02-28  1242  
fb87550d251787 Matthew Auld    2022-02-28  1243  	if (flags & IGT_MMAP_MIGRATE_EVICTABLE)
fb87550d251787 Matthew Auld    2022-02-28  1244  		igt_make_evictable(&objects);
fb87550d251787 Matthew Auld    2022-02-28  1245  
bfe53be268afd2 Matthew Auld    2022-06-29  1246  	if (flags & IGT_MMAP_MIGRATE_FAIL_GPU) {
bfe53be268afd2 Matthew Auld    2022-06-29  1247  		err = i915_gem_object_lock(obj, NULL);
bfe53be268afd2 Matthew Auld    2022-06-29  1248  		if (err)
f768ebbba91108 Krzysztof Karas 2025-07-30  1249  			goto out_addr;
bfe53be268afd2 Matthew Auld    2022-06-29  1250  
bfe53be268afd2 Matthew Auld    2022-06-29  1251  		/*
f768ebbba91108 Krzysztof Karas 2025-07-30  1252  		 * Ensure we only simulate the gpu failure when faulting the
bfe53be268afd2 Matthew Auld    2022-06-29  1253  		 * pages.
bfe53be268afd2 Matthew Auld    2022-06-29  1254  		 */
bfe53be268afd2 Matthew Auld    2022-06-29  1255  		err = i915_gem_object_wait_moving_fence(obj, true);
bfe53be268afd2 Matthew Auld    2022-06-29  1256  		i915_gem_object_unlock(obj);
bfe53be268afd2 Matthew Auld    2022-06-29  1257  		if (err)
f768ebbba91108 Krzysztof Karas 2025-07-30  1258  			goto out_addr;
bfe53be268afd2 Matthew Auld    2022-06-29  1259  		i915_ttm_migrate_set_failure_modes(true, false);
bfe53be268afd2 Matthew Auld    2022-06-29  1260  	}
bfe53be268afd2 Matthew Auld    2022-06-29  1261  
fb87550d251787 Matthew Auld    2022-02-28  1262  	err = ___igt_mmap_migrate(i915, obj, addr,
fb87550d251787 Matthew Auld    2022-02-28  1263  				  flags & IGT_MMAP_MIGRATE_UNFAULTABLE);
bfe53be268afd2 Matthew Auld    2022-06-29  1264  
fb87550d251787 Matthew Auld    2022-02-28  1265  	if (!err && obj->mm.region != expected_mr) {
fb87550d251787 Matthew Auld    2022-02-28  1266  		pr_err("%s region mismatch %s\n", __func__, expected_mr->name);
fb87550d251787 Matthew Auld    2022-02-28  1267  		err = -EINVAL;
fb87550d251787 Matthew Auld    2022-02-28  1268  	}
fb87550d251787 Matthew Auld    2022-02-28  1269  
bfe53be268afd2 Matthew Auld    2022-06-29  1270  	if (flags & IGT_MMAP_MIGRATE_FAIL_GPU) {
bfe53be268afd2 Matthew Auld    2022-06-29  1271  		struct intel_gt *gt;
bfe53be268afd2 Matthew Auld    2022-06-29  1272  		unsigned int id;
bfe53be268afd2 Matthew Auld    2022-06-29  1273  
bfe53be268afd2 Matthew Auld    2022-06-29  1274  		i915_ttm_migrate_set_failure_modes(false, false);
bfe53be268afd2 Matthew Auld    2022-06-29  1275  
bfe53be268afd2 Matthew Auld    2022-06-29  1276  		for_each_gt(gt, i915, id) {
bfe53be268afd2 Matthew Auld    2022-06-29  1277  			intel_wakeref_t wakeref;
bfe53be268afd2 Matthew Auld    2022-06-29  1278  			bool wedged;
bfe53be268afd2 Matthew Auld    2022-06-29  1279  
bfe53be268afd2 Matthew Auld    2022-06-29  1280  			mutex_lock(&gt->reset.mutex);
bfe53be268afd2 Matthew Auld    2022-06-29  1281  			wedged = test_bit(I915_WEDGED, &gt->reset.flags);
bfe53be268afd2 Matthew Auld    2022-06-29  1282  			mutex_unlock(&gt->reset.mutex);
bfe53be268afd2 Matthew Auld    2022-06-29  1283  			if (!wedged) {
bfe53be268afd2 Matthew Auld    2022-06-29  1284  				pr_err("gt(%u) not wedged\n", id);
bfe53be268afd2 Matthew Auld    2022-06-29  1285  				err = -EINVAL;
bfe53be268afd2 Matthew Auld    2022-06-29  1286  				continue;
bfe53be268afd2 Matthew Auld    2022-06-29  1287  			}
bfe53be268afd2 Matthew Auld    2022-06-29  1288  
bfe53be268afd2 Matthew Auld    2022-06-29  1289  			wakeref = intel_runtime_pm_get(gt->uncore->rpm);
bfe53be268afd2 Matthew Auld    2022-06-29  1290  			igt_global_reset_lock(gt);
bfe53be268afd2 Matthew Auld    2022-06-29  1291  			intel_gt_reset(gt, ALL_ENGINES, NULL);
bfe53be268afd2 Matthew Auld    2022-06-29  1292  			igt_global_reset_unlock(gt);
bfe53be268afd2 Matthew Auld    2022-06-29  1293  			intel_runtime_pm_put(gt->uncore->rpm, wakeref);
bfe53be268afd2 Matthew Auld    2022-06-29  1294  		}
bfe53be268afd2 Matthew Auld    2022-06-29  1295  
bfe53be268afd2 Matthew Auld    2022-06-29  1296  		if (!i915_gem_object_has_unknown_state(obj)) {
bfe53be268afd2 Matthew Auld    2022-06-29  1297  			pr_err("object missing unknown_state\n");
bfe53be268afd2 Matthew Auld    2022-06-29  1298  			err = -EINVAL;
bfe53be268afd2 Matthew Auld    2022-06-29  1299  		}
bfe53be268afd2 Matthew Auld    2022-06-29  1300  	}
bfe53be268afd2 Matthew Auld    2022-06-29  1301  
f768ebbba91108 Krzysztof Karas 2025-07-30  1302  out_addr:
f768ebbba91108 Krzysztof Karas 2025-07-30  1303  	vm_munmap(addr, obj->base.size);
f768ebbba91108 Krzysztof Karas 2025-07-30  1304  
fb87550d251787 Matthew Auld    2022-02-28  1305  out_put:
4ff550cf67a169 Krzysztof Karas 2025-12-04  1306  	fput(mock_file);
fb87550d251787 Matthew Auld    2022-02-28  1307  	i915_gem_object_put(obj);
fb87550d251787 Matthew Auld    2022-02-28  1308  	igt_close_objects(i915, &objects);
fb87550d251787 Matthew Auld    2022-02-28  1309  	return err;
fb87550d251787 Matthew Auld    2022-02-28  1310  }
fb87550d251787 Matthew Auld    2022-02-28  1311  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
