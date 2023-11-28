Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE9C5694
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Nov 2023 03:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8c+TRV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701140532; x=1732676532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=19usGdPJqzwpbX3YfR0Jk/y/qhWxA6QINIvSWYjWnx4=;
  b=C8c+TRV731SEkYCVWMa4bHs7ROc4LQ1J7w1ordOknF+vVYF8sBk8YeGv
   7VPwd9IitUbzglCNIlLY2TZjpISXLU2BRTKODWAAYkOALiTs0+BD7dP/u
   3fRSQiTGXV6VLO30C4rzQnZ5zcqflm2vP0WBgo/eVfuQ36gPGMtUvzdcl
   zqYj3qVGvDcynQ10RpOgLYz37soxOpNiLjr22BFY290w6Wz9hReuprV0X
   l2W65HXgxsu1ioOpk9DpeIGv7utjqP9r8B89zvNpiGk07UbszAyf3QrOA
   or+8eBISp8+ovoqBh44Lscta1GhD2BGaLmwqogp6lKRWXeBo8WKqnCxMe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="457170200"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="457170200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 19:02:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="16482944"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2023 19:02:10 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7oMR-0006vB-2N;
	Tue, 28 Nov 2023 03:02:07 +0000
Date: Tue, 28 Nov 2023 11:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error: uninitialized
 symbol 'release'.
