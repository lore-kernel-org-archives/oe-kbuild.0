Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB159654
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Sep 2023 03:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695527799; x=1727063799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ok3j48yHZ/D8EowZt11SgaQqJCw93WMEWpnyaDZ0KHM=;
  b=mmf6F++qSqHFkluI3gir0U0RA8HMIAWkrSPQsIAw6IKjYniLgL02ywXq
   tE7bEawYarT+8eD+N2fIkSs6WMISujM33GPKWLqQTVD8sgi18sdH1/RWj
   S/6gpazZQszxnXSippeygquqas3ghYCi49Fm6wSJtUpZszQIB7RQzT5CQ
   EPJzcl3t99DgpL8m4YDtJqSpY4GmFXY44GLCjqCI0TJytK8bnQ0EHrLMi
   oNV5PaW7uwxl+w6vlhGcQi01X0k4D2JFNoG9Z3kZYLtNDKiomx3UYyvCP
   49BzFIIGeLOuy/UBgJ/TxzQVgrwFdUUWR6HO2pa70bZPMByxcUYhK7in/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="447553743"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="447553743"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 20:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="783081973"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="783081973"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Sep 2023 20:56:38 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkGES-0003CX-2w;
	Sun, 24 Sep 2023 03:56:33 +0000
Date: Sun, 24 Sep 2023 11:55:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 05/18] EDAC/synopsys: Add DDRC basic parameters
 infrastructure
Message-ID: <202309241117.1QIu7Ipb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230920192806.29960-6-fancer.lancer@gmail.com>
References: <20230920192806.29960-6-fancer.lancer@gmail.com>
TO: Serge Semin <fancer.lancer@gmail.com>
TO: Michal Simek <monstr@monstr.eu>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Tony Luck <tony.luck@intel.com>
TO: James Morse <james.morse@arm.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Robert Richter <rric@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
CC: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-edac@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Serge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ras/edac-for-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[cannot apply to xilinx-xlnx/master bp/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/EDAC-synopsys-Convert-sysfs-nodes-to-debugfs-ones/20230921-035302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git edac-for-next
patch link:    https://lore.kernel.org/r/20230920192806.29960-6-fancer.lancer%40gmail.com
patch subject: [PATCH v4 05/18] EDAC/synopsys: Add DDRC basic parameters infrastructure
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-003-20230924 (https://download.01.org/0day-ci/archive/20230924/202309241117.1QIu7Ipb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241117.1QIu7Ipb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309241117.1QIu7Ipb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/synopsys_edac.c:224: warning: Enum value 'SNPS_DQ_32' not described in enum 'snps_dq_width'
>> drivers/edac/synopsys_edac.c:224: warning: Enum value 'SNPS_DQ_64' not described in enum 'snps_dq_width'


vim +224 drivers/edac/synopsys_edac.c

c85ef1323d2330 Serge Semin 2023-09-20  215  
9e617225f1d8ba Serge Semin 2023-09-20  216  /**
9e617225f1d8ba Serge Semin 2023-09-20  217   * enum snps_dq_width - SDRAM DQ bus width (ECC capable).
9e617225f1d8ba Serge Semin 2023-09-20  218   * SNPS_DQ_32:	32-bit memory data width.
9e617225f1d8ba Serge Semin 2023-09-20  219   * SNPS_DQ_64:	64-bit memory data width.
9e617225f1d8ba Serge Semin 2023-09-20  220   */
9e617225f1d8ba Serge Semin 2023-09-20  221  enum snps_dq_width {
9e617225f1d8ba Serge Semin 2023-09-20  222  	SNPS_DQ_32 = 2,
9e617225f1d8ba Serge Semin 2023-09-20  223  	SNPS_DQ_64 = 3,
9e617225f1d8ba Serge Semin 2023-09-20 @224  };
9e617225f1d8ba Serge Semin 2023-09-20  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
