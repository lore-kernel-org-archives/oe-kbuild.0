Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E91B641
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Mar 2023 05:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679032749; x=1710568749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k6RaQ8NkoKAtpjDKtpLF5Uxt2tkbMSdSGH3Yco61JWw=;
  b=MvYIyd8ralDUboS/kOkIC+CIwNlEK9iI0eRlWZZYr9BWLhjwc988fbLt
   9h2OrH6+h0tSn+Er2pROceG2DfKw0sVBMrYeODfnEOjj24rIRGxmsAOqx
   JNt7vJr1QmmsZ+5rhP9MUJjBU5Op1lvIxK85p9EG8NIf+qKmSX3ffntfr
   d2jZjgsqKbW5b1fBiQJA7g5iYmHAIP+ALmuaaF7RgkIoBC8yg3KgFMWYf
   BPXll7/+/eXg0sb7GMVOKYDe3x8S+vmPrBqiLiu+UmuAGPA3TGziHhzoy
   X9At54JCGkIPrtlKb5fQfl2XGV2/ykehPq4b+rCJwDOtjEEnOjFBlSKxu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335680323"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="335680323"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 22:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="769241049"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="769241049"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2023 22:58:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd37C-000998-1u;
	Fri, 17 Mar 2023 05:58:58 +0000
Date: Fri, 17 Mar 2023 13:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/mediatek/clk-mtk.c:573:24: warning: Branch condition
 evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Message-ID: <202303171310.O6nQiso3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/mediatek/clk-mtk.c:573:24: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Miles Chen <miles.chen@mediatek.com>
