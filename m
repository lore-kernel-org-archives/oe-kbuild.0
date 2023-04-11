Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91E417E3
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Apr 2023 03:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681182111; x=1712718111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WO/qIMqw9W1izI5U4qF63aqBPOmzV9G9SAmUM46A0Y8=;
  b=ftzMI84oeaK+E/JJfrqRy0RAfqZIlkEqyIQa4HuNeV9oaLmEdt+jPZnA
   t9SvKIzuH3BRQij3r0TY9atVosR2aviBsQ0b/gHRbidHVYwVocsJVNCRd
   yVL07LymzMNcSHv0Gm8QhRt76zHjYip5MpBRkyEzmzSqcDHdILVSLKpsv
   OKkBxManWNlLqiIbcrQq1h4e2ngp7hQpyn7QO6TU4T6Boj16f3UTg4e65
   Clza+H4a/YBxLVrLm9+vXZPdqHtAalvGYd6I6fjpNTjQnOLlQ7yxr+z/C
   +U+8WftDQWel6IxVXdetjCfJZXRo+vMq4cEV7MyJM7Mw8kX8ueiI9xMMJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="341000155"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="341000155"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 20:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752981940"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="752981940"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Apr 2023 20:01:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm4GT-000Vrl-1W;
	Tue, 11 Apr 2023 03:01:49 +0000
Date: Tue, 11 Apr 2023 11:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/endpoint/functions/pci-epf-vntb.c:907 epf_ntb_mw1_show()
 warn: potential spectre issue 'ntb->mws_size' [r]
Message-ID: <202304111031.Pl3WRLuU-lkp@intel.com>
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
TO: Dan Carpenter <error27@gmail.com>
CC: Jon Mason <jdmason@kudzu.us>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d3eb744aed40ffce820cded61d7eac515199165
commit: b8c0aa9b16bb2f4d5966b87fbf1f36f3280e1f60 NTB: EPF: Tidy up some bounds checks
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: arc-randconfig-m031-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111031.Pl3WRLuU-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304111031.Pl3WRLuU-lkp@intel.com/

New smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:907 epf_ntb_mw1_show() warn: potential spectre issue 'ntb->mws_size' [r]
drivers/pci/endpoint/functions/pci-epf-vntb.c:909 epf_ntb_mw2_show() warn: potential spectre issue 'ntb->mws_size' [r]
drivers/pci/endpoint/functions/pci-epf-vntb.c:911 epf_ntb_mw3_show() warn: potential spectre issue 'ntb->mws_size' [r]
drivers/pci/endpoint/functions/pci-epf-vntb.c:913 epf_ntb_mw4_show() warn: potential spectre issue 'ntb->mws_size' [r]

Old smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:908 epf_ntb_mw1_store() warn: potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:910 epf_ntb_mw2_store() warn: potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:912 epf_ntb_mw3_store() warn: potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:914 epf_ntb_mw4_store() warn: potential spectre issue 'ntb->mws_size' [w]

vim +907 drivers/pci/endpoint/functions/pci-epf-vntb.c

e35f56bb03304a Frank Li 2022-02-22  895  
e35f56bb03304a Frank Li 2022-02-22  896  EPF_NTB_R(spad_count)
e35f56bb03304a Frank Li 2022-02-22  897  EPF_NTB_W(spad_count)
e35f56bb03304a Frank Li 2022-02-22  898  EPF_NTB_R(db_count)
e35f56bb03304a Frank Li 2022-02-22  899  EPF_NTB_W(db_count)
e35f56bb03304a Frank Li 2022-02-22  900  EPF_NTB_R(num_mws)
e35f56bb03304a Frank Li 2022-02-22  901  EPF_NTB_R(vbus_number)
e35f56bb03304a Frank Li 2022-02-22  902  EPF_NTB_W(vbus_number)
e35f56bb03304a Frank Li 2022-02-22  903  EPF_NTB_R(vntb_pid)
e35f56bb03304a Frank Li 2022-02-22  904  EPF_NTB_W(vntb_pid)
e35f56bb03304a Frank Li 2022-02-22  905  EPF_NTB_R(vntb_vid)
e35f56bb03304a Frank Li 2022-02-22  906  EPF_NTB_W(vntb_vid)
e35f56bb03304a Frank Li 2022-02-22 @907  EPF_NTB_MW_R(mw1)
e35f56bb03304a Frank Li 2022-02-22  908  EPF_NTB_MW_W(mw1)
e35f56bb03304a Frank Li 2022-02-22 @909  EPF_NTB_MW_R(mw2)
e35f56bb03304a Frank Li 2022-02-22  910  EPF_NTB_MW_W(mw2)
e35f56bb03304a Frank Li 2022-02-22 @911  EPF_NTB_MW_R(mw3)
e35f56bb03304a Frank Li 2022-02-22  912  EPF_NTB_MW_W(mw3)
e35f56bb03304a Frank Li 2022-02-22 @913  EPF_NTB_MW_R(mw4)
e35f56bb03304a Frank Li 2022-02-22  914  EPF_NTB_MW_W(mw4)
e35f56bb03304a Frank Li 2022-02-22  915  

:::::: The code at line 907 was first introduced by commit
:::::: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB transfer between RC and EP

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
