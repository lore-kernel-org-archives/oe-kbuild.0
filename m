Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3318195C1
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jan 2023 19:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673035029; x=1704571029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfooJbyHU3VDC3zRk0bqm2vXUN0m9Si/agT9jpi9xKI=;
  b=OZYaKMpRfvOdNBfFJY8W7aCyQ3Fx1BvLht82vISVYAWUetvKNUEfr5P0
   6lsf/faK7JdNeIvLouPBFIm34yAlrMcplEDNC5g2AZ74YwcRyO8Wa5AlD
   k1ygu+UX7GgLfvXQozjCFOjLpjHgfi+HVr0ig7ghDTB7qwZk7XYzcv/OI
   Qdh2mFJyEWsBrhCbTv9JejMdyaaQjuBTz4rtC1INdUKpITyVt0Kysw4HJ
   lWfGzlaRou87sMomBCO6Ge2wQcSKpRTPDFUlozHR0cnPzaaNMpsnquN0Z
   0S9R4lUEwhRtpYS5X+qNztD9wxSkPpioD81xgPDiXvztoQPb6c5tNW07n
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="310339379"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="310339379"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 11:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10582"; a="901385880"
X-IronPort-AV: E=Sophos;i="5.96,306,1665471600"; 
   d="scan'208";a="901385880"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 06 Jan 2023 11:57:05 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDspt-0003qO-0Q;
	Fri, 06 Jan 2023 19:57:05 +0000
Date: Sat, 7 Jan 2023 03:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/hwmon/nct6775-platform.c:242 superio_exit() warn: ignoring
 unreachable code.
Message-ID: <202301070337.Ujpxh5cr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zaJadf9zxTCFK5OM"
Content-Disposition: inline


--zaJadf9zxTCFK5OM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Zev Weiss <zev@bewilderbeest.net>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f5abbd77e2c1787e74b7c2caffac97def78ba52
commit: c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd hwmon: (nct6775) Split core and platform driver
date:   8 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 months ago
config: parisc-randconfig-m031-20230105
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/hwmon/nct6775-platform.c:242 superio_exit() warn: ignoring unreachable code.
drivers/hwmon/nct6775-platform.c:320 nct6775_reg_read() warn: ignoring unreachable code.
drivers/hwmon/nct6775-platform.c:308 nct6775_set_bank() warn: ignoring unreachable code.
drivers/hwmon/nct6775-platform.c:336 nct6775_reg_write() warn: ignoring unreachable code.

vim +242 drivers/hwmon/nct6775-platform.c

