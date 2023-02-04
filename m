Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A0233EC
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Feb 2023 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675530533; x=1707066533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VbLnrkl3aafHPzluPcL6QjdeRpSUvhwhbKqUZhJGy0=;
  b=cjjzqfz7QykRyezTzNLDYmLmkI0Uz+4eyPoWb2DthxT9j+07fOpohtgt
   AV3NFOUsOeIo03nsvcCRUtYwLqgD0iLyjURoLrrRFLj5OxGoeTn8qca/I
   0LcsUZb8/4bg/WqxJ53cqgz4xzMgk5/ExCKhdDzo8WY7DAkKAxp+Ug8IQ
   S6zeklQUAqgyKf9dJXUv434u5T7dJTrQCfZYS7/budny1uCa59RrnivS/
   Q40B7vDmxedgOpPsl5OcOwoTBOWtjqNzlSrHVJBEk4Ma0slE9BAqhG17s
   my+Mwl/FMGegZ5cEe0fKfZxtP4K+ECnn81FbMApX7Sqad91eoWuW7hVTx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309299682"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309299682"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 09:08:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="734695255"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="734695255"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2023 09:08:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOM1z-0001Ri-14;
	Sat, 04 Feb 2023 17:08:51 +0000
Date: Sun, 5 Feb 2023 01:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 11/11] firewire: cdev: implement new event relevant to
 phy packet with time stamp
Message-ID: <202302050013.pp3qpCRq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/firewire/core-cdev.c:1706:38: warning: Value stored to 'pp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230125120301.51585-12-o-takashi@sakamocchi.jp>
References: <20230125120301.51585-12-o-takashi@sakamocchi.jp>
TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
TO: stefanr@s5r6.in-berlin.de
CC: linux1394-devel@lists.sourceforge.net
CC: linux-kernel@vger.kernel.org
CC: tiwai@suse.de

