Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5337C126F3B
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 05:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773378557; cv=none; b=QYNGYO/hLVhSr1FS9LOWeZp/NGG3qs9LB3dqFZqNPNhxVBdfIOUyJ/DoDVrZsXqNL+fCU+dYpA3b766pCoyGNtyJLUdSWgFXqao7TKeJdOY+OJlokE9/SKSUsHG6jR8gSZy2M5u8fKhD9EOm/89ONsqGHj1S9EtLh8BokWolRpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773378557; c=relaxed/simple;
	bh=xQNOrPFaTY5flTwVcIVO9CY7B+ukHarvHWwAfkAXM+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oGCnQPJCWNiEtD8dM+nXbfN3MqkV8rGqRrDAfELBDfojxZX13+lfm7cgVxtCvmNfRa320Y+baf/7KyZHKqXOqZl23ZAL4BTWrghy3pY2MdlR90T4BDViAkun0zryfqMI2zZpthmhL2ew8TutB7Gqh9LhRSbP/qbE4EUYVPiTji4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQlcTvsh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQlcTvsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773378554; x=1804914554;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xQNOrPFaTY5flTwVcIVO9CY7B+ukHarvHWwAfkAXM+o=;
  b=RQlcTvshsDGN94VBSF0j3X6iZunHWYRLGbkgsWRym1mdaHn26dlqFfnY
   x8CYnyNjFOoHRr7bgmSrbaqAGskPQQgrxLSxkWj+OGu3gkLbgMd+SeFqz
   CfSj8yBcwH+EZlU/IMPP5FOhpgh59NtcNXJzNboyp1gDR7QEJZj9g/Jdo
   +6nRHzk7yD+uoki88u6HuL4mJ8Oy6uPrTqrk756jVce7IHs49kFmi9jYl
   oMWlM8g5t0UvcFPB9z4MBkmLnBJ0462E+UoJGfJV1Dirgn0I1aa8ytkOM
   RD/4SoU5KSXHJMapAh3/9QWZW7EyyGhQrSsuCV2bCIw0hBZ1mILDbjqTe
   g==;
X-CSE-ConnectionGUID: 0xLuXKHVToSk6RQjxGAKvA==
X-CSE-MsgGUID: EWgoUxIxTaCaempPHaKbEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85182860"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85182860"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 22:09:13 -0700
X-CSE-ConnectionGUID: R/J1M96UR1mjm7JAloh+ww==
X-CSE-MsgGUID: uVcdWN6yQkaLcl9aH4TWYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="225504886"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Mar 2026 22:09:13 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0ulq-000000003Ul-0lCk;
	Fri, 13 Mar 2026 05:09:10 +0000
Date: Fri, 13 Mar 2026 13:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] PCI: dwc: Add helper to Program T_POWER_ON
Message-ID: <202603131333.i5meIM3S-lkp@intel.com>
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
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260311-t_power_on_fux-v3-2-9b1f1d09c6f3@oss.qualcomm.com>
References: <20260311-t_power_on_fux-v3-2-9b1f1d09c6f3@oss.qualcomm.com>
TO: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Jingoo Han <jingoohan1@gmail.com>
CC: linux-pci@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: mayank.rana@oss.qualcomm.com
CC: quic_vbadigan@quicinc.com
CC: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-ASPM-Add-helper-to-encode-L1SS-T_POWER_ON-fields/20260311-204306
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260311-t_power_on_fux-v3-2-9b1f1d09c6f3%40oss.qualcomm.com
patch subject: [PATCH v3 2/3] PCI: dwc: Add helper to Program T_POWER_ON
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-123-20260312 (https://download.01.org/0day-ci/archive/20260313/202603131333.i5meIM3S-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603131333.i5meIM3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603131333.i5meIM3S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-designware.c:1272:2: error: call to '__compiletime_assert_506' declared with 'error' attribute: FIELD_MODIFY: value too large for the field
    1272 |         FIELD_MODIFY(PCI_L1SS_CAP_P_PWR_ON_SCALE, &val, scale);
         |         ^
   include/linux/bitfield.h:193:3: note: expanded from macro 'FIELD_MODIFY'
     193 |                 __BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");             \
         |                 ^
   include/linux/bitfield.h:85:3: note: expanded from macro '__BF_FIELD_CHECK'
      85 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
         |                 ^
   include/linux/bitfield.h:70:3: note: expanded from macro '__BF_FIELD_CHECK_MASK'
      70 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:694:2: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:687:4: note: expanded from macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:8:1: note: expanded from here
       8 | __compiletime_assert_506
         | ^
   1 error generated.


vim +1272 drivers/pci/controller/dwc/pcie-designware.c

a00bba406b5a68 Bjorn Helgaas             2025-11-18  1251  
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1252  /* TODO: Need to handle multi root ports */
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1253  void dw_pcie_program_t_power_on(struct dw_pcie *pci, u16 t_power_on)
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1254  {
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1255  	u8 scale, value;
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1256  	u16 offset;
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1257  	u32 val;
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1258  
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1259  	if (!t_power_on)
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1260  		return;
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1261  
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1262  	offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1263  	if (!offset)
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1264  		return;
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1265  
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1266  	pcie_encode_t_power_on(t_power_on, &scale, &value);
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1267  
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1268  	dw_pcie_dbi_ro_wr_en(pci);
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1269  
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1270  	val = readl(pci->dbi_base + offset + PCI_L1SS_CAP);
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1271  	val &= ~(PCI_L1SS_CAP_P_PWR_ON_SCALE | PCI_L1SS_CAP_P_PWR_ON_VALUE);
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11 @1272  	FIELD_MODIFY(PCI_L1SS_CAP_P_PWR_ON_SCALE, &val, scale);
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1273  	FIELD_MODIFY(PCI_L1SS_CAP_P_PWR_ON_VALUE, &val, value);
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1274  
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1275  	writel(val, pci->dbi_base + offset + PCI_L1SS_CAP);
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1276  
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1277  	dw_pcie_dbi_ro_wr_dis(pci);
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1278  }
f673f1087677d7 Krishna Chaitanya Chundru 2026-03-11  1279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
