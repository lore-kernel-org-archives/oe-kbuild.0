Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084814;
	b=Uh67uOP4esSotBcBgAbOegpIFlEDrwq+NzpPvn6bbln05ELHx1UyzxGOUJ2tqWgdduPH
	 xMaBEiwK5hYSKrzLKiyJfXl2Lt7BhRWMBvT54A+VdxDOrB3cKWW7d1c4H+UVmbycRduHF
	 2drTxXYoHM4pF0Vn9rTxjhmoaPA9CNIuniUzJPAQj731NGoodZnKDdB1wbssg4wGFl8pk
	 /0fC75BKAFUZls0RK4SVofYDkdVmq8jkMgyTQhZ7ZlBtf1m6vFn81KvVKrx6jpmGuTlhn
	 u1E/oRKl5lDVlYGWh7eDzPGfIPvb2Ep38TOHAqstHwrQxdrn//gmZkMTv0og0H2q3tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084814;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gbawFoCf+YE9FmoOibNgUhIMLhK1AwkQWcx1lqXtUvk=;
	b=bVcDQ5kf3rFKzF8uspuNs/1OMvNQ/Qz+JuCKynMX7LCZGbQfiMNc49qMMM/s7khpxU8o
	 s89f64MWCP1zPYQRAMYfZL9DKchL2/bhne5DeYqVXQVQwBD+qYQNaCAjwV1kTYC1iQXAW
	 E16ufwVwjVJnoHSBfpdPJvv4t3/bmPcNWYSVAOAWB68/RM1qpN7mmap8CWwGRKExH5mP3
	 qEePIbOI7FKvMwipmaM+2rneSUauTqPfC2KBMJeXaxjM79x9sQRkk2vKBRl7UGEqtI6Tu
	 efpPhIg8i/j9SbelhEGpHije0EwP/6XrGzR3Hb9iI1g/qO2T7LvG8BullwIvU92iD0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="fiCLD5+/";
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFF9606A337
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 10:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BFF9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fiCLD5+/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795084813; x=1826620813;
  h=date:from:to:cc:subject:message-id;
  bh=yI6cNttlXZG81phUd4jmLsn5/vUru25+zXpGtwEYVSQ=;
  b=fiCLD5+/JoGbKwC4OYpAn0wyp41f3gIrT3zY6dlDLKvgwk/K76Cz+ICW
   QMOfr68Zt6f/phbKqpEnTR2lIEZBsn4u+JcvjxW5ogagwWk9GOxEMtgFd
   s3mhQxDddonLSNngMI41J5Qua4psJX4jwxkhGELCpjo2Di3RlTne7g0f8
   bgt6xPUOKSQHVvA/X56SRMSqOo9/5GxoFmNr8K1HBAlAvNRZNy1mFw0M/
   uZFU8XyTukd4Qd6DmaQSwhzZWgj2BgeM58HJdTbJN1FxxnbzcSIqwfak0
   cNqNgg89gD1E8SkXIPLyRkHkKogrJ3H0e/IwW87AtHFFK5nW5gQAdKN2M
   w==;
X-CSE-ConnectionGUID: UDJv1Y3mRuK9OcdTm0FrcQ==
X-CSE-MsgGUID: RpJpsQLDRw2bRwu4JlL8lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="4028416"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="4028416"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 02:40:11 -0800
X-CSE-ConnectionGUID: dN8apN8QSL+XGdQymKuTvg==
X-CSE-MsgGUID: dlHbgt7KQS+vDxVQCXxGog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10488194"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2026 02:40:10 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTzYl-000000003kn-3130;
	Thu, 19 Nov 2026 10:40:07 +0000
Date: Thu, 19 Nov 2026 11:40:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt.o: warning: objtool:
 bnxt_rx_pkt+0x634: unreachable instruction
Message-ID: <20261119113336.uK7ZK13n-lkp@intel.com>
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
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alice Mikityanska <alice@isovalent.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Eric Dumazet <edumazet@google.com>
CC: Michael Chan <michael.chan@broadcom.com>

Hi Alice,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
commit: 3f1bff1d7fd2458c40147275c91650f7f1b4a7a2 bnxt_en: Remove jumbo_remove step from TX path
date:   10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r2302-20261115 (https://download.01.org/0day-ci/archive/20261119/20261119113336.uK7ZK13n-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119113336.uK7ZK13n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3f1bff1d7fd2 ("bnxt_en: Remove jumbo_remove step from TX path")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119113336.uK7ZK13n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt.o: warning: objtool: bnxt_rx_pkt+0x634: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