Message-ID: <202311280906.VAIwEAfT-lkp@intel.com>
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
TO: Vineet Gupta <vgupta@kernel.org>
CC: linux-snps-arc@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
commit: fad84e39f116035ae8d550c6020107b8ac113b45 ARC: boot log: eliminate struct cpuinfo_arc #4: boot log per ISA
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-r071-20231128 (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311280906.VAIwEAfT-lkp@intel.com/

New smatch warnings:
arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error: uninitialized symbol 'release'.

Old smatch warnings:
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/release +203 arch/arc/kernel/setup.c

73e284d2572581 Vineet Gupta 2016-10-20  149  
fad84e39f11603 Vineet Gupta 2020-06-11  150  static int arcv2_mumbojumbo(int c, struct cpuinfo_arc *info, char *buf, int len)
fad84e39f11603 Vineet Gupta 2020-06-11  151  {
fad84e39f11603 Vineet Gupta 2020-06-11  152  	int n = 0;
fad84e39f11603 Vineet Gupta 2020-06-11  153  #ifdef CONFIG_ISA_ARCV2
fad84e39f11603 Vineet Gupta 2020-06-11  154  	const char *release, *cpu_nm, *isa_nm = "ARCv2";
fad84e39f11603 Vineet Gupta 2020-06-11  155  	int dual_issue = 0, dual_enb = 0, mpy_opt, present;
fad84e39f11603 Vineet Gupta 2020-06-11  156  	int bpu_full, bpu_cache, bpu_pred, bpu_ret_stk;
fad84e39f11603 Vineet Gupta 2020-06-11  157  	char mpy_nm[16], lpb_nm[32];
fad84e39f11603 Vineet Gupta 2020-06-11  158  	struct bcr_isa_arcv2 isa;
fad84e39f11603 Vineet Gupta 2020-06-11  159  	struct bcr_mpy mpy;
fad84e39f11603 Vineet Gupta 2020-06-11  160  	struct bcr_fp_arcv2 fpu;
fad84e39f11603 Vineet Gupta 2020-06-11  161  	struct bcr_bpu_arcv2 bpu;
fad84e39f11603 Vineet Gupta 2020-06-11  162  	struct bcr_lpb lpb;
fad84e39f11603 Vineet Gupta 2020-06-11  163  	struct bcr_iccm_arcv2 iccm;
fad84e39f11603 Vineet Gupta 2020-06-11  164  	struct bcr_dccm_arcv2 dccm;
fad84e39f11603 Vineet Gupta 2020-06-11  165  	struct bcr_erp erp;
00a4ae65cc600b Vineet Gupta 2019-02-25  166  
00a4ae65cc600b Vineet Gupta 2019-02-25  167  	/*
97d0b5d0b5a998 Vineet Gupta 2020-06-10  168  	 * Initial HS cores bumped AUX IDENTITY.ARCVER for each release until
97d0b5d0b5a998 Vineet Gupta 2020-06-10  169  	 * ARCVER 0x54 which introduced AUX MICRO_ARCH_BUILD and subsequent
97d0b5d0b5a998 Vineet Gupta 2020-06-10  170  	 * releases only update it.
00a4ae65cc600b Vineet Gupta 2019-02-25  171  	 */
00a4ae65cc600b Vineet Gupta 2019-02-25  172  
fad84e39f11603 Vineet Gupta 2020-06-11  173  	cpu_nm = "HS38";
00a4ae65cc600b Vineet Gupta 2019-02-25  174  
fad84e39f11603 Vineet Gupta 2020-06-11  175  	if (info->arcver > 0x50 && info->arcver <= 0x53) {
fad84e39f11603 Vineet Gupta 2020-06-11  176  		release = arc_hs_rel[info->arcver - 0x51].str;
00a4ae65cc600b Vineet Gupta 2019-02-25  177  	} else {
fad84e39f11603 Vineet Gupta 2020-06-11  178  		const struct id_to_str *tbl;
fad84e39f11603 Vineet Gupta 2020-06-11  179  		struct bcr_uarch_build uarch;
fad84e39f11603 Vineet Gupta 2020-06-11  180  
fad84e39f11603 Vineet Gupta 2020-06-11  181  		READ_BCR(ARC_REG_MICRO_ARCH_BCR, uarch);
00a4ae65cc600b Vineet Gupta 2019-02-25  182  
97d0b5d0b5a998 Vineet Gupta 2020-06-10  183  		for (tbl = &arc_hs_ver54_rel[0]; tbl->id != 0xFF; tbl++) {
00a4ae65cc600b Vineet Gupta 2019-02-25  184  			if (uarch.maj == tbl->id) {
fad84e39f11603 Vineet Gupta 2020-06-11  185  				release = tbl->str;
d975cbc8acb6f4 Vineet Gupta 2016-10-27  186  				break;
d975cbc8acb6f4 Vineet Gupta 2016-10-27  187  			}
00a4ae65cc600b Vineet Gupta 2019-02-25  188  		}
fad84e39f11603 Vineet Gupta 2020-06-11  189  		if (uarch.prod == 4) {
fad84e39f11603 Vineet Gupta 2020-06-11  190  			unsigned int exec_ctrl;
00a4ae65cc600b Vineet Gupta 2019-02-25  191  
fad84e39f11603 Vineet Gupta 2020-06-11  192  			cpu_nm = "HS48";
fad84e39f11603 Vineet Gupta 2020-06-11  193  			dual_issue = 1;
fad84e39f11603 Vineet Gupta 2020-06-11  194  			/* if dual issue hardware, is it enabled ? */
fad84e39f11603 Vineet Gupta 2020-06-11  195  			READ_BCR(AUX_EXEC_CTRL, exec_ctrl);
fad84e39f11603 Vineet Gupta 2020-06-11  196  			dual_enb = !(exec_ctrl & 1);
fad84e39f11603 Vineet Gupta 2020-06-11  197  		}
fad84e39f11603 Vineet Gupta 2020-06-11  198  	}
73e284d2572581 Vineet Gupta 2016-10-20  199  
fad84e39f11603 Vineet Gupta 2020-06-11  200  	READ_BCR(ARC_REG_ISA_CFG_BCR, isa);
b89bd1f4fbaeca Vineet Gupta 2016-01-22  201  
fad84e39f11603 Vineet Gupta 2020-06-11  202  	n += scnprintf(buf + n, len - n, "processor [%d]\t: %s %s (%s ISA) %s%s%s\n",
fad84e39f11603 Vineet Gupta 2020-06-11 @203  		       c, cpu_nm, release, isa_nm,
fad84e39f11603 Vineet Gupta 2020-06-11  204  		       IS_AVAIL1(isa.be, "[Big-Endian]"),
fad84e39f11603 Vineet Gupta 2020-06-11  205  		       IS_AVAIL3(dual_issue, dual_enb, " Dual-Issue "));
af61742813aa9d Vineet Gupta 2013-01-18  206  
fad84e39f11603 Vineet Gupta 2020-06-11  207  	READ_BCR(ARC_REG_MPY_BCR, mpy);
fad84e39f11603 Vineet Gupta 2020-06-11  208  	mpy_opt = 2;	/* stock MPY/MPYH */
fad84e39f11603 Vineet Gupta 2020-06-11  209  	if (mpy.dsp)	/* OPT 7-9 */
fad84e39f11603 Vineet Gupta 2020-06-11  210  		mpy_opt = mpy.dsp + 6;
af61742813aa9d Vineet Gupta 2013-01-18  211  
fad84e39f11603 Vineet Gupta 2020-06-11  212  	scnprintf(mpy_nm, 16, "mpy[opt %d] ", mpy_opt);
a150b085b66c87 Vineet Gupta 2016-02-16  213  
fad84e39f11603 Vineet Gupta 2020-06-11  214  	READ_BCR(ARC_REG_FP_V2_BCR, fpu);
56372082533afb Vineet Gupta 2014-09-25  215  
fad84e39f11603 Vineet Gupta 2020-06-11  216  	n += scnprintf(buf + n, len - n, "ISA Extn\t: %s%s%s%s%s%s%s%s%s%s%s\n",
fad84e39f11603 Vineet Gupta 2020-06-11  217  		       IS_AVAIL2(isa.atomic, "atomic ", CONFIG_ARC_HAS_LLSC),
fad84e39f11603 Vineet Gupta 2020-06-11  218  		       IS_AVAIL2(isa.ldd, "ll64 ", CONFIG_ARC_HAS_LL64),
fad84e39f11603 Vineet Gupta 2020-06-11  219  		       IS_AVAIL2(isa.unalign, "unalign ", CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS),
fad84e39f11603 Vineet Gupta 2020-06-11  220  		       IS_AVAIL1(mpy.ver, mpy_nm),
fad84e39f11603 Vineet Gupta 2020-06-11  221  		       IS_AVAIL1(isa.div_rem, "div_rem "),
fad84e39f11603 Vineet Gupta 2020-06-11  222  		       IS_AVAIL1((fpu.sp | fpu.dp), "  FPU:"),
fad84e39f11603 Vineet Gupta 2020-06-11  223  		       IS_AVAIL1(fpu.sp, " sp"),
fad84e39f11603 Vineet Gupta 2020-06-11  224  		       IS_AVAIL1(fpu.dp, " dp"));
56372082533afb Vineet Gupta 2014-09-25  225  
56372082533afb Vineet Gupta 2014-09-25  226  	READ_BCR(ARC_REG_BPU_BCR, bpu);
fad84e39f11603 Vineet Gupta 2020-06-11  227  	bpu_full = bpu.ft;
fad84e39f11603 Vineet Gupta 2020-06-11  228  	bpu_cache = 256 << bpu.bce;
fad84e39f11603 Vineet Gupta 2020-06-11  229  	bpu_pred = 2048 << bpu.pte;
fad84e39f11603 Vineet Gupta 2020-06-11  230  	bpu_ret_stk = 4 << bpu.rse;
1f6ccfff631467 Vineet Gupta 2013-05-13  231  
fad84e39f11603 Vineet Gupta 2020-06-11  232  	READ_BCR(ARC_REG_LPB_BUILD, lpb);
fad84e39f11603 Vineet Gupta 2020-06-11  233  	if (lpb.ver) {
fad84e39f11603 Vineet Gupta 2020-06-11  234  		unsigned int ctl;
fad84e39f11603 Vineet Gupta 2020-06-11  235  		ctl = read_aux_reg(ARC_REG_LPB_CTRL);
1f6ccfff631467 Vineet Gupta 2013-05-13  236  
fad84e39f11603 Vineet Gupta 2020-06-11  237  		scnprintf(lpb_nm, sizeof(lpb_nm), " Loop Buffer:%d %s",
fad84e39f11603 Vineet Gupta 2020-06-11  238  			  lpb.entries, IS_DISABLED_RUN(!ctl));
fad84e39f11603 Vineet Gupta 2020-06-11  239  	}
dea8252059a321 Vineet Gupta 2017-09-21  240  
fad84e39f11603 Vineet Gupta 2020-06-11  241  	n += scnprintf(buf + n, len - n,
fad84e39f11603 Vineet Gupta 2020-06-11  242  			"BPU\t\t: %s%s match, cache:%d, Predict Table:%d Return stk: %d%s\n",
fad84e39f11603 Vineet Gupta 2020-06-11  243  			IS_AVAIL1(bpu_full, "full"),
fad84e39f11603 Vineet Gupta 2020-06-11  244  			IS_AVAIL1(!bpu_full, "partial"),
fad84e39f11603 Vineet Gupta 2020-06-11  245  			bpu_cache, bpu_pred, bpu_ret_stk,
fad84e39f11603 Vineet Gupta 2020-06-11  246  			lpb_nm);
dea8252059a321 Vineet Gupta 2017-09-21  247  
fad84e39f11603 Vineet Gupta 2020-06-11  248  	READ_BCR(ARC_REG_ICCM_BUILD, iccm);
fad84e39f11603 Vineet Gupta 2020-06-11  249  	if (iccm.ver) {
fad84e39f11603 Vineet Gupta 2020-06-11  250  		unsigned long base;
fad84e39f11603 Vineet Gupta 2020-06-11  251  		info->iccm.sz = 256 << iccm.sz00;	/* 512B to 16M */
fad84e39f11603 Vineet Gupta 2020-06-11  252  		if (iccm.sz00 == 0xF && iccm.sz01 > 0)
fad84e39f11603 Vineet Gupta 2020-06-11  253  			info->iccm.sz <<= iccm.sz01;
fad84e39f11603 Vineet Gupta 2020-06-11  254  		base = read_aux_reg(ARC_REG_AUX_ICCM);
fad84e39f11603 Vineet Gupta 2020-06-11  255  		info->iccm.base = base & 0xF0000000;
56372082533afb Vineet Gupta 2014-09-25  256  	}
56372082533afb Vineet Gupta 2014-09-25  257  
fad84e39f11603 Vineet Gupta 2020-06-11  258  	READ_BCR(ARC_REG_DCCM_BUILD, dccm);
fad84e39f11603 Vineet Gupta 2020-06-11  259  	if (dccm.ver) {
fad84e39f11603 Vineet Gupta 2020-06-11  260  		unsigned long base;
fad84e39f11603 Vineet Gupta 2020-06-11  261  		info->dccm.sz = 256 << dccm.sz0;
fad84e39f11603 Vineet Gupta 2020-06-11  262  		if (dccm.sz0 == 0xF && dccm.sz1 > 0)
fad84e39f11603 Vineet Gupta 2020-06-11  263  			info->dccm.sz <<= dccm.sz1;
fad84e39f11603 Vineet Gupta 2020-06-11  264  		base = read_aux_reg(ARC_REG_AUX_DCCM);
fad84e39f11603 Vineet Gupta 2020-06-11  265  		info->dccm.base = base & 0xF0000000;
7dd380c338f1ec Vineet Gupta 2019-01-09  266  	}
56372082533afb Vineet Gupta 2014-09-25  267  
fad84e39f11603 Vineet Gupta 2020-06-11  268  	/* Error Protection: ECC/Parity */
fad84e39f11603 Vineet Gupta 2020-06-11  269  	READ_BCR(ARC_REG_ERP_BUILD, erp);
fad84e39f11603 Vineet Gupta 2020-06-11  270  	if (erp.ver) {
fad84e39f11603 Vineet Gupta 2020-06-11  271  		struct ctl_erp ctl;
fad84e39f11603 Vineet Gupta 2020-06-11  272  		READ_BCR(ARC_REG_ERP_CTRL, ctl);
fad84e39f11603 Vineet Gupta 2020-06-11  273  		/* inverted bits: 0 means enabled */
fad84e39f11603 Vineet Gupta 2020-06-11  274  		n += scnprintf(buf + n, len - n, "Extn [ECC]\t: %s%s%s%s%s%s\n",
fad84e39f11603 Vineet Gupta 2020-06-11  275  				IS_AVAIL3(erp.ic,  !ctl.dpi, "IC "),
fad84e39f11603 Vineet Gupta 2020-06-11  276  				IS_AVAIL3(erp.dc,  !ctl.dpd, "DC "),
fad84e39f11603 Vineet Gupta 2020-06-11  277  				IS_AVAIL3(erp.mmu, !ctl.mpd, "MMU "));
010a8c98884f4c Vineet Gupta 2017-09-21  278  	}
af61742813aa9d Vineet Gupta 2013-01-18  279  
fad84e39f11603 Vineet Gupta 2020-06-11  280  	/* ARCv2 ISA specific sanity checks */
fad84e39f11603 Vineet Gupta 2020-06-11  281  	present = fpu.sp | fpu.dp | mpy.dsp;	/* DSP and/or FPU */
fad84e39f11603 Vineet Gupta 2020-06-11  282  	CHK_OPT_STRICT(CONFIG_ARC_HAS_ACCL_REGS, present);
d975cbc8acb6f4 Vineet Gupta 2016-10-27  283  
fad84e39f11603 Vineet Gupta 2020-06-11  284  	dsp_config_check();
fad84e39f11603 Vineet Gupta 2020-06-11  285  #endif
fad84e39f11603 Vineet Gupta 2020-06-11  286  	return n;
73e284d2572581 Vineet Gupta 2016-10-20  287  }
56372082533afb Vineet Gupta 2014-09-25  288  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
