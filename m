Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8789E3E5584
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969565; cv=none; b=V/wi8JkfEYcp5yC3fMBj4wK5hLLQPgtkFxg1mhCy37QksI0nWwTyhpa5SYv3rzePV59ZzAeV1mQHiaT33BGIO1RSuil+hZdYDGrItx+85u9/xZDq2mgBX7dJpIJFZ0kRfAIdqo4g6hlDDjLekb/mJjEuOL6Q0kL3GLMNO20Ocv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969565; c=relaxed/simple;
	bh=t89qbF19Jjmyz8h7m48aqa9D3zvEFkZ2s5I8se9PKOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAtaO1+FxsXwMO2GJzgsMUWV2MBdbaPxiBkVARKHs7SCM1+c0rqM5iCegKWtL4Tn6fGQPJ51EhvKK4FZnGyPa/nufZ75yUTbROMdzfB+y4d+ocuV+iLfoAI8VXPcYBvtYz0u1qSVGnhHLn1RT2AtKU+/5+GovbZUmI/Hw6acCuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekoFDDme; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekoFDDme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779969564; x=1811505564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t89qbF19Jjmyz8h7m48aqa9D3zvEFkZ2s5I8se9PKOs=;
  b=ekoFDDmeH0a54Q2Lkc22uoC9e4OKIa6U4ym2n6tj33ZgiCmGsqtuUGm/
   uIrDUwJFjR36IhJ6snxh8XmtHIYtl6+WhOINqsJB1J7cBeeTxiL36EJnB
   4gY9mEShcZCPtjg9pRPwtzutol6ljrrdJAFuggnC8xU3PRjTWD8LQ6tX3
   F6w7ZtkBmRRKXWLRqW/KxsFTOinchl2KMcK6swF9j/hgr/RLu1JoxrlWX
   xLbrN+V+vcDfvDmhkfUteeRnwV5XnFbepETcPVJTZEUiahIcY/S4RgnAu
   cTEBmluerxTLgzroExEsxR3pxXOx/EgBrAGKOZb2tRlSaXUVm756gI1G6
   Q==;
X-CSE-ConnectionGUID: uAOB39mNRASovH07Z4E/NQ==
X-CSE-MsgGUID: 6DsvtY8RTsaUQ9mtdoKVYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80923724"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80923724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 04:59:23 -0700
X-CSE-ConnectionGUID: RZYZ7bc+TxK81fVWaN+MXw==
X-CSE-MsgGUID: a8W4ZFNeQ5uVpYr0BWLitQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239958369"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 May 2026 04:59:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSZOR-000000005w6-2rE8;
	Thu, 28 May 2026 11:59:19 +0000
Date: Thu, 28 May 2026 19:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] lib/test_crash: test module to trigger kernel crashes
Message-ID: <202605281924.cksskfXv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <17c774c9032b5ea214b3ceb0c0a008caf2610e30.1779896981.git.calvin@wbinvd.org>
References: <17c774c9032b5ea214b3ceb0c0a008caf2610e30.1779896981.git.calvin@wbinvd.org>
TO: Calvin Owens <calvin@wbinvd.org>
TO: linux-kernel@vger.kernel.org
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Petr Mladek <pmladek@suse.com>

Hi Calvin,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.1-rc5 next-20260527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Calvin-Owens/lib-test_crash-test-module-to-trigger-kernel-crashes/20260528-010354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/17c774c9032b5ea214b3ceb0c0a008caf2610e30.1779896981.git.calvin%40wbinvd.org
patch subject: [PATCH] lib/test_crash: test module to trigger kernel crashes
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260528/202605281924.cksskfXv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281924.cksskfXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605281924.cksskfXv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_crash.c:141:8: error: call to '__compiletime_assert_557' declared with 'error' attribute: min(count, help_string_len - off) signedness error
     141 |         len = min(count, help_string_len - off);
         |               ^
   include/linux/minmax.h:105:19: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:687:2: note: expanded from macro '_compiletime_assert'
     687 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:680:4: note: expanded from macro '__compiletime_assert'
     680 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:138:1: note: expanded from here
     138 | __compiletime_assert_557
         | ^
   1 error generated.


vim +141 lib/test_crash.c

13cacfaad2137c6 Calvin Owens 2026-05-27  127  
13cacfaad2137c6 Calvin Owens 2026-05-27  128  static ssize_t test_crash_read(struct file *file, char __user *buf,
13cacfaad2137c6 Calvin Owens 2026-05-27  129  			       size_t count, loff_t *pos)
13cacfaad2137c6 Calvin Owens 2026-05-27  130  {
13cacfaad2137c6 Calvin Owens 2026-05-27  131  	#define X(name) #name "\n"
13cacfaad2137c6 Calvin Owens 2026-05-27  132  	static const char help_string[] = CRASH_TESTCASE_LIST;
13cacfaad2137c6 Calvin Owens 2026-05-27  133  	#undef X
13cacfaad2137c6 Calvin Owens 2026-05-27  134  	static const int help_string_len = sizeof(help_string) - 1;
13cacfaad2137c6 Calvin Owens 2026-05-27  135  	int off, len, done;
13cacfaad2137c6 Calvin Owens 2026-05-27  136  
13cacfaad2137c6 Calvin Owens 2026-05-27  137  	off = clamp(*pos, 0, help_string_len);
13cacfaad2137c6 Calvin Owens 2026-05-27  138  	if (off == help_string_len)
13cacfaad2137c6 Calvin Owens 2026-05-27  139  		return 0;
13cacfaad2137c6 Calvin Owens 2026-05-27  140  
13cacfaad2137c6 Calvin Owens 2026-05-27 @141  	len = min(count, help_string_len - off);
13cacfaad2137c6 Calvin Owens 2026-05-27  142  	done = len - copy_to_user(buf, help_string + off, len);
13cacfaad2137c6 Calvin Owens 2026-05-27  143  	*pos = off + done;
13cacfaad2137c6 Calvin Owens 2026-05-27  144  
13cacfaad2137c6 Calvin Owens 2026-05-27  145  	return done ?: -EFAULT;
13cacfaad2137c6 Calvin Owens 2026-05-27  146  }
13cacfaad2137c6 Calvin Owens 2026-05-27  147  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
