Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4402D31A6D
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 16:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUUs8qpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701360578; x=1732896578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3m6I9R43MDaW0by/zExGJ0k7cjh8ZlOSKOL6ukxtW8=;
  b=MUUs8qpPNjtjLRZPgPaI7TKhjjf8iCFvkEnPmis0aP2YsaHw5JJk6/bf
   dHwup1KqHHb+2xffh0qyVhri5oI0LhLzjVMEvCO7Pi4KWORDcQTaeNGQo
   RaE9kL/Q8Ysu751OdqBljeP5dcg0X5g5olU4aRm7VFRhQfFahjMwyOC5M
   ZJahWFwv9xS2iHllWX5gY+YXJOpIIeFjiiJlGysR14VX4ezBjaAKWCvfv
   ccnu14cJi33qYf7CbI1aIFbLk/LPWVDw86jS0um4ZUiSMFaHCGPLPmlIJ
   ysLbxMgTTLI/2UStQRvORcQLpmCwj7gxCxQRBh9vRFFQw95nR3cIr2rO7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12053460"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="12053460"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:07:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769356403"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="769356403"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Nov 2023 08:05:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8jXd-0002IS-0U;
	Thu, 30 Nov 2023 16:05:29 +0000
Date: Fri, 1 Dec 2023 00:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 28/195] /tmp/ccgKfL8Q.s:158: Error: selected
 processor does not support requested special purpose register -- `mrs
 r2,cpsr'
Message-ID: <202311302356.M2DUyJ6D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: Manual check reason: "low confidence static check first_new_problem: /tmp/ccgKfL8Q.s:158: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ignat Korchagin <ignat@cloudflare.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   213725670d54f6e780039eb2c911430adb036b1b
commit: 16ebda3b629b084cc40b09ad5fa36d99966a1e9a [28/195] kexec: drop dependency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm-randconfig-r131-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302356.M2DUyJ6D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311302356.M2DUyJ6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311302356.M2DUyJ6D-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccgKfL8Q.s: Assembler messages:
>> /tmp/ccgKfL8Q.s:158: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
