Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795298318;
	b=A7a4GXNT1NcjKOVo9RNul96v2INuxlskAz+LcBbfcIIz2YWS0NN8Gpp2ntAG/AsqG4ZV
	 y+a2stHHWK5r9yWG1rO+5uwV05suhAUq1Bh4NU8jkNThwuOMqqmH9XqINioWypocDPiKQ
	 j2MsK0YMEEG4v8IKe7FK6z+Kv4Mc/XnQHtnb2ptd+2jRWeNXg/t+QTYPpCqZKT0rr1bVc
	 nFIQs+Vy4wGOa0NFZU+Q11A8hMITTVV6fzhDgsBsqszP8hjCWTneoddmoC4tz5aEaAQJI
	 Kt19sYrjGqTd0PbI+LMHpfxsbJG5SB14ReXvIB0+umdkNqxoquub/o642KBAoaXi5aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298318;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=z3MmT1opXyQSQr2vX9FCXCA0WENYdPE+Jo+Hp6GCVvk=;
	b=zias12g/emVnCRYnMZvdnKx224jpxyN+nH1Nr4+CzdPWpEP9SwlIT8w9AhYTaScxIdh8
	 zZpGRx9sn2fVqTRHbXn39DRYjNgtC+bKTT5N7d8EGrKDKfsS3qtbGp2TxXmiWaLzijeUB
	 xyd8k1tRf8A6mvlGOBQHIiirYXYxN4vkW6OVURFsaU0SRBKPRXQIaw2qFXxIbaRWhi7j8
	 Ha4u9+X4n19ibGokZQp0R5UYADcY5XPz6mrAsmZNAVtgjSYz0h1/5LU+NrKXsvF4S51+s
	 zFwa3C7jiDUM/mNJGCgChtZ06VMnJ4Zj/wWKKu8Hp/ms7HR6u5ChjTS70j0CNfgfidA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g5XhfAEo;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09285606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 21:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09285606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g5XhfAEo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795298317; x=1826834317;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=89wNnIOVr+VE7kY5NkE9HgDynxRK+iAWyuiKLUUuUVM=;
  b=g5XhfAEopWNBqH+n8eqY6O1bZBRFRNFKYV/RRBzeE89CqL/vNc6ZevgC
   bz7mIVV4pmq6MM8jSv/vQB9WH7agsnMD8QzGfty6YJ8DA49YuEyfy0MZ5
   57NZlbxzcmFf9wtiiTk+dzYuROPvu/S6CBjEIiZkj6G4Xfv7nbj8OCbb2
   O6zxanLvJWPPGF87QIoiz9+V9Gk7h8CfIj9T3tpNTlMzTgbGpanwPpUES
   NroFJ4BKMsO4BYJFXQb/YiQrzS6l00GaSczop2iko700Ho9P1OyXoyoIk
   9LcdeZIScUTvqzp9xQdsXbMTT4sYIp7TNCiTkgrgmc8ylQCLif0WhBAAl
   Q==;
X-CSE-ConnectionGUID: vabfet6dRMO4M1ar8ErRUQ==
X-CSE-MsgGUID: W/O91ci9T0arrazEV/vOEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4032133"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4032133"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 13:58:37 -0800
X-CSE-ConnectionGUID: 3n1W6SsCS7OPyAhD6qlT1g==
X-CSE-MsgGUID: 9zlU2AnpSfytxJZPuKEoIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11297050"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2026 13:58:35 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUt6P-00000001Kdv-0KHO;
	Sat, 21 Nov 2026 21:58:33 +0000
Date: Sun, 22 Nov 2026 05:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 2/4] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
Message-ID: <202611220552.KR6kEq64-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261114-shutdown-v9-2-5430c9f242ed@oss.qualcomm.com>
References: <20261114-shutdown-v9-2-5430c9f242ed@oss.qualcomm.com>
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
CC: konrad.dybcio@oss.qualcomm.com
CC: linux-pci@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6633c535abc356ff868e72025ecd65aa0106630d]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-host-common-Fix-early-bus-walk-exit-in-d3cold_possible/20261114-073051
base:   6633c535abc356ff868e72025ecd65aa0106630d
patch link:    https://lore.kernel.org/r/20261114-shutdown-v9-2-5430c9f242ed%40oss.qualcomm.com
patch subject: [PATCH v9 2/4] PCI: dwc: Force L2 link entry on shutdown/reboot without D3cold check
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20261122/202611220552.KR6kEq64-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611220552.KR6kEq64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611220552.KR6kEq64-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-dw-rockchip.c: In function 'rockchip_pcie_suspend':
>> drivers/pci/controller/dwc/pcie-dw-rockchip.c:1050:15: error: too few arguments to function 'dw_pcie_suspend_noirq'; expected 2, have 1
    1050 |         ret = dw_pcie_suspend_noirq(pci);
         |               ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/controller/dwc/pcie-dw-rockchip.c:31:
   drivers/pci/controller/dwc/pcie-designware.h:905:5: note: declared here
     905 | int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force);
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/dw_pcie_suspend_noirq +1050 drivers/pci/controller/dwc/pcie-dw-rockchip.c

b376b3ff9cb052 Wilfred Mallawa   2026-07-27  1040  
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1041  static int rockchip_pcie_suspend(struct device *dev)
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1042  {
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1043  	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1044  	struct dw_pcie *pci = &rockchip->pci;
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1045  	int ret;
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1046  
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1047  	if (rockchip->data->mode == DW_PCIE_EP_TYPE)
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1048  		return 0;
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1049  
58c58ac2a3fab4 Sebastian Reichel 2026-11-05 @1050  	ret = dw_pcie_suspend_noirq(pci);
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1051  	if (ret)
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1052  		return ret;
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1053  
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1054  	rockchip->intx = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_MASK_LEGACY);
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1055  	rockchip->intx &= PCIE_INTR_MASK;
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1056  
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1057  	gpiod_set_value_cansleep(rockchip->rst_gpio, 0);
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1058  	rockchip_pcie_phy_deinit(rockchip);
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1059  	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1060  	reset_control_assert(rockchip->rst);
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1061  	if (rockchip->vpcie3v3)
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1062  		regulator_disable(rockchip->vpcie3v3);
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1063  
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1064  	return 0;
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1065  }
58c58ac2a3fab4 Sebastian Reichel 2026-11-05  1066  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
