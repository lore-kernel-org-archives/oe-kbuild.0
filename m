Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46DB257E
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 06:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674108518; x=1705644518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1MV/+tbtakTtcwltUwhrqS1yilXLzqgQcOj/jVtgMZ8=;
  b=V+lveF/CnbOkPDrM22Ih04McyacmF8ETgEWevNCrr1rXdxcptOhTM3/s
   gJ6SgW3xd+w8HeQnMRax2h1DqOxj6KbZAk7lZlfkKCqcPAQIt712qcvxO
   E9kJIMiKntzWsy+CqUjyNPqnnApDICyCei32owoZ9vC4lGYfd7G2qKEb5
   fN5JlmdYHnQNsorf/7LkrZU4KhUq5XHDflV9NVDKz55J/kNgGyb30LXB6
   I+wpn3DRAsBDREXFnhSUBZXIoVKwNWWz/nOVeedLD+z8d1ZZF9vmkuIMz
   t8MCrzgXYHvJYaVe0uD8fbwjvUKxeZgTTkQBb6myDDQP41m+BPNAumyAW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352460956"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="352460956"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 22:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="660078435"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="660078435"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2023 22:08:36 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIO6G-0001Ba-0X;
	Thu, 19 Jan 2023 06:08:36 +0000
Date: Thu, 19 Jan 2023 14:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rt-devel:linux-6.2.y-rt-rebase 14/46]
 kernel/printk/printk.c:2903:13: warning: 'console_is_usable_unlocked'
 defined but not used
Message-ID: <202301191434.kRWtbfc2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.2.y-rt-rebase
head:   bee0efc1fe1add1df7d677cee5a9c4c325196403
commit: 5342b8e20b15e5fb37e49de2435e62dd00ff20fe [14/46] printk: Bring back the RT bits.
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230119/202301191434.kRWtbfc2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=5342b8e20b15e5fb37e49de2435e62dd00ff20fe
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.2.y-rt-rebase
        git checkout 5342b8e20b15e5fb37e49de2435e62dd00ff20fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:2903:13: warning: 'console_is_usable_unlocked' defined but not used [-Wunused-function]
    2903 | static bool console_is_usable_unlocked(struct console *con)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/console_is_usable_unlocked +2903 kernel/printk/printk.c

a8199371afc279 Sergey Senozhatsky        2016-03-17  2902  
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19 @2903  static bool console_is_usable_unlocked(struct console *con)
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2904  {
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2905  	int cookie;
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2906  	bool ret;
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2907  
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2908  	cookie = console_srcu_read_lock();
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2909  	ret = console_is_usable(con);
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2910  	console_srcu_read_unlock(cookie);
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2911  
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2912  	return ret;
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2913  }
5342b8e20b15e5 Sebastian Andrzej Siewior 2022-07-19  2914  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
