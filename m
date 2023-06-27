Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0713064
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jun 2023 17:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687887316; x=1719423316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Py23giblmkXIEch8hQxI75EbHTvfxjbzBeaW0aJ2Y+c=;
  b=biw40nsWoD3J02V81Pky4fEDBEJ2LRgV7TB9D5hWc3O064Ba62MJk6Ki
   Oh234YtkEotQhwFKbcpDPGEoM1ulQs0jKHa5ofApdQ6sLF0B7rhi1tVhI
   8JV/jB+g6dNkDIcEikH8z5lIo53EYWcsFX3DHuj/tqw5/rjqZWjdtCFfi
   wRvh8RdkCCRw59Ig4eQ3qgGMskE4AJSSObnvGfvGS3WxA+iZbRrUo9LhL
   LPxYp5h3yaeDonjpsxlrwsvSLJwexUHxLdCHwjAon/hqoVDebOUmhXb0z
   l10CnAhEOZ/wynd8X7DzOsWK66T3j6NivdpFkQSuIXPzapxPTflhpqQSO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361679348"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="361679348"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 10:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="751837668"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="751837668"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Jun 2023 10:35:14 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qECav-000C6H-1M;
	Tue, 27 Jun 2023 17:35:13 +0000
Date: Wed, 28 Jun 2023 01:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/parisc/kernel/firmware.c:1271 pdc_soft_power_button_panic()
 error: uninitialized symbol 'flags'.
Message-ID: <202306280119.wLzufyey-lkp@intel.com>
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
head:   1ef6663a587ba3e57dc5065a477db1c64481eedd
commit: 829632dae8321787525ee37dc4828bbe6edafdae parisc: Replace regular spinlock with spin_trylock on panic path
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: parisc-randconfig-m031-20230627 (https://download.01.org/0day-ci/archive/20230628/202306280119.wLzufyey-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280119.wLzufyey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306280119.wLzufyey-lkp@intel.com/

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
