Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E2D1DED63
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 00:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438418; cv=none; b=eUA+22GHJrNO89LXbTHRucGwc51dLqknXlqPyClSOZVltMOblhwsvj412cdETiMVuZFI4/MvEjXZVQTQ6wltCkO14iK4eAHWRKBLCiy4dWxXuodovNHrSAf2DtuwOZ1UQaBQLSqerQ/0kGGdUHSYQ8zGcp0dCbVlZs/IDFrLwns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438418; c=relaxed/simple;
	bh=3VUhAkebQNAMvzHsrDk3lv/MmKuMC2+D3fTaofOk0/E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M00waI2t2kCfYOnwPFlGHmBbcuggdJ59sPSEo1qTg4E675rSKdvGuNIvMXoJrnXW4icjdeP3hGDFZv9aHKSZ4EuXTzhAJmcnxanUPBDas9TumANe5bFSM70grxo0QQpSj1GiNWJOJN6/lOxikYlb61OOfrkDTAqeKp3JZ+U3NVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRAXeyy2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRAXeyy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768438415; x=1799974415;
  h=date:from:to:cc:subject:message-id;
  bh=3VUhAkebQNAMvzHsrDk3lv/MmKuMC2+D3fTaofOk0/E=;
  b=GRAXeyy2XIYx7lGOLG7Yj3u1uCPFI30N11XpEh4fbFaG4FNSrhykOH/M
   voFpXMBWs0VioAYQxQvgmTFSonKgwzAzkctbLinx/w8/ksTzvYhpMRDwc
   aGmMe9OOlE0Ff8Rz29+pA9zieP1xWQgeauJP8s2U2WHOvnwHWSEEMH2PT
   4Quziw6os2M7nQplI3hHXRXwMjOXELdviO8WIPX3jP6XgpcMWGj72K50P
   FDQ3y1rQbj3zlzFYnxWyBlB9zQTovFhE0V+ySPKZ7s/wbpax4EvBRiRQa
   eScmoItww8F6tJ0XYiyrl/nwYDECZhs0D11a8cHdI8sCj2Qk5aLtLMxJB
   g==;
X-CSE-ConnectionGUID: yjtWVY1eTnCVBe2MOMmcjw==
X-CSE-MsgGUID: +O5Y8ZfkQVyeHwedvDOVjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72330688"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="72330688"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 16:53:35 -0800
X-CSE-ConnectionGUID: 89WzZaHASZK9Vhngr1lgEA==
X-CSE-MsgGUID: XEP1npkXQlW2vMmpvBBcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209289684"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2026 16:53:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgBcC-00000000HHO-1rIb;
	Thu, 15 Jan 2026 00:53:32 +0000
Date: Thu, 15 Jan 2026 08:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: block/blk-mq-dma.o: warning: objtool:
 blk_rq_map_integrity_sg+0x1b4: unreachable instruction
Message-ID: <202601150824.khs0i4gI-lkp@intel.com>
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
head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
commit: c16b52a0a095888efdd5d76f7194caf2a4752256 blk-integrity: use iterator for mapping sg
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260115/202601150824.khs0i4gI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150824.khs0i4gI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601150824.khs0i4gI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-mq-dma.o: warning: objtool: blk_rq_map_integrity_sg+0x1b4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
