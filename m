Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3E013FEE
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 01:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732586306; cv=none; b=UZc0yJiF1qBksmRhUwj2Pf9dWih+VxjvUD+vCd3px1sw6rxM1Y2n76jpeWhIA42NBoUbQ6QvO/ttOSEErBgtPBdWk4116pc0k//jXmhKD0EPpmn4pCCO6/guAgY8utkRX8MQYcCDmCJtr89OvpAeGSXqRe4zrnOo0eOXkpnaHNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732586306; c=relaxed/simple;
	bh=37EVhnjPN9YpGJcQo3bV2q07sJv9dEEQgOExlj8yuNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MbhMdOv1mB2J0x95mJ9Hw9Av39mkP21N5x/eNxq44R/MeTb6mvUWez+kYs3YezJWVcrI+UMMPiqJZSOtsFfKF0fuPBD8bEuPV5r/NdAIXglQVUix7e8Uz4tq+ilEtrRf/DgBstmumcwVE+isdV4GKOuxfoiRhtpAI5dhxsEm/Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdH/XVuj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdH/XVuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732586304; x=1764122304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37EVhnjPN9YpGJcQo3bV2q07sJv9dEEQgOExlj8yuNY=;
  b=HdH/XVuj6ysT1SzrTXCh6TjM7/Z/9nIEvzxEvmMw1udZnqVXB9BEoutQ
   DDvlbZ2vSTxeDFrOjDEhoPr7mSrLhjw+nYY9hFjhEgMd8KMOm06YdGlnZ
   INFL62hfu7e63YlewnakvpCh7Z1Crp9akXo0uxXmAnhIU6qTby9rOotRR
   7bqhCaPedatrGGURuZwBPQ4C4tf0AB8LfZzgXhLyRXywbvaOvGUI/RlxR
   uDNqw1kylzHhA/++wfyIRv1zzxmn5k+0+bv16rjGCiQNAEpglkM2Ak6VK
   8MH/VmnyV/DgQU326Itq5oEvRCQ7ZQkFxnvGIZA7Th+15Hv9N0g8Q/Y/Q
   A==;
X-CSE-ConnectionGUID: kno2eBJdQ9uf1GhzGQYiVA==
X-CSE-MsgGUID: rg5JSA2GR0OpPmEHSauknw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32660883"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32660883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 17:58:22 -0800
X-CSE-ConnectionGUID: xMG7j6ksTQel7ZvKducWcg==
X-CSE-MsgGUID: mj7GyiLWSMGc+zeJj6o2Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="122416171"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2024 17:58:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFkqI-0006xr-0u;
	Tue, 26 Nov 2024 01:58:18 +0000
Date: Tue, 26 Nov 2024 09:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/openrisc/kernel/signal.c:50 restore_fp_state() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202411260944.JgpL3P56-lkp@intel.com>
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
TO: Stafford Horne <shorne@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: 4dc70e1aadfadf968676d983587c6f5d455aba85 openrisc: Move FPU state out of pt_regs
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: openrisc-randconfig-r071-20241124 (https://download.01.org/0day-ci/archive/20241126/202411260944.JgpL3P56-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411260944.JgpL3P56-lkp@intel.com/

smatch warnings:
arch/openrisc/kernel/signal.c:50 restore_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?
arch/openrisc/kernel/signal.c:67 save_fp_state() warn: maybe return -EFAULT instead of the bytes remaining?

vim +50 arch/openrisc/kernel/signal.c

1c4de499e6134ec Stafford Horne 2023-08-20  39  
1c4de499e6134ec Stafford Horne 2023-08-20  40  asmlinkage int do_work_pending(struct pt_regs *regs, unsigned int thread_flags,
1c4de499e6134ec Stafford Horne 2023-08-20  41  			       int syscall);
1c4de499e6134ec Stafford Horne 2023-08-20  42  
4dc70e1aadfadf9 Stafford Horne 2024-03-30  43  #ifdef CONFIG_FPU
4dc70e1aadfadf9 Stafford Horne 2024-03-30  44  static long restore_fp_state(struct sigcontext __user *sc)
4dc70e1aadfadf9 Stafford Horne 2024-03-30  45  {
4dc70e1aadfadf9 Stafford Horne 2024-03-30  46  	long err;
4dc70e1aadfadf9 Stafford Horne 2024-03-30  47  
4dc70e1aadfadf9 Stafford Horne 2024-03-30  48  	err = __copy_from_user(&current->thread.fpcsr, &sc->fpcsr, sizeof(unsigned long));
4dc70e1aadfadf9 Stafford Horne 2024-03-30  49  	if (unlikely(err))
4dc70e1aadfadf9 Stafford Horne 2024-03-30 @50  		return err;
4dc70e1aadfadf9 Stafford Horne 2024-03-30  51  
4dc70e1aadfadf9 Stafford Horne 2024-03-30  52  	/* Restore the FPU state */
4dc70e1aadfadf9 Stafford Horne 2024-03-30  53  	restore_fpu(current);
4dc70e1aadfadf9 Stafford Horne 2024-03-30  54  
4dc70e1aadfadf9 Stafford Horne 2024-03-30  55  	return 0;
4dc70e1aadfadf9 Stafford Horne 2024-03-30  56  }
4dc70e1aadfadf9 Stafford Horne 2024-03-30  57  
4dc70e1aadfadf9 Stafford Horne 2024-03-30  58  static long save_fp_state(struct sigcontext __user *sc)
4dc70e1aadfadf9 Stafford Horne 2024-03-30  59  {
4dc70e1aadfadf9 Stafford Horne 2024-03-30  60  	long err;
4dc70e1aadfadf9 Stafford Horne 2024-03-30  61  
4dc70e1aadfadf9 Stafford Horne 2024-03-30  62  	/* Sync the user FPU state so we can copy to sigcontext */
4dc70e1aadfadf9 Stafford Horne 2024-03-30  63  	save_fpu(current);
4dc70e1aadfadf9 Stafford Horne 2024-03-30  64  
4dc70e1aadfadf9 Stafford Horne 2024-03-30  65  	err = __copy_to_user(&sc->fpcsr, &current->thread.fpcsr, sizeof(unsigned long));
4dc70e1aadfadf9 Stafford Horne 2024-03-30  66  
4dc70e1aadfadf9 Stafford Horne 2024-03-30 @67  	return err;
4dc70e1aadfadf9 Stafford Horne 2024-03-30  68  }
4dc70e1aadfadf9 Stafford Horne 2024-03-30  69  #else
4dc70e1aadfadf9 Stafford Horne 2024-03-30  70  #define save_fp_state(sc) (0)
4dc70e1aadfadf9 Stafford Horne 2024-03-30  71  #define restore_fp_state(sc) (0)
4dc70e1aadfadf9 Stafford Horne 2024-03-30  72  #endif
4dc70e1aadfadf9 Stafford Horne 2024-03-30  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
