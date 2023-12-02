Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BEB1864
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Dec 2023 01:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZHDybXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701481349; x=1733017349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iAwF5w+0Ky7VJm21UE34gRAQUIKJPo43v/LVfQ4p338=;
  b=DZHDybXMc8qGc8y8TkKgT323QU0ckwkb9mDwkhfDYrQyKWp6SdoIJ1Hm
   FlEk8d9+neIt5JXmQi5r+MJG0nDowM+Fm/48W31Kw8ywQgA/6B5ir/BnJ
   ZXrsXC3nJBTI5Wwtnc+Gyd+Hh7cOrsBtj0359mHT+T192H2HF5Gyao/Yx
   VS9WR47ZLJ34PiQ80swgzFKV024vkjclxQcPM/eSC3HcAMz4Ur0EIJ3Wq
   YVcDTrjStzBbTIJp1UN19uMr7PD1GHA5hezy/4GvOhVhbHAC8YvIednqR
   Vcgbsh3beIJ5my0OAprBVvdCHRJ5GzYTePbIKyTXUfRF7u4uE4bnyNxvk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="397459083"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="397459083"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 17:42:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="17951307"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Dec 2023 17:42:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9F1U-0004Wa-2p;
	Sat, 02 Dec 2023 01:42:24 +0000
Date: Sat, 2 Dec 2023 09:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c:42
 nvkm_uoutp_mthd_infoframe() error: we previously assumed 'ior->func->hdmi'
 could be null (see line 40)
Message-ID: <202312020946.qRQSQ5ji-lkp@intel.com>
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
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: f530bc60a30bee47ff51b7fb71511fdd058b774a drm/nouveau/disp: move HDMI config into acquire + infoframe methods
date:   1 year, 1 month ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231202/202312020946.qRQSQ5ji-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020946.qRQSQ5ji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312020946.qRQSQ5ji-lkp@intel.com/

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
