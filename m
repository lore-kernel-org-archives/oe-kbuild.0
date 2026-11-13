Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601058;
	b=KOGoQrcqvD3CTx156FV33YAn97G5hQGLI7if3uqGRLdzSKMA82y1uzNJ5Ztbm861q9Gy
	 v9k7D9d74qYLj9qAFhO6zbz2yRu3cyIpAH0kMq0/wMcVXvGetxaZeEbAl8zdCJItsPvB/
	 cDmWd7oTZo2GDe77FYh54OJ/ga7dOXAxEU2sIQFXeormqbPRwrRCfUD8UYVskmo8dvGbC
	 y9zs1O0w5pHDYpdIRsi8qBecvOGheVNZf32i5tM83Y273ezuMJD/mihWVkUHCNj6J/Z/r
	 HmhN0QAFxXu1ga7obl0IESojPyYkYjUeJVyuziz53P+WSWY6lzEIVhW7yvs46cfnbwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601058;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+9f3ZIDZJQkP9B1W0pnC78JyUfrokB04mAG6Ret9EC0=;
	b=LibTIXYxWizMIZ4whBIA3OxynQiMQMoGnT5TVpo4sLMn6D3hYA82js+fvhz47jieXLMk
	 j1bXIotdF2oXoAH+0qJHpsvTMGYAVB5sfQaTSU89QYxIs5nQpdYll7IGX+tm+GMz21HBi
	 bvSZ5QfarZxw+0rZr6enjtdar4iXFgWLiJI5TBbYECMlp7miZGJGZFrGrnA1AAKr9iaFm
	 pt5wmzgjzOiEP6mp38Y2Eh/jtTcz4HmfrIrUo2m2YDg+9ZHs67MKCFMY0w+Xur1x8JWnH
	 yGQeEsjLTcjUheXJxMzsxYgZRFxtrSA5PBwui/uGB/BE/CQ12gkGr9AhSd65Q1TrwIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lerak5zR;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4177606A32D
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 20:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4177606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lerak5zR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794601058; x=1826137058;
  h=date:from:to:cc:subject:message-id;
  bh=EQqdZpjbST/MqwtwXrB+F5a728X6r8cxfpEpVPc5oi8=;
  b=Lerak5zRA7LuFnMzkYDDsZ2E+AD3BnmyeqJzFQq2xzwxVBYSY+wgCRlg
   6WYTlJ2pTo6f5+FbJBNLQmVxDNlkl4ZEF3gEYPwle4hvXD7iDW3w2EhTH
   lmbHq5hpMzcQytiKGWn9Igl4/fOBGH3lWRBMrYCVnnBFyhyUB04CHP4+J
   PI5mCDu1+MA0vMKYrLUSFFBmlxT7Zr0CRRer9FkQwKCbuO/qYy9pSN4yQ
   r07HtjQIaeCfWF+ZtnqoyRd12bKtBrrKG30NEfC1+64yvn1s5BzDC3Z5K
   ap1RUSWgKve7Ac14MXchFgNREv9By7kU4GlqTfXPFpvp64idkrG47YI0V
   A==;
X-CSE-ConnectionGUID: KMLigAAHRUaUlXLcLIRg1w==
X-CSE-MsgGUID: uTaBdZBeQTe+IquJrGugqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3272627"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3272627"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 12:17:37 -0800
X-CSE-ConnectionGUID: SAI0AZWcRvSS66jLHWh+pA==
X-CSE-MsgGUID: zH/CsYpRS7SAcV0ZGxhF6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9435647"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Nov 2026 12:17:36 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRxiI-000000001Kt-0DR6;
	Fri, 13 Nov 2026 20:17:34 +0000
Date: Fri, 13 Nov 2026 21:17:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/khugepaged.o: warning: objtool:
 alloc_deposit_pte_table+0x108: unreachable instruction
Message-ID: <202611132148.LFAW5w8Y-lkp@intel.com>
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
TO: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: Lance Yang <lance.yang@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2800868f63227c8237d70c41e70d441c919620d6
commit: eb823057e092132fe01bdbfc61d44343cd103777 mm/khugepaged: deposit a newly allocated page table on collapse
date:   5 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-r2109-20261113 (https://download.01.org/0day-ci/archive/20261113/202611132148.LFAW5w8Y-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132148.LFAW5w8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: eb823057e092 ("mm/khugepaged: deposit a newly allocated page table on collapse")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611132148.LFAW5w8Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/khugepaged.o: warning: objtool: alloc_deposit_pte_table+0x108: unreachable instruction
   mm/khugepaged.o: warning: objtool: alloc_charge_folio+0x184: unreachable instruction
   mm/khugepaged.o: warning: objtool: __collapse_huge_page_isolate+0x3ac: unreachable instruction
   mm/khugepaged.o: warning: objtool: collapse_scan_mm_slot.constprop.0+0x16c: unreachable instruction
   mm/khugepaged.o: warning: objtool: madvise_collapse+0x7c: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
