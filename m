Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD7936C
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Feb 2023 01:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675906884; x=1707442884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jVKHNbIwEYqKYfrs4zq4S727Heib7jonu8jLB1mtXxU=;
  b=WIUdfEh13KvytEGx406LvVZbr45U58EUi99FoWaqPwv+5PimT6YQFAxV
   NplpAXqYteEYNb2ooQ5g4N8UZF/OI7F/E/diSJM96ZyEc80pkUf9MQsMD
   e7suCq2j+7s8vOe+6uvYbadAYMtvJAim4b3AiEd6QCQDxCD0BDIlYouq0
   O89md348zFMSbpkSWD8+3L4MsjCz0TIn6bcQGvQIebxQ3ykPN1i6rRzXU
   ag2jSuUX0xHNjveKhb+Q+g7aJfzDaejDxHJrBqkmuOUzmY0gP4NgG0Y4L
   oeiKlHJrqiiRhjTSXi0Eu4cfFiRisBsnUwl/HzdFhjk2mO1C1LdBriMlf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416202808"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="416202808"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 17:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="731079651"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="731079651"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Feb 2023 17:41:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPvw7-0004kO-2S;
	Thu, 09 Feb 2023 01:41:19 +0000
Date: Thu, 9 Feb 2023 09:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [song-md:new_module_alloc_build_test 1/1]
 kernel/module/main.c:2607:1-11: second lock on line 2620
Message-ID: <202302090929.h71piQ7H-lkp@intel.com>
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
CC: linux-raid@vger.kernel.org
TO: Song Liu <song@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/song/md.git new_module_alloc_build_test
head:   d63bee3fea6c9ac940de7b3725bf9adf7050a430
commit: d63bee3fea6c9ac940de7b3725bf9adf7050a430 [1/1] module: replace module_layout with module_memory
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-c031-20230209 (https://download.01.org/0day-ci/archive/20230209/202302090929.h71piQ7H-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>

| Link: https://lore.kernel.org/r/202302090929.h71piQ7H-lkp@intel.com

cocci warnings: (new ones prefixed by >>)
>> kernel/module/main.c:2607:1-11: second lock on line 2620
   kernel/module/main.c:1243:1-11: second lock on line 1263
   kernel/module/main.c:2914:1-11: second lock on line 2930
--
>> kernel/module/main.c:2646:1-7: preceding lock on line 2607

vim +2607 kernel/module/main.c

34e1169d996ab1 kernel/module.c      Kees Cook      2012-10-16  2594  
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2595  /*
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2596   * We try to place it in the list now to make sure it's unique before
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2597   * we dedicate too many resources.  In particular, temporary percpu
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2598   * memory exhaustion.
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2599   */
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2600  static int add_unformed_module(struct module *mod)
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2601  {
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2602  	int err;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2603  	struct module *old;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2604  
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2605  	mod->state = MODULE_STATE_UNFORMED;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2606  
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21 @2607  	mutex_lock(&module_mutex);
4f6de4d51f4a3a kernel/module.c      Mathias Krause 2013-07-02  2608  	old = find_module_all(mod->name, strlen(mod->name), true);
4f6de4d51f4a3a kernel/module.c      Mathias Krause 2013-07-02  2609  	if (old != NULL) {
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2610  		if (old->state == MODULE_STATE_COMING
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2611  		    || old->state == MODULE_STATE_UNFORMED) {
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2612  			/* Wait in case it fails to load. */
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2613  			mutex_unlock(&module_mutex);
9cc019b8c94fa5 kernel/module.c      Peter Zijlstra 2015-02-11  2614  			err = wait_event_interruptible(module_wq,
9cc019b8c94fa5 kernel/module.c      Peter Zijlstra 2015-02-11  2615  					       finished_loading(mod->name));
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2616  			if (err)
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2617  				goto out_unlocked;
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2618  
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2619  			/* The module might have gone in the meantime. */
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05 @2620  			mutex_lock(&module_mutex);
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2621  			old = find_module_all(mod->name, strlen(mod->name),
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2622  					      true);
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2623  		}
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2624  
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2625  		/*
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2626  		 * We are here only when the same module was being loaded. Do
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2627  		 * not try to load it again right now. It prevents long delays
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2628  		 * caused by serialized module load failures. It might happen
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2629  		 * when more devices of the same type trigger load of
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2630  		 * a particular module.
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2631  		 */
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2632  		if (old && old->state == MODULE_STATE_LIVE)
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2633  			err = -EEXIST;
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2634  		else
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2635  			err = -EBUSY;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2636  		goto out;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2637  	}
4f666546d04775 kernel/module.c      Peter Zijlstra 2015-05-27  2638  	mod_update_bounds(mod);
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2639  	list_add_rcu(&mod->list, &modules);
93c2e105f6bcee kernel/module.c      Peter Zijlstra 2015-05-27  2640  	mod_tree_insert(mod);
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2641  	err = 0;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2642  
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2643  out:
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2644  	mutex_unlock(&module_mutex);
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2645  out_unlocked:
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21 @2646  	return err;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2647  }
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2648  

:::::: The code at line 2607 was first introduced by commit
:::::: a3535c7e4f4495fe947f7901d25447d80e04fe52 module: clean up load_module a little more.

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
