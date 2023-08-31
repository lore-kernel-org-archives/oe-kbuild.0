Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374AF33D7
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Aug 2023 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693469978; x=1725005978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21QmwLlqv2rl04+IorHSGel/dRvO+kvk0wIVQJT3zrA=;
  b=Ri+8PrCMIWwcyykkjhPJ2vsyg7o8k3qrEyKDMtBnRlo1xMTSBE2ZI/w9
   A+VqtxE+upCO1Xrhs97W/N8sRv7S6GuNueAmL5xdSmsjTXg7sjA2T5ps+
   B8dwuph6tB/F3anO3XWIYmH9OFG9y93DZcrNC+llDxZvZJn/NNM5rugC/
   b/8MFXqf8aMeD7PNfYGGrXj/ztyzCXUcwUylkzkWyfJ6Lhx20YtT/W0H1
   oGbKHK71fymY47SVyelheHb27M4U1iQw+UeIPSjWoDyVVQc7xb/JRrI6l
   /L8hqZPIHFFrWbdDwGe7rlmRExuRAaQ98JjrKxFLzL54E6tvB0kdbOM+S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360848681"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="360848681"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 01:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="829567000"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="829567000"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2023 01:19:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbcth-000B6v-0W;
	Thu, 31 Aug 2023 08:19:25 +0000
Date: Thu, 31 Aug 2023 16:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] init: fix -Wmissing-variable-declarations clang warning
Message-ID: <202308311617.uiCprYSL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230830-missingvardecl2-init-main-c-v1-1-59007a637259@google.com>
References: <20230830-missingvardecl2-init-main-c-v1-1-59007a637259@google.com>
TO: Justin Stitt <justinstitt@google.com>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <ndesaulniers@google.com>
TO: Tom Rix <trix@redhat.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Peter Zijlstra <peterz@infradead.org>
CC: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
CC: Justin Stitt <justinstitt@google.com>

