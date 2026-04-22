Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40345309F1B
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Apr 2026 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776884046; cv=none; b=Ap7QT04AzwLlZDdYQkFuM5mqEv1GXqOSeYAUbh3dBg2qJfRUZ5GSlsUkW4hSX+6tch4JVEn/hI4Xu6P2Oqqo2DNB49JM8OlXyjLJK63oKb5trLIy7Qmj+Tg/6LaamZZcoOhtuf8yMEM7vpQN76TpfllfmLfTxG8D/tE1sMO1Pas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776884046; c=relaxed/simple;
	bh=8QqPshwYoSsp91Eu90C5hUC3zTXLL1aGMfCdXS4PNw0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a4iN4UE+GIeR/BMEHtYQHJF8QArnapgBMGBOD0gxOrVWWiT6pz5V6RDISZw99Ob00Sshfyc+7KLvbSyB83JDj9MCkIPoum/gXZo7gO31cyHgZL/S5cW0LOTT5Cjm+roHjV5Y2MRw4yvsQ8tP+nBGTcEYl8rdrFvnC20CZ3E90X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/V5AsE+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/V5AsE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776884044; x=1808420044;
  h=date:from:to:cc:subject:message-id;
  bh=8QqPshwYoSsp91Eu90C5hUC3zTXLL1aGMfCdXS4PNw0=;
  b=R/V5AsE+9ISVpU2QBRHRfkjfrgg0+wXYIX7uZoXCgOe3UmdpDVk79TMz
   WeZ5G5OGOUrH80/S0R9QHvtepid0EOpPg/4zy8CTJLpdSPe3nfER7WSzv
   2NhroFKQoSPLyh5X9zI4dOoKTThhCiIipVElHwDZxFzxgcfWVGCqPs3Xt
   4zya//w6cowdhmtQgdgNCMHH8dAOCaH7fMl74JCvfJZN7PilA937wVehW
   PTZSpJxh8KWKDGcKtlobqt69Dm2RaiTmSJjx1wkiINxnKlaiDbGpTMmqK
   bDrPBE5xFHKFUgP2f+msDivq1AV0bAKxm7gKHwxgJ+ywH6HNaBkvzjcL0
   Q==;
X-CSE-ConnectionGUID: cvIhAjUqT1GDB5OyeyD94A==
X-CSE-MsgGUID: 0oOS2zdmSw+RGNhKFhe0aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="78033402"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="78033402"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 11:54:03 -0700
X-CSE-ConnectionGUID: n3L0AT5IQEKEHc6Ti8FJmg==
X-CSE-MsgGUID: PT4LPZ4ARBW4lZKjKv9ixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="232337901"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Apr 2026 11:50:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFcei-000000002qL-01Gc;
	Wed, 22 Apr 2026 18:50:36 +0000
Date: Wed, 22 Apr 2026 20:50:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 218/218]
 arch/x86/kernel/cpu/proc.c:113:9: warning: 'total' is used uninitialized
Message-ID: <202604222023.Uh6Fp3KJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   db8b81c14b7031c5b1420d57fbeb18056546ddcf
commit: 9456d39ed92feb4b6ba6489540556de73001d601 [218/218] cpumask: Switch from inline to __always_inline
:::::: branch date: 7 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260422/202604222023.Uh6Fp3KJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604222023.Uh6Fp3KJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604222023.Uh6Fp3KJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/proc.c: In function 'show_cpuinfo':
>> arch/x86/kernel/cpu/proc.c:113:9: warning: 'total' is used uninitialized [-Wuninitialized]
     113 |         show_cpuinfo_core(m, c, cpu, index, rich_container, total);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/proc.c:74:34: note: 'total' was declared here
      74 |         unsigned int cpu, index, total;
         |                                  ^~~~~


vim +/total +113 arch/x86/kernel/cpu/proc.c

