Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0513168BF
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpyqiPDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701629766; x=1733165766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5mAlJhWvxpu5kLE/RdQiFen9IFBhK3ZT6ZIRqmHWQOI=;
  b=DpyqiPDIZw1SjAdirgADFeZFLVaC91JhT+sxsWohiuV1rtzzDUddWuQ6
   pKTXIS4TJb+OC/hzBSFk7zCrDSeuEamZbYqDVTHLnmk+pcZ3/2Oq8Izma
   YStMCzNsAnuJhyoj9pn/Nv0dOtTHt1iOpWvBbEp3tznRXDz3efaMkQjcQ
   NpLzcd/icRtdf3JAhvJox0RHUpgexL6Nu2jI5rNNI6YmsU9qs/gfQxB9l
   y9xMEIq1pBotFkBz6aiZgJ4lxAvmJ9gvDBUssTXRQMvZb++zp2RRE9PhU
   zXWj9FP5SFKhVftI4qgYUnI+ZgaoLuihIcCc4hI6JorUMGqkr6FRiyFBd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="6974212"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="6974212"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 10:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="720096961"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="720096961"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Dec 2023 10:56:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9rdJ-0006yS-1G;
	Sun, 03 Dec 2023 18:56:01 +0000
Date: Mon, 4 Dec 2023 02:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:350
 nvkm_acr_lsfw_load_bl_sig_net() warn: passing zero to 'PTR_ERR'
Message-ID: <202312040111.DB3Pxgcy-lkp@intel.com>
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
CC: Gourav Samaiya <gsamaiya@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: c4bdac754ca0bb21bad598b47dd8c2c86eee1cc1 drm/nouveau/gr/ga102: initial support
date:   1 year, 1 month ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231204/202312040111.DB3Pxgcy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312040111.DB3Pxgcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312040111.DB3Pxgcy-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:350 nvkm_acr_lsfw_load_bl_sig_net() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:265 nvkm_acr_lsfw_load_bl_inst_data_sig() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +350 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c

c4bdac754ca0bb Ben Skeggs 2022-06-01  324  
c4bdac754ca0bb Ben Skeggs 2022-06-01  325  int
c4bdac754ca0bb Ben Skeggs 2022-06-01  326  nvkm_acr_lsfw_load_bl_sig_net(struct nvkm_subdev *subdev,
c4bdac754ca0bb Ben Skeggs 2022-06-01  327  			      struct nvkm_falcon *falcon,
c4bdac754ca0bb Ben Skeggs 2022-06-01  328  			      enum nvkm_acr_lsf_id id,
c4bdac754ca0bb Ben Skeggs 2022-06-01  329  			      const char *path, int ver,
c4bdac754ca0bb Ben Skeggs 2022-06-01  330  			      const struct nvkm_acr_lsf_func *func,
c4bdac754ca0bb Ben Skeggs 2022-06-01  331  			      const void *inst_data, u32 inst_size,
c4bdac754ca0bb Ben Skeggs 2022-06-01  332  			      const void *data_data, u32 data_size)
c4bdac754ca0bb Ben Skeggs 2022-06-01  333  {
c4bdac754ca0bb Ben Skeggs 2022-06-01  334  	struct nvkm_acr *acr = subdev->device->acr;
c4bdac754ca0bb Ben Skeggs 2022-06-01  335  	struct nvkm_acr_lsfw *lsfw;
c4bdac754ca0bb Ben Skeggs 2022-06-01  336  	const struct firmware _inst = { .data = inst_data, .size = inst_size };
c4bdac754ca0bb Ben Skeggs 2022-06-01  337  	const struct firmware _data = { .data = data_data, .size = data_size };
c4bdac754ca0bb Ben Skeggs 2022-06-01  338  	const struct firmware *bl = NULL, *inst = &_inst, *data = &_data;
c4bdac754ca0bb Ben Skeggs 2022-06-01  339  	const struct {
c4bdac754ca0bb Ben Skeggs 2022-06-01  340  	    int bin_magic;
c4bdac754ca0bb Ben Skeggs 2022-06-01  341  	    int bin_version;
c4bdac754ca0bb Ben Skeggs 2022-06-01  342  	    int bin_size;
c4bdac754ca0bb Ben Skeggs 2022-06-01  343  	    int header_offset;
c4bdac754ca0bb Ben Skeggs 2022-06-01  344  	    int header_size;
c4bdac754ca0bb Ben Skeggs 2022-06-01  345  	} *hdr;
c4bdac754ca0bb Ben Skeggs 2022-06-01  346  	u32 *bldata;
c4bdac754ca0bb Ben Skeggs 2022-06-01  347  	int ret;
c4bdac754ca0bb Ben Skeggs 2022-06-01  348  
c4bdac754ca0bb Ben Skeggs 2022-06-01  349  	if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
c4bdac754ca0bb Ben Skeggs 2022-06-01 @350  		return PTR_ERR(lsfw);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
