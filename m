Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B75C21CC62
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 03:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765596898; cv=none; b=Jy3sFMPZLk15FKfNnHYBEnf1GerdI2mZZ4vo7/x7jEGSpxpfMY33+cvY37CX4ul2ze+n7zXCEv14d7s2R+B3h+mfVeFWT7y9By7eibpG0y91zAwf3F7UA9iUVrnzFTmjfbhWemTnAXf+fOMUi+UV6U+QERywSLMUOCubESuVpwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765596898; c=relaxed/simple;
	bh=Rsl4SbJwJxjpmoKtrDJTb0RyFwJNLI9Ih9yReYW9uRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iG9wzPDFXZ/mRtiuX5RxpxNyNWeCAZjBo/A2pg12VpRje3+EeblRCnKQMN1AxxLHq1WK3IWvlOmuGucbNeZKh6HvWLXOvKQslvDiDRl1fiFwEWM6Zy+EqINVvC6MSkbWOQhoCHOY1zEe+qhw7HGKxBgL9Mk7o/gOG4VZ3Yr8g60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3Mf+sm8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3Mf+sm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765596896; x=1797132896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rsl4SbJwJxjpmoKtrDJTb0RyFwJNLI9Ih9yReYW9uRs=;
  b=S3Mf+sm8BaSwgBj2ZdA7pnZH49S6fov6YFA6fcoy+1gxuehq5KHJDPp6
   xfC9EVfAdR+7aIUmBaa9RAWWhg/x9EUbMym6klLeGxQburmCsp4/ZeqZj
   fMm2inqg5LlnZh0gwPahgEK/H5ictXW4/ef2Xb25y2TW8/nfH4XB4tP8i
   XW4JLZ4LaXmu85b9edEJNjd5GWGCMVysxybDVEQcXyh4wH+m82tmcYUW7
   j4FQmVY98OYQYKcltGciDJVKEx6jzcI5pKZSabKS4IXvY+/e0NhA6dbgH
   naWEcNYAKuDC85nOMLmWpMmaQCl5J2cCCZOXIM6blO1cqe3EOvBxNjBmb
   Q==;
X-CSE-ConnectionGUID: 59igMNMmTsqKb88BP3ElEQ==
X-CSE-MsgGUID: iUdYPFQKQEuq+0sWZBNilw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78235811"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78235811"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:34:55 -0800
X-CSE-ConnectionGUID: ygsdU0TJSMi/MkpA6HEfKw==
X-CSE-MsgGUID: ZkbFbCjLTjuh4nHwKx8iuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196315674"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 19:34:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGPE-000000006zs-1ToZ;
	Sat, 13 Dec 2025 03:34:52 +0000
Date: Sat, 13 Dec 2025 11:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:137
 r535_curs_init() warn: 'args' can also be NULL
Message-ID: <202512131146.hqfFHz0t-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@nvidia.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Timur Tabi <ttabi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: c472d828348cafa7874816f4ad2a2314d0000419 drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131146.hqfFHz0t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131146.hqfFHz0t-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:137 r535_curs_init() warn: 'args' can also be NULL

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:190 r535_dmac_init() warn: 'args' can also be NULL

vim +/args +137 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c

9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  120  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  121  static int
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  122  r535_curs_init(struct nvkm_disp_chan *chan)
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  123  {
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  124  	NV50VAIO_CHANNELPIO_ALLOCATION_PARAMETERS *args;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  125  	int ret;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  126  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  127  	ret = r535_chan_push(chan);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  128  	if (ret)
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  129  		return ret;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  130  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  131  	args = nvkm_gsp_rm_alloc_get(&chan->disp->rm.object,
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  132  				     (chan->object.oclass << 16) | chan->head,
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  133  				     chan->object.oclass, sizeof(*args), &chan->rm.object);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  134  	if (IS_ERR(args))
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  135  		return PTR_ERR(args);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  136  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19 @137  	args->channelInstance = chan->head;
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  138  
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  139  	return nvkm_gsp_rm_alloc_wr(&chan->rm.object, args);
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  140  }
9e99444490238d drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c Ben Skeggs 2023-09-19  141  

:::::: The code at line 137 was first introduced by commit
:::::: 9e99444490238d210a421cef3598432c5da2e086 drm/nouveau/disp/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
