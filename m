Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9FE3FE5C
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRufjNpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699969405; x=1731505405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2gg4qhyaoJBs53iDrg8CvTCBtyVUQH9/werxQvqQPI=;
  b=XRufjNpceCk4HGBpd3893Ua8WJJxP13H5To/KWeqpBFUkbYp0uMC30jV
   9iPCkst8W1DdhO/AECPf2N01cvdYwaCEP49lY4JxK/ZJYCfthsjNZ3NGZ
   5V5YHyG0Tj5m/eRyxL/x+tTY1fLavzSjS7YbHh0s/3/dX5624Y3Npyf0w
   1wXXSXUlu+sUWjEf+lw6uSwD9NDu4TrD83LAmBiDU6Zx22+1cqHrRZEiY
   tKTg7tY20FIgH+p7vfo4Mb60K8/4b7sG6PJFE1Z4UQO9nVQNN7oV5f+p0
   ntCH1QlyBFcR2vieJ594rZgBdkwt19mlZEa+atFI1FRJfLt5+nbJApyb+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="476867376"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="476867376"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 05:43:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="714572559"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="714572559"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Nov 2023 05:43:22 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2thI-0000HN-0H;
	Tue, 14 Nov 2023 13:43:20 +0000
Date: Tue, 14 Nov 2023 21:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <202311142123.lwAnyUEZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has kconfig file changed"
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231114050525.471854-5-pavitrakumarm@vayavyalabs.com>
References: <20231114050525.471854-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
CC: manjunath.hadli@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
CC: shwetar <shwetar@vayavyalabs.com>
CC: Ruud Derwig <Ruud.Derwig@synopsys.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.7-rc1]
[cannot apply to xilinx-xlnx/master next-20231114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPACC-driver-to-Linux-kernel/20231114-143618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20231114050525.471854-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231114/202311142123.lwAnyUEZ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311142123.lwAnyUEZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311142123.lwAnyUEZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/dwc-spacc/spacc_core.c:1113:5: warning: no previous prototype for 'spacc_sgs_to_ddt' [-Wmissing-prototypes]
    1113 | int spacc_sgs_to_ddt(struct device *dev,
         |     ^~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:1179:5: warning: no previous prototype for 'modify_scatterlist' [-Wmissing-prototypes]
    1179 | int modify_scatterlist(struct scatterlist *src, struct scatterlist *dst,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:1215:5: warning: no previous prototype for 'spacc_sg_to_ddt' [-Wmissing-prototypes]
    1215 | int spacc_sg_to_ddt(struct device *dev, struct scatterlist *sg,
         |     ^~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c: In function 'spacc_fini':
   drivers/crypto/dwc-spacc/spacc_core.c:2565:9: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
    2565 |         vfree(spacc->ctx);
         |         ^~~~~
         |         kvfree
   drivers/crypto/dwc-spacc/spacc_core.c: In function 'spacc_init':
   drivers/crypto/dwc-spacc/spacc_core.c:2744:22: error: implicit declaration of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=implicit-function-declaration]
    2744 |         spacc->ctx = vmalloc(sizeof(struct spacc_ctx) *
         |                      ^~~~~~~
         |                      kvmalloc
>> drivers/crypto/dwc-spacc/spacc_core.c:2744:20: warning: assignment to 'struct spacc_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2744 |         spacc->ctx = vmalloc(sizeof(struct spacc_ctx) *
         |                    ^
>> drivers/crypto/dwc-spacc/spacc_core.c:2750:20: warning: assignment to 'struct spacc_job *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2750 |         spacc->job = vmalloc(sizeof(struct spacc_job) * SPACC_MAX_JOBS);
         |                    ^
   drivers/crypto/dwc-spacc/spacc_core.c: At top level:
   drivers/crypto/dwc-spacc/spacc_core.c:2991:12: warning: 'spacc_load_skp' defined but not used [-Wunused-function]
    2991 | static int spacc_load_skp(struct spacc_device *spacc, uint32_t *key, int keysz,
         |            ^~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:2849:13: warning: 'spacc_set_secure_mode' defined but not used [-Wunused-function]
    2849 | static void spacc_set_secure_mode(struct spacc_device *spacc, int src, int dst,
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:974:26: warning: 'names' defined but not used [-Wunused-const-variable=]
     974 | static const char *const names[] = {
         |                          ^~~~~
   In file included from <command-line>:
   In function 'spacc_sg_chain',
       inlined from 'fixup_sg' at drivers/crypto/dwc-spacc/spacc_core.c:1105:4,
       inlined from 'spacc_sgs_to_ddt' at drivers/crypto/dwc-spacc/spacc_core.c:1132:16:
   include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_354' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_DEBUG_SG)
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:1072:9: note: in expansion of macro 'BUILD_BUG_ON'
    1072 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_DEBUG_SG));
         |         ^~~~~~~~~~~~
   In function 'spacc_sg_chain',
       inlined from 'fixup_sg' at drivers/crypto/dwc-spacc/spacc_core.c:1105:4,
       inlined from 'spacc_sg_to_ddt' at drivers/crypto/dwc-spacc/spacc_core.c:1222:15:
   include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_354' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_DEBUG_SG)
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:1072:9: note: in expansion of macro 'BUILD_BUG_ON'
    1072 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_DEBUG_SG));
         |         ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2744 drivers/crypto/dwc-spacc/spacc_core.c

188d801c0d4bbe Pavitrakumar M 2023-11-14  2568  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2569  int spacc_init(void *baseaddr, struct spacc_device *spacc,
188d801c0d4bbe Pavitrakumar M 2023-11-14  2570  	       struct pdu_info *info)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2571  {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2572  	unsigned long id;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2573  	char version_string[3][16] = { "SPACC", "SPACC-PDU" };
188d801c0d4bbe Pavitrakumar M 2023-11-14  2574  	char idx_string[2][16] = { "(Normal Port)", "(Secure Port)" };
188d801c0d4bbe Pavitrakumar M 2023-11-14  2575  	char dma_type_string[4][16] = {"Unknown", "Scattergather", "Linear",
188d801c0d4bbe Pavitrakumar M 2023-11-14  2576  		"Unknown"};
188d801c0d4bbe Pavitrakumar M 2023-11-14  2577  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2578  	if (!baseaddr) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2579  		pr_err("ERR: baseaddr is NULL\n");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2580  		return -1;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2581  	}
188d801c0d4bbe Pavitrakumar M 2023-11-14  2582  	if (!spacc) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2583  		pr_err("ERR: spacc is NULL\n");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2584  		return -1;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2585  	}
188d801c0d4bbe Pavitrakumar M 2023-11-14  2586  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2587  	memset(spacc, 0, sizeof(*spacc));
188d801c0d4bbe Pavitrakumar M 2023-11-14  2588  	spin_lock_init(&spacc->lock);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2589  	spin_lock_init(&spacc->ctx_lock);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2590  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2591  	/* assign the baseaddr*/
188d801c0d4bbe Pavitrakumar M 2023-11-14  2592  	spacc->regmap = baseaddr;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2593  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2594  	/* version info*/
188d801c0d4bbe Pavitrakumar M 2023-11-14  2595  	spacc->config.version     = info->spacc_version.version;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2596  	spacc->config.pdu_version = (info->pdu_config.major << 4) |
188d801c0d4bbe Pavitrakumar M 2023-11-14  2597  		info->pdu_config.minor;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2598  	spacc->config.project     = info->spacc_version.project;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2599  	spacc->config.is_pdu      = info->spacc_version.is_pdu;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2600  	spacc->config.is_qos      = info->spacc_version.qos;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2601  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2602  	/* misc*/
188d801c0d4bbe Pavitrakumar M 2023-11-14  2603  	spacc->config.is_partial        = info->spacc_version.partial;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2604  	spacc->config.num_ctx           = info->spacc_config.num_ctx;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2605  	spacc->config.ciph_page_size    = 1U <<
188d801c0d4bbe Pavitrakumar M 2023-11-14  2606  		info->spacc_config.ciph_ctx_page_size;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2607  	spacc->config.hash_page_size    = 1U <<
188d801c0d4bbe Pavitrakumar M 2023-11-14  2608  		info->spacc_config.hash_ctx_page_size;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2609  	spacc->config.dma_type          = info->spacc_config.dma_type;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2610  	spacc->config.idx               = info->spacc_version.vspacc_idx;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2611  	spacc->config.cmd0_fifo_depth   = info->spacc_config.cmd0_fifo_depth;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2612  	spacc->config.cmd1_fifo_depth   = info->spacc_config.cmd1_fifo_depth;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2613  	spacc->config.cmd2_fifo_depth   = info->spacc_config.cmd2_fifo_depth;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2614  	spacc->config.stat_fifo_depth   = info->spacc_config.stat_fifo_depth;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2615  	spacc->config.fifo_cnt          = 1;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2616  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2617  	spacc->config.is_ivimport = info->spacc_version.ivimport;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2618  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2619  	/* ctrl register map*/
188d801c0d4bbe Pavitrakumar M 2023-11-14  2620  	if (spacc->config.version <= 0x4E)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2621  		spacc->config.ctrl_map = spacc_ctrl_map[SPACC_CTRL_VER_0];
188d801c0d4bbe Pavitrakumar M 2023-11-14  2622  	else if (spacc->config.version <= 0x60)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2623  		spacc->config.ctrl_map = spacc_ctrl_map[SPACC_CTRL_VER_1];
188d801c0d4bbe Pavitrakumar M 2023-11-14  2624  	else
188d801c0d4bbe Pavitrakumar M 2023-11-14  2625  		spacc->config.ctrl_map = spacc_ctrl_map[SPACC_CTRL_VER_2];
188d801c0d4bbe Pavitrakumar M 2023-11-14  2626  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2627  	spacc->job_next_swid            = 0;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2628  	spacc->wdcnt                    = 0;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2629  	spacc->config.wd_timer          = SPACC_WD_TIMER_INIT;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2630  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2631  	/* version 4.10 uses IRQ,
188d801c0d4bbe Pavitrakumar M 2023-11-14  2632  	 * above uses WD and we don't support below 4.00
188d801c0d4bbe Pavitrakumar M 2023-11-14  2633  	 */
188d801c0d4bbe Pavitrakumar M 2023-11-14  2634  	if (spacc->config.version < 0x40) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2635  		pr_err("ERR: Unsupported SPAcc version\n");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2636  		return -EIO;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2637  	} else if (spacc->config.version < 0x4B) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2638  		spacc->op_mode                  = SPACC_OP_MODE_IRQ;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2639  	} else {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2640  		spacc->op_mode                  = SPACC_OP_MODE_WD;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2641  	}
188d801c0d4bbe Pavitrakumar M 2023-11-14  2642  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2643  	/* set threshold and enable irq
188d801c0d4bbe Pavitrakumar M 2023-11-14  2644  	 * on 4.11 and newer cores we can derive this
188d801c0d4bbe Pavitrakumar M 2023-11-14  2645  	 * from the HW reported depths.
188d801c0d4bbe Pavitrakumar M 2023-11-14  2646  	 */
188d801c0d4bbe Pavitrakumar M 2023-11-14  2647  	if (spacc->config.stat_fifo_depth == 1)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2648  		spacc->config.ideal_stat_level = 1;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2649  	else if (spacc->config.stat_fifo_depth <= 4)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2650  		spacc->config.ideal_stat_level = spacc->config.stat_fifo_depth
188d801c0d4bbe Pavitrakumar M 2023-11-14  2651  			- 1;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2652  	else if (spacc->config.stat_fifo_depth <= 8)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2653  		spacc->config.ideal_stat_level = spacc->config.stat_fifo_depth
188d801c0d4bbe Pavitrakumar M 2023-11-14  2654  			- 2;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2655  	else
188d801c0d4bbe Pavitrakumar M 2023-11-14  2656  		spacc->config.ideal_stat_level = spacc->config.stat_fifo_depth
188d801c0d4bbe Pavitrakumar M 2023-11-14  2657  			- 4;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2658  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2659  	/* determine max PROClen value */
188d801c0d4bbe Pavitrakumar M 2023-11-14  2660  	writel(0xFFFFFFFF, spacc->regmap + SPACC_REG_PROC_LEN);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2661  	spacc->config.max_msg_size = readl(spacc->regmap + SPACC_REG_PROC_LEN);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2662  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2663  	/* read config info*/
188d801c0d4bbe Pavitrakumar M 2023-11-14  2664  	if (spacc->config.is_pdu) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2665  		pr_debug("PDU:\n");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2666  		pr_debug("   MAJOR      : %u\n", info->pdu_config.major);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2667  		pr_debug("   MINOR      : %u\n", info->pdu_config.minor);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2668  	}
188d801c0d4bbe Pavitrakumar M 2023-11-14  2669  	id = readl(spacc->regmap + SPACC_REG_ID);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2670  	pr_debug("SPACC ID: (%08lx)\n", (unsigned long)id);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2671  	pr_debug("   MAJOR      : %x\n", info->spacc_version.major);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2672  	pr_debug("   MINOR      : %x\n", info->spacc_version.minor);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2673  	pr_debug("   QOS        : %x\n", info->spacc_version.qos);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2674  	pr_debug("   IVIMPORT   : %x\n", spacc->config.is_ivimport);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2675  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2676  	if (spacc->config.version >= 0x48)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2677  		pr_debug("   TYPE       : %lx (%s)\n", SPACC_ID_TYPE(id),
188d801c0d4bbe Pavitrakumar M 2023-11-14  2678  			version_string[SPACC_ID_TYPE(id) & 3]);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2679  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2680  	pr_debug("   AUX        : %x\n", info->spacc_version.qos);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2681  	pr_debug("   IDX        : %lx %s\n", SPACC_ID_VIDX(id),
188d801c0d4bbe Pavitrakumar M 2023-11-14  2682  		spacc->config.is_secure ?
188d801c0d4bbe Pavitrakumar M 2023-11-14  2683  		(idx_string[spacc->config.is_secure_port & 1]) : "");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2684  	pr_debug("   PARTIAL    : %x\n", info->spacc_version.partial);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2685  	pr_debug("   PROJECT    : %x\n", info->spacc_version.project);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2686  	if (spacc->config.version >= 0x48)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2687  		id = readl(spacc->regmap + SPACC_REG_CONFIG);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2688  	else
188d801c0d4bbe Pavitrakumar M 2023-11-14  2689  		id = 0xFFFFFFFF;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2690  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2691  	pr_debug("SPACC CFG: (%08lx)\n", id);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2692  	pr_debug("   CTX CNT    : %u\n", info->spacc_config.num_ctx);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2693  	pr_debug("   VSPACC CNT : %u\n", info->spacc_config.num_vspacc);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2694  	pr_debug("   CIPH SZ    : %-3lu bytes\n", 1UL <<
188d801c0d4bbe Pavitrakumar M 2023-11-14  2695  			info->spacc_config.ciph_ctx_page_size);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2696  	pr_debug("   HASH SZ    : %-3lu bytes\n", 1UL <<
188d801c0d4bbe Pavitrakumar M 2023-11-14  2697  			info->spacc_config.hash_ctx_page_size);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2698  	pr_debug("   DMA TYPE   : %u (%s)\n", info->spacc_config.dma_type,
188d801c0d4bbe Pavitrakumar M 2023-11-14  2699  		dma_type_string[info->spacc_config.dma_type & 3]);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2700  	pr_debug("   MAX PROCLEN: %lu bytes\n", (unsigned
188d801c0d4bbe Pavitrakumar M 2023-11-14  2701  				long)spacc->config.max_msg_size);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2702  	pr_debug("   FIFO CONFIG :\n");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2703  	pr_debug("      CMD0 DEPTH: %d\n", spacc->config.cmd0_fifo_depth);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2704  	if (spacc->config.is_qos) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2705  		pr_debug("      CMD1 DEPTH: %d\n",
188d801c0d4bbe Pavitrakumar M 2023-11-14  2706  			spacc->config.cmd1_fifo_depth);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2707  		pr_debug("      CMD2 DEPTH: %d\n",
188d801c0d4bbe Pavitrakumar M 2023-11-14  2708  			spacc->config.cmd2_fifo_depth);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2709  	}
188d801c0d4bbe Pavitrakumar M 2023-11-14  2710  	pr_debug("      STAT DEPTH: %d\n", spacc->config.stat_fifo_depth);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2711  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2712  	if (spacc->config.dma_type == SPACC_DMA_DDT) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2713  		writel(0x1234567F, baseaddr + SPACC_REG_DST_PTR);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2714  		writel(0xDEADBEEF, baseaddr + SPACC_REG_SRC_PTR);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2715  		if (((readl(baseaddr + SPACC_REG_DST_PTR)) !=
188d801c0d4bbe Pavitrakumar M 2023-11-14  2716  					(0x1234567F & SPACC_DST_PTR_PTR)) ||
188d801c0d4bbe Pavitrakumar M 2023-11-14  2717  		    ((readl(baseaddr + SPACC_REG_SRC_PTR)) !=
188d801c0d4bbe Pavitrakumar M 2023-11-14  2718  		     (0xDEADBEEF & SPACC_SRC_PTR_PTR))) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2719  			pr_err("ERR: Failed to set pointers\n");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2720  			goto ERR;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2721  		}
188d801c0d4bbe Pavitrakumar M 2023-11-14  2722  	}
188d801c0d4bbe Pavitrakumar M 2023-11-14  2723  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2724  	/* zero the IRQ CTRL/EN register
188d801c0d4bbe Pavitrakumar M 2023-11-14  2725  	 * (to make sure we're in a sane state)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2726  	 */
188d801c0d4bbe Pavitrakumar M 2023-11-14  2727  	writel(0, spacc->regmap + SPACC_REG_IRQ_CTRL);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2728  	writel(0, spacc->regmap + SPACC_REG_IRQ_EN);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2729  	writel(0xFFFFFFFF, spacc->regmap + SPACC_REG_IRQ_STAT);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2730  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2731  	/* init cache*/
188d801c0d4bbe Pavitrakumar M 2023-11-14  2732  	memset(&spacc->cache, 0, sizeof(spacc->cache));
188d801c0d4bbe Pavitrakumar M 2023-11-14  2733  	writel(0, spacc->regmap + SPACC_REG_SRC_PTR);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2734  	writel(0, spacc->regmap + SPACC_REG_DST_PTR);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2735  	writel(0, spacc->regmap + SPACC_REG_PROC_LEN);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2736  	writel(0, spacc->regmap + SPACC_REG_ICV_LEN);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2737  	writel(0, spacc->regmap + SPACC_REG_ICV_OFFSET);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2738  	writel(0, spacc->regmap + SPACC_REG_PRE_AAD_LEN);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2739  	writel(0, spacc->regmap + SPACC_REG_POST_AAD_LEN);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2740  	writel(0, spacc->regmap + SPACC_REG_IV_OFFSET);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2741  	writel(0, spacc->regmap + SPACC_REG_OFFSET);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2742  	writel(0, spacc->regmap + SPACC_REG_AUX_INFO);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2743  
188d801c0d4bbe Pavitrakumar M 2023-11-14 @2744  	spacc->ctx = vmalloc(sizeof(struct spacc_ctx) *
188d801c0d4bbe Pavitrakumar M 2023-11-14  2745  			spacc->config.num_ctx);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2746  	if (!spacc->ctx) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2747  		pr_err("ERR: Out of memory for ctx\n");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2748  		goto ERR;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2749  	}
188d801c0d4bbe Pavitrakumar M 2023-11-14 @2750  	spacc->job = vmalloc(sizeof(struct spacc_job) * SPACC_MAX_JOBS);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2751  	if (!spacc->job) {
188d801c0d4bbe Pavitrakumar M 2023-11-14  2752  		pr_err("ERR: Out of memory for job\n");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2753  		goto ERR;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2754  	}
188d801c0d4bbe Pavitrakumar M 2023-11-14  2755  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2756  	/* initialize job_idx and lookup table */
188d801c0d4bbe Pavitrakumar M 2023-11-14  2757  	spacc_job_init_all(spacc);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2758  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2759  	/* initialize contexts */
188d801c0d4bbe Pavitrakumar M 2023-11-14  2760  	spacc_ctx_init_all(spacc);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2761  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2762  	/* autodetect and set string size setting*/
188d801c0d4bbe Pavitrakumar M 2023-11-14  2763  	if (spacc->config.version == 0x61 || spacc->config.version >= 0x65)
188d801c0d4bbe Pavitrakumar M 2023-11-14  2764  		spacc_xof_stringsize_autodetect(spacc);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2765  
188d801c0d4bbe Pavitrakumar M 2023-11-14  2766  	return CRYPTO_OK;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2767  ERR:
188d801c0d4bbe Pavitrakumar M 2023-11-14  2768  	spacc_fini(spacc);
188d801c0d4bbe Pavitrakumar M 2023-11-14  2769  	pr_err("ERR: Crypto Failed\n");
188d801c0d4bbe Pavitrakumar M 2023-11-14  2770  	return -EIO;
188d801c0d4bbe Pavitrakumar M 2023-11-14  2771  }
188d801c0d4bbe Pavitrakumar M 2023-11-14  2772  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
