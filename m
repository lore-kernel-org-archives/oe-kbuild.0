Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DF9584E6
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTc0yMcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701777517; x=1733313517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tds3qrFlZMx/f5h49MuiyBj7/ceuwvUsVlJsGXqAlJc=;
  b=FTc0yMcbiWIdmdzKO+E9UimDra/JjjiJh9bjaTmDNdxfTVir0juaZjku
   TlWikPL5z4WyVBD+6xBeG81oRmEjVENzdkGGWAy1JlPn5oiMjOEBgsizK
   dK6ppjcdCfCbtgGjbMPn6c2/1hBklZyqEvgvvn5tDRIo2lj2pgDNA9UYA
   O0pp+1372y7PQpyhMJaTO4U3Lj9xul139z2iGng+0WtKYJKJ+YWXrxGGv
   JUhdsOWwBx9uM3EGuI9GH0+6kv2DpPOdDiDdKqjuvrXOJA8X+rsYXmW0E
   a+p7AHYMc7wfAkso3KLJFDdXbNh9LfjVRLll9QN3T7k9po+pmXs9kHJqi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384281008"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="384281008"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="1018200381"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="1018200381"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 03:58:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAU4P-0008vc-2r;
	Tue, 05 Dec 2023 11:58:33 +0000
Date: Tue, 5 Dec 2023 19:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:x86/kvm 11/11] arch/x86/kvm/emulate.o: warning:
 objtool: fastop+0x169: missing int3 after indirect jump
Message-ID: <202312051947.9sPdeEW4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/kvm/emulate.o: warning: objtool: fastop+0x169: missing int3 after indirect jump"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: bd8e1c4c02ac085925674bddccb989e2d7d6cc2d [11/11] x86/kvm/emulate: Avoid RET for fastops
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-r112-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051947.9sPdeEW4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051947.9sPdeEW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312051947.9sPdeEW4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/emulate.o: warning: objtool: fastop+0x169: missing int3 after indirect jump

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
