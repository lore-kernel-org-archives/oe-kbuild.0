Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD62773C3
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765695297; cv=none; b=Y7lap5KabnDrMJFS5vQMnIUKw+KDr9oDRTdTxcLRPV/do7RSrdCCaNR62nB8uAf9BQdERKdFw5X6waKueZwdMChn1tLG6pAgVe4Bc0DunOiNtYGcQYLlyZ8devwVIEN5FRytwSDK0BYa+9Uj+iEoFnAO3SNwJOWiqBl5IHxXDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765695297; c=relaxed/simple;
	bh=+MujrKZ0Hvc6vw4bQ0ZPucUTHfVAHHOB6I2W9BTmKQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=no8kb983ah9X/LOdhFYUFInXGdeqefCVs/+pBiCGIbM6dMwYf28BV9lhrP8JmqkNFHPGl5Oln+jvRvgWFEjqVSDqd4BHCG/3KpKg8MbOKQxRDTVzZ/rRoLhwz6HMe4XRl1a+30blVJgRXIX+0dw5gFhcWBGy10DpX0texuXWwn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqSBXHyK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqSBXHyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765695295; x=1797231295;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+MujrKZ0Hvc6vw4bQ0ZPucUTHfVAHHOB6I2W9BTmKQg=;
  b=GqSBXHyK+bvaDIkxpVAPRyQbH+thMlxxWGyeyH1GBC7pd0z2WXkDB7lA
   RionRAHKcexHJMLKNNly3U8XEMbCATSE9CZiHzl71NnU0/JI7ngg5r2tI
   w0jzdov9YLmZiG1WXAV+DaItpsJgIxlT1Z1gGO8fUJZGMB/psq2ElrgJQ
   fITRaSXvX1hcBerixQIGSZEKgwQs0col1QVf+a4OMasqc57sIrTY8l7Sg
   l6DoVmYJybKgpbaTQNBKtQmjPSoXbBVnFIC0KVGalIqFPpX/WUVKbeN/a
   ryjoEsDaf793/euMGKiCTSidu0RkWR/01A+vcErTGXbRL1+qr4fhD+cRB
   w==;
X-CSE-ConnectionGUID: +8oMoJN3RfKvFRf+JxnrqQ==
X-CSE-MsgGUID: 9Hjg20EKSSWw/G3c0HBTWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71262446"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71262446"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 22:54:53 -0800
X-CSE-ConnectionGUID: r2r6Q+8ySO2yPnPlECRG1w==
X-CSE-MsgGUID: 2e+/NzymRiqVhW+665TCmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197959038"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2025 22:54:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUg0H-000000008lj-39Fg;
	Sun, 14 Dec 2025 06:54:49 +0000
Date: Sun, 14 Dec 2025 14:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/kernel/rtas.c:378:46: sparse: sparse: obsolete array
 initializer, use C99 syntax
Message-ID: <202512141417.I8KYgFHy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/powerpc/kernel/rtas.c:378:46: sparse: sparse: obsolete array initializer, use C99 syntax"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haren Myneni <haren@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Mahesh Salgaonkar <mahesh@linux.ibm.com>
CC: Tyrel Datwyler <tyreld@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dfb36b2dcb666f116ba314e631bd3bc632c44d1
commit: 26b4fcecea05b8927b17c9ace132914ffcb4d97e powerpc/pseries: Define HVPIPE specific macros
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-r112-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141417.I8KYgFHy-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141417.I8KYgFHy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512141417.I8KYgFHy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/rtas.c:378:46: sparse: sparse: obsolete array initializer, use C99 syntax
   arch/powerpc/kernel/rtas.c:407:43: sparse: sparse: obsolete array initializer, use C99 syntax
   arch/powerpc/kernel/rtas.c:101:1: sparse: sparse: symbol 'rtas_ibm_receive_hvpipe_msg_lock' was not declared. Should it be static?

vim +378 arch/powerpc/kernel/rtas.c

