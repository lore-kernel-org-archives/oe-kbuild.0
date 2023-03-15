Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AC16FD8
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678914970; x=1710450970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sapBchMAzpwfQe3kfOZdRs4RRoCGXywcsP0/sHHcLgA=;
  b=mO8lIAOhAfaLpmX4ELQaN8NbIr7vUIFDlp+y0/FHkjjEFQISbJBC6vqU
   +ciB9HB9WjG5buWorNt1zi0DAqsbLhB1YeVFz68PiaJIHIa63b6+DGWr/
   PcaGKAgJzl6mBqCtlmmyWFx6R6Zl8vIzAWrwhfdEhbrbf4D7FhpEj9/HU
   xnKxzdG+y6Dc58M0YpE8GqJetio3wh0/NHe/ymj5O0AJhYd3FhDm9vdeV
   NB9RJYMcAnsql8nRcN9GPhJlUEZrRUNL1OCinRikuaM6fca9BSYf09gxh
   0OezP3cjnjUl5YCM4iLLqXdHS7y18FeZmE3jrq8dDtB3gy8GyfqJOKAJ2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="402690484"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="402690484"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 14:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="709818616"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="709818616"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Mar 2023 14:16:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcYTf-00082b-28;
	Wed, 15 Mar 2023 21:16:07 +0000
Date: Thu, 16 Mar 2023 05:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:347:3: warning:
 Null pointer passed as 1st argument to memory copy function
 [clang-analyzer-unix.cstring.NullArg]
