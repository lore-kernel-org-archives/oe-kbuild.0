Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08CE17E8
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Nov 2023 01:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqUwIXe/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701134191; x=1732670191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6ORURDLHyfyL9WwCBHzNg7xKs79M17hwU0PD11AeYg=;
  b=OqUwIXe/jd6Dw4CQtTTYHIibMqWwRQSg9q+WN2Zj84ADqR7PV1JTE6r4
   h2PmAFqj+g3bf90i66zDuwQANocnabbjOeRyJ/mHb5mLpBX7DsvuV7Cmh
   ttURuMxg/7QCc9S4KByk3cJaMbvrCwioCmYRXXYM8HtFvX2Dwp3PCHlyi
   ZcaG/rHlZYn9NeFxvb9l4/jNx5cE+wVR7YSSI3kPfJVoV4ZjZ7N+zBKiB
   /y3gGecO5uZJckxwQ9qZGgcSrXuvGKDG6LrKAgiXCA9IMd63ear9g1Ubl
   Icda1mGfG9ayUm19e4i/MwVuCMqoaAprXav96iB2/hWyT3JDqB5EYmjT8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377856430"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="377856430"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 17:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="838901764"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="838901764"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Nov 2023 17:16:29 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7miB-0006qd-0T;
	Tue, 28 Nov 2023 01:16:27 +0000
Date: Tue, 28 Nov 2023 09:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arc/mm/cache.c:120 arc_cache_mumbojumbo() error: uninitialized
 symbol 'assoc'.
