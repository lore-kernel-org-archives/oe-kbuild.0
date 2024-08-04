Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE712B6C
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722778082; cv=none; b=TrookhgyFiVhxbOxI6B0VbNvGhroZal2iu3F8/oDXJ7lyHz5Hs+EszFlOXy6f8WwGqXjnSMauhk9rRmgvPZ7FrBueiZvsyZLrtRsQDaXa32TUQjTl7lQqEFl1eIhgwdebJTHv6f1vAQg2CEKN7suar8LcwtSJEdcMRrMlp8KerI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722778082; c=relaxed/simple;
	bh=YXIIZZfmmJ77XLNfww/Atjf44BnPKbOji0NYg2h/8A4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=szIjdNM4vm4On1A53k9zQBtBQk/6hipwq3Ln3NBEx28WRqqkD5KfpnxxrClh+KrOIcysdqlIP2bfeJlGmNf1izNqP4zj0J/mdvDbF3fwnYSlyHwgQMC716whqSETB805wkfejVeJG72JAVhCpaN+C2qNzTblo0IziCKM/JAYg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAu9ALeG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAu9ALeG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722778080; x=1754314080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YXIIZZfmmJ77XLNfww/Atjf44BnPKbOji0NYg2h/8A4=;
  b=DAu9ALeGlotbaTi8vPdwWkvKtGen1FhKI7unA/NmXsuC7jCPxXUWx+O9
   vdhFfyh8/4Rq17S1zfSB28TveHVFaIvS9I5eXkkH0ceZ/UdhaGZJbI2S9
   4ayWuJ4QUKv8+iywfOGyWxGP4Xl/RER+FOEvu47t92rJC8bwDU38bHJ+c
   LUJW9e69ZJ32T4UZUQzSkGp0Ye3K4eq05JHUw0ch87oqgGCLJbnTN+0zd
   use8sS5vdzjU3YXexm/0ADhL+iMPNMAQEWghKpgt2EqBoZXAhsVNdpO4x
   64IaC7fBtzopoIzAD2BmPB9LBaNR1gUm+QUlWG5cjAkGqYvNGdACtEjeJ
   Q==;
X-CSE-ConnectionGUID: MsRt14z/RQiDXVjV0x8U4A==
X-CSE-MsgGUID: 5aohG/xjRhOy57HMb1bECA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="24534377"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="24534377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 06:27:59 -0700
X-CSE-ConnectionGUID: VE3GoeFNRq+yYxtWhgP11w==
X-CSE-MsgGUID: j90zpBNGS22/EjEqPaTpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="79180256"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Aug 2024 06:27:58 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sabH9-0001S4-2v;
	Sun, 04 Aug 2024 13:27:55 +0000
Date: Sun, 4 Aug 2024 21:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/common/saa7146/saa7146_core.o: warning: objtool:
 saa7146_vmalloc_build_pgtable+0xf4: unreachable instruction
Message-ID: <202408042146.nTPYy0SC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kent Overstreet <kent.overstreet@linux.dev>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17712b7ea0756799635ba159cc773082230ed028
commit: 7bd230a26648ac68ab3731ebbc449090f0ac6a37 mm/slab: enable slab allocation tagging for kmalloc and friends
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240804/202408042146.nTPYy0SC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408042146.nTPYy0SC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408042146.nTPYy0SC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/common/saa7146/saa7146_core.o: warning: objtool: saa7146_vmalloc_build_pgtable+0xf4: unreachable instruction


objdump-func vmlinux.o saa7146_vmalloc_build_pgtable:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
