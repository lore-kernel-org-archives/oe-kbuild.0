Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29A538E8A0
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314902; cv=none; b=Y19Q0Dy7eyLvyrBxZqzUlBAXnbuRRdgtGkGqiE7tTlQjGmDZrmh+YvwloYnqHFtCbzI1syyt9D/Qc5HNwOkDzDkehM+IDndPOEEbqNjQRPA5PFLPlyhhuYG/u1FC/0nf1Jw6dysbJQZzRf4503+k6URoVa32w85gVA06sNRi8VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314902; c=relaxed/simple;
	bh=4I2qKJVkg871CKslTKtT1+GUEFvER7mpRCAdsXaYFe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIEI2HlejpKgIkQRN3aLcyq+h1XfFLoodi40khxc3t7V/v3LzWKwpsGoahLmmsvRP0zAU/x1KhQeedTxBeTnORWpslKss6Q4cDZbLgVLOwj+HxnbN4iaVCRBju7wNI+wc2btDHNKwGxj4XvOypfosoxqQ+m3tXCKIZ7nUA7S4Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpWcg/nv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpWcg/nv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787314900; x=1818850900;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4I2qKJVkg871CKslTKtT1+GUEFvER7mpRCAdsXaYFe8=;
  b=VpWcg/nvKzdc5VM18HjOXi1TOI9sIE+PTmIuSoB7LqBzH+eZEGCFYt4d
   6DQx5ai/t6/5M+2rp4c04brs4U3keV9HR5Z7jOSxRnZ3tvDPOjqfoV1wA
   rFUuswM/c3kY1w1QDtb5pVGGT5XMULWW4y12AEHg6hH6V91KOBuegROsy
   b8448dxfn90HU91eXKiFfiWk0gKff8mE8k5sqXC8AjJSwXiXNHrNGpoPV
   Xj7AaGMkRAxQWX8UF4yaVabBLjz/JlHldCw1wWqx8PLM5Hs3Nar75u8My
   BkXNQDGFXUJpwWN2vK2pWvKP3RBYsPjWCzDrbLvhN1hTIr9i05PEoywf2
   g==;
X-CSE-ConnectionGUID: 6RJyiZGSSdKDKR1I/QGUag==
X-CSE-MsgGUID: BH+vuDXjSAK+1jBS4jX7MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="105242836"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="105242836"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 05:21:39 -0700
X-CSE-ConnectionGUID: g7i4hG6YRsSrZpbLioUMbw==
X-CSE-MsgGUID: 6ytNWt1HQiOp9+aQHIG4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="270149108"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2026 05:21:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxOFb-00000000ptt-2CX1;
	Fri, 21 Aug 2026 12:21:35 +0000
Date: Fri, 21 Aug 2026 20:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] PCI: qcom: Add register dump support for PCIe Link Down
 events
Message-ID: <202608212057.C8fsxFMt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260811-regdump-v1-1-f22db3fb37c2@oss.qualcomm.com>
References: <20260811-regdump-v1-1-f22db3fb37c2@oss.qualcomm.com>
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
CC: linux-pci@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d55d5a8f3d852baab49dba910dcb04b6d8091b05]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-qcom-Add-register-dump-support-for-PCIe-Link-Down-events/20260811-214223
base:   d55d5a8f3d852baab49dba910dcb04b6d8091b05
patch link:    https://lore.kernel.org/r/20260811-regdump-v1-1-f22db3fb37c2%40oss.qualcomm.com
patch subject: [PATCH] PCI: qcom: Add register dump support for PCIe Link Down events
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: mips-randconfig-r134-20260821 (https://download.01.org/0day-ci/archive/20260821/202608212057.C8fsxFMt-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608212057.C8fsxFMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608212057.C8fsxFMt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-qcom.c:220:18: warning: unused variable 'qcom_pcie_ext_parf_dump_regs' [-Wunused-const-variable]
     220 | static const u32 qcom_pcie_ext_parf_dump_regs[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/qcom_pcie_ext_parf_dump_regs +220 drivers/pci/controller/dwc/pcie-qcom.c

32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  219  
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11 @220  static const u32 qcom_pcie_ext_parf_dump_regs[] = {
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  221  	PARF_PM_STTS,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  222  	PARF_PM_STTS_1,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  223  	PARF_INT_ALL_STATUS,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  224  	PARF_INT_ALL_2_STATUS,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  225  	PARF_CLKREQ_OVERRIDE,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  226  	PARF_L1SS_SLEEP_MODE_HANDLER_STATUS,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  227  	PARF_L1SS_SLEEP_MODE_HANDLER_CFG,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  228  	PARF_CORE_ERRORS,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  229  	PARF_LINK_DOWN_AXI_ECAM_BLOCK_STATUS,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  230  	PARF_STATUS,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  231  	PARF_SYS_CTRL,
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  232  };
32f357630af28b2 Krishna Chaitanya Chundru 2026-08-11  233  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