Message-ID: <202311280736.DhF7a9JU-lkp@intel.com>
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
commit: 17a5ed563aaf0d66bf0438ee2df016f636846a84 ARC: boot log: eliminate struct cpuinfo_arc #2: cache
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-r071-20231128 (https://download.01.org/0day-ci/archive/20231128/202311280736.DhF7a9JU-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280736.DhF7a9JU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311280736.DhF7a9JU-lkp@intel.com/

New smatch warnings:
arch/arc/mm/cache.c:120 arc_cache_mumbojumbo() error: uninitialized symbol 'assoc'.
arch/arc/mm/cache.c:150 arc_cache_mumbojumbo() error: uninitialized symbol 'vipt'.

Old smatch warnings:
arch/arc/mm/cache.c:149 arc_cache_mumbojumbo() error: uninitialized symbol 'assoc'.
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/assoc +120 arch/arc/mm/cache.c

fd0881a24ac9ab arch/arc/mm/cache.c        Vineet Gupta 2015-08-21   99  
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  100  char *arc_cache_mumbojumbo(int c, char *buf, int len)
fd0881a24ac9ab arch/arc/mm/cache.c        Vineet Gupta 2015-08-21  101  {
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  102  	struct cpuinfo_arc_cache *p_ic = &ic_info, *p_dc = &dc_info;
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  103  	struct bcr_cache ibcr, dbcr;
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  104  	int vipt, assoc;
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  105  	int n = 0;
fd0881a24ac9ab arch/arc/mm/cache.c        Vineet Gupta 2015-08-21  106  
95d6976d20a25f arch/arc/mm/cache_arc700.c Vineet Gupta 2013-01-18  107  	READ_BCR(ARC_REG_IC_BCR, ibcr);
da40ff48bda631 arch/arc/mm/cache_arc700.c Vineet Gupta 2014-06-27  108  	if (!ibcr.ver)
da40ff48bda631 arch/arc/mm/cache_arc700.c Vineet Gupta 2014-06-27  109  		goto dc_chk;
da40ff48bda631 arch/arc/mm/cache_arc700.c Vineet Gupta 2014-06-27  110  
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  111  	if (is_isa_arcompact() && (ibcr.ver <= 3)) {
30499186602afa arch/arc/mm/cache_arc700.c Vineet Gupta 2013-06-15  112  		BUG_ON(ibcr.config != 3);
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  113  		assoc = 2;		/* Fixed to 2w set assoc */
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  114  	} else if (is_isa_arcv2() && (ibcr.ver >= 4)) {
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  115  		assoc = 1 << ibcr.config;	/* 1,2,4,8 */
d1f317d8254413 arch/arc/mm/cache.c        Vineet Gupta 2015-04-06  116  	}
d1f317d8254413 arch/arc/mm/cache.c        Vineet Gupta 2015-04-06  117  
95d6976d20a25f arch/arc/mm/cache_arc700.c Vineet Gupta 2013-01-18  118  	p_ic->line_len = 8 << ibcr.line_len;
da40ff48bda631 arch/arc/mm/cache_arc700.c Vineet Gupta 2014-06-27  119  	p_ic->sz_k = 1 << (ibcr.sz - 1);
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10 @120  	p_ic->colors = p_ic->sz_k/assoc/TO_KB(PAGE_SIZE);
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  121  
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  122  	n += scnprintf(buf + n, len - n,
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  123  			"I-Cache\t\t: %uK, %dway/set, %uB Line, VIPT%s%s\n",
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  124  			p_ic->sz_k, assoc, p_ic->line_len,
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  125  			p_ic->colors > 1 ? " aliasing" : "",
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  126  			IS_USED_CFG(CONFIG_ARC_HAS_ICACHE));
95d6976d20a25f arch/arc/mm/cache_arc700.c Vineet Gupta 2013-01-18  127  
da40ff48bda631 arch/arc/mm/cache_arc700.c Vineet Gupta 2014-06-27  128  dc_chk:
95d6976d20a25f arch/arc/mm/cache_arc700.c Vineet Gupta 2013-01-18  129  	READ_BCR(ARC_REG_DC_BCR, dbcr);
da40ff48bda631 arch/arc/mm/cache_arc700.c Vineet Gupta 2014-06-27  130  	if (!dbcr.ver)
d1f317d8254413 arch/arc/mm/cache.c        Vineet Gupta 2015-04-06  131  		goto slc_chk;
da40ff48bda631 arch/arc/mm/cache_arc700.c Vineet Gupta 2014-06-27  132  
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  133  	if (is_isa_arcompact() && (dbcr.ver <= 3)) {
30499186602afa arch/arc/mm/cache_arc700.c Vineet Gupta 2013-06-15  134  		BUG_ON(dbcr.config != 2);
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  135  		vipt = 1;
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  136  		assoc = 4;		/* Fixed to 4w set assoc */
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  137  		p_dc->colors = p_dc->sz_k/assoc/TO_KB(PAGE_SIZE);
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  138  	} else if (is_isa_arcv2() && (dbcr.ver >= 4)) {
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  139  		vipt = 0;
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  140  		assoc = 1 << dbcr.config;	/* 1,2,4,8 */
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  141  		p_dc->colors = 1;		/* PIPT so can't VIPT alias */
d1f317d8254413 arch/arc/mm/cache.c        Vineet Gupta 2015-04-06  142  	}
d1f317d8254413 arch/arc/mm/cache.c        Vineet Gupta 2015-04-06  143  
95d6976d20a25f arch/arc/mm/cache_arc700.c Vineet Gupta 2013-01-18  144  	p_dc->line_len = 16 << dbcr.line_len;
da40ff48bda631 arch/arc/mm/cache_arc700.c Vineet Gupta 2014-06-27  145  	p_dc->sz_k = 1 << (dbcr.sz - 1);
d1f317d8254413 arch/arc/mm/cache.c        Vineet Gupta 2015-04-06  146  
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  147  	n += scnprintf(buf + n, len - n,
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  148  			"D-Cache\t\t: %uK, %dway/set, %uB Line, %s%s%s\n",
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  149  			p_dc->sz_k, assoc, p_dc->line_len,
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10 @150  			vipt ? "VIPT" : "PIPT",
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  151  			p_dc->colors > 1 ? " aliasing" : "",
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  152  			IS_USED_CFG(CONFIG_ARC_HAS_DCACHE));
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  153  
d1f317d8254413 arch/arc/mm/cache.c        Vineet Gupta 2015-04-06  154  slc_chk:
fd0881a24ac9ab arch/arc/mm/cache.c        Vineet Gupta 2015-08-21  155  	if (is_isa_arcv2())
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  156  		read_decode_cache_bcr_arcv2(c, buf + n, len - n);
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  157  
17a5ed563aaf0d arch/arc/mm/cache.c        Vineet Gupta 2020-06-10  158  	return buf;
95d6976d20a25f arch/arc/mm/cache_arc700.c Vineet Gupta 2013-01-18  159  }
95d6976d20a25f arch/arc/mm/cache_arc700.c Vineet Gupta 2013-01-18  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
