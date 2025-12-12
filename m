Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEF33101D4
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571314; cv=none; b=b2XcEv494El9m9Ov8A7GliMf8MVtAwBaOPof95p7lxyJl+B58BCVdSuTETiNru3H/IRjJHuy73rqdJwSg+2lhcHBnQlrZB/MDKDVYNgS8vm4leJ+bkDsLT4l+a9kfM8eVDzUG7+8pJ3wq+UFPAOKNz6yu6CL7KBaIFP/j/06p+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571314; c=relaxed/simple;
	bh=zsnJZlUqG/nxntWboWyamIfu03YRSzyj5AFXdeBeoDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SpP9evtsEa28D3zZ1AhLPyBcDP9VZXrLqZ+CK2dSSeZxRVKX4VRjXw83DgyiOvwpACfl0nMf7gQL1o1ru0yfL/jd8/sTmo2/IWi4XjqmmweNdYwzE2zwoMP/mqh1ergFQjU1O0eEUKMv10fVtmppHYTMosGc3jQvg7ZSabFUjP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdZmpRCu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdZmpRCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765571313; x=1797107313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zsnJZlUqG/nxntWboWyamIfu03YRSzyj5AFXdeBeoDo=;
  b=WdZmpRCuiS8nk23X+jSRF89wR7D4Z5x+PgxPVbYrCSZ1+hI9s3xaY0/8
   KNPsxRNNZHHYxCcUNjaOp5fZXMsnaXtY+oVwgX9b3tNF1vBJQ97qOf9E3
   3Ul0Z2Pji2uKIveU0w4FE/eAnkZie7ZuIpuZGSYNrHuiN0FTUIRea0CUQ
   1BiQTdCSLOFLTKYRN1JKbiw4WYjswCk4Mh8yNwhchVHrDlrXTaGI/23ly
   ypuVOWU0Q8dpudeTjFxSnJI8U8w1yM+t9zZUbUzmyl9YZwDvKpKNHHXUd
   PC84PaOzdHeKCBj75pz4mVgo3mYpkE+8xUeDnibiFXdg6AGkEF4NTtFEX
   g==;
X-CSE-ConnectionGUID: LTrbIL1hQ6uKshXATMLQGQ==
X-CSE-MsgGUID: X3jf8T2hQ662Te5jcCtYlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78284902"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78284902"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:28:28 -0800
X-CSE-ConnectionGUID: J2SfDbr+TFiRrbH5B3DqVw==
X-CSE-MsgGUID: lzGsuhVVR06wAmFtcoX67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196250294"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 12:28:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9kW-000000006Zh-1wig;
	Fri, 12 Dec 2025 20:28:24 +0000
Date: Sat, 13 Dec 2025 04:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] drivers/dma/pl330.c:2599:15:
 warning: 'src' may be used uninitialized in this function
Message-ID: <202512130409.sZE93fMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 0299853c014aa0eecf7fb85ac2f1ebd0a9a6ba73 [1941/1941] dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 9 months ago
config: arm64-randconfig-002-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130409.sZE93fMA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130409.sZE93fMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512130409.sZE93fMA-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   drivers/dma/pl330.c: In function 'pl330_prep_dma_cyclic':
>> drivers/dma/pl330.c:2599:15: warning: 'src' may be used uninitialized in this function [-Wmaybe-uninitialized]
     px->src_addr = src;
     ~~~~~~~~~~~~~^~~~~
   drivers/dma/pl330.c:2657:13: note: 'src' was declared here
     dma_addr_t src;
                ^~~
>> drivers/dma/pl330.c:2598:15: warning: 'dst' may be used uninitialized in this function [-Wmaybe-uninitialized]
     px->dst_addr = dst;
     ~~~~~~~~~~~~~^~~~~
   drivers/dma/pl330.c:2656:13: note: 'dst' was declared here
     dma_addr_t dst;
                ^~~
   drivers/dma/pl330.c:297: warning: cannot understand function prototype: 'struct pl330_reqcfg '


vim +/src +2599 drivers/dma/pl330.c

b3040e40675ec2 Jassi Brar 2010-05-23  2593  
b3040e40675ec2 Jassi Brar 2010-05-23  2594  static inline void fill_px(struct pl330_xfer *px,
b3040e40675ec2 Jassi Brar 2010-05-23  2595  		dma_addr_t dst, dma_addr_t src, size_t len)
b3040e40675ec2 Jassi Brar 2010-05-23  2596  {
b3040e40675ec2 Jassi Brar 2010-05-23  2597  	px->bytes = len;
b3040e40675ec2 Jassi Brar 2010-05-23 @2598  	px->dst_addr = dst;
b3040e40675ec2 Jassi Brar 2010-05-23 @2599  	px->src_addr = src;
b3040e40675ec2 Jassi Brar 2010-05-23  2600  }
b3040e40675ec2 Jassi Brar 2010-05-23  2601  

:::::: The code at line 2599 was first introduced by commit
:::::: b3040e40675ec2c43542331cd30d4ee3dae797e8 DMA: PL330: Add dma api driver

:::::: TO: Jassi Brar <jassi.brar@samsung.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
