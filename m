Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6279218C31
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 01:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761443341; cv=none; b=rAd6sqhMEb3hLwQaoTukBwawFFmcN/CGEylSH+OBfTleY950aVpj6jtPkMLVY3kjJ5xPUWK+9B0snmGvmfco66se8xyMaOrF9lebHXOdKFhNcg9oGCt9NGIRvkF4C2yMMVJjCBGV1Yoh1i4cR9VR7k2BReSGFLkFT7ODcCEF6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761443341; c=relaxed/simple;
	bh=HsI5/sQjVWS1JnElap7GsBVgBRFFAHkF9K+76zta/5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8wRADgkuJQ17jVWPiManuk8Bqjc5qxHXWXpsWgmUKs2WRvLrhQx2zPIuUfrqkN95KhUo3BVQ5S0E7ReQmhJYwF9frsK1TobjwyI54FYySx4BR8vDIt2tOohjL/VQbv0luN49dYjiurq+7ueQa4f1Ynk7iI611JBhDh8wxfsM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8gkIVpe; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8gkIVpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761443339; x=1792979339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HsI5/sQjVWS1JnElap7GsBVgBRFFAHkF9K+76zta/5c=;
  b=U8gkIVpep0PQmCgGbdz6WUO30csHBUcvXrKdW32c9XSf8idvhlcAUZ6j
   YQVo7aL3H9vCGWnsdhf7QTEfydl5oGWi8iyo9cVD7tHlmjaG1CoidG409
   pzjVflgdwiytbrXOqpXlr1fEgOnz7SvsgyBnoFzD4FsEhTNePghp1hfDi
   kwG8nhT/XbYxe1x/iMRgnGyL0X54nrQfRNm5i/ycPEMLmX6ZLT59FUSmr
   PlQ5vKr+SNNM9aiA3dnhR9DLR6C1mi7tcybfmDJ3Fg0At148FUxi8h3TW
   qo0UyvcCoiEuBKA/tS9bxbdwpPMa95/hhLgeOp6KUHRF41lhxfzIcsDfa
   Q==;
X-CSE-ConnectionGUID: w1oj1LytTYqj/icWJ+YJgA==
X-CSE-MsgGUID: egXNxdjrTQ6wD8bR3zEvZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86200394"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="86200394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 18:48:59 -0700
X-CSE-ConnectionGUID: ZFrJ+PS9TlWUqHJ76yAtyQ==
X-CSE-MsgGUID: jB1IGSNUTOCXk9sswjqdeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184436231"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2025 18:48:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCpsN-000FnN-2r;
	Sun, 26 Oct 2025 01:48:55 +0000
Date: Sun, 26 Oct 2025 09:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vmscan.o: error: objtool: shrink_node+0xca7: sibling call from
 callable instruction with modified stack frame
Message-ID: <202510260954.9hiipDGh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72761a7e31225971d0b29d9195e0ffa986b77867
commit: 36799069b48198e5ce92d99310060c4aecb4b3e3 objtool: Add CONFIG_OBJTOOL_WERROR
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-102-20251026 (https://download.01.org/0day-ci/archive/20251026/202510260954.9hiipDGh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260954.9hiipDGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510260954.9hiipDGh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.o: error: objtool: shrink_node+0xca7: sibling call from callable instruction with modified stack frame
   mm/vmscan.o: error: objtool:   shrink_node+0xda5: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xc85: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xd74: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xc63: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xb2a: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xd58: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xb11: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xa82: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x8df: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x8b8: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x873: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x23c0: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x857: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x7f9: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x23a2: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x793: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x712: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x2566: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x6fa: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x6c9: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x694: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x658: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x5e7: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x5cc: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x563: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x528: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x4ea: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x2386: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x4bc: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x4a4: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x24e9: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x491: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x42a: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x2376: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x40c: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x2345: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x3ea: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x3aa: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x232a: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x37c: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x22b: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x188: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x230c: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x16a: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x134: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x10d: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xe0: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0xb9: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x75: (branch)
   mm/vmscan.o: error: objtool:   shrink_node+0x0: <=== (sym)
   mm/vmscan.o: error: objtool: 1 warning(s) upgraded to errors
   ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --static-call --uaccess --Werror --backtrace mm/vmscan.o.orig -o mm/vmscan.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
