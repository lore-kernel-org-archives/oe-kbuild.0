Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446233;
	b=mmdEGmwujdPCZkgUiEThbHb83K35gWvQR0Hc6Wy5Toj7RxihZ2RZgy/GUnQr2Z+QtzWZ
	 TyUrQu3Tmqy0mNarJChJuXF6vcdpv0UuM2QpgP+5tYKq5k0EkDfeR1EUAKxnZOj5hNzy/
	 kTDty5M8h98evsAMyJHhmExfBJ9Y1YOGsU34eDrrytKjJPrWX1XV5VIANRJ+b5GPyK8Wn
	 1Ny1FZFzog6fGMYKn6MMinqOFWnsQA1dmsB8qvrJZ/mvQ2zg+qKezn0a/4NeuT6vZTXhT
	 TqYiQ9YrU/LndfE+1OGmmqxlc2Ts9NjOSc2/AywXgzoXQkps98VMglUx0jRBUCjr0eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446233;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=yOCz84RAwQ6l85oUTxNaNvq8PQ72eT5WhVWdlKvER+w=;
	b=E2s8mFvCoZ6jULx3SB0YS6z/lUPO3SBlIsvgk46SiQ0WvBfEHW6tt/ix7RxNhs/h+xDp
	 gfhKvwjrr1f1mRdMVSZZGXm6/XCbNg0ukpCESsGFm1DzmJQAwrHFL87RHlwNzTy1OEYTC
	 kfH7AzzRVZ0OQplGy0duHi0MjKMzuYLf+8A6ztZPCdh2pOrpYQ1FFZiRC98NS1QyhOAcM
	 OLvMuMs90LPhFdcst0ewYTS7mmLo8119xgmFI5M5j+Ld8z19kIFmm8Wsxf/HoSYd/k18q
	 QxsEzBCMBrz+RspTEUMWB44mdxwOdXsA45uO2uZh2BnrzDONUDWbFl7Yfu7IXx8zmRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=InI9D3qR;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D0606A326
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 01:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=InI9D3qR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794446233; x=1825982233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/qUka+1ssgZSHRio9LTEt4vRp4lHJ77zXb0IeuaiXjQ=;
  b=InI9D3qRxxklM98WxfCVba1DzZy0LHMl8szCemi8DZojOY7mJ157JgI4
   fsLBf/DqihciThY+iMdOQXD+1XXUWCYH0oM9FqIO1AZME+NwRAkzG6BC1
   1l+LcnaPICKK/8Fd3NH2bIMp2KHPa7nHWIIq6GO7R5ZI+bco4fC2043MP
   Jj5rlMbFBlqRFtyo4BWF784OoZpUx45KzpcK/m1hXNlhya74NkRJqgDct
   6PTy8NibjdJdQ8H0JR3mP1oVs7d6vmZYADZLgti30WdkgXL3hDFHDiQwH
   BpytthBtWFZuet6QsNMLFGYkkokj7uvA61sTzbpuSyZspT3L7AVVJP5xR
   w==;
X-CSE-ConnectionGUID: dJI6wiQVRfq/F4qn1mtv2Q==
X-CSE-MsgGUID: XUKliPmvSWS/4YFsd10iuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3317595"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3317595"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 17:17:12 -0800
X-CSE-ConnectionGUID: W08Nn42iRlOGxD0VmKr8sg==
X-CSE-MsgGUID: lkxsTZFBQs2t5bL95DY1Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8614858"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2026 17:17:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRJR7-000000010AD-3AT3;
	Thu, 12 Nov 2026 01:17:09 +0000
Date: Thu, 12 Nov 2026 09:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 07/15] misc/arm-cla: Set up memory translation
 context
Message-ID: <202611120948.eIJQ3E15-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261015142552.4128028-8-ryan.roberts@arm.com>
References: <20261015142552.4128028-8-ryan.roberts@arm.com>
TO: Ryan Roberts <ryan.roberts@arm.com>

Hi Ryan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on awilliam-vfio/next]
[cannot apply to char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus kvmarm/next linus/master awilliam-vfio/for-linus v7.4-rc2 next-20261110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/misc-arm-cla-Add-driver-skeleton-and-documentation/20261015-152535
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20261015142552.4128028-8-ryan.roberts%40arm.com
patch subject: [RFC PATCH v2 07/15] misc/arm-cla: Set up memory translation context
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261112/202611120948.eIJQ3E15-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e73e336290028f26553b46c9fba844c13da38c9c)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120948.eIJQ3E15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611120948.eIJQ3E15-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/arm-cla/cla-mtc.c:22:5: warning: stack frame size (2176) exceeds limit (2048) in 'cla_mtc_setup' [-Wframe-larger-than]
      22 | int cla_mtc_setup(struct cla_dev *dev)
         |     ^
   1 warning generated.


