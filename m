Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A1C171AA
	for <oe-kbuild@lists.linux.dev>; Mon, 20 May 2024 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716235335; cv=none; b=MM0uLskZAGx2sFTwlODO87HESkaBxTAhM+UwUncOoQ5vtco+ypPm5ty2G5J9ed2pfXDEah2d/fy9GZeCPUgwF76cs9TodH845RIhnSsCE7gOewvv9a2jsBxjAHa3QVNxJpxF+Hp99lblpWJvFzUjNAK77nbELkqKvXw7D6cF/7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716235335; c=relaxed/simple;
	bh=5k4VmsL7zW+nGBR2d15zlhMvnnEFMyivYfBla9UsYrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aCRT9+0LJftaJbK4Gm8WP1m+4L51RYjuLwnfu/CTrfAtg0FSflBjlHJWC5CgqNcsw/MqYkxFA1HE5MrhjCQMx6OpcLwK9jcgdMN5B6aUXiOWH5b7ijArzTjiPZ8MHo+3bCJ614fe2SBS9Fg3ObcIYTP4W/FwRcOMxU3TmiF4YT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhaFw+OS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhaFw+OS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716235333; x=1747771333;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5k4VmsL7zW+nGBR2d15zlhMvnnEFMyivYfBla9UsYrQ=;
  b=AhaFw+OSPj7skCdn567NTcft4v0CCCu9I87KpXvtagcH2hkggQatZKPH
   z0gKuaNsTBvIO6YBjEjG57VllfaD7iUVwe18+CTTxkoqMx/91isYkvE2Q
   xOue2o4TaNT3ZVEcdOYlwX+jkNDRISXxmC/NdBQRSi9VB9v84fEwOiCdW
   yEXsFNKH4RgVqFJLrjjHRkEnyLwtLZMVR3OVbGOhjRd4gnLcwyziUxUgk
   cAXppIJZWV87RX5kMlS6kc5Wi4m8cSfWWgzjm9K2EXEU90kjRujr6PtdJ
   X6QcjPreTzd0DKucNE3HKRggMWadm9s+x1QLaGG5tblwGJ08PRuYM2zKI
   g==;
X-CSE-ConnectionGUID: JxlsW5EdTmWnOC22GE6TwA==
X-CSE-MsgGUID: 2nUjqemsTEGuCT5wNzWjGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12329007"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12329007"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 13:02:02 -0700
X-CSE-ConnectionGUID: TpAI4VWSSQOQv9y23z4rtQ==
X-CSE-MsgGUID: A91xoETRToaYc6fj8E6ZuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="32527231"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2024 13:02:00 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s99Cc-00056y-1t;
	Mon, 20 May 2024 20:01:56 +0000
Date: Tue, 21 May 2024 04:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13286/13491]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1249 amdgpu_vm_bo_update() error: we
 previously assumed 'bo' could be null (see line 1189)
Message-ID: <202405210457.TkWseW6L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>