CC: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   38e04b3e4240a6d8fb43129ebad41608db64bc6f
commit: 7b6183108c8ccf0dc295f39cdf78bd8078455636 clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
date:   6 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20230310 (https://download.01.org/0day-ci/archive/20230317/202303171310.O6nQiso3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b6183108c8ccf0dc295f39cdf78bd8078455636
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7b6183108c8ccf0dc295f39cdf78bd8078455636
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303171310.O6nQiso3-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   # define __cond_lock(x,c) (c)
                              ^
   kernel/ucount.c:207:2: note: Taking true branch
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, flags)) {
           ^
   kernel/ucount.c:208:18: note: Passing null pointer value via 1st parameter 'n'
                   hlist_del_init(&ucounts->node);
                                  ^~~~~~~~~~~~~~
   kernel/ucount.c:208:3: note: Calling 'hlist_del_init'
                   hlist_del_init(&ucounts->node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:911:22: note: Passing null pointer value via 1st parameter 'h'
           if (!hlist_unhashed(n)) {
                               ^
   include/linux/list.h:911:7: note: Calling 'hlist_unhashed'
           if (!hlist_unhashed(n)) {
                ^~~~~~~~~~~~~~~~~
   include/linux/list.h:854:10: note: Access to field 'pprev' results in a dereference of a null pointer (loaded from variable 'h')
           return !h->pprev;
                   ^
   kernel/ucount.c:338:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           do_dec_rlimit_put_ucounts(ucounts, iter, type);
           ^                         ~~~~~~~
   kernel/ucount.c:317:2: note: Loop condition is true.  Entering loop body
           for (iter = ucounts; iter; iter = iter->ns->ucounts) {
           ^
   kernel/ucount.c:319:7: note: Assuming 'new' is >= 0
                   if (new < 0 || new > max)
                       ^~~~~~~
   kernel/ucount.c:319:7: note: Left side of '||' is false
   kernel/ucount.c:319:18: note: 'new' is <= 'max'
                   if (new < 0 || new > max)
                                  ^~~
   kernel/ucount.c:319:3: note: Taking false branch
                   if (new < 0 || new > max)
                   ^
   kernel/ucount.c:321:7: note: 'iter' is equal to 'ucounts'
                   if (iter == ucounts)
                       ^~~~
   kernel/ucount.c:321:3: note: Taking true branch
                   if (iter == ucounts)
                   ^
   kernel/ucount.c:328:7: note: Assuming 'new' is equal to 1
                   if (new != 1)
                       ^~~~~~~~
   kernel/ucount.c:328:3: note: Taking false branch
                   if (new != 1)
                   ^
   kernel/ucount.c:330:8: note: Calling 'get_ucounts'
                   if (!get_ucounts(iter))
                        ^~~~~~~~~~~~~~~~~
   kernel/ucount.c:157:2: note: Taking true branch
           if (!get_ucounts_or_wrap(ucounts)) {
           ^
   kernel/ucount.c:158:3: note: Calling 'put_ucounts'
                   put_ucounts(ucounts);
                   ^~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:207:6: note: Assuming the condition is true
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, flags)) {
               ^
   include/linux/spinlock.h:477:21: note: expanded from macro 'atomic_dec_and_lock_irqsave'
                   __cond_lock(lock, _atomic_dec_and_lock_irqsave(atomic, lock, &(flags)))
                   ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:63:28: note: expanded from macro '__cond_lock'
   # define __cond_lock(x,c) (c)
                              ^
   kernel/ucount.c:207:2: note: Taking true branch
           if (atomic_dec_and_lock_irqsave(&ucounts->count, &ucounts_lock, flags)) {
           ^
   kernel/ucount.c:211:3: note: Memory is released
                   kfree(ucounts);
                   ^~~~~~~~~~~~~~
   kernel/ucount.c:158:3: note: Returning; memory was released via 1st parameter
                   put_ucounts(ucounts);
                   ^~~~~~~~~~~~~~~~~~~~
   kernel/ucount.c:330:8: note: Returning; memory was released via 1st parameter
                   if (!get_ucounts(iter))
                        ^~~~~~~~~~~~~~~~~
   kernel/ucount.c:330:3: note: Taking true branch
                   if (!get_ucounts(iter))
                   ^
   kernel/ucount.c:331:4: note: Control jumps to line 335
                           goto dec_unwind;
                           ^
   kernel/ucount.c:336:15: note: Assuming 'dec' is >= 0
           WARN_ON_ONCE(dec < 0);
                        ^
   include/asm-generic/bug.h:180:41: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   kernel/ucount.c:338:2: note: Use of memory after it is freed
           do_dec_rlimit_put_ucounts(ucounts, iter, type);
           ^                         ~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/mediatek/clk-mtk.c:573:24: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (mcd->shared_io && base)
                                 ^~~~
   drivers/clk/mediatek/clk-mtk.c:471:2: note: 'base' declared without an initial value
           void __iomem *base;
           ^~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:475:6: note: Assuming 'mcd' is non-null
           if (!mcd)
               ^~~~
   drivers/clk/mediatek/clk-mtk.c:475:2: note: Taking false branch
           if (!mcd)
           ^
   drivers/clk/mediatek/clk-mtk.c:479:6: note: Assuming field 'composite_clks' is null
           if (mcd->composite_clks) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:479:2: note: Taking false branch
           if (mcd->composite_clks) {
           ^
   drivers/clk/mediatek/clk-mtk.c:494:13: note: Calling 'mtk_alloc_clk_data'
           clk_data = mtk_alloc_clk_data(num_clks);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:70:13: note: Calling 'kzalloc'
           clk_data = kzalloc(struct_size(clk_data, hws, clk_num), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:573:33: note: Left side of '&&' is false
           if (__builtin_constant_p(size) && size) {
                                          ^
   include/linux/slab.h:584:2: note: Returning pointer, which participates in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:720:2: note: Returning pointer, which participates in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:70:13: note: Returning from 'kzalloc'
           clk_data = kzalloc(struct_size(clk_data, hws, clk_num), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:71:6: note: Assuming 'clk_data' is non-null, which participates in a condition later
           if (!clk_data)
               ^~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:71:2: note: Taking false branch
           if (!clk_data)
           ^
   drivers/clk/mediatek/clk-mtk.c:76:2: note: Returning pointer (loaded from 'clk_data'), which participates in a condition later
           return clk_data;
           ^~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:494:13: note: Returning from 'mtk_alloc_clk_data'
           clk_data = mtk_alloc_clk_data(num_clks);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:495:7: note: 'clk_data' is non-null
           if (!clk_data)
                ^~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:495:2: note: Taking false branch
           if (!clk_data)
           ^
   drivers/clk/mediatek/clk-mtk.c:498:6: note: Assuming field 'fixed_clks' is non-null
           if (mcd->fixed_clks) {
               ^~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:498:2: note: Taking true branch
           if (mcd->fixed_clks) {
           ^
   drivers/clk/mediatek/clk-mtk.c:501:7: note: Assuming 'r' is not equal to 0
                   if (r)
                       ^
   drivers/clk/mediatek/clk-mtk.c:501:3: note: Taking true branch
                   if (r)
                   ^
   drivers/clk/mediatek/clk-mtk.c:502:4: note: Control jumps to line 572
                           goto free_data;
                           ^
   drivers/clk/mediatek/clk-mtk.c:573:6: note: Assuming field 'shared_io' is true
           if (mcd->shared_io && base)
               ^~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mtk.c:573:6: note: Left side of '&&' is true
   drivers/clk/mediatek/clk-mtk.c:573:24: note: Branch condition evaluates to a garbage value
           if (mcd->shared_io && base)
                                 ^~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   kernel/bpf/lpm_trie.c:705:24: warning: Access to field 'prefixlen' results in a dereference of a null pointer (loaded from variable 'next_node') [clang-analyzer-core.NullDereference]
           next_key->prefixlen = next_node->prefixlen;
                                 ^~~~~~~~~
   kernel/bpf/lpm_trie.c:617:31: note: 'next_node' initialized to a null pointer value
           struct lpm_trie_node *node, *next_node = NULL, *parent, *search_root;
                                        ^~~~~~~~~
   kernel/bpf/lpm_trie.c:637:16: note: Left side of '||' is false
           search_root = rcu_dereference(trie->root);
                         ^
   include/linux/rcupdate.h:673:28: note: expanded from macro 'rcu_dereference'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:601:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^

vim +573 drivers/clk/mediatek/clk-mtk.c

b87385eb5a8ed2 Chen-Yu Tsai               2022-02-08  465  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  466  int mtk_clk_simple_probe(struct platform_device *pdev)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  467  {
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  468  	const struct mtk_clk_desc *mcd;
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  469  	struct clk_hw_onecell_data *clk_data;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  470  	struct device_node *node = pdev->dev.of_node;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  471  	void __iomem *base;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  472  	int num_clks, r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  473  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  474  	mcd = of_device_get_match_data(&pdev->dev);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  475  	if (!mcd)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  476  		return -EINVAL;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  477  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  478  	/* Composite clocks needs us to pass iomem pointer */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  479  	if (mcd->composite_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  480  		if (!mcd->shared_io)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  481  			base = devm_platform_ioremap_resource(pdev, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  482  		else
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  483  			base = of_iomap(node, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  484  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  485  		if (IS_ERR_OR_NULL(base))
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  486  			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  487  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  488  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  489  	/* Calculate how many clk_hw_onecell_data entries to allocate */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  490  	num_clks = mcd->num_clks + mcd->num_composite_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  491  	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  492  	num_clks += mcd->num_mux_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  493  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  494  	clk_data = mtk_alloc_clk_data(num_clks);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  495  	if (!clk_data)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  496  		return -ENOMEM;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  497  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  498  	if (mcd->fixed_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  499  		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  500  						mcd->num_fixed_clks, clk_data);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  501  		if (r)
6203815bf97eea Chun-Jie Chen              2021-09-14  502  			goto free_data;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  503  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  504  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  505  	if (mcd->factor_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  506  		r = mtk_clk_register_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  507  					     mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  508  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  509  			goto unregister_fixed_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  510  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  511  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  512  	if (mcd->mux_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  513  		r = mtk_clk_register_muxes(&pdev->dev, mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  514  					   mcd->num_mux_clks, node,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  515  					   mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  516  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  517  			goto unregister_factors;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  518  	};
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  519  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  520  	if (mcd->composite_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  521  		/* We don't check composite_lock because it's optional */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  522  		r = mtk_clk_register_composites(&pdev->dev,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  523  						mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  524  						mcd->num_composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  525  						base, mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  526  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  527  			goto unregister_muxes;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  528  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  529  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  530  	if (mcd->clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  531  		r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  532  					   mcd->num_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  533  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  534  			goto unregister_composites;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  535  	}
6203815bf97eea Chun-Jie Chen              2021-09-14  536  
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  537  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  538  	if (r)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  539  		goto unregister_clks;
6203815bf97eea Chun-Jie Chen              2021-09-14  540  
2204d96b191912 Chen-Yu Tsai               2022-02-08  541  	platform_set_drvdata(pdev, clk_data);
2204d96b191912 Chen-Yu Tsai               2022-02-08  542  
b27a604a579310 Rex-BC Chen                2022-05-23  543  	if (mcd->rst_desc) {
b27a604a579310 Rex-BC Chen                2022-05-23  544  		r = mtk_register_reset_controller_with_dev(&pdev->dev,
b27a604a579310 Rex-BC Chen                2022-05-23  545  							   mcd->rst_desc);
b27a604a579310 Rex-BC Chen                2022-05-23  546  		if (r)
b27a604a579310 Rex-BC Chen                2022-05-23  547  			goto unregister_clks;
b27a604a579310 Rex-BC Chen                2022-05-23  548  	}
b27a604a579310 Rex-BC Chen                2022-05-23  549  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  550  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  551  
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  552  unregister_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  553  	if (mcd->clks)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  554  		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  555  unregister_composites:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  556  	if (mcd->composite_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  557  		mtk_clk_unregister_composites(mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  558  					      mcd->num_composite_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  559  unregister_muxes:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  560  	if (mcd->mux_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  561  		mtk_clk_unregister_muxes(mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  562  					 mcd->num_mux_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  563  unregister_factors:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  564  	if (mcd->factor_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  565  		mtk_clk_unregister_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  566  					   mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  567  unregister_fixed_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  568  	if (mcd->fixed_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  569  		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  570  					      mcd->num_fixed_clks, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  571  free_data:
6203815bf97eea Chun-Jie Chen              2021-09-14  572  	mtk_free_clk_data(clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20 @573  	if (mcd->shared_io && base)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  574  		iounmap(base);
6203815bf97eea Chun-Jie Chen              2021-09-14  575  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  576  }
7cbe5cb291fa3c AngeloGioacchino Del Regno 2022-09-21  577  EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
32b028fb1d09a0 Miles Chen                 2021-09-02  578  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
