Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB366197
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Oct 2023 00:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/R8q1BU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698193662; x=1729729662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YS1nsHe+G/b2fF4G3WdiYvXASNNQ6RFbK2BAl+1FUy0=;
  b=I/R8q1BU62VMpOZSXjNmw/2BUCBrEmvo/za9dsMdPZQSnVO5xvs136Pa
   ilcQJPyCX270artK/tAgFMfcpt0CtzoQCWpZqrjEqpkaCoZ5Bo37AuDbn
   Kpe0uPcH+JJBrx7cqapYpXB0WB5diwxcjUK2GkYPTcZ6erppMYhdPTwEh
   RxkKxT3Qt7iAC82BfTO0dUlT+2sy7cdKMEbwSXNXc0bwclD+IQEh+VNsp
   crzsqLoOCFktc1qf7hWkNLn0QWWQ22/U6rCrsehipoDHoTZONunGrlY6B
   uOBzvx1jYkXPuN9F3lWsOHh2x82y28I+Yge2Z9qhMmPotmSP2k74FY8Q8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453678127"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="453678127"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 17:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="824486089"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="824486089"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Oct 2023 17:27:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvRkE-0008RB-0k;
	Wed, 25 Oct 2023 00:27:34 +0000
Date: Wed, 25 Oct 2023 08:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:x86/percpu 21/22] arch/x86/include/asm/current.h:46:24: sparse:
 sparse: dereference of noderef expression
