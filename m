Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA521BDC7
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 20:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNGA6fCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701463864; x=1732999864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xtfuDQUIwH5wmGkWKOGPHRrLtCwkJNI4GPKe5HeodrA=;
  b=eNGA6fCPFC16/fxoYz2QqYFOUqMYm3Tm0Sj44TULjvAmPAqZDr1RJHgS
   mAVPuywjY348NO4/VQDTABEsR5eRVsiEcW9p3aS8WIA9WU72oRBDqimGT
   ik+rmYgsvvahW+NSr4HeK0yO8V01wYceTXU28nEZmSyq9sD4XXh9PlY0V
   sfbxfk+BFUAaGvEoVHLdD9rXES9QQf0dXCKfzKPQBFehp6zXosp7+OU+6
   hN0vGFr9Xm8CNCNOXB3jyyBNzHfi8WEpQINtqIW5DfpJkZDFywE7dCVBs
   Jut9Z7r9r86UsBMwBQRk36gVJ8hP9KW31hu72S9SuL6XMWt5OafAC+e3p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="460042914"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="460042914"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 12:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="840306551"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="840306551"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2023 12:51:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9ATT-0004HM-2u;
	Fri, 01 Dec 2023 20:50:59 +0000
Date: Sat, 2 Dec 2023 04:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/plat-axs10x/axs10x.c:382:6: sparse: sparse: symbol
 'coware_swa_pid_offset' was not declared. Should it be static?
