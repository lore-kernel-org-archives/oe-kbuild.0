Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332693229
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 20:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676839967; x=1708375967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T2Z7TXt4D4ogc/PYTrjAb81OzOugE8DqCaFImtjU/5Q=;
  b=XsjM/iVQunsilv64q9QY1Ouk35p0ejwv2mdDF1tMx08YZyQaQWMvROhO
   j+GKePgh0C2gFK6wDS41mOz8ivkRt8gY286A221Nye9P1iXe8mPKOdBdM
   EMsQPGosnWBEsAbLkpqf228Q2w4DQMRRM3c9IrGJP4xNOP6DSV4QbgCXk
   7saFjvmcBFvC12bHl86FC/MwvhEg9dAXSgqXjjGMvSDUmYwg549kEogRU
   OG60WY5RHVjrXR8g46m3KsCX1LNqTPl8EnAAz4ZIS0ZBX76csstKID8Bd
   JiAdkOGLEPDZnzFHCMk4mN4T2qV6EDRpFhnTgBWIGacNZngnhz5IRF/QF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="394766940"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="394766940"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 12:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="780425946"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="780425946"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2023 12:52:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTqfs-000DRx-1L;
	Sun, 19 Feb 2023 20:52:44 +0000
Date: Mon, 20 Feb 2023 04:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5568/13499]
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:436:2: warning: Value stored to
 'err' is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302200440.aXeURxEN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:436:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c068f40300a0eaa34f7105d137a5560b86951aa9
