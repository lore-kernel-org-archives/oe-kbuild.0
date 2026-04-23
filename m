Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A81B19C556
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Apr 2026 23:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776986808; cv=none; b=EY9YY21l3f5zZrnxu+k/6c8dZK0VpnqMHPrWnazlXHVN7L6PnSOIsScnr9fTMODle+9KwprB5XWA5/06eJBHSrQdo1rhKUPMF3ZrOidknDTKa6rOUMg4QlWm1BYGa5dFlBUjJkIdgcATXF+s0aUxtNApSuVwMgd2TTS02pQTTZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776986808; c=relaxed/simple;
	bh=vBqKw20mZbjJsb+7BLjYVbCvHfNHG+D4lt7tPRG2K0s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rAcfyTu6G+lvWT5eth5Q9s1slmPw0ZHf/j7zCzZLZaqwSNTAzpbls579HULnc1ODtkJ2y+HT6s6XX29s4loCWssGT0OMG+zWTHnppVY0Vt2nBB6YMjWC9qcTskeC55OEHFm5AH7/fnETcvzfPOYiAIomnhIRLK4xXEUgS9PtiOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb2mcuvG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb2mcuvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776986806; x=1808522806;
  h=date:from:to:cc:subject:message-id;
  bh=vBqKw20mZbjJsb+7BLjYVbCvHfNHG+D4lt7tPRG2K0s=;
  b=Lb2mcuvGVozsvT7h6JbbSnp4Nnb7wVfMfuEXDIZSPNYKFG6B6wtUuQ66
   EBjSpYDIs2tr/V5YvfSAqR+9B0LIJtFZHiobpWw/Yn0nMvgHY1dBC5KW7
   fpUE7qJ6jRaFgGf6xslVCy9FyI+oXQp7Ycv13EahlLatWkCn8RhDpl68X
   5aElqgjr5vCDUDzHOvateWtddfiv1PD6+C6xQiP/DMoV6fuyZuZ1urE5y
   +bOCnGCXqJy5JmybJCjYWV0h1plyr6KswMw/QJd3ckp5L4a19FR30NNNu
   hypiszYJvyYxpDl+pnF9aPA81JzW7gY+9N/lQP+GWVZ5LxC52jikxsXix
   g==;
X-CSE-ConnectionGUID: /5brzuChSQ6P+oaMo7hnvg==
X-CSE-MsgGUID: QISkMw5LTO2keiPfP8yatQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81825401"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="81825401"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 16:26:46 -0700
X-CSE-ConnectionGUID: ozwi1LdfRuKXC2ayHXlC/A==
X-CSE-MsgGUID: 4eS57+1/SR6Cf8oF/BWHQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="226259869"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2026 16:26:44 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wG3RS-000000004i7-0fmP;
	Thu, 23 Apr 2026 23:26:42 +0000
Date: Fri, 24 Apr 2026 07:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/txx9/generic/setup.c:254:9: sparse: sparse: switch
 with no cases