Message-ID: <202310250853.e9Bu8FbE-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Uros Bizjak <ubizjak@gmail.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Nadav Amit <namit@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/percpu
head:   0548eb067ed664b93043e033295ca71e3e706245
commit: ed2f752e0e0a21d941ca0ee539ef3d4cd576bc5e [21/22] x86/percpu: Introduce const-qualified const_pcpu_hot to micro-optimize code generation
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-062-20231025 (https://download.01.org/0day-ci/archive/20231025/202310250853.e9Bu8FbE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250853.e9Bu8FbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310250853.e9Bu8FbE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/async.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/groups.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/irqflags.h, include/linux/irqflags.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/pid.c:382:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:382:9: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:382:9: sparse:    struct pid *
   kernel/pid.c:383:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:383:9: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:383:9: sparse:    struct pid *
   kernel/pid.c:445:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:445:23: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:445:23: sparse:    struct pid *
   kernel/pid.c:503:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:503:24: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:503:24: sparse:    struct pid *
   kernel/pid.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/pid.c: note: in included file (through include/linux/pid.h, include/linux/sched.h, include/linux/mm.h):
   include/linux/rculist.h:552:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:552:9: sparse:    struct hlist_node [noderef] __rcu *
   include/linux/rculist.h:552:9: sparse:    struct hlist_node *
   include/linux/rculist.h:553:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:553:9: sparse:    struct hlist_node [noderef] __rcu *
   include/linux/rculist.h:553:9: sparse:    struct hlist_node *
--
   kernel/panic.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/nsproxy.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/umh.c:70:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/umh.c:70:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/umh.c:70:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/umh.c:72:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/umh.c:72:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/umh.c:72:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/umh.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/task_work.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/exec_domain.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/capability.c: note: in included file (through include/linux/sched.h, include/linux/audit.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/cred.c:150:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:150:9: sparse:    struct cred *
   kernel/cred.c:150:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:151:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:151:9: sparse:    struct cred *
   kernel/cred.c:151:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:167:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t const [usertype] *v @@     got struct atomic_t const [noderef] __rcu * @@
   kernel/cred.c:167:9: sparse:     expected struct atomic_t const [usertype] *v
   kernel/cred.c:167:9: sparse:     got struct atomic_t const [noderef] __rcu *
   kernel/cred.c:167:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:167:9: sparse:     expected struct cred const *cred
   kernel/cred.c:167:9: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:171:17: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/cred.c:177:17: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/cred.c:269:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:269:13: sparse:     expected struct cred const *old
   kernel/cred.c:269:13: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:358:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:358:42: sparse:     expected struct cred const *cred
   kernel/cred.c:358:42: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:358:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *real_cred @@     got struct cred const * @@
   kernel/cred.c:358:30: sparse:     expected struct cred const [noderef] __rcu *real_cred
   kernel/cred.c:358:30: sparse:     got struct cred const *
   kernel/cred.c:359:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:359:27: sparse:     expected struct cred const *cred
   kernel/cred.c:359:27: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:360:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *_cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:360:41: sparse:     expected struct cred const *_cred
   kernel/cred.c:360:41: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:361:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t const [usertype] *v @@     got struct atomic_t const [noderef] __rcu * @@
   kernel/cred.c:361:17: sparse:     expected struct atomic_t const [usertype] *v
   kernel/cred.c:361:17: sparse:     got struct atomic_t const [noderef] __rcu *
   kernel/cred.c:361:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:361:17: sparse:     expected struct cred const *cred
   kernel/cred.c:361:17: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:400:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *real_cred @@     got struct cred const * @@
   kernel/cred.c:400:32: sparse:     expected struct cred const [noderef] __rcu *real_cred
   kernel/cred.c:400:32: sparse:     got struct cred const *
   kernel/cred.c:453:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *real_cred @@
   kernel/cred.c:453:38: sparse:     expected struct cred const *old
   kernel/cred.c:453:38: sparse:     got struct cred const [noderef] __rcu *real_cred
   kernel/cred.c:459:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:459:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:459:9: sparse:    struct cred const *
   kernel/cred.c:559:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:559:41: sparse:     expected struct cred const *old
   kernel/cred.c:559:41: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:600:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *override @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:600:46: sparse:     expected struct cred const *override
   kernel/cred.c:600:46: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/irqflags.h, include/linux/irqflags.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/cred.c:354:19: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/reboot.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h, include/linux/elfcore.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/smpboot.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/resource.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/softirq.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/sysctl.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/ptrace.c:55:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:55:22: sparse:    struct task_struct *
   kernel/ptrace.c:55:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:74:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *parent @@     got struct task_struct *new_parent @@
   kernel/ptrace.c:74:23: sparse:     expected struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:74:23: sparse:     got struct task_struct *new_parent
   kernel/ptrace.c:75:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *ptracer_cred @@     got struct cred const * @@
   kernel/ptrace.c:75:29: sparse:     expected struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:75:29: sparse:     got struct cred const *
   kernel/ptrace.c:129:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const *old_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   kernel/ptrace.c:129:18: sparse:     expected struct cred const *old_cred
   kernel/ptrace.c:129:18: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:133:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:133:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:133:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:171:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:171:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:171:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:203:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:203:28: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:203:28: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:209:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:209:30: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:209:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:262:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:262:44: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:262:44: sparse:    struct task_struct *
   kernel/ptrace.c:453:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:453:24: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:453:24: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:478:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:478:26: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:478:26: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:514:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/ptrace.c:514:54: sparse:     expected struct task_struct *parent
   kernel/ptrace.c:514:54: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:522:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:522:53: sparse:     expected struct task_struct *new_parent
   kernel/ptrace.c:522:53: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:570:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:570:41: sparse:     expected struct task_struct *p1
   kernel/ptrace.c:570:41: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:572:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sigh @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/ptrace.c:572:50: sparse:     expected struct sighand_struct *sigh
   kernel/ptrace.c:572:50: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/ptrace.c:763:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:763:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:763:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:771:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:771:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:771:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:882:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:882:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:882:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:886:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:886:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:886:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1116:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1116:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1116:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1118:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1118:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1118:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/ptrace.c:520:38: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:710:9: sparse: sparse: context imbalance in 'ptrace_getsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:726:9: sparse: sparse: context imbalance in 'ptrace_setsiginfo' - different lock contexts for basic block
   kernel/ptrace.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1275:9: sparse: sparse: context imbalance in 'ptrace_request' - different lock contexts for basic block
--
   kernel/sys.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/sys.c:1102:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sys.c:1102:32: sparse:     expected struct task_struct *p1
   kernel/sys.c:1102:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: too many warnings
--
   kernel/kthread.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/exit.c:334:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:334:37: sparse:     expected struct task_struct *tsk
   kernel/exit.c:334:37: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:337:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:337:32: sparse:     expected struct task_struct *task
   kernel/exit.c:337:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:338:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:338:35: sparse:     expected struct task_struct *task
   kernel/exit.c:338:35: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:383:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:383:24: sparse:     expected struct task_struct *parent
   kernel/exit.c:383:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:410:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:410:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:410:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:413:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:413:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:413:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:455:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/exit.c:455:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/exit.c:455:23: sparse:    struct task_struct *
   kernel/exit.c:479:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/exit.c:479:9: sparse:    struct list_head *
   kernel/exit.c:479:9: sparse:    struct list_head [noderef] __rcu *
   kernel/exit.c:640:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:642:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:795:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:1008:63: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *const sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:1163:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1188:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1277:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1292:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1343:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1346:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1352:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1533:59: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/exit.c:1533:59: sparse:    void *
   kernel/exit.c:1533:59: sparse:    struct task_struct [noderef] __rcu *
   kernel/exit.c:1549:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu * @@
   kernel/exit.c:1549:25: sparse:     expected struct task_struct *parent
   kernel/exit.c:1549:25: sparse:     got struct task_struct [noderef] __rcu *
   kernel/exit.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/exit.c:479:9: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/exit.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'wait_task_zombie' - unexpected unlock
   kernel/exit.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/exit.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'wait_task_stopped' - unexpected unlock
   kernel/exit.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/exit.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'wait_task_continued' - unexpected unlock
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/exit.c:1641:9: sparse: sparse: context imbalance in 'do_wait' - wrong count at exit
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/fork.c:1246:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *owner @@     got struct task_struct *p @@
   kernel/fork.c:1246:19: sparse:     expected struct task_struct [noderef] __rcu *owner
   kernel/fork.c:1246:19: sparse:     got struct task_struct *p
   kernel/fork.c:1804:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1804:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1804:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1813:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1813:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1813:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1814:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1814:9: sparse:     expected void const *
   kernel/fork.c:1814:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1814:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1814:9: sparse:     expected void const *
   kernel/fork.c:1814:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1814:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1814:9: sparse:     expected void const *
   kernel/fork.c:1814:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1815:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1815:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1815:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2317:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2317:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2317:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2321:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2321:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2321:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2637:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2637:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2637:32: sparse:     got struct task_struct *
   kernel/fork.c:2646:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2646:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2646:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2695:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2695:54: sparse:     expected struct list_head *head
   kernel/fork.c:2695:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2717:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2717:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2717:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2739:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2739:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2739:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2766:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2766:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2766:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2795:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2795:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2795:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2797:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2797:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2797:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3238:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3238:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:3238:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3326:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3326:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3326:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1909:9: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2367:22: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: too many warnings
   kernel/fork.c:1238:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/fork.c:1238:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/fork.c:1238:23: sparse:    struct task_struct *
--
   kernel/stacktrace.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/freezer.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/freezer.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/freezer.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/freezer.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/freezer.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/signal.c:2120:14: sparse:     got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand
   kernel/signal.c:2149:53: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2149:53: sparse:     expected struct task_struct *t
   kernel/signal.c:2149:53: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2150:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2150:34: sparse:     expected struct task_struct *parent
   kernel/signal.c:2150:34: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2179:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2179:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2179:24: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2182:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/signal.c:2182:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2182:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/signal.c:2215:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2215:17: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2215:17: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:2255:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2255:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2255:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2257:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2257:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2257:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2314:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2314:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2314:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2349:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2349:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2349:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2389:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2389:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2389:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2391:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2391:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2391:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2491:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2491:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2491:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2575:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2575:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2575:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2587:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2587:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2587:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2622:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2622:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2622:52: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2624:49: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2662:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2662:49: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2662:49: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:2993:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2993:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2993:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3014:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3014:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3014:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3081:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3081:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3081:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3083:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3083:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3083:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3234:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3234:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3234:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3237:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3237:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3237:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3626:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3626:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3626:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3638:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3638:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3638:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3643:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3643:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3643:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3648:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3648:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3648:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4102:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4102:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4102:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4114:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4114:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4114:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4132:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct k_sigaction *k @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:4132:11: sparse:     expected struct k_sigaction *k
   kernel/signal.c:4132:11: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/signal.c:4134:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4134:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4134:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4136:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4136:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4136:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4184:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4184:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4184:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:71:34: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/signal.c:531:35: sparse: sparse: dereference of noderef expression
   kernel/signal.c:559:52: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1044:13: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file:
   include/linux/signalfd.h:21:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:21:13: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:21:13: sparse:     got struct wait_queue_head [noderef] __rcu *
   include/linux/signalfd.h:22:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:22:17: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:22:17: sparse:     got struct wait_queue_head [noderef] __rcu *
   kernel/signal.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file (through include/linux/sched/cputime.h):
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1315:9: sparse: sparse: context imbalance in 'do_send_sig_info' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
   arch/x86/include/asm/current.h:46:24: sparse: sparse: too many warnings
--
   kernel/uid16.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/utsname_sysctl.c: note: in included file (through include/linux/sched.h, include/linux/utsname.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/hung_task.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/kexec_core.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/watchdog.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/seccomp.c:1383:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1383:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1383:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1395:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1395:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1395:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1876:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/seccomp.c:1876:9: sparse:     expected struct lockdep_map const *lock
   kernel/seccomp.c:1876:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/seccomp.c:1962:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1962:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1962:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1980:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1980:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1980:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c: note: in included file (through include/linux/sched.h, include/linux/audit.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:882:9: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:495:9: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:596:9: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:453:9: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:439:9: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:453:9: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:439:9: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:453:9: sparse: sparse: too many warnings
--
   kernel/irq_work.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/irqflags.h, include/linux/irqflags.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/torture.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/sched/core.c:725:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:725:31: sparse:     expected struct task_struct *task
   kernel/sched/core.c:725:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:726:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:726:25: sparse:     expected struct task_struct *task
   kernel/sched/core.c:726:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:796:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:796:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:796:48: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1043:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1043:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1043:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2232:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2232:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2232:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2232:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2232:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2232:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5642:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5642:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5642:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6587:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6587:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6587:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7113:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7113:17: sparse:    struct task_struct *
   kernel/sched/core.c:7113:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7329:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7329:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7329:22: sparse:    struct task_struct *
   kernel/sched/core.c:11527:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11527:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11527:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:551:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:584:23: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:600:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:638:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:679:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c:796:11: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2223:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2224:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2225:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2297:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2297:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2297:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2297:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2297:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2297:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct *
--
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:961:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:961:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:961:70: sparse:    struct task_struct *
   kernel/sched/rt.c:577:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:577:54: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:577:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1047:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1047:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1047:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1592:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1592:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1592:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:1945:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1945:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1945:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1177:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1177:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1177:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1300:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1300:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1300:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2649:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2649:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2649:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/irqflags.h, include/linux/irqflags.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
--
   kernel/locking/semaphore.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/locking/mutex.c: note: in included file (through include/linux/mutex.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/locking/percpu-rwsem.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/percpu.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/locking/rwsem.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: too many warnings
--
   kernel/locking/spinlock_debug.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/locking/rtmutex_api.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/locking/rtmutex_api.c: note: in included file:
   kernel/locking/rtmutex.c:1613:17: sparse: sparse: context imbalance in 'rt_mutex_slowlock_block' - unexpected unlock
   kernel/locking/rtmutex_api.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/locking/locktorture.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/locking/locktorture.c:447:12: sparse: sparse: context imbalance in 'torture_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:466:13: sparse: sparse: context imbalance in 'torture_mutex_unlock' - wrong count at exit
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/locking/locktorture.c:524:12: sparse: sparse: context imbalance in 'torture_ww_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file:
   include/linux/ww_mutex.h:191:9: sparse: sparse: context imbalance in 'torture_ww_mutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:619:12: sparse: sparse: context imbalance in 'torture_rtmutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:645:13: sparse: sparse: context imbalance in 'torture_rtmutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:685:12: sparse: sparse: context imbalance in 'torture_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:704:13: sparse: sparse: context imbalance in 'torture_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c:710:12: sparse: sparse: context imbalance in 'torture_rwsem_down_read' - wrong count at exit
   kernel/locking/locktorture.c:731:13: sparse: sparse: context imbalance in 'torture_rwsem_up_read' - wrong count at exit
   kernel/locking/locktorture.c:761:12: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:768:13: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file:
   include/linux/percpu-rwsem.h:70:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_read' - wrong count at exit
   include/linux/percpu-rwsem.h:121:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_read' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/locking/lockdep.c: note: in included file (through include/linux/mutex.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/locking/lockdep.c:3376:49: sparse: sparse: cast truncates bits from constant value (50000 becomes 0)
   kernel/locking/lockdep.c:3376:49: sparse: sparse: cast truncates bits from constant value (50000 becomes 0)
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   arch/x86/include/asm/current.h:46:24: sparse: sparse: too many warnings
--
   kernel/power/process.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/printk/printk.c:290:5: sparse: sparse: context imbalance in 'console_srcu_read_lock' - wrong count at exit
   kernel/printk/printk.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:301:9: sparse: sparse: context imbalance in 'console_srcu_read_unlock' - unexpected unlock
   kernel/printk/printk.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/irq/handle.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/irq/manage.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/rcu/update.c: note: in included file:
   kernel/rcu/tasks.h:1087:5: sparse: sparse: symbol 'rcu_tasks_lazy_ms' was not declared. Should it be static?
   kernel/rcu/tasks.h:1251:5: sparse: sparse: symbol 'rcu_tasks_rude_lazy_ms' was not declared. Should it be static?
   kernel/rcu/tasks.h:1405:15: sparse: sparse: cast to non-scalar
   kernel/rcu/tasks.h:1405:15: sparse: sparse: cast from non-scalar
   kernel/rcu/tasks.h:1883:5: sparse: sparse: symbol 'rcu_tasks_trace_lazy_ms' was not declared. Should it be static?
   kernel/rcu/update.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/rcu/update.c: note: in included file:
   kernel/rcu/tasks.h:1147:6: sparse: sparse: context imbalance in 'exit_tasks_rcu_finish' - unexpected unlock
   kernel/rcu/update.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/rcu/tiny.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/rcu/refscale.c:646:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/rcu/refscale.c:646:24: sparse:    struct refscale_typesafe [noderef] __rcu *
   kernel/rcu/refscale.c:646:24: sparse:    struct refscale_typesafe *
   kernel/rcu/refscale.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/rcu/refscale.c:601:13: sparse: sparse: context imbalance in 'typesafe_lock_acquire' - wrong count at exit
   kernel/rcu/refscale.c:608:13: sparse: sparse: context imbalance in 'typesafe_lock_release' - unexpected unlock
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/rcu/rcuscale.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/rcu/rcutorture.c:403:12: sparse: sparse: context imbalance in 'rcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c:445:13: sparse: sparse: context imbalance in 'rcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:629:12: sparse: sparse: context imbalance in 'srcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:301:9: sparse: sparse: context imbalance in 'srcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/rcu/rcutorture.c:1845:9: sparse: sparse: context imbalance in 'rcutorture_one_extend' - different lock contexts for basic block
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:285:9: sparse: sparse: context imbalance in 'rcu_torture_init_srcu_lockdep' - unexpected unlock
--
   kernel/entry/syscall_user_dispatch.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:522:24: sparse: sparse: dereference of noderef expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/time/timer.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/time/hrtimer.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/time/posix-stubs.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/time/tick-sched.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/futex/core.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/futex/syscalls.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/futex/waitwake.c: note: in included file (through include/linux/sched.h, include/linux/sched/task.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/futex/waitwake.c:262:33: sparse: sparse: context imbalance in 'futex_wake_op' - different lock contexts for basic block
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/futex/waitwake.c:328:6: sparse: sparse: context imbalance in 'futex_wait_queue' - unexpected unlock
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/futex/waitwake.c:449:36: sparse: sparse: context imbalance in 'futex_wait_multiple_setup' - unexpected unlock
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/futex/pi.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/futex/pi.c:675:9: sparse: sparse: context imbalance in 'wake_futex_pi' - unexpected unlock
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/futex/pi.c:803:9: sparse: sparse: context imbalance in '__fixup_pi_state_owner' - unexpected unlock
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/futex/pi.c:1068:9: sparse: sparse: context imbalance in 'futex_lock_pi' - unexpected unlock
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/futex/pi.c:1100:5: sparse: sparse: context imbalance in 'futex_unlock_pi' - different lock contexts for basic block
--
   kernel/futex/requeue.c:455:41: sparse: sparse: context imbalance in 'futex_requeue' - different lock contexts for basic block
   kernel/futex/requeue.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/irqflags.h, include/linux/irqflags.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/cgroup/rstat.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, kernel/cgroup/cgroup-internal.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/cgroup/namespace.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, kernel/cgroup/cgroup-internal.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/cgroup/cgroup-v1.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, kernel/cgroup/cgroup-internal.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/cgroup/cgroup-v1.c:489:16: sparse: sparse: context imbalance in '__cgroup1_procs_write' - wrong count at exit
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/cgroup/pids.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/cgroup/rdma.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/cgroup/freezer.c:143:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/freezer.c:143:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/freezer.c:143:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/freezer.c:146:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/freezer.c:146:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/freezer.c:146:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/freezer.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/cgroup/freezer.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:750:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:750:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:750:37: sparse:     got struct spinlock [noderef] __rcu *
--
   kernel/cgroup/debug.c:133:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cgroup/debug.c:133:21: sparse:    struct css_set [noderef] __rcu *
   kernel/cgroup/debug.c:133:21: sparse:    struct css_set *
   kernel/cgroup/debug.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/cgroup/cgroup.c:6618:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/cgroup.c:6618:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/cgroup.c:6618:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/cgroup.c:6621:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/cgroup.c:6621:43: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/cgroup.c:6621:43: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/cgroup.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, kernel/cgroup/cgroup-internal.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/cgroup/cgroup.c:3063:9: sparse: sparse: context imbalance in 'cgroup_lock_and_drain_offline' - wrong count at exit
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/cgroup/cgroup.c:6385:12: sparse: sparse: context imbalance in 'cgroup_css_set_fork' - wrong count at exit
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/cgroup/cgroup.c:6501:9: sparse: sparse: context imbalance in 'cgroup_css_set_put_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6521:5: sparse: sparse: context imbalance in 'cgroup_can_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6570:9: sparse: sparse: context imbalance in 'cgroup_cancel_fork' - unexpected unlock
--
   kernel/trace/ring_buffer.c:1126:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   kernel/trace/ring_buffer.c:1126:32: sparse:     expected restricted __poll_t
   kernel/trace/ring_buffer.c:1126:32: sparse:     got int
   kernel/trace/ring_buffer.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/trace/ring_buffer.c:4980:9: sparse: sparse: context imbalance in 'ring_buffer_peek' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5066:9: sparse: sparse: context imbalance in 'ring_buffer_consume' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5445:17: sparse: sparse: context imbalance in 'ring_buffer_empty' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5475:9: sparse: sparse: context imbalance in 'ring_buffer_empty_cpu' - different lock contexts for basic block
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/ring_buffer_benchmark.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_event_perf.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_sched_wakeup.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_sched_switch.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/ftrace.c:124:59: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@     got struct ftrace_ops * @@
   kernel/trace/ftrace.c:124:59: sparse:     expected struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:124:59: sparse:     got struct ftrace_ops *
   kernel/trace/ftrace.c:230:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:230:49: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:230:49: sparse:     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:313:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops [noderef] __rcu * @@     got struct ftrace_ops * @@
   kernel/trace/ftrace.c:313:23: sparse:     expected struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:313:23: sparse:     got struct ftrace_ops *
   kernel/trace/ftrace.c:317:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] __rcu **list @@
   kernel/trace/ftrace.c:317:16: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:317:16: sparse:     got struct ftrace_ops [noderef] __rcu **list
   kernel/trace/ftrace.c:317:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] __rcu ** @@
   kernel/trace/ftrace.c:317:50: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:317:50: sparse:     got struct ftrace_ops [noderef] __rcu **
   kernel/trace/ftrace.c:324:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops * @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:324:12: sparse:     expected struct ftrace_ops *
   kernel/trace/ftrace.c:324:12: sparse:     got struct ftrace_ops [noderef] __rcu *next
   kernel/trace/ftrace.c:1066:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1066:43: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1066:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1067:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1067:43: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1067:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1289:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1289:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1289:40: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1290:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1290:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1290:40: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:2067:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *old_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2067:54: sparse:     expected struct ftrace_hash *old_hash
   kernel/trace/ftrace.c:2067:54: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1473:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:1473:9: sparse:    struct ftrace_hash [noderef] __rcu *
   kernel/trace/ftrace.c:1473:9: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:1489:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1490:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1491:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1492:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1664:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:1665:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:1725:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1726:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *other_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1731:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1732:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *other_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2045:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2056:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3417:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3434:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4080:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:4083:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4508:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:4510:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:4883:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5027:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5033:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:5307:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5309:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5424:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5488:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5540:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5903:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5911:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6655:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6656:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6660:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:6678:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:6678:66: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:6730:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6731:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7111:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7112:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7155:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:7155:36: sparse:    struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:7155:36: sparse:    struct ftrace_ops *
   kernel/trace/ftrace.c:7928:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7928:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7928:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:7977:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7977:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:7977:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:228:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:228:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:228:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3213:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3213:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3213:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3214:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3214:49: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3214:49: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_stack.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_functions.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_events.c:1011:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events.c:1011:31: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events.c:1011:31: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_kprobe.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_events_user.c:2050:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:2050:16: sparse:    struct user_event_refs [noderef] __rcu *
   kernel/trace/trace_events_user.c:2050:16: sparse:    struct user_event_refs *
   kernel/trace/trace_events_user.c:2159:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:2159:16: sparse:    struct user_event_refs [noderef] __rcu *
   kernel/trace/trace_events_user.c:2159:16: sparse:    struct user_event_refs *
   kernel/trace/trace_events_user.c:2184:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:2184:9: sparse:    struct user_event_refs [noderef] __rcu *
   kernel/trace/trace_events_user.c:2184:9: sparse:    struct user_event_refs *
   kernel/trace/trace_events_user.c: note: in included file (through include/linux/mutex.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_osnoise.c: note: in included file (through include/linux/sched.h, include/linux/kthread.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_eprobe.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/rethook.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_benchmark.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_events_filter.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/trace/trace_events_filter.c:1253:20: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct event_filter * @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1253:20: sparse:     expected struct event_filter *
   kernel/trace/trace_events_filter.c:1253:20: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1323:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1323:34: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events_filter.c:1323:34: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1340:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1340:27: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events_filter.c:1340:27: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1253:20: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct event_filter * @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1253:20: sparse:     expected struct event_filter *
   kernel/trace/trace_events_filter.c:1253:20: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1253:20: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct event_filter * @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1253:20: sparse:     expected struct event_filter *
   kernel/trace/trace_events_filter.c:1253:20: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events_filter.c:1253:20: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct event_filter * @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events_filter.c:1253:20: sparse:     expected struct event_filter *
   kernel/trace/trace_events_filter.c:1253:20: sparse:     got struct event_filter [noderef] __rcu *filter
--
   kernel/trace/trace.c:5868:1: sparse: sparse: trying to concatenate 11711-character string (8191 bytes max)
   kernel/trace/trace.c:446:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:446:28: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:446:28: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:460:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:460:33: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:460:33: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:2959:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace.c:2959:38: sparse:     expected struct event_filter *filter
   kernel/trace/trace.c:2959:38: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace.c:400:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:400:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:400:9: sparse:    struct trace_export *
   kernel/trace/trace.c:415:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:415:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:415:9: sparse:    struct trace_export *
   kernel/trace/trace.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/trace/trace_events_hist.c: note: in included file (through arch/x86/include/asm/nospec-branch.h, arch/x86/include/asm/paravirt_types.h, arch/x86/include/asm/ptrace.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/events/callchain.c:66:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/callchain.c:66:9: sparse:    struct callchain_cpus_entries [noderef] __rcu *
   kernel/events/callchain.c:66:9: sparse:    struct callchain_cpus_entries *
   kernel/events/callchain.c:96:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/callchain.c:96:9: sparse:    struct callchain_cpus_entries [noderef] __rcu *
   kernel/events/callchain.c:96:9: sparse:    struct callchain_cpus_entries *
   kernel/events/callchain.c:161:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/callchain.c:161:19: sparse:    struct callchain_cpus_entries [noderef] __rcu *
   kernel/events/callchain.c:161:19: sparse:    struct callchain_cpus_entries *
   kernel/events/callchain.c: note: in included file (through include/linux/sched.h, include/linux/ptrace.h, include/uapi/asm-generic/bpf_perf_event.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/events/hw_breakpoint_test.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/events/hw_breakpoint.c: note: in included file (through include/linux/sched.h, include/linux/ptrace.h, include/uapi/asm-generic/bpf_perf_event.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
--
   kernel/events/core.c:1375:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1375:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1375:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1388:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1388:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1388:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3460:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3460:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3460:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3464:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3464:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3464:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3465:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3465:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3465:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3514:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3515:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3515:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3515:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3914:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3914:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3914:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4306:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4306:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4306:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4785:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4785:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4785:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6165:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6165:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6165:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5637:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:5881:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5881:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5881:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6005:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6005:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6005:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6038:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6038:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6038:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6095:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6095:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6095:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6186:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6186:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6186:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6202:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6202:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6202:14: sparse:    struct perf_buffer *
   kernel/events/core.c:7942:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7942:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:7942:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8029:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8029:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8029:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8133:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8133:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8133:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8135:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8135:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8135:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8823:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8823:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8823:15: sparse:    struct perf_event_context *
   kernel/events/core.c:9863:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9863:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9863:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:9902:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9902:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9902:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10176:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10176:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10176:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11289:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:13030:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13030:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13030:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13124:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13124:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13124:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13136:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13136:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13136:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13557:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13557:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13557:17: sparse:    struct swevent_hlist *
   kernel/events/core.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/events/core.c:162:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:170:17: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1422:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/events/core.c:2775:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/events/core.c:4759:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:209:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/core.c: note: in included file (through arch/x86/include/asm/preempt.h, include/linux/preempt.h, include/linux/spinlock.h, ...):
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/events/core.c:7505:32: sparse: sparse: context imbalance in 'perf_get_pgtable_size' - unexpected unlock
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
>> arch/x86/include/asm/current.h:46:24: sparse: sparse: dereference of noderef expression
   kernel/events/core.c:9712:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9712:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9712:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9732:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9732:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9732:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9852:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9852:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9852:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9852:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9852:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9852:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9852:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9852:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9852:16: sparse:    struct swevent_hlist *

vim +46 arch/x86/include/asm/current.h

f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  38  
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  39  /* const-qualified alias to pcpu_hot, aliased by linker. */
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  40  DECLARE_PER_CPU_ALIGNED(const struct pcpu_hot __percpu_seg_override,
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  41  			const_pcpu_hot);
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  42  
f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  43  static __always_inline struct task_struct *get_current(void)
f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  44  {
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  45  	if (IS_ENABLED(CONFIG_USE_X86_SEG_SUPPORT))
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20 @46  		return const_pcpu_hot.current_task;
ed2f752e0e0a21 arch/x86/include/asm/current.h Uros Bizjak       2023-10-20  47  
e57ef2ed97c1d0 arch/x86/include/asm/current.h Thomas Gleixner   2022-09-15  48  	return this_cpu_read_stable(pcpu_hot.current_task);
f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  49  }
f0766440dda7ac include/asm-x86/current.h      Christoph Lameter 2008-05-09  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
