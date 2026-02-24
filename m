Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD3136351
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 00:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771893979; cv=none; b=XzUrCVTbV7YVoJb74JjCRMGbedOQ6/b/Z/d7YJrCZZQYecfjlhdPTkFuOIAkbzrmC6eBHhjEFjm0R8yhKhk16hbqMI8YJew4rZsMl6hKqXffW9KPJaSszqAqA8dZe4FWyBO9ZUffbci1HYUILByXQdlB1hoRwKzDsq6lFiXdCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771893979; c=relaxed/simple;
	bh=4jqnJGXoeTrn6cLabvkRtQfnL05YH7yrRWsqH7t8ze0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ib5jYMg5/rAoaqDWPdmzTSEQgGgbjU9yMhwVmgkIdZ4jYExZzGJkhUzPb7iZxcDsSKPIJN/+z12wQHXLd+oOAFqbZ/VKPfFZuH0Czl06YpjRGVD+Gv/ghTXRtw0OJklOa0tRUJb4hUZsURBVNlJGHzlQvffyDoTMFVRAYRnqvo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hp36RQDg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hp36RQDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771893976; x=1803429976;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4jqnJGXoeTrn6cLabvkRtQfnL05YH7yrRWsqH7t8ze0=;
  b=hp36RQDgzo/I1er+SSU3Mx2lO1hq1ZhDJRQqxEuzMzw1v0yyGOWEra0F
   RLPOid73UK84ez5ulEk7A0Uyf8oYRYeQD3A4kZo+Us+q3TbXSLwJkVam9
   6RCpVB4jytM8YPD5bGAg1Fy0iZsyZ8J3G4SONZYRwOTr/awhbA+UJ+xWN
   9CLFIaNyPDOYHp/nE3Exkw09lDp/LHjBdHTrfCZKoZNcvIkEhxCd6KoQA
   kkCY+UUxHFxNGz44KIgIYs8Mxthd+UCZfvVHLVOC/j1Av/Ny0B4x7GuV0
   BF4JK4dfzxcAONLWqbTXmNoxH9u0zKkGyUy6T5+A8FpjFL0TNBs+kX/1N
   A==;
X-CSE-ConnectionGUID: 7KMOic8aSgK5x/QFgRIWGg==
X-CSE-MsgGUID: BJItbA9OQTyr9JgLyyzXrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83224914"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="83224914"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:46:16 -0800
X-CSE-ConnectionGUID: KTwH7B+qTHa5A7a+3aNNCQ==
X-CSE-MsgGUID: suA9oT9uTJm2nUvAgDQtbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="246323209"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Feb 2026 16:46:15 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vugZ2-0000000013R-2fBy;
	Tue, 24 Feb 2026 00:46:12 +0000
Date: Tue, 24 Feb 2026 08:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] PCI: dwc: Add helper to Program T_POWER_ON
Message-ID: <202602240816.o0QnIVMF-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260223-t_power_on_fux-v2-2-20c921262709@oss.qualcomm.com>
References: <20260223-t_power_on_fux-v2-2-20c921262709@oss.qualcomm.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-ASPM-Add-helper-to-encode-L1SS-T_POWER_ON-fields/20260223-192621
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260223-t_power_on_fux-v2-2-20c921262709%40oss.qualcomm.com
patch subject: [PATCH v2 2/3] PCI: dwc: Add helper to Program T_POWER_ON
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-014-20260224 (https://download.01.org/0day-ci/archive/20260224/202602240816.o0QnIVMF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240816.o0QnIVMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602240816.o0QnIVMF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-designware.c:1270:10: error: call to '__compiletime_assert_539' declared with 'error' attribute: FIELD_PREP: value too large for the field
    1270 |                 val |= FIELD_PREP(PCI_L1SS_CAP_P_PWR_ON_SCALE, scale);
         |                        ^
   include/linux/bitfield.h:138:3: note: expanded from macro 'FIELD_PREP'
     138 |                 __FIELD_PREP(_mask, _val, "FIELD_PREP: ");              \
         |                 ^
   include/linux/bitfield.h:91:3: note: expanded from macro '__FIELD_PREP'
      91 |                 __BF_FIELD_CHECK_MASK(mask, val, pfx);                  \
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
   <scratch space>:28:1: note: expanded from here
      28 | __compiletime_assert_539
         | ^
   1 error generated.


vim +1270 drivers/pci/controller/dwc/pcie-designware.c

a00bba406b5a68 Bjorn Helgaas             2025-11-18  1251  
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1252  /* TODO: Need to handle multi root ports */
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1253  void dw_pcie_program_t_power_on(struct dw_pcie *pci, u16 t_power_on)
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1254  {
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1255  	u8 scale, value;
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1256  	u16 offset;
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1257  	u32 val;
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1258  
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1259  	if (!t_power_on)
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1260  		return;
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1261  
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1262  	offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1263  	if (offset) {
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1264  		pcie_encode_t_power_on(t_power_on, &scale, &value);
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1265  
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1266  		dw_pcie_dbi_ro_wr_en(pci);
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1267  
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1268  		val = readl(pci->dbi_base + offset + PCI_L1SS_CAP);
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1269  		val &= ~(PCI_L1SS_CAP_P_PWR_ON_SCALE | PCI_L1SS_CAP_P_PWR_ON_VALUE);
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23 @1270  		val |= FIELD_PREP(PCI_L1SS_CAP_P_PWR_ON_SCALE, scale);
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1271  		val |= FIELD_PREP(PCI_L1SS_CAP_P_PWR_ON_VALUE, value);
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1272  
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1273  		writel(val, pci->dbi_base + offset + PCI_L1SS_CAP);
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1274  
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1275  		dw_pcie_dbi_ro_wr_dis(pci);
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1276  	}
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1277  }
23b85f7abefda8 Krishna Chaitanya Chundru 2026-02-23  1278  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
