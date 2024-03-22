Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B9756B64
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Mar 2024 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711121010; cv=none; b=fG/ClFrZNXhVaay6WyPYvEJRRvb4USLAVSa1kXWJtIDJ4npGjykIqhvo9TsayEOTLvtKWPJ18B1ciKcB2rjw+mU7RtsbBCnnzPuLjWp6ix/fn1HEjzVUwm/dhqIBdtC6Q/uA9Qv6bk8WxeIptqhNsgY8ovTAUTPWyion3QvHXJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711121010; c=relaxed/simple;
	bh=iY+6im+yWyiOfSs41rTLfUJkDSa39mAj/Nnjs+Glmps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEG7lWzXgXMPryyKiRs+LPbyyBCYBCB+zurStAMjuSck5Xv2l1x5c+S+9mlv9//ARFA5fahiggb29Qn8tlchQeCv3xF+C902yCpojTX021LO/o7znwRUQgQGwTuCmM9ZcMwLabvdCN3dTFaVbeOv2cjwHWruMBZqlZEAhiScSwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJhLQ0oP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJhLQ0oP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711121008; x=1742657008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iY+6im+yWyiOfSs41rTLfUJkDSa39mAj/Nnjs+Glmps=;
  b=JJhLQ0oPgsFYqmAQ24iJ0M5gd2y6qhbL/rt7zggDIaL5kHCPEGKrIhZO
   TirWe/KjuptBwLon4a4YwLlu5TxaRHp8E7Y02mXy83eCW5inRPHJPr4LX
   xbfDQhTliUNnD9grXKG4OEWkVhTHu+Q1RZFkm8Zn+khKc7UScppFjQUbp
   KtowFvpCfhti9jMgeEPAQ0MZRcLJeH6YVYStldvRz6RiKeaEoRfPVZMdM
   jNf9ImgdoVb+pmXL/C+GMVEqBuVvW4uANy3bS1mSRYOMnZhvqheXJJZpI
   HA5d5l/2WMTuyFQSffI/YzFpj9uditYXdwSG5GpsXXX5UE72RYJTAtjjM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28647330"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="28647330"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 08:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="46066100"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Mar 2024 08:23:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rngjs-000KOZ-0p;
	Fri, 22 Mar 2024 15:23:24 +0000
Date: Fri, 22 Mar 2024 23:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [stffrdhrn:or1k-fpu-regs 3/3] arch/openrisc/kernel/signal.c:50
 restore_fp_state() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <202403222317.OWCfI67M-lkp@intel.com>
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
TO: Stafford Horne <shorne@gmail.com>

tree:   https://github.com/stffrdhrn/linux.git or1k-fpu-regs
head:   ead6248f25e104b2c2b03071d37f2ffdeb1e62e8
commit: ead6248f25e104b2c2b03071d37f2ffdeb1e62e8 [3/3] openrisc: Move FPU state out of pt_regs
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: openrisc-randconfig-r081-20240322 (https://download.01.org/0day-ci/archive/20240322/202403222317.OWCfI67M-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403222317.OWCfI67M-lkp@intel.com/

smatch warnings:
arch/openrisc/kernel/signal.c:50 restore_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/openrisc/kernel/signal.c:67 save_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?

vim +50 arch/openrisc/kernel/signal.c

1c4de499e6134e Stafford Horne 2023-08-20  39  
1c4de499e6134e Stafford Horne 2023-08-20  40  asmlinkage int do_work_pending(struct pt_regs *regs, unsigned int thread_flags,
1c4de499e6134e Stafford Horne 2023-08-20  41  			       int syscall);
1c4de499e6134e Stafford Horne 2023-08-20  42  
ead6248f25e104 Stafford Horne 2024-03-05  43  #ifdef CONFIG_FPU
ead6248f25e104 Stafford Horne 2024-03-05  44  static long restore_fp_state(struct sigcontext __user *sc)
ead6248f25e104 Stafford Horne 2024-03-05  45  {
ead6248f25e104 Stafford Horne 2024-03-05  46  	long err;
ead6248f25e104 Stafford Horne 2024-03-05  47  
ead6248f25e104 Stafford Horne 2024-03-05  48  	err = __copy_from_user(&current->thread.fpcsr, &sc->fpcsr, sizeof(unsigned long));
ead6248f25e104 Stafford Horne 2024-03-05  49  	if (unlikely(err))
ead6248f25e104 Stafford Horne 2024-03-05 @50  		return err;
ead6248f25e104 Stafford Horne 2024-03-05  51  
ead6248f25e104 Stafford Horne 2024-03-05  52  	/* Restore the FPU state */
ead6248f25e104 Stafford Horne 2024-03-05  53  	restore_fpu(current);
ead6248f25e104 Stafford Horne 2024-03-05  54  
ead6248f25e104 Stafford Horne 2024-03-05  55  	return 0;
ead6248f25e104 Stafford Horne 2024-03-05  56  }
ead6248f25e104 Stafford Horne 2024-03-05  57  
ead6248f25e104 Stafford Horne 2024-03-05  58  static long save_fp_state(struct sigcontext __user *sc)
ead6248f25e104 Stafford Horne 2024-03-05  59  {
ead6248f25e104 Stafford Horne 2024-03-05  60  	long err;
ead6248f25e104 Stafford Horne 2024-03-05  61  
ead6248f25e104 Stafford Horne 2024-03-05  62  	/* Sync the user FPU state so we can copy to sigcontext */
ead6248f25e104 Stafford Horne 2024-03-05  63  	save_fpu(current);
ead6248f25e104 Stafford Horne 2024-03-05  64  
ead6248f25e104 Stafford Horne 2024-03-05  65  	err = __copy_to_user(&sc->fpcsr, &current->thread.fpcsr, sizeof(unsigned long));
ead6248f25e104 Stafford Horne 2024-03-05  66  
ead6248f25e104 Stafford Horne 2024-03-05 @67  	return err;
ead6248f25e104 Stafford Horne 2024-03-05  68  }
ead6248f25e104 Stafford Horne 2024-03-05  69  #else
ead6248f25e104 Stafford Horne 2024-03-05  70  #define save_fp_state(sc) (0)
ead6248f25e104 Stafford Horne 2024-03-05  71  #define restore_fp_state(sc) (0)
ead6248f25e104 Stafford Horne 2024-03-05  72  #endif
ead6248f25e104 Stafford Horne 2024-03-05  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
