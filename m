Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C53284674
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Dec 2025 18:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765133781; cv=none; b=osNQ8+fwPGHeZVDk6WuPr40j8pUs6fSLCZOjS0Vff7jePpRjCeDT+B2mKUsHqiwZVsMwlCkodrOti8RLK+TZ4KN8awQz3R5hEdC1bmOUVp/65dUBHgyTpSJgZ6C3gDYAj3Oz53OeDkWDD8HIjWqrMTYV6wv+UmHyMOPCZ83OIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765133781; c=relaxed/simple;
	bh=DmMINmI1f6g/JPvwoI9/7elJ92qRf8KqYhDnAuKx1AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gOu6OUFBIHPOdaRyuGmyf5xYHoAX4kr74iGzDlN6eccgHFltvPQp3KMBdSWwAcCjvnmpkPZAied95lq/fl2hhDxt+Y0MyuRo5rgjzzhBRDPZhBctdco7rsQKAsiCQco634VTW7rEPle+l6bIwMTTpLYJ8IymEqFDRJ15v2iyZV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPQ65U3R; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPQ65U3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765133779; x=1796669779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DmMINmI1f6g/JPvwoI9/7elJ92qRf8KqYhDnAuKx1AQ=;
  b=WPQ65U3Rp3+uXgQl1B2TugaSfpLpKEqU/cNGa5AjVDsjvx8HlQfLsaxl
   OgQyttzcZCsDfE95kmUBTuHrVVe24uLNNKoWZGheQtIXDGW1ChkR20ED0
   Bk7VX4zsQCa2ulyVBddmY3K4L/QxpV2B/B5Jk5tsoFGex4XRCbLigX5Y/
   0YbxyAlZfU5ISBBVgbdpziEVMU/LREY8IgDbtr2Kxqx2R7edLpgDb35hv
   311LBR8eM5WWHMtFkFph2Tjdl0Fw2/+pYwc06t3HuOiEnfp3cciSNXykd
   K4KWfi8kBnc8DZ9Md1Vi6FlX33Z/AdwRD21893nAg0naGzuShZUaZVjEB
   Q==;
X-CSE-ConnectionGUID: 7w6uQ1ydR6KMz1N522RTaw==
X-CSE-MsgGUID: juyUuqigSAC429XQ0IVxrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67127028"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="67127028"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 10:56:18 -0800
X-CSE-ConnectionGUID: L14QhNq9Q/6sYGtodIOa1A==
X-CSE-MsgGUID: CdUdtR5CS1ycr4PUtRQ4Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="219111964"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Dec 2025 10:56:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSJvb-00000000JX7-2ATe;
	Sun, 07 Dec 2025 18:56:15 +0000
Date: Mon, 8 Dec 2025 02:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/8] objtool: Rename C ANNOTATE_REACHABLE to
 ANNOTATE_REACHABLE_LABEL
