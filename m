Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DB4A32
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311029; cv=none; b=kXtGAcmQwk7NvbwIzLKxOIAp4+9TfBQnrDo28obehdz31TjNUZnnfGt+f97sCBtcMvqf6IruC+Uen33KS0SS4CgAd1UmiOCphMAl2BmNvFg0Bc5nYO1EjFbSmKjHxeTot58xG30JY6nZjDyrl2rmWwsPMEQUlH6TsD/9y1/V8Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311029; c=relaxed/simple;
	bh=xl/Sug/zBBauz9/K7boTvrp8ITKksDRqr4Ny1HloKuM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MR3jSDtc3FowLGqddlhW42rRqZw82Fih9ZIJPN2oz5EH3XTp/PkMPmZ8y6ey5JDlvPNCibbkZGqD5oTEdKOjAV2NIVLGUwVmj+IatWci7JbvdbleEpzSB0x6nHpoQJlVU48/8nLmpC6O6eK4iekKJZAI5meNj+H/nGCRNDUBBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e07kNe+q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e07kNe+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774311029; x=1805847029;
  h=date:from:to:cc:subject:message-id;
  bh=xl/Sug/zBBauz9/K7boTvrp8ITKksDRqr4Ny1HloKuM=;
  b=e07kNe+qaMyT0kG+hF5K6xtmvh2WKIDaH4zvdnnqcpkGr8q2WF1azQ84
   7IyW0FLvgo73PB/X6GtB0Cwu6Q7iSp0JhuSW/ondgT+UW/r3ziYBvLm/V
   CC3lkCoiKdC6/w2Ot1uwBye6q+Wa06HC+9kL8YvYlMoEpfGhbI8hi2QvE
   T5SarItIjPvhlxOu6rJSzjXont6VAPeu4VuXPBR/fPleSTeuxavq3AWDC
   fO3OHVBafXuOprDAMLiMrBlY+cNA9bD5Bn6BhbDmipLf0Kkv9NPeeCtnF
   P7hx3zRpDcM6Sxg89SoTSbLufXkS6WMG32B4VKj23AziGdJcu7QSIi7fy
   Q==;
X-CSE-ConnectionGUID: btkapC1ITdWOUYJnMVpZXw==
X-CSE-MsgGUID: PbSd6TMqSEa1oEsLt3zuPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75343265"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75343265"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 17:10:28 -0700
X-CSE-ConnectionGUID: 0qg35yM2TJmLOH/SDNnE3Q==
X-CSE-MsgGUID: RfhcKO17QwWjkUIIwYFNyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="225860442"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Mar 2026 17:10:25 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4pLj-000000003QR-0kVa;
	Tue, 24 Mar 2026 00:10:23 +0000
Date: Tue, 24 Mar 2026 08:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c:137
 r535_curs_init() warn: 'args' can also be NULL
Message-ID: <202603240817.wKCjtHNi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ben Skeggs <bskeggs@nvidia.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Timur Tabi <ttabi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: c472d828348cafa7874816f4ad2a2314d0000419 drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/
date:   10 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-r073-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240817.wKCjtHNi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603240817.wKCjtHNi-lkp@intel.com/

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
