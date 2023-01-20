Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C42ABD21
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jan 2023 05:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674192103; x=1705728103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7iDEPPlr74UYVErOxwrMrLRFPzqUAEOnZUfQX2YGUpE=;
  b=PEk0nj0oegHYJUV1HoY9xdXkBJabiJ7ZnvqrCCH0Gpdw1XTk+Wdvl1vu
   hL1KoG2W15yXlq81xOy4G7iRg3+dsB5zCaD9hksc6gV1GX11x5Jsa/+w8
   3DJcreJtYTqUvkKrg/MiPcIzjXxXDn3LNQ1QvfpMV4SF1WUDABYPoq+Ky
   VKpquqeb6w2EKiOt36NpwTQsfEkhCsQ1HH2Zfdoq+yU7w5FNegy0x4Q+R
   RGHftQ7IjwcSafzZMmSrf8wWr0982OVb7QYOqO5R1eynWVi9NkGVuze9B
   PbbYBssxEXVtLCIpvJ7M9HAhpJwQ/8qVuoWK5ZrYqhiwRfj/LlTiZnflQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="309086140"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="309086140"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 21:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="638040472"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="638040472"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Jan 2023 21:21:41 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIjqO-0002DC-1Y;
	Fri, 20 Jan 2023 05:21:40 +0000
Date: Fri, 20 Jan 2023 13:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/controller/dwc/pcie-bt1.c:611 bt1_pcie_probe() warn:
 passing a valid pointer to 'PTR_ERR'
Message-ID: <202301201344.eQM9kK3y-lkp@intel.com>
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
TO: Lukas Bulwahn <lukas.bulwahn@gmail.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>

Hi Lukas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d368967cb1039b5c4cccb62b5a4b9468c50cd143
commit: 760d560f71c828a97c77596af5c3f9978aefd9d1 PCI: dwc: Adjust to recent removal of PCI_MSI_IRQ_DOMAIN
date:   2 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 2 weeks ago
config: csky-randconfig-m041-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201344.eQM9kK3y-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/pci/controller/dwc/pcie-bt1.c:611 bt1_pcie_probe() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +611 drivers/pci/controller/dwc/pcie-bt1.c

ba6ed462dcf41a Serge Semin 2022-11-13  604  
ba6ed462dcf41a Serge Semin 2022-11-13  605  static int bt1_pcie_probe(struct platform_device *pdev)
ba6ed462dcf41a Serge Semin 2022-11-13  606  {
ba6ed462dcf41a Serge Semin 2022-11-13  607  	struct bt1_pcie *btpci;
ba6ed462dcf41a Serge Semin 2022-11-13  608  
ba6ed462dcf41a Serge Semin 2022-11-13  609  	btpci = bt1_pcie_create_data(pdev);
ba6ed462dcf41a Serge Semin 2022-11-13  610  	if (IS_ERR(btpci))
ba6ed462dcf41a Serge Semin 2022-11-13 @611  		return PTR_ERR(btpci);
ba6ed462dcf41a Serge Semin 2022-11-13  612  
ba6ed462dcf41a Serge Semin 2022-11-13  613  	return bt1_pcie_add_port(btpci);
ba6ed462dcf41a Serge Semin 2022-11-13  614  }
ba6ed462dcf41a Serge Semin 2022-11-13  615  

:::::: The code at line 611 was first introduced by commit
:::::: ba6ed462dcf41a83b36eb9a74a8c4720040f9762 PCI: dwc: Add Baikal-T1 PCIe controller support

:::::: TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
:::::: CC: Lorenzo Pieralisi <lpieralisi@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
