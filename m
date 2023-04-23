Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C453B36B
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Apr 2023 04:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682225883; x=1713761883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jtEQpX9FWyBsZniWjTXL+yf7hnE56kfMTCNG0r9CNxo=;
  b=RPaw6tpGIZcWEUbkcLgZvqRFFqUUJc+YvnWMjG+HFCME75Ui8EkgbOEo
   615iGcYRIBJhkp88gkzV9iJ4pxLJhnSmbyIAGvHWjdv8vl1DaLAMpE/HF
   j3PX9PA1G0Nxx7gB/7IpYpGI340AeQtwR92x8KuoC/ChpRjSRFQ9dlTq9
   7JydWNFZXUamZX/qmYwZAT79vniTo/7mreE7tOVTk30tWJB3AGwddlf6Y
   PIDhxnin64LEzTMEAb5kHeolkKWEv8Nzy5813QOtv7rPaGHu12KmbRTI0
   kWfg+2YvFtfDetUOKa4TFPzIMAJWqqQ8auq2RAreyX3K1Ro9YpRhCmIth
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="432519931"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="432519931"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 21:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="725267506"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="725267506"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Apr 2023 21:58:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqRnU-000hhi-2l;
	Sun, 23 Apr 2023 04:58:00 +0000
Date: Sun, 23 Apr 2023 12:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/compat_signal.c:58 compat_restore_fp_state() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202304231205.xJHfjXhO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Guo Ren <guoren@linux.alibaba.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Guo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   622322f53c6d9ddd3c2a4aad852b3e1adbd56da7
commit: 9be8459298eadb39b9fe9974b890239e9c123107 riscv: compat: Add COMPAT Kbuild skeletal support
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-m041-20230423 (https://download.01.org/0day-ci/archive/20230423/202304231205.xJHfjXhO-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304231205.xJHfjXhO-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/compat_signal.c:58 compat_restore_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/compat_signal.c:86 compat_save_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
arch/riscv/kernel/compat_signal.c:116 compat_restore_sigcontext() warn: maybe return -EFAULT instead of the bytes remaining?
arch/riscv/kernel/compat_signal.c:173 compat_setup_sigcontext() warn: maybe return -EFAULT instead of the bytes remaining?

vim +58 arch/riscv/kernel/compat_signal.c

7383ee05314be58 Guo Ren 2022-04-05   47  
7383ee05314be58 Guo Ren 2022-04-05   48  #ifdef CONFIG_FPU
7383ee05314be58 Guo Ren 2022-04-05   49  static long compat_restore_fp_state(struct pt_regs *regs,
7383ee05314be58 Guo Ren 2022-04-05   50  	union __riscv_fp_state __user *sc_fpregs)
7383ee05314be58 Guo Ren 2022-04-05   51  {
7383ee05314be58 Guo Ren 2022-04-05   52  	long err;
7383ee05314be58 Guo Ren 2022-04-05   53  	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
7383ee05314be58 Guo Ren 2022-04-05   54  	size_t i;
7383ee05314be58 Guo Ren 2022-04-05   55  
7383ee05314be58 Guo Ren 2022-04-05   56  	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
7383ee05314be58 Guo Ren 2022-04-05   57  	if (unlikely(err))
7383ee05314be58 Guo Ren 2022-04-05  @58  		return err;
7383ee05314be58 Guo Ren 2022-04-05   59  
7383ee05314be58 Guo Ren 2022-04-05   60  	fstate_restore(current, regs);
7383ee05314be58 Guo Ren 2022-04-05   61  
7383ee05314be58 Guo Ren 2022-04-05   62  	/* We support no other extension state at this time. */
7383ee05314be58 Guo Ren 2022-04-05   63  	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
7383ee05314be58 Guo Ren 2022-04-05   64  		u32 value;
7383ee05314be58 Guo Ren 2022-04-05   65  
7383ee05314be58 Guo Ren 2022-04-05   66  		err = __get_user(value, &sc_fpregs->q.reserved[i]);
7383ee05314be58 Guo Ren 2022-04-05   67  		if (unlikely(err))
7383ee05314be58 Guo Ren 2022-04-05   68  			break;
7383ee05314be58 Guo Ren 2022-04-05   69  		if (value != 0)
7383ee05314be58 Guo Ren 2022-04-05   70  			return -EINVAL;
7383ee05314be58 Guo Ren 2022-04-05   71  	}
7383ee05314be58 Guo Ren 2022-04-05   72  
7383ee05314be58 Guo Ren 2022-04-05   73  	return err;
7383ee05314be58 Guo Ren 2022-04-05   74  }
7383ee05314be58 Guo Ren 2022-04-05   75  
7383ee05314be58 Guo Ren 2022-04-05   76  static long compat_save_fp_state(struct pt_regs *regs,
7383ee05314be58 Guo Ren 2022-04-05   77  			  union __riscv_fp_state __user *sc_fpregs)
7383ee05314be58 Guo Ren 2022-04-05   78  {
7383ee05314be58 Guo Ren 2022-04-05   79  	long err;
7383ee05314be58 Guo Ren 2022-04-05   80  	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
7383ee05314be58 Guo Ren 2022-04-05   81  	size_t i;
7383ee05314be58 Guo Ren 2022-04-05   82  
7383ee05314be58 Guo Ren 2022-04-05   83  	fstate_save(current, regs);
7383ee05314be58 Guo Ren 2022-04-05   84  	err = __copy_to_user(state, &current->thread.fstate, sizeof(*state));
7383ee05314be58 Guo Ren 2022-04-05   85  	if (unlikely(err))
7383ee05314be58 Guo Ren 2022-04-05  @86  		return err;
7383ee05314be58 Guo Ren 2022-04-05   87  
7383ee05314be58 Guo Ren 2022-04-05   88  	/* We support no other extension state at this time. */
7383ee05314be58 Guo Ren 2022-04-05   89  	for (i = 0; i < ARRAY_SIZE(sc_fpregs->q.reserved); i++) {
7383ee05314be58 Guo Ren 2022-04-05   90  		err = __put_user(0, &sc_fpregs->q.reserved[i]);
7383ee05314be58 Guo Ren 2022-04-05   91  		if (unlikely(err))
7383ee05314be58 Guo Ren 2022-04-05   92  			break;
7383ee05314be58 Guo Ren 2022-04-05   93  	}
7383ee05314be58 Guo Ren 2022-04-05   94  
7383ee05314be58 Guo Ren 2022-04-05   95  	return err;
7383ee05314be58 Guo Ren 2022-04-05   96  }
7383ee05314be58 Guo Ren 2022-04-05   97  #else
7383ee05314be58 Guo Ren 2022-04-05   98  #define compat_save_fp_state(task, regs) (0)
7383ee05314be58 Guo Ren 2022-04-05   99  #define compat_restore_fp_state(task, regs) (0)
7383ee05314be58 Guo Ren 2022-04-05  100  #endif
7383ee05314be58 Guo Ren 2022-04-05  101  

:::::: The code at line 58 was first introduced by commit
:::::: 7383ee05314be58f8f9f018ee0ac53bef3808aea riscv: compat: signal: Add rt_frame implementation

:::::: TO: Guo Ren <guoren@linux.alibaba.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
