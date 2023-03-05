Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C99D2E8
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678013522; x=1709549522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fiqcZ7Pi+iHCc2+KpQ6LkUcJXoadPXBN7XMPgpi3C/E=;
  b=iNnWDYPygjHuxuErGlVfMwbRq9NvaqpzDcdrdnVSEHC6PVtEA6Kf6aL5
   drh2psxpqVidj0wunXLPd8nUK1F3O04+UKWsFy0GUsBeNu1BPoAcj8hD6
   fGYxI+xAaZO3iSvViIjuZc13rzNDZkqBpPrDwAEjF0y6ses8Fi8ay/2hK
   6W8NlmFKsHnnhlpDWpe3Fs4i+OwR8FKua9AAH/FtFH3gyGs5DkLpsqq2R
   EJo5jUi+Kl6qdC0kLjh3TGOnSF75d+7MG138hb/vMH+JnSJq5fg+OFM2J
   /wkW94v5MIwvBIMTqpRT8k5PpF7RXFPudxxmIlrNtQfiwAfPL9LorCktZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="421643258"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="421643258"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 02:51:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="764919857"
X-IronPort-AV: E=Sophos;i="5.98,235,1673942400"; 
   d="scan'208";a="764919857"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2023 02:51:22 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYlxZ-0002gI-2G;
	Sun, 05 Mar 2023 10:51:21 +0000
Date: Sun, 5 Mar 2023 18:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [mcgrof:modules-next 7/12] kernel/module/main.c:2578:1-11: second
 lock on line 2591
Message-ID: <202303051802.lUI3TlTX-lkp@intel.com>
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
TO: Song Liu <song@kernel.org>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
head:   b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb
commit: a76b092b56554ac80f8d2540355b8978f91ce107 [7/12] module: replace module_layout with module_memory
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: csky-randconfig-c034-20230305 (https://download.01.org/0day-ci/archive/20230305/202303051802.lUI3TlTX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303051802.lUI3TlTX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/module/main.c:2578:1-11: second lock on line 2591
   kernel/module/main.c:1215:1-11: second lock on line 1235
   kernel/module/main.c:2885:1-11: second lock on line 2901
--
>> kernel/module/main.c:2617:1-7: preceding lock on line 2578

vim +2578 kernel/module/main.c

34e1169d996ab1 kernel/module.c      Kees Cook      2012-10-16  2565  
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2566  /*
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2567   * We try to place it in the list now to make sure it's unique before
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2568   * we dedicate too many resources.  In particular, temporary percpu
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2569   * memory exhaustion.
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2570   */
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2571  static int add_unformed_module(struct module *mod)
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2572  {
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2573  	int err;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2574  	struct module *old;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2575  
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2576  	mod->state = MODULE_STATE_UNFORMED;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2577  
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21 @2578  	mutex_lock(&module_mutex);
4f6de4d51f4a3a kernel/module.c      Mathias Krause 2013-07-02  2579  	old = find_module_all(mod->name, strlen(mod->name), true);
4f6de4d51f4a3a kernel/module.c      Mathias Krause 2013-07-02  2580  	if (old != NULL) {
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2581  		if (old->state == MODULE_STATE_COMING
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2582  		    || old->state == MODULE_STATE_UNFORMED) {
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2583  			/* Wait in case it fails to load. */
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2584  			mutex_unlock(&module_mutex);
9cc019b8c94fa5 kernel/module.c      Peter Zijlstra 2015-02-11  2585  			err = wait_event_interruptible(module_wq,
9cc019b8c94fa5 kernel/module.c      Peter Zijlstra 2015-02-11  2586  					       finished_loading(mod->name));
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2587  			if (err)
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2588  				goto out_unlocked;
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2589  
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2590  			/* The module might have gone in the meantime. */
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05 @2591  			mutex_lock(&module_mutex);
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2592  			old = find_module_all(mod->name, strlen(mod->name),
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2593  					      true);
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2594  		}
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2595  
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2596  		/*
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2597  		 * We are here only when the same module was being loaded. Do
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2598  		 * not try to load it again right now. It prevents long delays
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2599  		 * caused by serialized module load failures. It might happen
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2600  		 * when more devices of the same type trigger load of
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2601  		 * a particular module.
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2602  		 */
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2603  		if (old && old->state == MODULE_STATE_LIVE)
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2604  			err = -EEXIST;
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2605  		else
0254127ab977e7 kernel/module/main.c Petr Pavlu     2022-12-05  2606  			err = -EBUSY;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2607  		goto out;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2608  	}
4f666546d04775 kernel/module.c      Peter Zijlstra 2015-05-27  2609  	mod_update_bounds(mod);
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2610  	list_add_rcu(&mod->list, &modules);
93c2e105f6bcee kernel/module.c      Peter Zijlstra 2015-05-27  2611  	mod_tree_insert(mod);
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2612  	err = 0;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2613  
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2614  out:
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2615  	mutex_unlock(&module_mutex);
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2616  out_unlocked:
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21 @2617  	return err;
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2618  }
a3535c7e4f4495 kernel/module.c      Rusty Russell  2013-01-21  2619  

:::::: The code at line 2578 was first introduced by commit
:::::: a3535c7e4f4495fe947f7901d25447d80e04fe52 module: clean up load_module a little more.

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
