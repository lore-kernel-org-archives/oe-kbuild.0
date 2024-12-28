Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD7E2111
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Dec 2024 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735402992; cv=none; b=PGeqS33L+lbZRs6MzM0zVoM+GUXxghsi+RI68fn6RPM6cq9kNLBrBAN8z5DicEtoIA6hA4lbGwNnEzq7SjCqu3oHOutHUfm3fimS84I2a+OLCw++M6kK9Z+LMexExUs5Lnrp/Z2TSMRJPNWalqYd/rQUy79ThuTZgcqOIraJUQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735402992; c=relaxed/simple;
	bh=4aOLenwXSKzsCp+oUmJY56UejdzUo6TPbYvAwpK+N+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=htmfwBGGtsr7+NIkPxDyLJSztxEfxgCQnOdnf5GfYqbf/boWJ2+FdEjgmnO77t2C6RGVyWPA6MWV0k9sDYNfhkWNmwD+vEM7uJS5yqksMrKFV6VfvdJNC0S9XSJC525A/LiITsKaNYqumBZ7aQ7lf5LL0phnorDr/sYeaq1WC3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0CUbP2P; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0CUbP2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735402990; x=1766938990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4aOLenwXSKzsCp+oUmJY56UejdzUo6TPbYvAwpK+N+Y=;
  b=F0CUbP2PVaK956ZvZz2MFH5L0Lmh3FRhheCARMwy3a/VtPOU+/8+w4ka
   DtM9ZZKxGDPCJnbf0nQo/4mNELB4Hxj7iYDE2IQDNEhhgEcDd9TOZcbOt
   bJyAjCyUenFkPxUWHj8lo8ROyGbRapJxcnmI1hdWPlJWNB7mGZADX3f2K
   WuNRuk8wTx85+fUbN9KZIHrylHNc+t6xMOL0BXJjI/m4FRDm7EBGY2R0E
   bK6lPzAtuernwVbOnIi9lTGMs0ciqyA2VARNkNICdiCYe4neDyi0oLXqz
   n0cHgIeDFw6gLWeXipskHyESaPGl2PVcAAkvOTd7vD872zkl03W6m5RZ5
   w==;
X-CSE-ConnectionGUID: ZbNhPCYqTsCqCXl/SDXU3A==
X-CSE-MsgGUID: Rq4g3RD4StWXA6nKC/4ZrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="47126764"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="47126764"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 08:23:09 -0800
X-CSE-ConnectionGUID: 6+9FG3RURSGLunHIgoxifA==
X-CSE-MsgGUID: 3FX7rNFGQRKrOTT3yzsbEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105468434"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Dec 2024 08:23:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRZak-0004Ae-0H;
	Sat, 28 Dec 2024 16:23:06 +0000
Date: Sun, 29 Dec 2024 00:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/sh/kernel/machvec.c:44:15: warning: variable 'mv_comma' set but
 not used
Message-ID: <202412290053.clhsPxzF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: 706afcea16cd83fecb7c2229ccc31bb237ffdbef sh: Fix -Wmissing-include-dirs warnings for various platforms
date:   1 year, 6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 6 months ago
config: sh-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241229/202412290053.clhsPxzF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290053.clhsPxzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412290053.clhsPxzF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/kernel/machvec.c: In function 'early_parse_mv':
>> arch/sh/kernel/machvec.c:44:15: warning: variable 'mv_comma' set but not used [-Wunused-but-set-variable]
      44 |         char *mv_comma;
         |               ^~~~~~~~
--
   arch/sh/kernel/disassemble.c: In function 'print_sh_insn':
>> arch/sh/kernel/disassemble.c:295:13: warning: variable 'lastsp' set but not used [-Wunused-but-set-variable]
     295 |         int lastsp;
         |             ^~~~~~
