Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4FD10E3
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Mar 2023 06:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680069831; x=1711605831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2k+NJGABhy+BusyJ2BulLaVfhqgSkEMX8JktUT+2ukk=;
  b=kD7Xl5IHJfL5KyHJwbEU8wEPRbzYbhS524YFQZX8h5eK8j8sod8Egr7l
   /pr9wBWrKfmFzw+G0aNzjt1etIPhNfa5aUjSqc+quL6IHEChJKKIYet4J
   FjXuSZsG+C65ukU5uZKRmqr7frf+I9Q0rOUe0srVeR9/aufiwHM4bMCaB
   VezcV79or3NBtJMRY2eCrPaMskVU2FJju4bXiWt6sqShJXuZf7qMdwVO9
   poaHUIHoKFhzkSif40AgoYY/cZU/Bzuhcn2uDJDvRR7M3Xz93dyKl9PiS
   oBcjvCX+6A8AoGNAAclqYHZCaT04ehLPlWP95rl+Fp+5Msvwu7j8LDQIE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339513634"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="339513634"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 23:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="716754192"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="716754192"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Mar 2023 23:03:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phOuI-000JH0-2X;
	Wed, 29 Mar 2023 06:03:38 +0000
Date: Wed, 29 Mar 2023 14:03:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5115/7607] net/mac80211/mesh_pathtbl.c:616:24:
 warning: Value stored to 'cache' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303291438.MdIGMvgu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/mac80211/mesh_pathtbl.c:616:24: warning: Value stored to 'cache' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Felix Fietkau <nbd@nbd.name>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Ryder Lee <ryder.lee@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   198925fae644b0099b66fac1d972721e6e563b17
