Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08BC6AA0
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jan 2024 03:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lElj5HaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704856782; x=1736392782;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H/5cxQ4aInN5pIOY+cbbofApsx8Ezlc28Bi+GjLBp6I=;
  b=lElj5HaFujptpOjZ1dUyWdkscOCvn0C9uGYvjDY0YSN/XW0MKGiZ6ZK6
   X7RBdz/9sOmGqudXvd3y/uNiD6X499K4t3RM71XAoaXYIRo/qpdL2PUdN
   Abt3TxXhkdEJFLiRXA8E8lnPRNTNQXphmMCERc1XPp53K/3VDfsxVLxAK
   V3fPMmcCCMJNMYHqkqK8UyfXlNSxyeSU2wGUYf9E5n95Ft4UcxG/Eg/zP
   XGDn4U5eYAcoOUuHMXLbViFCC4CkFOVidsC6K9mYVBECWzXXtJxyPvrOA
   Q6qWTdwOQSC1n0niRvMgdskCf/44StwCrYuznD8yTWuN0R//MqT4r+Vr0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5763072"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5763072"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 19:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="16486579"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2024 19:19:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNP7p-0006XE-0S;
	Wed, 10 Jan 2024 03:19:29 +0000
Date: Wed, 10 Jan 2024 11:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/etnaviv/etnaviv_gem.c:444 etnaviv_gem_describe()
 warn: inconsistent returns 'robj'.
Message-ID: <202401101147.cxi30eBD-lkp@intel.com>
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
TO: "Christian König" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab27740f76654ed58dd32ac0ba0031c18a6dea3b
commit: 790f27e0f7c16b162fef29f584d8a85bf9323da5 drm/etnaviv: use dma_resv_describe
date:   2 years, 2 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 years, 2 months ago
config: i386-randconfig-141-20240107 (https://download.01.org/0day-ci/archive/20240110/202401101147.cxi30eBD-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401101147.cxi30eBD-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/etnaviv/etnaviv_gem.c:444 etnaviv_gem_describe() warn: inconsistent returns 'robj'.

vim +/robj +444 drivers/gpu/drm/etnaviv/etnaviv_gem.c

a8c21a5451d831 The etnaviv authors 2015-12-03  425  
a8c21a5451d831 The etnaviv authors 2015-12-03  426  #ifdef CONFIG_DEBUG_FS
a8c21a5451d831 The etnaviv authors 2015-12-03  427  static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
a8c21a5451d831 The etnaviv authors 2015-12-03  428  {
a8c21a5451d831 The etnaviv authors 2015-12-03  429  	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
52791eeec1d9f4 Christian König     2019-08-11  430  	struct dma_resv *robj = obj->resv;
a8c21a5451d831 The etnaviv authors 2015-12-03  431  	unsigned long off = drm_vma_node_start(&obj->vma_node);
790f27e0f7c16b Christian König     2021-09-24  432  	int r;
a8c21a5451d831 The etnaviv authors 2015-12-03  433  
a8c21a5451d831 The etnaviv authors 2015-12-03  434  	seq_printf(m, "%08x: %c %2d (%2d) %08lx %p %zd\n",
a8c21a5451d831 The etnaviv authors 2015-12-03  435  			etnaviv_obj->flags, is_active(etnaviv_obj) ? 'A' : 'I',
2c935bc57221cc Peter Zijlstra      2016-11-14  436  			obj->name, kref_read(&obj->refcount),
a8c21a5451d831 The etnaviv authors 2015-12-03  437  			off, etnaviv_obj->vaddr, obj->size);
a8c21a5451d831 The etnaviv authors 2015-12-03  438  
790f27e0f7c16b Christian König     2021-09-24  439  	r = dma_resv_lock(robj, NULL);
790f27e0f7c16b Christian König     2021-09-24  440  	if (r)
790f27e0f7c16b Christian König     2021-09-24  441  		return;
790f27e0f7c16b Christian König     2021-09-24  442  
790f27e0f7c16b Christian König     2021-09-24  443  	dma_resv_describe(robj, m);
790f27e0f7c16b Christian König     2021-09-24 @444  	dma_resv_unlock(robj);
a8c21a5451d831 The etnaviv authors 2015-12-03  445  }
a8c21a5451d831 The etnaviv authors 2015-12-03  446  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
