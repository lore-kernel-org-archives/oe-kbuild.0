Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069FFF9FC
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8aRVkVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701611189; x=1733147189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7hIbL/7Ws6v8QPe/JSRaHok8oq/ZaUT1ahnNkjyGK0=;
  b=l8aRVkVRnMvxHlyeJ180ydG5FnUdjHF3dkwY5hk5/Xfk+/qrnkvwm7Zy
   GxVCDbjsUO5rSmItrKfG0z33W21s7SEuLHDP8BItv49eOHQ2qPTMqO0OX
   oSD2LlQdkyVvtzabvZuPCfRSz+tWVKZbeCFrno+fDIxcwg9tHMxRuAtLq
   MbXzLF/5LR22IXfMvOLaA100ms0T7IURKcY2xGduy86J9ZfWitJLMCOn9
   ba+Lo11ONZQRt2KSCBFpdlnip3nCJ/ZOaOXylVnu42A8s6UwYeF7819KF
   VYes1Qnkgrhvy/hjv/c82Xjbfs+c2GxwKwfPP8eoVEryCOGnw2MBU8rlt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="393381593"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="393381593"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 05:46:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="888254460"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="888254460"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Dec 2023 05:46:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9mni-0006hq-06;
	Sun, 03 Dec 2023 13:46:26 +0000
Date: Sun, 3 Dec 2023 21:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c:263
 gv100_gr_oneinit_sm_id() warn: potentially one past the end of array
 'gpc_tpc_mask[gpc_table[gtpc]]'
Message-ID: <202312032140.sb2aZTLS-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@redhat.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 3ffa6f329b610029b44ebd7bc2320a92468a0e42 drm/nouveau/gr/gv100-: port smid mapping code from nvgpu
date:   1 year, 1 month ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231203/202312032140.sb2aZTLS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312032140.sb2aZTLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312032140.sb2aZTLS-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c:263 gv100_gr_oneinit_sm_id() warn: potentially one past the end of array 'gpc_tpc_mask[gpc_table[gtpc]]'
drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c:263 gv100_gr_oneinit_sm_id() warn: potentially one past the end of array 'gpc_tpc_mask[gpc_table[gtpc]]'

vim +263 drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c

