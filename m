Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47D917F1
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 11:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674993068; x=1706529068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6GNO6BBaxold2RBGS58Er0zhYCNgVC5LWQvZnUre110=;
  b=CQVkoBHedyeVVQ0UjDLMkCMTlSljWFkHH1wlCnnuAWIqPSCdSucwWz2D
   PyYeXXm8EJyVWhN3F7waIT8E0l9xERIRPNd8/X99dQ2kemfeIJBEa21/M
   9UzJR7stXIFr1ZbXKUjyXrQ1b3EaRT+lvZJ5pVP6oFKBq+K+azgKtsa+B
   OMq+uNLt4ePdmcSZHLz6FvxDD74Rbj+jwmeIgvEPN1OFmAiENo7zt/oEa
   gN0w7Ll+3GkKPD+dwga1wohMMV0Q88fQWxlDb5mIwGdGsGWL0V42u1MGM
   +Tu6+F683zcDQMDowZVNnWWntmaMpVXpXA3MYMBOl/9wE9Avse7IPSI9/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="311009433"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="311009433"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 03:51:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992581244"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="992581244"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jan 2023 03:51:06 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM6DC-0002mY-0S;
	Sun, 29 Jan 2023 11:51:06 +0000
Date: Sun, 29 Jan 2023 19:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kraxel:drm-udmabuf 1/2] drivers/dma-buf/udmabuf.c:222:7: warning:
 Branch condition evaluates to a garbage value
 [clang-analyzer-core.uninitialized.Branch]
Message-ID: <202301291911.y0oNYb5l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/dma-buf/udmabuf.c:222:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Gerd Hoffmann <kraxel@redhat.com>

