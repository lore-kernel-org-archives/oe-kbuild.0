Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57878EEC0
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Nov 2025 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763245261; cv=none; b=JgyQiz9sXH7b58BDIRRuZ03X8bpzIB3kINz5xC2xcOh0kT92TQiD5pNe/W6Hi5Tg7wQ2mfhuNIdaV5NulLUJatSN9sPdpiypG//Oq722TISVFizRhIE3qcRJ7r5EVzt/cxkWvoJv/g4xRYttcUGMWu2nO+wQIK9OuL9Q/5AkLMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763245261; c=relaxed/simple;
	bh=xO19o01M7wY8Hlz/vE9rPfUDsAeCzHvm2SKaHhf1vfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gl0sWgAoBA5gBYCsWV9SFI+1uzHSoywicTEb1SxvJo28TEstUajMWXM+riVGqVr+G2DpIAK95VEqOffqGidWcGVwPiQliarapAPUZNFTqOKscOGGPcmjn7iNDT5T0s+Xh0mvpXbhILk1WQVrT19lzIcxuo7Vb0KNvlATsQKtbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeSvHKxG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeSvHKxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763245260; x=1794781260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xO19o01M7wY8Hlz/vE9rPfUDsAeCzHvm2SKaHhf1vfI=;
  b=EeSvHKxGs22fR1c4QjJyLwKKtZXX6vHVU1+mKIxDykUGiT1oK9atp9vj
   Nx/69SG9NsKl99kpNxeBdJpwDLvCZm4M3gEp4bX/RqkOwHepZ2LYFFd+v
   92eoXsbk9TXFrNIkuz76rcN5KCQqkh8MpaTO8RdZjMJ9NV7HFLjydem37
   sW2R4MEERRqfKFZ+jVoHklxmRyCoJwJUT8ZDIDwn0WrXivA900NM+BZyT
   a/3m5+xF0xMVSUe4OMGTLPhh3JBnlfTi4eaKmAdT06r1e8xVuSIr+W6XX
   QKubrJbvYvWRh06thRmccTR3BhbILtmwLv9ehFeAQxf1dJY+t9IRF+3aV
   w==;
X-CSE-ConnectionGUID: VtC3L8e9S/+DpWmICg51Dg==
X-CSE-MsgGUID: HTXRqV+TRo+0mdON3TIrfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="65009681"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="65009681"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 14:20:59 -0800
X-CSE-ConnectionGUID: UkMaxHVZTHiZOU+vkCKkIQ==
X-CSE-MsgGUID: T3xlj4CwTUCuO5MkEXWFNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="220987304"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Nov 2025 14:20:58 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKOdb-0008In-2w;
	Sat, 15 Nov 2025 22:20:55 +0000
Date: Sun, 16 Nov 2025 06:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/jme.o: warning: objtool: jme_check_link:
 unexpected end of section .text
Message-ID: <202511160652.o5se3Cj0-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f824272b6e3fe24950abc527136e8140f67b0b23
commit: c5995abe15476798b2e2f0163a33404c41aafc8f objtool: Improve error handling
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-003-20251116 (https://download.01.org/0day-ci/archive/20251116/202511160652.o5se3Cj0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160652.o5se3Cj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511160652.o5se3Cj0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/jme.o: warning: objtool: jme_check_link: unexpected end of section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
