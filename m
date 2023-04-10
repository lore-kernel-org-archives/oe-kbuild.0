Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E62923D0
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Apr 2023 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681169793; x=1712705793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/0OsGz6ieSLVXtueT/ZQhP3SewemqF62Ir4sgLjko8=;
  b=j/XTd1pK/bM+So0avV/3e6rwNLocuhaXSo3eq6cV6J4nwfMUIzhrdcps
   BUCmZEfnWB0bVufeSX2htiLL4QRF6S04SvCYia+ETRFw+mM0Gy1GvXaE0
   B8GUy0hwBS39e2dAEui8BS5cdki7yLC3p1MWTGeiB/VC3U8wsX9t6yHnw
   /QueFsbwW//tzAHs7iVkOWaoog0x8OXjdLVrMCKQIYYL5cEWNGHIcEgj8
   BFrugjfeh/sbdWARCqelAhQAEHdyahkYkqL9M7yfYLOC8DWBnhEvEQu85
   guFuJ1hUvmXvKzUvB1JVhPSKAGiDjOx3rlyhRHTWlcKXZoJtE43CMHBoW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371323625"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="371323625"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 16:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="681876429"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="681876429"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Apr 2023 16:35:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm130-000VjB-33;
	Mon, 10 Apr 2023 23:35:42 +0000
Date: Tue, 11 Apr 2023 07:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/endpoint/functions/pci-epf-vntb.c:891
 epf_ntb_mw1_store() warn: potential spectre issue 'ntb->mws_size' [w]
Message-ID: <202304110745.XZCSpFaC-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Jon Mason <jdmason@kudzu.us>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d3eb744aed40ffce820cded61d7eac515199165
commit: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB transfer between RC and EP
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: arc-randconfig-m031-20230410 (https://download.01.org/0day-ci/archive/20230411/202304110745.XZCSpFaC-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304110745.XZCSpFaC-lkp@intel.com/

New smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:891 epf_ntb_mw1_store() warn: potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:893 epf_ntb_mw2_store() warn: potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:895 epf_ntb_mw3_store() warn: potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:897 epf_ntb_mw4_store() warn: potential spectre issue 'ntb->mws_size' [w]

Old smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:1316 epf_ntb_bind() warn: missing error code 'ret'

vim +891 drivers/pci/endpoint/functions/pci-epf-vntb.c

e35f56bb03304a Frank Li 2022-02-22  878  
e35f56bb03304a Frank Li 2022-02-22  879  EPF_NTB_R(spad_count)
e35f56bb03304a Frank Li 2022-02-22  880  EPF_NTB_W(spad_count)
e35f56bb03304a Frank Li 2022-02-22  881  EPF_NTB_R(db_count)
e35f56bb03304a Frank Li 2022-02-22  882  EPF_NTB_W(db_count)
e35f56bb03304a Frank Li 2022-02-22  883  EPF_NTB_R(num_mws)
e35f56bb03304a Frank Li 2022-02-22  884  EPF_NTB_R(vbus_number)
e35f56bb03304a Frank Li 2022-02-22  885  EPF_NTB_W(vbus_number)
e35f56bb03304a Frank Li 2022-02-22  886  EPF_NTB_R(vntb_pid)
e35f56bb03304a Frank Li 2022-02-22  887  EPF_NTB_W(vntb_pid)
e35f56bb03304a Frank Li 2022-02-22  888  EPF_NTB_R(vntb_vid)
e35f56bb03304a Frank Li 2022-02-22  889  EPF_NTB_W(vntb_vid)
e35f56bb03304a Frank Li 2022-02-22  890  EPF_NTB_MW_R(mw1)
e35f56bb03304a Frank Li 2022-02-22 @891  EPF_NTB_MW_W(mw1)
e35f56bb03304a Frank Li 2022-02-22  892  EPF_NTB_MW_R(mw2)
e35f56bb03304a Frank Li 2022-02-22 @893  EPF_NTB_MW_W(mw2)
e35f56bb03304a Frank Li 2022-02-22  894  EPF_NTB_MW_R(mw3)
e35f56bb03304a Frank Li 2022-02-22 @895  EPF_NTB_MW_W(mw3)
e35f56bb03304a Frank Li 2022-02-22  896  EPF_NTB_MW_R(mw4)
e35f56bb03304a Frank Li 2022-02-22 @897  EPF_NTB_MW_W(mw4)
e35f56bb03304a Frank Li 2022-02-22  898  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
