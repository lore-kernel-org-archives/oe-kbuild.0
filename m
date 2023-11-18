Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04FBD281
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Nov 2023 05:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0VM1kLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700284120; x=1731820120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zyrjeK6lmiNz9pvLyRw0uPspd3XJUdEARdN6PEPNHUg=;
  b=V0VM1kLX1nvQIhkd3dIdAQ+ifLG+6p33ZnSJ/h8+XPsa5FhIdtXlH4Au
   Z65+Ah8gOdh3zaVr52qnTcppadpIEPV4sUegZEQT8tKoZTcgcoog87u6p
   6dCc91Dxrb/MtUCknCALWZHxju/SI8hoLyUdqn2b992qCQyniWVcdIyUS
   zpyrDlYe3VfajDwblHq2FSHAeudJruoYhYjxrL2v/htr5pEwAFKF9Uod0
   e499yk1mQAe9v38iF7Om5hVttf3k5YUnLKNhrO+OOINpuBi07aauecd9F
   aGv66zBqIaWVyMCH9GDUOFPCMUb5kYB5mkZ9qXxknqkia8IBVZtezXClv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="10067476"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="10067476"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 21:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="795003067"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="795003067"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Nov 2023 21:08:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4DZM-0003XX-0b;
	Sat, 18 Nov 2023 05:08:36 +0000
Date: Sat, 18 Nov 2023 13:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol
 'sifive_uart_pm_ops' was not declared. Should it be static?
Message-ID: <202311181331.plZZfg1n-lkp@intel.com>
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
head:   791c8ab095f71327899023223940dd52257a4173
commit: 8a6498f2b94333f1793bc912b11830655f975470 serial: sifive: Add suspend and resume operations
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-x001-20230717 (https://download.01.org/0day-ci/archive/20231118/202311181331.plZZfg1n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181331.plZZfg1n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311181331.plZZfg1n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol 'sifive_uart_pm_ops' was not declared. Should it be static?

vim +/sifive_uart_pm_ops +1036 drivers/tty/serial/sifive.c

8a6498f2b94333 Nick Hu 2023-08-15  1035  
8a6498f2b94333 Nick Hu 2023-08-15 @1036  DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
8a6498f2b94333 Nick Hu 2023-08-15  1037  			 sifive_serial_resume);
8a6498f2b94333 Nick Hu 2023-08-15  1038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
