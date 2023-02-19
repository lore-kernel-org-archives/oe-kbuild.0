Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9A62115
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676817700; x=1708353700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SJWPzNVluT18tv10b4Cimqi4wOem1asCMfv5lYzNSdI=;
  b=GeFPk4+DsnevI4pxZJrqPklBj/Hd9aTEeWRCjcy/J/vRdF2591uiFp2G
   QM/6ZYPUkO4HrorY3RB3Xobqr4Ry7ZJVMfZV07Y53AmRAa1piLanzdHog
   ph1+BwcMTXJehVC7MoNMRJixRjZLWXkBW0R9rTKFS9EfKN9xeGin07Qg7
   +ZWu2Z7CdjH6Pld43xgQXbF/ludea8vtWgKNGowFBdTn3VLaqUlsfRUPd
   oYdOMgPbVJmhAMXrPsL9ELGzFT2UKYz1H1/HlnQj+AB7vpLHOZJvwUCfq
   TnBH2VaWWGaUDYPxCaaCYm4HzfQhd+GiaPdOAOiXiT2nuTRKa2L0RAvLG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394735863"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="394735863"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 06:41:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="620898364"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="620898364"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Feb 2023 06:41:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTksj-000DKz-2B;
	Sun, 19 Feb 2023 14:41:37 +0000
Date: Sun, 19 Feb 2023 22:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11217/13499] drivers/dma/xilinx/xdma.c:219:8:
 warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Message-ID: <202302192217.bSxJ9BZz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/dma/xilinx/xdma.c:219:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lizhi Hou <lizhi.hou@amd.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Sonal Santan <sonal.santan@amd.com>
