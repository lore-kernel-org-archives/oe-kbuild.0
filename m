Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4822139E
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 03:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725681078; cv=none; b=gEk2nEH4iLNlLlLwVJu6O3sX/4tmjx1+o4M3d1uY3X2bV2Qd8n5BNkZqP4fSxsUSiz7bx1Y9UY1hyrA8nsbIsXCHyyGb3A0wm/WD6e86z0fPFFtg+NDjTPHnH3W3ILQH8IrcdRdlujEpk9vV5uRRvXPNiFxR+MtMGigcS+2kPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725681078; c=relaxed/simple;
	bh=QwMk3+B11zW/pvQ9LaMvQlk8AhXBiINOlqb/6B+i7Js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=irfYl67Jixe+FTOtLUAhKGHaii8qafNTPSOS8uS+S9qOGYfJsl2V3jhPRbEMixLSVzHlnTDi6uTfFyJyFTOK8sAvcrIRew4To5a1bpQ7y8t7qr3U877IRnh4t2NUUECT7qkAU5CKjguPoq2jb4jmL7T7h1KHkz4H6h+yP9H2G9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex+p3tKe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex+p3tKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725681076; x=1757217076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QwMk3+B11zW/pvQ9LaMvQlk8AhXBiINOlqb/6B+i7Js=;
  b=Ex+p3tKeW6I65H4u9EKX1VpIO5LQzuPYwZYiqWJgGfoPoS3RAqKkvwd1
   842DrdIZNlAkr2lby1NfJyNNRG/yKJakJnnGo9N36rum+eFK6g9bRXmUo
   J/+M0ALb8BAbhc+RaZZVdAjHc3ub0ZHPi/kheKqcVUMEmjNCC4XGAJHk+
   tJ/nLtNNxk9K0Cxqm6SjFQ3IzWCKmnmw1ovgqYXG7THeExZq/HwQDYuNA
   iolbXgZAfJdw0yjHhS1hl3sp+Sue3ZyY/L44uLDs1dG4oMKKgM7CHgXsR
   ArG1iXfYOkhN2ZAU/g9FITsotH5UkN0d8BNtUwrlBOiVI3vF/b5bwQeNT
   w==;
X-CSE-ConnectionGUID: Q0Uu8EhDQqqpKrFtk649cg==
X-CSE-MsgGUID: KADsglifRAm4dbztw2tNrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="27374709"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="27374709"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 20:51:15 -0700
X-CSE-ConnectionGUID: a6FKmTMtTLKzmrhZ+kWqiA==
X-CSE-MsgGUID: g5mQGxTjS6OPzwzLVZPy5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="66166674"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Sep 2024 20:51:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smmTf-000C6P-2a;
	Sat, 07 Sep 2024 03:51:11 +0000
Date: Sat, 7 Sep 2024 11:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ak-misc:perf/brstack-resolve-1 8/10]
 scripts/python/Perf-Trace-Util/Context.c:245:3: error: label at end of
 compound statement is a C23 extension
Message-ID: <202409071126.Ei591Jx9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andi Kleen <ak@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc.git perf/brstack-resolve-1
head:   593712b0a72c83baf16dc245ba6f9cc79984625d
commit: cd5e8cec9db02e60739206da2619ececfb468ae2 [8/10] perf: resolve inlines for perf_brstack_srcline/perf_ip_srcline
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071126.Ei591Jx9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409071126.Ei591Jx9-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc3.gcd5e8cec9db0
>> scripts/python/Perf-Trace-Util/Context.c:245:3: error: label at end of compound statement is a C23 extension [-Werror,-Wc23-extensions]
     245 |                 } else {
         |                 ^
   1 error generated.
   make[8]: *** [tools/build/Makefile.build:106: tools/perf/scripts/python/Perf-Trace-Util/Context.o] Error 1
   make[7]: *** [tools/build/Makefile.build:158: python/Perf-Trace-Util] Error 2
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: scripts] Error 2
   make[6]: *** Waiting for unfinished jobs....
   util/srcline.c:710:11: error: incompatible pointer types passing 'unsigned int **' to parameter of type 'unsigned int *'; remove & [-Werror,-Wincompatible-pointer-types]
     710 |                                       &disc)) {
         |                                       ^~~~~
   util/srcline.c:518:16: note: passing argument to parameter 'disc' here
     518 |                                  unsigned *disc)
         |                                            ^
   util/srcline.c:759:14: error: incompatible pointer to integer conversion passing 'unsigned int *' to parameter of type 'unsigned int'; dereference with * [-Wint-conversion]
     759 |                                                        disc)) {
         |                                                        ^~~~
         |                                                        *
   util/srcline.c:644:24: note: passing argument to parameter 'disc' here
     644 |                                       unsigned int disc)
         |                                                    ^
   util/srcline.c:777:30: error: incompatible pointer types passing 'unsigned int **' to parameter of type 'unsigned int *'; remove & [-Werror,-Wincompatible-pointer-types]
     777 |                                                       &record_line_nr, &disc)) == 1) {
         |                                                                        ^~~~~
   util/srcline.c:518:16: note: passing argument to parameter 'disc' here
     518 |                                  unsigned *disc)
         |                                            ^
   util/srcline.c:782:30: error: incompatible pointer to integer conversion passing 'unsigned int *' to parameter of type 'unsigned int'; dereference with * [-Wint-conversion]
     782 |                                                        record_line_nr, disc)) {
         |                                                                        ^~~~
         |                                                                        *
   util/srcline.c:644:24: note: passing argument to parameter 'disc' here
     644 |                                       unsigned int disc)
         |                                                    ^
   4 errors generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/srcline.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:789: tools/perf/perf-util-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2


