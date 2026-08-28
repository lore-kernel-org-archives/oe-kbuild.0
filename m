Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA4A3F1047
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Aug 2026 23:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787961325; cv=none; b=YGkFa8pH5uHgfrF85krefc0QQ7eUVwhU96vFIXG1upBdCRNR7K+BN33WDNeVhB22+HUQaGWqBEjcpPNhg1He5O0YjKMGiyOH86D6g8iLp7wjhZGdCWS4FDtC4mZ2CLjJREazVLWZIHN+Pamd/RTBpgv3agVUS4aH73CQU9DcqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787961325; c=relaxed/simple;
	bh=2gV/gkN+oJwAsqdvPNgPPT8yOeymoFEtBENp8P61kcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WhTc+6JZODf7MdcHqebGMpdlO+zdXaR8ZMIiZA7j1PIei7VyXc6NWs/7iWyfaLFXq5cI6e0EReDFV0RJuiDT/t7bgJjozpEjn1FvZsO0z0NnD5Wc+5Ne7NysJxZS1uVLiQV0Jf83v2wsLTzrInkEbY6wd/kRagYV+ql1IoD4QCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PgLUapKc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PgLUapKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787961323; x=1819497323;
  h=date:from:to:cc:subject:message-id;
  bh=2gV/gkN+oJwAsqdvPNgPPT8yOeymoFEtBENp8P61kcY=;
  b=PgLUapKcQyGlbdNqJC7JTEHpbNR0qefSCXw5pw3YkRSiWaUzqQoQAXE0
   jok5b6O5Rh2h8fiGpOPu0cUyNDQD2F/fbIB38PyINlIjligeXVlNG2k3d
   zfrHf0gSfhn5kaDAORLaFaXKhYi95MVejlZs4zliS1zm0IOzK53bByBPw
   kgTurpAdOruszfnJJmhfgXBj0QzajcPXQKz69mI8CPjRYuczplTP/ImU7
   A6wDUxRLy5xThFSgy+CgHETakGsXOdimm0CCA356Z1pbwcpcjjplcZLs6
   a4kfc+qpSbbml+8zCIi23zlgoPIJELXsWdIH8yXLg9mUDFH277ZoutKIz
   A==;
X-CSE-ConnectionGUID: hAADkd2jQIOH0cgdC2U71g==
X-CSE-MsgGUID: x3Vcy9rWRTW88bWQOZqlVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="87604981"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="87604981"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 16:55:22 -0700
X-CSE-ConnectionGUID: pszd3zFmSD+Jd3NBpwmpvg==
X-CSE-MsgGUID: 0UgDnCD+SE6ZFfsBMHyy6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="272506717"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Aug 2026 16:55:22 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x06Pm-00000000C74-3oCy;
	Fri, 28 Aug 2026 23:55:18 +0000
Date: Sat, 29 Aug 2026 07:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/rseq_entry.h:880:17: error: implicit
 declaration of function 'rseq_clear_one_shot_events'
Message-ID: <202608290715.0VUu99uV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/odion-efficios-com/rseq-uapi-add-rseq-operation-definitions/20260828-113339, commit: b48f8aaf42196bb53259f19916fd2afcd82ac10c"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Olivier Dion <odion@efficios.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/odion-efficios-com/rseq-uapi-add-rseq-operation-definitions/20260828-113339
head:   6442a4dd9f55ba8a0f39522b330200e1b8548bd5
commit: b48f8aaf42196bb53259f19916fd2afcd82ac10c rseq: apply operations on exit to user space
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260829/202608290715.0VUu99uV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290715.0VUu99uV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608290715.0VUu99uV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/rseq.c:78:
   include/linux/rseq_entry.h: In function 'rseq_op_reset_word':
>> include/linux/rseq_entry.h:268:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     268 |                 u32 __user *udst = (u32 __user *)dst;
         |                                    ^
   include/linux/rseq_entry.h:272:44: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     272 |                         u32 __user *usrc = (u32 __user *)src;
         |                                            ^
   include/linux/rseq_entry.h:282:36: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     282 |                 u64 __user *udst = (u64 __user *)dst;
         |                                    ^
   include/linux/rseq_entry.h:286:44: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     286 |                         u64 __user *usrc = (u64 __user *)src;
         |                                            ^
   include/linux/rseq_entry.h: In function 'rseq_apply_ops':
   include/linux/rseq_entry.h:317:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     317 |         node = (struct rseq_op_node __user *)next;
         |                ^
   include/linux/rseq_entry.h:372:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     372 |                 node = (struct rseq_op_node __user *)next;
         |                        ^
   include/linux/rseq_entry.h: In function 'rseq_syscall_exit_to_user_mode':
>> include/linux/rseq_entry.h:880:17: error: implicit declaration of function 'rseq_clear_one_shot_events' [-Wimplicit-function-declaration]
     880 |                 rseq_clear_one_shot_events(ev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rseq_clear_one_shot_events +880 include/linux/rseq_entry.h

05b44aef709cae5 Thomas Gleixner 2025-10-27  870  
7a5201ea1907534 Thomas Gleixner 2025-10-27  871  static __always_inline void rseq_syscall_exit_to_user_mode(void)
7a5201ea1907534 Thomas Gleixner 2025-10-27  872  {
7a5201ea1907534 Thomas Gleixner 2025-10-27  873  	struct rseq_event *ev = &current->rseq.event;
7a5201ea1907534 Thomas Gleixner 2025-10-27  874  
7a5201ea1907534 Thomas Gleixner 2025-10-27  875  	rseq_stat_inc(rseq_stats.exit);
7a5201ea1907534 Thomas Gleixner 2025-10-27  876  
7a5201ea1907534 Thomas Gleixner 2025-10-27  877  	/* Needed to remove the store for the !lockdep case */
7a5201ea1907534 Thomas Gleixner 2025-10-27  878  	if (IS_ENABLED(CONFIG_LOCKDEP)) {
7a5201ea1907534 Thomas Gleixner 2025-10-27  879  		WARN_ON_ONCE(ev->sched_switch);
b48f8aaf42196bb Olivier Dion    2026-08-28 @880  		rseq_clear_one_shot_events(ev);
7a5201ea1907534 Thomas Gleixner 2025-10-27  881  	}
7a5201ea1907534 Thomas Gleixner 2025-10-27  882  }
7a5201ea1907534 Thomas Gleixner 2025-10-27  883  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