Message-ID: <202303160532.DTrvL2EZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:347:3: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maxim Mikityanskiy <maximmi@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6015b1aca1a233379625385feb01dd014aca60b5
commit: 9ded70fa1d8186135090f09638db7d8126dca0db net/mlx5e: Don't prefill WQEs in XDP SQ in the multi buffer mode
date:   12 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 12 months ago
config: powerpc-randconfig-c003-20230305 (https://download.01.org/0day-ci/archive/20230316/202303160532.DTrvL2EZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9ded70fa1d8186135090f09638db7d8126dca0db
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9ded70fa1d8186135090f09638db7d8126dca0db
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303160532.DTrvL2EZ-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:317:28: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                     ^
   kernel/bpf/lpm_trie.c:695:11: note: Taking false branch
                           node = rcu_dereference(node->child[0]);
                                  ^
   include/linux/rcupdate.h:603:28: note: expanded from macro 'rcu_dereference'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:531:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_dereference_check'
           typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:349:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:337:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:329:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/bpf/lpm_trie.c:695:11: note: Loop condition is false.  Exiting loop
                           node = rcu_dereference(node->child[0]);
                                  ^
   include/linux/rcupdate.h:603:28: note: expanded from macro 'rcu_dereference'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:531:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_dereference_check'
           typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
                                                    ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:349:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:337:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:321:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   kernel/bpf/lpm_trie.c:695:11: note: Left side of '&&' is false
                           node = rcu_dereference(node->child[0]);
                                  ^
   include/linux/rcupdate.h:603:28: note: expanded from macro 'rcu_dereference'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:531:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_dereference_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
           ^
   include/linux/rcupdate.h:347:48: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                                  ^
   kernel/bpf/lpm_trie.c:695:11: note: Loop condition is false.  Exiting loop
                           node = rcu_dereference(node->child[0]);
                                  ^
   include/linux/rcupdate.h:603:28: note: expanded from macro 'rcu_dereference'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:531:2: note: expanded from macro 'rcu_dereference_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:392:2: note: expanded from macro '__rcu_dereference_check'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
           ^
   include/linux/rcupdate.h:347:32: note: expanded from macro 'RCU_LOCKDEP_WARN'
   #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
                                  ^
   kernel/bpf/lpm_trie.c:693:2: note: Loop condition is false. Execution continues on line 704
           for (node = search_root; node;) {
           ^
   kernel/bpf/lpm_trie.c:704:24: note: Access to field 'prefixlen' results in a dereference of a null pointer (loaded from variable 'next_node')
           next_key->prefixlen = next_node->prefixlen;
                                 ^~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:347:3: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(eseg->inline_hdr.start, xdptxd->data, sizeof(eseg->inline_hdr.start));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:332:15: note: Assuming the condition is false
           if (unlikely(dma_len < MLX5E_XDP_MIN_INLINE || sq->hw_mtu < dma_len)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:332:15: note: Left side of '||' is false
           if (unlikely(dma_len < MLX5E_XDP_MIN_INLINE || sq->hw_mtu < dma_len)) {
                        ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:332:49: note: Assuming 'dma_len' is <= field 'hw_mtu'
           if (unlikely(dma_len < MLX5E_XDP_MIN_INLINE || sq->hw_mtu < dma_len)) {
                                                          ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:332:2: note: Taking false branch
           if (unlikely(dma_len < MLX5E_XDP_MIN_INLINE || sq->hw_mtu < dma_len)) {
           ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:337:6: note: Assuming 'check_result' is not equal to 0
           if (!check_result)
               ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:337:2: note: Taking false branch
           if (!check_result)
           ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:339:15: note: Assuming 'check_result' is >= 0
           if (unlikely(check_result < 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:339:2: note: Taking false branch
           if (unlikely(check_result < 0))
           ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:346:6: note: Assuming field 'min_inline_mode' is not equal to MLX5_INLINE_MODE_NONE
           if (sq->min_inline_mode != MLX5_INLINE_MODE_NONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:346:2: note: Taking true branch
           if (sq->min_inline_mode != MLX5_INLINE_MODE_NONE) {
           ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:347:3: note: Null pointer passed as 1st argument to memory copy function
                   memcpy(eseg->inline_hdr.start, xdptxd->data, sizeof(eseg->inline_hdr.start));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h:157:27: warning: Access to field 'byte_count' results in a dereference of a null pointer (loaded from variable 'inline_dseg') [clang-analyzer-core.NullDereference]
                   inline_dseg->byte_count = cpu_to_be32(dma_len | MLX5_INLINE_SEG);
                                           ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:273:15: note: Assuming field 'len' is <= field 'hw_mtu'
           if (unlikely(xdptxd->len > sq->hw_mtu)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:273:2: note: Taking false branch
           if (unlikely(xdptxd->len > sq->hw_mtu)) {
           ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:278:6: note: Assuming 'check_result' is not equal to 0
           if (!check_result)
               ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:278:2: note: Taking false branch
           if (!check_result)
           ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:280:15: note: Assuming 'check_result' is >= 0
           if (unlikely(check_result < 0))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:280:2: note: Taking false branch
           if (unlikely(check_result < 0))
           ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:283:6: note: Assuming 'check_result' is equal to MLX5E_XDP_CHECK_START_MPWQE
           if (check_result == MLX5E_XDP_CHECK_START_MPWQE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:283:2: note: Taking true branch
           if (check_result == MLX5E_XDP_CHECK_START_MPWQE) {
           ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:288:3: note: Calling 'mlx5e_xdp_mpwqe_session_start'
                   mlx5e_xdp_mpwqe_session_start(sq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:210:2: note: Null pointer value stored to field 'wqe'
           *session = (struct mlx5e_tx_mpwqe) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:288:3: note: Returning from 'mlx5e_xdp_mpwqe_session_start'
                   mlx5e_xdp_mpwqe_session_start(sq);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:291:2: note: Calling 'mlx5e_xdp_mpwqe_add_dseg'
           mlx5e_xdp_mpwqe_add_dseg(sq, xdptxd, stats);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h:144:2: note: 'dseg' initialized to a null pointer value
           struct mlx5_wqe_data_seg *dseg =
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h:151:15: note: Field 'inline_on' is 1
           if (session->inline_on && dma_len <= MLX5E_XDP_INLINE_WQE_SZ_THRSD) {
                        ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h:151:6: note: Left side of '&&' is true
           if (session->inline_on && dma_len <= MLX5E_XDP_INLINE_WQE_SZ_THRSD) {
               ^
   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h:151:28: note: Assuming the condition is true
           if (session->inline_on && dma_len <= MLX5E_XDP_INLINE_WQE_SZ_THRSD) {

vim +347 drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c

db05815b36cbd4 Maxim Mikityanskiy 2019-06-26  311  
93761ca17edf83 Tariq Toukan       2020-04-30  312  INDIRECT_CALLABLE_SCOPE bool
b39fe61edc50af Maxim Mikityanskiy 2020-04-16  313  mlx5e_xmit_xdp_frame(struct mlx5e_xdpsq *sq, struct mlx5e_xmit_data *xdptxd,
49529a1726850b Maxim Mikityanskiy 2022-01-28  314  		     int check_result)
159d21313423b5 Tariq Toukan       2018-07-15  315  {
159d21313423b5 Tariq Toukan       2018-07-15  316  	struct mlx5_wq_cyc       *wq   = &sq->wq;
159d21313423b5 Tariq Toukan       2018-07-15  317  	u16                       pi   = mlx5_wq_cyc_ctr2ix(wq, sq->pc);
159d21313423b5 Tariq Toukan       2018-07-15  318  	struct mlx5e_tx_wqe      *wqe  = mlx5_wq_cyc_get_wqe(wq, pi);
159d21313423b5 Tariq Toukan       2018-07-15  319  
159d21313423b5 Tariq Toukan       2018-07-15  320  	struct mlx5_wqe_ctrl_seg *cseg = &wqe->ctrl;
159d21313423b5 Tariq Toukan       2018-07-15  321  	struct mlx5_wqe_eth_seg  *eseg = &wqe->eth;
c94e4f117e473d Tariq Toukan       2018-07-15  322  	struct mlx5_wqe_data_seg *dseg = wqe->data;
159d21313423b5 Tariq Toukan       2018-07-15  323  
d963fa15113076 Maxim Mikityanskiy 2019-06-26  324  	dma_addr_t dma_addr = xdptxd->dma_addr;
d963fa15113076 Maxim Mikityanskiy 2019-06-26  325  	u32 dma_len = xdptxd->len;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  326  	u16 ds_cnt, inline_hdr_sz;
159d21313423b5 Tariq Toukan       2018-07-15  327  
890388ad6f6b37 Tariq Toukan       2018-05-22  328  	struct mlx5e_xdpsq_stats *stats = sq->stats;
159d21313423b5 Tariq Toukan       2018-07-15  329  
e20f0dbf204fe2 Tariq Toukan       2020-08-26  330  	net_prefetchw(wqe);
159d21313423b5 Tariq Toukan       2018-07-15  331  
c94e4f117e473d Tariq Toukan       2018-07-15  332  	if (unlikely(dma_len < MLX5E_XDP_MIN_INLINE || sq->hw_mtu < dma_len)) {
890388ad6f6b37 Tariq Toukan       2018-05-22  333  		stats->err++;
159d21313423b5 Tariq Toukan       2018-07-15  334  		return false;
159d21313423b5 Tariq Toukan       2018-07-15  335  	}
159d21313423b5 Tariq Toukan       2018-07-15  336  
db05815b36cbd4 Maxim Mikityanskiy 2019-06-26  337  	if (!check_result)
db05815b36cbd4 Maxim Mikityanskiy 2019-06-26  338  		check_result = mlx5e_xmit_xdp_frame_check(sq);
db05815b36cbd4 Maxim Mikityanskiy 2019-06-26  339  	if (unlikely(check_result < 0))
159d21313423b5 Tariq Toukan       2018-07-15  340  		return false;
159d21313423b5 Tariq Toukan       2018-07-15  341  
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  342  	ds_cnt = MLX5E_TX_WQE_EMPTY_DS_COUNT + 1;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  343  	inline_hdr_sz = 0;
159d21313423b5 Tariq Toukan       2018-07-15  344  
159d21313423b5 Tariq Toukan       2018-07-15  345  	/* copy the inline part if required */
159d21313423b5 Tariq Toukan       2018-07-15  346  	if (sq->min_inline_mode != MLX5_INLINE_MODE_NONE) {
ad5185735f7dab Kees Cook          2022-01-24 @347  		memcpy(eseg->inline_hdr.start, xdptxd->data, sizeof(eseg->inline_hdr.start));
ad5185735f7dab Kees Cook          2022-01-24  348  		memcpy(dseg, xdptxd->data + sizeof(eseg->inline_hdr.start),
ad5185735f7dab Kees Cook          2022-01-24  349  		       MLX5E_XDP_MIN_INLINE - sizeof(eseg->inline_hdr.start));
159d21313423b5 Tariq Toukan       2018-07-15  350  		dma_len  -= MLX5E_XDP_MIN_INLINE;
159d21313423b5 Tariq Toukan       2018-07-15  351  		dma_addr += MLX5E_XDP_MIN_INLINE;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  352  		inline_hdr_sz = MLX5E_XDP_MIN_INLINE;
159d21313423b5 Tariq Toukan       2018-07-15  353  		dseg++;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  354  		ds_cnt++;
159d21313423b5 Tariq Toukan       2018-07-15  355  	}
159d21313423b5 Tariq Toukan       2018-07-15  356  
159d21313423b5 Tariq Toukan       2018-07-15  357  	/* write the dma part */
159d21313423b5 Tariq Toukan       2018-07-15  358  	dseg->addr       = cpu_to_be64(dma_addr);
159d21313423b5 Tariq Toukan       2018-07-15  359  	dseg->byte_count = cpu_to_be32(dma_len);
159d21313423b5 Tariq Toukan       2018-07-15  360  
159d21313423b5 Tariq Toukan       2018-07-15  361  	cseg->opmod_idx_opcode = cpu_to_be32((sq->pc << 8) | MLX5_OPCODE_SEND);
159d21313423b5 Tariq Toukan       2018-07-15  362  
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  363  	if (unlikely(test_bit(MLX5E_SQ_STATE_XDP_MULTIBUF, &sq->state))) {
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  364  		u8 num_pkts = 1;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  365  		u8 num_wqebbs;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  366  
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  367  		memset(&cseg->signature, 0, sizeof(*cseg) -
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  368  		       sizeof(cseg->opmod_idx_opcode) - sizeof(cseg->qpn_ds));
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  369  		memset(eseg, 0, sizeof(*eseg) - sizeof(eseg->trailer));
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  370  
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  371  		eseg->inline_hdr.sz = cpu_to_be16(inline_hdr_sz);
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  372  		dseg->lkey = sq->mkey_be;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  373  
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  374  		cseg->qpn_ds = cpu_to_be32((sq->sqn << 8) | ds_cnt);
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  375  
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  376  		num_wqebbs = DIV_ROUND_UP(ds_cnt, MLX5_SEND_WQEBB_NUM_DS);
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  377  		sq->db.wqe_info[pi] = (struct mlx5e_xdp_wqe_info) {
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  378  			.num_wqebbs = num_wqebbs,
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  379  			.num_pkts = num_pkts,
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  380  		};
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  381  
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  382  		sq->pc += num_wqebbs;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  383  	} else {
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  384  		cseg->fm_ce_se = 0;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  385  
159d21313423b5 Tariq Toukan       2018-07-15  386  		sq->pc++;
9ded70fa1d8186 Maxim Mikityanskiy 2022-01-31  387  	}
159d21313423b5 Tariq Toukan       2018-07-15  388  
b8180392edd97c Tariq Toukan       2018-11-21  389  	sq->doorbell_cseg = cseg;
159d21313423b5 Tariq Toukan       2018-07-15  390  
890388ad6f6b37 Tariq Toukan       2018-05-22  391  	stats->xmit++;
159d21313423b5 Tariq Toukan       2018-07-15  392  	return true;
159d21313423b5 Tariq Toukan       2018-07-15  393  }
159d21313423b5 Tariq Toukan       2018-07-15  394  

:::::: The code at line 347 was first introduced by commit
:::::: ad5185735f7dab342fdd0dd41044da4c9ccfef67 net/mlx5e: Avoid field-overflowing memcpy()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
