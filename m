Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC513790B
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 23:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763250850; cv=none; b=P8axwSB9854KNQviGfJfytZO2LQ7SFPKNByFa/wtdM9tJeqXjo8CQ3Po6TlAcOYvbdpq+fzZYPMxFq1lBtbNSX2qn90b71E/NedW5nyjE3vUFhoaWYzCfcjicHcDEFYsFwXxVQ0SVdAgAxhprE87quXw1twhXmNgtTm1eqtdY3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763250850; c=relaxed/simple;
	bh=ro+EWWVuB7zZMcqH6ckbZe+zW57LBRhZePs87eHobp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F++LVGl01VXBhKSxuZKCRAZlN3FA9wEw9aG9ArXylNSrjkhVvQ8T0HPSz4Yt4+8HHTOV58VJKjKtqDPM7ERhwYqp8NDgSig7CaFgrc+Rn43aXL09iLH5Krob2N3Z/JZa503DyD55AbsFjN+VuBHimsfouocgVVRkXVrGuwiDouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBTFhAd1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBTFhAd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763250848; x=1794786848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ro+EWWVuB7zZMcqH6ckbZe+zW57LBRhZePs87eHobp8=;
  b=cBTFhAd12g0psTB8jVf+fpoBRIYXeTMdLAaXKzZz5Pc8JgqDuXZtzc8h
   scouNNN81ItdHaehGIDkX9mZFgiwjeIT0nQUg9aw9x0HKYNzNbu5lXgU2
   avUL1kAZvMLLScr2WHjfjfhkloScWaFHn9nYV75T3EPmuUavsPCGJJH25
   hDutfhxpAIxyidgQxBJhrfXR4bW8ImDO+iNbBvG7FEiHwQfvyQBdCRwFU
   T5huvFh7RYvIA83iPIaX7Mc1dYGsbLp17o57rAUyjXwfSjNbLsV7DvL7v
   iyEVYDgXxkFXPjW2h38cSfzjPpPySaCz0Yx6aIFMxJroNjvtMTr7P5HSb
   g==;
X-CSE-ConnectionGUID: H1vYsezbSf60VMSbEKlt9g==
X-CSE-MsgGUID: XoukXhHbRmaT+b9a5naLqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="76404763"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="76404763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 15:54:07 -0800
X-CSE-ConnectionGUID: NbKB2eImRbiRR2bKDZrTaQ==
X-CSE-MsgGUID: L7HSwcmaQP20WGNnfRfnyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="195067613"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Nov 2025 15:54:06 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKQ5j-0008Ll-1r;
	Sat, 15 Nov 2025 23:54:03 +0000
Date: Sun, 16 Nov 2025 07:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/txx9/generic/setup.c:101:25: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202511160706.ACCkEvTs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/mips/txx9/generic/setup.c:101:25: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f824272b6e3fe24950abc527136e8140f67b0b23
commit: 9591220e7a6c12c788b1fc013c39af26edf99538 MIPS: txx9: Constify bin_attribute arguments of txx9_sram_{read,write}()
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-r123-20251116 (https://download.01.org/0day-ci/archive/20251116/202511160706.ACCkEvTs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160706.ACCkEvTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511160706.ACCkEvTs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/mips/txx9/generic/setup.c:254:9: sparse: sparse: switch with no cases
>> arch/mips/txx9/generic/setup.c:101:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/mips/txx9/generic/setup.c:105:16: sparse: signed value source

vim +101 arch/mips/txx9/generic/setup.c

860e546c19d88c Atsushi Nemoto 2008-08-19   95  
860e546c19d88c Atsushi Nemoto 2008-08-19   96  static struct txx9_board_vec *__init find_board_byname(const char *name)
860e546c19d88c Atsushi Nemoto 2008-08-19   97  {
860e546c19d88c Atsushi Nemoto 2008-08-19   98  	int i;
860e546c19d88c Atsushi Nemoto 2008-08-19   99  
860e546c19d88c Atsushi Nemoto 2008-08-19  100  	/* search board_vecs table */
860e546c19d88c Atsushi Nemoto 2008-08-19 @101  	for (i = 0; i < ARRAY_SIZE(board_vecs); i++) {
860e546c19d88c Atsushi Nemoto 2008-08-19  102  		if (strstr(board_vecs[i]->system, name))
860e546c19d88c Atsushi Nemoto 2008-08-19  103  			return board_vecs[i];
860e546c19d88c Atsushi Nemoto 2008-08-19  104  	}
860e546c19d88c Atsushi Nemoto 2008-08-19  105  	return NULL;
860e546c19d88c Atsushi Nemoto 2008-08-19  106  }
860e546c19d88c Atsushi Nemoto 2008-08-19  107  

:::::: The code at line 101 was first introduced by commit
:::::: 860e546c19d88c21819c7f0861c505debd2d6eed MIPS: TXx9: Early command-line preprocessing

:::::: TO: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
