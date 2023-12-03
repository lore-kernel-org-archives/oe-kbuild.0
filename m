Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098E19465
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 23:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUZXWUGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701645081; x=1733181081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9vpH4Y8Snq+3QqC3bXlvzRmBJNnMunsZm8UNZSz6hXI=;
  b=ZUZXWUGFO2d3bZf5QSj6Uel8cP/ESLh3W1ou+4nlYo825KmCv7DOAs7h
   5ne3AWSc0K025UmkCwR3dcUX/tI0dC9xEgcss7MguUAP5LkU1nJgGIq9F
   Ts6S14j7pv/FjJdQYOGtGERxoD8WInNy0qN1GfdBTOCHVxz2m6E+3jw8F
   XwKNo7pQONRlEGqFtlJcOhpJykIunTIO7HCT0P17MhmhNyfbibEg/YxHw
   2gpsEsrxP1qM4F1oaYdrdd7wFVnYZWMwpJ5Xhj3zrjvfdLUwX/LIA8fwB
   LhPCIr8tMiW+UXEibWdfDV4UO+sdDj/OmRRuFVfyHj3/V5pLRISSYOzmU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="378697875"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="378697875"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 15:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="1101908226"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="1101908226"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Dec 2023 15:11:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9vcK-0007Ce-2h;
	Sun, 03 Dec 2023 23:11:16 +0000
Date: Mon, 4 Dec 2023 07:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvif/vmm.c:222 nvif_vmm_ctor() warn:
 possible memory leak of 'args'
Message-ID: <202312040659.4pJpMafN-lkp@intel.com>
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
TO: Danilo Krummrich <dakr@redhat.com>
CC: Dave Airlie <airlied@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 6b252cf42281045a9f803d2198023500cfa6ebd2 drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231204/202312040659.4pJpMafN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312040659.4pJpMafN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312040659.4pJpMafN-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvif/vmm.c:222 nvif_vmm_ctor() warn: possible memory leak of 'args'

vim +/args +222 drivers/gpu/drm/nouveau/nvif/vmm.c

920d2b5ef2157e Ben Skeggs       2017-11-01  197  
920d2b5ef2157e Ben Skeggs       2017-11-01  198  int
6b252cf4228104 Danilo Krummrich 2023-08-04  199  nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass,
6b252cf4228104 Danilo Krummrich 2023-08-04  200  	      enum nvif_vmm_type type, u64 addr, u64 size, void *argv, u32 argc,
6b252cf4228104 Danilo Krummrich 2023-08-04  201  	      struct nvif_vmm *vmm)
920d2b5ef2157e Ben Skeggs       2017-11-01  202  {
920d2b5ef2157e Ben Skeggs       2017-11-01  203  	struct nvif_vmm_v0 *args;
920d2b5ef2157e Ben Skeggs       2017-11-01  204  	u32 argn = sizeof(*args) + argc;
920d2b5ef2157e Ben Skeggs       2017-11-01  205  	int ret = -ENOSYS, i;
920d2b5ef2157e Ben Skeggs       2017-11-01  206  
920d2b5ef2157e Ben Skeggs       2017-11-01  207  	vmm->object.client = NULL;
920d2b5ef2157e Ben Skeggs       2017-11-01  208  	vmm->page = NULL;
920d2b5ef2157e Ben Skeggs       2017-11-01  209  
920d2b5ef2157e Ben Skeggs       2017-11-01  210  	if (!(args = kmalloc(argn, GFP_KERNEL)))
920d2b5ef2157e Ben Skeggs       2017-11-01  211  		return -ENOMEM;
920d2b5ef2157e Ben Skeggs       2017-11-01  212  	args->version = 0;
920d2b5ef2157e Ben Skeggs       2017-11-01  213  	args->addr = addr;
920d2b5ef2157e Ben Skeggs       2017-11-01  214  	args->size = size;
6b252cf4228104 Danilo Krummrich 2023-08-04  215  
6b252cf4228104 Danilo Krummrich 2023-08-04  216  	switch (type) {
6b252cf4228104 Danilo Krummrich 2023-08-04  217  	case UNMANAGED: args->type = NVIF_VMM_V0_TYPE_UNMANAGED; break;
6b252cf4228104 Danilo Krummrich 2023-08-04  218  	case MANAGED: args->type = NVIF_VMM_V0_TYPE_MANAGED; break;
6b252cf4228104 Danilo Krummrich 2023-08-04  219  	case RAW: args->type = NVIF_VMM_V0_TYPE_RAW; break;
6b252cf4228104 Danilo Krummrich 2023-08-04  220  	default:
6b252cf4228104 Danilo Krummrich 2023-08-04  221  		WARN_ON(1);
6b252cf4228104 Danilo Krummrich 2023-08-04 @222  		return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
