Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00C943172
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Mar 2025 06:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743401452; cv=none; b=Rzsv/lEEe5OGBxEvNZA9nBVWmMgH7ylvcT9p4oTCY5UP524Imz/UF2YDHJKrpnzgV+aquZhgxuWnJ1IFi+uhG266M3l2DZbi0d3azQpaNseR0WYpcFn82AxQO/6oTj6aYfkHXMlSnGfdbpU8QM4ZwlA804hvzau9OukW90UX0dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743401452; c=relaxed/simple;
	bh=0kgnic6ElRIXtvicJD5SLwSVPaoh9fAInlLObk4F9H4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCZ43u2qgvOTchhg/nRSPl7DyKNgXJx/9jPOay9dB17uHjpfw65o3UKSMb6FUlYAbBNqybwPtervYZpK619dMXsKreHlQ4DHJ4JKDJkN+VRJElvE2Csa6H8LmxgaO5QP6nbiSG+zdl2aFvoQXrx4tGDRV7j02os35LM7FVnviK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlELI2T9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlELI2T9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743401450; x=1774937450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0kgnic6ElRIXtvicJD5SLwSVPaoh9fAInlLObk4F9H4=;
  b=ZlELI2T97bkSTqOu2/B8iyS4uRRbukWdvGwayNwTbEZZdeWrpR8CVR2s
   vzRPr3hyjBs7RCTDe8XlB7Ubbvwo6SLEnGGA1z3eb9Y/JrPJrwfWFupWV
   NdM0XoO2dzkO2+081W9UxloAcBMpbljgb3Er8r3WJOOKH21mFIEwKUG/g
   wecEP3Yk4svIKLPn0JYkuG5jwqLYDxYebuTpwKzPqs5qVT7uV9Iu8Yv8p
   gG7CtFRrLRXdncYcLPG4Mm+2xLZEzzx3C2j5lYaSCBx/JnOLORJRYyMQ6
   GKVoF7qpf68l93asIwu7144Qq9wsGKjUPB0/HXOPeszHGRBU/lh8H7QVd
   Q==;
X-CSE-ConnectionGUID: 22OdGmpGSoemcVVIxqYQ8g==
X-CSE-MsgGUID: Zp5gl+GJRzi5Xx9PctbDFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="43926849"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="43926849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 23:10:50 -0700
X-CSE-ConnectionGUID: cNczTbWcTR6CpLO4z/OCBg==
X-CSE-MsgGUID: tg6Hk4KjTbO459/45qwk6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="156926569"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2025 23:10:49 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz8MA-000958-2J;
	Mon, 31 Mar 2025 06:10:46 +0000
Date: Mon, 31 Mar 2025 14:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:objtool/urgent 5/25] vmlinux.o: error: objtool:
 intel_idle_ibrs+0x13: call to sched_smt_active() leaves .noinstr.text
 section
Message-ID: <202503311434.lyw2Tveh-lkp@intel.com>
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
CC: x86@kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
head:   ae958b12940bcd4ffa32c44684e4f2878bc5e140
commit: 4759670bc3e670069c055c2b33174813099fea4f [5/25] objtool: Fix CONFIG_OBJTOOL_WERROR for vmlinux.o
:::::: branch date: 3 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-121-20250331 (https://download.01.org/0day-ci/archive/20250331/202503311434.lyw2Tveh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503311434.lyw2Tveh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503311434.lyw2Tveh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: intel_idle_ibrs+0x13: call to sched_smt_active() leaves .noinstr.text section
   vmlinux.o: error: objtool: 1 warning(s) upgraded to errors
   ./tools/objtool/objtool --Werror --noinstr --link vmlinux.o.orig -o vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
