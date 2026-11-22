Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795308247;
	b=jcJdx11Gy74BHGcFCrW3bLV6cNojhOX7kkUONhQssdThxMU7PKJBDpJ2rNQnepzrmu5o
	 6wBfDgq2nx5H3v80RyLXgZvcyAccKSOGMW/3B92L6S3EBdM5UnY3bMsxgVOdG6VF3ooQc
	 Uyw7JosqKLjZiTv73TlUDUBTbkEAS+nrOuPvTrFHU8tamfF88rkIxi2hNb6QFTVQsaUk5
	 hBCvGNrTr1wIMp8s00YIXmJy+hB+MR8MQE1DtUMT+tq0/1ypUo4LNphlpDirTKWYtIKL6
	 zrtrRfmtYLuh9wk9vpL19nTUn8E5HGAaEnZByEClc0GFW8LZZ/UmEgZITDlpHvEZ9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795308247;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1yrCiUkKZQG/w+LYTrD0QgwF1aBCquzmENjzMB6yQM8=;
	b=EETnG5ZeG6TuKvEWXYWnSWoYZ/87avrKSULDt23mhdJ7syuVVEuonS1KYJ54wbuds0r/
	 cW5MG28Oi0vNOSn8OaUCQxFFUDa32XL2uxnVBsE5H6CpwkgJpazX/8hpRj34sf0N5aS+j
	 pLShVpRz26G1ljhYprkW3fciBzUypDkldIRr4rEJcSLyr6T7nzU8gVA7473l/4RhCexNu
	 bYDAa8D82/JFC5heAYu07XL0Hx31RRvaurPLUB0C8Q40uy4qE04R8lX5vdmPrA06F1qgq
	 LIi0tynaWD9ZWLk8dTMxyNFNoVt8fNzlSvCJ8rPRw0eYeTWvAZMqBiq4KAX8OBAIOxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mrcOOYoY;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D79606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 00:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D79606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mrcOOYoY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795308247; x=1826844247;
  h=date:from:to:cc:subject:message-id;
  bh=Ukb+UVK7nNxyilVM9wofQUkavHaQOxml8g735vNAvgM=;
  b=mrcOOYoYIPsrTmobErZZvl88h/cLN8itHqLiApw09qVTwI+9Ki675omU
   ozTwU1Z0E8W1YFOmFtEaJs4dfEfrLG9ouVyA9qcZ/w5Bg0bhrDKhHld+f
   GEmAv1e6gCkDHRzn11zbruX20Me1V4ua+ddvPNVNNcCzY+knVTPIBDY0+
   /OLSmGUvzGLVv0ZN4Y1cmDqVIRVt1PBogbipvqnHqJjwn7iGaFCV9Zqo3
   UcXnZwKx3Z9DeEwmnjCAa1tjH+2d4j1jnczekUxgjN+tR+0aIb/YbzgOZ
   1T5hI+xM3gIGgDmMXh6/FuuGEy4iUYvuresq5jkyCgNkerjlI2Sb9kGty
   A==;
X-CSE-ConnectionGUID: dIpjRoJ8SJShWamM5uDcNw==
X-CSE-MsgGUID: h7caPKPSSQiHb74riNygUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4059834"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4059834"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 16:44:06 -0800
X-CSE-ConnectionGUID: PyI3uUmKTHSRXIIHE9J9kA==
X-CSE-MsgGUID: ZI+ZEYZeRK2LSptOG5qs8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11343322"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2026 16:44:05 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUvgY-000000004RF-3Chm;
	Sun, 22 Nov 2026 00:44:02 +0000
Date: Sun, 22 Nov 2026 01:43:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: usb.c:(.text+0x322f): dangerous relocation: s32i.n: cannot
 encode
Message-ID: <20261122013852.pp4z1vjZ-lkp@intel.com>
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
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b7fe306dd86b5342d3be8a3f1cbf3bb1ebf280f
commit: 1ba9f8979426590367406c70c1c821f5b943f993 vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros
date:   1 year, 1 month ago
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 1 month ago
config: xtensa-randconfig-r2310-20261121 (https://download.01.org/0day-ci/archive/20261122/20261122013852.pp4z1vjZ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122013852.pp4z1vjZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122013852.pp4z1vjZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x2a8d): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x2aa7): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x2bca): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x2bca): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x2c14): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x2c3d): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x2dc2): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x2f8a): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x3192): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x3192): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x31a5): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x31ea): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x3212): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x322e): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x32b9): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x32b9): could not decode instruction; possible configuration mismatch
   xtensa-linux-ld: drivers/usb/storage/usb-storage.o(.text+0x3332): could not decode instruction; possible configuration mismatch
   drivers/usb/storage/usb-storage.o: in function `usb_stor_control_thread':
>> usb.c:(.text+0x322f): dangerous relocation: s32i.n: cannot encode

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
