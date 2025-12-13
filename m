Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A5B256C71
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765622734; cv=none; b=QTmWEqwhh+vcyqqZAuTb7yFDyKxY1cjWedGk+hqqXRejdvJyq9teproSMFlPL3WsC7XyK8m+IZtg29UTq3uP+Gz8u43ys8xKwmsJG/gm3QV8Tek9ptQvcP9p5iW021DRoBMUdQJF+Gq9j0sybq+0tm6LCQSDm2NeNwNuoQL8dZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765622734; c=relaxed/simple;
	bh=rFCsmMlP/JSB4qPrjBLmeUxam0LtcU/7ZB+32rLWBvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2gOTnkMMZfprGuRWd1NenvMq7bKoCDlm2vt2sgKi5AkaQbkP6fHc5AYHvpbDwLnyF1d4DPBqnczBjuj1QU1khCyjks3W7J07wSRCWK43k6QMXrSFmH3PmWAKeX+Qc1ulPBBsMK/ulrogUwGp0BL++idiEtBF7Dk7jJmysckB2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZstxJQdU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZstxJQdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765622733; x=1797158733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rFCsmMlP/JSB4qPrjBLmeUxam0LtcU/7ZB+32rLWBvM=;
  b=ZstxJQdUtj2F34DaxjEmCB4kJKFRULBZcaCBHnn2iE31ZclO5oW/+ea9
   oLxuLAvfrrEcBxIyIMp3XUJeIEnm23U8yaGkAl415O15RdWpTbUpxCBHm
   UbyfGiSg3OVh7QSZ5B1NzLZCsHa6wqWsgvXlk+QTRiKXXMmZQJrQ5UzId
   tY3/R+2r136jRwn4Fc97PsP6N5wiWWDTwJGz+Q0gDSB0i+wInfydpogrT
   K9GkZGyp+qfnewKy5SaBwyvhYbUxF4MMj++ClApG6cu7KYnw0c8OSg7Sn
   FtmyJVeQLJTimbFNRvSGEqofSNm7YZJk98qRbU8ZmzL+K1KJ7SQLqYSA1
   Q==;
X-CSE-ConnectionGUID: /IL1TX25S0qxvOk7bPBSzA==
X-CSE-MsgGUID: fO81HKomTWiwMIPF0mUbMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85201350"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85201350"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 02:45:32 -0800
X-CSE-ConnectionGUID: fiLwL9HjTWyi0+R6RxcjXQ==
X-CSE-MsgGUID: LlrYKeKNRVeZ8JoOiOgUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196911084"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 02:45:30 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUN7w-000000007Vv-3dV1;
	Sat, 13 Dec 2025 10:45:28 +0000
Date: Sat, 13 Dec 2025 18:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c:36
 r535_nvenc_alloc() warn: 'args' can also be NULL
Message-ID: <202512131852.ME0Ssx3l-lkp@intel.com>
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
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 7c2d25f1e408bb7d18b867718f9961de3c2f23da drm/nouveau/gsp: add common code for engines/engine objects
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: microblaze-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131852.ME0Ssx3l-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131852.ME0Ssx3l-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c:36 r535_nvenc_alloc() warn: 'args' can also be NULL

vim +/args +36 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c

08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  25  
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  26  static int
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  27  r535_nvenc_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  28  		 struct nvkm_gsp_object *nvenc)
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  29  {
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  30  	NV_MSENC_ALLOCATION_PARAMETERS *args;
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  31  
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  32  	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), nvenc);
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  33  	if (WARN_ON(IS_ERR(args)))
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  34  		return PTR_ERR(args);
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  35  
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19 @36  	args->size = sizeof(*args);
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  37  	args->engineInstance = inst;
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  38  
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c Ben Skeggs 2025-02-15  39  	return nvkm_gsp_rm_alloc_wr(nvenc, args);
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  40  }
08ab88f5a033c6 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c        Ben Skeggs 2023-09-19  41  

:::::: The code at line 36 was first introduced by commit
:::::: 08ab88f5a033c67625272eda99de4d245809e0f6 drm/nouveau/nvenc/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