--
   arch/sh/kernel/dwarf.c:347:19: warning: no previous prototype for 'dwarf_lookup_fde' [-Wmissing-prototypes]
     347 | struct dwarf_fde *dwarf_lookup_fde(unsigned long pc)
         |                   ^~~~~~~~~~~~~~~~
   arch/sh/kernel/dwarf.c: In function 'dwarf_parse_fde':
>> arch/sh/kernel/dwarf.c:924:38: warning: variable 'end' set but not used [-Wunused-but-set-variable]
     924 |                 unsigned long start, end;
         |                                      ^~~
--
   arch/sh/mm/cache-sh4.c: In function 'flush_cache_one':
   arch/sh/mm/cache-sh4.c:99:31: error: 'cached_to_uncached' undeclared (first use in this function); did you mean 'jump_to_uncached'?
      99 |                 exec_offset = cached_to_uncached;
         |                               ^~~~~~~~~~~~~~~~~~
         |                               jump_to_uncached
   arch/sh/mm/cache-sh4.c:99:31: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from arch/sh/mm/cache-sh4.c:13:
   arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_mm':
   arch/sh/mm/cache-sh4.c:192:13: error: implicit declaration of function 'cpu_context'; did you mean 'put_io_context'? [-Werror=implicit-function-declaration]
     192 |         if (cpu_context(smp_processor_id(), mm) == NO_CONTEXT)
         |             ^~~~~~~~~~~
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_var'
      58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/sh/mm/cache-sh4.c:192:9: note: in expansion of macro 'if'
     192 |         if (cpu_context(smp_processor_id(), mm) == NO_CONTEXT)
         |         ^~
   arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_page':
   arch/sh/mm/cache-sh4.c:224:15: error: implicit declaration of function 'pmd_off'; did you mean 'pmd_pfn'? [-Werror=implicit-function-declaration]
     224 |         pmd = pmd_off(vma->vm_mm, address);
         |               ^~~~~~~
         |               pmd_pfn
   arch/sh/mm/cache-sh4.c:224:13: warning: assignment to 'pmd_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     224 |         pmd = pmd_off(vma->vm_mm, address);
         |             ^
   arch/sh/mm/cache-sh4.c:225:15: error: implicit declaration of function 'pte_offset_kernel' [-Werror=implicit-function-declaration]
     225 |         pte = pte_offset_kernel(pmd, address);
         |               ^~~~~~~~~~~~~~~~~
   arch/sh/mm/cache-sh4.c:225:13: warning: assignment to 'pte_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     225 |         pte = pte_offset_kernel(pmd, address);
         |             ^
   arch/sh/mm/cache-sh4.c: In function 'sh4_flush_cache_range':
>> arch/sh/mm/cache-sh4.c:276:30: warning: variable 'end' set but not used [-Wunused-but-set-variable]
     276 |         unsigned long start, end;
         |                              ^~~
>> arch/sh/mm/cache-sh4.c:276:23: warning: variable 'start' set but not used [-Wunused-but-set-variable]
     276 |         unsigned long start, end;
         |                       ^~~~~
   arch/sh/mm/cache-sh4.c: At top level:
   arch/sh/mm/cache-sh4.c:374:13: warning: no previous prototype for 'sh4_cache_init' [-Wmissing-prototypes]
     374 | void __init sh4_cache_init(void)
         |             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined but not used [-Wunused-const-variable=]
     134 | static const struct of_device_id adg792a_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/mv_comma +44 arch/sh/kernel/machvec.c

