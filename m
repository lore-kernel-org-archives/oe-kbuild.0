Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFC160
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jan 2023 00:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675037952; x=1706573952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tK5hyCZYxmPtXwRsM/Ma4bM1X+C/al46uMhVpHyRmss=;
  b=a3AKASLKCmoadUTaXNDSu/IlPQQsZ9hV9u7cTYPcZM2z7g9oPWEuZQf3
   +pTmsY+shw8IAv9QHk4rqV/tdBSkqmlUUB0zK612qxeDAa9mv8Oxg2aqy
   2lNHH/2AiLsmHv/fS+wFx9gHtV1Vpvrz3IMaRUJT0iPamKFeXIzcnZJ2/
   O/6wQEFxiIfLHzvRTortqnDBh3p2PhQzMiCjhOYZIqDQBQPor00AFTQat
   H4kH799lvzSzmccG51mYjAeS/e8Ot1h5pzoiSGE8AONlyB+Ad9vRHpifj
   r30wYaficbv7on1pNUlDxhI0GcOIA68EUmTM6d+sQ+CRJSQ4ydwptSbMG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307793000"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="307793000"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 16:19:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="772289111"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="772289111"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2023 16:19:10 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMHt7-0003CY-1x;
	Mon, 30 Jan 2023 00:19:09 +0000
Date: Mon, 30 Jan 2023 08:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/staging/media/meson/vdec/codec_vp9.c:1688:4: warning: Value
 stored to 'coef_node_start' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301300815.z9RQ9gDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/staging/media/meson/vdec/codec_vp9.c:1688:4: warning: Value stored to 'coef_node_start' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d796c50f84ca79f1722bb131799e5a5710c4700
