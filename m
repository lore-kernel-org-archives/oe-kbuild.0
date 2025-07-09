Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599142F4A
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Jul 2025 01:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752023423; cv=none; b=GOwBIhRfWY5O0Ok7/Oj02slDDZYlEHsk1AmQO/O8O0PeKoDjlMMac94XiC/IDhz0uE+Dp9YC0RNVWaj9ovZQNj/ini4cXjkEMJzK2gjiohxQoMe/o8dCEocimtaKFB0NTtQmc8Wd8P/QmZQ624SM9/YB9S28TzB9GqHFnyJn/20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752023423; c=relaxed/simple;
	bh=A3zA8cvOy+T7ZNzBqQDEkuA/wA3egWMxWt/O+Q8QT8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=px8vkJ5/DcPOwnFw/nWLBz7euhL/ldttqdoWMdHa4H90PzNy71pvN3w2WBKHXS1Qv4twm7QpP5dJyEDrvfcikTkUkoEh9rjpr+P46HaZRXiMETi6xic2rJ5zK7n/l2Ynv1aybDa3wdmdU08l5ogkiS/DzGdLyHDCbNhKOGHaUkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huFqsmRP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huFqsmRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752023421; x=1783559421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3zA8cvOy+T7ZNzBqQDEkuA/wA3egWMxWt/O+Q8QT8k=;
  b=huFqsmRP6pV8AJDYcHBF/dExCEbFePXHJ6lGhyOPfZrUa4IuEieN2nfo
   kjh4b13rNzA5pbNelAR5RNuDd94UQKlbrlYKWubWyeAahr/5TRJ/l9drs
   31tcZEoaBLXhyRAmvc092eC3IDAbx+NxD65kJgQuFET5zWm+WQso/5EvH
   ThngvYQeUMD3HDUScfHi7u7v9PbEPQHlnyZd5SnRtH+NNnnmHxvNagIvW
   gmeMzAZZOsp6ScjOqzF5bzzmfAwpMn/oaXX9Fu3LQoOlob6V6E6DzSA+s
   hiOT4496vDTLeyjgIKCfT25EWw6YP+B74Vbbo+vHriWz/PYT95lMRvonE
   Q==;
X-CSE-ConnectionGUID: 1kZn215sQ6KdwVZ3wL/aWw==
X-CSE-MsgGUID: /ivZV0xCS/2sa0OO2OoNSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54205890"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54205890"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:10:20 -0700
X-CSE-ConnectionGUID: aUX4j8Z3RfiUxQTemsARJQ==
X-CSE-MsgGUID: 13ErCBUoTaqtM7/zjXMFnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="160165756"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jul 2025 18:10:19 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZJKC-0002wF-26;
	Wed, 09 Jul 2025 01:10:16 +0000
Date: Wed, 9 Jul 2025 09:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6816/7381] arch/x86/kernel/crash.c:205
 elf_header_exclude_ranges() warn: we never enter this loop
