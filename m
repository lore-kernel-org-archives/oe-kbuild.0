Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED7642
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 06:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkTDAh1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699253318; x=1730789318;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=maXi1lFmhHDMzWHl72C8msdOUClMXjGoUYVUO20CNRs=;
  b=NkTDAh1HKve2JoBV6Gguzk6OUg1DR+2wb5jH45uR3Av+FJQh3jcCr+K9
   2B0QOdH8Za9L0NYzLP8jL/7RuQZlM3KXmqJJ7KtfWBWkHdAs3ICt7AZ79
   pCgFt8N/vBHRee8O17I0MD48UhctY2ulFQW605lKsHPXGSU1wOsUcsLsX
   B3MYa4gtWTgaSzioX3Xf9oHPLyx0aP3ojaY0bq80sMpKUjXrU2CuID9x0
   OdwqVN6DfQ/ft3YbgJhHsTSaKBVA6hYeYH/mvVYfzQkXwqiM9yNFThg+a
   ZdEFH+4YvImoQW3X4pag0BOW37s/MSEw/+OfvMHzaxp/JayVvffzNETMq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420331903"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="420331903"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 22:48:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="10361543"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2023 22:48:36 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qztPV-0006Cm-2u;
	Mon, 06 Nov 2023 06:48:33 +0000
Date: Mon, 6 Nov 2023 14:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/etnaviv/etnaviv_gem.c:444 etnaviv_gem_describe()
 warn: inconsistent returns 'robj'.
Message-ID: <202311061427.h9Nrt83E-lkp@intel.com>
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
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 790f27e0f7c16b162fef29f584d8a85bf9323da5 drm/etnaviv: use dma_resv_describe
date:   2 years ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 years ago
config: x86_64-randconfig-161-20231103 (https://download.01.org/0day-ci/archive/20231106/202311061427.h9Nrt83E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061427.h9Nrt83E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061427.h9Nrt83E-lkp@intel.com/

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