vim +245 tools/perf/scripts/python/Perf-Trace-Util/Context.c

e79457a526105c Adrian Hunter 2021-05-30  186  
8c1dd64aa1d39f Andi Kleen    2024-08-30  187  static PyObject *do_resolve_ip(struct scripting_context *c, PyObject *ipp)
7ff3245b2d4704 Andi Kleen    2024-08-09  188  {
7ff3245b2d4704 Andi Kleen    2024-08-09  189  	struct addr_location al;
7ff3245b2d4704 Andi Kleen    2024-08-09  190  	struct dso *dso;
7ff3245b2d4704 Andi Kleen    2024-08-09  191  	u8 cpumode;
7ff3245b2d4704 Andi Kleen    2024-08-09  192  	char *srcfile = NULL;
7ff3245b2d4704 Andi Kleen    2024-08-09  193  	PyObject *result = NULL;
7ff3245b2d4704 Andi Kleen    2024-08-09  194  	bool kernel;
7ff3245b2d4704 Andi Kleen    2024-08-09  195  	u64 ip = PyLong_AsUnsignedLongLong(ipp);
7ff3245b2d4704 Andi Kleen    2024-08-09  196  	unsigned line = 0, disc = 0;
cd5e8cec9db02e Andi Kleen    2024-09-04  197  	struct inline_node *inode = calloc(sizeof(struct inline_node), 1);
7ff3245b2d4704 Andi Kleen    2024-08-09  198  
cd5e8cec9db02e Andi Kleen    2024-09-04  199  	if (!inode)
cd5e8cec9db02e Andi Kleen    2024-09-04  200  		goto err2;
cd5e8cec9db02e Andi Kleen    2024-09-04  201  
cd5e8cec9db02e Andi Kleen    2024-09-04  202  	INIT_LIST_HEAD(&inode->val);
7ff3245b2d4704 Andi Kleen    2024-08-09  203  	kernel = machine__kernel_ip(c->machine, ip);
7ff3245b2d4704 Andi Kleen    2024-08-09  204  	if (kernel)
7ff3245b2d4704 Andi Kleen    2024-08-09  205  		cpumode = PERF_RECORD_MISC_KERNEL;
7ff3245b2d4704 Andi Kleen    2024-08-09  206  	else
7ff3245b2d4704 Andi Kleen    2024-08-09  207  		cpumode = PERF_RECORD_MISC_USER;
7ff3245b2d4704 Andi Kleen    2024-08-09  208  
7ff3245b2d4704 Andi Kleen    2024-08-09  209  	addr_location__init(&al);
7ff3245b2d4704 Andi Kleen    2024-08-09  210  	if (machine__resolve(c->machine, &al, c->sample) < 0)
7ff3245b2d4704 Andi Kleen    2024-08-09  211  		goto err2;
7ff3245b2d4704 Andi Kleen    2024-08-09  212  	if (!thread__find_map(al.thread, cpumode, ip, &al))
7ff3245b2d4704 Andi Kleen    2024-08-09  213  		goto err;
7ff3245b2d4704 Andi Kleen    2024-08-09  214  	if (!al.map)
7ff3245b2d4704 Andi Kleen    2024-08-09  215  		goto err;
7ff3245b2d4704 Andi Kleen    2024-08-09  216  	dso = map__dso(al.map);
7ff3245b2d4704 Andi Kleen    2024-08-09  217  	if (!dso)
7ff3245b2d4704 Andi Kleen    2024-08-09  218  		goto err;
7ff3245b2d4704 Andi Kleen    2024-08-09  219  	if (dso__data(dso)->status == DSO_DATA_STATUS_ERROR)
7ff3245b2d4704 Andi Kleen    2024-08-09  220  		goto err;
cd5e8cec9db02e Andi Kleen    2024-09-04  221  	srcfile = get_srcline_split(dso, map__rip_2objdump(al.map, al.addr), &line,
cd5e8cec9db02e Andi Kleen    2024-09-04  222  				    &disc, inode);
cd5e8cec9db02e Andi Kleen    2024-09-04  223  	if (srcfile && srcfile != SRCLINE_UNKNOWN) {
cd5e8cec9db02e Andi Kleen    2024-09-04  224  		if (!list_empty(&inode->val)) {
cd5e8cec9db02e Andi Kleen    2024-09-04  225  			PyObject *inlines;
cd5e8cec9db02e Andi Kleen    2024-09-04  226  			struct inline_list *ilist;
cd5e8cec9db02e Andi Kleen    2024-09-04  227  			int num;
cd5e8cec9db02e Andi Kleen    2024-09-04  228  		       	num = 0;
cd5e8cec9db02e Andi Kleen    2024-09-04  229  			list_for_each_entry (ilist, &inode->val, list)
cd5e8cec9db02e Andi Kleen    2024-09-04  230  				num++;
cd5e8cec9db02e Andi Kleen    2024-09-04  231  			inlines = PyTuple_New(num);
cd5e8cec9db02e Andi Kleen    2024-09-04  232  			if (!inlines)
cd5e8cec9db02e Andi Kleen    2024-09-04  233  				goto out;
cd5e8cec9db02e Andi Kleen    2024-09-04  234  			num = 0;
cd5e8cec9db02e Andi Kleen    2024-09-04  235  			list_for_each_entry (ilist, &inode->val, list) {
cd5e8cec9db02e Andi Kleen    2024-09-04  236  				PyTuple_SetItem(inlines, num,
cd5e8cec9db02e Andi Kleen    2024-09-04  237  						Py_BuildValue("(ssII)",
cd5e8cec9db02e Andi Kleen    2024-09-04  238  							ilist->srcline, ilist->symbol->name,
cd5e8cec9db02e Andi Kleen    2024-09-04  239  							ilist->line, ilist->disc));
cd5e8cec9db02e Andi Kleen    2024-09-04  240  				num++;
cd5e8cec9db02e Andi Kleen    2024-09-04  241  			}
cd5e8cec9db02e Andi Kleen    2024-09-04  242  			result = Py_BuildValue("(sIIO)", srcfile, line, disc, inlines);
cd5e8cec9db02e Andi Kleen    2024-09-04  243  			Py_DECREF(inlines);
cd5e8cec9db02e Andi Kleen    2024-09-04  244  		out:
cd5e8cec9db02e Andi Kleen    2024-09-04 @245  		} else {
7ff3245b2d4704 Andi Kleen    2024-08-09  246  			result = Py_BuildValue("(sII)", srcfile, line, disc);
cd5e8cec9db02e Andi Kleen    2024-09-04  247  		}
cd5e8cec9db02e Andi Kleen    2024-09-04  248  	}
cd5e8cec9db02e Andi Kleen    2024-09-04  249  	zfree_srcline(&srcfile);
7ff3245b2d4704 Andi Kleen    2024-08-09  250  err:
7ff3245b2d4704 Andi Kleen    2024-08-09  251  	addr_location__exit(&al);
7ff3245b2d4704 Andi Kleen    2024-08-09  252  err2:
7ff3245b2d4704 Andi Kleen    2024-08-09  253  	if (!result)
7ff3245b2d4704 Andi Kleen    2024-08-09  254  		return Py_BuildValue("");
cd5e8cec9db02e Andi Kleen    2024-09-04  255  	inline_node__delete(inode);
7ff3245b2d4704 Andi Kleen    2024-08-09  256  	return result;
7ff3245b2d4704 Andi Kleen    2024-08-09  257  }
7ff3245b2d4704 Andi Kleen    2024-08-09  258  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
