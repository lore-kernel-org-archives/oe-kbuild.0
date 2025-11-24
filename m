Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451212EE263
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763974200; cv=none; b=NpT5hH7n2ANP4f+y238V2DndlvBoPUdlCqOGAFHHKOw4DgEn7e83+W4XFgVKkCIkkdGnWdIpmx42PXWs9muzLsU+B1z+DqUTdKOKkOQ90vmybmqblM0/J830UuYuNwnOjGB2KcH/t8nFtxGw9kjGASAImPpBn0wVoI+fOrVGJyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763974200; c=relaxed/simple;
	bh=L6gg5N3u16xBt6S/Coc+Ag9/9mzAa0yKm64E3ewz1Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQfPOTyDIl4xxDAMvfmyMDxQGDhFKKexPp9nOsA2miIYrX9BtOgU1up6qUBUQ9gqfHiDkCzdADmbIHGhMGaZYZh/xu4+7mpi42/fjgmXJjN1OZ9B8LMPBJgOqRPwgptJtJynSkwibWTSaR05qa/Qm3D2MrUfwhaehTacEsDEy2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWRwJVgo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWRwJVgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763974197; x=1795510197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L6gg5N3u16xBt6S/Coc+Ag9/9mzAa0yKm64E3ewz1Iw=;
  b=YWRwJVgozEZq2f1gGacpAGLYQEL44r1OgxSLANAJF1qCavXtwtNByTOf
   aLIgcSR9YTRzfY5NG+bd2gLO24+r/09gL9Igvdbouoqc1ZJ8q0bEDu4ma
   7egFvGxOI0VajD68GZc86yDht/70wAcSHmhRVbJW+/I9Yhm/wsgqkET/H
   qD9B9sbaNehmlfTbvvq/HQveuSGj5Ci+W5Uw86iuPv/95UQCuxymYxRRB
   PUtyZ9xWzMlbPd+V+f4BJCoLCuvIwRQt0I41HjqSmmJ8k0XabCoTWfJCo
   Yxz/5gZQ7Exndv7PAYYRJXWKb7xGSGFLgo6n8TK0vt05iZt7qscWd6p93
   w==;
X-CSE-ConnectionGUID: QFv4MFlOSva10tBX8nSDIA==
X-CSE-MsgGUID: EWK0uj5bQ2aX2YrVsPC+Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77329969"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="77329969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 00:49:57 -0800
X-CSE-ConnectionGUID: w82JpSBYSGWZQ1LAN3D0Ww==
X-CSE-MsgGUID: f3IuUQYBSgmFVtTPqLIIdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192518037"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2025 00:49:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNSGe-000000000XJ-48Am;
	Mon, 24 Nov 2025 08:49:52 +0000
Date: Mon, 24 Nov 2025 16:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-5.10 3304/3304] mm/filemap.c:823:14: warning: no
 previous prototype for '__add_to_page_cache_locked'
Message-ID: <202511241604.Mlqgblss-lkp@intel.com>
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
TO: kernel@openeuler.org