Hi Tvrtko,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   632483ea8004edfadd035de36e1ab2c7c4f53158
commit: 26e20235ce00219a1ca2fb617d82fa24607190ae [13286/13491] drm/amdgpu: Add amdgpu_bo_is_vm_bo helper
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240520 (https://download.01.org/0day-ci/archive/20240521/202405210457.TkWseW6L-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405210457.TkWseW6L-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1249 amdgpu_vm_bo_update() error: we previously assumed 'bo' could be null (see line 1189)

vim +/bo +1249 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

d6530c33a978c6 Marek Olšák       2023-01-30  1138  
d38ceaf99ed015 Alex Deucher      2015-04-20  1139  /**
d38ceaf99ed015 Alex Deucher      2015-04-20  1140   * amdgpu_vm_bo_update - update all BO mappings in the vm page table
d38ceaf99ed015 Alex Deucher      2015-04-20  1141   *
d38ceaf99ed015 Alex Deucher      2015-04-20  1142   * @adev: amdgpu_device pointer
d38ceaf99ed015 Alex Deucher      2015-04-20  1143   * @bo_va: requested BO and VM object
99e124f402d6d6 Christian König   2016-08-16  1144   * @clear: if true clear the entries
d38ceaf99ed015 Alex Deucher      2015-04-20  1145   *
d38ceaf99ed015 Alex Deucher      2015-04-20  1146   * Fill in the page table entries for @bo_va.
7fc48e5912795c Andrey Grodzovsky 2018-06-11  1147   *
7fc48e5912795c Andrey Grodzovsky 2018-06-11  1148   * Returns:
7fc48e5912795c Andrey Grodzovsky 2018-06-11  1149   * 0 for success, -EINVAL for failure.
d38ceaf99ed015 Alex Deucher      2015-04-20  1150   */
fc39d903eb8055 Christian König   2019-09-13  1151  int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
8f8cc3fb43508a Christian König   2022-03-17  1152  			bool clear)
d38ceaf99ed015 Alex Deucher      2015-04-20  1153  {
ec681545afe5a4 Christian König   2017-08-01  1154  	struct amdgpu_bo *bo = bo_va->base.bo;
ec681545afe5a4 Christian König   2017-08-01  1155  	struct amdgpu_vm *vm = bo_va->base.vm;
d38ceaf99ed015 Alex Deucher      2015-04-20  1156  	struct amdgpu_bo_va_mapping *mapping;
8358dceed981cf Christian König   2016-03-30  1157  	dma_addr_t *pages_addr = NULL;
2966141ad2dda2 Dave Airlie       2020-08-04  1158  	struct ttm_resource *mem;
9f3cc18d19b7b7 Christian König   2020-01-23  1159  	struct dma_fence **last_update;
30671b44aa570a Christian König   2022-03-30  1160  	bool flush_tlb = clear;
142262a1c02ad4 David Francis     2023-10-12  1161  	bool uncached;
9f3cc18d19b7b7 Christian König   2020-01-23  1162  	struct dma_resv *resv;
30671b44aa570a Christian König   2022-03-30  1163  	uint64_t vram_base;
457e0fee04b0c6 Christian König   2017-08-22  1164  	uint64_t flags;
d38ceaf99ed015 Alex Deucher      2015-04-20  1165  	int r;
d38ceaf99ed015 Alex Deucher      2015-04-20  1166  
7eb80427746175 Huang Rui         2018-07-04  1167  	if (clear || !bo) {
99e124f402d6d6 Christian König   2016-08-16  1168  		mem = NULL;
391629bdfcb901 Nirmoy Das        2021-06-15  1169  		resv = vm->root.bo->tbo.base.resv;
99e124f402d6d6 Christian König   2016-08-16  1170  	} else {
0cf0ee983b14af Arunpravin        2020-08-06  1171  		struct drm_gem_object *obj = &bo->tbo.base;
8358dceed981cf Christian König   2016-03-30  1172  
0cf0ee983b14af Arunpravin        2020-08-06  1173  		resv = bo->tbo.base.resv;
0cf0ee983b14af Arunpravin        2020-08-06  1174  		if (obj->import_attach && bo_va->is_xgmi) {
0cf0ee983b14af Arunpravin        2020-08-06  1175  			struct dma_buf *dma_buf = obj->import_attach->dmabuf;
0cf0ee983b14af Arunpravin        2020-08-06  1176  			struct drm_gem_object *gobj = dma_buf->priv;
0cf0ee983b14af Arunpravin        2020-08-06  1177  			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
0cf0ee983b14af Arunpravin        2020-08-06  1178  
51b79f33817544 Felix Kuehling    2023-10-17  1179  			if (abo->tbo.resource &&
51b79f33817544 Felix Kuehling    2023-10-17  1180  			    abo->tbo.resource->mem_type == TTM_PL_VRAM)
0cf0ee983b14af Arunpravin        2020-08-06  1181  				bo = gem_to_amdgpu_bo(gobj);
0cf0ee983b14af Arunpravin        2020-08-06  1182  		}
d3116756a710e3 Christian König   2021-04-12  1183  		mem = bo->tbo.resource;
256503071c2de2 Felix Kuehling    2023-10-31  1184  		if (mem && (mem->mem_type == TTM_PL_TT ||
256503071c2de2 Felix Kuehling    2023-10-31  1185  			    mem->mem_type == AMDGPU_PL_PREEMPT))
e34b8feeaa4b65 Christian König   2020-10-21  1186  			pages_addr = bo->tbo.ttm->dma_address;
d38ceaf99ed015 Alex Deucher      2015-04-20  1187  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  1188  
a690aa0f459eba shaoyunl          2019-02-22 @1189  	if (bo) {
30671b44aa570a Christian König   2022-03-30  1190  		struct amdgpu_device *bo_adev;
30671b44aa570a Christian König   2022-03-30  1191  
ec681545afe5a4 Christian König   2017-08-01  1192  		flags = amdgpu_ttm_tt_pte_flags(adev, bo->tbo.ttm, mem);
4cd24494cc8746 Alex Deucher      2019-08-07  1193  
4cd24494cc8746 Alex Deucher      2019-08-07  1194  		if (amdgpu_bo_encrypted(bo))
4cd24494cc8746 Alex Deucher      2019-08-07  1195  			flags |= AMDGPU_PTE_TMZ;
4cd24494cc8746 Alex Deucher      2019-08-07  1196  
a690aa0f459eba shaoyunl          2019-02-22  1197  		bo_adev = amdgpu_ttm_adev(bo->tbo.bdev);
30671b44aa570a Christian König   2022-03-30  1198  		vram_base = bo_adev->vm_manager.vram_base_offset;
142262a1c02ad4 David Francis     2023-10-12  1199  		uncached = (bo->flags & AMDGPU_GEM_CREATE_UNCACHED) != 0;
a690aa0f459eba shaoyunl          2019-02-22  1200  	} else {
a5f6b5b1e89067 Christian König   2017-01-30  1201  		flags = 0x0;
30671b44aa570a Christian König   2022-03-30  1202  		vram_base = 0;
142262a1c02ad4 David Francis     2023-10-12  1203  		uncached = false;
a690aa0f459eba shaoyunl          2019-02-22  1204  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  1205  
26e20235ce0021 Tvrtko Ursulin    2024-05-06  1206  	if (clear || amdgpu_vm_is_bo_always_valid(vm, bo))
4e55eb3879fea6 Christian König   2017-09-11  1207  		last_update = &vm->last_update;
4e55eb3879fea6 Christian König   2017-09-11  1208  	else
4e55eb3879fea6 Christian König   2017-09-11  1209  		last_update = &bo_va->last_pt_update;
4e55eb3879fea6 Christian König   2017-09-11  1210  
3d7d4d3a1b9f67 Christian König   2017-08-23  1211  	if (!clear && bo_va->base.moved) {
30671b44aa570a Christian König   2022-03-30  1212  		flush_tlb = true;
7fc11959018f8b Christian König   2015-07-30  1213  		list_splice_init(&bo_va->valids, &bo_va->invalids);
3d7d4d3a1b9f67 Christian König   2017-08-23  1214  
cb7b6ec2f8b875 Christian König   2017-08-15  1215  	} else if (bo_va->cleared != clear) {
7fc11959018f8b Christian König   2015-07-30  1216  		list_splice_init(&bo_va->valids, &bo_va->invalids);
3d7d4d3a1b9f67 Christian König   2017-08-23  1217  	}
7fc11959018f8b Christian König   2015-07-30  1218  
7fc11959018f8b Christian König   2015-07-30  1219  	list_for_each_entry(mapping, &bo_va->invalids, list) {
a39f2a8d70666e Christian König   2020-10-12  1220  		uint64_t update_flags = flags;
a39f2a8d70666e Christian König   2020-10-12  1221  
a39f2a8d70666e Christian König   2020-10-12  1222  		/* normally,bo_va->flags only contians READABLE and WIRTEABLE bit go here
a39f2a8d70666e Christian König   2020-10-12  1223  		 * but in case of something, we filter the flags in first place
a39f2a8d70666e Christian König   2020-10-12  1224  		 */
a39f2a8d70666e Christian König   2020-10-12  1225  		if (!(mapping->flags & AMDGPU_PTE_READABLE))
a39f2a8d70666e Christian König   2020-10-12  1226  			update_flags &= ~AMDGPU_PTE_READABLE;
a39f2a8d70666e Christian König   2020-10-12  1227  		if (!(mapping->flags & AMDGPU_PTE_WRITEABLE))
a39f2a8d70666e Christian König   2020-10-12  1228  			update_flags &= ~AMDGPU_PTE_WRITEABLE;
a39f2a8d70666e Christian König   2020-10-12  1229  
a39f2a8d70666e Christian König   2020-10-12  1230  		/* Apply ASIC specific mapping flags */
a39f2a8d70666e Christian König   2020-10-12  1231  		amdgpu_gmc_get_vm_pte(adev, mapping, &update_flags);
a39f2a8d70666e Christian König   2020-10-12  1232  
a39f2a8d70666e Christian König   2020-10-12  1233  		trace_amdgpu_vm_bo_update(mapping);
a39f2a8d70666e Christian König   2020-10-12  1234  
30671b44aa570a Christian König   2022-03-30  1235  		r = amdgpu_vm_update_range(adev, vm, false, false, flush_tlb,
142262a1c02ad4 David Francis     2023-10-12  1236  					   !uncached, resv, mapping->start, mapping->last,
30671b44aa570a Christian König   2022-03-30  1237  					   update_flags, mapping->offset,
30671b44aa570a Christian König   2022-03-30  1238  					   vram_base, mem, pages_addr,
30671b44aa570a Christian König   2022-03-30  1239  					   last_update);
d38ceaf99ed015 Alex Deucher      2015-04-20  1240  		if (r)
d38ceaf99ed015 Alex Deucher      2015-04-20  1241  			return r;
d38ceaf99ed015 Alex Deucher      2015-04-20  1242  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  1243  
361883649221f9 Christian König   2018-03-19  1244  	/* If the BO is not in its preferred location add it back to
361883649221f9 Christian König   2018-03-19  1245  	 * the evicted list so that it gets validated again on the
361883649221f9 Christian König   2018-03-19  1246  	 * next command submission.
361883649221f9 Christian König   2018-03-19  1247  	 */
26e20235ce0021 Tvrtko Ursulin    2024-05-06  1248  	if (amdgpu_vm_is_bo_always_valid(vm, bo)) {
d3116756a710e3 Christian König   2021-04-12 @1249  		uint32_t mem_type = bo->tbo.resource->mem_type;
806f043f0253a7 Christian König   2018-04-19  1250  
fc39d903eb8055 Christian König   2019-09-13  1251  		if (!(bo->preferred_domains &
fc39d903eb8055 Christian König   2019-09-13  1252  		      amdgpu_mem_type_to_domain(mem_type)))
bcdc9fd634d1f0 Christian König   2018-08-30  1253  			amdgpu_vm_bo_evicted(&bo_va->base);
806f043f0253a7 Christian König   2018-04-19  1254  		else
bcdc9fd634d1f0 Christian König   2018-08-30  1255  			amdgpu_vm_bo_idle(&bo_va->base);
c12a2ee5d002e3 Christian König   2018-09-01  1256  	} else {
bcdc9fd634d1f0 Christian König   2018-08-30  1257  		amdgpu_vm_bo_done(&bo_va->base);
806f043f0253a7 Christian König   2018-04-19  1258  	}
d38ceaf99ed015 Alex Deucher      2015-04-20  1259  
cb7b6ec2f8b875 Christian König   2017-08-15  1260  	list_splice_init(&bo_va->invalids, &bo_va->valids);
cb7b6ec2f8b875 Christian König   2017-08-15  1261  	bo_va->cleared = clear;
30671b44aa570a Christian König   2022-03-30  1262  	bo_va->base.moved = false;
cb7b6ec2f8b875 Christian König   2017-08-15  1263  
cb7b6ec2f8b875 Christian König   2017-08-15  1264  	if (trace_amdgpu_vm_bo_mapping_enabled()) {
cb7b6ec2f8b875 Christian König   2017-08-15  1265  		list_for_each_entry(mapping, &bo_va->valids, list)
cb7b6ec2f8b875 Christian König   2017-08-15  1266  			trace_amdgpu_vm_bo_mapping(mapping);
68c62306b37845 Christian König   2017-07-11  1267  	}
68c62306b37845 Christian König   2017-07-11  1268  
d38ceaf99ed015 Alex Deucher      2015-04-20  1269  	return 0;
d38ceaf99ed015 Alex Deucher      2015-04-20  1270  }
d38ceaf99ed015 Alex Deucher      2015-04-20  1271  

:::::: The code at line 1249 was first introduced by commit
:::::: d3116756a710e3cd51293a9d58b525957ab7e784 drm/ttm: rename bo->mem and make it a pointer

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
