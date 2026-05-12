Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E722EC090
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609818; cv=none; b=KkucJ440WEWg26aOBgGIxAAU7ijO3xSm83EnmJ9zxTtPXD+l4/VnWRCE721x5a9qPuorVe0rjlPn8N0ihaffovWLh3ykINTz3jQvik1RUaoVNPtbA1r+oKkQNZM7k9eAAR/Rkzh0lBP+CaEWF1+1rNJ2gofxy5dqDA321rDcgNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609818; c=relaxed/simple;
	bh=b4iRVDyLzmOVn1N9ugdDyap63wJYWlsc8XFHyTwR4S4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mbIxbMTH2rAjkws6k5qupTiv2Z+opdf0h6KhnaBKBh0S54mMgLDy6UuktxeKWszjSg4PFtsK1bUt+uSvHnVWcrJSa96CRvWcVAeNzsr1QTW1yROsWR8ZZHr08DVTNv/5+jkOI/BMk1fQvEe1/2SRCH4Q3y0JPaQdUP5NIxEH2CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7eQmRj1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7eQmRj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778609816; x=1810145816;
  h=date:from:to:cc:subject:message-id;
  bh=b4iRVDyLzmOVn1N9ugdDyap63wJYWlsc8XFHyTwR4S4=;
  b=V7eQmRj1M7hIjzPBO07vnjCKxdsVGvWlzFN9EAw7AzPg0VyCieGM9qjt
   aJgtPHAwX0/wrDbgbt72nO23aIIFt+B1kf4Z3PzsFrpnkWp3TFb7phywc
   ede9YRGSkIHKNkjt56uLWaLEQMv35yoVhzID9XXlUtWXCsM8tPnxIpWzy
   7lm+0ntLZXp8y2ZVJaZHlUut835gFod8UF3jRsPmPucbCBiSF10jEF/Zt
   9Hcvm1gSyb4QeZGtxZUgoCfxGzT6nSjasj+d0Q9+MF2tU31sNTOay4Peb
   vWkktZ0fahunzVaWZdYBtCLOib0lZdmJCQfcrUpCBe5xM7IKrB1QvP/WH
   g==;
X-CSE-ConnectionGUID: qL7mul1BS+KnZl6Gv0NomQ==
X-CSE-MsgGUID: rOGesDIASdiH0t7eq9mkHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79243360"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79243360"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:16:56 -0700
X-CSE-ConnectionGUID: +xhsUozcRaqy73mcQ0j2xA==
X-CSE-MsgGUID: 12fx4Q+bTOy6daqVyvnEsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="239654372"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2026 11:16:54 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMrf2-000000002a5-2O6d;
	Tue, 12 May 2026 18:16:52 +0000
Date: Wed, 13 May 2026 02:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:irq/proc 2/16] kernel/irq/proc.c:466:31: sparse:
 sparse: label 'continue' already bound
Message-ID: <202605130239.Js0Zf2Gd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/irq/proc.c:466:31: sparse: sparse: label 'continue' already bound"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@kernel.org>
CC: Dmitry Ilvokhin <d@ilvokhin.com>
CC: Radu Rendec <radu@rendec.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/proc
head:   6aa40b910f0486df6146560b14fd0171437f9b9b
commit: 208dfeb6922a76810177278ed8e6e2d65f81a844 [2/16] genirq/proc: Avoid formatting zero counts in /proc/interrupts
:::::: branch date: 10 hours ago
:::::: commit date: 20 hours ago
config: nios2-randconfig-r123-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130239.Js0Zf2Gd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130239.Js0Zf2Gd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130239.Js0Zf2Gd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/irq/proc.c:466:31: sparse: sparse: label 'continue' already bound
>> kernel/irq/proc.c:466:31: sparse: sparse: label 'break' already bound

vim +/continue +466 kernel/irq/proc.c

a6e120ed42004d6 Thomas Gleixner 2011-03-25  452  
208dfeb6922a768 Thomas Gleixner 2026-04-01  453  /* Same as seq_put_decimal_ull_width(p, " ", cnt, 10) */
208dfeb6922a768 Thomas Gleixner 2026-04-01  454  #define ZSTR1 "          0"
208dfeb6922a768 Thomas Gleixner 2026-04-01  455  #define ZSTR1_LEN	(sizeof(ZSTR1) - 1)
208dfeb6922a768 Thomas Gleixner 2026-04-01  456  #define ZSTR16		ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 \
208dfeb6922a768 Thomas Gleixner 2026-04-01  457  			ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1 ZSTR1
208dfeb6922a768 Thomas Gleixner 2026-04-01  458  #define ZSTR256		ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 \
208dfeb6922a768 Thomas Gleixner 2026-04-01  459  			ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16 ZSTR16
208dfeb6922a768 Thomas Gleixner 2026-04-01  460  
208dfeb6922a768 Thomas Gleixner 2026-04-01  461  static inline void irq_proc_emit_zero_counts(struct seq_file *p, unsigned int zeros)
208dfeb6922a768 Thomas Gleixner 2026-04-01  462  {
208dfeb6922a768 Thomas Gleixner 2026-04-01  463  	if (!zeros)
208dfeb6922a768 Thomas Gleixner 2026-04-01  464  		return;
208dfeb6922a768 Thomas Gleixner 2026-04-01  465  
208dfeb6922a768 Thomas Gleixner 2026-04-01 @466  	for (unsigned int n = min(zeros, 256); n; zeros -= n, n = min(zeros, 256))
208dfeb6922a768 Thomas Gleixner 2026-04-01  467  		seq_write(p, ZSTR256, n * ZSTR1_LEN);
208dfeb6922a768 Thomas Gleixner 2026-04-01  468  }
208dfeb6922a768 Thomas Gleixner 2026-04-01  469  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
