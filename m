Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2789124A1F
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jU+GjmrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701695338; x=1733231338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbXLTokXPtkAnsTtTHCFZDVog6B7u2Cz6PfSiW32gRA=;
  b=jU+GjmrZAJpZF0nbou3M94+Zkjv5GIXbuQLDj9lIctdcO2BiTpRtT2w+
   FL2DAWZ2PPHtIj3TWRsD+m+GtBYa7dKCv5kU9s4GvSCT24qw+egUUVaol
   RvwSssdqYoGAiAzJuWQeDkhdZFtN7paJR+IniE+UUpzS2aF/gt0ia+LOg
   hiMR3E1p/TvE9aafaLBsVc0NRb5BbjSr63RUQmyIjapCsbwcJBk9ysxwp
   JtlJ68UYIJ8jnqcwtov6RBOo2O5BiDopqqM8T7aMNPvPW7SlqaMR56Ojz
   WoP1rxSmZ7TwDNnGLG1OBX0t3mMXRRLr/Mge5qwQPP17tRxS29B5C6K6g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="397616149"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="397616149"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 05:08:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="1102088962"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="1102088962"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Dec 2023 05:08:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rA8gt-0007kj-14;
	Mon, 04 Dec 2023 13:08:51 +0000
Date: Mon, 4 Dec 2023 21:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/aacraid/src.c:783:42: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202312042140.4QBHZJ9j-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   3 years, 3 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 3 years, 3 months ago
config: mips-randconfig-r132-20231116 (https://download.01.org/0day-ci/archive/20231204/202312042140.4QBHZJ9j-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312042140.4QBHZJ9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312042140.4QBHZJ9j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/aacraid/src.c:146:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/aacraid/src.c:146:34: sparse: sparse: cast to restricted __le32
   drivers/scsi/aacraid/src.c:503:54: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/aacraid/src.c:524:57: sparse: sparse: bad assignment (+=) to restricted __le32
   drivers/scsi/aacraid/src.c:531:57: sparse: sparse: bad assignment (+=) to restricted __le32
   drivers/scsi/aacraid/src.c:539:49: sparse: sparse: bad assignment (+=) to restricted __le32
   drivers/scsi/aacraid/src.c:542:55: sparse: sparse: bad assignment (+=) to restricted __le32
   drivers/scsi/aacraid/src.c:783:23: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/scsi/aacraid/src.c:783:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got char * @@
   drivers/scsi/aacraid/src.c:783:42: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/scsi/aacraid/src.c:783:42: sparse:     got char *
   drivers/scsi/aacraid/src.c:785:23: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/scsi/aacraid/src.c:785:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got char * @@
   drivers/scsi/aacraid/src.c:785:42: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/scsi/aacraid/src.c:785:42: sparse:     got char *

vim +783 drivers/scsi/aacraid/src.c

3136432956501f Raghava Aditya Renukunta 2017-02-02  777  
3136432956501f Raghava Aditya Renukunta 2017-02-02  778  static void aac_send_hardware_soft_reset(struct aac_dev *dev)
3136432956501f Raghava Aditya Renukunta 2017-02-02  779  {
3136432956501f Raghava Aditya Renukunta 2017-02-02  780  	u_int32_t val;
3136432956501f Raghava Aditya Renukunta 2017-02-02  781  
a5799d74d965c8 Raghava Aditya Renukunta 2018-02-07  782  	aac_clear_omr(dev);
3136432956501f Raghava Aditya Renukunta 2017-02-02 @783  	val = readl(((char *)(dev->base) + IBW_SWR_OFFSET));
3136432956501f Raghava Aditya Renukunta 2017-02-02  784  	val |= 0x01;
3136432956501f Raghava Aditya Renukunta 2017-02-02 @785  	writel(val, ((char *)(dev->base) + IBW_SWR_OFFSET));
3136432956501f Raghava Aditya Renukunta 2017-02-02  786  	msleep_interruptible(20000);
3136432956501f Raghava Aditya Renukunta 2017-02-02  787  }
3136432956501f Raghava Aditya Renukunta 2017-02-02  788  

:::::: The code at line 783 was first introduced by commit
:::::: 3136432956501f071891c3d4b6194feb2df924a5 scsi: aacraid: Added new IWBR reset

:::::: TO: Raghava Aditya Renukunta <RaghavaAditya.Renukunta@microsemi.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