commit: 5e1a33759a57b5c075187b6f12f0f57c964ed1c4 media: meson/vdec: always init coef_node_start
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20230128 (https://download.01.org/0day-ci/archive/20230130/202301300815.z9RQ9gDG-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5e1a33759a57b5c075187b6f12f0f57c964ed1c4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5e1a33759a57b5c075187b6f12f0f57c964ed1c4
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
               ^~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2087:2: note: Taking false branch
           if (!vp9)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2091:6: note: Assuming 'dec_status' is equal to VP9_HEAD_PARSER_DONE
           if (dec_status != VP9_HEAD_PARSER_DONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2091:2: note: Taking false branch
           if (dec_status != VP9_HEAD_PARSER_DONE) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2098:2: note: Taking false branch
           pr_debug("ISR: %08X;%08X\n", dec_status, prob_status);
           ^
   include/linux/printk.h:587:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2101:6: note: Assuming the condition is false
           if ((prob_status & 0xff) == 0xfd && vp9->cur_frame) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2101:35: note: Left side of '&&' is false
           if ((prob_status & 0xff) == 0xfd && vp9->cur_frame) {
                                            ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2126:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < REFS_PER_FRAME ; ++i)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2126:2: note: Loop condition is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2126:2: note: Loop condition is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2126:2: note: Loop condition is false. Execution continues on line 2129
   drivers/staging/media/meson/vdec/codec_vp9.c:2133:2: note: Taking false branch
           if (codec_vp9_process_rpm(vp9)) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2150:2: note: Calling 'codec_vp9_process_frame'
           codec_vp9_process_frame(sess);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:6: note: Assuming field 'show_frame' is 0
           if (!param->p.show_frame)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:2: note: Taking true branch
           if (!param->p.show_frame)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1267:3: note: Calling 'codec_vp9_rm_noshow_frame'
                   codec_vp9_rm_noshow_frame(sess);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(tmp, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:674:2: note: expanded from macro 'list_for_each_entry'
           for (pos = list_first_entry(head, typeof(*pos), member);        \
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1247:7: note: Assuming field 'show' is 0
                   if (tmp->show)
                       ^~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1247:3: note: Taking false branch
                   if (tmp->show)
                   ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1250:3: note: Taking false branch
                   pr_debug("rm noshow: %u\n", tmp->index);
                   ^
   include/linux/printk.h:587:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1253:3: note: Memory is released
                   kfree(tmp);
                   ^~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1267:3: note: Returning; memory was released
                   codec_vp9_rm_noshow_frame(sess);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1270:12: note: Field 'cur_frame' is null
           if (!vp9->cur_frame)
                     ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1270:2: note: Taking true branch
           if (!vp9->cur_frame)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2150:2: note: Returning; memory was released
           codec_vp9_process_frame(sess);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2151:2: note: Calling 'codec_vp9_show_frame'
           codec_vp9_show_frame(sess);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1422:2: note: Use of memory after it is freed
           list_for_each_entry_safe(tmp, n, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_entry_safe'
                   n = list_next_entry(pos, member);                       \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                  ^~~~~
>> drivers/staging/media/meson/vdec/codec_vp9.c:1688:4: warning: Value stored to 'coef_node_start' is never read [clang-analyzer-deadcode.DeadStores]
                           coef_node_start = coef_node_start + 1;
                           ^                 ~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1688:4: note: Value stored to 'coef_node_start' is never read
                           coef_node_start = coef_node_start + 1;
                           ^                 ~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/of/device.c:59:29: warning: Value stored to 'of_node' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *node, *of_node = dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   drivers/of/device.c:59:29: note: Value stored to 'of_node' during its initialization is never read
           struct device_node *node, *of_node = dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/coef_node_start +1688 drivers/staging/media/meson/vdec/codec_vp9.c

00c43088aa6809 Maxime Jourdan 2020-03-04  1540  
00c43088aa6809 Maxime Jourdan 2020-03-04  1541  static void adapt_coef_probs(int prev_kf, int cur_kf, int pre_fc,
00c43088aa6809 Maxime Jourdan 2020-03-04  1542  			     unsigned int *prev_prob, unsigned int *cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  1543  			     unsigned int *count)
00c43088aa6809 Maxime Jourdan 2020-03-04  1544  {
00c43088aa6809 Maxime Jourdan 2020-03-04  1545  	int tx_size, coef_tx_size_start, coef_count_tx_size_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1546  	int plane, coef_plane_start, coef_count_plane_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1547  	int type, coef_type_start, coef_count_type_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1548  	int band, coef_band_start, coef_count_band_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1549  	int cxt_num;
00c43088aa6809 Maxime Jourdan 2020-03-04  1550  	int coef_cxt_start, coef_count_cxt_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1551  	int node, coef_node_start, coef_count_node_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1552  
00c43088aa6809 Maxime Jourdan 2020-03-04  1553  	int tree_i, tree_left, tree_right;
00c43088aa6809 Maxime Jourdan 2020-03-04  1554  	int mvd_i;
00c43088aa6809 Maxime Jourdan 2020-03-04  1555  
00c43088aa6809 Maxime Jourdan 2020-03-04  1556  	int update_factor = cur_kf ? 112 : (prev_kf ? 128 : 112);
00c43088aa6809 Maxime Jourdan 2020-03-04  1557  
00c43088aa6809 Maxime Jourdan 2020-03-04  1558  	int prob_32;
00c43088aa6809 Maxime Jourdan 2020-03-04  1559  	int prob_res;
00c43088aa6809 Maxime Jourdan 2020-03-04  1560  	int prob_shift;
00c43088aa6809 Maxime Jourdan 2020-03-04  1561  	int pre_prob;
00c43088aa6809 Maxime Jourdan 2020-03-04  1562  
00c43088aa6809 Maxime Jourdan 2020-03-04  1563  	int den;
00c43088aa6809 Maxime Jourdan 2020-03-04  1564  	int get_prob;
00c43088aa6809 Maxime Jourdan 2020-03-04  1565  	int m_count;
00c43088aa6809 Maxime Jourdan 2020-03-04  1566  	int factor;
00c43088aa6809 Maxime Jourdan 2020-03-04  1567  
00c43088aa6809 Maxime Jourdan 2020-03-04  1568  	int new_prob;
00c43088aa6809 Maxime Jourdan 2020-03-04  1569  
00c43088aa6809 Maxime Jourdan 2020-03-04  1570  	for (tx_size = 0 ; tx_size < 4 ; tx_size++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1571  		coef_tx_size_start = VP9_COEF_START +
00c43088aa6809 Maxime Jourdan 2020-03-04  1572  				tx_size * 4 * VP9_COEF_SIZE_ONE_SET;
00c43088aa6809 Maxime Jourdan 2020-03-04  1573  		coef_count_tx_size_start = VP9_COEF_COUNT_START +
00c43088aa6809 Maxime Jourdan 2020-03-04  1574  				tx_size * 4 * VP9_COEF_COUNT_SIZE_ONE_SET;
00c43088aa6809 Maxime Jourdan 2020-03-04  1575  		coef_plane_start = coef_tx_size_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1576  		coef_count_plane_start = coef_count_tx_size_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1577  
00c43088aa6809 Maxime Jourdan 2020-03-04  1578  		for (plane = 0 ; plane < 2 ; plane++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1579  			coef_type_start = coef_plane_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1580  			coef_count_type_start = coef_count_plane_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1581  
00c43088aa6809 Maxime Jourdan 2020-03-04  1582  			for (type = 0 ; type < 2 ; type++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1583  				coef_band_start = coef_type_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1584  				coef_count_band_start = coef_count_type_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1585  
00c43088aa6809 Maxime Jourdan 2020-03-04  1586  				for (band = 0 ; band < 6 ; band++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1587  					if (band == 0)
00c43088aa6809 Maxime Jourdan 2020-03-04  1588  						cxt_num = 3;
00c43088aa6809 Maxime Jourdan 2020-03-04  1589  					else
00c43088aa6809 Maxime Jourdan 2020-03-04  1590  						cxt_num = 6;
00c43088aa6809 Maxime Jourdan 2020-03-04  1591  					coef_cxt_start = coef_band_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1592  					coef_count_cxt_start =
00c43088aa6809 Maxime Jourdan 2020-03-04  1593  						coef_count_band_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1594  
00c43088aa6809 Maxime Jourdan 2020-03-04  1595  					adapt_coef_probs_cxt(prev_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  1596  							     cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  1597  							     count,
00c43088aa6809 Maxime Jourdan 2020-03-04  1598  							     update_factor,
00c43088aa6809 Maxime Jourdan 2020-03-04  1599  							     cxt_num,
00c43088aa6809 Maxime Jourdan 2020-03-04  1600  							     coef_cxt_start,
00c43088aa6809 Maxime Jourdan 2020-03-04  1601  							coef_count_cxt_start);
00c43088aa6809 Maxime Jourdan 2020-03-04  1602  
00c43088aa6809 Maxime Jourdan 2020-03-04  1603  					if (band == 0) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1604  						coef_band_start += 10;
00c43088aa6809 Maxime Jourdan 2020-03-04  1605  						coef_count_band_start += 15;
00c43088aa6809 Maxime Jourdan 2020-03-04  1606  					} else {
00c43088aa6809 Maxime Jourdan 2020-03-04  1607  						coef_band_start += 18;
00c43088aa6809 Maxime Jourdan 2020-03-04  1608  						coef_count_band_start += 30;
00c43088aa6809 Maxime Jourdan 2020-03-04  1609  					}
00c43088aa6809 Maxime Jourdan 2020-03-04  1610  				}
00c43088aa6809 Maxime Jourdan 2020-03-04  1611  				coef_type_start += VP9_COEF_SIZE_ONE_SET;
00c43088aa6809 Maxime Jourdan 2020-03-04  1612  				coef_count_type_start +=
00c43088aa6809 Maxime Jourdan 2020-03-04  1613  					VP9_COEF_COUNT_SIZE_ONE_SET;
00c43088aa6809 Maxime Jourdan 2020-03-04  1614  			}
00c43088aa6809 Maxime Jourdan 2020-03-04  1615  
00c43088aa6809 Maxime Jourdan 2020-03-04  1616  			coef_plane_start += 2 * VP9_COEF_SIZE_ONE_SET;
00c43088aa6809 Maxime Jourdan 2020-03-04  1617  			coef_count_plane_start +=
00c43088aa6809 Maxime Jourdan 2020-03-04  1618  				2 * VP9_COEF_COUNT_SIZE_ONE_SET;
00c43088aa6809 Maxime Jourdan 2020-03-04  1619  		}
00c43088aa6809 Maxime Jourdan 2020-03-04  1620  	}
00c43088aa6809 Maxime Jourdan 2020-03-04  1621  
00c43088aa6809 Maxime Jourdan 2020-03-04  1622  	if (cur_kf == 0) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1623  		/* mode_mv_merge_probs - merge_intra_inter_prob */
00c43088aa6809 Maxime Jourdan 2020-03-04  1624  		for (coef_count_node_start = VP9_INTRA_INTER_COUNT_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1625  		     coef_count_node_start < (VP9_MV_CLASS0_HP_1_COUNT_START +
00c43088aa6809 Maxime Jourdan 2020-03-04  1626  					      VP9_MV_CLASS0_HP_1_COUNT_SIZE);
00c43088aa6809 Maxime Jourdan 2020-03-04  1627  		     coef_count_node_start += 2) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1628  			if (coef_count_node_start ==
00c43088aa6809 Maxime Jourdan 2020-03-04  1629  					VP9_INTRA_INTER_COUNT_START)
00c43088aa6809 Maxime Jourdan 2020-03-04  1630  				coef_node_start = VP9_INTRA_INTER_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1631  			else if (coef_count_node_start ==
00c43088aa6809 Maxime Jourdan 2020-03-04  1632  					VP9_COMP_INTER_COUNT_START)
00c43088aa6809 Maxime Jourdan 2020-03-04  1633  				coef_node_start = VP9_COMP_INTER_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1634  			else if (coef_count_node_start ==
00c43088aa6809 Maxime Jourdan 2020-03-04  1635  					VP9_TX_MODE_COUNT_START)
00c43088aa6809 Maxime Jourdan 2020-03-04  1636  				coef_node_start = VP9_TX_MODE_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1637  			else if (coef_count_node_start ==
00c43088aa6809 Maxime Jourdan 2020-03-04  1638  					VP9_SKIP_COUNT_START)
00c43088aa6809 Maxime Jourdan 2020-03-04  1639  				coef_node_start = VP9_SKIP_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1640  			else if (coef_count_node_start ==
00c43088aa6809 Maxime Jourdan 2020-03-04  1641  					VP9_MV_SIGN_0_COUNT_START)
00c43088aa6809 Maxime Jourdan 2020-03-04  1642  				coef_node_start = VP9_MV_SIGN_0_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1643  			else if (coef_count_node_start ==
00c43088aa6809 Maxime Jourdan 2020-03-04  1644  					VP9_MV_SIGN_1_COUNT_START)
00c43088aa6809 Maxime Jourdan 2020-03-04  1645  				coef_node_start = VP9_MV_SIGN_1_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1646  			else if (coef_count_node_start ==
00c43088aa6809 Maxime Jourdan 2020-03-04  1647  					VP9_MV_BITS_0_COUNT_START)
00c43088aa6809 Maxime Jourdan 2020-03-04  1648  				coef_node_start = VP9_MV_BITS_0_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1649  			else if (coef_count_node_start ==
00c43088aa6809 Maxime Jourdan 2020-03-04  1650  					VP9_MV_BITS_1_COUNT_START)
00c43088aa6809 Maxime Jourdan 2020-03-04  1651  				coef_node_start = VP9_MV_BITS_1_START;
5e1a33759a57b5 Hans Verkuil   2022-09-30  1652  			else /* node_start == VP9_MV_CLASS0_HP_0_COUNT_START */
00c43088aa6809 Maxime Jourdan 2020-03-04  1653  				coef_node_start = VP9_MV_CLASS0_HP_0_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1654  
00c43088aa6809 Maxime Jourdan 2020-03-04  1655  			den = count[coef_count_node_start] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1656  			      count[coef_count_node_start + 1];
00c43088aa6809 Maxime Jourdan 2020-03-04  1657  
00c43088aa6809 Maxime Jourdan 2020-03-04  1658  			prob_32 = prev_prob[coef_node_start / 4 * 2];
00c43088aa6809 Maxime Jourdan 2020-03-04  1659  			prob_res = coef_node_start & 3;
00c43088aa6809 Maxime Jourdan 2020-03-04  1660  			prob_shift = prob_res * 8;
00c43088aa6809 Maxime Jourdan 2020-03-04  1661  			pre_prob = (prob_32 >> prob_shift) & 0xff;
00c43088aa6809 Maxime Jourdan 2020-03-04  1662  
00c43088aa6809 Maxime Jourdan 2020-03-04  1663  			if (den == 0) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1664  				new_prob = pre_prob;
00c43088aa6809 Maxime Jourdan 2020-03-04  1665  			} else {
00c43088aa6809 Maxime Jourdan 2020-03-04  1666  				m_count = den < MODE_MV_COUNT_SAT ?
00c43088aa6809 Maxime Jourdan 2020-03-04  1667  						den : MODE_MV_COUNT_SAT;
00c43088aa6809 Maxime Jourdan 2020-03-04  1668  				get_prob =
00c43088aa6809 Maxime Jourdan 2020-03-04  1669  				clip_prob(div_r32(((int64_t)
00c43088aa6809 Maxime Jourdan 2020-03-04  1670  					count[coef_count_node_start] * 256 +
00c43088aa6809 Maxime Jourdan 2020-03-04  1671  					(den >> 1)),
00c43088aa6809 Maxime Jourdan 2020-03-04  1672  					den));
00c43088aa6809 Maxime Jourdan 2020-03-04  1673  
00c43088aa6809 Maxime Jourdan 2020-03-04  1674  				/* weighted prob */
00c43088aa6809 Maxime Jourdan 2020-03-04  1675  				factor = count_to_update_factor[m_count];
00c43088aa6809 Maxime Jourdan 2020-03-04  1676  				new_prob =
00c43088aa6809 Maxime Jourdan 2020-03-04  1677  					round_power_of_two(pre_prob *
00c43088aa6809 Maxime Jourdan 2020-03-04  1678  							   (256 - factor) +
00c43088aa6809 Maxime Jourdan 2020-03-04  1679  							   get_prob * factor,
00c43088aa6809 Maxime Jourdan 2020-03-04  1680  							   8);
00c43088aa6809 Maxime Jourdan 2020-03-04  1681  			}
00c43088aa6809 Maxime Jourdan 2020-03-04  1682  
00c43088aa6809 Maxime Jourdan 2020-03-04  1683  			cur_prob[coef_node_start / 4 * 2] =
00c43088aa6809 Maxime Jourdan 2020-03-04  1684  				(cur_prob[coef_node_start / 4 * 2] &
00c43088aa6809 Maxime Jourdan 2020-03-04  1685  				 (~(0xff << prob_shift))) |
00c43088aa6809 Maxime Jourdan 2020-03-04  1686  				(new_prob << prob_shift);
00c43088aa6809 Maxime Jourdan 2020-03-04  1687  
00c43088aa6809 Maxime Jourdan 2020-03-04 @1688  			coef_node_start = coef_node_start + 1;
00c43088aa6809 Maxime Jourdan 2020-03-04  1689  		}
00c43088aa6809 Maxime Jourdan 2020-03-04  1690  
00c43088aa6809 Maxime Jourdan 2020-03-04  1691  		coef_node_start = VP9_INTER_MODE_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1692  		coef_count_node_start = VP9_INTER_MODE_COUNT_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1693  		for (tree_i = 0 ; tree_i < 7 ; tree_i++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1694  			for (node = 0 ; node < 3 ; node++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1695  				unsigned int start = coef_count_node_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1696  
00c43088aa6809 Maxime Jourdan 2020-03-04  1697  				switch (node) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1698  				case 2:
00c43088aa6809 Maxime Jourdan 2020-03-04  1699  					tree_left = count[start + 1];
00c43088aa6809 Maxime Jourdan 2020-03-04  1700  					tree_right = count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1701  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1702  				case 1:
00c43088aa6809 Maxime Jourdan 2020-03-04  1703  					tree_left = count[start + 0];
00c43088aa6809 Maxime Jourdan 2020-03-04  1704  					tree_right = count[start + 1] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1705  						     count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1706  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1707  				default:
00c43088aa6809 Maxime Jourdan 2020-03-04  1708  					tree_left = count[start + 2];
00c43088aa6809 Maxime Jourdan 2020-03-04  1709  					tree_right = count[start + 0] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1710  						     count[start + 1] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1711  						     count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1712  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1713  				}
00c43088aa6809 Maxime Jourdan 2020-03-04  1714  
00c43088aa6809 Maxime Jourdan 2020-03-04  1715  				vp9_tree_merge_probs(prev_prob, cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  1716  						     coef_node_start,
00c43088aa6809 Maxime Jourdan 2020-03-04  1717  						     tree_left, tree_right,
00c43088aa6809 Maxime Jourdan 2020-03-04  1718  						     tree_i, node);
00c43088aa6809 Maxime Jourdan 2020-03-04  1719  
00c43088aa6809 Maxime Jourdan 2020-03-04  1720  				coef_node_start = coef_node_start + 1;
00c43088aa6809 Maxime Jourdan 2020-03-04  1721  			}
00c43088aa6809 Maxime Jourdan 2020-03-04  1722  
00c43088aa6809 Maxime Jourdan 2020-03-04  1723  			coef_count_node_start = coef_count_node_start + 4;
00c43088aa6809 Maxime Jourdan 2020-03-04  1724  		}
00c43088aa6809 Maxime Jourdan 2020-03-04  1725  
00c43088aa6809 Maxime Jourdan 2020-03-04  1726  		coef_node_start = VP9_IF_Y_MODE_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1727  		coef_count_node_start = VP9_IF_Y_MODE_COUNT_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1728  		for (tree_i = 0 ; tree_i < 14 ; tree_i++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1729  			for (node = 0 ; node < 9 ; node++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1730  				unsigned int start = coef_count_node_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1731  
00c43088aa6809 Maxime Jourdan 2020-03-04  1732  				switch (node) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1733  				case 8:
00c43088aa6809 Maxime Jourdan 2020-03-04  1734  					tree_left =
00c43088aa6809 Maxime Jourdan 2020-03-04  1735  						count[start + D153_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1736  					tree_right =
00c43088aa6809 Maxime Jourdan 2020-03-04  1737  						count[start + D207_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1738  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1739  				case 7:
00c43088aa6809 Maxime Jourdan 2020-03-04  1740  					tree_left =
00c43088aa6809 Maxime Jourdan 2020-03-04  1741  						count[start + D63_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1742  					tree_right =
00c43088aa6809 Maxime Jourdan 2020-03-04  1743  						count[start + D207_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1744  						count[start + D153_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1745  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1746  				case 6:
00c43088aa6809 Maxime Jourdan 2020-03-04  1747  					tree_left =
00c43088aa6809 Maxime Jourdan 2020-03-04  1748  						count[start + D45_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1749  					tree_right =
00c43088aa6809 Maxime Jourdan 2020-03-04  1750  						count[start + D207_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1751  						count[start + D153_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1752  						count[start + D63_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1753  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1754  				case 5:
00c43088aa6809 Maxime Jourdan 2020-03-04  1755  					tree_left =
00c43088aa6809 Maxime Jourdan 2020-03-04  1756  						count[start + D135_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1757  					tree_right =
00c43088aa6809 Maxime Jourdan 2020-03-04  1758  						count[start + D117_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1759  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1760  				case 4:
00c43088aa6809 Maxime Jourdan 2020-03-04  1761  					tree_left =
00c43088aa6809 Maxime Jourdan 2020-03-04  1762  						count[start + H_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1763  					tree_right =
00c43088aa6809 Maxime Jourdan 2020-03-04  1764  						count[start + D117_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1765  						count[start + D135_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1766  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1767  				case 3:
00c43088aa6809 Maxime Jourdan 2020-03-04  1768  					tree_left =
00c43088aa6809 Maxime Jourdan 2020-03-04  1769  						count[start + H_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1770  						count[start + D117_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1771  						count[start + D135_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1772  					tree_right =
00c43088aa6809 Maxime Jourdan 2020-03-04  1773  						count[start + D45_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1774  						count[start + D207_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1775  						count[start + D153_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1776  						count[start + D63_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1777  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1778  				case 2:
00c43088aa6809 Maxime Jourdan 2020-03-04  1779  					tree_left =
00c43088aa6809 Maxime Jourdan 2020-03-04  1780  						count[start + V_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1781  					tree_right =
00c43088aa6809 Maxime Jourdan 2020-03-04  1782  						count[start + H_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1783  						count[start + D117_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1784  						count[start + D135_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1785  						count[start + D45_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1786  						count[start + D207_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1787  						count[start + D153_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1788  						count[start + D63_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1789  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1790  				case 1:
00c43088aa6809 Maxime Jourdan 2020-03-04  1791  					tree_left =
00c43088aa6809 Maxime Jourdan 2020-03-04  1792  						count[start + TM_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1793  					tree_right =
00c43088aa6809 Maxime Jourdan 2020-03-04  1794  						count[start + V_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1795  						count[start + H_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1796  						count[start + D117_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1797  						count[start + D135_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1798  						count[start + D45_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1799  						count[start + D207_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1800  						count[start + D153_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1801  						count[start + D63_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1802  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1803  				default:
00c43088aa6809 Maxime Jourdan 2020-03-04  1804  					tree_left =
00c43088aa6809 Maxime Jourdan 2020-03-04  1805  						count[start + DC_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1806  					tree_right =
00c43088aa6809 Maxime Jourdan 2020-03-04  1807  						count[start + TM_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1808  						count[start + V_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1809  						count[start + H_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1810  						count[start + D117_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1811  						count[start + D135_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1812  						count[start + D45_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1813  						count[start + D207_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1814  						count[start + D153_PRED] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1815  						count[start + D63_PRED];
00c43088aa6809 Maxime Jourdan 2020-03-04  1816  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1817  				}
00c43088aa6809 Maxime Jourdan 2020-03-04  1818  
00c43088aa6809 Maxime Jourdan 2020-03-04  1819  				vp9_tree_merge_probs(prev_prob, cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  1820  						     coef_node_start,
00c43088aa6809 Maxime Jourdan 2020-03-04  1821  						     tree_left, tree_right,
00c43088aa6809 Maxime Jourdan 2020-03-04  1822  						     tree_i, node);
00c43088aa6809 Maxime Jourdan 2020-03-04  1823  
00c43088aa6809 Maxime Jourdan 2020-03-04  1824  				coef_node_start = coef_node_start + 1;
00c43088aa6809 Maxime Jourdan 2020-03-04  1825  			}
00c43088aa6809 Maxime Jourdan 2020-03-04  1826  			coef_count_node_start = coef_count_node_start + 10;
00c43088aa6809 Maxime Jourdan 2020-03-04  1827  		}
00c43088aa6809 Maxime Jourdan 2020-03-04  1828  
00c43088aa6809 Maxime Jourdan 2020-03-04  1829  		coef_node_start = VP9_PARTITION_P_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1830  		coef_count_node_start = VP9_PARTITION_P_COUNT_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1831  		for (tree_i = 0 ; tree_i < 16 ; tree_i++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1832  			for (node = 0 ; node < 3 ; node++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1833  				unsigned int start = coef_count_node_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1834  
00c43088aa6809 Maxime Jourdan 2020-03-04  1835  				switch (node) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1836  				case 2:
00c43088aa6809 Maxime Jourdan 2020-03-04  1837  					tree_left = count[start + 2];
00c43088aa6809 Maxime Jourdan 2020-03-04  1838  					tree_right = count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1839  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1840  				case 1:
00c43088aa6809 Maxime Jourdan 2020-03-04  1841  					tree_left = count[start + 1];
00c43088aa6809 Maxime Jourdan 2020-03-04  1842  					tree_right = count[start + 2] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1843  						     count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1844  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1845  				default:
00c43088aa6809 Maxime Jourdan 2020-03-04  1846  					tree_left = count[start + 0];
00c43088aa6809 Maxime Jourdan 2020-03-04  1847  					tree_right = count[start + 1] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1848  						     count[start + 2] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1849  						     count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1850  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1851  				}
00c43088aa6809 Maxime Jourdan 2020-03-04  1852  
00c43088aa6809 Maxime Jourdan 2020-03-04  1853  				vp9_tree_merge_probs(prev_prob, cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  1854  						     coef_node_start,
00c43088aa6809 Maxime Jourdan 2020-03-04  1855  						     tree_left, tree_right,
00c43088aa6809 Maxime Jourdan 2020-03-04  1856  						     tree_i, node);
00c43088aa6809 Maxime Jourdan 2020-03-04  1857  
00c43088aa6809 Maxime Jourdan 2020-03-04  1858  				coef_node_start = coef_node_start + 1;
00c43088aa6809 Maxime Jourdan 2020-03-04  1859  			}
00c43088aa6809 Maxime Jourdan 2020-03-04  1860  
00c43088aa6809 Maxime Jourdan 2020-03-04  1861  			coef_count_node_start = coef_count_node_start + 4;
00c43088aa6809 Maxime Jourdan 2020-03-04  1862  		}
00c43088aa6809 Maxime Jourdan 2020-03-04  1863  
00c43088aa6809 Maxime Jourdan 2020-03-04  1864  		coef_node_start = VP9_INTERP_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1865  		coef_count_node_start = VP9_INTERP_COUNT_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1866  		for (tree_i = 0 ; tree_i < 4 ; tree_i++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1867  			for (node = 0 ; node < 2 ; node++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1868  				unsigned int start = coef_count_node_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1869  
00c43088aa6809 Maxime Jourdan 2020-03-04  1870  				switch (node) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1871  				case 1:
00c43088aa6809 Maxime Jourdan 2020-03-04  1872  					tree_left = count[start + 1];
00c43088aa6809 Maxime Jourdan 2020-03-04  1873  					tree_right = count[start + 2];
00c43088aa6809 Maxime Jourdan 2020-03-04  1874  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1875  				default:
00c43088aa6809 Maxime Jourdan 2020-03-04  1876  					tree_left = count[start + 0];
00c43088aa6809 Maxime Jourdan 2020-03-04  1877  					tree_right = count[start + 1] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1878  						     count[start + 2];
00c43088aa6809 Maxime Jourdan 2020-03-04  1879  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1880  				}
00c43088aa6809 Maxime Jourdan 2020-03-04  1881  
00c43088aa6809 Maxime Jourdan 2020-03-04  1882  				vp9_tree_merge_probs(prev_prob, cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  1883  						     coef_node_start,
00c43088aa6809 Maxime Jourdan 2020-03-04  1884  						     tree_left, tree_right,
00c43088aa6809 Maxime Jourdan 2020-03-04  1885  						     tree_i, node);
00c43088aa6809 Maxime Jourdan 2020-03-04  1886  
00c43088aa6809 Maxime Jourdan 2020-03-04  1887  				coef_node_start = coef_node_start + 1;
00c43088aa6809 Maxime Jourdan 2020-03-04  1888  			}
00c43088aa6809 Maxime Jourdan 2020-03-04  1889  			coef_count_node_start = coef_count_node_start + 3;
00c43088aa6809 Maxime Jourdan 2020-03-04  1890  		}
00c43088aa6809 Maxime Jourdan 2020-03-04  1891  
00c43088aa6809 Maxime Jourdan 2020-03-04  1892  		coef_node_start = VP9_MV_JOINTS_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1893  		coef_count_node_start = VP9_MV_JOINTS_COUNT_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1894  		for (tree_i = 0 ; tree_i < 1 ; tree_i++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1895  			for (node = 0 ; node < 3 ; node++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1896  				unsigned int start = coef_count_node_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1897  
00c43088aa6809 Maxime Jourdan 2020-03-04  1898  				switch (node) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1899  				case 2:
00c43088aa6809 Maxime Jourdan 2020-03-04  1900  					tree_left = count[start + 2];
00c43088aa6809 Maxime Jourdan 2020-03-04  1901  					tree_right = count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1902  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1903  				case 1:
00c43088aa6809 Maxime Jourdan 2020-03-04  1904  					tree_left = count[start + 1];
00c43088aa6809 Maxime Jourdan 2020-03-04  1905  					tree_right = count[start + 2] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1906  						     count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1907  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1908  				default:
00c43088aa6809 Maxime Jourdan 2020-03-04  1909  					tree_left = count[start + 0];
00c43088aa6809 Maxime Jourdan 2020-03-04  1910  					tree_right = count[start + 1] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1911  						     count[start + 2] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1912  						     count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1913  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1914  				}
00c43088aa6809 Maxime Jourdan 2020-03-04  1915  
00c43088aa6809 Maxime Jourdan 2020-03-04  1916  				vp9_tree_merge_probs(prev_prob, cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  1917  						     coef_node_start,
00c43088aa6809 Maxime Jourdan 2020-03-04  1918  						     tree_left, tree_right,
00c43088aa6809 Maxime Jourdan 2020-03-04  1919  						     tree_i, node);
00c43088aa6809 Maxime Jourdan 2020-03-04  1920  
00c43088aa6809 Maxime Jourdan 2020-03-04  1921  				coef_node_start = coef_node_start + 1;
00c43088aa6809 Maxime Jourdan 2020-03-04  1922  			}
00c43088aa6809 Maxime Jourdan 2020-03-04  1923  			coef_count_node_start = coef_count_node_start + 4;
00c43088aa6809 Maxime Jourdan 2020-03-04  1924  		}
00c43088aa6809 Maxime Jourdan 2020-03-04  1925  
00c43088aa6809 Maxime Jourdan 2020-03-04  1926  		for (mvd_i = 0 ; mvd_i < 2 ; mvd_i++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1927  			coef_node_start = mvd_i ? VP9_MV_CLASSES_1_START :
00c43088aa6809 Maxime Jourdan 2020-03-04  1928  						  VP9_MV_CLASSES_0_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1929  			coef_count_node_start = mvd_i ?
00c43088aa6809 Maxime Jourdan 2020-03-04  1930  					VP9_MV_CLASSES_1_COUNT_START :
00c43088aa6809 Maxime Jourdan 2020-03-04  1931  					VP9_MV_CLASSES_0_COUNT_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  1932  			tree_i = 0;
00c43088aa6809 Maxime Jourdan 2020-03-04  1933  			for (node = 0; node < 10; node++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1934  				unsigned int start = coef_count_node_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  1935  
00c43088aa6809 Maxime Jourdan 2020-03-04  1936  				switch (node) {
00c43088aa6809 Maxime Jourdan 2020-03-04  1937  				case 9:
00c43088aa6809 Maxime Jourdan 2020-03-04  1938  					tree_left = count[start + 9];
00c43088aa6809 Maxime Jourdan 2020-03-04  1939  					tree_right = count[start + 10];
00c43088aa6809 Maxime Jourdan 2020-03-04  1940  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1941  				case 8:
00c43088aa6809 Maxime Jourdan 2020-03-04  1942  					tree_left = count[start + 7];
00c43088aa6809 Maxime Jourdan 2020-03-04  1943  					tree_right = count[start + 8];
00c43088aa6809 Maxime Jourdan 2020-03-04  1944  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1945  				case 7:
00c43088aa6809 Maxime Jourdan 2020-03-04  1946  					tree_left = count[start + 7] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1947  						     count[start + 8];
00c43088aa6809 Maxime Jourdan 2020-03-04  1948  					tree_right = count[start + 9] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1949  						     count[start + 10];
00c43088aa6809 Maxime Jourdan 2020-03-04  1950  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1951  				case 6:
00c43088aa6809 Maxime Jourdan 2020-03-04  1952  					tree_left = count[start + 6];
00c43088aa6809 Maxime Jourdan 2020-03-04  1953  					tree_right = count[start + 7] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1954  						     count[start + 8] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1955  						     count[start + 9] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1956  						     count[start + 10];
00c43088aa6809 Maxime Jourdan 2020-03-04  1957  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1958  				case 5:
00c43088aa6809 Maxime Jourdan 2020-03-04  1959  					tree_left = count[start + 4];
00c43088aa6809 Maxime Jourdan 2020-03-04  1960  					tree_right = count[start + 5];
00c43088aa6809 Maxime Jourdan 2020-03-04  1961  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1962  				case 4:
00c43088aa6809 Maxime Jourdan 2020-03-04  1963  					tree_left = count[start + 4] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1964  						    count[start + 5];
00c43088aa6809 Maxime Jourdan 2020-03-04  1965  					tree_right = count[start + 6] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1966  						     count[start + 7] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1967  						     count[start + 8] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1968  						     count[start + 9] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1969  						     count[start + 10];
00c43088aa6809 Maxime Jourdan 2020-03-04  1970  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1971  				case 3:
00c43088aa6809 Maxime Jourdan 2020-03-04  1972  					tree_left = count[start + 2];
00c43088aa6809 Maxime Jourdan 2020-03-04  1973  					tree_right = count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1974  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1975  				case 2:
00c43088aa6809 Maxime Jourdan 2020-03-04  1976  					tree_left = count[start + 2] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1977  						    count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  1978  					tree_right = count[start + 4] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1979  						     count[start + 5] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1980  						     count[start + 6] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1981  						     count[start + 7] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1982  						     count[start + 8] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1983  						     count[start + 9] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1984  						     count[start + 10];
00c43088aa6809 Maxime Jourdan 2020-03-04  1985  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1986  				case 1:
00c43088aa6809 Maxime Jourdan 2020-03-04  1987  					tree_left = count[start + 1];
00c43088aa6809 Maxime Jourdan 2020-03-04  1988  					tree_right = count[start + 2] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1989  						     count[start + 3] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1990  						     count[start + 4] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1991  						     count[start + 5] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1992  						     count[start + 6] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1993  						     count[start + 7] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1994  						     count[start + 8] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1995  						     count[start + 9] +
00c43088aa6809 Maxime Jourdan 2020-03-04  1996  						     count[start + 10];
00c43088aa6809 Maxime Jourdan 2020-03-04  1997  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  1998  				default:
00c43088aa6809 Maxime Jourdan 2020-03-04  1999  					tree_left = count[start + 0];
00c43088aa6809 Maxime Jourdan 2020-03-04  2000  					tree_right = count[start + 1] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2001  						     count[start + 2] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2002  						     count[start + 3] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2003  						     count[start + 4] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2004  						     count[start + 5] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2005  						     count[start + 6] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2006  						     count[start + 7] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2007  						     count[start + 8] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2008  						     count[start + 9] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2009  						     count[start + 10];
00c43088aa6809 Maxime Jourdan 2020-03-04  2010  					break;
00c43088aa6809 Maxime Jourdan 2020-03-04  2011  				}
00c43088aa6809 Maxime Jourdan 2020-03-04  2012  
00c43088aa6809 Maxime Jourdan 2020-03-04  2013  				vp9_tree_merge_probs(prev_prob, cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  2014  						     coef_node_start,
00c43088aa6809 Maxime Jourdan 2020-03-04  2015  						     tree_left, tree_right,
00c43088aa6809 Maxime Jourdan 2020-03-04  2016  						     tree_i, node);
00c43088aa6809 Maxime Jourdan 2020-03-04  2017  
00c43088aa6809 Maxime Jourdan 2020-03-04  2018  				coef_node_start = coef_node_start + 1;
00c43088aa6809 Maxime Jourdan 2020-03-04  2019  			}
00c43088aa6809 Maxime Jourdan 2020-03-04  2020  
00c43088aa6809 Maxime Jourdan 2020-03-04  2021  			coef_node_start = mvd_i ? VP9_MV_CLASS0_1_START :
00c43088aa6809 Maxime Jourdan 2020-03-04  2022  						  VP9_MV_CLASS0_0_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  2023  			coef_count_node_start =	mvd_i ?
00c43088aa6809 Maxime Jourdan 2020-03-04  2024  						VP9_MV_CLASS0_1_COUNT_START :
00c43088aa6809 Maxime Jourdan 2020-03-04  2025  						VP9_MV_CLASS0_0_COUNT_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  2026  			tree_i = 0;
00c43088aa6809 Maxime Jourdan 2020-03-04  2027  			node = 0;
00c43088aa6809 Maxime Jourdan 2020-03-04  2028  			tree_left = count[coef_count_node_start + 0];
00c43088aa6809 Maxime Jourdan 2020-03-04  2029  			tree_right = count[coef_count_node_start + 1];
00c43088aa6809 Maxime Jourdan 2020-03-04  2030  
00c43088aa6809 Maxime Jourdan 2020-03-04  2031  			vp9_tree_merge_probs(prev_prob, cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  2032  					     coef_node_start,
00c43088aa6809 Maxime Jourdan 2020-03-04  2033  					     tree_left, tree_right,
00c43088aa6809 Maxime Jourdan 2020-03-04  2034  					     tree_i, node);
00c43088aa6809 Maxime Jourdan 2020-03-04  2035  			coef_node_start = mvd_i ? VP9_MV_CLASS0_FP_1_START :
00c43088aa6809 Maxime Jourdan 2020-03-04  2036  						  VP9_MV_CLASS0_FP_0_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  2037  			coef_count_node_start =	mvd_i ?
00c43088aa6809 Maxime Jourdan 2020-03-04  2038  					VP9_MV_CLASS0_FP_1_COUNT_START :
00c43088aa6809 Maxime Jourdan 2020-03-04  2039  					VP9_MV_CLASS0_FP_0_COUNT_START;
00c43088aa6809 Maxime Jourdan 2020-03-04  2040  
00c43088aa6809 Maxime Jourdan 2020-03-04  2041  			for (tree_i = 0; tree_i < 3; tree_i++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  2042  				for (node = 0; node < 3; node++) {
00c43088aa6809 Maxime Jourdan 2020-03-04  2043  					unsigned int start =
00c43088aa6809 Maxime Jourdan 2020-03-04  2044  						coef_count_node_start;
00c43088aa6809 Maxime Jourdan 2020-03-04  2045  					switch (node) {
00c43088aa6809 Maxime Jourdan 2020-03-04  2046  					case 2:
00c43088aa6809 Maxime Jourdan 2020-03-04  2047  						tree_left = count[start + 2];
00c43088aa6809 Maxime Jourdan 2020-03-04  2048  						tree_right = count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  2049  						break;
00c43088aa6809 Maxime Jourdan 2020-03-04  2050  					case 1:
00c43088aa6809 Maxime Jourdan 2020-03-04  2051  						tree_left = count[start + 1];
00c43088aa6809 Maxime Jourdan 2020-03-04  2052  						tree_right = count[start + 2] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2053  							     count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  2054  						break;
00c43088aa6809 Maxime Jourdan 2020-03-04  2055  					default:
00c43088aa6809 Maxime Jourdan 2020-03-04  2056  						tree_left = count[start + 0];
00c43088aa6809 Maxime Jourdan 2020-03-04  2057  						tree_right = count[start + 1] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2058  							     count[start + 2] +
00c43088aa6809 Maxime Jourdan 2020-03-04  2059  							     count[start + 3];
00c43088aa6809 Maxime Jourdan 2020-03-04  2060  						break;
00c43088aa6809 Maxime Jourdan 2020-03-04  2061  					}
00c43088aa6809 Maxime Jourdan 2020-03-04  2062  
00c43088aa6809 Maxime Jourdan 2020-03-04  2063  					vp9_tree_merge_probs(prev_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  2064  							     cur_prob,
00c43088aa6809 Maxime Jourdan 2020-03-04  2065  							     coef_node_start,
00c43088aa6809 Maxime Jourdan 2020-03-04  2066  							     tree_left,
00c43088aa6809 Maxime Jourdan 2020-03-04  2067  							     tree_right,
00c43088aa6809 Maxime Jourdan 2020-03-04  2068  							     tree_i, node);
00c43088aa6809 Maxime Jourdan 2020-03-04  2069  
00c43088aa6809 Maxime Jourdan 2020-03-04  2070  					coef_node_start = coef_node_start + 1;
00c43088aa6809 Maxime Jourdan 2020-03-04  2071  				}
00c43088aa6809 Maxime Jourdan 2020-03-04  2072  				coef_count_node_start =
00c43088aa6809 Maxime Jourdan 2020-03-04  2073  					coef_count_node_start + 4;
00c43088aa6809 Maxime Jourdan 2020-03-04  2074  			}
00c43088aa6809 Maxime Jourdan 2020-03-04  2075  		}
00c43088aa6809 Maxime Jourdan 2020-03-04  2076  	}
00c43088aa6809 Maxime Jourdan 2020-03-04  2077  }
00c43088aa6809 Maxime Jourdan 2020-03-04  2078  

:::::: The code at line 1688 was first introduced by commit
:::::: 00c43088aa680989407b6afbda295f67b3f123f1 media: meson: vdec: add VP9 decoder support

:::::: TO: Maxime Jourdan <mjourdan@baylibre.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