Message-ID: <202312020444.TVaqgtVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: b1fbfcb4a20949df08dd995927cdc5ad220c128d kbuild: make single target builds even faster
date:   4 years ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 years ago
config: arc-randconfig-r111-20231107 (https://download.01.org/0day-ci/archive/20231202/202312020444.TVaqgtVQ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020444.TVaqgtVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020444.TVaqgtVQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arc/plat-axs10x/axs10x.c:313:35: sparse: sparse: undefined identifier '__builtin_arc_lr'
>> arch/arc/plat-axs10x/axs10x.c:382:6: sparse: sparse: symbol 'coware_swa_pid_offset' was not declared. Should it be static?
>> arch/arc/plat-axs10x/axs10x.c:383:6: sparse: sparse: symbol 'coware_swa_comm_offset' was not declared. Should it be static?
--
>> arch/arc/plat-hsdk/platform.c:16:5: sparse: sparse: symbol 'arc_hsdk_axi_dmac_coherent' was not declared. Should it be static?
   arch/arc/plat-hsdk/platform.c:27:17: sparse: sparse: undefined identifier '__builtin_arc_sr'
   arch/arc/plat-hsdk/platform.c:34:17: sparse: sparse: undefined identifier '__builtin_arc_sr'
--
   kernel/signal.c:1245:9: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1251:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1251:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1251:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1251:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1251:29: sparse: sparse: cannot dereference this type
>> kernel/signal.c:1251:29: sparse: sparse: non-scalar type in conditional:
>> kernel/signal.c:1251:29: sparse:    void
   kernel/signal.c:1370:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/signal.c:1370:27: sparse:    struct sighand_struct [noderef] <asn:4> *
   kernel/signal.c:1370:27: sparse:    struct sighand_struct *
   kernel/signal.c:1948:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:1948:65: sparse:     expected struct task_struct *tsk
   kernel/signal.c:1948:65: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:1949:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:1949:40: sparse:     expected void const volatile *p
   kernel/signal.c:1949:40: sparse:     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:1949:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:1949:40: sparse:     expected void const volatile *p
   kernel/signal.c:1949:40: sparse:     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:1992:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:1992:54: sparse:     expected struct task_struct *p
   kernel/signal.c:1992:54: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:1993:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:1993:34: sparse:     expected struct task_struct *parent
   kernel/signal.c:1993:34: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2022:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:2022:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2022:24: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2025:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] <asn:4> *real_parent @@
   kernel/signal.c:2025:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2025:24: sparse:     got struct task_struct [noderef] <asn:4> *real_parent
   kernel/signal.c:2506:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] <asn:4> *parent @@
   kernel/signal.c:2506:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2506:52: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2508:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:2508:49: sparse:     expected void const volatile *p
   kernel/signal.c:2508:49: sparse:     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:2508:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *p @@     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> * @@
   kernel/signal.c:2508:49: sparse:     expected void const volatile *p
   kernel/signal.c:2508:49: sparse:     got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
   kernel/signal.c:3676:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct siginfo const [noderef] [usertype] <asn:1> *from @@     got struct siginfo [usertype] *info @@
   kernel/signal.c:3676:46: sparse:     expected struct siginfo const [noderef] [usertype] <asn:1> *from
   kernel/signal.c:3676:46: sparse:     got struct siginfo [usertype] *info
   kernel/signal.c:1289:9: sparse: sparse: context imbalance in 'do_send_sig_info' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:649:9: sparse: sparse: context imbalance in '__lock_task_sighand' - different lock contexts for basic block
   include/linux/rcupdate.h:651:9: sparse: sparse: context imbalance in 'send_sigqueue' - wrong count at exit
   kernel/signal.c:1929:47: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1949:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1967:19: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2088:13: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/arc/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] <asn:4> *real_parent @@
   include/linux/ptrace.h:99:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:     got struct task_struct [noderef] <asn:4> *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] <asn:4> *parent @@
   include/linux/ptrace.h:99:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2299:13: sparse: sparse: context imbalance in 'do_signal_stop' - different lock contexts for basic block
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2508:49: sparse: sparse: dereference of noderef expression
   include/linux/ptrace.h:99:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] <asn:4> *real_parent @@
   include/linux/ptrace.h:99:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:99:40: sparse:     got struct task_struct [noderef] <asn:4> *real_parent
   include/linux/ptrace.h:99:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] <asn:4> *parent @@
   include/linux/ptrace.h:99:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:99:60: sparse:     got struct task_struct [noderef] <asn:4> *parent
   kernel/signal.c:2591:69: sparse: sparse: context imbalance in 'get_signal' - unexpected unlock
   kernel/signal.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h):
   arch/arc/include/asm/uaccess.h:619:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char *d_char @@     got void [noderef] <asn:1> *to @@
   arch/arc/include/asm/uaccess.h:619:33: sparse:     expected unsigned char *d_char
   arch/arc/include/asm/uaccess.h:619:33: sparse:     got void [noderef] <asn:1> *to
   kernel/signal.c:3736:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct siginfo [usertype] *info @@     got struct siginfo [noderef] [usertype] <asn:1> *info @@
   kernel/signal.c:3736:58: sparse:     expected struct siginfo [usertype] *info
   kernel/signal.c:3736:58: sparse:     got struct siginfo [noderef] [usertype] <asn:1> *info

vim +/coware_swa_pid_offset +382 arch/arc/plat-axs10x/axs10x.c

5fa2daaa8d8223 Vineet Gupta 2015-03-09  378  
2924cd18c434c7 Ruud Derwig  2014-12-03  379  /*
2924cd18c434c7 Ruud Derwig  2014-12-03  380   * For the VDK OS-kit, to get the offset to pid and command fields
2924cd18c434c7 Ruud Derwig  2014-12-03  381   */
2924cd18c434c7 Ruud Derwig  2014-12-03 @382  char coware_swa_pid_offset[TASK_PID];
2924cd18c434c7 Ruud Derwig  2014-12-03 @383  char coware_swa_comm_offset[TASK_COMM];
2924cd18c434c7 Ruud Derwig  2014-12-03  384  

:::::: The code at line 382 was first introduced by commit
:::::: 2924cd18c434c79ee777dc63616a8505045d7509 ARCv2: [vdk] dts files and defconfig for HS38 VDK

:::::: TO: Ruud Derwig <rderwig@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
