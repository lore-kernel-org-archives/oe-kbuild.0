Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429DE346E72
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769016755; cv=none; b=A++PKRAETymECvj5tLB/DtLybDAFIe8KUuuNr4ZbN784V08GSE5waa8jsCqZ9yYDaaClEGJwTIWHU8Sf2LQIx+4+Q5sV4mPPXW5RlA9qk/Rsg1LlEpr+myTmd522vIO0mPZG077PPELpb0Zw9jOI4B5lvOQYwOPJhy4Rmvmutog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769016755; c=relaxed/simple;
	bh=w9CE8iGMHUwargvmhqjcL1+e2v+GAsCOaUSkmctGafI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eZqa0sSy5Xnsa/tjqSdREReG4n94gDTqayM5Y1VST/4C1ls20zS5Qv6vc8MFoix1c8eUkg4A55fKZO9b3tKGEon5oLEXa68CfZQRRf1XsdQLNV32MUfM8N6s1CwEMT1FuHknB4T2BM05+CH84+FPYSvUiCMKxmYBdnVzR7usZc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPrl2xmE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPrl2xmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769016753; x=1800552753;
  h=date:from:to:cc:subject:message-id;
  bh=w9CE8iGMHUwargvmhqjcL1+e2v+GAsCOaUSkmctGafI=;
  b=JPrl2xmE0l1cDwL0x2FdW0pWcRtdrTbl/S8haV/mdSufCFolcFOsQD0A
   3MadOXp4+SL1P/9IIY5/RcuPSjRWAa89IjvdbGu4NXpyTaeTwEJgH/hbu
   ankryFi/oP+hbg5Q55DItSIEe4DL5qq1boRUFdkvmqLhxTKDUCbAnOQrr
   ncQcgM7pCWutjrV5mcMDae67sADuEDi0F8rHKOHr8XyrOEW7gVigtNsTh
   Xo26LEmyl2IkwC7VPsQIkyhLK4zLcW23qUMXwxwEWyX3c0XRug8s0fTeE
   p1SvbYH+BwGw+XwCoeFuImsp4CgNEvnPsr8WpYj8P3OnK6xgqjhaxXxp6
   A==;
X-CSE-ConnectionGUID: zpIpuiGFRLOUU6IXkc7A9A==
X-CSE-MsgGUID: tqGHdLUiTluwE3DJDw9TLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70343833"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70343833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 09:32:32 -0800
X-CSE-ConnectionGUID: ZtPn88RMQKyc6ERVuu9TFw==
X-CSE-MsgGUID: 1FUbcL/XR6mj5eQQyVUEgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="237761551"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jan 2026 09:32:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vic49-000000000Kz-3Ej8;
	Wed, 21 Jan 2026 17:32:25 +0000
Date: Wed, 21 Jan 2026 18:31:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7345/8302]
 tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:2:10: fatal error:
 stdio.h: No such file or directory
Message-ID: <202601211802.7dVmKs0M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alex Mastro <amastro@fb.com>
CC: Alex Williamson <alex@shazbot.org>
CC: David Matlack <dmatlack@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: 080723f4d4c3c6fb0720aae614deb1f30ee9ef2e [7345/8302] vfio: selftests: Add vfio_dma_mapping_mmio_test
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260121/202601211802.7dVmKs0M-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211802.7dVmKs0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601211802.7dVmKs0M-lkp@intel.com/

Note: the linux-next/master HEAD 053966c344dbd346e71305f530e91ea77916189f builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:2:10: fatal error: stdio.h: No such file or directory
       2 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c

080723f4d4c3c6 Alex Mastro 2026-01-14 @2  #include <stdio.h>
080723f4d4c3c6 Alex Mastro 2026-01-14  3  #include <sys/mman.h>
080723f4d4c3c6 Alex Mastro 2026-01-14  4  #include <unistd.h>
080723f4d4c3c6 Alex Mastro 2026-01-14  5  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