CC: Max Zhen <max.zhen@amd.com>
CC: Brian Xu <brian.xu@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c068f40300a0eaa34f7105d137a5560b86951aa9
commit: 17ce252266c7f016ece026492c45838f852ddc79 [11217/13499] dmaengine: xilinx: xdma: Add xilinx xdma driver
:::::: branch date: 2 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-c002-20230218 (https://download.01.org/0day-ci/archive/20230219/202302192217.bSxJ9BZz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=17ce252266c7f016ece026492c45838f852ddc79
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 17ce252266c7f016ece026492c45838f852ddc79
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302192217.bSxJ9BZz-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                  ^
   drivers/regulator/core.c:937:1: note: 'flags' declared without an initial value
   REGULATOR_ERROR_ATTR(over_temp_warn, REGULATOR_ERROR_OVER_TEMP_WARN);
   ^
   drivers/regulator/core.c:920:3: note: expanded from macro 'REGULATOR_ERROR_ATTR'
                   unsigned int flags;                                                     \
                   ^~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:937:1: note: Calling '_regulator_get_error_flags'
   REGULATOR_ERROR_ATTR(over_temp_warn, REGULATOR_ERROR_OVER_TEMP_WARN);
   ^
   drivers/regulator/core.c:922:9: note: expanded from macro 'REGULATOR_ERROR_ATTR'
                   ret = _regulator_get_error_flags(rdev, &flags);                         \
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:4608:6: note: Assuming field 'get_error_flags' is null
           if (rdev->desc->ops->get_error_flags)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:4608:2: note: Taking false branch
           if (rdev->desc->ops->get_error_flags)
           ^
   drivers/regulator/core.c:4610:18: note: Field 'use_cached_err' is false
           else if (!rdev->use_cached_err)
                           ^
   drivers/regulator/core.c:4610:7: note: Taking true branch
           else if (!rdev->use_cached_err)
                ^
   drivers/regulator/core.c:4613:9: note: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage
           *flags |= cached_flags;
           ~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/linux/list.h:137:13: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/dma/ti/omap-dma.c:1852:6: note: Assuming field 'may_lose_context' is 0
           if (od->cfg->may_lose_context)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1852:2: note: Taking false branch
           if (od->cfg->may_lose_context)
           ^
   drivers/dma/ti/omap-dma.c:1855:6: note: Assuming field 'of_node' is null
           if (pdev->dev.of_node)
               ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1855:2: note: Taking false branch
           if (pdev->dev.of_node)
           ^
   drivers/dma/ti/omap-dma.c:1863:2: note: Taking true branch
           if (!omap_dma_legacy(od)) {
           ^
   drivers/dma/ti/omap-dma.c:1868:6: note: Assuming field 'll123_supported' is false
           if (od->ll123_supported)
               ^~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1868:2: note: Taking false branch
           if (od->ll123_supported)
           ^
   drivers/dma/ti/omap-dma.c:1871:2: note: Calling 'omap_dma_free'
           omap_dma_free(od);
           ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1520:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&od->ddev.channels)) {
           ^
   drivers/dma/ti/omap-dma.c:1526:3: note: Memory is released
                   kfree(c);
                   ^~~~~~~~
   drivers/dma/ti/omap-dma.c:1520:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&od->ddev.channels)) {
           ^
   drivers/dma/ti/omap-dma.c:1524:3: note: Calling 'list_del'
                   list_del(&c->vc.chan.device_node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/dma/xilinx/xdma.c:219:8: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   if (!sw_desc->desc_blocks[i].virt_addr)
                        ^
   drivers/dma/xilinx/xdma.c:465:31: note: Assuming 'i' is >= 'sg_len'
           for_each_sg(sgl, sg, sg_len, i)
                                        ^
   include/linux/scatterlist.h:172:31: note: expanded from macro 'for_each_sg'
           for (__i = 0, sg = (sglist); __i < (nr); __i++, sg = sg_next(sg))
                                        ^~~~~~~~~~
   drivers/dma/xilinx/xdma.c:465:2: note: Loop condition is false. Execution continues on line 468
           for_each_sg(sgl, sg, sg_len, i)
           ^
   include/linux/scatterlist.h:172:2: note: expanded from macro 'for_each_sg'
           for (__i = 0, sg = (sglist); __i < (nr); __i++, sg = sg_next(sg))
           ^
   drivers/dma/xilinx/xdma.c:468:12: note: Calling 'xdma_alloc_desc'
           sw_desc = xdma_alloc_desc(xdma_chan, desc_num);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xdma.c:244:12: note: Calling 'kzalloc'
           sw_desc = kzalloc(sizeof(*sw_desc), GFP_NOWAIT);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:589:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) && size > KMALLOC_MAX_CACHE_SIZE)
                                          ^
   include/linux/slab.h:592:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:2: note: Returning pointer, which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xdma.c:244:12: note: Returning from 'kzalloc'
           sw_desc = kzalloc(sizeof(*sw_desc), GFP_NOWAIT);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xdma.c:245:6: note: Assuming 'sw_desc' is non-null
           if (!sw_desc)
               ^~~~~~~~
   drivers/dma/xilinx/xdma.c:245:2: note: Taking false branch
           if (!sw_desc)
           ^
   drivers/dma/xilinx/xdma.c:251:25: note: Calling 'kcalloc'
           sw_desc->desc_blocks = kcalloc(dblk_num, sizeof(*sw_desc->desc_blocks),
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:667:9: note: Calling 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:632:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/slab.h:634:30: note: Left side of '&&' is false
           if (__builtin_constant_p(n) && __builtin_constant_p(size))
                                       ^
   include/linux/slab.h:636:2: note: Returning pointer
           return __kmalloc(bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:667:9: note: Returning from 'kmalloc_array'
           return kmalloc_array(n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:667:2: note: Returning pointer
           return kmalloc_array(n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xdma.c:251:25: note: Returning from 'kcalloc'
           sw_desc->desc_blocks = kcalloc(dblk_num, sizeof(*sw_desc->desc_blocks),
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xdma.c:251:2: note: Value assigned to field 'desc_blocks'
           sw_desc->desc_blocks = kcalloc(dblk_num, sizeof(*sw_desc->desc_blocks),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xdma.c:253:6: note: Assuming field 'desc_blocks' is null
           if (!sw_desc->desc_blocks)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xdma.c:253:2: note: Taking true branch
           if (!sw_desc->desc_blocks)
           ^
   drivers/dma/xilinx/xdma.c:254:3: note: Control jumps to line 273
                   goto failed;
                   ^
   drivers/dma/xilinx/xdma.c:273:2: note: Calling 'xdma_free_desc'
           xdma_free_desc(&sw_desc->vdesc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xdma.c:218:14: note: Assuming 'i' is < field 'dblk_num'
           for (i = 0; i < sw_desc->dblk_num; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xdma.c:218:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < sw_desc->dblk_num; i++) {
           ^
   drivers/dma/xilinx/xdma.c:219:8: note: Dereference of null pointer
                   if (!sw_desc->desc_blocks[i].virt_addr)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +219 drivers/dma/xilinx/xdma.c

17ce252266c7f0 Lizhi Hou 2023-01-19  207  
17ce252266c7f0 Lizhi Hou 2023-01-19  208  /**
17ce252266c7f0 Lizhi Hou 2023-01-19  209   * xdma_free_desc - Free descriptor
17ce252266c7f0 Lizhi Hou 2023-01-19  210   * @vdesc: Virtual DMA descriptor
17ce252266c7f0 Lizhi Hou 2023-01-19  211   */
17ce252266c7f0 Lizhi Hou 2023-01-19  212  static void xdma_free_desc(struct virt_dma_desc *vdesc)
17ce252266c7f0 Lizhi Hou 2023-01-19  213  {
17ce252266c7f0 Lizhi Hou 2023-01-19  214  	struct xdma_desc *sw_desc;
17ce252266c7f0 Lizhi Hou 2023-01-19  215  	int i;
17ce252266c7f0 Lizhi Hou 2023-01-19  216  
17ce252266c7f0 Lizhi Hou 2023-01-19  217  	sw_desc = to_xdma_desc(vdesc);
17ce252266c7f0 Lizhi Hou 2023-01-19  218  	for (i = 0; i < sw_desc->dblk_num; i++) {
17ce252266c7f0 Lizhi Hou 2023-01-19 @219  		if (!sw_desc->desc_blocks[i].virt_addr)
17ce252266c7f0 Lizhi Hou 2023-01-19  220  			break;
17ce252266c7f0 Lizhi Hou 2023-01-19  221  		dma_pool_free(sw_desc->chan->desc_pool,
17ce252266c7f0 Lizhi Hou 2023-01-19  222  			      sw_desc->desc_blocks[i].virt_addr,
17ce252266c7f0 Lizhi Hou 2023-01-19  223  			      sw_desc->desc_blocks[i].dma_addr);
17ce252266c7f0 Lizhi Hou 2023-01-19  224  	}
17ce252266c7f0 Lizhi Hou 2023-01-19  225  	kfree(sw_desc->desc_blocks);
17ce252266c7f0 Lizhi Hou 2023-01-19  226  	kfree(sw_desc);
17ce252266c7f0 Lizhi Hou 2023-01-19  227  }
17ce252266c7f0 Lizhi Hou 2023-01-19  228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
