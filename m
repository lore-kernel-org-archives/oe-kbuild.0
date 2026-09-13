Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272323101A2
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Sep 2026 05:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789277624; cv=none; b=uyew9a24Nb6jwaB5maGqVEZJE/h18mIKLo+DsSq3mUC+zWqHbiyvy8uTTs1F2vx51BsIQgzoQYmtxplubEdxVhZ9xrFWAyHzu4KKzuB7qvcXWHr5iytgBINNG74ZZrmTBWndHyliSDWXXp9frtPi24ttedU8s+xoJpWf71v45/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789277624; c=relaxed/simple;
	bh=VQx61GGe/fwDgivpjgleQ9lzxgHXxiFTjvN7DQH11sM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T+lTfLjAfiWMZXVD1cCON7PZHSm1O/7rv+cCKyG3bB4QXL2+omIL7gxsWRS92JRfX4vvvaXUZPxinxUg4EKF466SXNrcly5G9RJwMjuisVasFIG/nxlnXixArjkLaNuw01T/ZpNsbuTjXFq4oqtpFHlV5LZjjktl2i3ELusiCBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQEMGjIC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQEMGjIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789277623; x=1820813623;
  h=date:from:to:cc:subject:message-id;
  bh=VQx61GGe/fwDgivpjgleQ9lzxgHXxiFTjvN7DQH11sM=;
  b=kQEMGjICbm7khlX0rysP1Jv/mQwOJ8X2v3I1M33Mclrjg2BOUxa+o2WD
   XoBEq/lTGp4J0Flz6w1aWfFX8qpB1FkCB2db2H+0wiQsJPkLqEeuYkkOb
   900yjNWzlNHgZVnckk0uYYP+kG5ifGToJ19Ptm2TgLbtQllens9Iqum40
   g+YrhV2eiQwwqHYF5dLzBhSUlfuVVm4RobM/2f5QggtnqLn/GWamCCG9L
   0LufN4VGTAcFZAWpT4UDuEF5li54/S7UkCfVNZx+rH0Ced1Rtk/JDxYvB
   V6wVBAk9XdZ3uhWPPV6cYJsmQDGmSyIrbm426+60BKyMDZCQs/OZqNO3V
   g==;
X-CSE-ConnectionGUID: fT6fofQNQ1uL4VRZDi+ogA==
X-CSE-MsgGUID: oEALdfMfTp6Hve+A5fF12A==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="107191373"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="107191373"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 22:33:42 -0700
X-CSE-ConnectionGUID: erinsDd6QRW2oeTZ6CqVZQ==
X-CSE-MsgGUID: PjWWSK5gTyegsa9ZOkUvvQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2026 22:33:42 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5coJ-000000003eH-1V8d;
	Sun, 13 Sep 2026 05:32:00 +0000
Date: Sun, 13 Sep 2026 13:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/blk-mq-dma.o: warning: objtool:
 blk_rq_map_integrity_sg+0x170: unreachable instruction
Message-ID: <202609131321.XSgHfnHv-lkp@intel.com>
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
TO: Keith Busch <kbusch@kernel.org>
CC: Jens Axboe <axboe@kernel.dk>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Christoph Hellwig <hch@lst.de>

Hi Keith,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cba2348ab114391f5b1a00fa65c5b739f13f0563
commit: c16b52a0a095888efdd5d76f7194caf2a4752256 blk-integrity: use iterator for mapping sg
date:   1 year, 1 month ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r061-20260906 (https://download.01.org/0day-ci/archive/20260913/202609131321.XSgHfnHv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609131321.XSgHfnHv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c16b52a0a095 ("blk-integrity: use iterator for mapping sg")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609131321.XSgHfnHv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-dma.o: warning: objtool: blk_rq_map_integrity_sg+0x170: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
