Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20893370EA
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jun 2026 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781622494; cv=none; b=tQK/FNdh7b5qbcyr378Qi4CaaNsRlF6kE7yEVKJghSlUAeEKEmOp3v2U5Sn7Ev1QoCzi/Ae/80sB7WVHEcMTpB+UWtugM2xPmbpSdJe4o9y6yHAj2FHegcBikDIucizOkjWzFtlOd3SBfr3zgq49AjqF8W+W2RRcuv7ddTmoRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781622494; c=relaxed/simple;
	bh=Vzdl2ddHLHK/Ghj9sKhDxmzpPagedRJGczcTBpFZFXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pPtzS1bR+5NsxXDCPs5L1hARik2cQKvO/KMo1j1Xuo9aXV3toBRSJUhyrj0izU43jzbZxFgSlD8gov38T8N84Rx8MoAct7iGrNAb1AAKJ6wCiOfViN2yHG6cmBUUFvSrc7TnF+AMDa4l/7Je/qGBLyoO6OqOISQOkCyBX1PQczk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VeAOisMY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VeAOisMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781622493; x=1813158493;
  h=date:from:to:cc:subject:message-id;
  bh=Vzdl2ddHLHK/Ghj9sKhDxmzpPagedRJGczcTBpFZFXU=;
  b=VeAOisMYics08a8tR6j5ZsKs/RBhGrfHzymn9vLDi/2ch4npBem30EvP
   AN1hrQu4C9Uh2c27uLTbpETp+kW2grKEfthloW+HPRDzJ8gyPUDNJfTnc
   91QcBPh+rd7zqqPlw43hlV3Fp67u8g/U0/DvgwiN4uP58oYAk8T1x/OgN
   RDsUO+4w/7D3LXzGADTpB6BmbhhruuR7UytblAJXuQNjp0sEBjNwA9gCF
   Xgz6SaQ15Kjg6lL8M4R3IhwTM3EiRrbJke/g6rw2/kxYQjp1m6Y/lNqA3
   nDdXSum9QYyg/mV6uKxmm20y32cD7HxdtYK9W/P5f/r1+EWPa0W0s2YKd
   Q==;
X-CSE-ConnectionGUID: iTo3a/vWT7+Opm15OL1IUA==
X-CSE-MsgGUID: LkCn3l2JSx+3H4ukhpTZwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82454600"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82454600"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 08:08:13 -0700
X-CSE-ConnectionGUID: M3M5/HgFRmuLoc1r54N8aQ==
X-CSE-MsgGUID: XUKT5E7RQTKvroIutYfvfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252908921"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jun 2026 08:08:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZVOb-00000000TMO-1y0C;
	Tue, 16 Jun 2026 15:08:09 +0000
Date: Tue, 16 Jun 2026 23:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/virtio/virtio_ring.o: warning: objtool:
 detach_indirect_split+0x160: unreachable instruction
Message-ID: <202606162230.Sh7YI71w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6b5a2b7d9bc156e505f09e698d85d6a1547c1206
commit: 9dc6b944f16c0904331903ba0ec36e558e1a3537 virtio_ring: factor out split indirect detaching logic
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260616/202606162230.Sh7YI71w-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162230.Sh7YI71w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9dc6b944f16c ("virtio_ring: factor out split indirect detaching logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606162230.Sh7YI71w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_ring.o: warning: objtool: detach_indirect_split+0x160: unreachable instruction
   drivers/virtio/virtio_ring.o: warning: objtool: virtqueue_add_split+0xe8: unreachable instruction
   drivers/virtio/virtio_ring.o: warning: objtool: virtqueue_detach_unused_buf+0xb0: unreachable instruction
   drivers/virtio/virtio_ring.o: warning: objtool: virtqueue_add_packed+0xf0: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