c3963bc0a0cf9e Zev Weiss 2022-04-26  234  
c3963bc0a0cf9e Zev Weiss 2022-04-26  235  static void superio_exit(struct nct6775_sio_data *sio_data)
c3963bc0a0cf9e Zev Weiss 2022-04-26  236  {
c3963bc0a0cf9e Zev Weiss 2022-04-26  237  	int ioreg = sio_data->sioreg;
c3963bc0a0cf9e Zev Weiss 2022-04-26  238  
c3963bc0a0cf9e Zev Weiss 2022-04-26  239  	outb(0xaa, ioreg);
c3963bc0a0cf9e Zev Weiss 2022-04-26  240  	outb(0x02, ioreg);
c3963bc0a0cf9e Zev Weiss 2022-04-26  241  	outb(0x02, ioreg + 1);
c3963bc0a0cf9e Zev Weiss 2022-04-26 @242  	release_region(ioreg, 2);
c3963bc0a0cf9e Zev Weiss 2022-04-26  243  }
c3963bc0a0cf9e Zev Weiss 2022-04-26  244  
c3963bc0a0cf9e Zev Weiss 2022-04-26  245  static inline void nct6775_wmi_set_bank(struct nct6775_data *data, u16 reg)
c3963bc0a0cf9e Zev Weiss 2022-04-26  246  {
c3963bc0a0cf9e Zev Weiss 2022-04-26  247  	u8 bank = reg >> 8;
c3963bc0a0cf9e Zev Weiss 2022-04-26  248  
c3963bc0a0cf9e Zev Weiss 2022-04-26  249  	data->bank = bank;
c3963bc0a0cf9e Zev Weiss 2022-04-26  250  }
c3963bc0a0cf9e Zev Weiss 2022-04-26  251  
c3963bc0a0cf9e Zev Weiss 2022-04-26  252  static int nct6775_wmi_reg_read(void *ctx, unsigned int reg, unsigned int *val)
c3963bc0a0cf9e Zev Weiss 2022-04-26  253  {
c3963bc0a0cf9e Zev Weiss 2022-04-26  254  	struct nct6775_data *data = ctx;
c3963bc0a0cf9e Zev Weiss 2022-04-26  255  	int err, word_sized = nct6775_reg_is_word_sized(data, reg);
c3963bc0a0cf9e Zev Weiss 2022-04-26  256  	u8 tmp = 0;
c3963bc0a0cf9e Zev Weiss 2022-04-26  257  	u16 res;
c3963bc0a0cf9e Zev Weiss 2022-04-26  258  
c3963bc0a0cf9e Zev Weiss 2022-04-26  259  	nct6775_wmi_set_bank(data, reg);
c3963bc0a0cf9e Zev Weiss 2022-04-26  260  
c3963bc0a0cf9e Zev Weiss 2022-04-26  261  	err = nct6775_asuswmi_read(data->bank, reg & 0xff, &tmp);
c3963bc0a0cf9e Zev Weiss 2022-04-26  262  	if (err)
c3963bc0a0cf9e Zev Weiss 2022-04-26  263  		return err;
c3963bc0a0cf9e Zev Weiss 2022-04-26  264  
c3963bc0a0cf9e Zev Weiss 2022-04-26  265  	res = tmp;
c3963bc0a0cf9e Zev Weiss 2022-04-26  266  	if (word_sized) {
c3963bc0a0cf9e Zev Weiss 2022-04-26  267  		err = nct6775_asuswmi_read(data->bank, (reg & 0xff) + 1, &tmp);
c3963bc0a0cf9e Zev Weiss 2022-04-26  268  		if (err)
c3963bc0a0cf9e Zev Weiss 2022-04-26  269  			return err;
c3963bc0a0cf9e Zev Weiss 2022-04-26  270  
c3963bc0a0cf9e Zev Weiss 2022-04-26  271  		res = (res << 8) + tmp;
c3963bc0a0cf9e Zev Weiss 2022-04-26  272  	}
c3963bc0a0cf9e Zev Weiss 2022-04-26  273  	*val = res;
c3963bc0a0cf9e Zev Weiss 2022-04-26  274  	return 0;
c3963bc0a0cf9e Zev Weiss 2022-04-26  275  }
c3963bc0a0cf9e Zev Weiss 2022-04-26  276  
c3963bc0a0cf9e Zev Weiss 2022-04-26  277  static int nct6775_wmi_reg_write(void *ctx, unsigned int reg, unsigned int value)
c3963bc0a0cf9e Zev Weiss 2022-04-26  278  {
c3963bc0a0cf9e Zev Weiss 2022-04-26  279  	struct nct6775_data *data = ctx;
c3963bc0a0cf9e Zev Weiss 2022-04-26  280  	int res, word_sized = nct6775_reg_is_word_sized(data, reg);
c3963bc0a0cf9e Zev Weiss 2022-04-26  281  
c3963bc0a0cf9e Zev Weiss 2022-04-26  282  	nct6775_wmi_set_bank(data, reg);
c3963bc0a0cf9e Zev Weiss 2022-04-26  283  
c3963bc0a0cf9e Zev Weiss 2022-04-26  284  	if (word_sized) {
c3963bc0a0cf9e Zev Weiss 2022-04-26  285  		res = nct6775_asuswmi_write(data->bank, reg & 0xff, value >> 8);
c3963bc0a0cf9e Zev Weiss 2022-04-26  286  		if (res)
c3963bc0a0cf9e Zev Weiss 2022-04-26  287  			return res;
c3963bc0a0cf9e Zev Weiss 2022-04-26  288  
c3963bc0a0cf9e Zev Weiss 2022-04-26  289  		res = nct6775_asuswmi_write(data->bank, (reg & 0xff) + 1, value);
c3963bc0a0cf9e Zev Weiss 2022-04-26  290  	} else {
c3963bc0a0cf9e Zev Weiss 2022-04-26  291  		res = nct6775_asuswmi_write(data->bank, reg & 0xff, value);
c3963bc0a0cf9e Zev Weiss 2022-04-26  292  	}
c3963bc0a0cf9e Zev Weiss 2022-04-26  293  
c3963bc0a0cf9e Zev Weiss 2022-04-26  294  	return res;
c3963bc0a0cf9e Zev Weiss 2022-04-26  295  }
c3963bc0a0cf9e Zev Weiss 2022-04-26  296  
c3963bc0a0cf9e Zev Weiss 2022-04-26  297  /*
c3963bc0a0cf9e Zev Weiss 2022-04-26  298   * On older chips, only registers 0x50-0x5f are banked.
c3963bc0a0cf9e Zev Weiss 2022-04-26  299   * On more recent chips, all registers are banked.
c3963bc0a0cf9e Zev Weiss 2022-04-26  300   * Assume that is the case and set the bank number for each access.
c3963bc0a0cf9e Zev Weiss 2022-04-26  301   * Cache the bank number so it only needs to be set if it changes.
c3963bc0a0cf9e Zev Weiss 2022-04-26  302   */
c3963bc0a0cf9e Zev Weiss 2022-04-26  303  static inline void nct6775_set_bank(struct nct6775_data *data, u16 reg)
c3963bc0a0cf9e Zev Weiss 2022-04-26  304  {
c3963bc0a0cf9e Zev Weiss 2022-04-26  305  	u8 bank = reg >> 8;
c3963bc0a0cf9e Zev Weiss 2022-04-26  306  
c3963bc0a0cf9e Zev Weiss 2022-04-26  307  	if (data->bank != bank) {
c3963bc0a0cf9e Zev Weiss 2022-04-26 @308  		outb_p(NCT6775_REG_BANK, data->addr + ADDR_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  309  		outb_p(bank, data->addr + DATA_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  310  		data->bank = bank;
c3963bc0a0cf9e Zev Weiss 2022-04-26  311  	}
c3963bc0a0cf9e Zev Weiss 2022-04-26  312  }
c3963bc0a0cf9e Zev Weiss 2022-04-26  313  
c3963bc0a0cf9e Zev Weiss 2022-04-26  314  static int nct6775_reg_read(void *ctx, unsigned int reg, unsigned int *val)
c3963bc0a0cf9e Zev Weiss 2022-04-26  315  {
c3963bc0a0cf9e Zev Weiss 2022-04-26  316  	struct nct6775_data *data = ctx;
c3963bc0a0cf9e Zev Weiss 2022-04-26  317  	int word_sized = nct6775_reg_is_word_sized(data, reg);
c3963bc0a0cf9e Zev Weiss 2022-04-26  318  
c3963bc0a0cf9e Zev Weiss 2022-04-26  319  	nct6775_set_bank(data, reg);
c3963bc0a0cf9e Zev Weiss 2022-04-26 @320  	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  321  	*val = inb_p(data->addr + DATA_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  322  	if (word_sized) {
c3963bc0a0cf9e Zev Weiss 2022-04-26  323  		outb_p((reg & 0xff) + 1,
c3963bc0a0cf9e Zev Weiss 2022-04-26  324  		       data->addr + ADDR_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  325  		*val = (*val << 8) + inb_p(data->addr + DATA_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  326  	}
c3963bc0a0cf9e Zev Weiss 2022-04-26  327  	return 0;
c3963bc0a0cf9e Zev Weiss 2022-04-26  328  }
c3963bc0a0cf9e Zev Weiss 2022-04-26  329  
c3963bc0a0cf9e Zev Weiss 2022-04-26  330  static int nct6775_reg_write(void *ctx, unsigned int reg, unsigned int value)
c3963bc0a0cf9e Zev Weiss 2022-04-26  331  {
c3963bc0a0cf9e Zev Weiss 2022-04-26  332  	struct nct6775_data *data = ctx;
c3963bc0a0cf9e Zev Weiss 2022-04-26  333  	int word_sized = nct6775_reg_is_word_sized(data, reg);
c3963bc0a0cf9e Zev Weiss 2022-04-26  334  
c3963bc0a0cf9e Zev Weiss 2022-04-26  335  	nct6775_set_bank(data, reg);
c3963bc0a0cf9e Zev Weiss 2022-04-26 @336  	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  337  	if (word_sized) {
c3963bc0a0cf9e Zev Weiss 2022-04-26  338  		outb_p(value >> 8, data->addr + DATA_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  339  		outb_p((reg & 0xff) + 1,
c3963bc0a0cf9e Zev Weiss 2022-04-26  340  		       data->addr + ADDR_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  341  	}
c3963bc0a0cf9e Zev Weiss 2022-04-26  342  	outb_p(value & 0xff, data->addr + DATA_REG_OFFSET);
c3963bc0a0cf9e Zev Weiss 2022-04-26  343  	return 0;
c3963bc0a0cf9e Zev Weiss 2022-04-26  344  }
c3963bc0a0cf9e Zev Weiss 2022-04-26  345  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

--zaJadf9zxTCFK5OM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/parisc 5.18.0-rc7 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="hppa-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
CONFIG_KERNEL_XZ=y
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_LEGACY_TIMER_TICK=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_BOOST=y
CONFIG_RCU_BOOST_DELAY=500
CONFIG_RCU_NOCB_CPU=y
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=m
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
# CONFIG_CGROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
# CONFIG_RD_XZ is not set
# CONFIG_RD_LZO is not set
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
# CONFIG_SHMEM is not set
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
# CONFIG_KALLSYMS is not set
# CONFIG_USERFAULTFD is not set
CONFIG_KCMP=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
# CONFIG_SLAB_MERGE_DEFAULT is not set
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_PROFILING=y
# end of General setup

CONFIG_PARISC=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_MMU=y
CONFIG_STACK_GROWSUP=y
CONFIG_GENERIC_LOCKBREAK=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_TIME_LOW_RES=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_PGTABLE_LEVELS=2

#
# Processor type and features
#
# CONFIG_PA7000 is not set
# CONFIG_PA7100LC is not set
# CONFIG_PA7200 is not set
CONFIG_PA7300LC=y
# CONFIG_PA8X00 is not set
CONFIG_PA11=y
CONFIG_PARISC_HUGE_KERNEL=y
CONFIG_PARISC_PAGE_SIZE_4KB=y
CONFIG_SMP=y
# CONFIG_IRQSTACKS is not set
# CONFIG_TLB_PTLOCK is not set
CONFIG_HOTPLUG_CPU=y
CONFIG_ARCH_FLATMEM_ENABLE=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
CONFIG_HZ_300=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=300
CONFIG_AUDIT_ARCH=y
CONFIG_NR_CPUS=32
# CONFIG_KEXEC is not set
# CONFIG_KEXEC_FILE is not set
# end of Processor type and features

#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
#
# CONFIG_GSC is not set
# end of Bus options (PCI, PCMCIA, EISA, GSC, ISA)

#
# PA-RISC specific drivers
#
CONFIG_CHASSIS_LCD_LED=y
CONFIG_PDC_CHASSIS=y
# CONFIG_PDC_STABLE is not set
# end of PA-RISC specific drivers

#
# General architecture-dependent options
#
# CONFIG_KPROBES is not set
# CONFIG_JUMP_LABEL is not set
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_ALTERNATE_USER_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_HAVE_ARCH_HASH=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_CPU_NO_EFFICIENT_FFS=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
# CONFIG_LOCK_EVENT_COUNTS is not set

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
# end of GCOV-based kernel profiling
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_INIT_ALL_POSSIBLE=y
# CONFIG_BLOCK is not set
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_FREEZER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_BINFMT_SCRIPT=m
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_FLATMEM=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=999999
CONFIG_COMPACTION=y
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_VIRT_TO_BUS=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=7
# CONFIG_ZPOOL is not set
# CONFIG_ZSMALLOC is not set
CONFIG_STACK_MAX_DEFAULT_SIZE_MB=100
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
# CONFIG_PCI is not set
CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set

#
# PC-card bridges
#

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_DEVTMPFS_SAFE is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
# CONFIG_FW_LOADER_COMPRESS is not set
# end of Firmware loader

# CONFIG_ALLOW_DEV_COREDUMP is not set
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
CONFIG_GENERIC_ARCH_TOPOLOGY=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
# CONFIG_MOXTET is not set
# CONFIG_INTEL_IXP4XX_EB is not set
CONFIG_QCOM_EBI2=y
# CONFIG_MHI_BUS is not set
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=y
# end of ARM System Control and Management Interface Protocol

# CONFIG_ARM_SCPI_PROTOCOL is not set
CONFIG_ARM_SCPI_POWER_DOMAIN=y
# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_FW_CFG_SYSFS is not set
# CONFIG_TURRIS_MOX_RWTM is not set
# CONFIG_BCM47XX_NVRAM is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
CONFIG_MTD=m
# CONFIG_MTD_TESTS is not set

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
# CONFIG_MTD_BCM63XX_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=m
CONFIG_MTD_OF_PARTS=m
# CONFIG_MTD_OF_PARTS_BCM4908 is not set
# CONFIG_MTD_OF_PARTS_LINKSYS_NS is not set
# CONFIG_MTD_PARSER_IMAGETAG is not set
# CONFIG_MTD_PARSER_TRX is not set
# CONFIG_MTD_SHARPSL_PARTS is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_OOPS=m
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=m
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
# CONFIG_MTD_RAM is not set
CONFIG_MTD_ROM=m
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_SC520CDP=m
CONFIG_MTD_NETSC520=m
CONFIG_MTD_TS5500=m
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_DATAFLASH=m
CONFIG_MTD_DATAFLASH_WRITE_VERIFY=y
# CONFIG_MTD_DATAFLASH_OTP is not set
# CONFIG_MTD_MCHP23K256 is not set
# CONFIG_MTD_MCHP48L640 is not set
CONFIG_MTD_SPEAR_SMI=m
CONFIG_MTD_SST25L=m
CONFIG_MTD_SLRAM=m
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
# CONFIG_MTD_ONENAND is not set
# CONFIG_MTD_RAW_NAND is not set
# CONFIG_MTD_SPI_NAND is not set

#
# ECC engine support
#
# CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_SPI_NOR=m
# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
# CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE=y
# CONFIG_MTD_SPI_NOR_SWP_KEEP is not set
CONFIG_SPI_ASPEED_SMC=m
# CONFIG_SPI_HISI_SFC is not set
CONFIG_SPI_NXP_SPIFI=m
# CONFIG_MTD_UBI is not set
# CONFIG_MTD_HYPERBUS is not set
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_KOBJ=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
# CONFIG_OF_OVERLAY is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
# CONFIG_AD525X_DPOT_SPI is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_ICS932S401 is not set
CONFIG_ATMEL_SSC=m
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_GEHC_ACHC is not set
# CONFIG_HI6421V600_IRQ is not set
CONFIG_QCOM_COINCELL=y
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=m
# CONFIG_SENSORS_APDS990X is not set
CONFIG_HMC6352=y
CONFIG_DS1682=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
CONFIG_SRAM=y
# CONFIG_XILINX_SDFEC is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=m
CONFIG_EEPROM_93XX46=y
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

CONFIG_ALTERA_STAPL=m
CONFIG_ECHO=m
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# end of SCSI device support

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
# CONFIG_INPUT is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
# CONFIG_SERIO_APBPS2 is not set
CONFIG_SERIO_OLPC_APSP=y
CONFIG_SERIO_SUN4I_PS2=y
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=m
CONFIG_GAMEPORT_NS558=m
# CONFIG_GAMEPORT_L4 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
# CONFIG_UNIX98_PTYS is not set
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=m
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_MEN_MCB=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
CONFIG_SERIAL_8250_ASPEED_VUART=m
# CONFIG_SERIAL_8250_SHARE_IRQ is not set
CONFIG_SERIAL_8250_DETECT_IRQ=y
CONFIG_SERIAL_8250_RSA=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_IOC3 is not set
# CONFIG_SERIAL_8250_RT288X is not set
# CONFIG_SERIAL_8250_OMAP is not set
CONFIG_SERIAL_8250_LPC18XX=m
# CONFIG_SERIAL_8250_MT6577 is not set
# CONFIG_SERIAL_8250_UNIPHIER is not set
# CONFIG_SERIAL_8250_PXA is not set
CONFIG_SERIAL_8250_TEGRA=m
# CONFIG_SERIAL_8250_BCM7271 is not set
CONFIG_SERIAL_OF_PLATFORM=m

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
# CONFIG_SERIAL_ATMEL is not set
# CONFIG_SERIAL_MESON is not set
CONFIG_SERIAL_CLPS711X=y
# CONFIG_SERIAL_CLPS711X_CONSOLE is not set
# CONFIG_SERIAL_SAMSUNG is not set
# CONFIG_SERIAL_TEGRA is not set
# CONFIG_SERIAL_TEGRA_TCU is not set
CONFIG_SERIAL_MAX3100=m
# CONFIG_SERIAL_MAX310X is not set
CONFIG_SERIAL_IMX=y
CONFIG_SERIAL_IMX_CONSOLE=y
CONFIG_SERIAL_IMX_EARLYCON=y
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
# CONFIG_SERIAL_SH_SCI is not set
# CONFIG_SERIAL_HS_LPC32XX is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_MSM is not set
# CONFIG_SERIAL_VT8500 is not set
# CONFIG_SERIAL_OMAP is not set
# CONFIG_SERIAL_SIFIVE is not set
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
CONFIG_SERIAL_SC16IS7XX_CORE=y
CONFIG_SERIAL_SC16IS7XX=y
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
CONFIG_SERIAL_SC16IS7XX_SPI=y
CONFIG_SERIAL_TIMBERDALE=m
CONFIG_SERIAL_BCM63XX=y
# CONFIG_SERIAL_BCM63XX_CONSOLE is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
CONFIG_SERIAL_ALTERA_UART_CONSOLE=y
# CONFIG_SERIAL_MXS_AUART is not set
CONFIG_SERIAL_XILINX_PS_UART=m
# CONFIG_SERIAL_MPS2_UART is not set
# CONFIG_SERIAL_ARC is not set
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_MEN_Z135=m
# CONFIG_SERIAL_STM32 is not set
CONFIG_SERIAL_OWL=m
# CONFIG_SERIAL_RDA is not set
# CONFIG_SERIAL_MILBEAUT_USIO is not set
# CONFIG_SERIAL_LITEUART is not set
# CONFIG_SERIAL_SUNPLUS is not set
# end of Serial drivers

# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
# CONFIG_RPMSG_TTY is not set
CONFIG_SERIAL_DEV_BUS=m
CONFIG_TTY_PRINTK=m
CONFIG_TTY_PRINTK_LEVEL=6
CONFIG_VIRTIO_CONSOLE=m
# CONFIG_IPMI_HANDLER is not set
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
CONFIG_ASPEED_BT_IPMI_BMC=y
# CONFIG_IPMB_DEVICE_INTERFACE is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_DEVMEM is not set
CONFIG_TCG_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_SPI=y
# CONFIG_TCG_TIS_SPI_CR50 is not set
# CONFIG_TCG_TIS_SYNQUACER is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
CONFIG_TCG_ATMEL=m
CONFIG_TCG_VTPM_PROXY=m
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
CONFIG_TCG_TIS_ST33ZP24_SPI=m
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_OF is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
# CONFIG_I2C_MUX_GPMUX is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
CONFIG_I2C_MUX_PCA954x=m
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=m

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#
CONFIG_I2C_HIX5HD2=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
CONFIG_I2C_ASPEED=y
# CONFIG_I2C_AT91 is not set
CONFIG_I2C_AXXIA=y
CONFIG_I2C_BCM_IPROC=y
# CONFIG_I2C_BCM_KONA is not set
CONFIG_I2C_BRCMSTB=y
# CONFIG_I2C_CADENCE is not set
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DAVINCI is not set
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
# CONFIG_I2C_DIGICOLOR is not set
# CONFIG_I2C_EXYNOS5 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_HIGHLANDER is not set
# CONFIG_I2C_HISI is not set
CONFIG_I2C_IMG=m
# CONFIG_I2C_IMX is not set
CONFIG_I2C_IMX_LPI2C=m
# CONFIG_I2C_IOP3XX is not set
CONFIG_I2C_JZ4780=m
# CONFIG_I2C_KEMPLD is not set
CONFIG_I2C_LPC2K=y
CONFIG_I2C_MT65XX=y
# CONFIG_I2C_MT7621 is not set
# CONFIG_I2C_MV64XXX is not set
# CONFIG_I2C_MXS is not set
# CONFIG_I2C_NPCM7XX is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_PNX is not set
# CONFIG_I2C_PXA is not set
# CONFIG_I2C_QCOM_CCI is not set
CONFIG_I2C_QUP=y
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_S3C2410 is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_ST is not set
CONFIG_I2C_STM32F4=y
CONFIG_I2C_STM32F7=m
CONFIG_I2C_SUN6I_P2WI=m
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_TEGRA_BPMP is not set
CONFIG_I2C_UNIPHIER=y
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
# CONFIG_I2C_WMT is not set
# CONFIG_I2C_XILINX is not set
CONFIG_I2C_XLP9XX=m
CONFIG_I2C_RCAR=m

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_TAOS_EVM=y

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
# CONFIG_I2C_FSI is not set
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
CONFIG_SPI_DEBUG=y
CONFIG_SPI_MASTER=y
CONFIG_SPI_MEM=y

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_ALTERA_CORE is not set
# CONFIG_SPI_AR934X is not set
# CONFIG_SPI_ATH79 is not set
CONFIG_SPI_ARMADA_3700=y
CONFIG_SPI_ATMEL=y
# CONFIG_SPI_ATMEL_QUADSPI is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BCM2835AUX is not set
CONFIG_SPI_BCM63XX=m
# CONFIG_SPI_BCM63XX_HSSPI is not set
# CONFIG_SPI_BCM_QSPI is not set
CONFIG_SPI_BITBANG=m
CONFIG_SPI_CADENCE=y
CONFIG_SPI_CADENCE_QUADSPI=m
# CONFIG_SPI_CADENCE_XSPI is not set
CONFIG_SPI_CLPS711X=m
CONFIG_SPI_DESIGNWARE=m
# CONFIG_SPI_DW_DMA is not set
CONFIG_SPI_DW_MMIO=m
# CONFIG_SPI_DW_BT1 is not set
CONFIG_SPI_EP93XX=m
# CONFIG_SPI_FSI is not set
# CONFIG_SPI_FSL_LPSPI is not set
CONFIG_SPI_FSL_QUADSPI=m
# CONFIG_SPI_HISI_KUNPENG is not set
# CONFIG_SPI_HISI_SFC_V3XX is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
CONFIG_SPI_GPIO=m
CONFIG_SPI_IMG_SPFI=m
# CONFIG_SPI_IMX is not set
# CONFIG_SPI_INGENIC is not set
# CONFIG_SPI_INTEL_PLATFORM is not set
CONFIG_SPI_JCORE=y
# CONFIG_SPI_LP8841_RTC is not set
CONFIG_SPI_FSL_LIB=y
CONFIG_SPI_FSL_SPI=y
# CONFIG_SPI_FSL_DSPI is not set
CONFIG_SPI_MESON_SPIFC=m
CONFIG_SPI_MT65XX=m
# CONFIG_SPI_MT7621 is not set
# CONFIG_SPI_MTK_NOR is not set
# CONFIG_SPI_NPCM_FIU is not set
# CONFIG_SPI_NPCM_PSPI is not set
CONFIG_SPI_LANTIQ_SSC=m
CONFIG_SPI_OC_TINY=m
CONFIG_SPI_OMAP24XX=y
CONFIG_SPI_TI_QSPI=m
CONFIG_SPI_OMAP_100K=m
# CONFIG_SPI_ORION is not set
CONFIG_SPI_PIC32=y
# CONFIG_SPI_PIC32_SQI is not set
# CONFIG_SPI_PXA2XX is not set
CONFIG_SPI_ROCKCHIP=m
# CONFIG_SPI_ROCKCHIP_SFC is not set
CONFIG_SPI_RSPI=y
# CONFIG_SPI_QUP is not set
# CONFIG_SPI_S3C64XX is not set
CONFIG_SPI_SC18IS602=m
CONFIG_SPI_SH=y
CONFIG_SPI_SH_HSPI=y
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_SPRD is not set
# CONFIG_SPI_SPRD_ADI is not set
# CONFIG_SPI_STM32 is not set
# CONFIG_SPI_STM32_QSPI is not set
CONFIG_SPI_ST_SSC4=m
# CONFIG_SPI_SUN4I is not set
# CONFIG_SPI_SUN6I is not set
# CONFIG_SPI_SUNPLUS_SP7021 is not set
# CONFIG_SPI_SYNQUACER is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_TEGRA210_QUAD is not set
# CONFIG_SPI_TEGRA114 is not set
CONFIG_SPI_TEGRA20_SFLASH=m
CONFIG_SPI_TEGRA20_SLINK=y
# CONFIG_SPI_UNIPHIER is not set
CONFIG_SPI_XCOMM=m
CONFIG_SPI_XILINX=m
CONFIG_SPI_XLP=m
# CONFIG_SPI_XTENSA_XTFPGA is not set
# CONFIG_SPI_ZYNQ_QSPI is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPMI=m
# CONFIG_SPMI_HISI3670 is not set
# CONFIG_SPMI_MSM_PMIC_ARB is not set
# CONFIG_SPMI_MTK_PMIF is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
CONFIG_HSI_CHAR=y
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

# CONFIG_PINCTRL is not set
# CONFIG_GPIOLIB is not set
CONFIG_W1=m

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2482=m
CONFIG_W1_MASTER_MXC=m
# CONFIG_W1_MASTER_DS1WM is not set
# CONFIG_W1_MASTER_GPIO is not set
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
# CONFIG_W1_SLAVE_SMEM is not set
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=m
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
# CONFIG_W1_SLAVE_DS2433_CRC is not set
CONFIG_W1_SLAVE_DS2438=m
# CONFIG_W1_SLAVE_DS250X is not set
# CONFIG_W1_SLAVE_DS2780 is not set
# CONFIG_W1_SLAVE_DS2781 is not set
CONFIG_W1_SLAVE_DS28E04=m
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_WM831X_BACKUP is not set
# CONFIG_WM831X_POWER is not set
# CONFIG_WM8350_POWER is not set
# CONFIG_TEST_POWER is not set
CONFIG_BATTERY_88PM860X=m
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_ACT8945A=y
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2760 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=y
# CONFIG_CHARGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=m
CONFIG_BATTERY_BQ27XXX_I2C=m
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
# CONFIG_BATTERY_DA9030 is not set
CONFIG_BATTERY_DA9052=y
CONFIG_BATTERY_DA9150=m
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=m
CONFIG_BATTERY_MAX1721X=m
CONFIG_CHARGER_88PM860X=m
CONFIG_CHARGER_PCF50633=m
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
# CONFIG_CHARGER_MAX77976 is not set
CONFIG_CHARGER_QCOM_SMBB=y
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=y
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=y
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=y
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65217=m
CONFIG_BATTERY_GAUGE_LTC2941=m
CONFIG_BATTERY_GOLDFISH=y
# CONFIG_BATTERY_RT5033 is not set
CONFIG_CHARGER_RT9455=m
# CONFIG_CHARGER_SC2731 is not set
# CONFIG_CHARGER_UCS1002 is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_AD7314=y
CONFIG_SENSORS_AD7414=y
CONFIG_SENSORS_AD7418=m
# CONFIG_SENSORS_ADM1021 is not set
CONFIG_SENSORS_ADM1025=y
# CONFIG_SENSORS_ADM1026 is not set
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=y
# CONFIG_SENSORS_ADT7310 is not set
# CONFIG_SENSORS_ADT7410 is not set
CONFIG_SENSORS_ADT7411=y
CONFIG_SENSORS_ADT7462=y
# CONFIG_SENSORS_ADT7470 is not set
CONFIG_SENSORS_ADT7475=y
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_ASPEED is not set
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_BT1_PVT is not set
# CONFIG_SENSORS_DS620 is not set
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_DA9052_ADC is not set
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=y
CONFIG_SENSORS_MC13783_ADC=m
CONFIG_SENSORS_FTSTEUTATES=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=m
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=y
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=y
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LINEAGE=y
CONFIG_SENSORS_LTC2945=y
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=y
CONFIG_SENSORS_LTC4215=y
# CONFIG_SENSORS_LTC4222 is not set
# CONFIG_SENSORS_LTC4245 is not set
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=y
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
# CONFIG_SENSORS_MAX16065 is not set
# CONFIG_SENSORS_MAX1619 is not set
CONFIG_SENSORS_MAX1668=y
CONFIG_SENSORS_MAX197=y
CONFIG_SENSORS_MAX31722=y
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6642 is not set
# CONFIG_SENSORS_MAX6650 is not set
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=m
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MENF21BMC_HWMON is not set
# CONFIG_SENSORS_MR75203 is not set
CONFIG_SENSORS_ADCXX=y
CONFIG_SENSORS_LM63=m
CONFIG_SENSORS_LM70=m
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=y
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=y
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=y
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LM95234 is not set
# CONFIG_SENSORS_LM95241 is not set
# CONFIG_SENSORS_LM95245 is not set
CONFIG_SENSORS_PC87360=y
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775_CORE=y
CONFIG_SENSORS_NCT6775=y
CONFIG_SENSORS_NCT7802=y
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
CONFIG_SENSORS_PCF8591=y
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_IBM_CFFPS=m
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
CONFIG_SENSORS_IR35221=m
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LM25066_REGULATOR is not set
CONFIG_SENSORS_LTC2978=m
CONFIG_SENSORS_LTC2978_REGULATOR=y
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_UCD9000=m
# CONFIG_SENSORS_UCD9200 is not set
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_PWM_FAN=m
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
# CONFIG_SENSORS_SL28CPLD is not set
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SHT21 is not set
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
# CONFIG_SENSORS_SY7636A is not set
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
CONFIG_SENSORS_SCH56XX_COMMON=m
# CONFIG_SENSORS_SCH5627 is not set
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=y
CONFIG_SENSORS_ADC128D818=y
CONFIG_SENSORS_ADS7828=m
CONFIG_SENSORS_ADS7871=m
CONFIG_SENSORS_AMC6821=y
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=y
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
CONFIG_SENSORS_TC74=m
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=y
CONFIG_SENSORS_TMP103=y
# CONFIG_SENSORS_TMP108 is not set
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=y
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=y
# CONFIG_SENSORS_W83792D is not set
# CONFIG_SENSORS_W83793 is not set
CONFIG_SENSORS_W83795=m
CONFIG_SENSORS_W83795_FANCTRL=y
# CONFIG_SENSORS_W83L785TS is not set
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=m
# CONFIG_SENSORS_W83627EHF is not set
CONFIG_SENSORS_WM831X=m
CONFIG_SENSORS_WM8350=m
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
CONFIG_DA9052_WATCHDOG=y
CONFIG_DA9055_WATCHDOG=m
CONFIG_DA9063_WATCHDOG=y
CONFIG_DA9062_WATCHDOG=m
CONFIG_MENF21BMC_WATCHDOG=m
# CONFIG_MENZ069_WATCHDOG is not set
# CONFIG_WM831X_WATCHDOG is not set
CONFIG_WM8350_WATCHDOG=m
CONFIG_XILINX_WATCHDOG=y
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_SL28CPLD_WATCHDOG is not set
# CONFIG_ARMADA_37XX_WATCHDOG is not set
CONFIG_ASM9260_WATCHDOG=y
CONFIG_AT91RM9200_WATCHDOG=m
# CONFIG_AT91SAM9X_WATCHDOG is not set
# CONFIG_SAMA5D4_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_FTWDT010_WATCHDOG is not set
CONFIG_S3C2410_WATCHDOG=y
CONFIG_DW_WATCHDOG=y
CONFIG_EP93XX_WATCHDOG=m
CONFIG_OMAP_WATCHDOG=y
# CONFIG_PNX4008_WATCHDOG is not set
CONFIG_DAVINCI_WATCHDOG=m
# CONFIG_K3_RTI_WATCHDOG is not set
CONFIG_RN5T618_WATCHDOG=m
CONFIG_SUNXI_WATCHDOG=m
# CONFIG_NPCM7XX_WATCHDOG is not set
CONFIG_TWL4030_WATCHDOG=m
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
CONFIG_TS4800_WATCHDOG=m
CONFIG_TS72XX_WATCHDOG=y
CONFIG_MAX63XX_WATCHDOG=m
CONFIG_MAX77620_WATCHDOG=y
CONFIG_IMX2_WDT=m
# CONFIG_IMX7ULP_WDT is not set
CONFIG_RETU_WATCHDOG=m
CONFIG_MOXART_WDT=y
CONFIG_ST_LPC_WATCHDOG=y
# CONFIG_TEGRA_WATCHDOG is not set
CONFIG_QCOM_WDT=y
CONFIG_MESON_GXBB_WATCHDOG=m
CONFIG_MESON_WATCHDOG=y
CONFIG_MEDIATEK_WATCHDOG=y
# CONFIG_DIGICOLOR_WATCHDOG is not set
# CONFIG_LPC18XX_WATCHDOG is not set
CONFIG_RENESAS_WDT=m
CONFIG_RENESAS_RZAWDT=y
# CONFIG_RENESAS_RZG2LWDT is not set
CONFIG_ASPEED_WATCHDOG=y
# CONFIG_UNIPHIER_WATCHDOG is not set
# CONFIG_RTD119X_WATCHDOG is not set
# CONFIG_SPRD_WATCHDOG is not set
# CONFIG_VISCONTI_WATCHDOG is not set
# CONFIG_MSC313E_WATCHDOG is not set
# CONFIG_APPLE_WATCHDOG is not set
CONFIG_SC520_WDT=y
CONFIG_KEMPLD_WDT=m
# CONFIG_BCM47XX_WDT is not set
# CONFIG_BCM2835_WDT is not set
# CONFIG_BCM_KONA_WDT is not set
CONFIG_BCM7038_WDT=m
CONFIG_IMGPDC_WDT=y
# CONFIG_MPC5200_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_UML_WATCHDOG=m
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=m
# CONFIG_MFD_SUN4I_GPADC is not set
CONFIG_MFD_AS3711=y
CONFIG_MFD_AS3722=m
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_AT91_USART is not set
CONFIG_MFD_ATMEL_FLEXCOM=m
CONFIG_MFD_ATMEL_HLCDC=m
CONFIG_MFD_BCM590XX=m
CONFIG_MFD_BD9571MWV=y
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
CONFIG_PMIC_DA903X=y
CONFIG_PMIC_DA9052=y
CONFIG_MFD_DA9052_SPI=y
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=m
# CONFIG_MFD_ENE_KB3930 is not set
CONFIG_MFD_EXYNOS_LPASS=m
# CONFIG_MFD_GATEWORKS_GSC is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_SPI=y
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
CONFIG_MFD_MXS_LRADC=y
# CONFIG_MFD_MX25_TSADC is not set
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_MFD_HI6421_SPMI is not set
# CONFIG_MFD_HI655X_PMIC is not set
CONFIG_HTC_PASIC3=y
# CONFIG_MFD_IQS62X is not set
CONFIG_MFD_KEMPLD=y
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
# CONFIG_MFD_MAX14577 is not set
CONFIG_MFD_MAX77620=y
# CONFIG_MFD_MAX77650 is not set
CONFIG_MFD_MAX77686=y
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77714 is not set
CONFIG_MFD_MAX77843=y
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
# CONFIG_MFD_MT6360 is not set
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
# CONFIG_EZX_PCAP is not set
CONFIG_MFD_CPCAP=m
# CONFIG_MFD_NTXEC is not set
CONFIG_MFD_RETU=m
CONFIG_MFD_PCF50633=m
CONFIG_PCF50633_ADC=m
# CONFIG_PCF50633_GPIO is not set
# CONFIG_MFD_PM8XXX is not set
# CONFIG_MFD_SPMI_PMIC is not set
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=m
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_RK808 is not set
CONFIG_MFD_RN5T618=y
# CONFIG_MFD_SEC_CORE is not set
CONFIG_MFD_SI476X_CORE=m
# CONFIG_MFD_SIMPLE_MFD_I2C is not set
# CONFIG_MFD_SL28CPLD is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SKY81452=m
# CONFIG_MFD_SC27XX_PMIC is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=m
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
CONFIG_MFD_PALMAS=y
# CONFIG_TPS6105X is not set
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=m
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=m
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TI_LP87565=m
CONFIG_MFD_TPS65218=y
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_TPS65912_SPI=y
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
CONFIG_MFD_LM3533=m
CONFIG_MFD_TC3589X=y
# CONFIG_MFD_TQMX86 is not set
# CONFIG_MFD_LOCHNAGAR is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=m
CONFIG_MFD_ARIZONA_SPI=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
# CONFIG_MFD_WM5110 is not set
CONFIG_MFD_WM8997=y
CONFIG_MFD_WM8998=y
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM831X_SPI=y
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=m
CONFIG_MFD_STW481X=y
# CONFIG_MFD_ROHM_BD718XX is not set
# CONFIG_MFD_ROHM_BD71828 is not set
# CONFIG_MFD_ROHM_BD957XMUF is not set
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
# CONFIG_MFD_STPMIC1 is not set
# CONFIG_MFD_STMFX is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_KHADAS_MCU is not set
# CONFIG_MFD_ACER_A500_EC is not set
# CONFIG_MFD_QCOM_PM8008 is not set
# CONFIG_RAVE_SP_CORE is not set
# CONFIG_MFD_INTEL_M10_BMC is not set
# CONFIG_MFD_RSMU_I2C is not set
# CONFIG_MFD_RSMU_SPI is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
# CONFIG_REGULATOR_88PG86X is not set
# CONFIG_REGULATOR_88PM800 is not set
# CONFIG_REGULATOR_88PM8607 is not set
CONFIG_REGULATOR_ACT8865=y
# CONFIG_REGULATOR_ACT8945A is not set
CONFIG_REGULATOR_AD5398=m
# CONFIG_REGULATOR_ANATOP is not set
CONFIG_REGULATOR_AS3711=y
# CONFIG_REGULATOR_AS3722 is not set
CONFIG_REGULATOR_BCM590XX=m
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_CPCAP=m
CONFIG_REGULATOR_DA903X=m
CONFIG_REGULATOR_DA9052=m
CONFIG_REGULATOR_DA9063=m
# CONFIG_REGULATOR_DA9121 is not set
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=y
# CONFIG_REGULATOR_FAN53555 is not set
# CONFIG_REGULATOR_FAN53880 is not set
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
# CONFIG_REGULATOR_LP873X is not set
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP87565=m
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=m
CONFIG_REGULATOR_MAX1586=y
CONFIG_REGULATOR_MAX77620=y
# CONFIG_REGULATOR_MAX77650 is not set
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
# CONFIG_REGULATOR_MAX8893 is not set
# CONFIG_REGULATOR_MAX8907 is not set
CONFIG_REGULATOR_MAX8952=m
# CONFIG_REGULATOR_MAX8997 is not set
# CONFIG_REGULATOR_MAX8998 is not set
# CONFIG_REGULATOR_MAX20086 is not set
# CONFIG_REGULATOR_MAX77686 is not set
CONFIG_REGULATOR_MAX77693=y
CONFIG_REGULATOR_MAX77802=y
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MCP16502 is not set
# CONFIG_REGULATOR_MP5416 is not set
# CONFIG_REGULATOR_MP8859 is not set
# CONFIG_REGULATOR_MP886X is not set
# CONFIG_REGULATOR_MPQ7920 is not set
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6315 is not set
# CONFIG_REGULATOR_MT6323 is not set
# CONFIG_REGULATOR_MT6358 is not set
# CONFIG_REGULATOR_MT6359 is not set
# CONFIG_REGULATOR_MT6397 is not set
# CONFIG_REGULATOR_PALMAS is not set
CONFIG_REGULATOR_PBIAS=m
# CONFIG_REGULATOR_PCA9450 is not set
CONFIG_REGULATOR_PCF50633=m
# CONFIG_REGULATOR_PF8X00 is not set
CONFIG_REGULATOR_PFUZE100=y
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
# CONFIG_REGULATOR_PWM is not set
# CONFIG_REGULATOR_QCOM_RPMH is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RN5T618=m
# CONFIG_REGULATOR_RT4801 is not set
# CONFIG_REGULATOR_RT5033 is not set
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6245 is not set
# CONFIG_REGULATOR_RTQ2134 is not set
# CONFIG_REGULATOR_RTMV20 is not set
# CONFIG_REGULATOR_RTQ6752 is not set
# CONFIG_REGULATOR_S2MPA01 is not set
# CONFIG_REGULATOR_S2MPS11 is not set
# CONFIG_REGULATOR_S5M8767 is not set
# CONFIG_REGULATOR_SC2731 is not set
CONFIG_REGULATOR_SKY81452=m
# CONFIG_REGULATOR_SLG51000 is not set
# CONFIG_REGULATOR_STM32_BOOSTER is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STM32_PWR is not set
# CONFIG_REGULATOR_TI_ABB is not set
CONFIG_REGULATOR_STW481X_VMMC=y
# CONFIG_REGULATOR_SY7636A is not set
# CONFIG_REGULATOR_SY8106A is not set
# CONFIG_REGULATOR_SY8824X is not set
# CONFIG_REGULATOR_SY8827N is not set
CONFIG_REGULATOR_TPS51632=m
# CONFIG_REGULATOR_TPS62360 is not set
# CONFIG_REGULATOR_TPS6286X is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=m
# CONFIG_REGULATOR_TPS65086 is not set
# CONFIG_REGULATOR_TPS65217 is not set
CONFIG_REGULATOR_TPS65218=y
CONFIG_REGULATOR_TPS6524X=m
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_TPS65912=y
# CONFIG_REGULATOR_TPS68470 is not set
CONFIG_REGULATOR_TWL4030=m
# CONFIG_REGULATOR_UNIPHIER is not set
CONFIG_REGULATOR_VCTRL=y
CONFIG_REGULATOR_WM831X=y
CONFIG_REGULATOR_WM8350=m
# CONFIG_REGULATOR_WM8994 is not set
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_CEC_CORE=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
CONFIG_DRM_DEBUG_MM=y
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=y
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=y
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_KMB_DISPLAY is not set
CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_RCAR_DW_HDMI=m
# CONFIG_DRM_RCAR_USE_LVDS is not set
# CONFIG_DRM_RCAR_MIPI_DSI is not set
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_ABT_Y030XX067A is not set
# CONFIG_DRM_PANEL_ARM_VERSATILE is not set
# CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0 is not set
# CONFIG_DRM_PANEL_BOE_HIMAX8279D is not set
# CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
# CONFIG_DRM_PANEL_DSI_CM is not set
# CONFIG_DRM_PANEL_LVDS is not set
# CONFIG_DRM_PANEL_ELIDA_KD35T133 is not set
# CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02 is not set
# CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D is not set
# CONFIG_DRM_PANEL_ILITEK_IL9322 is not set
# CONFIG_DRM_PANEL_ILITEK_ILI9341 is not set
# CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
# CONFIG_DRM_PANEL_INNOLUX_EJ030NA is not set
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=y
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
# CONFIG_DRM_PANEL_JDI_R63452 is not set
# CONFIG_DRM_PANEL_KHADAS_TS050 is not set
# CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04 is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
# CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
CONFIG_DRM_PANEL_LG_LG4573=m
# CONFIG_DRM_PANEL_NOVATEK_NT35510 is not set
# CONFIG_DRM_PANEL_NOVATEK_NT35560 is not set
# CONFIG_DRM_PANEL_NOVATEK_NT35950 is not set
# CONFIG_DRM_PANEL_NOVATEK_NT36672A is not set
# CONFIG_DRM_PANEL_NOVATEK_NT39016 is not set
# CONFIG_DRM_PANEL_MANTIX_MLAF057WE51 is not set
# CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO is not set
# CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
# CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS is not set
# CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# CONFIG_DRM_PANEL_RAYDIUM_RM67191 is not set
# CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
# CONFIG_DRM_PANEL_RONBO_RB070D30 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E63M0 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
# CONFIG_DRM_PANEL_SAMSUNG_SOFEF00 is not set
# CONFIG_DRM_PANEL_SEIKO_43WVF1G is not set
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
# CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
# CONFIG_DRM_PANEL_SHARP_LS060T1SX01 is not set
# CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
# CONFIG_DRM_PANEL_SITRONIX_ST7703 is not set
CONFIG_DRM_PANEL_SITRONIX_ST7789V=y
# CONFIG_DRM_PANEL_TDO_TL070WSH30 is not set
# CONFIG_DRM_PANEL_TPO_TD028TTEC1 is not set
# CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA is not set
# CONFIG_DRM_PANEL_VISIONOX_RM69299 is not set
# CONFIG_DRM_PANEL_XINPENG_XPP055C272 is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_CDNS_DSI is not set
# CONFIG_DRM_CHIPONE_ICN6211 is not set
# CONFIG_DRM_CHRONTEL_CH7033 is not set
# CONFIG_DRM_CROS_EC_ANX7688 is not set
# CONFIG_DRM_DISPLAY_CONNECTOR is not set
# CONFIG_DRM_ITE_IT6505 is not set
# CONFIG_DRM_LONTIUM_LT8912B is not set
# CONFIG_DRM_LONTIUM_LT9611 is not set
# CONFIG_DRM_LONTIUM_LT9611UXC is not set
# CONFIG_DRM_ITE_IT66121 is not set
# CONFIG_DRM_LVDS_CODEC is not set
CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=m
CONFIG_DRM_NXP_PTN3460=m
CONFIG_DRM_PARADE_PS8622=m
# CONFIG_DRM_PARADE_PS8640 is not set
# CONFIG_DRM_SIL_SII8620 is not set
# CONFIG_DRM_SII902X is not set
# CONFIG_DRM_SII9234 is not set
# CONFIG_DRM_SIMPLE_BRIDGE is not set
# CONFIG_DRM_THINE_THC63LVD1024 is not set
# CONFIG_DRM_TOSHIBA_TC358762 is not set
# CONFIG_DRM_TOSHIBA_TC358764 is not set
# CONFIG_DRM_TOSHIBA_TC358767 is not set
# CONFIG_DRM_TOSHIBA_TC358768 is not set
# CONFIG_DRM_TOSHIBA_TC358775 is not set
CONFIG_DRM_TI_TFP410=y
# CONFIG_DRM_TI_SN65DSI83 is not set
# CONFIG_DRM_TI_SN65DSI86 is not set
# CONFIG_DRM_TI_TPD12S015 is not set
# CONFIG_DRM_ANALOGIX_ANX6345 is not set
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# CONFIG_DRM_ANALOGIX_ANX7625 is not set
CONFIG_DRM_I2C_ADV7511=y
CONFIG_DRM_I2C_ADV7511_CEC=y
# CONFIG_DRM_CDNS_MHDP8546 is not set
CONFIG_DRM_DW_HDMI=m
CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
# CONFIG_DRM_DW_HDMI_CEC is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_ARCPGU=y
# CONFIG_DRM_PANEL_MIPI_DBI is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9163 is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_TVE200 is not set
# CONFIG_DRM_ASPEED_GFX is not set
# CONFIG_DRM_TIDSS is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_SPRD is not set
CONFIG_DRM_LEGACY=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
CONFIG_FB_BOTH_ENDIAN=y
# CONFIG_FB_BIG_ENDIAN is not set
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
CONFIG_FB_CLPS711X=m
# CONFIG_FB_ARC is not set
# CONFIG_FB_CONTROL is not set
CONFIG_FB_STI=m
# CONFIG_FB_GBE is not set
# CONFIG_FB_PVR2 is not set
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
# CONFIG_FB_WM8505 is not set
# CONFIG_FB_W100 is not set
CONFIG_FB_TMIO=y
CONFIG_FB_TMIO_ACCELL=y
CONFIG_FB_SM501=m
# CONFIG_FB_IBM_GXT4500 is not set
CONFIG_FB_GOLDFISH=y
CONFIG_FB_VIRTUAL=m
CONFIG_FB_METRONOME=y
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=y
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
CONFIG_LCD_L4F00242T03=m
# CONFIG_LCD_LMS283GF05 is not set
CONFIG_LCD_LTV350QV=m
# CONFIG_LCD_ILI922X is not set
CONFIG_LCD_ILI9320=m
# CONFIG_LCD_TDO24M is not set
CONFIG_LCD_VGG2432A4=m
CONFIG_LCD_PLATFORM=m
CONFIG_LCD_AMS369FG06=m
# CONFIG_LCD_LMS501KF03 is not set
CONFIG_LCD_HX8357=m
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_LM3533 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_DA903X=y
CONFIG_BACKLIGHT_DA9052=y
# CONFIG_BACKLIGHT_QCOM_WLED is not set
CONFIG_BACKLIGHT_WM831X=y
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_88PM860X=m
# CONFIG_BACKLIGHT_PCF50633 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_PANDORA=m
CONFIG_BACKLIGHT_SKY81452=m
CONFIG_BACKLIGHT_TPS65217=m
CONFIG_BACKLIGHT_AS3711=y
CONFIG_BACKLIGHT_GPIO=m
CONFIG_BACKLIGHT_LV5207LP=m
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# CONFIG_BACKLIGHT_LED is not set
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
CONFIG_LOGO_LINUX_VGA16=y
# CONFIG_LOGO_LINUX_CLUT224 is not set
CONFIG_LOGO_PARISC_CLUT224=y
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SOUND_OSS_CORE=y
# CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_HWDEP=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_OSSEMUL=y
CONFIG_SND_MIXER_OSS=m
# CONFIG_SND_PCM_OSS is not set
# CONFIG_SND_PCM_TIMER is not set
# CONFIG_SND_DYNAMIC_MINORS is not set
# CONFIG_SND_SUPPORT_OLD_API is not set
# CONFIG_SND_VERBOSE_PRINTK is not set
CONFIG_SND_DEBUG=y
CONFIG_SND_DEBUG_VERBOSE=y
# CONFIG_SND_CTL_VALIDATION is not set
# CONFIG_SND_SEQUENCER is not set
CONFIG_SND_MPU401_UART=m
CONFIG_SND_DRIVERS=y
CONFIG_SND_DUMMY=m
CONFIG_SND_ALOOP=m
# CONFIG_SND_MTPAV is not set
# CONFIG_SND_SERIAL_U16550 is not set
CONFIG_SND_MPU401=m

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=64
# CONFIG_SND_SPI is not set
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=m
CONFIG_SND_DICE=m
# CONFIG_SND_OXFW is not set
# CONFIG_SND_ISIGHT is not set
CONFIG_SND_FIREWORKS=m
CONFIG_SND_BEBOB=m
CONFIG_SND_FIREWIRE_DIGI00X=m
CONFIG_SND_FIREWIRE_TASCAM=m
CONFIG_SND_FIREWIRE_MOTU=m
# CONFIG_SND_FIREFACE is not set
# CONFIG_SND_SOC is not set
# CONFIG_SND_VIRTIO is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=y
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y

#
# MemoryStick Host Controller Drivers
#
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
# CONFIG_LEDS_88PM860X is not set
# CONFIG_LEDS_AN30259A is not set
# CONFIG_LEDS_ARIEL is not set
# CONFIG_LEDS_AW2013 is not set
CONFIG_LEDS_BCM6328=y
CONFIG_LEDS_BCM6358=y
CONFIG_LEDS_CPCAP=m
# CONFIG_LEDS_CR0014114 is not set
# CONFIG_LEDS_EL15203000 is not set
# CONFIG_LEDS_LM3530 is not set
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3533=m
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_LM3692X is not set
CONFIG_LEDS_MT6323=y
# CONFIG_LEDS_S3C24XX is not set
# CONFIG_LEDS_COBALT_QUBE is not set
# CONFIG_LEDS_COBALT_RAQ is not set
CONFIG_LEDS_GPIO=y
# CONFIG_LEDS_LP3944 is not set
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=m
# CONFIG_LEDS_LP5523 is not set
CONFIG_LEDS_LP5562=y
CONFIG_LEDS_LP8501=m
# CONFIG_LEDS_LP8860 is not set
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_WM831X_STATUS=y
# CONFIG_LEDS_WM8350 is not set
CONFIG_LEDS_DA903X=y
# CONFIG_LEDS_DA9052 is not set
CONFIG_LEDS_DAC124S085=y
# CONFIG_LEDS_PWM is not set
CONFIG_LEDS_REGULATOR=m
CONFIG_LEDS_BD2802=y
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_NS2=y
# CONFIG_LEDS_TCA6507 is not set
CONFIG_LEDS_TLC591XX=m
CONFIG_LEDS_MAX8997=m
# CONFIG_LEDS_LM355x is not set
CONFIG_LEDS_OT200=m
CONFIG_LEDS_MENF21BMC=y
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
CONFIG_LEDS_SYSCON=y
# CONFIG_LEDS_MLXREG is not set
CONFIG_LEDS_USER=m
# CONFIG_LEDS_SPI_BYTE is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set
# CONFIG_LEDS_IP30 is not set

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AS3645A is not set
CONFIG_LEDS_KTD2692=m
# CONFIG_LEDS_LM3601X is not set
# CONFIG_LEDS_RT4505 is not set
# CONFIG_LEDS_SGM3140 is not set

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set
# CONFIG_RTC_NVMEM is not set

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
# CONFIG_RTC_INTF_DEV is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=y
CONFIG_RTC_DRV_88PM80X=y
CONFIG_RTC_DRV_ABB5ZES3=y
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_BRCMSTB=m
# CONFIG_RTC_DRV_AS3722 is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=y
CONFIG_RTC_DRV_DS1374_WDT=y
CONFIG_RTC_DRV_DS1672=y
# CONFIG_RTC_DRV_HYM8563 is not set
CONFIG_RTC_DRV_MAX6900=m
# CONFIG_RTC_DRV_MAX8907 is not set
CONFIG_RTC_DRV_MAX8998=m
# CONFIG_RTC_DRV_MAX8997 is not set
CONFIG_RTC_DRV_MAX77686=m
# CONFIG_RTC_DRV_RS5C372 is not set
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
# CONFIG_RTC_DRV_ISL12026 is not set
CONFIG_RTC_DRV_X1205=y
CONFIG_RTC_DRV_PCF8523=m
CONFIG_RTC_DRV_PCF85063=m
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=y
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=y
CONFIG_RTC_DRV_TWL4030=m
CONFIG_RTC_DRV_PALMAS=m
CONFIG_RTC_DRV_TPS6586X=y
CONFIG_RTC_DRV_RC5T583=y
# CONFIG_RTC_DRV_RC5T619 is not set
CONFIG_RTC_DRV_S35390A=m
CONFIG_RTC_DRV_FM3130=y
CONFIG_RTC_DRV_RX8010=y
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
# CONFIG_RTC_DRV_EM3027 is not set
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
CONFIG_RTC_DRV_S5M=m
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
CONFIG_RTC_DRV_M41T93=y
CONFIG_RTC_DRV_M41T94=m
CONFIG_RTC_DRV_DS1302=m
CONFIG_RTC_DRV_DS1305=m
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
CONFIG_RTC_DRV_DS1390=m
CONFIG_RTC_DRV_MAX6916=y
CONFIG_RTC_DRV_R9701=y
CONFIG_RTC_DRV_RX4581=y
CONFIG_RTC_DRV_RS5C348=m
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
CONFIG_RTC_DRV_MCP795=m
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
CONFIG_RTC_DRV_PCF2127=y
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set
CONFIG_RTC_DRV_RX6110=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=y
CONFIG_RTC_DRV_DS1553=m
CONFIG_RTC_DRV_DS1685_FAMILY=m
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
# CONFIG_RTC_DRV_DS17285 is not set
CONFIG_RTC_DRV_DS17485=y
# CONFIG_RTC_DRV_DS17885 is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=y
CONFIG_RTC_DRV_DA9052=m
CONFIG_RTC_DRV_DA9063=m
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=m
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=y
CONFIG_RTC_DRV_BQ4802=y
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set
# CONFIG_RTC_DRV_GAMECUBE is not set
CONFIG_RTC_DRV_WM831X=m
# CONFIG_RTC_DRV_WM8350 is not set
# CONFIG_RTC_DRV_SC27XX is not set
CONFIG_RTC_DRV_SPEAR=y
# CONFIG_RTC_DRV_PCF50633 is not set
# CONFIG_RTC_DRV_ZYNQMP is not set

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_ASM9260 is not set
# CONFIG_RTC_DRV_DAVINCI is not set
CONFIG_RTC_DRV_DIGICOLOR=m
# CONFIG_RTC_DRV_FSL_FTM_ALARM is not set
# CONFIG_RTC_DRV_MESON is not set
# CONFIG_RTC_DRV_MESON_VRTC is not set
CONFIG_RTC_DRV_S3C=y
CONFIG_RTC_DRV_EP93XX=m
# CONFIG_RTC_DRV_VR41XX is not set
CONFIG_RTC_DRV_AT91RM9200=m
# CONFIG_RTC_DRV_AT91SAM9 is not set
CONFIG_RTC_DRV_GENERIC=y
CONFIG_RTC_DRV_VT8500=y
CONFIG_RTC_DRV_SUNXI=y
# CONFIG_RTC_DRV_MV is not set
# CONFIG_RTC_DRV_ARMADA38X is not set
# CONFIG_RTC_DRV_CADENCE is not set
# CONFIG_RTC_DRV_FTRTC010 is not set
# CONFIG_RTC_DRV_STMP is not set
# CONFIG_RTC_DRV_MC13XXX is not set
CONFIG_RTC_DRV_JZ4740=m
CONFIG_RTC_DRV_LPC24XX=m
CONFIG_RTC_DRV_LPC32XX=m
CONFIG_RTC_DRV_PM8XXX=y
# CONFIG_RTC_DRV_TEGRA is not set
# CONFIG_RTC_DRV_MXC is not set
# CONFIG_RTC_DRV_MXC_V2 is not set
CONFIG_RTC_DRV_SNVS=y
CONFIG_RTC_DRV_MOXART=m
# CONFIG_RTC_DRV_MT2712 is not set
CONFIG_RTC_DRV_MT6397=m
# CONFIG_RTC_DRV_MT7622 is not set
CONFIG_RTC_DRV_XGENE=m
CONFIG_RTC_DRV_R7301=y
CONFIG_RTC_DRV_STM32=y
# CONFIG_RTC_DRV_CPCAP is not set
CONFIG_RTC_DRV_RTD119X=y
# CONFIG_RTC_DRV_ASPEED is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
# CONFIG_RTC_DRV_MSC313 is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=m
CONFIG_LINEDISP=y
# CONFIG_HD44780_COMMON is not set
# CONFIG_HD44780 is not set
CONFIG_IMG_ASCII_LCD=y
# CONFIG_LCD2S is not set
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
# CONFIG_UIO is not set
# CONFIG_VFIO is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO=m
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_BALLOON is not set
CONFIG_VIRTIO_MMIO=m
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_OLPC_XO175 is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_COMMON_CLK is not set
# CONFIG_HWSPINLOCK is not set
CONFIG_MAILBOX=y
# CONFIG_IMX_MBOX is not set
CONFIG_PLATFORM_MHU=y
# CONFIG_ARMADA_37XX_RWTM_MBOX is not set
# CONFIG_ROCKCHIP_MBOX is not set
CONFIG_ALTERA_MBOX=m
# CONFIG_HI3660_MBOX is not set
# CONFIG_HI6220_MBOX is not set
CONFIG_MAILBOX_TEST=m
# CONFIG_POLARFIRE_SOC_MAILBOX is not set
CONFIG_QCOM_APCS_IPC=y
CONFIG_BCM_PDC_MBOX=y
# CONFIG_STM32_IPCC is not set
# CONFIG_MTK_ADSP_MBOX is not set
# CONFIG_MTK_CMDQ_MBOX is not set
# CONFIG_SUN6I_MSGBOX is not set
# CONFIG_SPRD_MBOX is not set
# CONFIG_QCOM_IPCC is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=m
# CONFIG_RPMSG_CTRL is not set
# CONFIG_RPMSG_NS is not set
CONFIG_RPMSG_QCOM_GLINK=m
CONFIG_RPMSG_QCOM_GLINK_RPM=m
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
# CONFIG_MESON_CLK_MEASURE is not set
CONFIG_MESON_GX_SOCINFO=y
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
CONFIG_ASPEED_LPC_SNOOP=y
# CONFIG_ASPEED_UART_ROUTING is not set
# CONFIG_ASPEED_P2A_CTRL is not set
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
# CONFIG_BCM2835_POWER is not set
# CONFIG_SOC_BCM63XX is not set
CONFIG_SOC_BRCMSTB=y
# CONFIG_BCM_PMB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
CONFIG_DPAA2_CONSOLE=y
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_SOC_IMX8M is not set
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
# CONFIG_MTK_DEVAPC is not set
# CONFIG_MTK_INFRACFG is not set
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_GSBI is not set
# CONFIG_QCOM_LLCC is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
# CONFIG_ROCKCHIP_IODOMAIN is not set
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
CONFIG_SOC_TI=y
CONFIG_UX500_SOC_ID=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
CONFIG_DEVFREQ_GOV_PERFORMANCE=m
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
CONFIG_DEVFREQ_GOV_USERSPACE=y
CONFIG_DEVFREQ_GOV_PASSIVE=m

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
# CONFIG_ARM_IMX_BUS_DEVFREQ is not set
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=m
# CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX77843=m
CONFIG_EXTCON_MAX8997=m
CONFIG_EXTCON_PALMAS=m
# CONFIG_EXTCON_PTN5150 is not set
CONFIG_EXTCON_QCOM_SPMI_MISC=y
CONFIG_EXTCON_RT8973A=y
# CONFIG_EXTCON_SM5502 is not set
# CONFIG_EXTCON_USB_GPIO is not set
# CONFIG_EXTCON_USBC_TUSB320 is not set
CONFIG_MEMORY=y
# CONFIG_ATMEL_SDRAMC is not set
# CONFIG_ATMEL_EBI is not set
# CONFIG_BRCMSTB_DPFE is not set
# CONFIG_BT1_L2_CTL is not set
# CONFIG_TI_AEMIF is not set
# CONFIG_TI_EMIF is not set
# CONFIG_OMAP_GPMC is not set
# CONFIG_MVEBU_DEVBUS is not set
# CONFIG_FSL_CORENET_CF is not set
# CONFIG_FSL_IFC is not set
# CONFIG_JZ4780_NEMC is not set
# CONFIG_MTK_SMI is not set
# CONFIG_DA8XX_DDRCTL is not set
# CONFIG_RENESAS_RPCIF is not set
# CONFIG_STM32_FMC2_EBI is not set
CONFIG_SAMSUNG_MC=y
# CONFIG_EXYNOS5422_DMC is not set
CONFIG_EXYNOS_SROM=y
# CONFIG_IIO is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_ATMEL is not set
# CONFIG_PWM_ATMEL_TCB is not set
# CONFIG_PWM_BCM2835 is not set
# CONFIG_PWM_BERLIN is not set
# CONFIG_PWM_BRCMSTB is not set
# CONFIG_PWM_CLPS711X is not set
# CONFIG_PWM_EP93XX is not set
# CONFIG_PWM_FSL_FTM is not set
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_IMX1 is not set
# CONFIG_PWM_IMX27 is not set
# CONFIG_PWM_INTEL_LGM is not set
# CONFIG_PWM_IQS620A is not set
# CONFIG_PWM_LP3943 is not set
# CONFIG_PWM_LPC18XX_SCT is not set
# CONFIG_PWM_LPC32XX is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_MTK_DISP is not set
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_MXS is not set
# CONFIG_PWM_OMAP_DMTIMER is not set
# CONFIG_PWM_PCA9685 is not set
# CONFIG_PWM_PXA is not set
# CONFIG_PWM_RASPBERRYPI_POE is not set
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
# CONFIG_PWM_ROCKCHIP is not set
# CONFIG_PWM_SAMSUNG is not set
# CONFIG_PWM_SL28CPLD is not set
# CONFIG_PWM_SPEAR is not set
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STI is not set
# CONFIG_PWM_STM32 is not set
# CONFIG_PWM_STM32_LP is not set
# CONFIG_PWM_TEGRA is not set
# CONFIG_PWM_TIECAP is not set
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_TWL is not set
# CONFIG_PWM_TWL_LED is not set
# CONFIG_PWM_VISCONTI is not set
# CONFIG_PWM_VT8500 is not set

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
# CONFIG_AL_FIC is not set
CONFIG_JCORE_AIC=y
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
# CONFIG_SL28CPLD_INTC is not set
CONFIG_TS4800_IRQ=y
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_RENESAS_H8S_INTC is not set
CONFIG_IRQ_UNIPHIER_AIDET=y
# CONFIG_MESON_IRQ_GPIO is not set
# CONFIG_IMX_IRQSTEER is not set
# CONFIG_IMX_INTMUX is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_LOONGSON_PCH_PIC is not set
# CONFIG_MST_IRQ is not set
# CONFIG_MCHP_EIC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
CONFIG_RESET_HSDK=y
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_K210 is not set
CONFIG_RESET_LANTIQ=y
CONFIG_RESET_LPC18XX=y
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_QCOM_AOSS is not set
# CONFIG_RESET_QCOM_PDC is not set
# CONFIG_RESET_RASPBERRYPI is not set
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
# CONFIG_RESET_SCMI is not set
CONFIG_RESET_SIMPLE=y
CONFIG_RESET_SOCFPGA=y
# CONFIG_RESET_STARFIVE_JH7100 is not set
CONFIG_RESET_SUNXI=y
CONFIG_RESET_TI_SYSCON=y
# CONFIG_RESET_TN48M_CPLD is not set
CONFIG_RESET_UNIPHIER=m
# CONFIG_RESET_UNIPHIER_GLUE is not set
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_PHY_LPC18XX_USB_OTG=m
# CONFIG_PHY_PISTACHIO_USB is not set
CONFIG_PHY_XGENE=y
# CONFIG_PHY_CAN_TRANSCEIVER is not set
# CONFIG_PHY_SUN50I_USB3 is not set
# CONFIG_PHY_MESON8_HDMI_TX is not set
# CONFIG_PHY_MESON_G12A_USB2 is not set
# CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
# CONFIG_PHY_MESON_AXG_PCIE is not set
# CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
# CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
# CONFIG_PHY_CYGNUS_PCIE is not set
# CONFIG_PHY_BCM_SR_USB is not set
CONFIG_BCM_KONA_USB2_PHY=m
CONFIG_PHY_BCM_NS_USB2=m
CONFIG_PHY_NS2_USB_DRD=y
CONFIG_PHY_BRCM_SATA=m
# CONFIG_PHY_BRCM_USB is not set
# CONFIG_PHY_BCM_SR_PCIE is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_DPHY is not set
# CONFIG_PHY_CADENCE_DPHY_RX is not set
# CONFIG_PHY_CADENCE_SALVO is not set
# CONFIG_PHY_FSL_IMX8MQ_USB is not set
# CONFIG_PHY_MIXEL_MIPI_DPHY is not set
# CONFIG_PHY_FSL_IMX8M_PCIE is not set
# CONFIG_PHY_FSL_LYNX_28G is not set
# CONFIG_PHY_HI6220_USB is not set
# CONFIG_PHY_HI3660_USB is not set
# CONFIG_PHY_HI3670_USB is not set
# CONFIG_PHY_HI3670_PCIE is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
CONFIG_PHY_LANTIQ_RCU_USB2=y
# CONFIG_ARMADA375_USBCLUSTER_PHY is not set
# CONFIG_PHY_BERLIN_SATA is not set
# CONFIG_PHY_BERLIN_USB is not set
CONFIG_PHY_MVEBU_A3700_UTMI=y
# CONFIG_PHY_MVEBU_A38X_COMPHY is not set
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_PXA_USB is not set
# CONFIG_PHY_MMP3_USB is not set
# CONFIG_PHY_MMP3_HSIC is not set
# CONFIG_PHY_MTK_TPHY is not set
# CONFIG_PHY_MTK_UFS is not set
# CONFIG_PHY_MTK_XSPHY is not set
# CONFIG_PHY_SPARX5_SERDES is not set
# CONFIG_PHY_LAN966X_SERDES is not set
# CONFIG_PHY_OCELOT_SERDES is not set
# CONFIG_PHY_ATH79_USB is not set
# CONFIG_PHY_QCOM_IPQ4019_USB is not set
# CONFIG_PHY_QCOM_QUSB2 is not set
# CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
# CONFIG_PHY_QCOM_USB_HS_28NM is not set
# CONFIG_PHY_QCOM_USB_SS is not set
# CONFIG_PHY_QCOM_IPQ806X_USB is not set
# CONFIG_PHY_MT7621_PCI is not set
CONFIG_PHY_RALINK_USB=y
CONFIG_PHY_RCAR_GEN3_USB3=m
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
# CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
CONFIG_PHY_ROCKCHIP_TYPEC=y
CONFIG_PHY_EXYNOS_DP_VIDEO=y
CONFIG_PHY_EXYNOS_MIPI_VIDEO=m
CONFIG_PHY_EXYNOS_PCIE=y
# CONFIG_PHY_SAMSUNG_UFS is not set
# CONFIG_PHY_SAMSUNG_USB2 is not set
# CONFIG_PHY_UNIPHIER_USB2 is not set
# CONFIG_PHY_UNIPHIER_USB3 is not set
# CONFIG_PHY_UNIPHIER_PCIE is not set
# CONFIG_PHY_UNIPHIER_AHCI is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=m
CONFIG_PHY_ST_SPEAR1340_MIPHY=y
CONFIG_PHY_STIH407_USB=m
# CONFIG_PHY_TEGRA194_P2U is not set
# CONFIG_PHY_DA8XX_USB is not set
CONFIG_OMAP_CONTROL_PHY=y
# CONFIG_TI_PIPE3 is not set
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_COMBO is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# CONFIG_PHY_INTEL_THUNDERBAY_EMMC is not set
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=m
CONFIG_MCB_LPC=m
CONFIG_RAS=y

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

CONFIG_DAX=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_IMX_IIM is not set
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_JZ4780_EFUSE is not set
CONFIG_NVMEM_LPC18XX_EEPROM=m
CONFIG_NVMEM_LPC18XX_OTP=m
CONFIG_NVMEM_MXS_OCOTP=m
# CONFIG_MTK_EFUSE is not set
# CONFIG_NVMEM_NINTENDO_OTP is not set
# CONFIG_QCOM_QFPROM is not set
# CONFIG_NVMEM_SPMI_SDAM is not set
# CONFIG_ROCKCHIP_EFUSE is not set
# CONFIG_ROCKCHIP_OTP is not set
CONFIG_NVMEM_BCM_OCOTP=m
# CONFIG_NVMEM_STM32_ROMEM is not set
# CONFIG_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set
# CONFIG_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_SC27XX_EFUSE is not set
# CONFIG_SPRD_EFUSE is not set
# CONFIG_NVMEM_RMEM is not set
# CONFIG_NVMEM_BRCM_NVRAM is not set
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set

#
# HW tracing support
#
CONFIG_STM=y
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_FPGA_MGR_SOCFPGA=m
CONFIG_FPGA_MGR_SOCFPGA_A10=y
CONFIG_ALTERA_PR_IP_CORE=m
CONFIG_ALTERA_PR_IP_CORE_PLAT=m
# CONFIG_FPGA_MGR_ALTERA_PS_SPI is not set
# CONFIG_FPGA_MGR_ZYNQ_FPGA is not set
CONFIG_FPGA_MGR_XILINX_SPI=m
# CONFIG_FPGA_MGR_ICE40_SPI is not set
# CONFIG_FPGA_MGR_MACHXO2_SPI is not set
CONFIG_FPGA_BRIDGE=y
# CONFIG_ALTERA_FREEZE_BRIDGE is not set
# CONFIG_XILINX_PR_DECOUPLER is not set
# CONFIG_FPGA_REGION is not set
# CONFIG_FPGA_DFL is not set
# CONFIG_FPGA_MGR_ZYNQMP_FPGA is not set
# CONFIG_FPGA_MGR_VERSAL_FPGA is not set
CONFIG_FSI=m
# CONFIG_FSI_NEW_DEV_NODE is not set
CONFIG_FSI_MASTER_HUB=m
# CONFIG_FSI_MASTER_ASPEED is not set
CONFIG_FSI_SCOM=m
# CONFIG_FSI_SBEFIFO is not set
# CONFIG_TEE is not set
CONFIG_PM_OPP=y
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# CONFIG_PECI is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
# CONFIG_FILE_LOCKING is not set
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
# CONFIG_PRINT_QUOTA_WARNING is not set
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
# CONFIG_AUTOFS_FS is not set
CONFIG_FUSE_FS=y
# CONFIG_CUSE is not set
# CONFIG_VIRTIO_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NLS=m
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=m
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
CONFIG_NLS_CODEPAGE_861=m
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
# CONFIG_NLS_CODEPAGE_869 is not set
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=m
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=m
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=m
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=m
# CONFIG_NLS_ISO8859_13 is not set
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
# CONFIG_NLS_MAC_ROMAN is not set
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=m
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=m
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
# CONFIG_SECURITY_PATH is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
# CONFIG_INTEGRITY is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=m
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
# CONFIG_CRYPTO_CRYPTD is not set
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_ENGINE=m

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=m
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
# CONFIG_CRYPTO_GCM is not set
CONFIG_CRYPTO_CHACHA20POLY1305=m
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_SEQIV=y
# CONFIG_CRYPTO_ECHAINIV is not set

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=m
# CONFIG_CRYPTO_ADIANTUM is not set
# CONFIG_CRYPTO_ESSIV is not set

#
# Hash modes
#
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
# CONFIG_CRYPTO_XXHASH is not set
# CONFIG_CRYPTO_BLAKE2B is not set
# CONFIG_CRYPTO_BLAKE2S is not set
CONFIG_CRYPTO_CRCT10DIF=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=m
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3 is not set
# CONFIG_CRYPTO_STREEBOG is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_CHACHA20=m
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_SM4 is not set
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=m
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=m
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_ALLWINNER is not set
CONFIG_CRYPTO_DEV_EXYNOS_RNG=y
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AUTHENC is not set
CONFIG_CRYPTO_DEV_ATMEL_AES=y
CONFIG_CRYPTO_DEV_ATMEL_TDES=y
CONFIG_CRYPTO_DEV_ATMEL_SHA=m
CONFIG_CRYPTO_DEV_ATMEL_I2C=m
CONFIG_CRYPTO_DEV_ATMEL_ECC=m
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_QCE=y
CONFIG_CRYPTO_DEV_QCE_SKCIPHER=y
CONFIG_CRYPTO_DEV_QCE_SHA=y
CONFIG_CRYPTO_DEV_QCE_AEAD=y
CONFIG_CRYPTO_DEV_QCE_ENABLE_ALL=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SKCIPHER is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SHA is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_AEAD is not set
CONFIG_CRYPTO_DEV_QCE_SW_MAX_LEN=512
# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
CONFIG_CRYPTO_DEV_IMGTEC_HASH=y
# CONFIG_CRYPTO_DEV_ZYNQMP_AES is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_SHA3 is not set
CONFIG_CRYPTO_DEV_VIRTIO=m
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_CCREE is not set
# CONFIG_CRYPTO_DEV_HISI_SEC is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
# CONFIG_CRYPTO_DEV_SA2UL is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4 is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_ECC is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU is not set
# CONFIG_ASYMMETRIC_KEY_TYPE is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
# CONFIG_CORDIC is not set
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_STMP_DEVICE=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=m
CONFIG_CRC_T10DIF=m
# CONFIG_CRC64_ROCKSOFT is not set
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=y
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
CONFIG_CRC4=m
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
CONFIG_CRC8=m
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=m
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
# CONFIG_XZ_DEC is not set
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_BCH=m
CONFIG_BCH_CONST_PARAMS=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_SPLIT=y
CONFIG_ARCH_NO_SG_CHAIN=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACK_HASH_ORDER=20
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# end of Library routines

CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED=y
CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
CONFIG_SYMBOLIC_ERRNAME=y
# CONFIG_DEBUG_BUGVERBOSE is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO_NONE=y
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_FRAME_WARN=2048
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_READABLE_ASM=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
# CONFIG_FRAME_POINTER is not set
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_RODATA_TEST=y
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=1
# CONFIG_WQ_WATCHDOG is not set
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=y
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=y
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_TRACE_CLOCK=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set

#
# parisc Debugging
#
# end of parisc Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_TEST_REF_TRACKER is not set
CONFIG_RBTREE_TEST=y
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
CONFIG_PERCPU_TEST=m
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_TEST_HEXDUMP is not set
CONFIG_STRING_SELFTEST=y
CONFIG_TEST_STRING_HELPERS=y
# CONFIG_TEST_STRSCPY is not set
CONFIG_TEST_KSTRTOX=m
CONFIG_TEST_PRINTF=m
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
CONFIG_TEST_UUID=m
# CONFIG_TEST_XARRAY is not set
CONFIG_TEST_RHASHTABLE=y
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
CONFIG_TEST_USER_COPY=m
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=y
CONFIG_TEST_UDELAY=m
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# end of Kernel Testing and Coverage

# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Kernel hacking

--zaJadf9zxTCFK5OM--
