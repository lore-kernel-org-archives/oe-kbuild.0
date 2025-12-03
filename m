Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7879236D4E2
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769959; cv=none; b=D4wqK4bfItsO6OcZKJTad6hkYtb6+fbh/bNq3LPrshd/UpZOkSHn3Kl4N0Cestf5r+wMrDieLSmEZjYI4XcGvZBd42n/uvvjHTpxJnFY6oWnagoyidMtJfRj1y4gO8TXcLMEtPfbthk+dTR06ELT54tNMfilwWtszZbLU0CowcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769959; c=relaxed/simple;
	bh=ccZ1huFBMhPQ6ik7ecDkvk/0zsMhU50KrjR7aM5U56s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/x9iVsnEZ9u6M9zXgOHFDZJubkGm8RctK4mjNw53MVTNdquqgu89uNUcfoso0HxpK9rST6lchMMSVg61XVDcPoBwbdli8ugCmYZdbcLNAyXi2CGeWfotInX7fcCieVSZIckxyIU3LDgqGGtW2RZqole4SKmDk/oQky1qZP9jCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzU39uS1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzU39uS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764769958; x=1796305958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ccZ1huFBMhPQ6ik7ecDkvk/0zsMhU50KrjR7aM5U56s=;
  b=kzU39uS1F8WUMtYn5OXd16kqiUIrPrB+/nx+x0b+zMFyOR/1mKBxfwAL
   3eoegHb1Nh5lPYYSGQadmIs6wRp8ItgfUhUlvSMReECqb4otzHyOLHwiO
   S+yP/2KNea9lA1yrE++HxFgXILblQGVOJ4NgbdP4oi+N2MCF/Z8ID8JSH
   u0mTi6vy7dDD6puOgJ/CG7Q7b5xOg7umV0EFQunNplqfOdpyoxSELoPQs
   gGXho5xpzytDcfNk22ebe7izg5oLAQYRMiyqpw/E6B4qLKBeP2/FKzTgu
   zNngS52/5huH34a0AAy0oYpLjNC++FxRPKXy90azr9IuizS/NZHkVOZzl
   w==;
X-CSE-ConnectionGUID: 5AxesGKfRxOpSvPy+zhBGw==
X-CSE-MsgGUID: DoS8vmKfQKqa2cJ6sR+Tgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77444308"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="77444308"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 05:52:37 -0800
X-CSE-ConnectionGUID: T5HdnYFcQDmEXxbs1X8sCg==
X-CSE-MsgGUID: DoXrkVKyRge9bRcDSCEEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="218017527"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 05:52:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQnHW-00000000B1Z-093w;
	Wed, 03 Dec 2025 13:52:34 +0000
Date: Wed, 3 Dec 2025 21:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-sigsegv 7/7] vmlinux.o: error: SIGSEGV: objtool
 stack overflow!
Message-ID: <202512032111.x3Wv2tHh-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-sigsegv
head:   b93620bd56cefffb0b9f47233e00d9655613cc55
commit: b93620bd56cefffb0b9f47233e00d9655613cc55 [7/7] objtool: Add signal error handling
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251203/202512032111.x3Wv2tHh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032111.x3Wv2tHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512032111.x3Wv2tHh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: SIGSEGV: objtool stack overflow!
   /bin/bash: line 1: 3929376 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --noinstr --unret --link vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