commit: 3f3b9861fa6c435c1600ae465e116497374ebe28 [5568/13499] drm: rcar-du: dsi: Add r8A779g0 support
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20230217 (https://download.01.org/0day-ci/archive/20230220/202302200440.aXeURxEN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3f3b9861fa6c435c1600ae465e116497374ebe28
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3f3b9861fa6c435c1600ae465e116497374ebe28
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302200440.aXeURxEN-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: warning: Value stored to 'nbytes_per_unit' is never read [clang-analyzer-deadcode.DeadStores]
                   nbytes_per_unit = 0;
                   ^                 ~
   drivers/media/test-drivers/vidtv/vidtv_s302m.c:383:3: note: Value stored to 'nbytes_per_unit' is never read
                   nbytes_per_unit = 0;
                   ^                 ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:364:15: warning: Access to field 'min_freq' results in a dereference of a null pointer (loaded from field 'clkset') [clang-analyzer-core.NullDereference]
                           if (fout < setup_info->clkset->min_freq ||
                                      ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:842:6: note: 'ret' is >= 0
           if (ret < 0) {
               ^~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:842:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:847:8: note: Calling 'rcar_mipi_dsi_startup'
           ret = rcar_mipi_dsi_startup(dsi, mode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:507:2: note: 'setup_info.clkset' initialized to a null pointer value
           struct dsi_setup_info setup_info = {};
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:518:6: note: 'dsi_format' is >= 0
           if (dsi_format < 0) {
               ^~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:518:2: note: Taking false branch
           if (dsi_format < 0) {
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:524:2: note: Calling 'rcar_mipi_dsi_parameters_calc'
           rcar_mipi_dsi_parameters_calc(dsi, dsi->clocks.pll,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:400:6: note: Assuming the condition is false
           if (fout_target < MHZ(40) || fout_target > MHZ(1250))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:400:6: note: Left side of '||' is false
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:400:31: note: Assuming the condition is false
           if (fout_target < MHZ(40) || fout_target > MHZ(1250))
                                        ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:400:2: note: Taking false branch
           if (fout_target < MHZ(40) || fout_target > MHZ(1250))
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:404:37: note: Assuming field 'min_freq' is equal to 0
           for (clk_cfg = dsi->info->clk_cfg; clk_cfg->min_freq != 0; clk_cfg++) {
                                              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:404:2: note: Loop condition is false. Execution continues on line 412
           for (clk_cfg = dsi->info->clk_cfg; clk_cfg->min_freq != 0; clk_cfg++) {
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:414:2: note: Control jumps to 'case RCAR_DSI_V4H:'  at line 420
           switch (dsi->info->model) {
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:422:3: note:  Execution continues on line 425
                   break;
                   ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:425:2: note: Calling 'rcar_mipi_dsi_pll_calc'
           rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:345:37: note: Assuming 'n' is <= field 'n_max'
           for (unsigned int n = info->n_min; n <= info->n_max; n++) {
                                              ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:345:2: note: Loop condition is true.  Entering loop body
           for (unsigned int n = info->n_min; n <= info->n_max; n++) {
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:350:7: note: Assuming 'fpfd' is >= field 'fpfd_min'
                   if (fpfd < info->fpfd_min || fpfd > info->fpfd_max)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:350:7: note: Left side of '||' is false
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:350:32: note: Assuming 'fpfd' is <= field 'fpfd_max'
                   if (fpfd < info->fpfd_min || fpfd > info->fpfd_max)
                                                ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:350:3: note: Taking false branch
                   if (fpfd < info->fpfd_min || fpfd > info->fpfd_max)
                   ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:353:38: note: Assuming 'm' is <= field 'm_max'
                   for (unsigned int m = info->m_min; m <= info->m_max; m++) {
                                                      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:353:3: note: Loop condition is true.  Entering loop body
                   for (unsigned int m = info->m_min; m <= info->m_max; m++) {
                   ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:359:8: note: Assuming 'fout' is >= field 'fout_min'
                           if (fout < info->fout_min || fout > info->fout_max)
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:359:8: note: Left side of '||' is false
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:359:33: note: Assuming 'fout' is <= field 'fout_max'
                           if (fout < info->fout_min || fout > info->fout_max)
                                                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:359:4: note: Taking false branch
                           if (fout < info->fout_min || fout > info->fout_max)
                           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:364:15: note: Access to field 'min_freq' results in a dereference of a null pointer (loaded from field 'clkset')
                           if (fout < setup_info->clkset->min_freq ||
                                      ^           ~~~~~~
>> drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:436:2: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err = abs((long)(setup_info->fout - fout_target) * 10000 / (long)fout_target);
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:436:2: note: Value stored to 'err' is never read
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:567:7: warning: Access to field 'vco_cntrl' results in a dereference of a null pointer (loaded from field 'clkset') [clang-analyzer-core.NullDereference]
                     | CLOCKSET2_VCO_CNTRL(setup_info.clkset->vco_cntrl);
                       ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h:155:35: note: expanded from macro 'CLOCKSET2_VCO_CNTRL'
   #define CLOCKSET2_VCO_CNTRL(x)          (((x) & 0x3f) << 8)
                                             ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:842:6: note: 'ret' is >= 0
           if (ret < 0) {
               ^~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:842:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:847:8: note: Calling 'rcar_mipi_dsi_startup'
           ret = rcar_mipi_dsi_startup(dsi, mode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:507:2: note: 'setup_info.clkset' initialized to a null pointer value
           struct dsi_setup_info setup_info = {};
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:518:6: note: 'dsi_format' is >= 0
           if (dsi_format < 0) {
               ^~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:518:2: note: Taking false branch
           if (dsi_format < 0) {
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:524:2: note: Calling 'rcar_mipi_dsi_parameters_calc'
           rcar_mipi_dsi_parameters_calc(dsi, dsi->clocks.pll,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:400:6: note: Assuming the condition is true
           if (fout_target < MHZ(40) || fout_target > MHZ(1250))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:400:28: note: Left side of '||' is true
           if (fout_target < MHZ(40) || fout_target > MHZ(1250))
                                     ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:401:3: note: Returning without writing to 'setup_info->clkset'
                   return;
                   ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:524:2: note: Returning from 'rcar_mipi_dsi_parameters_calc'
           rcar_mipi_dsi_parameters_calc(dsi, dsi->clocks.pll,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:545:2: note: Control jumps to 'case RCAR_DSI_V3U:'  at line 546
           switch (dsi->info->model) {
           ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:549:7: note: Assuming 'ret' is >= 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:549:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:551:3: note:  Execution continues on line 561
                   break;
                   ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c:567:7: note: Access to field 'vco_cntrl' results in a dereference of a null pointer (loaded from field 'clkset')
                     | CLOCKSET2_VCO_CNTRL(setup_info.clkset->vco_cntrl);
                       ^
   drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h:155:35: note: expanded from macro 'CLOCKSET2_VCO_CNTRL'
   #define CLOCKSET2_VCO_CNTRL(x)          (((x) & 0x3f) << 8)
                                             ^~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/ntfs/compress.c:164:6: warning: Value stored to 'cb_sb_start' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u8 *cb_sb_start = cb;   /* Beginning of the current sb in the cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:164:6: note: Value stored to 'cb_sb_start' during its initialization is never read
           u8 *cb_sb_start = cb;   /* Beginning of the current sb in the cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:810:4: warning: Value stored to 'cb_pos' is never read [clang-analyzer-deadcode.DeadStores]
                           cb_pos += cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/compress.c:810:4: note: Value stored to 'cb_pos' is never read
                           cb_pos += cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/ntfs/dir.c:1107:2: warning: Value stored to 'rc' is never read [clang-analyzer-deadcode.DeadStores]
           rc = err = 0;
           ^    ~~~~~~~
   fs/ntfs/dir.c:1107:2: note: Value stored to 'rc' is never read
           rc = err = 0;
           ^    ~~~~~~~
   fs/ntfs/dir.c:1306:36: warning: Access to field 'magic' results in a dereference of a null pointer (loaded from variable 'ia') [clang-analyzer-core.NullDereference]
           if (unlikely(!ntfs_is_indx_record(ia->magic))) {
                                             ^
   fs/ntfs/layout.h:139:50: note: expanded from macro 'ntfs_is_indx_record'

vim +/err +436 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c

155358310f013c LUU HOAI       2020-02-25  387  
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  388  	const struct dsi_clk_config *clk_cfg;
155358310f013c LUU HOAI       2020-02-25  389  	unsigned long fout_target;
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  390  	unsigned long fin_rate;
155358310f013c LUU HOAI       2020-02-25  391  	unsigned int i;
155358310f013c LUU HOAI       2020-02-25  392  	unsigned int err;
155358310f013c LUU HOAI       2020-02-25  393  
155358310f013c LUU HOAI       2020-02-25  394  	/*
155358310f013c LUU HOAI       2020-02-25  395  	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
155358310f013c LUU HOAI       2020-02-25  396  	 * The range out Fout is [40 - 1250] Mhz
155358310f013c LUU HOAI       2020-02-25  397  	 */
155358310f013c LUU HOAI       2020-02-25  398  	fout_target = target * mipi_dsi_pixel_format_to_bpp(dsi->format)
155358310f013c LUU HOAI       2020-02-25  399  		    / (2 * dsi->lanes);
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  400  	if (fout_target < MHZ(40) || fout_target > MHZ(1250))
155358310f013c LUU HOAI       2020-02-25  401  		return;
155358310f013c LUU HOAI       2020-02-25  402  
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  403  	/* Find PLL settings */
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  404  	for (clk_cfg = dsi->info->clk_cfg; clk_cfg->min_freq != 0; clk_cfg++) {
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  405  		if (fout_target > clk_cfg->min_freq &&
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  406  		    fout_target <= clk_cfg->max_freq) {
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  407  			setup_info->clkset = clk_cfg;
155358310f013c LUU HOAI       2020-02-25  408  			break;
155358310f013c LUU HOAI       2020-02-25  409  		}
155358310f013c LUU HOAI       2020-02-25  410  	}
155358310f013c LUU HOAI       2020-02-25  411  
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  412  	fin_rate = clk_get_rate(clk);
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  413  
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  414  	switch (dsi->info->model) {
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  415  	case RCAR_DSI_V3U:
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  416  	default:
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  417  		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  418  		break;
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  419  
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  420  	case RCAR_DSI_V4H:
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  421  		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  422  		break;
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  423  	}
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  424  
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  425  	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
155358310f013c LUU HOAI       2020-02-25  426  
155358310f013c LUU HOAI       2020-02-25  427  	/* Find hsfreqrange */
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  428  	setup_info->hsfreq = setup_info->fout * 2;
155358310f013c LUU HOAI       2020-02-25  429  	for (i = 0; i < ARRAY_SIZE(hsfreqrange_table); i++) {
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  430  		if (hsfreqrange_table[i][0] >= setup_info->hsfreq) {
155358310f013c LUU HOAI       2020-02-25  431  			setup_info->hsfreqrange = hsfreqrange_table[i][1];
155358310f013c LUU HOAI       2020-02-25  432  			break;
155358310f013c LUU HOAI       2020-02-25  433  		}
155358310f013c LUU HOAI       2020-02-25  434  	}
155358310f013c LUU HOAI       2020-02-25  435  
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01 @436  	err = abs((long)(setup_info->fout - fout_target) * 10000 / (long)fout_target);
155358310f013c LUU HOAI       2020-02-25  437  
155358310f013c LUU HOAI       2020-02-25  438  	dev_dbg(dsi->dev,
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  439  		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  440  		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  441  		setup_info->vclk_divider, setup_info->fout, fout_target,
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  442  		err / 100, err % 100);
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  443  
155358310f013c LUU HOAI       2020-02-25  444  	dev_dbg(dsi->dev,
155358310f013c LUU HOAI       2020-02-25  445  		"vco_cntrl = 0x%x\tprop_cntrl = 0x%x\thsfreqrange = 0x%x\n",
3f3b9861fa6c43 Tomi Valkeinen 2022-12-01  446  		clk_cfg->vco_cntrl, clk_cfg->prop_cntrl,
155358310f013c LUU HOAI       2020-02-25  447  		setup_info->hsfreqrange);
155358310f013c LUU HOAI       2020-02-25  448  }
155358310f013c LUU HOAI       2020-02-25  449  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
