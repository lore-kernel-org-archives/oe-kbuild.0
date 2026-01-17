Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B44C4A3C
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 12:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768654380; cv=none; b=j5L9r02RFjr+1oCIpLSqtr5ud8K5kZ75D/5dYrbKNZjyW161FaXb/vDg5rP5mLwhOdL2tTndWFjQCXRpqixQhAjcpF2Kef38ndAcOqkN26l7EEb8BRrr5ehtKAXjiTZAiB2t5oSwuy5uNZBtkGw8ULN1iTa/PeaiwhusWuchraI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768654380; c=relaxed/simple;
	bh=dYPdbYDmq0CQSiV+JZhjP/PkSlBfHPFw3y1W0QyqtTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E2G3KpUW5+EoJuJ5ifJyI7BXaye9jtvU7dLFRJ6qI8nZ+k5ffKkJx3PElLRBKr1yTiGkaaMIv9g2V8gHRtKIRgmQJdh+MhqQdw/xDm6hyjidlT/SRragBjmrUaTYVkw9unH19KRmE6bODvIrsgSGxW8Dp6ybntvsrnN/E1pFqN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYn1hnMc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYn1hnMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768654379; x=1800190379;
  h=date:from:to:cc:subject:message-id;
  bh=dYPdbYDmq0CQSiV+JZhjP/PkSlBfHPFw3y1W0QyqtTA=;
  b=FYn1hnMcfKfDNYKTHkFTViglU8AV+dQBq8pWkAMSx+1Eut95oep1gKNl
   5Lyd0+r2zLPCjc1Vwk74IP0urkl0RJVca/VrGo5QrN8QZsZvennFlBsVv
   eJW5ZxY1dCUrEVt2sz7eCMWcasBaztxhiUA+GxARsS2Cdpx2dscQFUEit
   HT1ol0MPHolpoQmA2x87YlbpI4KAJ8fJk+heTXFA1nQUcUsuwbNruXQtQ
   IRDL9OtnfcTpQeopANqIq8pCl8rYe1XEIMOi+tOYjLuK8t18kDjVKq16A
   /6V5fMGmDnhdWnv/ov1wEHlDZAuPHpgSAtfuC+gCI9RgDkpM9vhqr45zb
   w==;
X-CSE-ConnectionGUID: IazRHfLgRP6gVe98wY/lXg==
X-CSE-MsgGUID: upU7Yqt7Rqit42AIPuoC1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81391207"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="81391207"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 04:52:58 -0800
X-CSE-ConnectionGUID: GNRf9aokQduTQRRa+QaIYA==
X-CSE-MsgGUID: zqpYt25GT+qZ9Htq5CiwMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="204700109"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jan 2026 04:52:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh5nS-00000000LrC-2jR9;
	Sat, 17 Jan 2026 12:52:54 +0000
Date: Sat, 17 Jan 2026 20:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [char-misc:char-misc-testing 6/26]
 drivers/misc/mei/mei_lb.c:309:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601172014.Uh1EsnbQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/misc/mei/mei_lb.c:309:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Simon Richter <Simon.Richter@hogyros.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   aced969e9bf3701dc75cfca57c78c031b7875b9d
commit: 25f9b0d351552f63ac3f72e6c655bc8f9994f7d2 [6/26] misc/mei: Allow building Intel ME interface on non-x86
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: xtensa-randconfig-r113-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172014.Uh1EsnbQ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172014.Uh1EsnbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601172014.Uh1EsnbQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/misc/mei/mei_lb.c: note: in included file (through arch/xtensa/include/asm/thread_info.h, arch/xtensa/include/asm/current.h, include/linux/sched.h, ...):
   arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/misc/mei/mei_lb.c:309:1: sparse: sparse: bad integer constant expression
   drivers/misc/mei/mei_lb.c:309:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/misc/mei/mei_lb.c:310:1: sparse: sparse: bad integer constant expression
   drivers/misc/mei/mei_lb.c:310:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/misc/mei/mei_lb.c:310:1: sparse: sparse: bad integer constant expression
   drivers/misc/mei/mei_lb.c:310:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/misc/mei/mei_lb.c:311:1: sparse: sparse: bad integer constant expression
   drivers/misc/mei/mei_lb.c:311:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +309 drivers/misc/mei/mei_lb.c

741eeabb7c78c55 Alexander Usyskin 2025-09-05  308  
741eeabb7c78c55 Alexander Usyskin 2025-09-05 @309  MODULE_AUTHOR("Intel Corporation");

:::::: The code at line 309 was first introduced by commit
:::::: 741eeabb7c78c555c4c8e39df91b2b8e8d6f5ec6 mei: late_bind: add late binding component driver

:::::: TO: Alexander Usyskin <alexander.usyskin@intel.com>
:::::: CC: Lucas De Marchi <lucas.demarchi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
