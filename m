Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4183C2F1FF6
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 03:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594919; cv=none; b=s5tL8ZlQfQTl5leokJcV3KOoAKnvKgN9+uP5wwj0FyNUVRlKSLkadcyQt6pcNUMljwYZjZvt5IXS6RSiUH2pU/3I9sokwGugfr/AzaUtFlxx9gBRjueM9F0VzLHJTGU2bhooK8VAPtSXjQO3HL8w0vycXpcCPK4xBzxeCI4ZH1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594919; c=relaxed/simple;
	bh=V15P11O6ZJNOiRIbxDS68mGDdCu5vCHys1LbZ8XdJ5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sec0TjWH0U2J/DqEHik900BfCBhaRghUsLzYqVlQQT0Yx0QDiEH88ETFMQbtJEBSGbS1lGmIlOdu1kVYHoiwMR7x1DTnxwQOX14r/Mhngv7JKcza+VS5jywXyQ0kerPIv8pHwGJVjWV7oo+BOO1+B27JA1UfVULUiF/+KLwoh6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlqIFFZ2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlqIFFZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765594917; x=1797130917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V15P11O6ZJNOiRIbxDS68mGDdCu5vCHys1LbZ8XdJ5g=;
  b=dlqIFFZ2GTqoha1SLSsckfiynTuuPDgSg4z5zzVirF4Omg8LivVQVO4X
   xBf9kc8vxvec2rR3sFO15HCPuRHo4ngsDg0yX8VGa+4SJ+Zq4ti+hT4hD
   8PR5cxaE9Dgw5SFYj4WZiNnBpqQ40hI6WB7HXEHdWZZ8/bYmi04uFcA0Y
   eX3n9I6O1EdTC1B1ZXLZjVSakJ+q87dMIllSjaGi6sM4n4Cx+2gfxQ+0V
   7lqJUtzhQhb8sJMMfA51+vYtlQcwVosQOb4O3B3KDd0hPK0UDaB4FXd+q
   41SK6qUzSuXrFUHdub4GU15Anv60PcJpRDsNQwOcMaj3SKff320JBXPbP
   w==;
X-CSE-ConnectionGUID: XkZQV6YaQI2eQh6rCaQykw==
X-CSE-MsgGUID: CgUK0hDyQwG/z+WAJ26l6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85190242"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85190242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:01:54 -0800
X-CSE-ConnectionGUID: mNzWVbbwSUag340ediivpA==
X-CSE-MsgGUID: 3sbcfhs+Ry29+9ouUwOlrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202165879"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 19:01:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFtH-000000006yH-0NFq;
	Sat, 13 Dec 2025 03:01:51 +0000
Date: Sat, 13 Dec 2025 11:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/gr/gv100.c:263
 gv100_gr_oneinit_sm_id() warn: potentially one past the end of array
 'gpc_tpc_mask[gpc_table[gtpc]]'
Message-ID: <202512131046.8YaUKjYQ-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131046.8YaUKjYQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131046.8YaUKjYQ-lkp@intel.com/

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

:::::: The code at line 263 was first introduced by commit
:::::: 3ffa6f329b610029b44ebd7bc2320a92468a0e42 drm/nouveau/gr/gv100-: port smid mapping code from nvgpu

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
