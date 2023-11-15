Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8C73EA68
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/RGrKtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700059328; x=1731595328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pm1bjk2ZEWTn2lPTy4zwZsRV92H+aRAkQg5D2gSZAyk=;
  b=d/RGrKtPvYD3p3lrE6ENzeLErsdD2JLzSuVxyFjgOvWw/aKcd3FMG6Zy
   JI9DhYHEfZH5qVHuM7g5QBR9zVJHZLHI0FcAPa/6XO9XaHyfvLHuqWiMQ
   76tqo+x9amrNZIDtQv1FmQuIMbiNUMw+KJCnw/ohLuj2GeYQ/YphYP3Hl
   /fLC2kE3kcxJca8uU3miDZGUHURDWg7iWXgjC624DAOmy4cuQepzNtLtx
   xwge2/W7c/AViNdwehmsAF+7w5XCBcLjsZuP9hFErqxF0ns+wnw52lL9b
   XzKIpiWfx/zBBB4yauoMu76u25TRwZIC/mFZHsJn6QuCs9LyERpmnFeEl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="371073840"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="371073840"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 06:38:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908797955"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="908797955"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 06:38:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3H2b-0000PR-1k;
	Wed, 15 Nov 2023 14:38:53 +0000
Date: Wed, 15 Nov 2023 22:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:200:25: sparse:
 sparse: self-comparison always evaluates to false
Message-ID: <202311152253.JGwHVfbX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:200:25: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ben Skeggs <bskeggs@redhat.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: e442f1e453143c801b9fb213f514ceabb6c3b746 drm/nouveau/flcn: show falcon user in debug output
date:   1 year ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-122-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152253.JGwHVfbX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152253.JGwHVfbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311152253.JGwHVfbX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c:200:25: sparse: sparse: self-comparison always evaluates to false

vim +200 drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c

bc60c90f472b6e Ilia Mirkin 2017-08-10  195  
2b700825e7a770 Ben Skeggs  2015-08-20  196  	pci->msi = nvkm_boolopt(device->cfgopt, "NvMSI", pci->msi);
2b700825e7a770 Ben Skeggs  2015-08-20  197  	if (pci->msi && func->msi_rearm) {
2b700825e7a770 Ben Skeggs  2015-08-20  198  		pci->msi = pci_enable_msi(pci->pdev) == 0;
2b700825e7a770 Ben Skeggs  2015-08-20  199  		if (pci->msi)
2b700825e7a770 Ben Skeggs  2015-08-20 @200  			nvkm_debug(&pci->subdev, "MSI enabled\n");

:::::: The code at line 200 was first introduced by commit
:::::: 2b700825e7a7702fb862edba1262c98040dc1bf6 drm/nouveau/mc: move device irq handling to platform-specific code

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
