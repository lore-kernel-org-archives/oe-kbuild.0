Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895F2560
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679144326; x=1710680326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lz9kavoxITeN2jXH9uFOfBAenVTl3BnsXmIiVXcir54=;
  b=frbdmUtRDmomRZCphU9wqab2CBDNgmpfeCzpByHua8YvA4nXQ0vtiirS
   QlpvoEftdqRa+NHhMK6AHitoyb5Ym+f1Og6x+uoixRBZpdEaUKkchXA2X
   dt8/sYdnP5WsD62IRygOlovX7oeFV9ejtZLcmAnhZ6dL2E5otwua3/VUn
   9RTiMGo8vhHLZSsHFHRelzpWC28ZR3oYCa1kzNrxVSxNlSc6dHOgEn2qC
   YMzM+A1LTXEko+Ef0dBm+WgHnMMzU+iOydX0v2sByTUuuOfL0O3y6o1sH
   33WlAfLpNpLPK9eRjQJJoVgWB0WwQDGsJf78Ii/7NbMXrpD6S8PlRWH1R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="326796135"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="326796135"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 05:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="657864964"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="657864964"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2023 05:58:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdW8y-000A5K-07;
	Sat, 18 Mar 2023 12:58:44 +0000
Date: Sat, 18 Mar 2023 20:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mcgrof:20230317-module-alloc-opts 27/31] kernel/module/main.c:2280
 move_module() error: uninitialized symbol 't'.
Message-ID: <202303182034.J3BFg2Yd-lkp@intel.com>
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
TO: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230317-module-alloc-opts
head:   68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
commit: 139e5ac36c4aa1e28a51bf98a7304d3040c6da6b [27/31] module: add stop-grap sanity check on module memcpy()
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230318/202303182034.J3BFg2Yd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303182034.J3BFg2Yd-lkp@intel.com/

smatch warnings:
kernel/module/main.c:2280 move_module() error: uninitialized symbol 't'.

vim +/t +2280 kernel/module/main.c

f91a13bb99b739 kernel/module.c      Linus Torvalds   2010-08-05  2211  
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2212  static int move_module(struct module *mod, struct load_info *info)
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2213  {
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2214  	int i;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2215  	void *ptr;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2216  	enum mod_mem_type t;
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2217  	int ret = -ENOMEM;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2218  
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2219  	for_each_mod_mem_type(type) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2220  		if (!mod->mem[type].size) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2221  			mod->mem[type].base = NULL;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2222  			continue;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2223  		}
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2224  		mod->mem[type].size = PAGE_ALIGN(mod->mem[type].size);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2225  		ptr = module_memory_alloc(mod->mem[type].size, type);
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2226  
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2227  		/*
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2228  		 * The pointer to this block is stored in the module structure
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2229  		 * which is inside the block. Just mark it as not being a
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2230  		 * leak.
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2231  		 */
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2232  		kmemleak_ignore(ptr);
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2233  		if (!ptr) {
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2234  			t = type;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2235  			goto out_enomem;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2236  		}
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2237  		memset(ptr, 0, mod->mem[type].size);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2238  		mod->mem[type].base = ptr;
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2239  	}
01dc0386efb769 kernel/module/main.c Christophe Leroy 2022-02-23  2240  
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2241  	/* Transfer each section which specifies SHF_ALLOC */
5e12416927975a kernel/module.c      Jim Cromie       2011-12-06  2242  	pr_debug("final section addresses:\n");
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2243  	for (i = 0; i < info->hdr->e_shnum; i++) {
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2244  		void *dest;
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2245  		Elf_Shdr *shdr = &info->sechdrs[i];
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2246  		enum mod_mem_type type = shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHIFT;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2247  
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2248  		if (!(shdr->sh_flags & SHF_ALLOC))
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2249  			continue;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2250  
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2251  		dest = mod->mem[type].base + (shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK);
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2252  
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2253  		if (shdr->sh_type != SHT_NOBITS) {
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2254  			/*
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2255  			 * Our ELF checker already validated this, but let's
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2256  			 * be pedantic and make the goal clearer. We actually
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2257  			 * end up copying over all modifications made to the
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2258  			 * userspace copy of the entire struct module.
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2259  			 */
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2260  			if (i == info->index.mod &&
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2261  			   (WARN_ON_ONCE(shdr->sh_size != sizeof(struct module)))) {
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2262  				ret = -ENOEXEC;
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2263  				goto out_enomem;
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2264  			}
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2265  			memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2266  		}
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2267  		/*
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2268  		 * Update the userspace copy's ELF section address to point to
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2269  		 * our newly allocated memory as a pure convenience so that
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2270  		 * users of info can keep taking advantage and using the newly
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2271  		 * minted official memory area.
139e5ac36c4aa1 kernel/module/main.c Luis Chamberlain 2023-03-17  2272  		 */
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2273  		shdr->sh_addr = (unsigned long)dest;
5e12416927975a kernel/module.c      Jim Cromie       2011-12-06  2274  		pr_debug("\t0x%lx %s\n",
5e12416927975a kernel/module.c      Jim Cromie       2011-12-06  2275  			 (long)shdr->sh_addr, info->secstrings + shdr->sh_name);
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2276  	}
d913188c751911 kernel/module.c      Rusty Russell    2010-08-05  2277  
d913188c751911 kernel/module.c      Rusty Russell    2010-08-05  2278  	return 0;
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2279  out_enomem:
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06 @2280  	for (t--; t >= 0; t--)
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2281  		module_memory_free(mod->mem[t].base, t);
ac3b4328392344 kernel/module/main.c Song Liu         2023-02-06  2282  	return -ENOMEM;
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2283  }
65b8a9b4d55253 kernel/module.c      Linus Torvalds   2010-08-05  2284  

:::::: The code at line 2280 was first introduced by commit
:::::: ac3b43283923440900b4f36ca5f9f0b1ca43b70e module: replace module_layout with module_memory

:::::: TO: Song Liu <song@kernel.org>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