Hi Salvatore,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4a93a68b1fa420e5791d9f16414d427f8dd90fb4
commit: 68ee705da160d123656dcbf9ebd449fb77b54bc0 [3304/3304] scripts: kernel-doc: Fix syntax error due to undeclared args variable
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251124/202511241604.Mlqgblss-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241604.Mlqgblss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511241604.Mlqgblss-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/filemap.c:823:14: warning: no previous prototype for '__add_to_page_cache_locked' [-Wmissing-prototypes]
     823 | noinline int __add_to_page_cache_locked(struct page *page,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   mm/page_alloc.c:3040:6: warning: no previous prototype for '__drain_all_pages' [-Wmissing-prototypes]
    3040 | void __drain_all_pages(struct zone *zone, bool force_all_cpus)
         |      ^~~~~~~~~~~~~~~~~
>> mm/page_alloc.c:3603:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    3603 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> mm/page_alloc.c:6754:20: warning: no previous prototype for 'memmap_init' [-Wmissing-prototypes]
    6754 | void __init __weak memmap_init(void)
         |                    ^~~~~~~~~~~
>> mm/page_alloc.c:6792:23: warning: no previous prototype for 'arch_memmap_init' [-Wmissing-prototypes]
    6792 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         |                       ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:6910:6: warning: no previous prototype for '__zone_set_pageset_high_and_batch' [-Wmissing-prototypes]
    6910 | void __zone_set_pageset_high_and_batch(struct zone *zone, unsigned long high,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> mm/khugepaged.c:102: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
>> mm/khugepaged.c:102: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
>> mm/khugepaged.c:1453: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
>> mm/khugepaged.c:1453: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'mm' not described in 'collapse_file'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'file' not described in 'collapse_file'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'start' not described in 'collapse_file'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'hpage' not described in 'collapse_file'
>> mm/khugepaged.c:1691: warning: Function parameter or member 'node' not described in 'collapse_file'
   mm/khugepaged.c:1691: warning: Function parameter or member 'reliable' not described in 'collapse_file'
--
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:177:1: note: in expansion of macro 'LSM_HOOK'
     177 | LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:176:18: warning: 'file_open_default' defined but not used [-Wunused-const-variable=]
     176 | LSM_HOOK(int, 0, file_open, struct file *file)
         |                  ^~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:176:1: note: in expansion of macro 'LSM_HOOK'
     176 | LSM_HOOK(int, 0, file_open, struct file *file)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:175:18: warning: 'file_receive_default' defined but not used [-Wunused-const-variable=]
     175 | LSM_HOOK(int, 0, file_receive, struct file *file)
         |                  ^~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:175:1: note: in expansion of macro 'LSM_HOOK'
     175 | LSM_HOOK(int, 0, file_receive, struct file *file)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:173:18: warning: 'file_send_sigiotask_default' defined but not used [-Wunused-const-variable=]
     173 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:173:1: note: in expansion of macro 'LSM_HOOK'
     173 | LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:170:18: warning: 'file_fcntl_default' defined but not used [-Wunused-const-variable=]
     170 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:170:1: note: in expansion of macro 'LSM_HOOK'
     170 | LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:169:18: warning: 'file_lock_default' defined but not used [-Wunused-const-variable=]
     169 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         |                  ^~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:169:1: note: in expansion of macro 'LSM_HOOK'
     169 | LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:167:18: warning: 'file_mprotect_default' defined but not used [-Wunused-const-variable=]
     167 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         |                  ^~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:167:1: note: in expansion of macro 'LSM_HOOK'
     167 | LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:165:18: warning: 'mmap_file_default' defined but not used [-Wunused-const-variable=]
     165 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         |                  ^~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:165:1: note: in expansion of macro 'LSM_HOOK'
     165 | LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:164:18: warning: 'mmap_addr_default' defined but not used [-Wunused-const-variable=]
     164 | LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
         |                  ^~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:164:1: note: in expansion of macro 'LSM_HOOK'
     164 | LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
         | ^~~~~~~~
>> ./include/linux/lsm_hook_defs.h:162:18: warning: 'file_ioctl_compat_default' defined but not used [-Wunused-const-variable=]
     162 | LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:162:1: note: in expansion of macro 'LSM_HOOK'
     162 | LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:160:18: warning: 'file_ioctl_default' defined but not used [-Wunused-const-variable=]
     160 | LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
         |                  ^~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:160:1: note: in expansion of macro 'LSM_HOOK'
     160 | LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:158:18: warning: 'file_alloc_security_default' defined but not used [-Wunused-const-variable=]
     158 | LSM_HOOK(int, 0, file_alloc_security, struct file *file)
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:158:1: note: in expansion of macro 'LSM_HOOK'
     158 | LSM_HOOK(int, 0, file_alloc_security, struct file *file)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:157:18: warning: 'file_permission_default' defined but not used [-Wunused-const-variable=]
     157 | LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
         |                  ^~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:157:1: note: in expansion of macro 'LSM_HOOK'
     157 | LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:155:18: warning: 'kernfs_init_security_default' defined but not used [-Wunused-const-variable=]
     155 | LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
         |                  ^~~~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:155:1: note: in expansion of macro 'LSM_HOOK'
     155 | LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:153:18: warning: 'inode_copy_up_default' defined but not used [-Wunused-const-variable=]
     153 | LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
         |                  ^~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:153:1: note: in expansion of macro 'LSM_HOOK'
     153 | LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:150:18: warning: 'inode_listsecurity_default' defined but not used [-Wunused-const-variable=]
     150 | LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
         |                  ^~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:150:1: note: in expansion of macro 'LSM_HOOK'
     150 | LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:145:18: warning: 'inode_killpriv_default' defined but not used [-Wunused-const-variable=]
     145 | LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
         |                  ^~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
         |                                ^~~~
   security/security.c:712:9: note: in expansion of macro 'DECLARE_LSM_RET_DEFAULT_int'
     712 |         DECLARE_LSM_RET_DEFAULT_##RET(DEFAULT, NAME)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/lsm_hook_defs.h:145:1: note: in expansion of macro 'LSM_HOOK'
     145 | LSM_HOOK(int, 0, inode_killpriv, struct dentry *dentry)
         | ^~~~~~~~
   ./include/linux/lsm_hook_defs.h:144:18: warning: 'inode_need_killpriv_default' defined but not used [-Wunused-const-variable=]
     144 | LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
         |                  ^~~~~~~~~~~~~~~~~~~
   security/security.c:707:32: note: in definition of macro 'LSM_RET_DEFAULT'
     707 | #define LSM_RET_DEFAULT(NAME) (NAME##_default)
--
>> crypto/jitterentropy.c:134: warning: Function parameter or member 'ec' not described in 'jent_apt_reset'
>> crypto/jitterentropy.c:134: warning: Function parameter or member 'delta_masked' not described in 'jent_apt_reset'
>> crypto/jitterentropy.c:148: warning: Function parameter or member 'ec' not described in 'jent_apt_insert'
>> crypto/jitterentropy.c:148: warning: Function parameter or member 'delta_masked' not described in 'jent_apt_insert'
>> crypto/jitterentropy.c:192: warning: Function parameter or member 'ec' not described in 'jent_rct_insert'
>> crypto/jitterentropy.c:192: warning: Function parameter or member 'stuck' not described in 'jent_rct_insert'
>> crypto/jitterentropy.c:236: warning: Function parameter or member 'ec' not described in 'jent_rct_failure'
>> crypto/jitterentropy.c:265: warning: Function parameter or member 'ec' not described in 'jent_stuck'
>> crypto/jitterentropy.c:265: warning: Function parameter or member 'current_delta' not described in 'jent_stuck'
>> crypto/jitterentropy.c:300: warning: Function parameter or member 'ec' not described in 'jent_health_failure'
>> crypto/jitterentropy.c:326: warning: Function parameter or member 'ec' not described in 'jent_loop_shuffle'
>> crypto/jitterentropy.c:326: warning: Function parameter or member 'bits' not described in 'jent_loop_shuffle'
>> crypto/jitterentropy.c:326: warning: Function parameter or member 'min' not described in 'jent_loop_shuffle'
>> crypto/jitterentropy.c:382: warning: Function parameter or member 'ec' not described in 'jent_lfsr_time'
>> crypto/jitterentropy.c:382: warning: Function parameter or member 'time' not described in 'jent_lfsr_time'
>> crypto/jitterentropy.c:382: warning: Function parameter or member 'loop_cnt' not described in 'jent_lfsr_time'
>> crypto/jitterentropy.c:382: warning: Function parameter or member 'stuck' not described in 'jent_lfsr_time'
>> crypto/jitterentropy.c:462: warning: Function parameter or member 'ec' not described in 'jent_memaccess'
>> crypto/jitterentropy.c:462: warning: Function parameter or member 'loop_cnt' not described in 'jent_memaccess'
>> crypto/jitterentropy.c:516: warning: Function parameter or member 'ec' not described in 'jent_measure_jitter'
   crypto/jitterentropy.c:548: warning: Function parameter or member 'ec' not described in 'jent_gen_entropy'
   crypto/jitterentropy.c:593: warning: Function parameter or member 'ec' not described in 'jent_read_entropy'
   crypto/jitterentropy.c:593: warning: Function parameter or member 'data' not described in 'jent_read_entropy'
   crypto/jitterentropy.c:593: warning: Function parameter or member 'len' not described in 'jent_read_entropy'
--
>> crypto/crypto_engine.c:259: warning: Function parameter or member 'need_pump' not described in 'crypto_transfer_request'
>> crypto/crypto_engine.c:485: warning: Excess function parameter 'engine' description in 'crypto_engine_alloc_init_and_set'
--
>> crypto/asymmetric_keys/pkcs7_trust.c:25: warning: Function parameter or member 'pkcs7' not described in 'pkcs7_validate_trust_one'
>> crypto/asymmetric_keys/pkcs7_trust.c:25: warning: Function parameter or member 'sinfo' not described in 'pkcs7_validate_trust_one'
>> crypto/asymmetric_keys/pkcs7_trust.c:25: warning: Function parameter or member 'trust_keyring' not described in 'pkcs7_validate_trust_one'
--
   In file included from ./include/linux/bpf_verifier.h:8,
                    from kernel/bpf/verifier.c:12:
   kernel/bpf/verifier.c: In function 'jit_subprogs':
>> ./include/linux/filter.h:350:18: warning: cast between incompatible function types from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     350 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:11516:37: note: in expansion of macro 'BPF_CAST_CALL'
   11516 |                         insn->imm = BPF_CAST_CALL(func[subprog]->bpf_func) -
         |                                     ^~~~~~~~~~~~~
   kernel/bpf/verifier.c: In function 'fixup_bpf_calls':
>> ./include/linux/filter.h:350:18: warning: cast between incompatible function types from 'void * (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     350 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:11925:45: note: in expansion of macro 'BPF_CAST_CALL'
   11925 |                                 insn->imm = BPF_CAST_CALL(ops->map_lookup_elem) -
         |                                             ^~~~~~~~~~~~~
>> ./include/linux/filter.h:350:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *, void *, u64)' {aka 'int (*)(struct bpf_map *, void *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     350 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:11929:45: note: in expansion of macro 'BPF_CAST_CALL'
   11929 |                                 insn->imm = BPF_CAST_CALL(ops->map_update_elem) -
         |                                             ^~~~~~~~~~~~~
>> ./include/linux/filter.h:350:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     350 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:11933:45: note: in expansion of macro 'BPF_CAST_CALL'
   11933 |                                 insn->imm = BPF_CAST_CALL(ops->map_delete_elem) -
         |                                             ^~~~~~~~~~~~~
>> ./include/linux/filter.h:350:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *, u64)' {aka 'int (*)(struct bpf_map *, void *, long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     350 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:11937:45: note: in expansion of macro 'BPF_CAST_CALL'
   11937 |                                 insn->imm = BPF_CAST_CALL(ops->map_push_elem) -
         |                                             ^~~~~~~~~~~~~
>> ./include/linux/filter.h:350:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     350 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:11941:45: note: in expansion of macro 'BPF_CAST_CALL'
   11941 |                                 insn->imm = BPF_CAST_CALL(ops->map_pop_elem) -
         |                                             ^~~~~~~~~~~~~
>> ./include/linux/filter.h:350:18: warning: cast between incompatible function types from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Wcast-function-type]
     350 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^
   kernel/bpf/verifier.c:11945:45: note: in expansion of macro 'BPF_CAST_CALL'
   11945 |                                 insn->imm = BPF_CAST_CALL(ops->map_peek_elem) -
         |                                             ^~~~~~~~~~~~~
..


vim +/__add_to_page_cache_locked +823 mm/filemap.c

ef6a3c63112e86 Miklos Szeredi          2011-03-22  822  
16c0cc0ce3059e Andrew Morton           2020-12-11 @823  noinline int __add_to_page_cache_locked(struct page *page,
a528910e12ec7e Johannes Weiner         2014-04-03  824  					struct address_space *mapping,
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  825) 					pgoff_t offset, gfp_t gfp,
a528910e12ec7e Johannes Weiner         2014-04-03  826  					void **shadowp)
^1da177e4c3f41 Linus Torvalds          2005-04-16  827  {
74d609585d8bd6 Matthew Wilcox          2017-11-17  828  	XA_STATE(xas, &mapping->i_pages, offset);
00501b531c4723 Johannes Weiner         2014-08-08  829  	int huge = PageHuge(page);
e286781d5f2e9c Nick Piggin             2008-07-25  830  	int error;
19d76e3d865c76 Waiman Long             2021-02-19  831  	bool charged = false;
e286781d5f2e9c Nick Piggin             2008-07-25  832  
309381feaee564 Sasha Levin             2014-01-23  833  	VM_BUG_ON_PAGE(!PageLocked(page), page);
309381feaee564 Sasha Levin             2014-01-23  834  	VM_BUG_ON_PAGE(PageSwapBacked(page), page);
74d609585d8bd6 Matthew Wilcox          2017-11-17  835  	mapping_set_update(&xas, mapping);
e286781d5f2e9c Nick Piggin             2008-07-25  836  
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  837  	get_page(page);
^1da177e4c3f41 Linus Torvalds          2005-04-16  838  	page->mapping = mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  839  	page->index = offset;
e286781d5f2e9c Nick Piggin             2008-07-25  840  
3fea5a499d57de Johannes Weiner         2020-06-03  841  	if (!huge) {
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  842) 		error = mem_cgroup_charge(page, current->mm, gfp);
3fea5a499d57de Johannes Weiner         2020-06-03  843  		if (error)
3fea5a499d57de Johannes Weiner         2020-06-03  844  			goto error;
19d76e3d865c76 Waiman Long             2021-02-19  845  		charged = true;
3fea5a499d57de Johannes Weiner         2020-06-03  846  	}
3fea5a499d57de Johannes Weiner         2020-06-03  847  
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  848) 	gfp &= GFP_RECLAIM_MASK;
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  849) 
74d609585d8bd6 Matthew Wilcox          2017-11-17  850  	do {
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  851) 		unsigned int order = xa_get_order(xas.xa, xas.xa_index);
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  852) 		void *entry, *old = NULL;
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  853) 
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  854) 		if (order > thp_order(page))
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  855) 			xas_split_alloc(&xas, xa_load(xas.xa, xas.xa_index),
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  856) 					order, gfp);
74d609585d8bd6 Matthew Wilcox          2017-11-17  857  		xas_lock_irq(&xas);
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  858) 		xas_for_each_conflict(&xas, entry) {
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  859) 			old = entry;
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  860) 			if (!xa_is_value(entry)) {
74d609585d8bd6 Matthew Wilcox          2017-11-17  861  				xas_set_err(&xas, -EEXIST);
74d609585d8bd6 Matthew Wilcox          2017-11-17  862  				goto unlock;
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  863) 			}
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  864) 		}
4165b9b4618129 Michal Hocko            2015-06-24  865  
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  866) 		if (old) {
74d609585d8bd6 Matthew Wilcox          2017-11-17  867  			if (shadowp)
74d609585d8bd6 Matthew Wilcox          2017-11-17  868  				*shadowp = old;
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  869) 			/* entry may have been split before we acquired lock */
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  870) 			order = xa_get_order(xas.xa, xas.xa_index);
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  871) 			if (order > thp_order(page)) {
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  872) 				xas_split(&xas, old, order);
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  873) 				xas_reset(&xas);
74d609585d8bd6 Matthew Wilcox          2017-11-17  874  			}
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  875) 		}
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  876) 
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  877) 		xas_store(&xas, page);
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  878) 		if (xas_error(&xas))
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  879) 			goto unlock;
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  880) 
74d609585d8bd6 Matthew Wilcox          2017-11-17  881  		mapping->nrpages++;
74d609585d8bd6 Matthew Wilcox          2017-11-17  882  
74d609585d8bd6 Matthew Wilcox          2017-11-17  883  		/* hugetlb pages do not participate in page cache accounting */
4165b9b4618129 Michal Hocko            2015-06-24  884  		if (!huge)
0d1c20722ab333 Johannes Weiner         2020-06-03  885  			__inc_lruvec_page_state(page, NR_FILE_PAGES);
74d609585d8bd6 Matthew Wilcox          2017-11-17  886  unlock:
74d609585d8bd6 Matthew Wilcox          2017-11-17  887  		xas_unlock_irq(&xas);
198b62f83eef1d Matthew Wilcox (Oracle  2020-10-15  888) 	} while (xas_nomem(&xas, gfp));
74d609585d8bd6 Matthew Wilcox          2017-11-17  889  
3fea5a499d57de Johannes Weiner         2020-06-03  890  	if (xas_error(&xas)) {
3fea5a499d57de Johannes Weiner         2020-06-03  891  		error = xas_error(&xas);
19d76e3d865c76 Waiman Long             2021-02-19  892  		if (charged)
19d76e3d865c76 Waiman Long             2021-02-19  893  			mem_cgroup_uncharge(page);
74d609585d8bd6 Matthew Wilcox          2017-11-17  894  		goto error;
3fea5a499d57de Johannes Weiner         2020-06-03  895  	}
74d609585d8bd6 Matthew Wilcox          2017-11-17  896  
fe0bfaaff84429 Robert Jarzmik          2013-04-29  897  	trace_mm_filemap_add_to_page_cache(page);
66a0c8ee3dce78 Kirill A. Shutemov      2013-09-12  898  	return 0;
74d609585d8bd6 Matthew Wilcox          2017-11-17  899  error:
e286781d5f2e9c Nick Piggin             2008-07-25  900  	page->mapping = NULL;
b85e0effd3dcbf Hugh Dickins            2011-07-25  901  	/* Leave page->index set: truncation relies upon it */
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  902  	put_page(page);
3fea5a499d57de Johannes Weiner         2020-06-03  903  	return error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  904  }
cfcbfb1382dbac Josef Bacik             2019-05-13  905  ALLOW_ERROR_INJECTION(__add_to_page_cache_locked, ERRNO);
a528910e12ec7e Johannes Weiner         2014-04-03  906  

:::::: The code at line 823 was first introduced by commit
:::::: 16c0cc0ce3059e315a0aab6538061d95a6612589 revert "mm/filemap: add static for function __add_to_page_cache_locked"

:::::: TO: Andrew Morton <akpm@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
