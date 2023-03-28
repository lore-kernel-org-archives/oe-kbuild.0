Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0DE4C4
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Mar 2023 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679996526; x=1711532526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ryICEvj5OMmk1l1K9LRy4YU7ajDGGU19UexHPoQu2pQ=;
  b=HRsFUj470Wx0jspO4+025pU4M0h67KamrZefoTA50xXuKRdqUZajGelm
   v8MnOgN5MjPY//T3Z6Stvdq7FICcIuSW/4++FgkjIppci2aEKYOZiFuJH
   66fn8SJiibrcL0ENSumOY28HmxqWEhLIinlVvEOuA84IBUg25TNPU16QE
   qrr0mBWp717qFBsMW4QP7wrTyLG4q8kyzv2RzfH47kbL9riKZ43oPSUJd
   38t6Y2AZBmjw8FBiITyXFqNW2CliKz1aNO94LA0F2/6ayZtaCz/zkNYrl
   VVGodMDlzoFgtfcTnjOFfeRUri+vNJ6+uSHKIYhUxDPuGGV1Am/cj/QxP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324416441"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="324416441"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 02:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="753070962"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="753070962"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2023 02:42:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph5q2-000IRH-1q;
	Tue, 28 Mar 2023 09:41:58 +0000
Date: Tue, 28 Mar 2023 17:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 646/7309] arch/parisc/kernel/firmware.c:1271
 pdc_soft_power_button_panic() error: uninitialized symbol 'flags'.
Message-ID: <202303281743.gzT66f6u-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6faf7ea9fcb7267d06116d4188947f26e00e57e
commit: cf559f6a9e3a7228f402dc43cff08d0a47ee8b7c [646/7309] parisc: Replace regular spinlock with spin_trylock on panic path
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: parisc-randconfig-m031-20230326 (https://download.01.org/0day-ci/archive/20230328/202303281743.gzT66f6u-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303281743.gzT66f6u-lkp@intel.com/

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
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1260  int pdc_soft_power_button_panic(int sw_control)
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1261  {
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1262  	int retval;
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1263  	unsigned long flags;
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1264  
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1265  	if (!spin_trylock_irqsave(&pdc_lock, flags)) {
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1266  		pr_emerg("Couldn't enable soft power button\n");
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1267  		return -EBUSY; /* ignored by the panic notifier */
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1268  	}
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1269  
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1270  	retval = mem_pdc_call(PDC_SOFT_POWER, PDC_SOFT_POWER_ENABLE, __pa(pdc_result), sw_control);
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20 @1271  	spin_unlock_irqrestore(&pdc_lock, flags);
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1272  
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1273  	return retval;
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1274  }
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
