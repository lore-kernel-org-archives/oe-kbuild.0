Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF59DA3C
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 22:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676933313; x=1708469313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Puhb0j8jsMVPEertd7jPb1TUrGclDxD6/MnlgfllIBE=;
  b=UmZNgQhGCT+NHs47cjPA2jWNuB6M1usgaAFlbjdB/QmjAarAMOE6Tyd4
   CVLUY9YnogIWwKFunxkxluuMY1m9NLPccHoGFHjJYO2UKqkudIcEE+ANl
   eepqJag8aNukRbaSqhw+ZJo9vjbPJRHN9XJQGiFNQ71aAljzmmynxa3Zi
   rZJFiwXoGp9nOFvE0gHtNHErgrVSqxiEdMEt+4OCz6LjFX+bRCtlqkYfr
   l2Ag3keE2JBBy7rKn6zaeYcCmngiCF1zNSYoOM3lm9+lyjzN/4mkAN8Fw
   zwNZwm68G/NrS2sakAI21goatgR7P+BueI5y4vxYYfHBwvZneYnH3dlRG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397184340"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="397184340"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 14:48:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="1000394244"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="1000394244"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Feb 2023 14:48:32 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUExT-000EE5-1w;
	Mon, 20 Feb 2023 22:48:31 +0000
Date: Tue, 21 Feb 2023 06:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rt-devel:for-kbuild-bot/current-stable 16/46]
 kernel/printk/printk.c:2564 __alloc_atomic_data() warn: returning -1 instead
 of -ENOMEM is sloppy
Message-ID: <202302210645.YB95YQ5f-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git for-kbuild-bot/current-stable
head:   d78e0b728f7e392e2464b7c44a8cd4bb616953dd
commit: 242c5dded5cbd28bdea393f054f8981dafe76071 [16/46] serial: 8250: implement write_atomic
:::::: branch date: 7 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230221/202302210645.YB95YQ5f-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302210645.YB95YQ5f-lkp@intel.com/

smatch warnings:
kernel/printk/printk.c:2564 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy

vim +2564 kernel/printk/printk.c

20fce529c29a99 John Ogness 2022-02-04  2559  
20fce529c29a99 John Ogness 2022-02-04  2560  static int __alloc_atomic_data(struct console_atomic_data *d, short flags)
20fce529c29a99 John Ogness 2022-02-04  2561  {
20fce529c29a99 John Ogness 2022-02-04  2562  	d->text = kmalloc(CONSOLE_LOG_MAX, GFP_KERNEL);
20fce529c29a99 John Ogness 2022-02-04  2563  	if (!d->text)
20fce529c29a99 John Ogness 2022-02-04 @2564  		return -1;
20fce529c29a99 John Ogness 2022-02-04  2565  
20fce529c29a99 John Ogness 2022-02-04  2566  	if (flags & CON_EXTENDED) {
20fce529c29a99 John Ogness 2022-02-04  2567  		d->ext_text = kmalloc(CONSOLE_EXT_LOG_MAX, GFP_KERNEL);
20fce529c29a99 John Ogness 2022-02-04  2568  		if (!d->ext_text)
20fce529c29a99 John Ogness 2022-02-04  2569  			return -1;
20fce529c29a99 John Ogness 2022-02-04  2570  	} else {
20fce529c29a99 John Ogness 2022-02-04  2571  		d->dropped_text = kmalloc(DROPPED_TEXT_MAX, GFP_KERNEL);
20fce529c29a99 John Ogness 2022-02-04  2572  		if (!d->dropped_text)
20fce529c29a99 John Ogness 2022-02-04  2573  			return -1;
20fce529c29a99 John Ogness 2022-02-04  2574  	}
20fce529c29a99 John Ogness 2022-02-04  2575  
20fce529c29a99 John Ogness 2022-02-04  2576  	return 0;
20fce529c29a99 John Ogness 2022-02-04  2577  }
20fce529c29a99 John Ogness 2022-02-04  2578  

:::::: The code at line 2564 was first introduced by commit
:::::: 20fce529c29a99acb086ce780a16b35023d802b5 printk: add infrastucture for atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
