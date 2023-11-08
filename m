Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AAC7EF
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 02:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiwatEaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699409378; x=1730945378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sFr6jThMh+FeX0msL4Z6XoVnpbm0FC2KPqe7HyZ54gE=;
  b=WiwatEaDmvE4WXuD7ojzoc096nkN3SWG77t8ndoyybXVIJyOLZGUCaQD
   TavAiNTLQTly06u/LxYYu/PegXsVOyMgqNR8GufP4a5WjYWr0qc0N+vHZ
   Le4EvCXkiPzjGkM0jp5GxxL/tbpp+dn/zJJh/OanSRQpGqtZ5XUOcpt13
   cQjDgYE06xaJy96pOMLmR7qBU93qlT45v83vBMCJSSBiE5NMmQcPvG97D
   kEl9OhcYShNAcFTd1Bl1JzrTFCOPoCgdKcF1NPwbuaCFE2vRLtJ7kLj5b
   Yhv5dyY0VcEfGfoHdF5ZAUmCb7fcP+lZOfy5ZPo2ludkHoSQOS1VdC5io
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="380072748"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="380072748"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 18:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="756399707"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="756399707"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Nov 2023 18:09:36 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Y0b-0007Z2-2m;
	Wed, 08 Nov 2023 02:09:33 +0000
Date: Wed, 8 Nov 2023 10:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:42
 nvkm_uoutp_mthd_infoframe() error: we previously assumed 'ior->func->hdmi'
 could be null (see line 40)
Message-ID: <202311081018.01WpP58y-lkp@intel.com>
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
head:   13d88ac54ddd1011b6e94443958e798aa06eb835
commit: f530bc60a30bee47ff51b7fb71511fdd058b774a drm/nouveau/disp: move HDMI config into acquire + infoframe methods
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231108/202311081018.01WpP58y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311081018.01WpP58y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311081018.01WpP58y-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:42 nvkm_uoutp_mthd_infoframe() error: we previously assumed 'ior->func->hdmi' could be null (see line 40)

vim +42 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c

1b255f1ccc8832 Ben Skeggs 2022-06-01  28  
f530bc60a30bee Ben Skeggs 2022-06-01  29  static int
f530bc60a30bee Ben Skeggs 2022-06-01  30  nvkm_uoutp_mthd_infoframe(struct nvkm_outp *outp, void *argv, u32 argc)
f530bc60a30bee Ben Skeggs 2022-06-01  31  {
f530bc60a30bee Ben Skeggs 2022-06-01  32  	struct nvkm_ior *ior = outp->ior;
f530bc60a30bee Ben Skeggs 2022-06-01  33  	union nvif_outp_infoframe_args *args = argv;
f530bc60a30bee Ben Skeggs 2022-06-01  34  
f530bc60a30bee Ben Skeggs 2022-06-01  35  	if (argc < sizeof(args->v0) || args->v0.version != 0)
f530bc60a30bee Ben Skeggs 2022-06-01  36  		return -ENOSYS;
f530bc60a30bee Ben Skeggs 2022-06-01  37  	if (!nvkm_head_find(outp->disp, args->v0.head))
f530bc60a30bee Ben Skeggs 2022-06-01  38  		return -EINVAL;
f530bc60a30bee Ben Skeggs 2022-06-01  39  
f530bc60a30bee Ben Skeggs 2022-06-01 @40  	switch (ior->func->hdmi ? args->v0.type : 0xff) {
f530bc60a30bee Ben Skeggs 2022-06-01  41  	case NVIF_OUTP_INFOFRAME_V0_AVI:
f530bc60a30bee Ben Skeggs 2022-06-01 @42  		ior->func->hdmi->infoframe_avi(ior, args->v0.head, argv, argc);
f530bc60a30bee Ben Skeggs 2022-06-01  43  		return 0;
f530bc60a30bee Ben Skeggs 2022-06-01  44  	case NVIF_OUTP_INFOFRAME_V0_VSI:
f530bc60a30bee Ben Skeggs 2022-06-01  45  		ior->func->hdmi->infoframe_vsi(ior, args->v0.head, argv, argc);
f530bc60a30bee Ben Skeggs 2022-06-01  46  		return 0;
f530bc60a30bee Ben Skeggs 2022-06-01  47  	default:
f530bc60a30bee Ben Skeggs 2022-06-01  48  		break;
f530bc60a30bee Ben Skeggs 2022-06-01  49  	}
f530bc60a30bee Ben Skeggs 2022-06-01  50  
f530bc60a30bee Ben Skeggs 2022-06-01  51  	return -EINVAL;
f530bc60a30bee Ben Skeggs 2022-06-01  52  }
f530bc60a30bee Ben Skeggs 2022-06-01  53  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
