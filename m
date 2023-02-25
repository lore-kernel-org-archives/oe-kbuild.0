Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED64D3212
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Feb 2023 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677335374; x=1708871374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0UHVyDjdJUUhJYTiDN+ZjxkeG/gSyXPECPA2QFEwKY=;
  b=BlGiOSgtVRyMkA+0Ogu6Wdeu8KnuWH6ThGhCbN87LSnNo5KvisAiPEK2
   /5a9QZ5h8TvfF6fBLLOM7/YOPVJ2wPQnSn/d3rYxpahznGiFXRsp6F2XA
   XL16K3Qg1pxBQkUcirYiqk5+RFCkvIHgLHIIMnd22D+e7xHdcoLJ5SYKL
   pKFoNlnVl0biEZZ2NP/jNa/3MBoXv0JwScseflbhLYT4TnUsY08iE4Qof
   A6OvFjbCAB6VIXumfdE+Llw1w0lj4O4OqvYCtbGPoTSflB5ADoHP2wSrI
   qSjWjkHc5qxYNg6IZ7nenCOBM+JHTY6oG/EgDnYanjEYTNtSQAt0FltL2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335100414"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="335100414"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 06:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705602979"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="705602979"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Feb 2023 06:29:33 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVvYK-0003FV-17;
	Sat, 25 Feb 2023 14:29:32 +0000
Date: Sat, 25 Feb 2023 22:29:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/core/gro.c:415:14: warning: Dereference of null pointer
 [clang-analyzer-core.NullDereference]