Message-ID: <202507090913.B5udTYGY-lkp@intel.com>
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
TO: Jiri Bohac <jbohac@suse.cz>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   58ba80c4740212c29a1cf9b48f588e60a7612209
commit: 26c5d469ef66f8f17948d6708cdc5097935f0a04 [6816/7381] x86: implement crashkernel cma reservation
:::::: branch date: 15 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20250709 (https://download.01.org/0day-ci/archive/20250709/202507090913.B5udTYGY-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507090913.B5udTYGY-lkp@intel.com/

smatch warnings:
arch/x86/kernel/crash.c:205 elf_header_exclude_ranges() warn: we never enter this loop
arch/x86/kernel/crash.c:387 crash_setup_memmap_entries() warn: we never enter this loop

vim +205 arch/x86/kernel/crash.c

dd5f726076cc76 Vivek Goyal             2014-08-08  179  
dd5f726076cc76 Vivek Goyal             2014-08-08  180  /*
dd5f726076cc76 Vivek Goyal             2014-08-08  181   * Look for any unwanted ranges between mstart, mend and remove them. This
8d5f894a3108ac AKASHI Takahiro         2018-04-13  182   * might lead to split and split ranges are put in cmem->ranges[] array
dd5f726076cc76 Vivek Goyal             2014-08-08  183   */
8d5f894a3108ac AKASHI Takahiro         2018-04-13  184  static int elf_header_exclude_ranges(struct crash_mem *cmem)
dd5f726076cc76 Vivek Goyal             2014-08-08  185  {
dd5f726076cc76 Vivek Goyal             2014-08-08  186  	int ret = 0;
26c5d469ef66f8 Jiri Bohac              2025-06-12  187  	int i;
dd5f726076cc76 Vivek Goyal             2014-08-08  188  
7c321eb2b843bf Lianbo Jiang            2019-11-08  189  	/* Exclude the low 1M because it is always reserved */
61bb219f9d83c1 Yuntao Wang             2024-01-02  190  	ret = crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
7c321eb2b843bf Lianbo Jiang            2019-11-08  191  	if (ret)
7c321eb2b843bf Lianbo Jiang            2019-11-08  192  		return ret;
7c321eb2b843bf Lianbo Jiang            2019-11-08  193  
dd5f726076cc76 Vivek Goyal             2014-08-08  194  	/* Exclude crashkernel region */
babac4a84a8884 AKASHI Takahiro         2018-04-13  195  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
dd5f726076cc76 Vivek Goyal             2014-08-08  196  	if (ret)
dd5f726076cc76 Vivek Goyal             2014-08-08  197  		return ret;
dd5f726076cc76 Vivek Goyal             2014-08-08  198  
9eff303725da65 Borislav Petkov         2019-11-14  199  	if (crashk_low_res.end)
babac4a84a8884 AKASHI Takahiro         2018-04-13  200  		ret = crash_exclude_mem_range(cmem, crashk_low_res.start,
babac4a84a8884 AKASHI Takahiro         2018-04-13  201  					      crashk_low_res.end);
26c5d469ef66f8 Jiri Bohac              2025-06-12  202  	if (ret)
26c5d469ef66f8 Jiri Bohac              2025-06-12  203  		return ret;
dd5f726076cc76 Vivek Goyal             2014-08-08  204  
26c5d469ef66f8 Jiri Bohac              2025-06-12 @205  	for (i = 0; i < crashk_cma_cnt; ++i) {
26c5d469ef66f8 Jiri Bohac              2025-06-12  206  		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
26c5d469ef66f8 Jiri Bohac              2025-06-12  207  					      crashk_cma_ranges[i].end);
26c5d469ef66f8 Jiri Bohac              2025-06-12  208  		if (ret)
dd5f726076cc76 Vivek Goyal             2014-08-08  209  			return ret;
dd5f726076cc76 Vivek Goyal             2014-08-08  210  	}
dd5f726076cc76 Vivek Goyal             2014-08-08  211  
26c5d469ef66f8 Jiri Bohac              2025-06-12  212  	return 0;
26c5d469ef66f8 Jiri Bohac              2025-06-12  213  }
26c5d469ef66f8 Jiri Bohac              2025-06-12  214  
1d2e733b13b450 Tom Lendacky            2017-10-20  215  static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
dd5f726076cc76 Vivek Goyal             2014-08-08  216  {
8d5f894a3108ac AKASHI Takahiro         2018-04-13  217  	struct crash_mem *cmem = arg;
dd5f726076cc76 Vivek Goyal             2014-08-08  218  
cbe6601617302b AKASHI Takahiro         2018-04-13  219  	cmem->ranges[cmem->nr_ranges].start = res->start;
cbe6601617302b AKASHI Takahiro         2018-04-13  220  	cmem->ranges[cmem->nr_ranges].end = res->end;
cbe6601617302b AKASHI Takahiro         2018-04-13  221  	cmem->nr_ranges++;
dd5f726076cc76 Vivek Goyal             2014-08-08  222  
cbe6601617302b AKASHI Takahiro         2018-04-13  223  	return 0;
dd5f726076cc76 Vivek Goyal             2014-08-08  224  }
dd5f726076cc76 Vivek Goyal             2014-08-08  225  
dd5f726076cc76 Vivek Goyal             2014-08-08  226  /* Prepare elf headers. Return addr and size */
83d4a42a916677 Yuntao Wang             2024-01-02  227  static int prepare_elf_headers(void **addr, unsigned long *sz,
83d4a42a916677 Yuntao Wang             2024-01-02  228  			       unsigned long *nr_mem_ranges)
dd5f726076cc76 Vivek Goyal             2014-08-08  229  {
8d5f894a3108ac AKASHI Takahiro         2018-04-13  230  	struct crash_mem *cmem;
7c321eb2b843bf Lianbo Jiang            2019-11-08  231  	int ret;
dd5f726076cc76 Vivek Goyal             2014-08-08  232  
8d5f894a3108ac AKASHI Takahiro         2018-04-13  233  	cmem = fill_up_crash_elf_data();
8d5f894a3108ac AKASHI Takahiro         2018-04-13  234  	if (!cmem)
dd5f726076cc76 Vivek Goyal             2014-08-08  235  		return -ENOMEM;
dd5f726076cc76 Vivek Goyal             2014-08-08  236  
9eff303725da65 Borislav Petkov         2019-11-14  237  	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
cbe6601617302b AKASHI Takahiro         2018-04-13  238  	if (ret)
cbe6601617302b AKASHI Takahiro         2018-04-13  239  		goto out;
cbe6601617302b AKASHI Takahiro         2018-04-13  240  
cbe6601617302b AKASHI Takahiro         2018-04-13  241  	/* Exclude unwanted mem ranges */
8d5f894a3108ac AKASHI Takahiro         2018-04-13  242  	ret = elf_header_exclude_ranges(cmem);
cbe6601617302b AKASHI Takahiro         2018-04-13  243  	if (ret)
cbe6601617302b AKASHI Takahiro         2018-04-13  244  		goto out;
cbe6601617302b AKASHI Takahiro         2018-04-13  245  
ea53ad9cf73b6b Eric DeVolder           2023-08-14  246  	/* Return the computed number of memory ranges, for hotplug usage */
ea53ad9cf73b6b Eric DeVolder           2023-08-14  247  	*nr_mem_ranges = cmem->nr_ranges;
ea53ad9cf73b6b Eric DeVolder           2023-08-14  248  
dd5f726076cc76 Vivek Goyal             2014-08-08  249  	/* By default prepare 64bit headers */
9eff303725da65 Borislav Petkov         2019-11-14  250  	ret = crash_prepare_elf64_headers(cmem, IS_ENABLED(CONFIG_X86_64), addr, sz);
cbe6601617302b AKASHI Takahiro         2018-04-13  251  
cbe6601617302b AKASHI Takahiro         2018-04-13  252  out:
8d5f894a3108ac AKASHI Takahiro         2018-04-13  253  	vfree(cmem);
dd5f726076cc76 Vivek Goyal             2014-08-08  254  	return ret;
dd5f726076cc76 Vivek Goyal             2014-08-08  255  }
ea53ad9cf73b6b Eric DeVolder           2023-08-14  256  #endif
dd5f726076cc76 Vivek Goyal             2014-08-08  257  
ea53ad9cf73b6b Eric DeVolder           2023-08-14  258  #ifdef CONFIG_KEXEC_FILE
8ec67d97bff592 Ingo Molnar             2017-01-27  259  static int add_e820_entry(struct boot_params *params, struct e820_entry *entry)
dd5f726076cc76 Vivek Goyal             2014-08-08  260  {
dd5f726076cc76 Vivek Goyal             2014-08-08  261  	unsigned int nr_e820_entries;
dd5f726076cc76 Vivek Goyal             2014-08-08  262  
dd5f726076cc76 Vivek Goyal             2014-08-08  263  	nr_e820_entries = params->e820_entries;
08b46d5dd869ea Ingo Molnar             2017-01-28  264  	if (nr_e820_entries >= E820_MAX_ENTRIES_ZEROPAGE)
dd5f726076cc76 Vivek Goyal             2014-08-08  265  		return 1;
dd5f726076cc76 Vivek Goyal             2014-08-08  266  
9eff303725da65 Borislav Petkov         2019-11-14  267  	memcpy(&params->e820_table[nr_e820_entries], entry, sizeof(struct e820_entry));
dd5f726076cc76 Vivek Goyal             2014-08-08  268  	params->e820_entries++;
dd5f726076cc76 Vivek Goyal             2014-08-08  269  	return 0;
dd5f726076cc76 Vivek Goyal             2014-08-08  270  }
dd5f726076cc76 Vivek Goyal             2014-08-08  271  
1d2e733b13b450 Tom Lendacky            2017-10-20  272  static int memmap_entry_callback(struct resource *res, void *arg)
dd5f726076cc76 Vivek Goyal             2014-08-08  273  {
dd5f726076cc76 Vivek Goyal             2014-08-08  274  	struct crash_memmap_data *cmd = arg;
dd5f726076cc76 Vivek Goyal             2014-08-08  275  	struct boot_params *params = cmd->params;
8ec67d97bff592 Ingo Molnar             2017-01-27  276  	struct e820_entry ei;
dd5f726076cc76 Vivek Goyal             2014-08-08  277  
1d2e733b13b450 Tom Lendacky            2017-10-20  278  	ei.addr = res->start;
9275b933d409d3 kbuild test robot       2017-11-08  279  	ei.size = resource_size(res);
dd5f726076cc76 Vivek Goyal             2014-08-08  280  	ei.type = cmd->type;
dd5f726076cc76 Vivek Goyal             2014-08-08  281  	add_e820_entry(params, &ei);
dd5f726076cc76 Vivek Goyal             2014-08-08  282  
dd5f726076cc76 Vivek Goyal             2014-08-08  283  	return 0;
dd5f726076cc76 Vivek Goyal             2014-08-08  284  }
dd5f726076cc76 Vivek Goyal             2014-08-08  285  
dd5f726076cc76 Vivek Goyal             2014-08-08  286  static int memmap_exclude_ranges(struct kimage *image, struct crash_mem *cmem,
dd5f726076cc76 Vivek Goyal             2014-08-08  287  				 unsigned long long mstart,
dd5f726076cc76 Vivek Goyal             2014-08-08  288  				 unsigned long long mend)
dd5f726076cc76 Vivek Goyal             2014-08-08  289  {
dd5f726076cc76 Vivek Goyal             2014-08-08  290  	unsigned long start, end;
5eb3f60554216b Coiby Xu                2025-05-02  291  	int ret;
dd5f726076cc76 Vivek Goyal             2014-08-08  292  
dd5f726076cc76 Vivek Goyal             2014-08-08  293  	cmem->ranges[0].start = mstart;
dd5f726076cc76 Vivek Goyal             2014-08-08  294  	cmem->ranges[0].end = mend;
dd5f726076cc76 Vivek Goyal             2014-08-08  295  	cmem->nr_ranges = 1;
dd5f726076cc76 Vivek Goyal             2014-08-08  296  
dd5f726076cc76 Vivek Goyal             2014-08-08  297  	/* Exclude elf header region */
179350f00e0663 Lakshmi Ramasubramanian 2021-02-21  298  	start = image->elf_load_addr;
179350f00e0663 Lakshmi Ramasubramanian 2021-02-21  299  	end = start + image->elf_headers_sz - 1;
5eb3f60554216b Coiby Xu                2025-05-02  300  	ret = crash_exclude_mem_range(cmem, start, end);
5eb3f60554216b Coiby Xu                2025-05-02  301  
5eb3f60554216b Coiby Xu                2025-05-02  302  	if (ret)
5eb3f60554216b Coiby Xu                2025-05-02  303  		return ret;
5eb3f60554216b Coiby Xu                2025-05-02  304  
5eb3f60554216b Coiby Xu                2025-05-02  305  	/* Exclude dm crypt keys region */
5eb3f60554216b Coiby Xu                2025-05-02  306  	if (image->dm_crypt_keys_addr) {
5eb3f60554216b Coiby Xu                2025-05-02  307  		start = image->dm_crypt_keys_addr;
5eb3f60554216b Coiby Xu                2025-05-02  308  		end = start + image->dm_crypt_keys_sz - 1;
babac4a84a8884 AKASHI Takahiro         2018-04-13  309  		return crash_exclude_mem_range(cmem, start, end);
dd5f726076cc76 Vivek Goyal             2014-08-08  310  	}
dd5f726076cc76 Vivek Goyal             2014-08-08  311  
5eb3f60554216b Coiby Xu                2025-05-02  312  	return ret;
5eb3f60554216b Coiby Xu                2025-05-02  313  }
5eb3f60554216b Coiby Xu                2025-05-02  314  
dd5f726076cc76 Vivek Goyal             2014-08-08  315  /* Prepare memory map for crash dump kernel */
dd5f726076cc76 Vivek Goyal             2014-08-08  316  int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
dd5f726076cc76 Vivek Goyal             2014-08-08  317  {
5eb3f60554216b Coiby Xu                2025-05-02  318  	unsigned int nr_ranges = 0;
dd5f726076cc76 Vivek Goyal             2014-08-08  319  	int i, ret = 0;
dd5f726076cc76 Vivek Goyal             2014-08-08  320  	unsigned long flags;
8ec67d97bff592 Ingo Molnar             2017-01-27  321  	struct e820_entry ei;
dd5f726076cc76 Vivek Goyal             2014-08-08  322  	struct crash_memmap_data cmd;
dd5f726076cc76 Vivek Goyal             2014-08-08  323  	struct crash_mem *cmem;
dd5f726076cc76 Vivek Goyal             2014-08-08  324  
5eb3f60554216b Coiby Xu                2025-05-02  325  	/*
5eb3f60554216b Coiby Xu                2025-05-02  326  	 * Using random kexec_buf for passing dm crypt keys may cause a range
5eb3f60554216b Coiby Xu                2025-05-02  327  	 * split. So use two slots here.
5eb3f60554216b Coiby Xu                2025-05-02  328  	 */
5eb3f60554216b Coiby Xu                2025-05-02  329  	nr_ranges = 2;
5eb3f60554216b Coiby Xu                2025-05-02  330  	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
dd5f726076cc76 Vivek Goyal             2014-08-08  331  	if (!cmem)
dd5f726076cc76 Vivek Goyal             2014-08-08  332  		return -ENOMEM;
dd5f726076cc76 Vivek Goyal             2014-08-08  333  
5eb3f60554216b Coiby Xu                2025-05-02  334  	cmem->max_nr_ranges = nr_ranges;
5eb3f60554216b Coiby Xu                2025-05-02  335  	cmem->nr_ranges = 0;
5eb3f60554216b Coiby Xu                2025-05-02  336  
dd5f726076cc76 Vivek Goyal             2014-08-08  337  	memset(&cmd, 0, sizeof(struct crash_memmap_data));
dd5f726076cc76 Vivek Goyal             2014-08-08  338  	cmd.params = params;
dd5f726076cc76 Vivek Goyal             2014-08-08  339  
7c321eb2b843bf Lianbo Jiang            2019-11-08  340  	/* Add the low 1M */
7c321eb2b843bf Lianbo Jiang            2019-11-08  341  	cmd.type = E820_TYPE_RAM;
7c321eb2b843bf Lianbo Jiang            2019-11-08  342  	flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
7c321eb2b843bf Lianbo Jiang            2019-11-08  343  	walk_iomem_res_desc(IORES_DESC_NONE, flags, 0, (1<<20)-1, &cmd,
7c321eb2b843bf Lianbo Jiang            2019-11-08  344  			    memmap_entry_callback);
dd5f726076cc76 Vivek Goyal             2014-08-08  345  
dd5f726076cc76 Vivek Goyal             2014-08-08  346  	/* Add ACPI tables */
09821ff1d50a1e Ingo Molnar             2017-01-28  347  	cmd.type = E820_TYPE_ACPI;
dd5f726076cc76 Vivek Goyal             2014-08-08  348  	flags = IORESOURCE_MEM | IORESOURCE_BUSY;
f0f4711aa16b82 Toshi Kani              2016-01-26  349  	walk_iomem_res_desc(IORES_DESC_ACPI_TABLES, flags, 0, -1, &cmd,
dd5f726076cc76 Vivek Goyal             2014-08-08  350  			    memmap_entry_callback);
dd5f726076cc76 Vivek Goyal             2014-08-08  351  
dd5f726076cc76 Vivek Goyal             2014-08-08  352  	/* Add ACPI Non-volatile Storage */
09821ff1d50a1e Ingo Molnar             2017-01-28  353  	cmd.type = E820_TYPE_NVS;
f0f4711aa16b82 Toshi Kani              2016-01-26  354  	walk_iomem_res_desc(IORES_DESC_ACPI_NV_STORAGE, flags, 0, -1, &cmd,
dd5f726076cc76 Vivek Goyal             2014-08-08  355  			    memmap_entry_callback);
dd5f726076cc76 Vivek Goyal             2014-08-08  356  
980621daf368f2 Lianbo Jiang            2019-04-23  357  	/* Add e820 reserved ranges */
980621daf368f2 Lianbo Jiang            2019-04-23  358  	cmd.type = E820_TYPE_RESERVED;
980621daf368f2 Lianbo Jiang            2019-04-23  359  	flags = IORESOURCE_MEM;
980621daf368f2 Lianbo Jiang            2019-04-23  360  	walk_iomem_res_desc(IORES_DESC_RESERVED, flags, 0, -1, &cmd,
980621daf368f2 Lianbo Jiang            2019-04-23  361  			    memmap_entry_callback);
980621daf368f2 Lianbo Jiang            2019-04-23  362  
dd5f726076cc76 Vivek Goyal             2014-08-08  363  	/* Add crashk_low_res region */
dd5f726076cc76 Vivek Goyal             2014-08-08  364  	if (crashk_low_res.end) {
dd5f726076cc76 Vivek Goyal             2014-08-08  365  		ei.addr = crashk_low_res.start;
1429b568ad7194 Julia Lawall            2020-01-01  366  		ei.size = resource_size(&crashk_low_res);
09821ff1d50a1e Ingo Molnar             2017-01-28  367  		ei.type = E820_TYPE_RAM;
dd5f726076cc76 Vivek Goyal             2014-08-08  368  		add_e820_entry(params, &ei);
dd5f726076cc76 Vivek Goyal             2014-08-08  369  	}
dd5f726076cc76 Vivek Goyal             2014-08-08  370  
dd5f726076cc76 Vivek Goyal             2014-08-08  371  	/* Exclude some ranges from crashk_res and add rest to memmap */
9eff303725da65 Borislav Petkov         2019-11-14  372  	ret = memmap_exclude_ranges(image, cmem, crashk_res.start, crashk_res.end);
dd5f726076cc76 Vivek Goyal             2014-08-08  373  	if (ret)
dd5f726076cc76 Vivek Goyal             2014-08-08  374  		goto out;
dd5f726076cc76 Vivek Goyal             2014-08-08  375  
dd5f726076cc76 Vivek Goyal             2014-08-08  376  	for (i = 0; i < cmem->nr_ranges; i++) {
dd5f726076cc76 Vivek Goyal             2014-08-08  377  		ei.size = cmem->ranges[i].end - cmem->ranges[i].start + 1;
dd5f726076cc76 Vivek Goyal             2014-08-08  378  
dd5f726076cc76 Vivek Goyal             2014-08-08  379  		/* If entry is less than a page, skip it */
dd5f726076cc76 Vivek Goyal             2014-08-08  380  		if (ei.size < PAGE_SIZE)
dd5f726076cc76 Vivek Goyal             2014-08-08  381  			continue;
dd5f726076cc76 Vivek Goyal             2014-08-08  382  		ei.addr = cmem->ranges[i].start;
09821ff1d50a1e Ingo Molnar             2017-01-28  383  		ei.type = E820_TYPE_RAM;
dd5f726076cc76 Vivek Goyal             2014-08-08  384  		add_e820_entry(params, &ei);
dd5f726076cc76 Vivek Goyal             2014-08-08  385  	}
dd5f726076cc76 Vivek Goyal             2014-08-08  386  
26c5d469ef66f8 Jiri Bohac              2025-06-12 @387  	for (i = 0; i < crashk_cma_cnt; ++i) {
26c5d469ef66f8 Jiri Bohac              2025-06-12  388  		ei.addr = crashk_cma_ranges[i].start;
26c5d469ef66f8 Jiri Bohac              2025-06-12  389  		ei.size = crashk_cma_ranges[i].end -
26c5d469ef66f8 Jiri Bohac              2025-06-12  390  			  crashk_cma_ranges[i].start + 1;
26c5d469ef66f8 Jiri Bohac              2025-06-12  391  		ei.type = E820_TYPE_RAM;
26c5d469ef66f8 Jiri Bohac              2025-06-12  392  		add_e820_entry(params, &ei);
26c5d469ef66f8 Jiri Bohac              2025-06-12  393  	}
26c5d469ef66f8 Jiri Bohac              2025-06-12  394  
dd5f726076cc76 Vivek Goyal             2014-08-08  395  out:
dd5f726076cc76 Vivek Goyal             2014-08-08  396  	vfree(cmem);
dd5f726076cc76 Vivek Goyal             2014-08-08  397  	return ret;
dd5f726076cc76 Vivek Goyal             2014-08-08  398  }
dd5f726076cc76 Vivek Goyal             2014-08-08  399  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
