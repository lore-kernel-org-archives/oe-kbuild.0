Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763710F8
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Oct 2023 07:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696403704; x=1727939704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E1u7UeNKkg6PxeXe24Slc84fsX5PgFDGGcEpR1sOACA=;
  b=g/srLsmwLUeIgWy6aRO8bUfU9bcFsEfy25p70qjFtJWL5N4zaUHCZXmT
   Xbru4tD98JvYdwFZNqND1sGbsCsWZ7yCAbcYFqVV6ZaHbVGw+tHomKLvc
   6b4YvgMm6jjvCpRsjY5/m9F5xKveWoSae2WgW+Pk91sJAdWCQkF+pr7HJ
   5UslArTioN0Ulc8lXBnG7Qzy8Ns/YvCzELJxjAxAg/IXadllMzeNtpvTL
   43LLbH9e7cTZ2q5po0LzbVDhaA8+j5CJ1COKXJ+4lo7PZqJA4Tno/dyHY
   qJnkUWp1Tc2kfssk1cmYjoxGQaZHFjBNzY41qYJEwcw0KrYQTdNyrd+Ec
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449579959"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="449579959"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 00:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="874988565"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="874988565"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Oct 2023 00:15:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnw5z-000DeK-26;
	Wed, 04 Oct 2023 07:14:59 +0000
Date: Wed, 4 Oct 2023 15:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/ipr.c:9309 ipr_request_other_msi_irqs() error: buffer
 overflow 'ioa_cfg->hrrq' 16 <= s32max
Message-ID: <202310041502.lfjzm0TB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Brian King <brking@linux.vnet.ibm.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: John Garry <john.g.garry@oracle.com>

Hi Brian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbf3a2cb156a2c911d8f38d8247814b4c07f49a2
commit: 65a15d6560dff065339f6cac91de4beded60fe3f scsi: ipr: Remove SATA support
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20230925 (https://download.01.org/0day-ci/archive/20231004/202310041502.lfjzm0TB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231004/202310041502.lfjzm0TB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310041502.lfjzm0TB-lkp@intel.com/

smatch warnings:
drivers/scsi/ipr.c:9309 ipr_request_other_msi_irqs() error: buffer overflow 'ioa_cfg->hrrq' 16 <= s32max

vim +9309 drivers/scsi/ipr.c

05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9294  
a299ee62cf40d6 Christoph Hellwig           2016-09-11  9295  static int ipr_request_other_msi_irqs(struct ipr_ioa_cfg *ioa_cfg,
a299ee62cf40d6 Christoph Hellwig           2016-09-11  9296  		struct pci_dev *pdev)
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9297  {
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9298  	int i, rc;
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9299  
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9300  	for (i = 1; i < ioa_cfg->nvectors; i++) {
a299ee62cf40d6 Christoph Hellwig           2016-09-11  9301  		rc = request_irq(pci_irq_vector(pdev, i),
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9302  			ipr_isr_mhrrq,
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9303  			0,
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9304  			ioa_cfg->vectors_info[i].desc,
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9305  			&ioa_cfg->hrrq[i]);
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9306  		if (rc) {
d64c491911322a Chengguang Xu               2022-05-29  9307  			while (--i > 0)
a299ee62cf40d6 Christoph Hellwig           2016-09-11  9308  				free_irq(pci_irq_vector(pdev, i),
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11 @9309  					&ioa_cfg->hrrq[i]);
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9310  			return rc;
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9311  		}
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9312  	}
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9313  	return 0;
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9314  }
05a6538a9a2049 wenxiong@linux.vnet.ibm.com 2013-01-11  9315  

:::::: The code at line 9309 was first introduced by commit
:::::: 05a6538a9a204999e0c0f7faee00b81b334f4fc7 [SCSI] ipr: Add support for MSI-X and distributed completion

:::::: TO: wenxiong@linux.vnet.ibm.com <wenxiong@linux.vnet.ibm.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
