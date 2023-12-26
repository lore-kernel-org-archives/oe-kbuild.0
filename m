Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E8A4E603
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Dec 2023 11:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZpO4bp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703591937; x=1735127937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1Fp1hDr2VqhiU4NU3eFVcMcxiqYbSL5O+1omhMhUM0=;
  b=OZpO4bp1BCXKMQEKfYhVZOOkCD70CigmAjlbja1DKU4LpfWQGr89O5Wc
   eNtXldb7IIgDAXLvWFY0KhUs3yVF9xXDvjeQeJQH8x+JhsF2oCYCWHJKq
   YIy+dzyXNq3ku/pqoBvQrxjjEwVzuoC6W2cHzNTIkOHoLvtn3fp53VoJR
   XLX2duRY7tOE+8eiCbQgbStRCxQxa9BmctklA40Cll3KkrNykSURKtTND
   zjw95p2enkRdK08mZ6/C/OtG3x0Hfndqy0wO0Ba2rR0T2bzFcISDV+z1j
   PeVFH9fU667EDzrrvNvCA6kkfeTEv1UibfKQ2HZCMj6szsm6bkG2JCViv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3638022"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; 
   d="scan'208";a="3638022"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 03:58:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="1109357739"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; 
   d="scan'208";a="1109357739"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Dec 2023 03:58:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rI63m-000ERV-1z;
	Tue, 26 Dec 2023 11:58:29 +0000
Date: Tue, 26 Dec 2023 19:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: scripts/kernel-doc: drivers/dma/ep93xx_dma.c:217: warning: Excess
 struct member 'channels' description in 'ep93xx_dma_engine'
Message-ID: <202312261908.uT4Ez93Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "kernel-doc warning due to __counted_by"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbafc3e621c3f4ded43720fdb1d6ce1728ec664e
commit: 74d885711c2f619e92f41ef308691948cc63f224 dmaengine: ep93xx_dma: Annotate struct ep93xx_dma_engine with __counted_by
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-001-20231215 (https://download.01.org/0day-ci/archive/20231226/202312261908.uT4Ez93Z-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312261908.uT4Ez93Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312261908.uT4Ez93Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: drivers/dma/ep93xx_dma.c:217: warning: Excess struct member 'channels' description in 'ep93xx_dma_engine'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
