Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70518DB35
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 05:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765602909; cv=none; b=IMRxwvk7C6baUdtaAfChb0ZVvosMBco1aF9e8QAiRlVT8gYRUumFc6Hsx0ohUX5dZ9wTomfozA9u3PTSrq48T/GlagRhDSqPiiKMLkYWDMKPK/dKiyjagH0z9t+nhi/vvzbvKFToKmnNfdEy+Gt3WXKEoChYupKTWYJB/Oh63rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765602909; c=relaxed/simple;
	bh=x3J8aAK+ByBq/aLrRNLXeBUs1BX8Zza0oeblcZXWYBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KeSzxYXutrnoHkmbUwXnhZDtAYH8P/i+XbziDqYKEYFH7ev34usgt1AYOOWHe66MIcy1ag6PLGQEIAEDiVy4A5f5Eo2/FAOMJ3vTjg70S+X906qLHVnJw8LV7wrY2LEIDPmLPpvtKrTEeE+R3g5/JaDolm2FnGYgFTaAlSe99G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUMZEKeh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUMZEKeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765602907; x=1797138907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3J8aAK+ByBq/aLrRNLXeBUs1BX8Zza0oeblcZXWYBo=;
  b=jUMZEKehqaRsNGpj07vQbgYJ1ZfFOataQPXvH0q5SSQC2JxZsiEyvVFl
   7kjfNyKlOm0XLvIQMnoSYzI05eNjBWUd9jyWuG/EG7WKfTv3hvreODWB7
   oBUcoW2ujam59R+wT1vjfN3sckxFh3QRSAdR6QYR2hPIWa3TpLVCZ5jpQ
   ZUNKLqO5FD4V3CJrpMbUrQDzQC7X1lQiCZoSUfZpyToKmdQaN1fYO9IB1
   8jeDul7I74q1tSlwcOVPEuipyfbdsOLUFzhDJ/ynVyplnRowjuOYjfBCI
   OG2mh6WXLnkYXwUnCza0kfPZpMh1Xdi3W3zFERa5kwve5jkg+FsXZWbjI
   Q==;
X-CSE-ConnectionGUID: /9VkRf5qQe+NCDn1XZVvzA==
X-CSE-MsgGUID: fPKEMW/uSba3k0clntK4uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78971156"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78971156"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:15:07 -0800
X-CSE-ConnectionGUID: /+ct51C+TimbLq1Hi2DCAg==
X-CSE-MsgGUID: 9Xp9KE3GTRag63Qbtmj9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197319967"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 21:15:06 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUHy7-0000000075l-1dnA;
	Sat, 13 Dec 2025 05:14:59 +0000
Date: Sat, 13 Dec 2025 13:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c:36
 r535_nvdec_alloc() warn: 'args' can also be NULL
Message-ID: <202512131328.d4qr2JDT-lkp@intel.com>
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
head:   9551a26f17d9445eed497bd7c639d48dfc3c0af4
commit: 7c2d25f1e408bb7d18b867718f9961de3c2f23da drm/nouveau/gsp: add common code for engines/engine objects
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131328.d4qr2JDT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131328.d4qr2JDT-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c:36 r535_nvdec_alloc() warn: 'args' can also be NULL

vim +/args +36 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c

142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  25  
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  26  static int
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  27  r535_nvdec_alloc(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  28  		 struct nvkm_gsp_object *nvdec)
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  29  {
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  30  	NV_BSP_ALLOCATION_PARAMETERS *args;
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  31  
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  32  	args = nvkm_gsp_rm_alloc_get(chan, handle, class, sizeof(*args), nvdec);
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  33  	if (WARN_ON(IS_ERR(args)))
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  34  		return PTR_ERR(args);
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  35  
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19 @36  	args->size = sizeof(*args);
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  37  	args->engineInstance = inst;
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  38  
7c2d25f1e408bb drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c Ben Skeggs 2025-02-15  39  	return nvkm_gsp_rm_alloc_wr(nvdec, args);
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  40  }
142cd60243cac1 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c        Ben Skeggs 2023-09-19  41  

:::::: The code at line 36 was first introduced by commit
:::::: 142cd60243cac1dfa18d3714ed4dd0cdc3786180 drm/nouveau/nvdec/r535: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