commit: d5edb9ae8d568745f893c5c5fa3837d85311b131 [5115/7607] wifi: mac80211: mesh fast xmit support
:::::: branch date: 4 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20230326 (https://download.01.org/0day-ci/archive/20230329/202303291438.MdIGMvgu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d5edb9ae8d568745f893c5c5fa3837d85311b131
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d5edb9ae8d568745f893c5c5fa3837d85311b131
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303291438.MdIGMvgu-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   net/wireless/chan.c:394:10: note: 'c1->width' is not equal to 'c2->width'
           if (c1->width == c2->width)
                   ^
   net/wireless/chan.c:394:2: note: Taking false branch
           if (c1->width == c2->width)
           ^
   net/wireless/chan.c:401:6: note: Assuming field 'width' is not equal to NL80211_CHAN_WIDTH_5
           if (c1->width == NL80211_CHAN_WIDTH_5 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:401:6: note: Left side of '||' is false
   net/wireless/chan.c:402:6: note: Assuming field 'width' is not equal to NL80211_CHAN_WIDTH_10
               c1->width == NL80211_CHAN_WIDTH_10 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:401:6: note: Left side of '||' is false
           if (c1->width == NL80211_CHAN_WIDTH_5 ||
               ^
   net/wireless/chan.c:403:6: note: Assuming field 'width' is not equal to NL80211_CHAN_WIDTH_5
               c2->width == NL80211_CHAN_WIDTH_5 ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:401:6: note: Left side of '||' is false
           if (c1->width == NL80211_CHAN_WIDTH_5 ||
               ^
   net/wireless/chan.c:404:6: note: Assuming field 'width' is not equal to NL80211_CHAN_WIDTH_10
               c2->width == NL80211_CHAN_WIDTH_10)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:401:2: note: Taking false branch
           if (c1->width == NL80211_CHAN_WIDTH_5 ||
           ^
   net/wireless/chan.c:407:6: note: Assuming field 'width' is not equal to NL80211_CHAN_WIDTH_20_NOHT
           if (c1->width == NL80211_CHAN_WIDTH_20_NOHT ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:407:6: note: Left side of '||' is false
   net/wireless/chan.c:408:6: note: Assuming field 'width' is not equal to NL80211_CHAN_WIDTH_20
               c1->width == NL80211_CHAN_WIDTH_20)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:407:2: note: Taking false branch
           if (c1->width == NL80211_CHAN_WIDTH_20_NOHT ||
           ^
   net/wireless/chan.c:411:6: note: Assuming field 'width' is not equal to NL80211_CHAN_WIDTH_20_NOHT
           if (c2->width == NL80211_CHAN_WIDTH_20_NOHT ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:411:6: note: Left side of '||' is false
   net/wireless/chan.c:412:6: note: Assuming field 'width' is not equal to NL80211_CHAN_WIDTH_20
               c2->width == NL80211_CHAN_WIDTH_20)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:411:2: note: Taking false branch
           if (c2->width == NL80211_CHAN_WIDTH_20_NOHT ||
           ^
   net/wireless/chan.c:416:2: note: Calling 'chandef_primary_freqs'
           chandef_primary_freqs(c2, &c2_pri40, &c2_pri80, &c2_pri160);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:328:2: note: Control jumps to the 'default' case at line 371
           switch (c->width) {
           ^
   net/wireless/chan.c:372:3: note: Taking true branch
                   WARN_ON_ONCE(1);
                   ^
   include/asm-generic/bug.h:111:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   net/wireless/chan.c:372:3: note: Loop condition is false.  Exiting loop
                   WARN_ON_ONCE(1);
                   ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/riscv/include/asm/bug.h:79:29: note: expanded from macro '__WARN_FLAGS'
   #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
                               ^
   arch/riscv/include/asm/bug.h:53:32: note: expanded from macro '__BUG_FLAGS'
   #define __BUG_FLAGS(flags)                                      \
                                                                   ^
   net/wireless/chan.c:374:1: note: Returning without writing to '*pri40'
   }
   ^
   net/wireless/chan.c:416:2: note: Returning from 'chandef_primary_freqs'
           chandef_primary_freqs(c2, &c2_pri40, &c2_pri80, &c2_pri160);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/chan.c:418:15: note: The right operand of '!=' is a garbage value
           if (c1_pri40 != c2_pri40)
                        ^  ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   net/mac80211/mesh.c:1004:3: warning: Value stored to 'pos' is never read [clang-analyzer-deadcode.DeadStores]
                   pos += 2;
                   ^      ~
   net/mac80211/mesh.c:1004:3: note: Value stored to 'pos' is never read
                   pos += 2;
                   ^      ~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
>> net/mac80211/mesh_pathtbl.c:616:24: warning: Value stored to 'cache' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:616:24: note: Value stored to 'cache' during its initialization is never read
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:631:24: warning: Value stored to 'cache' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:631:24: note: Value stored to 'cache' during its initialization is never read
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:646:24: warning: Value stored to 'cache' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mesh_pathtbl.c:646:24: note: Value stored to 'cache' during its initialization is never read
           struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/mac80211/key.c:117:18: warning: Access to field 'local' results in a dereference of a null pointer (loaded from variable 'sdata') [clang-analyzer-core.NullDereference]
           assert_key_lock(sdata->local);
                           ^
   net/mac80211/key.c:1354:6: note: Assuming the condition is false
           if (key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/key.c:1354:2: note: Taking false branch
           if (key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE) {
           ^
   net/mac80211/key.c:1363:2: note: Calling 'ieee80211_key_free'
           ieee80211_key_free(key, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/key.c:937:7: note: 'key' is non-null
           if (!key)
                ^~~
   net/mac80211/key.c:937:2: note: Taking false branch
           if (!key)
           ^
   net/mac80211/key.c:943:6: note: Assuming field 'sdata' is null
           if (key->sdata)
               ^~~~~~~~~~
   net/mac80211/key.c:943:2: note: Taking false branch
           if (key->sdata)
           ^
   net/mac80211/key.c:947:2: note: Calling 'ieee80211_key_destroy'
           ieee80211_key_destroy(key, delay_tailroom);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/key.c:787:7: note: 'key' is non-null
           if (!key)
                ^~~
   net/mac80211/key.c:787:2: note: Taking false branch
           if (!key)
           ^
   net/mac80211/key.c:796:2: note: Calling '__ieee80211_key_destroy'
           __ieee80211_key_destroy(key, delay_tailroom);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/key.c:766:6: note: Assuming field 'local' is non-null
           if (key->local) {
               ^~~~~~~~~~
   net/mac80211/key.c:766:2: note: Taking true branch
           if (key->local) {
           ^
   net/mac80211/key.c:767:3: note: 'sdata' initialized to a null pointer value
                   struct ieee80211_sub_if_data *sdata = key->sdata;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/key.c:771:7: note: 'delay_tailroom' is false
                   if (delay_tailroom) {
                       ^~~~~~~~~~~~~~
   net/mac80211/key.c:771:3: note: Taking false branch
                   if (delay_tailroom) {
                   ^
   net/mac80211/key.c:777:33: note: Passing null pointer value via 1st parameter 'sdata'
                           decrease_tailroom_need_count(sdata, 1);
                                                        ^~~~~
   net/mac80211/key.c:777:4: note: Calling 'decrease_tailroom_need_count'
                           decrease_tailroom_need_count(sdata, 1);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/key.c:117:18: note: Access to field 'local' results in a dereference of a null pointer (loaded from variable 'sdata')
           assert_key_lock(sdata->local);
                           ^~~~~
   net/mac80211/key.c:773:4: warning: Access to field 'crypto_tx_tailroom_pending_dec' results in a dereference of a null pointer (loaded from variable 'sdata') [clang-analyzer-core.NullDereference]
                           sdata->crypto_tx_tailroom_pending_dec++;
                           ^
   net/mac80211/key.c:1376:14: note: Assuming field 'wowlan' is true
           if (WARN_ON(!local->wowlan))
                       ^
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   net/mac80211/key.c:1376:6: note: Taking false branch
           if (WARN_ON(!local->wowlan))
               ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   net/mac80211/key.c:1376:2: note: Taking false branch
           if (WARN_ON(!local->wowlan))
           ^
   net/mac80211/key.c:1379:14: note: Assuming field 'type' is equal to NL80211_IFTYPE_STATION
           if (WARN_ON(vif->type != NL80211_IFTYPE_STATION))

vim +/cache +616 net/mac80211/mesh_pathtbl.c

d5edb9ae8d56874 Felix Fietkau 2023-03-14  612  
d5edb9ae8d56874 Felix Fietkau 2023-03-14  613  void mesh_fast_tx_flush_mpath(struct mesh_path *mpath)
d5edb9ae8d56874 Felix Fietkau 2023-03-14  614  {
d5edb9ae8d56874 Felix Fietkau 2023-03-14  615  	struct ieee80211_sub_if_data *sdata = mpath->sdata;
d5edb9ae8d56874 Felix Fietkau 2023-03-14 @616  	struct mesh_tx_cache *cache = &sdata->u.mesh.tx_cache;
d5edb9ae8d56874 Felix Fietkau 2023-03-14  617  	struct ieee80211_mesh_fast_tx *entry;
d5edb9ae8d56874 Felix Fietkau 2023-03-14  618  	struct hlist_node *n;
d5edb9ae8d56874 Felix Fietkau 2023-03-14  619  
d5edb9ae8d56874 Felix Fietkau 2023-03-14  620  	cache = &sdata->u.mesh.tx_cache;
d5edb9ae8d56874 Felix Fietkau 2023-03-14  621  	spin_lock_bh(&cache->walk_lock);
d5edb9ae8d56874 Felix Fietkau 2023-03-14  622  	hlist_for_each_entry_safe(entry, n, &cache->walk_head, walk_list)
d5edb9ae8d56874 Felix Fietkau 2023-03-14  623  		if (entry->mpath == mpath)
d5edb9ae8d56874 Felix Fietkau 2023-03-14  624  			mesh_fast_tx_entry_free(cache, entry);
d5edb9ae8d56874 Felix Fietkau 2023-03-14  625  	spin_unlock_bh(&cache->walk_lock);
d5edb9ae8d56874 Felix Fietkau 2023-03-14  626  }
d5edb9ae8d56874 Felix Fietkau 2023-03-14  627  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