Message-ID: <202302252206.lpsRdo8d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: net/core/gro.c:415:14: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Paul Blakey <paulb@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jiri Pirko <jiri@nvidia.com>
CC: Simon Horman <simon.horman@corigine.com>
CC: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   489fa31ea873282b41046d412ec741f93946fc2d
commit: 80cd22c35c9001fe72bf614d29439de41933deca net/sched: cls_api: Support hardware miss to tc action
date:   5 days ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 days ago
config: s390-randconfig-c005-20230222 (https://download.01.org/0day-ci/archive/20230225/202302252206.lpsRdo8d-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=80cd22c35c9001fe72bf614d29439de41933deca
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 80cd22c35c9001fe72bf614d29439de41933deca
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302252206.lpsRdo8d-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                           ^
   drivers/mtd/nand/raw/nand_base.c:1968:15: note: Assigned value is garbage or undefined
                                   params[i] = ddrbuf[i * 2];
                                             ^ ~~~~~~~~~~~~~
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   fs/ext4/migrate.c:645:9: warning: Although the value stored to 'len' is used in the enclosing expression, the value is never actually read from 'len' [clang-analyzer-deadcode.DeadStores]
                   blk = len = start = end = 0;
                         ^     ~~~~~~~~~~~~~~~
   fs/ext4/migrate.c:645:9: note: Although the value stored to 'len' is used in the enclosing expression, the value is never actually read from 'len'
                   blk = len = start = end = 0;
                         ^     ~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (15 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   31 warnings generated.
   include/net/dst_metadata.h:110:18: warning: Access to field 'type' results in a dereference of a null pointer (loaded from variable 'a') [clang-analyzer-core.NullDereference]
           if (!a != !b || a->type != b->type)
                           ^
   net/core/gro.c:784:37: note: Calling 'dev_gro_receive'
           ret = napi_frags_finish(napi, skb, dev_gro_receive(napi, skb));
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:494:2: note: Taking false branch
           if (netif_elide_gro(skb->dev))
           ^
   net/core/gro.c:497:2: note: Calling 'gro_list_prepare'
           gro_list_prepare(&gro_list->list, skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:373:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(p, head, list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   net/core/gro.c:378:7: note: Assuming the condition is false
                   if (hash != skb_get_hash_raw(p)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:378:3: note: Taking false branch
                   if (hash != skb_get_hash_raw(p)) {
                   ^
   net/core/gro.c:386:7: note: Assuming 'maclen' is not equal to ETH_HLEN
                   if (maclen == ETH_HLEN)
                       ^~~~~~~~~~~~~~~~~~
   net/core/gro.c:386:3: note: Taking false branch
                   if (maclen == ETH_HLEN)
                   ^
   net/core/gro.c:389:12: note: Assuming 'diffs' is 0
                   else if (!diffs)
                            ^~~~~~
   net/core/gro.c:389:8: note: Taking true branch
                   else if (!diffs)
                        ^
   net/core/gro.c:399:8: note: 'diffs' is 0
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                        ^~~~~
   net/core/gro.c:399:7: note: Left side of '&&' is true
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                       ^
   net/core/gro.c:399:17: note: Assuming the condition is true
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                                 ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:399:3: note: Taking true branch
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                   ^
   net/core/gro.c:405:13: note: Assuming 'p->sk' is equal to 'skb->sk'
                           diffs |= p->sk != skb->sk;
                                    ^~~~~~~~~~~~~~~~
   net/core/gro.c:406:13: note: Calling 'skb_metadata_dst_cmp'
                           diffs |= skb_metadata_dst_cmp(p, skb);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dst_metadata.h:104:6: note: Assuming the condition is false
           if (!(skb_a->_skb_refdst | skb_b->_skb_refdst))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dst_metadata.h:104:2: note: Taking false branch
           if (!(skb_a->_skb_refdst | skb_b->_skb_refdst))
           ^
   include/net/dst_metadata.h:107:2: note: Value assigned to 'a'
           a = (const struct metadata_dst *) skb_dst(skb_a);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/dst_metadata.h:110:6: note: Assuming 'a' is null
           if (!a != !b || a->type != b->type)
               ^~
   include/net/dst_metadata.h:110:6: note: Assuming pointer value is null
           if (!a != !b || a->type != b->type)
               ^~
   include/net/dst_metadata.h:110:12: note: Assuming 'b' is null
           if (!a != !b || a->type != b->type)
                     ^~
   include/net/dst_metadata.h:110:6: note: Left side of '||' is false
           if (!a != !b || a->type != b->type)
               ^
   include/net/dst_metadata.h:110:18: note: Access to field 'type' results in a dereference of a null pointer (loaded from variable 'a')
           if (!a != !b || a->type != b->type)
                           ^
>> net/core/gro.c:415:14: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                                   diffs |= p_ext->chain ^ skb_ext->chain;
                                            ^
   net/core/gro.c:784:37: note: Calling 'dev_gro_receive'
           ret = napi_frags_finish(napi, skb, dev_gro_receive(napi, skb));
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:494:2: note: Taking false branch
           if (netif_elide_gro(skb->dev))
           ^
   net/core/gro.c:497:2: note: Calling 'gro_list_prepare'
           gro_list_prepare(&gro_list->list, skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:373:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(p, head, list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   net/core/gro.c:378:7: note: Assuming the condition is false
                   if (hash != skb_get_hash_raw(p)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:378:3: note: Taking false branch
                   if (hash != skb_get_hash_raw(p)) {
                   ^
   net/core/gro.c:385:12: note: Calling 'skb_metadata_differs'
                   diffs |= skb_metadata_differs(p, skb);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:4241:6: note: Assuming the condition is true
           if (!(len_a | len_b))
               ^~~~~~~~~~~~~~~~
   include/linux/skbuff.h:4241:2: note: Taking true branch
           if (!(len_a | len_b))
           ^
   include/linux/skbuff.h:4242:3: note: Returning zero, which participates in a condition later
                   return false;
                   ^~~~~~~~~~~~
   net/core/gro.c:385:12: note: Returning from 'skb_metadata_differs'
                   diffs |= skb_metadata_differs(p, skb);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:386:7: note: Assuming 'maclen' is not equal to ETH_HLEN
                   if (maclen == ETH_HLEN)
                       ^~~~~~~~~~~~~~~~~~
   net/core/gro.c:386:3: note: Taking false branch
                   if (maclen == ETH_HLEN)
                   ^
   net/core/gro.c:389:12: note: Assuming 'diffs' is 0
                   else if (!diffs)
                            ^~~~~~
   net/core/gro.c:389:8: note: Taking true branch
                   else if (!diffs)
                        ^
   net/core/gro.c:399:7: note: Assuming 'diffs' is 0
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                       ^~~~~~
   net/core/gro.c:399:7: note: Left side of '&&' is true
   net/core/gro.c:399:17: note: Assuming the condition is true
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                                 ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:399:3: note: Taking true branch
                   if (!diffs && unlikely(skb->slow_gro | p->slow_gro)) {
                   ^
   net/core/gro.c:405:13: note: Assuming 'p->sk' is equal to 'skb->sk'
                           diffs |= p->sk != skb->sk;
                                    ^~~~~~~~~~~~~~~~
   net/core/gro.c:411:12: note: Calling 'skb_ext_find'
                           p_ext = skb_ext_find(p, TC_SKB_EXT);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:4675:6: note: Assuming the condition is true
           if (skb_ext_exist(skb, id)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:4675:2: note: Taking true branch
           if (skb_ext_exist(skb, id)) {
           ^
   include/linux/skbuff.h:4676:3: note: 'ext' initialized here
                   struct skb_ext *ext = skb->extensions;
                   ^~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:4678:3: note: Returning pointer
                   return (void *)ext + (ext->offset[id] << 3);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:411:12: note: Returning from 'skb_ext_find'
                           p_ext = skb_ext_find(p, TC_SKB_EXT);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:411:4: note: Value assigned to 'p_ext'
                           p_ext = skb_ext_find(p, TC_SKB_EXT);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:413:15: note: Assuming 'p_ext' is null
                           diffs |= (!!p_ext) ^ (!!skb_ext);
                                      ^~~~~~
   net/core/gro.c:413:15: note: Assuming pointer value is null
                           diffs |= (!!p_ext) ^ (!!skb_ext);
                                      ^~~~~~
   net/core/gro.c:413:27: note: Assuming 'skb_ext' is non-null
                           diffs |= (!!p_ext) ^ (!!skb_ext);
                                                  ^~~~~~~~
   net/core/gro.c:414:8: note: Assuming 'diffs' is 0
                           if (!diffs && unlikely(skb_ext))
                               ^~~~~~
   net/core/gro.c:414:8: note: Left side of '&&' is true

vim +415 net/core/gro.c

587652bbdd06ab Eric Dumazet 2021-11-15  404  
587652bbdd06ab Eric Dumazet 2021-11-15  405  			diffs |= p->sk != skb->sk;
587652bbdd06ab Eric Dumazet 2021-11-15  406  			diffs |= skb_metadata_dst_cmp(p, skb);
587652bbdd06ab Eric Dumazet 2021-11-15  407  			diffs |= skb_get_nfct(p) ^ skb_get_nfct(skb);
587652bbdd06ab Eric Dumazet 2021-11-15  408  
587652bbdd06ab Eric Dumazet 2021-11-15  409  #if IS_ENABLED(CONFIG_SKB_EXTENSIONS) && IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
587652bbdd06ab Eric Dumazet 2021-11-15  410  			skb_ext = skb_ext_find(skb, TC_SKB_EXT);
587652bbdd06ab Eric Dumazet 2021-11-15  411  			p_ext = skb_ext_find(p, TC_SKB_EXT);
587652bbdd06ab Eric Dumazet 2021-11-15  412  
587652bbdd06ab Eric Dumazet 2021-11-15  413  			diffs |= (!!p_ext) ^ (!!skb_ext);
587652bbdd06ab Eric Dumazet 2021-11-15  414  			if (!diffs && unlikely(skb_ext))
587652bbdd06ab Eric Dumazet 2021-11-15 @415  				diffs |= p_ext->chain ^ skb_ext->chain;
587652bbdd06ab Eric Dumazet 2021-11-15  416  #endif
587652bbdd06ab Eric Dumazet 2021-11-15  417  		}
587652bbdd06ab Eric Dumazet 2021-11-15  418  
587652bbdd06ab Eric Dumazet 2021-11-15  419  		NAPI_GRO_CB(p)->same_flow = !diffs;
587652bbdd06ab Eric Dumazet 2021-11-15  420  	}
587652bbdd06ab Eric Dumazet 2021-11-15  421  }
587652bbdd06ab Eric Dumazet 2021-11-15  422  

:::::: The code at line 415 was first introduced by commit
:::::: 587652bbdd06ab38a4c1b85e40f933d2cf4a1147 net: gro: populate net/core/gro.c

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
