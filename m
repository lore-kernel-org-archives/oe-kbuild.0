Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DD61847
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Aug 2023 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693381262; x=1724917262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bUUS8BK0RtjltOqTwFpLmtfXUlTaEUKkhkNJ7ovFAH4=;
  b=EVuwyGZ1+VCDEYjNKOyM9/UfsLK54D6+Rrsc+getcOD39jf/AQmuPMI3
   9eBWi5mJsANuIfIB8FYVhltskItlBkMvNAurpD/pnbqv5OcEr1ezv+5eg
   +dyccwJxpzVKs+VXKY09G/WmCTa0ZbqjxPGm9Uvj9G5vufrLM+6fSuV4c
   t9JRR+i9/JOLtHr1s3zYn4pPHHF9MqKd9cokOpCfLmJzyAPg4lxofTXhJ
   WT7Ce8ub0j7TIZv2zGLY0+S07TmGNL2p4S2wdipdi+DH8eF91d37SdUPA
   nyCg6I2oteGYQHZU9iqeK5UshsmR/KW3PjzAk7cqH04oQwDxuezxO9t59
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406571578"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="406571578"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 00:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804413293"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="804413293"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 00:40:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbFoa-0009Zb-0v;
	Wed, 30 Aug 2023 07:40:36 +0000
Date: Wed, 30 Aug 2023 15:40:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shenki:dev-6.5 41/91] checkpatch: WARNING: struct kobj_type should
 normally be const
Message-ID: <202308301519.jAUy79hI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux dev-6.5
head:   f8eab14a32e81c6841991fdfe0d16e0f5c00d10f
commit: 87727a138a56859a0a7d80d0d55ab09761b1a156 [41/91] soc: aspeed: Add XDMA Engine Driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20230830/202308301519.jAUy79hI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308301519.jAUy79hI-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: please write a help paragraph that fully describes the config symbol
#49: drivers/soc/aspeed/Kconfig:55:
+config ASPEED_XDMA
+	tristate "ASPEED XDMA Engine Driver"
+	select REGMAP
+	select MFD_SYSCON
+	depends on HAS_DMA
+	help
+	  Enable support for the XDMA Engine found on the ASPEED BMC
+	  SoCs. The XDMA engine can perform PCIe DMA operations between the BMC
+	  and a host processor.
+

WARNING: please, no space before tabs
#113: drivers/soc/aspeed/aspeed-xdma.c:37:
+#define  DEBUG_CTRL_XDMA_DISABLE^I ^I BIT(2)$

WARNING: quoted string split across lines
#448: drivers/soc/aspeed/aspeed-xdma.c:372:
+	dev_dbg(ctx->dev, "xdma %s ast2600: bmc[%08x] len[%08x] "
+		"host[%016llx]\n", op->direction ? "upstream" : "downstream",

WARNING: struct kobj_type should normally be const
#719: drivers/soc/aspeed/aspeed-xdma.c:643:
+static struct kobj_type aspeed_xdma_kobject_type = {

WARNING: Possible unnecessary 'out of memory' message
#844: drivers/soc/aspeed/aspeed-xdma.c:768:
+	if (!ctx->mem_virt) {
+		dev_err(dev, "Failed to allocate reserved memory.\n");

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
#1039: drivers/soc/aspeed/aspeed-xdma.c:963:
+MODULE_LICENSE("GPL v2");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