tree:   git://git.kraxel.org/linux drm-udmabuf
head:   12dfcb15bbec3ca983da0a040766864899dfa15c
commit: 4e0898f30f13c1d492b86a5404b73d8b6baa40af [1/2] udmabuf: check that __pad is zero
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-c005-20230123 (https://download.01.org/0day-ci/archive/20230129/202301291911.y0oNYb5l-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add kraxel git://git.kraxel.org/linux
        git fetch --no-tags kraxel drm-udmabuf
        git checkout 4e0898f30f13c1d492b86a5404b73d8b6baa40af
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                          ^~~   ~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:711:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = od->ddev.dev;
                          ^~~   ~~~~~~~~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/dma/ti/omap-dma.c:1854:6: note: Assuming field 'may_lose_context' is 0
           if (od->cfg->may_lose_context)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1854:2: note: Taking false branch
           if (od->cfg->may_lose_context)
           ^
   drivers/dma/ti/omap-dma.c:1857:6: note: Assuming field 'of_node' is null
           if (pdev->dev.of_node)
               ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1857:2: note: Taking false branch
           if (pdev->dev.of_node)
           ^
   drivers/dma/ti/omap-dma.c:1865:2: note: Taking true branch
           if (!omap_dma_legacy(od)) {
           ^
   drivers/dma/ti/omap-dma.c:1870:6: note: Assuming field 'll123_supported' is false
           if (od->ll123_supported)
               ^~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1870:2: note: Taking false branch
           if (od->ll123_supported)
           ^
   drivers/dma/ti/omap-dma.c:1873:2: note: Calling 'omap_dma_free'
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
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           entry->next = LIST_POISON1;
                       ^
   drivers/dma/ti/omap-dma.c:1854:6: note: Assuming field 'may_lose_context' is 0
           if (od->cfg->may_lose_context)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1854:2: note: Taking false branch
           if (od->cfg->may_lose_context)
           ^
   drivers/dma/ti/omap-dma.c:1857:6: note: Assuming field 'of_node' is null
           if (pdev->dev.of_node)
               ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1857:2: note: Taking false branch
           if (pdev->dev.of_node)
           ^
   drivers/dma/ti/omap-dma.c:1865:2: note: Taking true branch
           if (!omap_dma_legacy(od)) {
           ^
   drivers/dma/ti/omap-dma.c:1870:6: note: Assuming field 'll123_supported' is false
           if (od->ll123_supported)
               ^~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1870:2: note: Taking false branch
           if (od->ll123_supported)
           ^
   drivers/dma/ti/omap-dma.c:1873:2: note: Calling 'omap_dma_free'
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
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next = LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   24 warnings generated.
>> drivers/dma-buf/udmabuf.c:222:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (list[i].__pad)
                       ^
   drivers/dma-buf/udmabuf.c:377:2: note: Control jumps to 'case 1075344706:'  at line 378
           switch (ioctl) {
           ^
   drivers/dma-buf/udmabuf.c:379:9: note: Calling 'udmabuf_ioctl_create'
                   ret = udmabuf_ioctl_create(filp, arg);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:338:2: note: Taking false branch
           if (copy_from_user(&create, (void __user *)arg,
           ^
   drivers/dma-buf/udmabuf.c:348:9: note: Calling 'udmabuf_create'
           return udmabuf_create(filp->private_data, &head, &list);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:216:9: note: Calling 'kzalloc'
           ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:689:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:541:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:558:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:689:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:689:2: note: Returning pointer, which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:216:9: note: Returning from 'kzalloc'
           ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:217:6: note: Assuming 'ubuf' is non-null
           if (!ubuf)
               ^~~~~
   drivers/dma-buf/udmabuf.c:217:2: note: Taking false branch
           if (!ubuf)
           ^
   drivers/dma-buf/udmabuf.c:221:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < head->count; i++) {
           ^
   drivers/dma-buf/udmabuf.c:222:7: note: Branch condition evaluates to a garbage value
                   if (list[i].__pad)
                       ^~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:278:18: warning: The right operand of '+' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   page = hpage + subpgoff;
                                                ^
   drivers/dma-buf/udmabuf.c:377:2: note: Control jumps to 'case 1074296131:'  at line 381
           switch (ioctl) {
           ^
   drivers/dma-buf/udmabuf.c:382:9: note: Calling 'udmabuf_ioctl_create_list'
                   ret = udmabuf_ioctl_create_list(filp, arg);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:358:2: note: Taking false branch
           if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
           ^
   drivers/dma-buf/udmabuf.c:360:6: note: Assuming 'list_limit' is >= field 'count'
           if (head.count > list_limit)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:360:2: note: Taking false branch
           if (head.count > list_limit)
           ^
   drivers/dma-buf/udmabuf.c:364:2: note: Taking false branch
           if (IS_ERR(list))
           ^
   drivers/dma-buf/udmabuf.c:367:8: note: Calling 'udmabuf_create'
           ret = udmabuf_create(filp->private_data, &head, list);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:211:10: note: 'subpgoff' declared without an initial value
           pgoff_t subpgoff, maxsubpgs;
                   ^~~~~~~~
   drivers/dma-buf/udmabuf.c:216:9: note: Calling 'kzalloc'
           ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:689:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:541:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:558:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:689:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:689:2: note: Returning pointer, which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:216:9: note: Returning from 'kzalloc'
           ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/udmabuf.c:217:6: note: Assuming 'ubuf' is non-null
           if (!ubuf)
               ^~~~~
   drivers/dma-buf/udmabuf.c:217:2: note: Taking false branch
           if (!ubuf)

vim +222 drivers/dma-buf/udmabuf.c

fbb0de79507819 Gerd Hoffmann       2018-08-27  199  
c1bbed66899726 Gurchetan Singh     2019-12-02  200  static long udmabuf_create(struct miscdevice *device,
c1bbed66899726 Gurchetan Singh     2019-12-02  201  			   struct udmabuf_create_list *head,
c1bbed66899726 Gurchetan Singh     2019-12-02  202  			   struct udmabuf_create_item *list)
fbb0de79507819 Gerd Hoffmann       2018-08-27  203  {
fbb0de79507819 Gerd Hoffmann       2018-08-27  204  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  205  	struct file *memfd = NULL;
16c243e99d335e Vivek Kasireddy     2021-06-09  206  	struct address_space *mapping = NULL;
fbb0de79507819 Gerd Hoffmann       2018-08-27  207  	struct udmabuf *ubuf;
fbb0de79507819 Gerd Hoffmann       2018-08-27  208  	struct dma_buf *buf;
0d17455ca85ecb Gerd Hoffmann       2018-09-11  209  	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
16c243e99d335e Vivek Kasireddy     2021-06-09  210  	struct page *page, *hpage = NULL;
16c243e99d335e Vivek Kasireddy     2021-06-09  211  	pgoff_t subpgoff, maxsubpgs;
16c243e99d335e Vivek Kasireddy     2021-06-09  212  	struct hstate *hpstate;
fbb0de79507819 Gerd Hoffmann       2018-08-27  213  	int seals, ret = -EINVAL;
fbb0de79507819 Gerd Hoffmann       2018-08-27  214  	u32 i, flags;
fbb0de79507819 Gerd Hoffmann       2018-08-27  215  
33f35429fc49c0 Gerd Hoffmann       2018-09-11  216  	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann       2018-08-27  217  	if (!ubuf)
fbb0de79507819 Gerd Hoffmann       2018-08-27  218  		return -ENOMEM;
fbb0de79507819 Gerd Hoffmann       2018-08-27  219  
dc4716d75154b3 Gerd Hoffmann       2018-09-11  220  	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  221  	for (i = 0; i < head->count; i++) {
4e0898f30f13c1 Gerd Hoffmann       2018-09-12 @222  		if (list[i].__pad)
4e0898f30f13c1 Gerd Hoffmann       2018-09-12  223  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  224  		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  225  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  226  		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  227  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  228  		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
dc4716d75154b3 Gerd Hoffmann       2018-09-11  229  		if (ubuf->pagecount > pglimit)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  230  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  231  	}
2b6dd600dd7257 Pavel Skripkin      2021-12-30  232  
2b6dd600dd7257 Pavel Skripkin      2021-12-30  233  	if (!ubuf->pagecount)
2b6dd600dd7257 Pavel Skripkin      2021-12-30  234  		goto err;
2b6dd600dd7257 Pavel Skripkin      2021-12-30  235  
33f35429fc49c0 Gerd Hoffmann       2018-09-11  236  	ubuf->pages = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
fbb0de79507819 Gerd Hoffmann       2018-08-27  237  				    GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann       2018-08-27  238  	if (!ubuf->pages) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  239  		ret = -ENOMEM;
0d17455ca85ecb Gerd Hoffmann       2018-09-11  240  		goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  241  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  242  
fbb0de79507819 Gerd Hoffmann       2018-08-27  243  	pgbuf = 0;
fbb0de79507819 Gerd Hoffmann       2018-08-27  244  	for (i = 0; i < head->count; i++) {
7a1c67d7809423 Gerd Hoffmann       2018-09-11  245  		ret = -EBADFD;
fbb0de79507819 Gerd Hoffmann       2018-08-27  246  		memfd = fget(list[i].memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  247  		if (!memfd)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  248  			goto err;
ff58105a47ede2 Al Viro             2022-08-20  249  		mapping = memfd->f_mapping;
16c243e99d335e Vivek Kasireddy     2021-06-09  250  		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  251  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  252  		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
7a1c67d7809423 Gerd Hoffmann       2018-09-11  253  		if (seals == -EINVAL)
7a1c67d7809423 Gerd Hoffmann       2018-09-11  254  			goto err;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  255  		ret = -EINVAL;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  256  		if ((seals & SEALS_WANTED) != SEALS_WANTED ||
fbb0de79507819 Gerd Hoffmann       2018-08-27  257  		    (seals & SEALS_DENIED) != 0)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  258  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  259  		pgoff = list[i].offset >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  260  		pgcnt = list[i].size   >> PAGE_SHIFT;
16c243e99d335e Vivek Kasireddy     2021-06-09  261  		if (is_file_hugepages(memfd)) {
16c243e99d335e Vivek Kasireddy     2021-06-09  262  			hpstate = hstate_file(memfd);
16c243e99d335e Vivek Kasireddy     2021-06-09  263  			pgoff = list[i].offset >> huge_page_shift(hpstate);
16c243e99d335e Vivek Kasireddy     2021-06-09  264  			subpgoff = (list[i].offset &
16c243e99d335e Vivek Kasireddy     2021-06-09  265  				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
16c243e99d335e Vivek Kasireddy     2021-06-09  266  			maxsubpgs = huge_page_size(hpstate) >> PAGE_SHIFT;
16c243e99d335e Vivek Kasireddy     2021-06-09  267  		}
fbb0de79507819 Gerd Hoffmann       2018-08-27  268  		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
16c243e99d335e Vivek Kasireddy     2021-06-09  269  			if (is_file_hugepages(memfd)) {
16c243e99d335e Vivek Kasireddy     2021-06-09  270  				if (!hpage) {
16c243e99d335e Vivek Kasireddy     2021-06-09  271  					hpage = find_get_page_flags(mapping, pgoff,
16c243e99d335e Vivek Kasireddy     2021-06-09  272  								    FGP_ACCESSED);
b9770b0b6eac2b Pavel Skripkin      2021-08-11  273  					if (!hpage) {
b9770b0b6eac2b Pavel Skripkin      2021-08-11  274  						ret = -EINVAL;
16c243e99d335e Vivek Kasireddy     2021-06-09  275  						goto err;
16c243e99d335e Vivek Kasireddy     2021-06-09  276  					}
16c243e99d335e Vivek Kasireddy     2021-06-09  277  				}
16c243e99d335e Vivek Kasireddy     2021-06-09  278  				page = hpage + subpgoff;
16c243e99d335e Vivek Kasireddy     2021-06-09  279  				get_page(page);
16c243e99d335e Vivek Kasireddy     2021-06-09  280  				subpgoff++;
16c243e99d335e Vivek Kasireddy     2021-06-09  281  				if (subpgoff == maxsubpgs) {
16c243e99d335e Vivek Kasireddy     2021-06-09  282  					put_page(hpage);
16c243e99d335e Vivek Kasireddy     2021-06-09  283  					hpage = NULL;
16c243e99d335e Vivek Kasireddy     2021-06-09  284  					subpgoff = 0;
16c243e99d335e Vivek Kasireddy     2021-06-09  285  					pgoff++;
16c243e99d335e Vivek Kasireddy     2021-06-09  286  				}
16c243e99d335e Vivek Kasireddy     2021-06-09  287  			} else {
16c243e99d335e Vivek Kasireddy     2021-06-09  288  				page = shmem_read_mapping_page(mapping,
16c243e99d335e Vivek Kasireddy     2021-06-09  289  							       pgoff + pgidx);
fbb0de79507819 Gerd Hoffmann       2018-08-27  290  				if (IS_ERR(page)) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  291  					ret = PTR_ERR(page);
0d17455ca85ecb Gerd Hoffmann       2018-09-11  292  					goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  293  				}
16c243e99d335e Vivek Kasireddy     2021-06-09  294  			}
fbb0de79507819 Gerd Hoffmann       2018-08-27  295  			ubuf->pages[pgbuf++] = page;
fbb0de79507819 Gerd Hoffmann       2018-08-27  296  		}
fbb0de79507819 Gerd Hoffmann       2018-08-27  297  		fput(memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  298  		memfd = NULL;
16c243e99d335e Vivek Kasireddy     2021-06-09  299  		if (hpage) {
16c243e99d335e Vivek Kasireddy     2021-06-09  300  			put_page(hpage);
16c243e99d335e Vivek Kasireddy     2021-06-09  301  			hpage = NULL;
16c243e99d335e Vivek Kasireddy     2021-06-09  302  		}
0d17455ca85ecb Gerd Hoffmann       2018-09-11  303  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  304  
fbb0de79507819 Gerd Hoffmann       2018-08-27  305  	exp_info.ops  = &udmabuf_ops;
fbb0de79507819 Gerd Hoffmann       2018-08-27  306  	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  307  	exp_info.priv = ubuf;
5c074eeabbd332 Gerd Hoffmann       2018-11-14  308  	exp_info.flags = O_RDWR;
fbb0de79507819 Gerd Hoffmann       2018-08-27  309  
c1bbed66899726 Gurchetan Singh     2019-12-02  310  	ubuf->device = device;
fbb0de79507819 Gerd Hoffmann       2018-08-27  311  	buf = dma_buf_export(&exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  312  	if (IS_ERR(buf)) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  313  		ret = PTR_ERR(buf);
0d17455ca85ecb Gerd Hoffmann       2018-09-11  314  		goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  315  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  316  
fbb0de79507819 Gerd Hoffmann       2018-08-27  317  	flags = 0;
fbb0de79507819 Gerd Hoffmann       2018-08-27  318  	if (head->flags & UDMABUF_FLAGS_CLOEXEC)
fbb0de79507819 Gerd Hoffmann       2018-08-27  319  		flags |= O_CLOEXEC;
fbb0de79507819 Gerd Hoffmann       2018-08-27  320  	return dma_buf_fd(buf, flags);
fbb0de79507819 Gerd Hoffmann       2018-08-27  321  
0d17455ca85ecb Gerd Hoffmann       2018-09-11  322  err:
fbb0de79507819 Gerd Hoffmann       2018-08-27  323  	while (pgbuf > 0)
fbb0de79507819 Gerd Hoffmann       2018-08-27  324  		put_page(ubuf->pages[--pgbuf]);
683a0e630cb463 Gustavo A. R. Silva 2018-09-04  325  	if (memfd)
fbb0de79507819 Gerd Hoffmann       2018-08-27  326  		fput(memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  327  	kfree(ubuf->pages);
fbb0de79507819 Gerd Hoffmann       2018-08-27  328  	kfree(ubuf);
fbb0de79507819 Gerd Hoffmann       2018-08-27  329  	return ret;
fbb0de79507819 Gerd Hoffmann       2018-08-27  330  }
fbb0de79507819 Gerd Hoffmann       2018-08-27  331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
