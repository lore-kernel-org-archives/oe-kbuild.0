Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950322;
	b=sXrR0tyYSbQNAsS2GA1iJpZ+jMSaEwWB4gEMKLDBgwwsBLX5N6eGT/6HrQtojgxa+Evl
	 T0sS3iWvT+Z14yYCFUgs9bPMZ6L12kyQlsh68oyqJyIgejYu815D/Ei3L5u8ruDlStpxh
	 rqZys1+n/Ywdy37iZdht4Wf1REDIQwekvPjjHYBG5RUWc+yV/0Vr/JXL7yJg4Ij1REz1M
	 RZnDlZfTTwpoN5U052Pd8F33bdE9j8ksjV2K+3RXPwcAMaLq51A/NRw/fQncyVeVl8wUB
	 yzb7O33zFAuSZHCEe1Q64OViDM1ltMEb1LrloiFpT+wd/Lh/aYkeqK2DCjkmMDX5Gow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950322;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8ASVgR1MLsvFRV1LFdkf9ZoKxZg7WkU46xGOinN7ntU=;
	b=H0ao5ov2vTdK0WMrSkO/HPnJ3UTDff/kP1IEqGfMq/k2Vp7NWfMe+tvlDR6YpULoblyP
	 TIfqU6PBg+AD/oy6/TKMdv4qWBfl+1HTXp+hSr/tsNw1yRQbcLEPwaEMLchGnijAiToYK
	 rN7NSscWA7xlP74BYksNA6UXaoFolC2eOj0iwDnfeE3GftYthpEkZc/2kQoBRv73emCCi
	 PAOLs3DdIvKZ7YcPV8k8bXZw8F8CqpdT6ejL4yKY5KbXGORhmeKZdMgB/Ej6w+C0NTf5d
	 L85pJZIZ14I9Ypwh6yEg7jf0sX5cy9KAirymbCBGxCEkFbPh0f44VKEpCtt4sOoEq2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Usg5zrRv;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C70606A31F
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Oct 2026 17:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C70606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Usg5zrRv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792950320; x=1824486320;
  h=date:from:to:cc:subject:message-id;
  bh=kUj8SXrRZpX4Mg5jN7SyiR/9HtDAGa+gLAFqRYhQd+0=;
  b=Usg5zrRvzR1F1rPn6VTQELPVxusT45PnNJbAoPX00jxcsc0uduEjY1aY
   3ui2A2m9Y+bMKVpbfx4OFw7TjdwGNzT1LVBnSD7KvDeXLcMInQ9FePlYy
   pxD++gjD9linFpn3vyyvmmpOJgE7hGIds0xYIcQ7xeYx73QDC/KSD/FZn
   2wWXYSv/bBDRi1inGutQ58os4JMmR5dLiaQJD/uCI85o2OxnbOgwE9qZ/
   DdZ4TsZTxkX13zlBi7lNVOIWglbKCq3/4QkbNCmfIfkUMsn2OfeJ8YzT+
   ow26Q6kuyTzTtF8UU9H+6QM59D/3X1VmEak2hgLjFFi0BUUARH7bWfV9t
   A==;
X-CSE-ConnectionGUID: E/38ujjNTkuaCvYdRNCROQ==
X-CSE-MsgGUID: 87EOnOw7SSGiQLtcxr9iWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1729372"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1729372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 10:45:19 -0700
X-CSE-ConnectionGUID: aWC5eUHBQc2bQY9/mWL6Tg==
X-CSE-MsgGUID: liekZT1MRKaYWFGCca90/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="3965593"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2026 10:45:18 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL2HU-000000003md-16Gu;
	Sun, 25 Oct 2026 17:45:16 +0000
Date: Sun, 25 Oct 2026 18:45:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15-lts 2/2]
 include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selected.
 No NOR chip support can work.
Message-ID: <202610251809.pyVaizvw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work."
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15-lts
head:   28ca5d8b733ed5c4ea847e57cc94f90cfa929e94
commit: ccb03ec4294c0bab21252e69789c80cd766eec1e [2/2] spi: bcm-qspi: fix SFDP BFPT read by usig mspi read
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 8 months ago
config: arm-randconfig-r2300-20261025 (https://download.01.org/0day-ci/archive/20261025/202610251809.pyVaizvw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251809.pyVaizvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610251809.pyVaizvw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/spi/spi-bcm-qspi.c: note: in included file (through include/linux/mtd/spi-nor.h):
>> include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
   drivers/spi/spi-bcm-qspi.c:363:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [assigned] [usertype] data @@     got restricted __le32 [usertype] @@
   drivers/spi/spi-bcm-qspi.c:363:30: sparse:     expected unsigned int [assigned] [usertype] data
   drivers/spi/spi-bcm-qspi.c:363:30: sparse:     got restricted __le32 [usertype]
   drivers/spi/spi-bcm-qspi.c:327:24: sparse: sparse: cast to restricted __le32

vim +62 include/linux/mtd/cfi.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  60  
241651d04d672f David Woodhouse 2007-09-06  61  #ifndef cfi_interleave
241651d04d672f David Woodhouse 2007-09-06 @62  #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
241651d04d672f David Woodhouse 2007-09-06  63  static inline int cfi_interleave(void *cfi)
241651d04d672f David Woodhouse 2007-09-06  64  {
241651d04d672f David Woodhouse 2007-09-06  65  	BUG();
241651d04d672f David Woodhouse 2007-09-06  66  	return 0;
241651d04d672f David Woodhouse 2007-09-06  67  }
241651d04d672f David Woodhouse 2007-09-06  68  #endif
241651d04d672f David Woodhouse 2007-09-06  69  

:::::: The code at line 62 was first introduced by commit
:::::: 241651d04d672fb685b2874707016cbbf95931e5 [MTD] Fix CFI build error when no map width or interleave supported

:::::: TO: David Woodhouse <dwmw2@infradead.org>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