3ffa6f329b6100 Ben Skeggs 2022-06-01  225  
3ffa6f329b6100 Ben Skeggs 2022-06-01  226  int
3ffa6f329b6100 Ben Skeggs 2022-06-01  227  gv100_gr_oneinit_sm_id(struct gf100_gr *gr)
3ffa6f329b6100 Ben Skeggs 2022-06-01  228  {
3ffa6f329b6100 Ben Skeggs 2022-06-01  229  	unsigned long *gpc_tpc_mask;
3ffa6f329b6100 Ben Skeggs 2022-06-01  230  	u32 *tpc_table, *gpc_table;
3ffa6f329b6100 Ben Skeggs 2022-06-01  231  	u32 gpc, tpc, pes, gtpc;
3ffa6f329b6100 Ben Skeggs 2022-06-01  232  	int perf, maxperf, ret = 0;
3ffa6f329b6100 Ben Skeggs 2022-06-01  233  
3ffa6f329b6100 Ben Skeggs 2022-06-01  234  	gpc_tpc_mask = kcalloc(gr->gpc_nr, sizeof(*gpc_tpc_mask), GFP_KERNEL);
3ffa6f329b6100 Ben Skeggs 2022-06-01  235  	gpc_table = kcalloc(gr->tpc_total, sizeof(*gpc_table), GFP_KERNEL);
3ffa6f329b6100 Ben Skeggs 2022-06-01  236  	tpc_table = kcalloc(gr->tpc_total, sizeof(*tpc_table), GFP_KERNEL);
3ffa6f329b6100 Ben Skeggs 2022-06-01  237  	if (!gpc_table || !tpc_table || !gpc_tpc_mask) {
3ffa6f329b6100 Ben Skeggs 2022-06-01  238  		ret = -ENOMEM;
3ffa6f329b6100 Ben Skeggs 2022-06-01  239  		goto done;
3ffa6f329b6100 Ben Skeggs 2022-06-01  240  	}
3ffa6f329b6100 Ben Skeggs 2022-06-01  241  
3ffa6f329b6100 Ben Skeggs 2022-06-01  242  	for (gpc = 0; gpc < gr->gpc_nr; gpc++) {
3ffa6f329b6100 Ben Skeggs 2022-06-01  243  		for (pes = 0; pes < gr->ppc_nr[gpc]; pes++)
3ffa6f329b6100 Ben Skeggs 2022-06-01  244  			gpc_tpc_mask[gpc] |= gr->ppc_tpc_mask[gpc][pes];
3ffa6f329b6100 Ben Skeggs 2022-06-01  245  	}
3ffa6f329b6100 Ben Skeggs 2022-06-01  246  
3ffa6f329b6100 Ben Skeggs 2022-06-01  247  	for (gtpc = 0; gtpc < gr->tpc_total; gtpc++) {
3ffa6f329b6100 Ben Skeggs 2022-06-01  248  		for (maxperf = -1, gpc = 0; gpc < gr->gpc_nr; gpc++) {
3ffa6f329b6100 Ben Skeggs 2022-06-01  249  			for_each_set_bit(tpc, &gpc_tpc_mask[gpc], gr->tpc_nr[gpc]) {
3ffa6f329b6100 Ben Skeggs 2022-06-01  250  				ret = gv100_gr_scg_estimate_perf(gr, gpc_tpc_mask, gpc, tpc, &perf);
3ffa6f329b6100 Ben Skeggs 2022-06-01  251  				if (ret)
3ffa6f329b6100 Ben Skeggs 2022-06-01  252  					goto done;
3ffa6f329b6100 Ben Skeggs 2022-06-01  253  
3ffa6f329b6100 Ben Skeggs 2022-06-01  254  				/* nvgpu does ">=" here, but this gets us RM's numbers. */
3ffa6f329b6100 Ben Skeggs 2022-06-01  255  				if (perf > maxperf) {
3ffa6f329b6100 Ben Skeggs 2022-06-01  256  					maxperf = perf;
3ffa6f329b6100 Ben Skeggs 2022-06-01  257  					gpc_table[gtpc] = gpc;
3ffa6f329b6100 Ben Skeggs 2022-06-01  258  					tpc_table[gtpc] = tpc;
3ffa6f329b6100 Ben Skeggs 2022-06-01  259  				}
3ffa6f329b6100 Ben Skeggs 2022-06-01  260  			}
3ffa6f329b6100 Ben Skeggs 2022-06-01  261  		}
3ffa6f329b6100 Ben Skeggs 2022-06-01  262  
3ffa6f329b6100 Ben Skeggs 2022-06-01 @263  		gpc_tpc_mask[gpc_table[gtpc]] &= ~BIT(tpc_table[gtpc]);
3ffa6f329b6100 Ben Skeggs 2022-06-01  264  	}
3ffa6f329b6100 Ben Skeggs 2022-06-01  265  
3ffa6f329b6100 Ben Skeggs 2022-06-01  266  	/*TODO: build table for sm_per_tpc != 1, don't use yet, but might need later? */
3ffa6f329b6100 Ben Skeggs 2022-06-01  267  	for (gtpc = 0; gtpc < gr->tpc_total; gtpc++) {
3ffa6f329b6100 Ben Skeggs 2022-06-01  268  		gr->sm[gtpc].gpc = gpc_table[gtpc];
3ffa6f329b6100 Ben Skeggs 2022-06-01  269  		gr->sm[gtpc].tpc = tpc_table[gtpc];
3ffa6f329b6100 Ben Skeggs 2022-06-01  270  		gr->sm_nr++;
3ffa6f329b6100 Ben Skeggs 2022-06-01  271  	}
3ffa6f329b6100 Ben Skeggs 2022-06-01  272  
3ffa6f329b6100 Ben Skeggs 2022-06-01  273  done:
3ffa6f329b6100 Ben Skeggs 2022-06-01  274  	kfree(gpc_table);
3ffa6f329b6100 Ben Skeggs 2022-06-01  275  	kfree(tpc_table);
3ffa6f329b6100 Ben Skeggs 2022-06-01  276  	kfree(gpc_tpc_mask);
3ffa6f329b6100 Ben Skeggs 2022-06-01  277  	return ret;
3ffa6f329b6100 Ben Skeggs 2022-06-01  278  }
3ffa6f329b6100 Ben Skeggs 2022-06-01  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
