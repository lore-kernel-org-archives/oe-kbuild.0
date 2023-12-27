Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD66446A9
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Dec 2023 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVivGrdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703676701; x=1735212701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1DxScCN5srqahWF+Qmu5ld5b6BLB7vsnWT61qhKqKt8=;
  b=aVivGrdnwhlSk8f44ysbDzd4uD3S3SErw0oGM3tejXOgjnuwp4GTkCFF
   jeRawz5YUqQs6+FtK5T1sRjMVSIrL7HtWRUN6vDfEwWk0KyAmctoBdtlR
   SQVuMhPBoSHUbUeiG/baDIJnojPRTfqF9DX10wn106HpWdgYxpXz7uUBz
   p3ina4jYlRX5IYoGpfFFCS3IN9tLEqanS/sa27rhnVw2ocmWwhPN5fCPu
   YL2iOg0OI9uMKWVkMCTEi76cHY/xNkrt4pmM4/1fqDw3QPYRzLdkxJwnR
   njRXih2iF440tetPmKend9jGaLhM14TfTCENVqNJowEBp/P+Kh5Jh08gt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="3269772"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="3269772"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 03:31:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="901659233"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="901659233"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Dec 2023 03:31:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIS8M-000FKt-1i;
	Wed, 27 Dec 2023 11:31:34 +0000
Date: Wed, 27 Dec 2023 19:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
Message-ID: <202312271917.55xuDMdc-lkp@intel.com>
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
In-Reply-To: <20231222043308.3090089-9-airlied@gmail.com>
References: <20231222043308.3090089-9-airlied@gmail.com>
TO: Dave Airlie <airlied@gmail.com>
TO: dri-devel@lists.freedesktop.org
TO: nouveau@lists.freedesktop.org

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc7 next-20231220]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-gsp-drop-some-acpi-related-debug/20231222-180432
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231222043308.3090089-9-airlied%40gmail.com
patch subject: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231227/202312271917.55xuDMdc-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312271917.55xuDMdc-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:659 r535_gsp_rpc_rm_ctrl_push() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1063 r535_dp_aux_xfer() warn: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1887 nvkm_gsp_radix3_sg() error: uninitialized symbol 'addr'.

vim +/PTR_ERR +659 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  648  
af265ee961627a Dave Airlie 2023-12-22  649  static int
af265ee961627a Dave Airlie 2023-12-22  650  r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32 repc)
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  651  {
af265ee961627a Dave Airlie 2023-12-22  652  	rpc_gsp_rm_control_v03_00 *rpc = container_of((*argv), typeof(*rpc), params);
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  653  	struct nvkm_gsp *gsp = object->client->gsp;
af265ee961627a Dave Airlie 2023-12-22  654  	int ret = 0;
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  655  
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  656  	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
af265ee961627a Dave Airlie 2023-12-22  657  	if (IS_ERR_OR_NULL(rpc)) {
af265ee961627a Dave Airlie 2023-12-22  658  		*argv = NULL;
af265ee961627a Dave Airlie 2023-12-22 @659  		return PTR_ERR(rpc);
af265ee961627a Dave Airlie 2023-12-22  660  	}
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  661  
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  662  	if (rpc->status) {
af265ee961627a Dave Airlie 2023-12-22  663  		ret = r535_rpc_status_to_errno(rpc->status);
555bb9c29a45be Dave Airlie 2023-12-22  664  		if (ret != -EAGAIN)
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  665  			nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  666  				   object->client->object.handle, object->handle, rpc->cmd, rpc->status);
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  667  	}
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  668  
af265ee961627a Dave Airlie 2023-12-22  669  	if (repc)
af265ee961627a Dave Airlie 2023-12-22  670  		*argv = rpc->params;
af265ee961627a Dave Airlie 2023-12-22  671  	else
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  672  		nvkm_gsp_rpc_done(gsp, rpc);
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  673  
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  674  	return ret;
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  675  }
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  676  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
