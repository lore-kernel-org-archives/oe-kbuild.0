Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA3C39FF8
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/JUs0wE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700063361; x=1731599361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gQxv4nNp+ONnZf2G2VjiWrryKv+XrBqX9Of52vSPR0=;
  b=I/JUs0wECpXVn4AIEm13uoIwFj06YETmoCd6EcYQYLV9zGfaGHPGF0j9
   B3AxuwdXlCbSZmgaZa3VHWpg0oHJFgR+ISxgeXhvCq7yo5q4Bg/XcPdf7
   lDoId7HJhpuHJeGw6U658o5ps/Fsrfr2oQseOeG4HRBUt310JSOL6cFpb
   lIfKo2La65qUXcurUYdUrlqOm0PmIXKpe9pt5DAZNJL5NuwoI42C5Zdwi
   ypy53cgUV/YVZRgwtDG/2eE9u5AUzGAxGKnmUHZTvWqSVUwc5ecRuDR5n
   fFuPzBUfaHEeiVJjoU9LfoUAWdH6rvKkw/c6w2aocq/72b1Y1SDUGUm/S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477119014"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="477119014"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 07:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="741469037"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="741469037"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Nov 2023 07:49:18 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3I8i-0000US-1g;
	Wed, 15 Nov 2023 15:49:16 +0000
Date: Wed, 15 Nov 2023 23:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:371
 r535_gsp_rpc_get() warn: 'rpc' is an error pointer or valid
Message-ID: <202311152329.kUuuuWeR-lkp@intel.com>
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
CC: Dave Airlie <airlied@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 176fdcbddfd288408ce8571c1760ad618d962096 drm/nouveau/gsp/r535: add support for booting GSP-RM
date:   2 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152329.kUuuuWeR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311152329.kUuuuWeR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311152329.kUuuuWeR-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:371 r535_gsp_rpc_get() warn: 'rpc' is an error pointer or valid

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:374 r535_gsp_rpc_get() error: 'rpc' dereferencing possible ERR_PTR()
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1206 nvkm_gsp_radix3_sg() error: uninitialized symbol 'addr'.

vim +/rpc +371 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

176fdcbddfd288 Ben Skeggs 2023-09-19  364  
176fdcbddfd288 Ben Skeggs 2023-09-19  365  static void *
176fdcbddfd288 Ben Skeggs 2023-09-19  366  r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
176fdcbddfd288 Ben Skeggs 2023-09-19  367  {
176fdcbddfd288 Ben Skeggs 2023-09-19  368  	struct nvfw_gsp_rpc *rpc;
176fdcbddfd288 Ben Skeggs 2023-09-19  369  
176fdcbddfd288 Ben Skeggs 2023-09-19  370  	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + argc, sizeof(u64)));
176fdcbddfd288 Ben Skeggs 2023-09-19 @371  	if (!rpc)
176fdcbddfd288 Ben Skeggs 2023-09-19  372  		return NULL;
176fdcbddfd288 Ben Skeggs 2023-09-19  373  
176fdcbddfd288 Ben Skeggs 2023-09-19  374  	rpc->header_version = 0x03000000;
176fdcbddfd288 Ben Skeggs 2023-09-19  375  	rpc->signature = ('V' << 24) | ('R' << 16) | ('P' << 8) | 'C';
176fdcbddfd288 Ben Skeggs 2023-09-19  376  	rpc->function = fn;
176fdcbddfd288 Ben Skeggs 2023-09-19  377  	rpc->rpc_result = 0xffffffff;
176fdcbddfd288 Ben Skeggs 2023-09-19  378  	rpc->rpc_result_private = 0xffffffff;
176fdcbddfd288 Ben Skeggs 2023-09-19  379  	rpc->length = sizeof(*rpc) + argc;
176fdcbddfd288 Ben Skeggs 2023-09-19  380  	return rpc->data;
176fdcbddfd288 Ben Skeggs 2023-09-19  381  }
176fdcbddfd288 Ben Skeggs 2023-09-19  382  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