Message-ID: <202604240748.CQkBzvHT-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45dcf5e28813954da4150e7260ccb61e95856176
commit: 9591220e7a6c12c788b1fc013c39af26edf99538 MIPS: txx9: Constify bin_attribute arguments of txx9_sram_{read,write}()
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: mips-randconfig-r123-20260423 (https://download.01.org/0day-ci/archive/20260424/202604240748.CQkBzvHT-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604240748.CQkBzvHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9591220e7a6c ("MIPS: txx9: Constify bin_attribute arguments of txx9_sram_{read,write}()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604240748.CQkBzvHT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/mips/txx9/generic/setup.c:254:9: sparse: sparse: switch with no cases
>> arch/mips/txx9/generic/setup.c:101:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/mips/txx9/generic/setup.c:105:16: sparse: signed value source

vim +254 arch/mips/txx9/generic/setup.c

860e546c19d88c Atsushi Nemoto     2008-08-19   95  
860e546c19d88c Atsushi Nemoto     2008-08-19   96  static struct txx9_board_vec *__init find_board_byname(const char *name)
860e546c19d88c Atsushi Nemoto     2008-08-19   97  {
860e546c19d88c Atsushi Nemoto     2008-08-19   98  	int i;
860e546c19d88c Atsushi Nemoto     2008-08-19   99  
860e546c19d88c Atsushi Nemoto     2008-08-19  100  	/* search board_vecs table */
860e546c19d88c Atsushi Nemoto     2008-08-19 @101  	for (i = 0; i < ARRAY_SIZE(board_vecs); i++) {
860e546c19d88c Atsushi Nemoto     2008-08-19  102  		if (strstr(board_vecs[i]->system, name))
860e546c19d88c Atsushi Nemoto     2008-08-19  103  			return board_vecs[i];
860e546c19d88c Atsushi Nemoto     2008-08-19  104  	}
860e546c19d88c Atsushi Nemoto     2008-08-19  105  	return NULL;
860e546c19d88c Atsushi Nemoto     2008-08-19  106  }
860e546c19d88c Atsushi Nemoto     2008-08-19  107  
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  108  static void __init prom_init_cmdline(void)
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  109  {
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  110  	int argc;
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  111  	int *argv32;
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  112  	int i;			/* Always ignore the "-c" at argv[0] */
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  113  
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  114  	if (fw_arg0 >= CKSEG0 || fw_arg1 < CKSEG0) {
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  115  		/*
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  116  		 * argc is not a valid number, or argv32 is not a valid
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  117  		 * pointer
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  118  		 */
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  119  		argc = 0;
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  120  		argv32 = NULL;
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  121  	} else {
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  122  		argc = (int)fw_arg0;
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  123  		argv32 = (int *)fw_arg1;
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  124  	}
97b0511ce125b0 Geert Uytterhoeven 2008-10-27  125  
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  126  	arcs_cmdline[0] = '\0';
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  127  
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  128  	for (i = 1; i < argc; i++) {
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  129  		char *str = (char *)(long)argv32[i];
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  130  		if (i != 1)
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  131  			strcat(arcs_cmdline, " ");
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  132  		if (strchr(str, ' ')) {
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  133  			strcat(arcs_cmdline, "\"");
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  134  			strcat(arcs_cmdline, str);
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  135  			strcat(arcs_cmdline, "\"");
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  136  		} else
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  137  			strcat(arcs_cmdline, str);
e0dfb20c2b77c6 Atsushi Nemoto     2008-08-19  138  	}
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  139  }
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  140  
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  141  static int txx9_ic_disable __initdata;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  142  static int txx9_dc_disable __initdata;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  143  
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  144  #if defined(CONFIG_CPU_TX49XX)
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  145  /* flush all cache on very early stage (before 4k_cache_init) */
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  146  static void __init early_flush_dcache(void)
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  147  {
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  148  	unsigned int conf = read_c0_config();
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  149  	unsigned int dc_size = 1 << (12 + ((conf & CONF_DC) >> 6));
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  150  	unsigned int linesz = 32;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  151  	unsigned long addr, end;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  152  
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  153  	end = INDEX_BASE + dc_size / 4;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  154  	/* 4way, waybit=0 */
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  155  	for (addr = INDEX_BASE; addr < end; addr += linesz) {
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  156  		cache_op(Index_Writeback_Inv_D, addr | 0);
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  157  		cache_op(Index_Writeback_Inv_D, addr | 1);
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  158  		cache_op(Index_Writeback_Inv_D, addr | 2);
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  159  		cache_op(Index_Writeback_Inv_D, addr | 3);
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  160  	}
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  161  }
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  162  
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  163  static void __init txx9_cache_fixup(void)
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  164  {
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  165  	unsigned int conf;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  166  
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  167  	conf = read_c0_config();
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  168  	/* flush and disable */
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  169  	if (txx9_ic_disable) {
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  170  		conf |= TX49_CONF_IC;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  171  		write_c0_config(conf);
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  172  	}
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  173  	if (txx9_dc_disable) {
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  174  		early_flush_dcache();
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  175  		conf |= TX49_CONF_DC;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  176  		write_c0_config(conf);
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  177  	}
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  178  
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  179  	/* enable cache */
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  180  	conf = read_c0_config();
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  181  	if (!txx9_ic_disable)
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  182  		conf &= ~TX49_CONF_IC;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  183  	if (!txx9_dc_disable)
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  184  		conf &= ~TX49_CONF_DC;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  185  	write_c0_config(conf);
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  186  
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  187  	if (conf & TX49_CONF_IC)
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  188  		pr_info("TX49XX I-Cache disabled.\n");
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  189  	if (conf & TX49_CONF_DC)
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  190  		pr_info("TX49XX D-Cache disabled.\n");
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  191  }
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  192  #else
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  193  static inline void txx9_cache_fixup(void)
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  194  {
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  195  }
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  196  #endif
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  197  
860e546c19d88c Atsushi Nemoto     2008-08-19  198  static void __init preprocess_cmdline(void)
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  199  {
7580c9c3938f45 Dmitri Vorobiev    2009-10-13  200  	static char cmdline[COMMAND_LINE_SIZE] __initdata;
860e546c19d88c Atsushi Nemoto     2008-08-19  201  	char *s;
860e546c19d88c Atsushi Nemoto     2008-08-19  202  
860e546c19d88c Atsushi Nemoto     2008-08-19  203  	strcpy(cmdline, arcs_cmdline);
860e546c19d88c Atsushi Nemoto     2008-08-19  204  	s = cmdline;
860e546c19d88c Atsushi Nemoto     2008-08-19  205  	arcs_cmdline[0] = '\0';
860e546c19d88c Atsushi Nemoto     2008-08-19  206  	while (s && *s) {
860e546c19d88c Atsushi Nemoto     2008-08-19  207  		char *str = strsep(&s, " ");
860e546c19d88c Atsushi Nemoto     2008-08-19  208  		if (strncmp(str, "board=", 6) == 0) {
860e546c19d88c Atsushi Nemoto     2008-08-19  209  			txx9_board_vec = find_board_byname(str + 6);
860e546c19d88c Atsushi Nemoto     2008-08-19  210  			continue;
860e546c19d88c Atsushi Nemoto     2008-08-19  211  		} else if (strncmp(str, "masterclk=", 10) == 0) {
8e9ecbc5e21bf8 Daniel Walter      2014-06-03  212  			unsigned int val;
8e9ecbc5e21bf8 Daniel Walter      2014-06-03  213  			if (kstrtouint(str + 10, 10, &val) == 0)
860e546c19d88c Atsushi Nemoto     2008-08-19  214  				txx9_master_clock = val;
860e546c19d88c Atsushi Nemoto     2008-08-19  215  			continue;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  216  		} else if (strcmp(str, "icdisable") == 0) {
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  217  			txx9_ic_disable = 1;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  218  			continue;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  219  		} else if (strcmp(str, "dcdisable") == 0) {
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  220  			txx9_dc_disable = 1;
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  221  			continue;
c7b95bcb38ea49 Atsushi Nemoto     2008-08-19  222  		} else if (strcmp(str, "toeoff") == 0) {
c7b95bcb38ea49 Atsushi Nemoto     2008-08-19  223  			txx9_ccfg_toeon = 0;
c7b95bcb38ea49 Atsushi Nemoto     2008-08-19  224  			continue;
c7b95bcb38ea49 Atsushi Nemoto     2008-08-19  225  		} else if (strcmp(str, "toeon") == 0) {
c7b95bcb38ea49 Atsushi Nemoto     2008-08-19  226  			txx9_ccfg_toeon = 1;
c7b95bcb38ea49 Atsushi Nemoto     2008-08-19  227  			continue;
860e546c19d88c Atsushi Nemoto     2008-08-19  228  		}
860e546c19d88c Atsushi Nemoto     2008-08-19  229  		if (arcs_cmdline[0])
860e546c19d88c Atsushi Nemoto     2008-08-19  230  			strcat(arcs_cmdline, " ");
860e546c19d88c Atsushi Nemoto     2008-08-19  231  		strcat(arcs_cmdline, str);
860e546c19d88c Atsushi Nemoto     2008-08-19  232  	}
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  233  
d10e025f0e4ba4 Atsushi Nemoto     2008-08-19  234  	txx9_cache_fixup();
860e546c19d88c Atsushi Nemoto     2008-08-19  235  }
860e546c19d88c Atsushi Nemoto     2008-08-19  236  
860e546c19d88c Atsushi Nemoto     2008-08-19  237  static void __init select_board(void)
860e546c19d88c Atsushi Nemoto     2008-08-19  238  {
860e546c19d88c Atsushi Nemoto     2008-08-19  239  	const char *envstr;
860e546c19d88c Atsushi Nemoto     2008-08-19  240  
860e546c19d88c Atsushi Nemoto     2008-08-19  241  	/* first, determine by "board=" argument in preprocess_cmdline() */
860e546c19d88c Atsushi Nemoto     2008-08-19  242  	if (txx9_board_vec)
860e546c19d88c Atsushi Nemoto     2008-08-19  243  		return;
860e546c19d88c Atsushi Nemoto     2008-08-19  244  	/* next, determine by "board" envvar */
860e546c19d88c Atsushi Nemoto     2008-08-19  245  	envstr = prom_getenv("board");
860e546c19d88c Atsushi Nemoto     2008-08-19  246  	if (envstr) {
860e546c19d88c Atsushi Nemoto     2008-08-19  247  		txx9_board_vec = find_board_byname(envstr);
860e546c19d88c Atsushi Nemoto     2008-08-19  248  		if (txx9_board_vec)
860e546c19d88c Atsushi Nemoto     2008-08-19  249  			return;
860e546c19d88c Atsushi Nemoto     2008-08-19  250  	}
860e546c19d88c Atsushi Nemoto     2008-08-19  251  
860e546c19d88c Atsushi Nemoto     2008-08-19  252  	/* select "default" board */
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  253  #ifdef CONFIG_CPU_TX49XX
edcaf1a6a77315 Atsushi Nemoto     2008-07-11 @254  	switch (TX4938_REV_PCODE()) {
8d795f2a5cf733 Atsushi Nemoto     2008-07-18  255  #ifdef CONFIG_TOSHIBA_RBTX4927
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  256  	case 0x4927:
7a1fdf1946b641 Yoichi Yuasa       2008-07-13  257  		txx9_board_vec = &rbtx4927_vec;
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  258  		break;
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  259  	case 0x4937:
7a1fdf1946b641 Yoichi Yuasa       2008-07-13  260  		txx9_board_vec = &rbtx4937_vec;
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  261  		break;
8d795f2a5cf733 Atsushi Nemoto     2008-07-18  262  #endif
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  263  	}
edcaf1a6a77315 Atsushi Nemoto     2008-07-11  264  #endif
860e546c19d88c Atsushi Nemoto     2008-08-19  265  }
860e546c19d88c Atsushi Nemoto     2008-08-19  266  

:::::: The code at line 254 was first introduced by commit
:::::: edcaf1a6a77315562e9781245cc8e028c9a921dc [MIPS] TXx9: Make single kernel can support multiple boards

:::::: TO: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
