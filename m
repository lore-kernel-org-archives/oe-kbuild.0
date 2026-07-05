Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFA326ED25
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Jul 2026 16:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783268825; cv=none; b=Sv5RBA8rc3VVVwIrrltHGErDv9LPjfMpQix75Q2R1ER/iS2on+ad0J5GfQlq2DR/sG4cY0AkHTLki7vx6/vdmUgOFKLDhwWgqS4Y69jHUwHkYnY1X0Kc+LM8cCdkAtdmsKdFu9Fm5mWqGZ0KwEyL1P1YAdIM4uvRAmnttomgx48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783268825; c=relaxed/simple;
	bh=SBb8g40uAATHm+PBKzz7+XsOM6EbsCkz1tJsBwVVEyw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FlLR4vZVepwds+9FT8WRH/9O5/riY3T0MQAruJGrkEhg2QBUhOymGXuQ6/bvdnIuuKCfEBnrYTpAzVRJ8tnf3zOAXDYNzuG4yX+mMCxb/f/0pdVOZjYvSKmZwib2GxvYTmzUJhO8ID6FQHcAuatcP9C7XRVSnwoTkGwIQnKy1zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgufMV5e; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgufMV5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783268822; x=1814804822;
  h=date:from:to:cc:subject:message-id;
  bh=SBb8g40uAATHm+PBKzz7+XsOM6EbsCkz1tJsBwVVEyw=;
  b=hgufMV5eGPttlxGTy8nSlTy+eRNSFSEz9zvBRGjzuDfxhoIZXA/57pr+
   +Bx/dvMWvIbgCgov9oPU5cEI1rQ/C3UrEU61BmRR/l9qJg8FVfouUhOf+
   VJz1alnoGy/jQn3EPs/DYnDs7jGBtjtTk5k7z/JGYH+tFLKxXKt6asGBX
   hz1S58ovfd7Y4XStiP3OlYPvm7tcMCldGK6xB0XHJes98m0+h3Jm0UdB9
   uYiPzb7SCSiAdiNUTqQ0u1FfeWp+cieaCOorTEjifO2l15HRkGMgn7boM
   PLbp5au/6+MKpAHmRfGgv1eKL3caRHBI826S5a2aWF++JPQvpbjqx25HI
   w==;
X-CSE-ConnectionGUID: 6TvpE5JERguFp81vppaKdQ==
X-CSE-MsgGUID: sXoSP6f5S+a9Bu7cf5KnRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="109462624"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="109462624"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 09:27:01 -0700
X-CSE-ConnectionGUID: 4UFpFeS4QBaUWgZMhWd3vQ==
X-CSE-MsgGUID: h8IZz4sCRy2IMqfCiLVj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="250848875"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2026 09:27:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgPgD-00000000Ded-3cPT;
	Sun, 05 Jul 2026 16:26:54 +0000
Date: Mon, 06 Jul 2026 00:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/txx9/generic/setup.c:254:9: sparse: sparse: switch
 with no cases
