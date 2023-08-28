Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F0654
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Aug 2023 03:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693192589; x=1724728589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pfL4h6ArUc+yj/tHgtrkPvsCEL8XQgSfAmOVArMAdd8=;
  b=kuAkDDlzrbj/X8GvdreTVB0dxlYpQTkx2YlX3JG5FDZXn6iKnCAStQyE
   /Gs2c9ayY+ztAyAjRsJtTq+vYSp3UGw3wHReT/hqU6334tU3jOHg3L+pO
   hb3HYz9NYIincSo4RCVG0WLlByfV+Ho5zeGt6WwXOWcX7OguvZmWieNpg
   ZjB0jU+dcNoqd6q2aEhjZ2YBI+6xNU2sOLtDkh5ZfSIITDsjo6fBIFhrx
   XKnfEas1m/zfklETgZnwYIQtQnTMPrbjRXNWOxVUfcQIA3gm1RvCGwz4e
   EwUqO2uCmRWql2jAg4mlfRKqPbOLFGj5iGRRtuisX5IylisZ4W6xBhc4N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="359994936"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="359994936"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 20:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="911878706"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="911878706"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Aug 2023 20:16:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaSjq-0006Rj-1J;
	Mon, 28 Aug 2023 03:16:26 +0000
Date: Mon, 28 Aug 2023 11:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rt-devel:linux-6.1.y-rt-rebase 21/51] kernel/printk/printk.c:2468
 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy
Message-ID: <202308281100.1LIdaKaP-lkp@intel.com>
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
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.1.y-rt-rebase
head:   90d96fee668dc306dd748393383c0fc74b798eee
commit: cf8dd889ea20ae7091d3b27029b07bef13298291 [21/51] serial: 8250: implement write_atomic
:::::: branch date: 6 months ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20230828 (https://download.01.org/0day-ci/archive/20230828/202308281100.1LIdaKaP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281100.1LIdaKaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308281100.1LIdaKaP-lkp@intel.com/

smatch warnings:
kernel/printk/printk.c:2468 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy

vim +2468 kernel/printk/printk.c

09cbc4e64a7546 John Ogness 2022-02-04  2463  
09cbc4e64a7546 John Ogness 2022-02-04  2464  static int __alloc_atomic_data(struct console_atomic_data *d, short flags)
09cbc4e64a7546 John Ogness 2022-02-04  2465  {
09cbc4e64a7546 John Ogness 2022-02-04  2466  	d->text = kmalloc(CONSOLE_LOG_MAX, GFP_KERNEL);
09cbc4e64a7546 John Ogness 2022-02-04  2467  	if (!d->text)
09cbc4e64a7546 John Ogness 2022-02-04 @2468  		return -1;
09cbc4e64a7546 John Ogness 2022-02-04  2469  
09cbc4e64a7546 John Ogness 2022-02-04  2470  	if (flags & CON_EXTENDED) {
09cbc4e64a7546 John Ogness 2022-02-04  2471  		d->ext_text = kmalloc(CONSOLE_EXT_LOG_MAX, GFP_KERNEL);
09cbc4e64a7546 John Ogness 2022-02-04  2472  		if (!d->ext_text)
09cbc4e64a7546 John Ogness 2022-02-04  2473  			return -1;
09cbc4e64a7546 John Ogness 2022-02-04  2474  	} else {
09cbc4e64a7546 John Ogness 2022-02-04  2475  		d->dropped_text = kmalloc(DROPPED_TEXT_MAX, GFP_KERNEL);
09cbc4e64a7546 John Ogness 2022-02-04  2476  		if (!d->dropped_text)
09cbc4e64a7546 John Ogness 2022-02-04  2477  			return -1;
09cbc4e64a7546 John Ogness 2022-02-04  2478  	}
09cbc4e64a7546 John Ogness 2022-02-04  2479  
09cbc4e64a7546 John Ogness 2022-02-04  2480  	return 0;
09cbc4e64a7546 John Ogness 2022-02-04  2481  }
09cbc4e64a7546 John Ogness 2022-02-04  2482  

:::::: The code at line 2468 was first introduced by commit
:::::: 09cbc4e64a7546900af52b0007997930b37bfeb4 printk: add infrastucture for atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
