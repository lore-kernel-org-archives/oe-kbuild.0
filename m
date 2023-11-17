Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE745960
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 20:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JS+mIDeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700252678; x=1731788678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zb2LHF0eOzDOr+fZKJL8gsFX/DTgNegk0xh1g2lZq78=;
  b=JS+mIDeqdDQlCAcw4cqE+8p6ukc2TgjK+QSMBLoQXXRhF60LBsnWeXu4
   VVxcQZ4sRNC8ZZ1rwK4IwZwy49u0ptF0uqyu4DMWYLTUjQfR1F8UU72Ea
   XWkKict+ThqUqE/3i1JG34s53eU+ufa8YEmqRG5ht5Ku/JI7hFK+X2OpN
   8TIzM87B3u/qGntEG6BMvYqH5txjaSQD+jy8pWj+5s10rFtbmXTYhC2g0
   Epa3PLq8j2uHjnhVipWo67qh4p0uAy2FO4tmluUeX1wg9v2uW0piV4GnS
   Uf2R3yQBxZ9p1fa6MAA36sVgPmzLgNuFUtnxGoIhN+2oLPe/aouxvJHCD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4448327"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4448327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 12:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="759257246"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="759257246"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Nov 2023 12:24:35 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r45OD-00037H-02;
	Fri, 17 Nov 2023 20:24:33 +0000
Date: Sat, 18 Nov 2023 04:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol
 'sifive_uart_pm_ops' was not declared. Should it be static?
Message-ID: <202311180450.rNw8b0oN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nick Hu <nick.hu@sifive.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Ben Dooks <ben.dooks@codethink.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc40e44f1ddef16a787f3501b97f1fff909177c
commit: 8a6498f2b94333f1793bc912b11830655f975470 serial: sifive: Add suspend and resume operations
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: sparc-randconfig-r021-20230427 (https://download.01.org/0day-ci/archive/20231118/202311180450.rNw8b0oN-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311180450.rNw8b0oN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311180450.rNw8b0oN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol 'sifive_uart_pm_ops' was not declared. Should it be static?
   drivers/tty/serial/sifive.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +/sifive_uart_pm_ops +1036 drivers/tty/serial/sifive.c

8a6498f2b94333 Nick Hu 2023-08-15  1035  
8a6498f2b94333 Nick Hu 2023-08-15 @1036  DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
8a6498f2b94333 Nick Hu 2023-08-15  1037  			 sifive_serial_resume);
8a6498f2b94333 Nick Hu 2023-08-15  1038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