Hi Takashi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230203]
[cannot apply to tiwai-sound/for-linus linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Sakamoto/firewire-cdev-add-new-version-of-ABI-to-notify-time-stamp-at-request-response-subaction-of-transaction/20230125-200634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230125120301.51585-12-o-takashi%40sakamocchi.jp
patch subject: [PATCH 11/11] firewire: cdev: implement new event relevant to phy packet with time stamp
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: s390-randconfig-c005-20230123 (https://download.01.org/0day-ci/archive/20230205/202302050013.pp3qpCRq-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/27355dff42dad4fe3a33e259ad8ace3102367a32
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Sakamoto/firewire-cdev-add-new-version-of-ABI-to-notify-time-stamp-at-request-response-subaction-of-transaction/20230125-200634
        git checkout 27355dff42dad4fe3a33e259ad8ace3102367a32
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                           ^~~~
   drivers/firewire/core-cdev.c:1344:28: note: Left side of '||' is true
                           todo == ISO_RES_REALLOC ||
                                                   ^
   drivers/firewire/core-cdev.c:1351:6: note: Assuming the condition is false
           if (channel == -EAGAIN &&
               ^~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1351:25: note: Left side of '&&' is false
           if (channel == -EAGAIN &&
                                  ^
   drivers/firewire/core-cdev.c:1355:12: note: Assuming 'channel' is < 0
           success = channel >= 0 || bandwidth > 0;
                     ^~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1355:12: note: Left side of '||' is false
   drivers/firewire/core-cdev.c:1355:28: note: Assuming 'bandwidth' is <= 0
           success = channel >= 0 || bandwidth > 0;
                                     ^~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1362:9: note: Field 'todo' is not equal to ISO_RES_ALLOC
           if (r->todo == ISO_RES_ALLOC)
                  ^
   drivers/firewire/core-cdev.c:1362:2: note: Taking false branch
           if (r->todo == ISO_RES_ALLOC)
           ^
   drivers/firewire/core-cdev.c:1368:9: note: Field 'todo' is equal to ISO_RES_REALLOC
           if (r->todo == ISO_RES_REALLOC && !success &&
                  ^
   drivers/firewire/core-cdev.c:1368:6: note: Left side of '&&' is true
           if (r->todo == ISO_RES_REALLOC && !success &&
               ^
   drivers/firewire/core-cdev.c:1368:37: note: 'success' is false
           if (r->todo == ISO_RES_REALLOC && !success &&
                                              ^~~~~~~
   drivers/firewire/core-cdev.c:1368:6: note: Left side of '&&' is true
           if (r->todo == ISO_RES_REALLOC && !success &&
               ^
   drivers/firewire/core-cdev.c:1369:6: note: Assuming field 'in_shutdown' is false
               !client->in_shutdown &&
               ^~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1368:6: note: Left side of '&&' is true
           if (r->todo == ISO_RES_REALLOC && !success &&
               ^
   drivers/firewire/core-cdev.c:1370:6: note: Assuming the condition is true
               idr_remove(&client->resource_idr, r->resource.handle)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1368:2: note: Taking true branch
           if (r->todo == ISO_RES_REALLOC && !success &&
           ^
   drivers/firewire/core-cdev.c:1371:3: note: Calling 'client_put'
                   client_put(client);
                   ^~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:88:2: note: Calling 'kref_put'
           kref_put(&client->kref, client_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'client_release'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:83:2: note: Memory is released
           kfree(client);
           ^~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:88:2: note: Returning; memory was released
           kref_put(&client->kref, client_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1371:3: note: Returning; memory was released via 1st parameter
                   client_put(client);
                   ^~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1376:6: note: 'todo' is not equal to ISO_RES_ALLOC
           if (todo == ISO_RES_ALLOC && channel >= 0)
               ^~~~
   drivers/firewire/core-cdev.c:1376:28: note: Left side of '&&' is false
           if (todo == ISO_RES_ALLOC && channel >= 0)
                                     ^
   drivers/firewire/core-cdev.c:1379:6: note: 'todo' is equal to ISO_RES_REALLOC
           if (todo == ISO_RES_REALLOC && success)
               ^~~~
   drivers/firewire/core-cdev.c:1379:6: note: Left side of '&&' is true
   drivers/firewire/core-cdev.c:1379:33: note: 'success' is false
           if (todo == ISO_RES_REALLOC && success)
                                          ^~~~~~~
   drivers/firewire/core-cdev.c:1379:2: note: Taking false branch
           if (todo == ISO_RES_REALLOC && success)
           ^
   drivers/firewire/core-cdev.c:1382:6: note: 'todo' is not equal to ISO_RES_ALLOC
           if (todo == ISO_RES_ALLOC || todo == ISO_RES_ALLOC_ONCE) {
               ^~~~
   drivers/firewire/core-cdev.c:1382:6: note: Left side of '||' is false
   drivers/firewire/core-cdev.c:1382:31: note: 'todo' is not equal to ISO_RES_ALLOC_ONCE
           if (todo == ISO_RES_ALLOC || todo == ISO_RES_ALLOC_ONCE) {
                                        ^~~~
   drivers/firewire/core-cdev.c:1382:2: note: Taking false branch
           if (todo == ISO_RES_ALLOC || todo == ISO_RES_ALLOC_ONCE) {
           ^
   drivers/firewire/core-cdev.c:1393:2: note: Use of memory after it is freed
           queue_event(client, &e->event,
           ^           ~~~~~~
>> drivers/firewire/core-cdev.c:1706:38: warning: Value stored to 'pp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
                           struct fw_cdev_event_phy_packet2 *pp = &e->phy_packet.with_tstamp;
                                                             ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:1706:38: note: Value stored to 'pp' during its initialization is never read
                           struct fw_cdev_event_phy_packet2 *pp = &e->phy_packet.with_tstamp;
                                                             ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/idr.h:174:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
           local_unlock(&radix_tree_preloads.lock);
           ^
   include/linux/local_lock.h:37:29: note: expanded from macro 'local_unlock'
   #define local_unlock(lock)              __local_unlock(lock)
                                           ^
   include/linux/local_lock_internal.h:85:22: note: expanded from macro '__local_unlock'
                   local_lock_release(this_cpu_ptr(lock));         \
                                      ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   drivers/firewire/core-cdev.c:821:6: note: Assuming 'r' is not equal to NULL
           if (r == NULL)
               ^~~~~~~~~
   drivers/firewire/core-cdev.c:821:2: note: Taking false branch
           if (r == NULL)
           ^
   drivers/firewire/core-cdev.c:825:6: note: Assuming field 'version' is >= FW_CDEV_VERSION_ALLOCATE_REGION_END
           if (client->version < FW_CDEV_VERSION_ALLOCATE_REGION_END)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:825:2: note: Taking false branch
           if (client->version < FW_CDEV_VERSION_ALLOCATE_REGION_END)
           ^
   drivers/firewire/core-cdev.c:837:6: note: Assuming 'ret' is >= 0
           if (ret < 0) {
               ^~~~~~~
   drivers/firewire/core-cdev.c:837:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/firewire/core-cdev.c:844:8: note: Calling 'add_client_resource'
           ret = add_client_resource(client, &r->resource, GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:493:6: note: 'preload' is true
           if (preload)
               ^~~~~~~
   drivers/firewire/core-cdev.c:493:2: note: Taking true branch
           if (preload)
           ^
   drivers/firewire/core-cdev.c:495:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&client->lock, flags);
           ^
   include/linux/spinlock.h:380:2: note: expanded from macro 'spin_lock_irqsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:241:2: note: expanded from macro 'raw_spin_lock_irqsave'
           do {                                            \
           ^
   drivers/firewire/core-cdev.c:495:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&client->lock, flags);
           ^
   include/linux/spinlock.h:378:43: note: expanded from macro 'spin_lock_irqsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/firewire/core-cdev.c:497:6: note: Assuming field 'in_shutdown' is true
           if (client->in_shutdown)
               ^~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-cdev.c:497:2: note: Taking true branch
           if (client->in_shutdown)
           ^
   drivers/firewire/core-cdev.c:502:6: note: 'ret' is < 0
           if (ret >= 0) {
               ^~~
   drivers/firewire/core-cdev.c:502:2: note: Taking false branch
           if (ret >= 0) {
           ^
   drivers/firewire/core-cdev.c:509:6: note: 'preload' is true
           if (preload)
               ^~~~~~~
   drivers/firewire/core-cdev.c:509:2: note: Taking true branch
           if (preload)
           ^
   drivers/firewire/core-cdev.c:510:3: note: Calling 'idr_preload_end'
                   idr_preload_end();
                   ^~~~~~~~~~~~~~~~~
   include/linux/idr.h:174:2: note: Loop condition is false.  Exiting loop
           local_unlock(&radix_tree_preloads.lock);
           ^
   include/linux/local_lock.h:37:29: note: expanded from macro 'local_unlock'
   #define local_unlock(lock)              __local_unlock(lock)
                                           ^
   include/linux/local_lock_internal.h:85:22: note: expanded from macro '__local_unlock'
                   local_lock_release(this_cpu_ptr(lock));         \
                                      ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_ptr'

vim +/pp +1706 drivers/firewire/core-cdev.c

bf54e1462b9192 Stefan Richter   2010-07-16  1681  
bf54e1462b9192 Stefan Richter   2010-07-16  1682  void fw_cdev_handle_phy_packet(struct fw_card *card, struct fw_packet *p)
bf54e1462b9192 Stefan Richter   2010-07-16  1683  {
bf54e1462b9192 Stefan Richter   2010-07-16  1684  	struct client *client;
bf54e1462b9192 Stefan Richter   2010-07-16  1685  	struct inbound_phy_packet_event *e;
bf54e1462b9192 Stefan Richter   2010-07-16  1686  	unsigned long flags;
bf54e1462b9192 Stefan Richter   2010-07-16  1687  
bf54e1462b9192 Stefan Richter   2010-07-16  1688  	spin_lock_irqsave(&card->lock, flags);
bf54e1462b9192 Stefan Richter   2010-07-16  1689  
bf54e1462b9192 Stefan Richter   2010-07-16  1690  	list_for_each_entry(client, &card->phy_receiver_list, phy_receiver_link) {
bf54e1462b9192 Stefan Richter   2010-07-16  1691  		e = kmalloc(sizeof(*e) + 8, GFP_ATOMIC);
cfb0c9d1ffbf93 Stefan Richter   2013-03-24  1692  		if (e == NULL)
bf54e1462b9192 Stefan Richter   2010-07-16  1693  			break;
cfb0c9d1ffbf93 Stefan Richter   2013-03-24  1694  
27355dff42dad4 Takashi Sakamoto 2023-01-25  1695  		if (client->version < FW_CDEV_VERSION_EVENT_ASYNC_TSTAMP) {
27355dff42dad4 Takashi Sakamoto 2023-01-25  1696  			struct fw_cdev_event_phy_packet *pp = &e->phy_packet.without_tstamp;
27355dff42dad4 Takashi Sakamoto 2023-01-25  1697  
a56b6c7e7d92bd Takashi Sakamoto 2023-01-25  1698  			pp->closure = client->phy_receiver_closure;
a56b6c7e7d92bd Takashi Sakamoto 2023-01-25  1699  			pp->type = FW_CDEV_EVENT_PHY_PACKET_RECEIVED;
a56b6c7e7d92bd Takashi Sakamoto 2023-01-25  1700  			pp->rcode = RCODE_COMPLETE;
a56b6c7e7d92bd Takashi Sakamoto 2023-01-25  1701  			pp->length = 8;
a56b6c7e7d92bd Takashi Sakamoto 2023-01-25  1702  			pp->data[0] = p->header[1];
a56b6c7e7d92bd Takashi Sakamoto 2023-01-25  1703  			pp->data[1] = p->header[2];
a56b6c7e7d92bd Takashi Sakamoto 2023-01-25  1704  			queue_event(client, &e->event, &e->phy_packet, sizeof(*pp) + 8, NULL, 0);
27355dff42dad4 Takashi Sakamoto 2023-01-25  1705  		} else {
27355dff42dad4 Takashi Sakamoto 2023-01-25 @1706  			struct fw_cdev_event_phy_packet2 *pp = &e->phy_packet.with_tstamp;
27355dff42dad4 Takashi Sakamoto 2023-01-25  1707  
27355dff42dad4 Takashi Sakamoto 2023-01-25  1708  			pp = &e->phy_packet.with_tstamp;
27355dff42dad4 Takashi Sakamoto 2023-01-25  1709  			pp->closure = client->phy_receiver_closure;
27355dff42dad4 Takashi Sakamoto 2023-01-25  1710  			pp->type = FW_CDEV_EVENT_PHY_PACKET_RECEIVED2;
27355dff42dad4 Takashi Sakamoto 2023-01-25  1711  			pp->rcode = RCODE_COMPLETE;
27355dff42dad4 Takashi Sakamoto 2023-01-25  1712  			pp->length = 8;
27355dff42dad4 Takashi Sakamoto 2023-01-25  1713  			pp->tstamp = p->timestamp;
27355dff42dad4 Takashi Sakamoto 2023-01-25  1714  			pp->data[0] = p->header[1];
27355dff42dad4 Takashi Sakamoto 2023-01-25  1715  			pp->data[1] = p->header[2];
27355dff42dad4 Takashi Sakamoto 2023-01-25  1716  			queue_event(client, &e->event, &e->phy_packet, sizeof(*pp) + 8, NULL, 0);
27355dff42dad4 Takashi Sakamoto 2023-01-25  1717  		}
bf54e1462b9192 Stefan Richter   2010-07-16  1718  	}
bf54e1462b9192 Stefan Richter   2010-07-16  1719  
bf54e1462b9192 Stefan Richter   2010-07-16  1720  	spin_unlock_irqrestore(&card->lock, flags);
bf54e1462b9192 Stefan Richter   2010-07-16  1721  }
bf54e1462b9192 Stefan Richter   2010-07-16  1722  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
