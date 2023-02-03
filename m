Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03852BA57
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Feb 2023 22:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675462281; x=1706998281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/yJdqw3Sf9pUDGC2EdbBbU1WP4TroRk5wDVskcCaBg=;
  b=DlYCyITLdvif80e1efFGLv1i5NUuuIW+AU1zHH9VxpNgbnki61pNKNMc
   KZr5Ny3icEGP+guQa66ZAcEblBieWFJRY1bM7VU/pfzSLsSU9+7dNtZZi
   PuVt8b8o56eMWTWwWwGDMG+TjVEImBLSIla06n9MVJI04AQamfA0mHb+a
   nX+gUh/Es2aechtwaAKEF/5LYSh/n+R6fGvfmGOvf3RwYcxxPNd8XPKKW
   q/L31fon4wDsiCalwawUJyh+OJGP7/7YijP33belqKBm9NwAYTJMk8/Ly
   QcIgytwwEwqlMvIWwFKs4DIzkWgjyw+02ZCORo1UcjQh+j2shK7ak8TYD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330158905"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="330158905"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 14:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729401035"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="729401035"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 14:11:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO4H8-0000nN-15;
	Fri, 03 Feb 2023 22:11:18 +0000
Date: Sat, 4 Feb 2023 06:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/futex/syscalls.c:77:16: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <202302040604.eXlIiIuM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "kernel/futex/syscalls.c: fbc_errors <1> is not larger than parent_errors <4>"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Aurelien Jarno <aurelien@aurel32.net>
CC: Palmer Dabbelt <palmer@rivosinc.com>

Hi Aurelien,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0136d86b78522bbd5755f8194c97a987f0586ba5
commit: 6df2a016c0c8a3d0933ef33dd192ea6606b115e3 riscv: fix build with binutils 2.38
date:   12 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-s051-20230204 (https://download.01.org/0day-ci/archive/20230204/202302040604.eXlIiIuM-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6df2a016c0c8a3d0933ef33dd192ea6606b115e3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6df2a016c0c8a3d0933ef33dd192ea6606b115e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/core/ kernel/futex/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> kernel/futex/syscalls.c:77:16: sparse: sparse: cast removes address space '__user' of expression
--
>> drivers/usb/core/devio.c:2045:13: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +77 kernel/futex/syscalls.c

af8cc9600bbf225 Peter Zijlstra 2021-09-23  42  
af8cc9600bbf225 Peter Zijlstra 2021-09-23  43  /**
af8cc9600bbf225 Peter Zijlstra 2021-09-23  44   * sys_get_robust_list() - Get the robust-futex list head of a task
af8cc9600bbf225 Peter Zijlstra 2021-09-23  45   * @pid:	pid of the process [zero for current task]
af8cc9600bbf225 Peter Zijlstra 2021-09-23  46   * @head_ptr:	pointer to a list-head pointer, the kernel fills it in
af8cc9600bbf225 Peter Zijlstra 2021-09-23  47   * @len_ptr:	pointer to a length field, the kernel fills in the header size
af8cc9600bbf225 Peter Zijlstra 2021-09-23  48   */
af8cc9600bbf225 Peter Zijlstra 2021-09-23  49  SYSCALL_DEFINE3(get_robust_list, int, pid,
af8cc9600bbf225 Peter Zijlstra 2021-09-23  50  		struct robust_list_head __user * __user *, head_ptr,
af8cc9600bbf225 Peter Zijlstra 2021-09-23  51  		size_t __user *, len_ptr)
af8cc9600bbf225 Peter Zijlstra 2021-09-23  52  {
af8cc9600bbf225 Peter Zijlstra 2021-09-23  53  	struct robust_list_head __user *head;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  54  	unsigned long ret;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  55  	struct task_struct *p;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  56  
af8cc9600bbf225 Peter Zijlstra 2021-09-23  57  	rcu_read_lock();
af8cc9600bbf225 Peter Zijlstra 2021-09-23  58  
af8cc9600bbf225 Peter Zijlstra 2021-09-23  59  	ret = -ESRCH;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  60  	if (!pid)
af8cc9600bbf225 Peter Zijlstra 2021-09-23  61  		p = current;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  62  	else {
af8cc9600bbf225 Peter Zijlstra 2021-09-23  63  		p = find_task_by_vpid(pid);
af8cc9600bbf225 Peter Zijlstra 2021-09-23  64  		if (!p)
af8cc9600bbf225 Peter Zijlstra 2021-09-23  65  			goto err_unlock;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  66  	}
af8cc9600bbf225 Peter Zijlstra 2021-09-23  67  
af8cc9600bbf225 Peter Zijlstra 2021-09-23  68  	ret = -EPERM;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  69  	if (!ptrace_may_access(p, PTRACE_MODE_READ_REALCREDS))
af8cc9600bbf225 Peter Zijlstra 2021-09-23  70  		goto err_unlock;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  71  
af8cc9600bbf225 Peter Zijlstra 2021-09-23  72  	head = p->robust_list;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  73  	rcu_read_unlock();
af8cc9600bbf225 Peter Zijlstra 2021-09-23  74  
af8cc9600bbf225 Peter Zijlstra 2021-09-23  75  	if (put_user(sizeof(*head), len_ptr))
af8cc9600bbf225 Peter Zijlstra 2021-09-23  76  		return -EFAULT;
af8cc9600bbf225 Peter Zijlstra 2021-09-23 @77  	return put_user(head, head_ptr);
af8cc9600bbf225 Peter Zijlstra 2021-09-23  78  
af8cc9600bbf225 Peter Zijlstra 2021-09-23  79  err_unlock:
af8cc9600bbf225 Peter Zijlstra 2021-09-23  80  	rcu_read_unlock();
af8cc9600bbf225 Peter Zijlstra 2021-09-23  81  
af8cc9600bbf225 Peter Zijlstra 2021-09-23  82  	return ret;
af8cc9600bbf225 Peter Zijlstra 2021-09-23  83  }
af8cc9600bbf225 Peter Zijlstra 2021-09-23  84  

:::::: The code at line 77 was first introduced by commit
:::::: af8cc9600bbf2251b04c56139f7c83f87c3f878a futex: Split out syscalls

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
