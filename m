Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2822A4F6
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Mar 2025 22:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742510702; cv=none; b=RDLzAaMme6DXIyS29tcPiXHBGgdrRmTg2Q14UuwiAZEOhwaAqvXo3uMPAly+hbVdoRe3223olsIj6FqGsclkUhYekRV0fy/ef1YlROCiRT7rN2F9KMuTvGfLLQ8jq27lhiWVUxsFlsGxpsRh3Wen7A8bKLCF2DDgePHiMDZa47E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742510702; c=relaxed/simple;
	bh=6RdURT24XNdOYZZeydEm7df/w3SudpsKIRaFa+rpx0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kE/k1Enm+FJ73s4Q0evhtw+tim8DUC734uEgMzOPz7cX6gnXYe/x1u1diYuK7OIWFKWTE9Y/5AQyJzbQ1rPbLNseuGCk18X+mh61uZEkutwhMKa9yHVSeU51v10xSl9OD/KFVx80lv75pJmZ4PSmMAu0vDzEXg9KJtt+J860Ox0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dknjhIH7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dknjhIH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742510700; x=1774046700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6RdURT24XNdOYZZeydEm7df/w3SudpsKIRaFa+rpx0s=;
  b=dknjhIH7iVj72WXq+WNkBtLsiRW5DVwm3ywunnCJ7YaWgkN8pgOoi7Wg
   0y4zgQmTskEtVK/kHzAxdQPs1XUmEDI3BMrCpDlJdSD/Dg7iM2u1qIe+P
   hfvf7d94oIHCX9sobj/94c5YeXaMmw9rCddn96HYCYShQvFzLTyN2lA+c
   Tn0xXrGsg83UEeZ7z5/eHRNYFWvXPOqoTuzDgp2LDG2NfNnkDIEZSGrSB
   6PMjFOchQtYA2ZOVf5X27IeQAmj1uzGa8bD1kVwXESGxrofzU0HDipQMD
   oOL3hOvozqw293OUT+7/szUxA30QVdnfmat8mjOrvTGUx56kMsuBBv1Ti
   A==;
X-CSE-ConnectionGUID: fudFKvNgS0SBnGm6Og0rJQ==
X-CSE-MsgGUID: L1OuIj9hQQip9FMEJPUjNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="53986063"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="53986063"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 15:45:00 -0700
X-CSE-ConnectionGUID: J9jIxauRSbiC0oOyUJiOtg==
X-CSE-MsgGUID: Wl1ZeM2+Sqekm4987io61Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="128451972"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2025 15:45:00 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvOdB-0000qB-1t;
	Thu, 20 Mar 2025 22:44:54 +0000
Date: Fri, 21 Mar 2025 06:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11107/12769]
 drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x100:
 (alt)
Message-ID: <202503210602.fvH5DO1i-lkp@intel.com>
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
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   73b8c1dbc2508188e383023080ce6a582ff5f279
commit: 36799069b48198e5ce92d99310060c4aecb4b3e3 [11107/12769] objtool: Add CONFIG_OBJTOOL_WERROR
:::::: branch date: 13 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210602.fvH5DO1i-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210602.fvH5DO1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503210602.fvH5DO1i-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/dvb-frontends/dib8000.o: error: objtool: dib8000_tune() falls through to next function dib8096p_cfg_DibRx()
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x332e: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x4097: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x32f5: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x406d: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x32d9: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x32ad: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x37df: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x5177: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x37ae: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3281: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3130: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x4042: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3122: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x4025: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x30e9: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x49a0: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x30af: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3082: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3068: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3034: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3882: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x300b: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x2fe4: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x386a: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x2fbc: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x2f90: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x1ba5: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x285f: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x1b95: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x467b: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x1b89: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x1b15: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x4000: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x1afb: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3fdd: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x1ad9: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x13b: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3f6d: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x12a: (branch)
>> drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x100: (alt)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x3aa6: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0xd8: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x9a: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x63: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x39: (branch)
   drivers/media/dvb-frontends/dib8000.o: error: objtool:   dib8000_tune+0x0: <=== (sym)
   drivers/media/dvb-frontends/dib8000.o: error: objtool: 1 warning(s) upgraded to errors
   ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --static-call --uaccess --Werror --backtrace drivers/media/dvb-frontends/dib8000.o.orig -o drivers/media/dvb-frontends/dib8000.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