a967ceac01cd38 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20   70  
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   71  static int show_cpuinfo(struct seq_file *m, void *v)
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   72  {
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   73  	struct cpuinfo_x86 *c = v;
df60310ad7866c arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   74  	unsigned int cpu, index, total;
a967ceac01cd38 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20   75  	int i;
df60310ad7866c arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   76  	bool rich_container = false;
df60310ad7866c arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   77  
df60310ad7866c arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   78  	index = cpu = c->cpu_index;
df60310ad7866c arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   79  	if (check_rich_container(cpu, &index, &rich_container, &total))
df60310ad7866c arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   80  		return 0;
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   81  
a967ceac01cd38 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20   82  	seq_printf(m, "processor\t: %u\n"
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   83  		   "vendor_id\t: %s\n"
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   84  		   "cpu family\t: %d\n"
a967ceac01cd38 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20   85  		   "model\t\t: %u\n"
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   86  		   "model name\t: %s\n",
df60310ad7866c arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04   87  		   index,
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   88  		   c->x86_vendor_id[0] ? c->x86_vendor_id : "unknown",
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   89  		   c->x86,
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   90  		   c->x86_model,
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   91  		   c->x86_model_id[0] ? c->x86_model_id : "unknown");
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   92  
b399151cb48db3 arch/x86/kernel/cpu/proc.c  Jia Zhang           2018-01-01   93  	if (c->x86_stepping || c->cpuid_level >= 0)
b399151cb48db3 arch/x86/kernel/cpu/proc.c  Jia Zhang           2018-01-01   94  		seq_printf(m, "stepping\t: %d\n", c->x86_stepping);
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   95  	else
3736708f034ae1 arch/x86/kernel/cpu/proc.c  Rasmus Villemoes    2014-11-28   96  		seq_puts(m, "stepping\t: unknown\n");
506ed6b53e00ba arch/x86/kernel/cpu/proc.c  Andi Kleen          2011-10-12   97  	if (c->microcode)
881e23e5676480 arch/x86/kernel/cpu/proc.c  Borislav Petkov     2011-10-17   98  		seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16   99  
890da9cf098364 arch/x86/kernel/cpu/proc.c  Linus Torvalds      2017-11-02  100  	if (cpu_has(c, X86_FEATURE_TSC)) {
ad02d934de788a arch/x86/kernel/cpu/proc.c  Beata Michalska     2025-01-31  101  		int freq = arch_freq_get_on_cpu(cpu);
890da9cf098364 arch/x86/kernel/cpu/proc.c  Linus Torvalds      2017-11-02  102  
ad02d934de788a arch/x86/kernel/cpu/proc.c  Beata Michalska     2025-01-31  103  		if (freq < 0)
ad02d934de788a arch/x86/kernel/cpu/proc.c  Beata Michalska     2025-01-31  104  			seq_puts(m, "cpu MHz\t\t: Unknown\n");
ad02d934de788a arch/x86/kernel/cpu/proc.c  Beata Michalska     2025-01-31  105  		else
fb4c77c21aba03 arch/x86/kernel/cpu/proc.c  Thomas Gleixner     2022-04-25  106  			seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
890da9cf098364 arch/x86/kernel/cpu/proc.c  Linus Torvalds      2017-11-02  107  	}
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  108  
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  109  	/* Cache size */
24dbc6000f4b9b arch/x86/kernel/cpu/proc.c  Gustavo A. R. Silva 2018-02-13  110  	if (c->x86_cache_size)
24dbc6000f4b9b arch/x86/kernel/cpu/proc.c  Gustavo A. R. Silva 2018-02-13  111  		seq_printf(m, "cache size\t: %u KB\n", c->x86_cache_size);
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  112  
df60310ad7866c arch/x86/kernel/cpu/proc.c  Xunlei Pang         2021-06-04 @113  	show_cpuinfo_core(m, c, cpu, index, rich_container, total);
a967ceac01cd38 arch/x86/kernel/cpu/proc.c  Hiroshi Shimamoto   2008-02-20  114  	show_cpuinfo_misc(m, c);
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  115  
3736708f034ae1 arch/x86/kernel/cpu/proc.c  Rasmus Villemoes    2014-11-28  116  	seq_puts(m, "flags\t\t:");
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  117  	for (i = 0; i < 32*NCAPINTS; i++)
48894cdb70531c arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  118  		if (cpu_has(c, i) && x86_cap_flags[i] != NULL) {
48894cdb70531c arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  119  			if (c->x86_vendor == X86_VENDOR_HYGON)
48894cdb70531c arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  120  				seq_printf(m, " %s", i == X86_FEATURE_SEV ? "csv" :
48894cdb70531c arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  121  					   (i == X86_FEATURE_SEV_ES ? "csv2" :
48894cdb70531c arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  122  					    x86_cap_flags[i]));
48894cdb70531c arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  123  			else
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  124  				seq_printf(m, " %s", x86_cap_flags[i]);
48894cdb70531c arch/x86/kernel/cpu/proc.c  hanliyang           2023-07-31  125  		}
^1da177e4c3f41 arch/i386/kernel/cpu/proc.c Linus Torvalds      2005-04-16  126  

:::::: The code at line 113 was first introduced by commit
:::::: df60310ad7866cd9ba7f6ef2e44d95f84810750c anolis: x86: cpuinfo: Add cpuinfo support for rich container

:::::: TO: Xunlei Pang <xlpang@linux.alibaba.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
