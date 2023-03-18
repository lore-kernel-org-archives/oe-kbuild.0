Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF102F30
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 20:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679172595; x=1710708595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7kA/L8G+zA73LSCOqMF4htu8ieksg07uZiURfjfZvvE=;
  b=l7ZJg7Ei1A+2Y8doa9PCWLJwgwnalE8EGrV8KrWKaCQQH0Iwp6ch+XFh
   q3FaYWs2rfgbuE08xvETyAZzLQ4yDFZI4sNBzDtONxrJp1CdIpxNB1wtg
   yTh/51tPCtfJJy4NH7lUqWaJxjIHyOx4hT4tVipFxU1pSet9wUBXKeJt6
   T0OhklWJmpmGwFZRS5/4CSKACR1pPPBw7LfB10awGs0v0RlVebqJ/NW8y
   uNDaYq4xwDiu1wbZSkVCPajVhKYDtK1mahKzW3TaanXryUHEo9TrkHQip
   yu/uaesYxVhay7IbZSxvod/VrFXAgefm0WPIiawT5oIPkTYL3JUCGwfd8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="401037179"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="401037179"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 13:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="673924905"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="673924905"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Mar 2023 13:49:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pddUv-000AGm-2N;
	Sat, 18 Mar 2023 20:49:53 +0000
Date: Sun, 19 Mar 2023 04:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rt-devel:linux-6.1.y-rt-rebase 21/51] kernel/printk/printk.c:2468
 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy
Message-ID: <202303190425.BybcKB4L-lkp@intel.com>
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
:::::: branch date: 4 weeks ago
:::::: commit date: 5 months ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230319/202303190425.BybcKB4L-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303190425.BybcKB4L-lkp@intel.com/

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
https://github.com/intel/lkp-tests