Message-ID: <202512080257.PU3ZQHzN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "maintainer prefers to test the version of patch actually in efi/next"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a1a0378deeaf70bc733141e6decd369495938079.1765044697.git.jpoimboe@kernel.org>
References: <a1a0378deeaf70bc733141e6decd369495938079.1765044697.git.jpoimboe@kernel.org>
TO: Josh Poimboeuf <jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on linus/master next-20251205]
[cannot apply to tip/x86/core efi/next tip/auto-latest tip/x86/vmware linux/master v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/objtool-Rename-ANNOTYPE_IGNORE_ALTS-ANNOTYPE_IGNORE_ALTERNATIVE/20251207-055747
base:   tip/master
patch link:    https://lore.kernel.org/r/a1a0378deeaf70bc733141e6decd369495938079.1765044697.git.jpoimboe%40kernel.org
patch subject: [PATCH 3/8] objtool: Rename C ANNOTATE_REACHABLE to ANNOTATE_REACHABLE_LABEL
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251208/202512080257.PU3ZQHzN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080257.PU3ZQHzN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512080257.PU3ZQHzN-lkp@intel.com/

All errors (new ones prefixed by >>):

     582 |         WARN_ON_ONCE(__lockdep_enabled && this_cpu_read(hardirqs_enabled)); \
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   include/linux/sched.h:2138:3: error: expected ')'
    2138 |                 lockdep_assert_held_once(&m->wait_lock);
         |                 ^
   include/linux/lockdep.h:297:2: note: expanded from macro 'lockdep_assert_held_once'
     297 |         lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:282:7: note: expanded from macro 'lockdep_assert_once'
     282 |         do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   include/linux/sched.h:2146:2: error: expected ')'
    2146 |         WARN_ON_ONCE(!m);
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   include/linux/sched.h:2148:2: error: expected ')'
    2148 |         WARN_ON_ONCE(p != current);
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   include/linux/sched.h:2150:2: error: expected ')'
    2150 |         lockdep_assert_held_once(&m->wait_lock);
         |         ^
   include/linux/lockdep.h:297:2: note: expanded from macro 'lockdep_assert_held_once'
     297 |         lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:282:7: note: expanded from macro 'lockdep_assert_once'
     282 |         do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   include/linux/sched.h:2156:2: error: expected ')'
    2156 |         WARN_ON_ONCE(blocked_on && blocked_on != m);
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   include/linux/sched.h:2172:3: error: expected ')'
    2172 |                 lockdep_assert_held_once(&m->wait_lock);
         |                 ^
   include/linux/lockdep.h:297:2: note: expanded from macro 'lockdep_assert_held_once'
     297 |         lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:282:7: note: expanded from macro 'lockdep_assert_once'
     282 |         do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   include/linux/sched.h:2178:3: error: expected ')'
    2178 |                 WARN_ON_ONCE(blocked_on && blocked_on != m);
         |                 ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
>> include/linux/seqlock.h:221:2: error: expected ')'
     221 |         lockdep_assert_preemption_disabled();
         |         ^
   include/linux/lockdep.h:606:2: note: expanded from macro 'lockdep_assert_preemption_disabled'
     606 |         WARN_ON_ONCE(IS_ENABLED(CONFIG_PREEMPT_COUNT)   &&              \
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
   include/linux/seqlock.h:226:1: error: expected ')'
     226 | SEQCOUNT_LOCKNAME(raw_spinlock, raw_spinlock_t,  false,    raw_spin)
         | ^
   include/linux/seqlock.h:192:13: note: expanded from macro 'SEQCOUNT_LOCKNAME'
     192 |         __SEQ_LOCK(lockdep_assert_held(s->lock));                       \
         |                    ^
   include/linux/lockdep.h:285:2: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
   include/linux/seqlock.h:227:1: error: expected ')'
     227 | SEQCOUNT_LOCKNAME(spinlock,     spinlock_t,      __SEQ_RT, spin)
         | ^
   include/linux/seqlock.h:192:13: note: expanded from macro 'SEQCOUNT_LOCKNAME'
     192 |         __SEQ_LOCK(lockdep_assert_held(s->lock));                       \
         |                    ^
   include/linux/lockdep.h:285:2: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
   include/linux/seqlock.h:228:1: error: expected ')'
     228 | SEQCOUNT_LOCKNAME(rwlock,       rwlock_t,        __SEQ_RT, read)
         | ^
   include/linux/seqlock.h:192:13: note: expanded from macro 'SEQCOUNT_LOCKNAME'
     192 |         __SEQ_LOCK(lockdep_assert_held(s->lock));                       \
         |                    ^
   include/linux/lockdep.h:285:2: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:17:
   include/linux/seqlock.h:229:1: error: expected ')'
     229 | SEQCOUNT_LOCKNAME(mutex,        struct mutex,    true,     mutex)
         | ^
   include/linux/seqlock.h:192:13: note: expanded from macro 'SEQCOUNT_LOCKNAME'
     192 |         __SEQ_LOCK(lockdep_assert_held(s->lock));                       \
         |                    ^
   include/linux/lockdep.h:285:2: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ^
   include/linux/lockdep.h:279:7: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:


vim +221 include/linux/seqlock.h

55f3560df975f5 Ahmed S. Darwish 2020-07-20  218  
5cdd25572a29e4 Ahmed S. Darwish 2020-09-04  219  static inline void __seqprop_assert(const seqcount_t *s)
55f3560df975f5 Ahmed S. Darwish 2020-07-20  220  {
55f3560df975f5 Ahmed S. Darwish 2020-07-20 @221  	lockdep_assert_preemption_disabled();
55f3560df975f5 Ahmed S. Darwish 2020-07-20  222  }
55f3560df975f5 Ahmed S. Darwish 2020-07-20  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
