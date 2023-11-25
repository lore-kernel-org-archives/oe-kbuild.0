Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3566A1EB29
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 20:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJeO+aAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700945563; x=1732481563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W2aH5kMyFx9U+hXK8tI78BorBqwqWto5pSa+GrMzVEQ=;
  b=UJeO+aALoUJfmiiQPw/sOGsQLPsDSeWRwzdo1nqZv3UPuGz3gukBcpDY
   rywgdyitJKjPC46q77Jy/YQDwAxidPqx3TWNtDRc5e6INs5bW02gFPusV
   mysfZaTbY7WKLU/wF3BzIGXVcTu0iQXMe4lT0HVyY7ZY0g2HUQKQmja51
   v75L89LYBYsVSJTitdHXTcdgx4JviBjXnZEzqZ6UYQ9sT0FwgloCnynV7
   hX7T9Y3Ioh/1niF2RoFDuxhuoVpu60pKspYnL8mE4VwVg8/YtelDa4rG5
   fspaSTWSh1Bc+9f9WNZlfPR4HYwMD24APRwLNqXRdrsufko3MReuB7XpY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="456865797"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="456865797"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 12:52:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="761253503"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="761253503"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Nov 2023 12:52:42 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6zdo-0004QA-0X;
	Sat, 25 Nov 2023 20:52:40 +0000
Date: Sun, 26 Nov 2023 04:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/spmi/spmi-pmic-arb.c:215: warning: No description found for
 parameter 'pmic_arb'
Message-ID: <202311260405.YL0cVHtZ-lkp@intel.com>
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
TO: Kiran Gunda <kgunda@codeaurora.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Stephen Boyd <sboyd@codeaurora.org>

Hi Kiran,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f5cc96c367f2e780eb492cc9cab84e3b2ca88da
commit: 02abec3616c1b2027efc7e08abf7fc0d2436a837 spmi: pmic-arb: rename pa_xx to pmic_arb_xx and other cleanup
date:   6 years ago
:::::: branch date: 25 hours ago
:::::: commit date: 6 years ago
config: arm-randconfig-001-20231123 (https://download.01.org/0day-ci/archive/20231126/202311260405.YL0cVHtZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260405.YL0cVHtZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311260405.YL0cVHtZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spmi/spmi-pmic-arb.c: In function 'pmic_arb_write_cmd':
   drivers/spmi/spmi-pmic-arb.c:399:15: warning: comparison is always true due to limited range of data type [-Wtype-limits]
     else if (opc >= 0x00 && opc <= 0x0F)
                  ^~
   drivers/spmi/spmi-pmic-arb.c:137: warning: cannot understand function prototype: 'struct spmi_pmic_arb '
   drivers/spmi/spmi-pmic-arb.c:179: warning: cannot understand function prototype: 'struct pmic_arb_ver_ops '
>> drivers/spmi/spmi-pmic-arb.c:215: warning: No description found for parameter 'pmic_arb'
   drivers/spmi/spmi-pmic-arb.c:229: warning: No description found for parameter 'pmic_arb'


vim +/pmic_arb +215 drivers/spmi/spmi-pmic-arb.c

39ae93e3a31d0c Kenneth Heitke         2014-02-12  206  
39ae93e3a31d0c Kenneth Heitke         2014-02-12  207  /**
02abec3616c1b2 Kiran Gunda            2017-07-28  208   * pmic_arb_read_data: reads pmic-arb's register and copy 1..4 bytes to buf
39ae93e3a31d0c Kenneth Heitke         2014-02-12  209   * @bc:		byte count -1. range: 0..3
39ae93e3a31d0c Kenneth Heitke         2014-02-12  210   * @reg:	register's address
39ae93e3a31d0c Kenneth Heitke         2014-02-12  211   * @buf:	output parameter, length must be bc + 1
39ae93e3a31d0c Kenneth Heitke         2014-02-12  212   */
02abec3616c1b2 Kiran Gunda            2017-07-28  213  static void
02abec3616c1b2 Kiran Gunda            2017-07-28  214  pmic_arb_read_data(struct spmi_pmic_arb *pmic_arb, u8 *buf, u32 reg, u8 bc)
39ae93e3a31d0c Kenneth Heitke         2014-02-12 @215  {
02abec3616c1b2 Kiran Gunda            2017-07-28  216  	u32 data = __raw_readl(pmic_arb->rd_base + reg);
111a10bf3e53ae Abhijeet Dharmapurikar 2017-05-10  217  
39ae93e3a31d0c Kenneth Heitke         2014-02-12  218  	memcpy(buf, &data, (bc & 3) + 1);
39ae93e3a31d0c Kenneth Heitke         2014-02-12  219  }
39ae93e3a31d0c Kenneth Heitke         2014-02-12  220  

:::::: The code at line 215 was first introduced by commit
:::::: 39ae93e3a31d0c9ca99e35b754a9f3c6f1db2bee spmi: Add MSM PMIC Arbiter SPMI controller

:::::: TO: Kenneth Heitke <kheitke@codeaurora.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
