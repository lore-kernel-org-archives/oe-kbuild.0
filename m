Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A521DDE9
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689895600; x=1721431600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U7pca+uiwyYODUeBz09vT/zHAnKwH7qckIlh4iGXpBI=;
  b=PX9zfrNynJobxC5cHxnzlCUVBln9eDzmeJkmTzlZ0Dv11LcoD3i9R8NY
   u//nu++1JjdThiYHnbeK4YhpyM57+fOwm/KBMpVF6VKkew1mU46yOmUaN
   eMNWh762pn7OBbyAZ/NyCINEpsPTsZegzdmkXFJtaHxpGMv7q/zK4JpT/
   Mq/+F1MiD5SwlNB/D5IXdponothdZUvYMEmKrlDmf2jDSeikVekNYeNiG
   OAvD6lmFax7H2ACigcq8X4gfeT+68/q6R/Hx8rgCDUxZLX8/K37LbsO6Q
   OPQOmAmWrr/cdi2olmK89vO71i123s/x3RTjW/hptxybalqDZon63UxcK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="453265794"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="453265794"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 16:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814731286"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="814731286"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 16:26:38 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMd2T-0006cm-32;
	Thu, 20 Jul 2023 23:26:32 +0000
Date: Fri, 21 Jul 2023 07:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/parisc/kernel/firmware.c:1271 pdc_soft_power_button_panic()
 error: uninitialized symbol 'flags'.
Message-ID: <202307210759.Bf0gxBwJ-lkp@intel.com>
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
head:   57f1f9dd3abea322173ea75a15887ccf14bbbe51
commit: 829632dae8321787525ee37dc4828bbe6edafdae parisc: Replace regular spinlock with spin_trylock on panic path
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: parisc-randconfig-m041-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210759.Bf0gxBwJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210759.Bf0gxBwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307210759.Bf0gxBwJ-lkp@intel.com/

New smatch warnings:
arch/parisc/kernel/firmware.c:1271 pdc_soft_power_button_panic() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/parisc/kernel/firmware.c:779 pdc_stable_read() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:805 pdc_stable_write() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:830 pdc_stable_get_size() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:850 pdc_stable_verify_contents() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:869 pdc_stable_initialize() warn: inconsistent indenting

vim +/flags +1271 arch/parisc/kernel/firmware.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  1259  
829632dae83217 Guilherme G. Piccoli 2023-02-20  1260  int pdc_soft_power_button_panic(int sw_control)
829632dae83217 Guilherme G. Piccoli 2023-02-20  1261  {
829632dae83217 Guilherme G. Piccoli 2023-02-20  1262  	int retval;
829632dae83217 Guilherme G. Piccoli 2023-02-20  1263  	unsigned long flags;
829632dae83217 Guilherme G. Piccoli 2023-02-20  1264  
829632dae83217 Guilherme G. Piccoli 2023-02-20  1265  	if (!spin_trylock_irqsave(&pdc_lock, flags)) {
829632dae83217 Guilherme G. Piccoli 2023-02-20  1266  		pr_emerg("Couldn't enable soft power button\n");
829632dae83217 Guilherme G. Piccoli 2023-02-20  1267  		return -EBUSY; /* ignored by the panic notifier */
829632dae83217 Guilherme G. Piccoli 2023-02-20  1268  	}
829632dae83217 Guilherme G. Piccoli 2023-02-20  1269  
829632dae83217 Guilherme G. Piccoli 2023-02-20  1270  	retval = mem_pdc_call(PDC_SOFT_POWER, PDC_SOFT_POWER_ENABLE, __pa(pdc_result), sw_control);
829632dae83217 Guilherme G. Piccoli 2023-02-20 @1271  	spin_unlock_irqrestore(&pdc_lock, flags);
829632dae83217 Guilherme G. Piccoli 2023-02-20  1272  
829632dae83217 Guilherme G. Piccoli 2023-02-20  1273  	return retval;
829632dae83217 Guilherme G. Piccoli 2023-02-20  1274  }
829632dae83217 Guilherme G. Piccoli 2023-02-20  1275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
