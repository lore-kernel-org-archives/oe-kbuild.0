Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773E4443A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 17:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683827323; x=1715363323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tb6rHfVFZz6UEDvc65c12xpSaEB7OsXEpwVv06w8L64=;
  b=PEftrrtf08mxp4SA9ZwtibOUKOz5QxVNqdEdVCuMF2N3FBnIjzxZEHiv
   IbTJcrx9bSJvU7uTN3qRPJgfLJZaW9NAdT5EBGLaK9CQwUHPJ7QcaMmtK
   fotc9mQ2L7kd/wqIchQHhuXaZBbRjV8VoSay3lQiUTi8Pi4647Viuu+Up
   x/nBUJjdji3pAx9XcGZGtwoeuktjCViTWkYnq1GnYAEJ07ISzc0y1jGKE
   lZriNlLU+oQDpE96I9vzBT9CAAZWeHU7Q5DO/mT6BNnQHoXwRBrlsmucy
   YGPdjWBamMR70dR1egyeTspW+9kXs9LU+xAkJcvpeIgkeOneTS0s8iF5x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="330936804"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="330936804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 10:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730466086"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="730466086"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 May 2023 10:48:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxAPA-0004AQ-1W;
	Thu, 11 May 2023 17:48:40 +0000
Date: Fri, 12 May 2023 01:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/parisc/kernel/firmware.c:1271 pdc_soft_power_button_panic()
 error: uninitialized symbol 'flags'.
Message-ID: <202305120100.oE1HWWY5-lkp@intel.com>
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
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   105131df9c3b27673392a6b7ff356360188dc869
commit: 829632dae8321787525ee37dc4828bbe6edafdae parisc: Replace regular spinlock with spin_trylock on panic path
date:   8 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 days ago
config: parisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230512/202305120100.oE1HWWY5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305120100.oE1HWWY5-lkp@intel.com/

New smatch warnings:
arch/parisc/kernel/firmware.c:1271 pdc_soft_power_button_panic() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/parisc/kernel/firmware.c:779 pdc_stable_read() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:805 pdc_stable_write() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:830 pdc_stable_get_size() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:850 pdc_stable_verify_contents() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:869 pdc_stable_initialize() warn: inconsistent indenting

vim +/flags +1271 arch/parisc/kernel/firmware.c

^1da177e4c3f415 Linus Torvalds       2005-04-16  1259  
829632dae832178 Guilherme G. Piccoli 2023-02-20  1260  int pdc_soft_power_button_panic(int sw_control)
829632dae832178 Guilherme G. Piccoli 2023-02-20  1261  {
829632dae832178 Guilherme G. Piccoli 2023-02-20  1262  	int retval;
829632dae832178 Guilherme G. Piccoli 2023-02-20  1263  	unsigned long flags;
829632dae832178 Guilherme G. Piccoli 2023-02-20  1264  
829632dae832178 Guilherme G. Piccoli 2023-02-20  1265  	if (!spin_trylock_irqsave(&pdc_lock, flags)) {
829632dae832178 Guilherme G. Piccoli 2023-02-20  1266  		pr_emerg("Couldn't enable soft power button\n");
829632dae832178 Guilherme G. Piccoli 2023-02-20  1267  		return -EBUSY; /* ignored by the panic notifier */
829632dae832178 Guilherme G. Piccoli 2023-02-20  1268  	}
829632dae832178 Guilherme G. Piccoli 2023-02-20  1269  
829632dae832178 Guilherme G. Piccoli 2023-02-20  1270  	retval = mem_pdc_call(PDC_SOFT_POWER, PDC_SOFT_POWER_ENABLE, __pa(pdc_result), sw_control);
829632dae832178 Guilherme G. Piccoli 2023-02-20 @1271  	spin_unlock_irqrestore(&pdc_lock, flags);
829632dae832178 Guilherme G. Piccoli 2023-02-20  1272  
829632dae832178 Guilherme G. Piccoli 2023-02-20  1273  	return retval;
829632dae832178 Guilherme G. Piccoli 2023-02-20  1274  }
829632dae832178 Guilherme G. Piccoli 2023-02-20  1275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