Hi Justin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 706a741595047797872e669b3101429ab8d378ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Justin-Stitt/init-fix-Wmissing-variable-declarations-clang-warning/20230831-042021
base:   706a741595047797872e669b3101429ab8d378ef
patch link:    https://lore.kernel.org/r/20230830-missingvardecl2-init-main-c-v1-1-59007a637259%40google.com
patch subject: [PATCH] init: fix -Wmissing-variable-declarations clang warning
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311617.uiCprYSL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311617.uiCprYSL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308311617.uiCprYSL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> init/do_mounts_initrd.c:102:53: error: passing 'const char *[]' to parameter of type 'char **' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           info = call_usermodehelper_setup("/linuxrc", argv, envp_init,
                                                              ^~~~~~~~~
   include/linux/umh.h:37:65: note: passing argument to parameter 'envp' here
   call_usermodehelper_setup(const char *path, char **argv, char **envp,
                                                                   ^
   1 error generated.


vim +102 init/do_mounts_initrd.c

^1da177e4c3f415 Linus Torvalds     2005-04-16   85  
c8643c72bc42781 Christoph Hellwig  2023-05-31   86  static void __init handle_initrd(char *root_device_name)
^1da177e4c3f415 Linus Torvalds     2005-04-16   87  {
907ed1328d2a748 Lucas De Marchi    2013-04-30   88  	struct subprocess_info *info;
ba4df2808a86f8b Al Viro            2012-10-02   89  	static char *argv[] = { "linuxrc", NULL, };
^1da177e4c3f415 Linus Torvalds     2005-04-16   90  	int error;
^1da177e4c3f415 Linus Torvalds     2005-04-16   91  
9acc17baf1fd636 Christoph Hellwig  2020-07-08   92  	pr_warn("using deprecated initrd support, will be removed in 2021.\n");
9acc17baf1fd636 Christoph Hellwig  2020-07-08   93  
^1da177e4c3f415 Linus Torvalds     2005-04-16   94  	real_root_dev = new_encode_dev(ROOT_DEV);
bdaf8529385d512 Greg Kroah-Hartman 2005-06-20   95  	create_dev("/dev/root.old", Root_RAM0);
^1da177e4c3f415 Linus Torvalds     2005-04-16   96  	/* mount initrd on rootfs' /root */
c8643c72bc42781 Christoph Hellwig  2023-05-31   97  	mount_root_generic("/dev/root.old", root_device_name,
c8643c72bc42781 Christoph Hellwig  2023-05-31   98  			   root_mountflags & ~MS_RDONLY);
83ff98c3e9cd2b8 Christoph Hellwig  2020-07-22   99  	init_mkdir("/old", 0700);
db63f1e31538459 Christoph Hellwig  2020-07-22  100  	init_chdir("/old");
^1da177e4c3f415 Linus Torvalds     2005-04-16  101  
907ed1328d2a748 Lucas De Marchi    2013-04-30 @102  	info = call_usermodehelper_setup("/linuxrc", argv, envp_init,
907ed1328d2a748 Lucas De Marchi    2013-04-30  103  					 GFP_KERNEL, init_linuxrc, NULL, NULL);
907ed1328d2a748 Lucas De Marchi    2013-04-30  104  	if (!info)
907ed1328d2a748 Lucas De Marchi    2013-04-30  105  		return;
1fbcaa923ce2d7e Peter Zijlstra     2022-08-22  106  	call_usermodehelper_exec(info, UMH_WAIT_PROC|UMH_FREEZABLE);
^1da177e4c3f415 Linus Torvalds     2005-04-16  107  
^1da177e4c3f415 Linus Torvalds     2005-04-16  108  	/* move initrd to rootfs' /old */
c60166f04283ffb Christoph Hellwig  2020-07-21  109  	init_mount("..", ".", NULL, MS_MOVE, NULL);
^1da177e4c3f415 Linus Torvalds     2005-04-16  110  	/* switch root and cwd back to / of rootfs */
4b7ca5014cbef51 Christoph Hellwig  2020-07-22  111  	init_chroot("..");
^1da177e4c3f415 Linus Torvalds     2005-04-16  112  
^1da177e4c3f415 Linus Torvalds     2005-04-16  113  	if (new_decode_dev(real_root_dev) == Root_RAM0) {
db63f1e31538459 Christoph Hellwig  2020-07-22  114  		init_chdir("/old");
^1da177e4c3f415 Linus Torvalds     2005-04-16  115  		return;
^1da177e4c3f415 Linus Torvalds     2005-04-16  116  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  117  
db63f1e31538459 Christoph Hellwig  2020-07-22  118  	init_chdir("/");
^1da177e4c3f415 Linus Torvalds     2005-04-16  119  	ROOT_DEV = new_decode_dev(real_root_dev);
c8643c72bc42781 Christoph Hellwig  2023-05-31  120  	mount_root(root_device_name);
^1da177e4c3f415 Linus Torvalds     2005-04-16  121  
^1da177e4c3f415 Linus Torvalds     2005-04-16  122  	printk(KERN_NOTICE "Trying to move old root to /initrd ... ");
c60166f04283ffb Christoph Hellwig  2020-07-21  123  	error = init_mount("/old", "/root/initrd", NULL, MS_MOVE, NULL);
^1da177e4c3f415 Linus Torvalds     2005-04-16  124  	if (!error)
^1da177e4c3f415 Linus Torvalds     2005-04-16  125  		printk("okay\n");
^1da177e4c3f415 Linus Torvalds     2005-04-16  126  	else {
f220ab2a5162c35 Jay Lan            2005-06-30  127  		if (error == -ENOENT)
f220ab2a5162c35 Jay Lan            2005-06-30  128  			printk("/initrd does not exist. Ignored.\n");
f220ab2a5162c35 Jay Lan            2005-06-30  129  		else
^1da177e4c3f415 Linus Torvalds     2005-04-16  130  			printk("failed\n");
^1da177e4c3f415 Linus Torvalds     2005-04-16  131  		printk(KERN_NOTICE "Unmounting old root\n");
09267defa36aaff Christoph Hellwig  2020-07-23  132  		init_umount("/old", MNT_DETACH);
^1da177e4c3f415 Linus Torvalds     2005-04-16  133  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  134  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