adf7a019e5f826 Nathan Lynch 2023-12-12  103  
8252b88294d2a7 Nathan Lynch 2023-02-10  104  static struct rtas_function rtas_function_table[] __ro_after_init = {
8252b88294d2a7 Nathan Lynch 2023-02-10  105  	[RTAS_FNIDX__CHECK_EXCEPTION] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  106  		.name = "check-exception",
8252b88294d2a7 Nathan Lynch 2023-02-10  107  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  108  	[RTAS_FNIDX__DISPLAY_CHARACTER] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  109  		.name = "display-character",
8252b88294d2a7 Nathan Lynch 2023-02-10  110  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  111  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  112  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  113  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  114  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  115  	[RTAS_FNIDX__EVENT_SCAN] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  116  		.name = "event-scan",
8252b88294d2a7 Nathan Lynch 2023-02-10  117  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  118  	[RTAS_FNIDX__FREEZE_TIME_BASE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  119  		.name = "freeze-time-base",
8252b88294d2a7 Nathan Lynch 2023-02-10  120  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  121  	[RTAS_FNIDX__GET_POWER_LEVEL] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  122  		.name = "get-power-level",
8252b88294d2a7 Nathan Lynch 2023-02-10  123  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  124  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  125  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  126  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  127  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  128  	[RTAS_FNIDX__GET_SENSOR_STATE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  129  		.name = "get-sensor-state",
8252b88294d2a7 Nathan Lynch 2023-02-10  130  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  131  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  132  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  133  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  134  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  135  	[RTAS_FNIDX__GET_TERM_CHAR] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  136  		.name = "get-term-char",
8252b88294d2a7 Nathan Lynch 2023-02-10  137  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  138  	[RTAS_FNIDX__GET_TIME_OF_DAY] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  139  		.name = "get-time-of-day",
8252b88294d2a7 Nathan Lynch 2023-02-10  140  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  141  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  142  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  143  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  144  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  145  	[RTAS_FNIDX__IBM_ACTIVATE_FIRMWARE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  146  		.name = "ibm,activate-firmware",
8252b88294d2a7 Nathan Lynch 2023-02-10  147  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  148  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  149  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  150  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  151  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  152  		 * PAPR+ as of v2.13 doesn't explicitly impose any
adf7a019e5f826 Nathan Lynch 2023-12-12  153  		 * restriction, but this typically requires multiple
adf7a019e5f826 Nathan Lynch 2023-12-12  154  		 * calls before success, and there's no reason to
adf7a019e5f826 Nathan Lynch 2023-12-12  155  		 * allow sequences to interleave.
adf7a019e5f826 Nathan Lynch 2023-12-12  156  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  157  		.lock = &rtas_ibm_activate_firmware_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  158  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  159  	[RTAS_FNIDX__IBM_CBE_START_PTCAL] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  160  		.name = "ibm,cbe-start-ptcal",
8252b88294d2a7 Nathan Lynch 2023-02-10  161  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  162  	[RTAS_FNIDX__IBM_CBE_STOP_PTCAL] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  163  		.name = "ibm,cbe-stop-ptcal",
8252b88294d2a7 Nathan Lynch 2023-02-10  164  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  165  	[RTAS_FNIDX__IBM_CHANGE_MSI] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  166  		.name = "ibm,change-msi",
8252b88294d2a7 Nathan Lynch 2023-02-10  167  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  168  	[RTAS_FNIDX__IBM_CLOSE_ERRINJCT] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  169  		.name = "ibm,close-errinjct",
8252b88294d2a7 Nathan Lynch 2023-02-10  170  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  171  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  172  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  173  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  174  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  175  	[RTAS_FNIDX__IBM_CONFIGURE_BRIDGE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  176  		.name = "ibm,configure-bridge",
8252b88294d2a7 Nathan Lynch 2023-02-10  177  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  178  	[RTAS_FNIDX__IBM_CONFIGURE_CONNECTOR] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  179  		.name = "ibm,configure-connector",
8252b88294d2a7 Nathan Lynch 2023-02-10  180  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  181  			.buf_idx1 = 0, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  182  			.buf_idx2 = 1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  183  			.fixed_size = 4096,
8252b88294d2a7 Nathan Lynch 2023-02-10  184  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  185  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  186  	[RTAS_FNIDX__IBM_CONFIGURE_KERNEL_DUMP] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  187  		.name = "ibm,configure-kernel-dump",
8252b88294d2a7 Nathan Lynch 2023-02-10  188  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  189  	[RTAS_FNIDX__IBM_CONFIGURE_PE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  190  		.name = "ibm,configure-pe",
8252b88294d2a7 Nathan Lynch 2023-02-10  191  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  192  	[RTAS_FNIDX__IBM_CREATE_PE_DMA_WINDOW] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  193  		.name = "ibm,create-pe-dma-window",
8252b88294d2a7 Nathan Lynch 2023-02-10  194  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  195  	[RTAS_FNIDX__IBM_DISPLAY_MESSAGE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  196  		.name = "ibm,display-message",
8252b88294d2a7 Nathan Lynch 2023-02-10  197  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  198  			.buf_idx1 = 0, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  199  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  200  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  201  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  202  	[RTAS_FNIDX__IBM_ERRINJCT] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  203  		.name = "ibm,errinjct",
8252b88294d2a7 Nathan Lynch 2023-02-10  204  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  205  			.buf_idx1 = 2, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  206  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  207  			.fixed_size = 1024,
8252b88294d2a7 Nathan Lynch 2023-02-10  208  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  209  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  210  	[RTAS_FNIDX__IBM_EXTI2C] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  211  		.name = "ibm,exti2c",
8252b88294d2a7 Nathan Lynch 2023-02-10  212  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  213  	[RTAS_FNIDX__IBM_GET_CONFIG_ADDR_INFO] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  214  		.name = "ibm,get-config-addr-info",
8252b88294d2a7 Nathan Lynch 2023-02-10  215  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  216  	[RTAS_FNIDX__IBM_GET_CONFIG_ADDR_INFO2] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  217  		.name = "ibm,get-config-addr-info2",
8252b88294d2a7 Nathan Lynch 2023-02-10  218  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  219  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  220  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  221  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  222  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  223  	[RTAS_FNIDX__IBM_GET_DYNAMIC_SENSOR_STATE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  224  		.name = "ibm,get-dynamic-sensor-state",
8252b88294d2a7 Nathan Lynch 2023-02-10  225  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  226  			.buf_idx1 = 1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  227  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  228  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  229  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  230  		 * PAPR+ v2.13 R1–7.3.19–3 is explicit that the OS
adf7a019e5f826 Nathan Lynch 2023-12-12  231  		 * must not call ibm,get-dynamic-sensor-state with
adf7a019e5f826 Nathan Lynch 2023-12-12  232  		 * different inputs until a non-retry status has been
adf7a019e5f826 Nathan Lynch 2023-12-12  233  		 * returned.
adf7a019e5f826 Nathan Lynch 2023-12-12  234  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  235  		.lock = &rtas_ibm_get_dynamic_sensor_state_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  236  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  237  	[RTAS_FNIDX__IBM_GET_INDICES] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  238  		.name = "ibm,get-indices",
8252b88294d2a7 Nathan Lynch 2023-02-10  239  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  240  			.buf_idx1 = 2, .size_idx1 = 3,
8252b88294d2a7 Nathan Lynch 2023-02-10  241  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  242  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  243  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  244  		 * PAPR+ v2.13 R1–7.3.17–2 says that the OS must not
adf7a019e5f826 Nathan Lynch 2023-12-12  245  		 * interleave ibm,get-indices call sequences with
adf7a019e5f826 Nathan Lynch 2023-12-12  246  		 * different inputs.
adf7a019e5f826 Nathan Lynch 2023-12-12  247  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  248  		.lock = &rtas_ibm_get_indices_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  249  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  250  	[RTAS_FNIDX__IBM_GET_RIO_TOPOLOGY] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  251  		.name = "ibm,get-rio-topology",
8252b88294d2a7 Nathan Lynch 2023-02-10  252  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  253  	[RTAS_FNIDX__IBM_GET_SYSTEM_PARAMETER] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  254  		.name = "ibm,get-system-parameter",
8252b88294d2a7 Nathan Lynch 2023-02-10  255  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  256  			.buf_idx1 = 1, .size_idx1 = 2,
8252b88294d2a7 Nathan Lynch 2023-02-10  257  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  258  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  259  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  260  	[RTAS_FNIDX__IBM_GET_VPD] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  261  		.name = "ibm,get-vpd",
8252b88294d2a7 Nathan Lynch 2023-02-10  262  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  263  			.buf_idx1 = 0, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  264  			.buf_idx2 = 1, .size_idx2 = 2,
8252b88294d2a7 Nathan Lynch 2023-02-10  265  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  266  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  267  		 * PAPR+ v2.13 R1–7.3.20–4 indicates that sequences
adf7a019e5f826 Nathan Lynch 2023-12-12  268  		 * should not be allowed to interleave.
adf7a019e5f826 Nathan Lynch 2023-12-12  269  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  270  		.lock = &rtas_ibm_get_vpd_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  271  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  272  	[RTAS_FNIDX__IBM_GET_XIVE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  273  		.name = "ibm,get-xive",
8252b88294d2a7 Nathan Lynch 2023-02-10  274  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  275  	[RTAS_FNIDX__IBM_INT_OFF] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  276  		.name = "ibm,int-off",
8252b88294d2a7 Nathan Lynch 2023-02-10  277  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  278  	[RTAS_FNIDX__IBM_INT_ON] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  279  		.name = "ibm,int-on",
8252b88294d2a7 Nathan Lynch 2023-02-10  280  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  281  	[RTAS_FNIDX__IBM_IO_QUIESCE_ACK] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  282  		.name = "ibm,io-quiesce-ack",
8252b88294d2a7 Nathan Lynch 2023-02-10  283  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  284  	[RTAS_FNIDX__IBM_LPAR_PERFTOOLS] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  285  		.name = "ibm,lpar-perftools",
8252b88294d2a7 Nathan Lynch 2023-02-10  286  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  287  			.buf_idx1 = 2, .size_idx1 = 3,
8252b88294d2a7 Nathan Lynch 2023-02-10  288  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  289  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  290  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  291  		 * PAPR+ v2.13 R1–7.3.26–6 says the OS should allow
adf7a019e5f826 Nathan Lynch 2023-12-12  292  		 * only one call sequence in progress at a time.
adf7a019e5f826 Nathan Lynch 2023-12-12  293  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  294  		.lock = &rtas_ibm_lpar_perftools_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  295  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  296  	[RTAS_FNIDX__IBM_MANAGE_FLASH_IMAGE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  297  		.name = "ibm,manage-flash-image",
8252b88294d2a7 Nathan Lynch 2023-02-10  298  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  299  	[RTAS_FNIDX__IBM_MANAGE_STORAGE_PRESERVATION] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  300  		.name = "ibm,manage-storage-preservation",
8252b88294d2a7 Nathan Lynch 2023-02-10  301  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  302  	[RTAS_FNIDX__IBM_NMI_INTERLOCK] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  303  		.name = "ibm,nmi-interlock",
8252b88294d2a7 Nathan Lynch 2023-02-10  304  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  305  	[RTAS_FNIDX__IBM_NMI_REGISTER] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  306  		.name = "ibm,nmi-register",
8252b88294d2a7 Nathan Lynch 2023-02-10  307  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  308  	[RTAS_FNIDX__IBM_OPEN_ERRINJCT] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  309  		.name = "ibm,open-errinjct",
8252b88294d2a7 Nathan Lynch 2023-02-10  310  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  311  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  312  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  313  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  314  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  315  	[RTAS_FNIDX__IBM_OPEN_SRIOV_ALLOW_UNFREEZE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  316  		.name = "ibm,open-sriov-allow-unfreeze",
8252b88294d2a7 Nathan Lynch 2023-02-10  317  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  318  	[RTAS_FNIDX__IBM_OPEN_SRIOV_MAP_PE_NUMBER] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  319  		.name = "ibm,open-sriov-map-pe-number",
8252b88294d2a7 Nathan Lynch 2023-02-10  320  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  321  	[RTAS_FNIDX__IBM_OS_TERM] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  322  		.name = "ibm,os-term",
8252b88294d2a7 Nathan Lynch 2023-02-10  323  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  324  	[RTAS_FNIDX__IBM_PARTNER_CONTROL] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  325  		.name = "ibm,partner-control",
8252b88294d2a7 Nathan Lynch 2023-02-10  326  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  327  	[RTAS_FNIDX__IBM_PHYSICAL_ATTESTATION] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  328  		.name = "ibm,physical-attestation",
8252b88294d2a7 Nathan Lynch 2023-02-10  329  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  330  			.buf_idx1 = 0, .size_idx1 = 1,
8252b88294d2a7 Nathan Lynch 2023-02-10  331  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  332  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  333  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  334  		 * This follows a sequence-based pattern similar to
adf7a019e5f826 Nathan Lynch 2023-12-12  335  		 * ibm,get-vpd et al. Since PAPR+ restricts
adf7a019e5f826 Nathan Lynch 2023-12-12  336  		 * interleaving call sequences for other functions of
adf7a019e5f826 Nathan Lynch 2023-12-12  337  		 * this style, assume the restriction applies here,
adf7a019e5f826 Nathan Lynch 2023-12-12  338  		 * even though it's not explicit in the spec.
adf7a019e5f826 Nathan Lynch 2023-12-12  339  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  340  		.lock = &rtas_ibm_physical_attestation_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  341  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  342  	[RTAS_FNIDX__IBM_PLATFORM_DUMP] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  343  		.name = "ibm,platform-dump",
8252b88294d2a7 Nathan Lynch 2023-02-10  344  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  345  			.buf_idx1 = 4, .size_idx1 = 5,
8252b88294d2a7 Nathan Lynch 2023-02-10  346  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  347  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  348  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  349  		 * PAPR+ v2.13 7.3.3.4.1 indicates that concurrent
adf7a019e5f826 Nathan Lynch 2023-12-12  350  		 * sequences of ibm,platform-dump are allowed if they
adf7a019e5f826 Nathan Lynch 2023-12-12  351  		 * are operating on different dump tags. So leave the
adf7a019e5f826 Nathan Lynch 2023-12-12  352  		 * lock pointer unset for now. This may need
adf7a019e5f826 Nathan Lynch 2023-12-12  353  		 * reconsideration if kernel-internal users appear.
adf7a019e5f826 Nathan Lynch 2023-12-12  354  		 */
8252b88294d2a7 Nathan Lynch 2023-02-10  355  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  356  	[RTAS_FNIDX__IBM_POWER_OFF_UPS] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  357  		.name = "ibm,power-off-ups",
8252b88294d2a7 Nathan Lynch 2023-02-10  358  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  359  	[RTAS_FNIDX__IBM_QUERY_INTERRUPT_SOURCE_NUMBER] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  360  		.name = "ibm,query-interrupt-source-number",
8252b88294d2a7 Nathan Lynch 2023-02-10  361  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  362  	[RTAS_FNIDX__IBM_QUERY_PE_DMA_WINDOW] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  363  		.name = "ibm,query-pe-dma-window",
8252b88294d2a7 Nathan Lynch 2023-02-10  364  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  365  	[RTAS_FNIDX__IBM_READ_PCI_CONFIG] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  366  		.name = "ibm,read-pci-config",
8252b88294d2a7 Nathan Lynch 2023-02-10  367  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  368  	[RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  369  		.name = "ibm,read-slot-reset-state",
8252b88294d2a7 Nathan Lynch 2023-02-10  370  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  371  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  372  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  373  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  374  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  375  	[RTAS_FNIDX__IBM_READ_SLOT_RESET_STATE2] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  376  		.name = "ibm,read-slot-reset-state2",
8252b88294d2a7 Nathan Lynch 2023-02-10  377  	},
26b4fcecea05b8 Haren Myneni 2025-09-09 @378  	[RTAS_FNIDX__IBM_RECEIVE_HVPIPE_MSG] {
26b4fcecea05b8 Haren Myneni 2025-09-09  379  		.name = "ibm,receive-hvpipe-msg",
26b4fcecea05b8 Haren Myneni 2025-09-09  380  		.filter = &(const struct rtas_filter) {
26b4fcecea05b8 Haren Myneni 2025-09-09  381  			.buf_idx1 = 0, .size_idx1 = 1,
26b4fcecea05b8 Haren Myneni 2025-09-09  382  			.buf_idx2 = -1, .size_idx2 = -1,
26b4fcecea05b8 Haren Myneni 2025-09-09  383  		},
26b4fcecea05b8 Haren Myneni 2025-09-09  384  		/*
26b4fcecea05b8 Haren Myneni 2025-09-09  385  		 * PAPR+ v2.13 R1–7.3.32.1
26b4fcecea05b8 Haren Myneni 2025-09-09  386  		 */
26b4fcecea05b8 Haren Myneni 2025-09-09  387  		.lock = &rtas_ibm_receive_hvpipe_msg_lock,
26b4fcecea05b8 Haren Myneni 2025-09-09  388  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  389  	[RTAS_FNIDX__IBM_REMOVE_PE_DMA_WINDOW] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  390  		.name = "ibm,remove-pe-dma-window",
8252b88294d2a7 Nathan Lynch 2023-02-10  391  	},
fad87dbd48156a Nathan Lynch 2024-02-22  392  	[RTAS_FNIDX__IBM_RESET_PE_DMA_WINDOW] = {
fad87dbd48156a Nathan Lynch 2024-02-22  393  		/*
fad87dbd48156a Nathan Lynch 2024-02-22  394  		 * Note: PAPR+ v2.13 7.3.31.4.1 spells this as
fad87dbd48156a Nathan Lynch 2024-02-22  395  		 * "ibm,reset-pe-dma-windows" (plural), but RTAS
fad87dbd48156a Nathan Lynch 2024-02-22  396  		 * implementations use the singular form in practice.
fad87dbd48156a Nathan Lynch 2024-02-22  397  		 */
fad87dbd48156a Nathan Lynch 2024-02-22  398  		.name = "ibm,reset-pe-dma-window",
8252b88294d2a7 Nathan Lynch 2023-02-10  399  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  400  	[RTAS_FNIDX__IBM_SCAN_LOG_DUMP] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  401  		.name = "ibm,scan-log-dump",
8252b88294d2a7 Nathan Lynch 2023-02-10  402  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  403  			.buf_idx1 = 0, .size_idx1 = 1,
8252b88294d2a7 Nathan Lynch 2023-02-10  404  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  405  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  406  	},
26b4fcecea05b8 Haren Myneni 2025-09-09  407  	[RTAS_FNIDX__IBM_SEND_HVPIPE_MSG] {
26b4fcecea05b8 Haren Myneni 2025-09-09  408  		.name = "ibm,send-hvpipe-msg",
26b4fcecea05b8 Haren Myneni 2025-09-09  409  		.filter = &(const struct rtas_filter) {
26b4fcecea05b8 Haren Myneni 2025-09-09  410  			.buf_idx1 = 1, .size_idx1 = -1,
26b4fcecea05b8 Haren Myneni 2025-09-09  411  			.buf_idx2 = -1, .size_idx2 = -1,
26b4fcecea05b8 Haren Myneni 2025-09-09  412  		},
26b4fcecea05b8 Haren Myneni 2025-09-09  413  		/*
26b4fcecea05b8 Haren Myneni 2025-09-09  414  		 * PAPR+ v2.13 R1–7.3.32.2
26b4fcecea05b8 Haren Myneni 2025-09-09  415  		 */
26b4fcecea05b8 Haren Myneni 2025-09-09  416  		.lock = &rtas_ibm_send_hvpipe_msg_lock,
26b4fcecea05b8 Haren Myneni 2025-09-09  417  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  418  	[RTAS_FNIDX__IBM_SET_DYNAMIC_INDICATOR] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  419  		.name = "ibm,set-dynamic-indicator",
8252b88294d2a7 Nathan Lynch 2023-02-10  420  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  421  			.buf_idx1 = 2, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  422  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  423  		},
adf7a019e5f826 Nathan Lynch 2023-12-12  424  		/*
adf7a019e5f826 Nathan Lynch 2023-12-12  425  		 * PAPR+ v2.13 R1–7.3.18–3 says the OS must not call
adf7a019e5f826 Nathan Lynch 2023-12-12  426  		 * this function with different inputs until a
adf7a019e5f826 Nathan Lynch 2023-12-12  427  		 * non-retry status has been returned.
adf7a019e5f826 Nathan Lynch 2023-12-12  428  		 */
adf7a019e5f826 Nathan Lynch 2023-12-12  429  		.lock = &rtas_ibm_set_dynamic_indicator_lock,
8252b88294d2a7 Nathan Lynch 2023-02-10  430  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  431  	[RTAS_FNIDX__IBM_SET_EEH_OPTION] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  432  		.name = "ibm,set-eeh-option",
8252b88294d2a7 Nathan Lynch 2023-02-10  433  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  434  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  435  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  436  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  437  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  438  	[RTAS_FNIDX__IBM_SET_SLOT_RESET] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  439  		.name = "ibm,set-slot-reset",
8252b88294d2a7 Nathan Lynch 2023-02-10  440  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  441  	[RTAS_FNIDX__IBM_SET_SYSTEM_PARAMETER] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  442  		.name = "ibm,set-system-parameter",
8252b88294d2a7 Nathan Lynch 2023-02-10  443  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  444  			.buf_idx1 = 1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  445  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  446  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  447  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  448  	[RTAS_FNIDX__IBM_SET_XIVE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  449  		.name = "ibm,set-xive",
8252b88294d2a7 Nathan Lynch 2023-02-10  450  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  451  	[RTAS_FNIDX__IBM_SLOT_ERROR_DETAIL] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  452  		.name = "ibm,slot-error-detail",
8252b88294d2a7 Nathan Lynch 2023-02-10  453  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  454  	[RTAS_FNIDX__IBM_SUSPEND_ME] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  455  		.name = "ibm,suspend-me",
8252b88294d2a7 Nathan Lynch 2023-02-10  456  		.banned_for_syscall_on_le = true,
8252b88294d2a7 Nathan Lynch 2023-02-10  457  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  458  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  459  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  460  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  461  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  462  	[RTAS_FNIDX__IBM_TUNE_DMA_PARMS] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  463  		.name = "ibm,tune-dma-parms",
8252b88294d2a7 Nathan Lynch 2023-02-10  464  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  465  	[RTAS_FNIDX__IBM_UPDATE_FLASH_64_AND_REBOOT] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  466  		.name = "ibm,update-flash-64-and-reboot",
8252b88294d2a7 Nathan Lynch 2023-02-10  467  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  468  	[RTAS_FNIDX__IBM_UPDATE_NODES] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  469  		.name = "ibm,update-nodes",
8252b88294d2a7 Nathan Lynch 2023-02-10  470  		.banned_for_syscall_on_le = true,
8252b88294d2a7 Nathan Lynch 2023-02-10  471  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  472  			.buf_idx1 = 0, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  473  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  474  			.fixed_size = 4096,
8252b88294d2a7 Nathan Lynch 2023-02-10  475  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  476  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  477  	[RTAS_FNIDX__IBM_UPDATE_PROPERTIES] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  478  		.name = "ibm,update-properties",
8252b88294d2a7 Nathan Lynch 2023-02-10  479  		.banned_for_syscall_on_le = true,
8252b88294d2a7 Nathan Lynch 2023-02-10  480  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  481  			.buf_idx1 = 0, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  482  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  483  			.fixed_size = 4096,
8252b88294d2a7 Nathan Lynch 2023-02-10  484  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  485  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  486  	[RTAS_FNIDX__IBM_VALIDATE_FLASH_IMAGE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  487  		.name = "ibm,validate-flash-image",
8252b88294d2a7 Nathan Lynch 2023-02-10  488  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  489  	[RTAS_FNIDX__IBM_WRITE_PCI_CONFIG] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  490  		.name = "ibm,write-pci-config",
8252b88294d2a7 Nathan Lynch 2023-02-10  491  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  492  	[RTAS_FNIDX__NVRAM_FETCH] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  493  		.name = "nvram-fetch",
8252b88294d2a7 Nathan Lynch 2023-02-10  494  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  495  	[RTAS_FNIDX__NVRAM_STORE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  496  		.name = "nvram-store",
8252b88294d2a7 Nathan Lynch 2023-02-10  497  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  498  	[RTAS_FNIDX__POWER_OFF] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  499  		.name = "power-off",
8252b88294d2a7 Nathan Lynch 2023-02-10  500  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  501  	[RTAS_FNIDX__PUT_TERM_CHAR] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  502  		.name = "put-term-char",
8252b88294d2a7 Nathan Lynch 2023-02-10  503  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  504  	[RTAS_FNIDX__QUERY_CPU_STOPPED_STATE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  505  		.name = "query-cpu-stopped-state",
8252b88294d2a7 Nathan Lynch 2023-02-10  506  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  507  	[RTAS_FNIDX__READ_PCI_CONFIG] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  508  		.name = "read-pci-config",
8252b88294d2a7 Nathan Lynch 2023-02-10  509  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  510  	[RTAS_FNIDX__RTAS_LAST_ERROR] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  511  		.name = "rtas-last-error",
8252b88294d2a7 Nathan Lynch 2023-02-10  512  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  513  	[RTAS_FNIDX__SET_INDICATOR] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  514  		.name = "set-indicator",
8252b88294d2a7 Nathan Lynch 2023-02-10  515  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  516  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  517  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  518  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  519  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  520  	[RTAS_FNIDX__SET_POWER_LEVEL] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  521  		.name = "set-power-level",
8252b88294d2a7 Nathan Lynch 2023-02-10  522  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  523  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  524  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  525  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  526  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  527  	[RTAS_FNIDX__SET_TIME_FOR_POWER_ON] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  528  		.name = "set-time-for-power-on",
8252b88294d2a7 Nathan Lynch 2023-02-10  529  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  530  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  531  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  532  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  533  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  534  	[RTAS_FNIDX__SET_TIME_OF_DAY] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  535  		.name = "set-time-of-day",
8252b88294d2a7 Nathan Lynch 2023-02-10  536  		.filter = &(const struct rtas_filter) {
8252b88294d2a7 Nathan Lynch 2023-02-10  537  			.buf_idx1 = -1, .size_idx1 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  538  			.buf_idx2 = -1, .size_idx2 = -1,
8252b88294d2a7 Nathan Lynch 2023-02-10  539  		},
8252b88294d2a7 Nathan Lynch 2023-02-10  540  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  541  	[RTAS_FNIDX__START_CPU] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  542  		.name = "start-cpu",
8252b88294d2a7 Nathan Lynch 2023-02-10  543  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  544  	[RTAS_FNIDX__STOP_SELF] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  545  		.name = "stop-self",
8252b88294d2a7 Nathan Lynch 2023-02-10  546  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  547  	[RTAS_FNIDX__SYSTEM_REBOOT] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  548  		.name = "system-reboot",
8252b88294d2a7 Nathan Lynch 2023-02-10  549  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  550  	[RTAS_FNIDX__THAW_TIME_BASE] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  551  		.name = "thaw-time-base",
8252b88294d2a7 Nathan Lynch 2023-02-10  552  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  553  	[RTAS_FNIDX__WRITE_PCI_CONFIG] = {
8252b88294d2a7 Nathan Lynch 2023-02-10  554  		.name = "write-pci-config",
8252b88294d2a7 Nathan Lynch 2023-02-10  555  	},
8252b88294d2a7 Nathan Lynch 2023-02-10  556  };
8252b88294d2a7 Nathan Lynch 2023-02-10  557  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