vim +/cla_mtc_setup +22 drivers/misc/arm-cla/cla-mtc.c

8fdae6eccece08 Ryan Roberts 2026-10-15  12  
8fdae6eccece08 Ryan Roberts 2026-10-15  13  #define cla_kernel_mtc \
8fdae6eccece08 Ryan Roberts 2026-10-15  14  	(cla_kernel_pl == 2 ? CLA_MTC_REGIDX_PL2 : CLA_MTC_REGIDX_PL1)
8fdae6eccece08 Ryan Roberts 2026-10-15  15  
8fdae6eccece08 Ryan Roberts 2026-10-15  16  /**
8fdae6eccece08 Ryan Roberts 2026-10-15  17   * cla_mtc_setup - initialize the memory translation context
8fdae6eccece08 Ryan Roberts 2026-10-15  18   * @dev: CLA device
8fdae6eccece08 Ryan Roberts 2026-10-15  19   *
8fdae6eccece08 Ryan Roberts 2026-10-15  20   * Return: 0 on success, or a negative error code.
8fdae6eccece08 Ryan Roberts 2026-10-15  21   */
8fdae6eccece08 Ryan Roberts 2026-10-15 @22  int cla_mtc_setup(struct cla_dev *dev)
8fdae6eccece08 Ryan Roberts 2026-10-15  23  {
8fdae6eccece08 Ryan Roberts 2026-10-15  24  	int ret;
8fdae6eccece08 Ryan Roberts 2026-10-15  25  	u64 tcr;
8fdae6eccece08 Ryan Roberts 2026-10-15  26  	u64 regs[2 * CLA_MTC_PL_SIZE] = {};
8fdae6eccece08 Ryan Roberts 2026-10-15  27  	u64 *kregs = &regs[cla_kernel_mtc];
8fdae6eccece08 Ryan Roberts 2026-10-15  28  	size_t regs_size = cla_kernel_pl * CLA_MTC_PL_SIZE;
8fdae6eccece08 Ryan Roberts 2026-10-15  29  	u64 reserved_ttbr = phys_to_ttbr(page_to_phys(ZERO_PAGE(0)));
8fdae6eccece08 Ryan Roberts 2026-10-15  30  
8fdae6eccece08 Ryan Roberts 2026-10-15  31  	/*
8fdae6eccece08 Ryan Roberts 2026-10-15  32  	 * The MTC registers deliberately have the same layout as their arm64
8fdae6eccece08 Ryan Roberts 2026-10-15  33  	 * sysreg counterparts. Where MTC registers don't define a particular
8fdae6eccece08 Ryan Roberts 2026-10-15  34  	 * field, it is specified as "reserved RAZ/WI", so we can safely copy
8fdae6eccece08 Ryan Roberts 2026-10-15  35  	 * the whole arm64 register value to the MTC register without needing to
8fdae6eccece08 Ryan Roberts 2026-10-15  36  	 * do any masking. That just leaves the possibility of the CPU
8fdae6eccece08 Ryan Roberts 2026-10-15  37  	 * supporting a VMSA feature which is necessary for correct sharing of
8fdae6eccece08 Ryan Roberts 2026-10-15  38  	 * pgtables that the MTC doesn't support (e.g. MTE, PIE, POE);
8fdae6eccece08 Ryan Roberts 2026-10-15  39  	 * Fortunately, CLA is part of the CPU implementation so this is
8fdae6eccece08 Ryan Roberts 2026-10-15  40  	 * guaranteed never to happen.
8fdae6eccece08 Ryan Roberts 2026-10-15  41  	 */
8fdae6eccece08 Ryan Roberts 2026-10-15  42  
8fdae6eccece08 Ryan Roberts 2026-10-15  43  	/* The accelerator always runs as EL0 */
8fdae6eccece08 Ryan Roberts 2026-10-15  44  	kregs[CLA_MTC_PSTATE] = FIELD_PREP(CLA_MTC_PSTATE_EL, 0) |
8fdae6eccece08 Ryan Roberts 2026-10-15  45  				FIELD_PREP(CLA_MTC_PSTATE_PAN,
8fdae6eccece08 Ryan Roberts 2026-10-15  46  					   system_uses_hw_pan());
8fdae6eccece08 Ryan Roberts 2026-10-15  47  	kregs[CLA_MTC_TTBR0] = reserved_ttbr;
8fdae6eccece08 Ryan Roberts 2026-10-15  48  	kregs[CLA_MTC_TTBR1] = reserved_ttbr;
8fdae6eccece08 Ryan Roberts 2026-10-15  49  	kregs[CLA_MTC_SCTLR] = read_sysreg(sctlr_el1);
8fdae6eccece08 Ryan Roberts 2026-10-15  50  	kregs[CLA_MTC_MAIR] = read_sysreg(mair_el1);
8fdae6eccece08 Ryan Roberts 2026-10-15  51  
8fdae6eccece08 Ryan Roberts 2026-10-15  52  	if (cpus_have_final_cap(ARM64_HAS_TCR2))
8fdae6eccece08 Ryan Roberts 2026-10-15  53  		kregs[CLA_MTC_TCR2] = read_sysreg_s(SYS_TCR2_EL1);
8fdae6eccece08 Ryan Roberts 2026-10-15  54  
8fdae6eccece08 Ryan Roberts 2026-10-15  55  	tcr = read_sysreg(tcr_el1);
8fdae6eccece08 Ryan Roberts 2026-10-15  56  	/*
8fdae6eccece08 Ryan Roberts 2026-10-15  57  	 * Put ASID in TTBR0, so that we only have one reg to update when
8fdae6eccece08 Ryan Roberts 2026-10-15  58  	 * switching context.
8fdae6eccece08 Ryan Roberts 2026-10-15  59  	 */
8fdae6eccece08 Ryan Roberts 2026-10-15  60  	FIELD_MODIFY(TCR_EL1_A1, &tcr, 0);
8fdae6eccece08 Ryan Roberts 2026-10-15  61  	/*
8fdae6eccece08 Ryan Roberts 2026-10-15  62  	 * We never map anything in the TTBR1 VA range so explicitly disable
8fdae6eccece08 Ryan Roberts 2026-10-15  63  	 * translations via TTBR1.
8fdae6eccece08 Ryan Roberts 2026-10-15  64  	 */
8fdae6eccece08 Ryan Roberts 2026-10-15  65  	FIELD_MODIFY(TCR_EL1_EPD1_MASK, &tcr, 1);
8fdae6eccece08 Ryan Roberts 2026-10-15  66  	kregs[CLA_MTC_TCR] = tcr;
8fdae6eccece08 Ryan Roberts 2026-10-15  67  
8fdae6eccece08 Ryan Roberts 2026-10-15  68  	if (cla_kernel_pl == 2) {
8fdae6eccece08 Ryan Roberts 2026-10-15  69  		/* E2H and TGE */
8fdae6eccece08 Ryan Roberts 2026-10-15  70  		regs[CLA_MTC_HCR_EL2] = HCR_HOST_VHE_FLAGS;
8fdae6eccece08 Ryan Roberts 2026-10-15  71  	}
8fdae6eccece08 Ryan Roberts 2026-10-15  72  
8fdae6eccece08 Ryan Roberts 2026-10-15  73  	/*
8fdae6eccece08 Ryan Roberts 2026-10-15  74  	 * All accelerators are idle, meaning there can't be any memory
8fdae6eccece08 Ryan Roberts 2026-10-15  75  	 * transactions happening. So it is safe to setup the MTC in any order.
8fdae6eccece08 Ryan Roberts 2026-10-15  76  	 * i.e. there is no issue with setting SCTLR.M=1 before we have
8fdae6eccece08 Ryan Roberts 2026-10-15  77  	 * configured MAIR or TCR2.
8fdae6eccece08 Ryan Roberts 2026-10-15  78  	 */
8fdae6eccece08 Ryan Roberts 2026-10-15  79  	ret = cla_op_setctx(dev, CLA_MTC_REGIDX_PL1, regs_size, regs);
8fdae6eccece08 Ryan Roberts 2026-10-15  80  	if (ret) {
8fdae6eccece08 Ryan Roberts 2026-10-15  81  		WARN_ON(cla_mtc_clear(dev));
8fdae6eccece08 Ryan Roberts 2026-10-15  82  		return ret;
8fdae6eccece08 Ryan Roberts 2026-10-15  83  	}
8fdae6eccece08 Ryan Roberts 2026-10-15  84  
8fdae6eccece08 Ryan Roberts 2026-10-15  85  	return 0;
8fdae6eccece08 Ryan Roberts 2026-10-15  86  }
8fdae6eccece08 Ryan Roberts 2026-10-15  87  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
