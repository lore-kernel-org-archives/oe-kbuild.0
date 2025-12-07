Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7858B1E32CF
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Dec 2025 21:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765143874; cv=none; b=ihe0INXG1fkU68kkUtdhQEzkLnJ6Ou6Fpr03U2I3oLaec/TSuQizwpDkNfjbOLSmOeQOLX8swn7dcbX3jmsTKVG4g88a9hYVjS1ix9sZ6tNoPvPLb9yBEg2rVUHGXtT4FANC9XTO5n5IeTfVo3gLunH2Wm21yPNbM7UZpquM5k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765143874; c=relaxed/simple;
	bh=40mQiJOciPIAZ+xetmfvCUtRFZkyFTiWHKdaxwXq5dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rP8lzeZb4o8eYpaK9f9nvP6BD/EJF/cLe+KSGyYKZGpzTc1/GII5QTOgYg7XZAQNz5QRse4AMDY876Jnra1G13eBtDgD+nSrNWjVAzFvipqWU6c1hMANOIWKVVbVPI0oNUZGiGMQP/N9vx0tc6+jqwrDnTb38IYpxfQxkgGNIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3P38hMJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3P38hMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765143872; x=1796679872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=40mQiJOciPIAZ+xetmfvCUtRFZkyFTiWHKdaxwXq5dw=;
  b=C3P38hMJETp1MDd/TXn39DD+AMvJWzsXDwyyegzRZ/eVyM5KeDnNSKG+
   kbcXQ+EPA3tA3YgkJ/kw5VC23BswaIwRJgrsxWCeb/pOCkbQG1IZceum3
   gw5KjkqEXi9BUhywQlyAcXLP9wh1ik37t2G5wRfvlO1rcYlQW5NBtOIJj
   oYwnVpy+SgCtkUbSleu3h4Wu9WecornjJZqoom0NRBCSpwEmxVUP74yrf
   CP+wpTe+hsi7IE2Wx6tEIB2yujAnj/4/Q8kHEmAGs13jhvWi0R5fc4tY0
   QjoeY/LSCnpjorPXkHp9btAHY8eNwm8fIychR8+yl70WJRN9SJFmNmXf3
   g==;
X-CSE-ConnectionGUID: GuvsTstdTsegbSdzKizuDQ==
X-CSE-MsgGUID: 4UEoPU/pRY+yYskgyxhkcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66987548"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="66987548"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 13:44:32 -0800
X-CSE-ConnectionGUID: bBaZWwfLTV6BnayEOuQ3aA==
X-CSE-MsgGUID: jv4tGh81T9mBk64rrjEeTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="195682182"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Dec 2025 13:44:31 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSMYO-00000000Jf7-3xCk;
	Sun, 07 Dec 2025 21:44:28 +0000
Date: Mon, 8 Dec 2025 05:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/8] objtool: Rename C ANNOTATE_REACHABLE to
 ANNOTATE_REACHABLE_LABEL
Message-ID: <202512080510.SIaOmOkj-lkp@intel.com>
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
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251208/202512080510.SIaOmOkj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080510.SIaOmOkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512080510.SIaOmOkj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:12:
   In file included from ./arch/loongarch/include/generated/asm/current.h:1:
   In file included from include/asm-generic/current.h:6:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/loongarch/include/asm/thread_info.h:15:
   In file included from arch/loongarch/include/asm/processor.h:9:
>> include/linux/cpumask.h:36:2: error: expected ')'
      36 |         WARN_ON(nr != nr_cpu_ids);
         |         ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:49:
   In file included from include/linux/tracepoint-defs.h:12:
   In file included from include/linux/static_key.h:1:
>> include/linux/jump_label.h:290:2: error: expected ')'
     290 |         STATIC_KEY_CHECK_USE(key);
         |         ^
   include/linux/jump_label.h:82:35: note: expanded from macro 'STATIC_KEY_CHECK_USE'
      82 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^
   include/asm-generic/bug.h:166:3: note: expanded from macro 'WARN'
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^
   include/asm-generic/bug.h:134:3: note: expanded from macro '__WARN_printf'
     134 |                 __WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:49:
   In file included from include/linux/tracepoint-defs.h:12:
   In file included from include/linux/static_key.h:1:
   include/linux/jump_label.h:306:2: error: expected ')'
     306 |         STATIC_KEY_CHECK_USE(key);
         |         ^
   include/linux/jump_label.h:82:35: note: expanded from macro 'STATIC_KEY_CHECK_USE'
      82 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^
   include/asm-generic/bug.h:166:3: note: expanded from macro 'WARN'
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^
   include/asm-generic/bug.h:134:3: note: expanded from macro '__WARN_printf'
     134 |                 __WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:49:
   In file included from include/linux/tracepoint-defs.h:12:
   In file included from include/linux/static_key.h:1:
   include/linux/jump_label.h:323:2: error: expected ')'
     323 |         STATIC_KEY_CHECK_USE(key);
         |         ^
   include/linux/jump_label.h:82:35: note: expanded from macro 'STATIC_KEY_CHECK_USE'
      82 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^
   include/asm-generic/bug.h:166:3: note: expanded from macro 'WARN'
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^
   include/asm-generic/bug.h:134:3: note: expanded from macro '__WARN_printf'
     134 |                 __WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:49:
   In file included from include/linux/tracepoint-defs.h:12:
   In file included from include/linux/static_key.h:1:
   include/linux/jump_label.h:326:3: error: expected ')'
     326 |                 WARN_ON_ONCE(atomic_read(&key->enabled) != 1);
         |                 ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:49:
   In file included from include/linux/tracepoint-defs.h:12:
   In file included from include/linux/static_key.h:1:
   include/linux/jump_label.h:334:2: error: expected ')'
     334 |         STATIC_KEY_CHECK_USE(key);
         |         ^
   include/linux/jump_label.h:82:35: note: expanded from macro 'STATIC_KEY_CHECK_USE'
      82 | #define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized,               \
         |                                   ^
   include/asm-generic/bug.h:166:3: note: expanded from macro 'WARN'
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                 ^
   include/asm-generic/bug.h:134:3: note: expanded from macro '__WARN_printf'
     134 |                 __WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
   In file included from include/linux/sched.h:49:
   In file included from include/linux/tracepoint-defs.h:12:
   In file included from include/linux/static_key.h:1:
   include/linux/jump_label.h:337:3: error: expected ')'
     337 |                 WARN_ON_ONCE(atomic_read(&key->enabled) != 0);
         |                 ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:10:
>> include/linux/sched.h:2146:2: error: expected ')'
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
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:11:
   In file included from include/linux/rbtree.h:24:
>> include/linux/rcupdate.h:1187:2: error: expected ')'
    1187 |         WARN_ON_ONCE(func != (rcu_callback_t)~0L);
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
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
>> include/linux/maple_tree.h:758:2: error: expected ')'
     758 |         MAS_WARN_ON(mas, mas_is_active(mas) &&
         |         ^
   include/linux/maple_tree.h:740:34: note: expanded from macro 'MAS_WARN_ON'
     740 | #define MAS_WARN_ON(__mas, __x)         WARN_ON(__x)
         |                                         ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
   include/linux/maple_tree.h:850:3: error: expected ')'
     850 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:12:
   include/linux/maple_tree.h:869:3: error: expected ')'
     869 |                 WARN_ON(!mt_lock_is_held(mt));
         |                 ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:13:
>> include/linux/rwsem.h:80:2: error: expected ')'
      80 |         WARN_ON(atomic_long_read(&sem->count) == RWSEM_UNLOCKED_VALUE);
         |         ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:13:
   include/linux/rwsem.h:85:2: error: expected ')'
      85 |         WARN_ON(!(atomic_long_read(&sem->count) & RWSEM_WRITER_LOCKED));
         |         ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
>> include/linux/ktime.h:152:2: error: expected ')'
     152 |         WARN_ON(div < 0);
         |         ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON'
     112 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   In file included from arch/loongarch/kernel/asm-offsets.c:11:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:1538:
   In file included from include/linux/memory_hotplug.h:7:
   In file included from include/linux/notifier.h:16:
>> include/linux/srcu.h:312:2: error: expected ')'
     312 |         WARN_ON_ONCE(IS_ENABLED(CONFIG_PROVE_RCU) && in_nmi());
         |         ^
   include/asm-generic/bug.h:122:3: note: expanded from macro 'WARN_ON_ONCE'
     122 |                 __WARN_FLAGS(#condition,                                \
         |                 ^
   arch/loongarch/include/asm/bug.h:47:49: note: expanded from macro '__WARN_FLAGS'
      47 |         __BUG_FLAGS(cond_str, BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
         |                                                        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[3]: *** [scripts/Makefile.build:182: arch/loongarch/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1283: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +36 include/linux/cpumask.h

38bef8e57f2149 Yury Norov   2022-09-05  32  
ab6b1010dab68f Brian Norris 2024-07-18  33  static __always_inline void set_nr_cpu_ids(unsigned int nr)
38bef8e57f2149 Yury Norov   2022-09-05  34  {
6f9c07be9d0204 Yury Norov   2022-09-05  35  #if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
6f9c07be9d0204 Yury Norov   2022-09-05 @36  	WARN_ON(nr != nr_cpu_ids);
6f9c07be9d0204 Yury Norov   2022-09-05  37  #else
38bef8e57f2149 Yury Norov   2022-09-05  38  	nr_cpu_ids = nr;
41df0d61c26699 Mike Travis  2008-05-12  39  #endif
6f9c07be9d0204 Yury Norov   2022-09-05  40  }
41df0d61c26699 Mike Travis  2008-05-12  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