fd8f20e8e2f8f1 Paul Mundt         2007-05-15  39  
9655ad03af2d23 Paul Mundt         2007-05-14  40  static int __init early_parse_mv(char *from)
9655ad03af2d23 Paul Mundt         2007-05-14  41  {
9655ad03af2d23 Paul Mundt         2007-05-14  42  	char mv_name[MV_NAME_SIZE] = "";
9655ad03af2d23 Paul Mundt         2007-05-14  43  	char *mv_end;
9655ad03af2d23 Paul Mundt         2007-05-14 @44  	char *mv_comma;
9655ad03af2d23 Paul Mundt         2007-05-14  45  	int mv_len;
9655ad03af2d23 Paul Mundt         2007-05-14  46  	struct sh_machine_vector *mvp;
9655ad03af2d23 Paul Mundt         2007-05-14  47  
9655ad03af2d23 Paul Mundt         2007-05-14  48  	mv_end = strchr(from, ' ');
9655ad03af2d23 Paul Mundt         2007-05-14  49  	if (mv_end == NULL)
9655ad03af2d23 Paul Mundt         2007-05-14  50  		mv_end = from + strlen(from);
9655ad03af2d23 Paul Mundt         2007-05-14  51  
9655ad03af2d23 Paul Mundt         2007-05-14  52  	mv_comma = strchr(from, ',');
9655ad03af2d23 Paul Mundt         2007-05-14  53  	mv_len = mv_end - from;
9655ad03af2d23 Paul Mundt         2007-05-14  54  	if (mv_len > (MV_NAME_SIZE-1))
9655ad03af2d23 Paul Mundt         2007-05-14  55  		mv_len = MV_NAME_SIZE-1;
9655ad03af2d23 Paul Mundt         2007-05-14  56  	memcpy(mv_name, from, mv_len);
9655ad03af2d23 Paul Mundt         2007-05-14  57  	mv_name[mv_len] = '\0';
9655ad03af2d23 Paul Mundt         2007-05-14  58  	from = mv_end;
9655ad03af2d23 Paul Mundt         2007-05-14  59  
fd8f20e8e2f8f1 Paul Mundt         2007-05-15  60  	machvec_selected = 1;
fd8f20e8e2f8f1 Paul Mundt         2007-05-15  61  
fd8f20e8e2f8f1 Paul Mundt         2007-05-15  62  	/* Boot with the generic vector */
fd8f20e8e2f8f1 Paul Mundt         2007-05-15  63  	if (strcmp(mv_name, "generic") == 0)
fd8f20e8e2f8f1 Paul Mundt         2007-05-15  64  		return 0;
fd8f20e8e2f8f1 Paul Mundt         2007-05-15  65  
9655ad03af2d23 Paul Mundt         2007-05-14  66  	mvp = get_mv_byname(mv_name);
9655ad03af2d23 Paul Mundt         2007-05-14  67  	if (unlikely(!mvp)) {
eac1a488171c70 Geert Uytterhoeven 2020-06-17  68  		pr_info("Available vectors:\n\n\t'%s', ", sh_mv.mv_name);
9655ad03af2d23 Paul Mundt         2007-05-14  69  		for_each_mv(mvp)
eac1a488171c70 Geert Uytterhoeven 2020-06-17  70  			pr_cont("'%s', ", mvp->mv_name);
eac1a488171c70 Geert Uytterhoeven 2020-06-17  71  		pr_cont("\n\n");
9655ad03af2d23 Paul Mundt         2007-05-14  72  		panic("Failed to select machvec '%s' -- halting.\n",
9655ad03af2d23 Paul Mundt         2007-05-14  73  		      mv_name);
9655ad03af2d23 Paul Mundt         2007-05-14  74  	} else
9655ad03af2d23 Paul Mundt         2007-05-14  75  		sh_mv = *mvp;
9655ad03af2d23 Paul Mundt         2007-05-14  76  
9655ad03af2d23 Paul Mundt         2007-05-14  77  	return 0;
9655ad03af2d23 Paul Mundt         2007-05-14  78  }
9655ad03af2d23 Paul Mundt         2007-05-14  79  early_param("sh_mv", early_parse_mv);
9655ad03af2d23 Paul Mundt         2007-05-14  80  

:::::: The code at line 44 was first introduced by commit
:::::: 9655ad03af2d232c3b26e7562ab4f8c29b107e49 sh: Fixup machvec support.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@hera.kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