Message-ID: <202607060042.96EwnsBY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/mips/txx9/generic/setup.c:254:9: sparse: sparse: switch with no cases"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Geert,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7404ce51637231382873d0b55edabc2f3b841a9d
commit: 9591220e7a6c12c788b1fc013c39af26edf99538 MIPS: txx9: Constify bin_attribute arguments of txx9_sram_{read,write}()
date:   1 year ago
:::::: branch date: 24 hours ago
:::::: commit date: 1 year ago
config: mips-randconfig-r134-20260705 (https://download.01.org/0day-ci/archive/20260706/202607060042.96EwnsBY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607060042.96EwnsBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9591220e7a6c ("MIPS: txx9: Constify bin_attribute arguments of txx9_sram_{read,write}()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607060042.96EwnsBY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/mips/txx9/generic/setup.c:254:9: sparse: sparse: switch with no cases
>> arch/mips/txx9/generic/setup.c:101:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/mips/txx9/generic/setup.c:105:16: sparse: signed value source

vim +254 arch/mips/txx9/generic/setup.c

860e546c19d88c2 Atsushi Nemoto     2008-08-19   95  
860e546c19d88c2 Atsushi Nemoto     2008-08-19   96  static struct txx9_board_vec *__init find_board_byname(const char *name)
860e546c19d88c2 Atsushi Nemoto     2008-08-19   97  {
860e546c19d88c2 Atsushi Nemoto     2008-08-19   98  	int i;
860e546c19d88c2 Atsushi Nemoto     2008-08-19   99  
860e546c19d88c2 Atsushi Nemoto     2008-08-19  100  	/* search board_vecs table */
860e546c19d88c2 Atsushi Nemoto     2008-08-19 @101  	for (i = 0; i < ARRAY_SIZE(board_vecs); i++) {
860e546c19d88c2 Atsushi Nemoto     2008-08-19  102  		if (strstr(board_vecs[i]->system, name))
860e546c19d88c2 Atsushi Nemoto     2008-08-19  103  			return board_vecs[i];
860e546c19d88c2 Atsushi Nemoto     2008-08-19  104  	}
860e546c19d88c2 Atsushi Nemoto     2008-08-19  105  	return NULL;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  106  }
860e546c19d88c2 Atsushi Nemoto     2008-08-19  107  
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  108  static void __init prom_init_cmdline(void)
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  109  {
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  110  	int argc;
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  111  	int *argv32;
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  112  	int i;			/* Always ignore the "-c" at argv[0] */
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  113  
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  114  	if (fw_arg0 >= CKSEG0 || fw_arg1 < CKSEG0) {
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  115  		/*
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  116  		 * argc is not a valid number, or argv32 is not a valid
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  117  		 * pointer
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  118  		 */
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  119  		argc = 0;
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  120  		argv32 = NULL;
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  121  	} else {
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  122  		argc = (int)fw_arg0;
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  123  		argv32 = (int *)fw_arg1;
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  124  	}
97b0511ce125b0c Geert Uytterhoeven 2008-10-27  125  
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  126  	arcs_cmdline[0] = '\0';
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  127  
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  128  	for (i = 1; i < argc; i++) {
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  129  		char *str = (char *)(long)argv32[i];
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  130  		if (i != 1)
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  131  			strcat(arcs_cmdline, " ");
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  132  		if (strchr(str, ' ')) {
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  133  			strcat(arcs_cmdline, "\"");
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  134  			strcat(arcs_cmdline, str);
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  135  			strcat(arcs_cmdline, "\"");
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  136  		} else
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  137  			strcat(arcs_cmdline, str);
e0dfb20c2b77c66 Atsushi Nemoto     2008-08-19  138  	}
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  139  }
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  140  
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  141  static int txx9_ic_disable __initdata;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  142  static int txx9_dc_disable __initdata;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  143  
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  144  #if defined(CONFIG_CPU_TX49XX)
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  145  /* flush all cache on very early stage (before 4k_cache_init) */
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  146  static void __init early_flush_dcache(void)
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  147  {
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  148  	unsigned int conf = read_c0_config();
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  149  	unsigned int dc_size = 1 << (12 + ((conf & CONF_DC) >> 6));
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  150  	unsigned int linesz = 32;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  151  	unsigned long addr, end;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  152  
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  153  	end = INDEX_BASE + dc_size / 4;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  154  	/* 4way, waybit=0 */
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  155  	for (addr = INDEX_BASE; addr < end; addr += linesz) {
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  156  		cache_op(Index_Writeback_Inv_D, addr | 0);
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  157  		cache_op(Index_Writeback_Inv_D, addr | 1);
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  158  		cache_op(Index_Writeback_Inv_D, addr | 2);
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  159  		cache_op(Index_Writeback_Inv_D, addr | 3);
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  160  	}
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  161  }
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  162  
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  163  static void __init txx9_cache_fixup(void)
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  164  {
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  165  	unsigned int conf;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  166  
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  167  	conf = read_c0_config();
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  168  	/* flush and disable */
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  169  	if (txx9_ic_disable) {
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  170  		conf |= TX49_CONF_IC;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  171  		write_c0_config(conf);
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  172  	}
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  173  	if (txx9_dc_disable) {
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  174  		early_flush_dcache();
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  175  		conf |= TX49_CONF_DC;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  176  		write_c0_config(conf);
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  177  	}
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  178  
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  179  	/* enable cache */
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  180  	conf = read_c0_config();
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  181  	if (!txx9_ic_disable)
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  182  		conf &= ~TX49_CONF_IC;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  183  	if (!txx9_dc_disable)
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  184  		conf &= ~TX49_CONF_DC;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  185  	write_c0_config(conf);
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  186  
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  187  	if (conf & TX49_CONF_IC)
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  188  		pr_info("TX49XX I-Cache disabled.\n");
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  189  	if (conf & TX49_CONF_DC)
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  190  		pr_info("TX49XX D-Cache disabled.\n");
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  191  }
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  192  #else
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  193  static inline void txx9_cache_fixup(void)
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  194  {
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  195  }
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  196  #endif
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  197  
860e546c19d88c2 Atsushi Nemoto     2008-08-19  198  static void __init preprocess_cmdline(void)
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  199  {
7580c9c3938f45b Dmitri Vorobiev    2009-10-13  200  	static char cmdline[COMMAND_LINE_SIZE] __initdata;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  201  	char *s;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  202  
860e546c19d88c2 Atsushi Nemoto     2008-08-19  203  	strcpy(cmdline, arcs_cmdline);
860e546c19d88c2 Atsushi Nemoto     2008-08-19  204  	s = cmdline;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  205  	arcs_cmdline[0] = '\0';
860e546c19d88c2 Atsushi Nemoto     2008-08-19  206  	while (s && *s) {
860e546c19d88c2 Atsushi Nemoto     2008-08-19  207  		char *str = strsep(&s, " ");
860e546c19d88c2 Atsushi Nemoto     2008-08-19  208  		if (strncmp(str, "board=", 6) == 0) {
860e546c19d88c2 Atsushi Nemoto     2008-08-19  209  			txx9_board_vec = find_board_byname(str + 6);
860e546c19d88c2 Atsushi Nemoto     2008-08-19  210  			continue;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  211  		} else if (strncmp(str, "masterclk=", 10) == 0) {
8e9ecbc5e21bf82 Daniel Walter      2014-06-03  212  			unsigned int val;
8e9ecbc5e21bf82 Daniel Walter      2014-06-03  213  			if (kstrtouint(str + 10, 10, &val) == 0)
860e546c19d88c2 Atsushi Nemoto     2008-08-19  214  				txx9_master_clock = val;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  215  			continue;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  216  		} else if (strcmp(str, "icdisable") == 0) {
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  217  			txx9_ic_disable = 1;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  218  			continue;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  219  		} else if (strcmp(str, "dcdisable") == 0) {
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  220  			txx9_dc_disable = 1;
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  221  			continue;
c7b95bcb38ea492 Atsushi Nemoto     2008-08-19  222  		} else if (strcmp(str, "toeoff") == 0) {
c7b95bcb38ea492 Atsushi Nemoto     2008-08-19  223  			txx9_ccfg_toeon = 0;
c7b95bcb38ea492 Atsushi Nemoto     2008-08-19  224  			continue;
c7b95bcb38ea492 Atsushi Nemoto     2008-08-19  225  		} else if (strcmp(str, "toeon") == 0) {
c7b95bcb38ea492 Atsushi Nemoto     2008-08-19  226  			txx9_ccfg_toeon = 1;
c7b95bcb38ea492 Atsushi Nemoto     2008-08-19  227  			continue;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  228  		}
860e546c19d88c2 Atsushi Nemoto     2008-08-19  229  		if (arcs_cmdline[0])
860e546c19d88c2 Atsushi Nemoto     2008-08-19  230  			strcat(arcs_cmdline, " ");
860e546c19d88c2 Atsushi Nemoto     2008-08-19  231  		strcat(arcs_cmdline, str);
860e546c19d88c2 Atsushi Nemoto     2008-08-19  232  	}
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  233  
d10e025f0e4ba4b Atsushi Nemoto     2008-08-19  234  	txx9_cache_fixup();
860e546c19d88c2 Atsushi Nemoto     2008-08-19  235  }
860e546c19d88c2 Atsushi Nemoto     2008-08-19  236  
860e546c19d88c2 Atsushi Nemoto     2008-08-19  237  static void __init select_board(void)
860e546c19d88c2 Atsushi Nemoto     2008-08-19  238  {
860e546c19d88c2 Atsushi Nemoto     2008-08-19  239  	const char *envstr;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  240  
860e546c19d88c2 Atsushi Nemoto     2008-08-19  241  	/* first, determine by "board=" argument in preprocess_cmdline() */
860e546c19d88c2 Atsushi Nemoto     2008-08-19  242  	if (txx9_board_vec)
860e546c19d88c2 Atsushi Nemoto     2008-08-19  243  		return;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  244  	/* next, determine by "board" envvar */
860e546c19d88c2 Atsushi Nemoto     2008-08-19  245  	envstr = prom_getenv("board");
860e546c19d88c2 Atsushi Nemoto     2008-08-19  246  	if (envstr) {
860e546c19d88c2 Atsushi Nemoto     2008-08-19  247  		txx9_board_vec = find_board_byname(envstr);
860e546c19d88c2 Atsushi Nemoto     2008-08-19  248  		if (txx9_board_vec)
860e546c19d88c2 Atsushi Nemoto     2008-08-19  249  			return;
860e546c19d88c2 Atsushi Nemoto     2008-08-19  250  	}
860e546c19d88c2 Atsushi Nemoto     2008-08-19  251  
860e546c19d88c2 Atsushi Nemoto     2008-08-19  252  	/* select "default" board */
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  253  #ifdef CONFIG_CPU_TX49XX
edcaf1a6a773155 Atsushi Nemoto     2008-07-11 @254  	switch (TX4938_REV_PCODE()) {
8d795f2a5cf7333 Atsushi Nemoto     2008-07-18  255  #ifdef CONFIG_TOSHIBA_RBTX4927
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  256  	case 0x4927:
7a1fdf1946b641f Yoichi Yuasa       2008-07-13  257  		txx9_board_vec = &rbtx4927_vec;
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  258  		break;
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  259  	case 0x4937:
7a1fdf1946b641f Yoichi Yuasa       2008-07-13  260  		txx9_board_vec = &rbtx4937_vec;
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  261  		break;
8d795f2a5cf7333 Atsushi Nemoto     2008-07-18  262  #endif
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  263  	}
edcaf1a6a773155 Atsushi Nemoto     2008-07-11  264  #endif
860e546c19d88c2 Atsushi Nemoto     2008-08-19  265  }
860e546c19d88c2 Atsushi Nemoto     2008-08-19  266  

:::::: The code at line 254 was first introduced by commit
:::::: edcaf1a6a77315562e9781245cc8e028c9a921dc [MIPS] TXx9: Make single kernel can support multiple boards

:::::: TO: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
