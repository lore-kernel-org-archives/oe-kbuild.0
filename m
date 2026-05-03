Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F7188596
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 01:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777770233; cv=none; b=KcPMJ05AyBACa6Wo8y0YtOJY2bNsOXnEYmsAoXJxQQwHEISnX5RbKt4OiGkOupz9mHqSX+3CdRwHT5N6JPqRc1X8P08ioOnE4GowGUjoBjHTygeDGPk56KGOzqCosHY6HmaS6Nc1F4B4VlSq77JBH1KG+6GmgfRBxn9bW2p6vTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777770233; c=relaxed/simple;
	bh=QxzFvFV/cr8KWFoMhfppLgJ0QVbi3brIiL4Z4YnQp2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DhDFn2Jr5n7SItp44ZW10m3UEL7XCBwMxkKldIupH0MEnJ7wvXNZpw4zMiG5C0fhO7RX8Z6jOCWf73MNAHFgdnrX+T27ockkL9O54YciHovtB4ArACUIAa82gjPbcWpalyW5t+1Ls4eJuKbSnymH0zvVjuNo/3OeOhNVTJzs8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msh/U8xR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msh/U8xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777770232; x=1809306232;
  h=date:from:to:cc:subject:message-id;
  bh=QxzFvFV/cr8KWFoMhfppLgJ0QVbi3brIiL4Z4YnQp2U=;
  b=msh/U8xRYfhUXqCCaOOqLEOw4Dr3JJ8k7SNCEhJckNeOSqwuNeSM4+o7
   s/EEgYEEy4Zd2F3yoyg9z+xFd/JwwQP24g7Jys15vhjc8JerwoEcCuHDj
   lpkiTNJL+jmf3svPl5ThME/fbsmet3zzU9EtMNBcr9GAk4/RtPZme3fVh
   yI4umf1Xg4bymLF15y2uljSecii2tllYkxQMhgCl2Q8HaBqB+AB7R2kUV
   uA9aW1OPV9JvKRj6npdi7kbM7/XtMGQiqpZneAJlhCnHDhHNKmM3DpFFy
   MqDBZsjRlcBN2l3ULGTU5YTRQgoudUjGMvMgu7y4MHMg3erz+6/rEMvTM
   g==;
X-CSE-ConnectionGUID: Q6QO8mIBRNiSZ6m+vJlPwQ==
X-CSE-MsgGUID: 4CU04STGTi6xkJ/a6p+vCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78580827"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78580827"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 18:03:51 -0700
X-CSE-ConnectionGUID: KkqSScHFThGgISOjyiCksQ==
X-CSE-MsgGUID: IDnsgnCrQeCCkbhMxxwysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="240184194"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 May 2026 18:03:51 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJLFL-000000001yN-25XF;
	Sun, 03 May 2026 01:03:47 +0000
Date: Sun, 03 May 2026 09:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [wsa:renesas/mailbox/fixes-on-mfis 4/13]
 drivers/soc/renesas/rcar-mfis.c:275 mfis_reg_probe() error: we previously
 assumed 'res' could be null (see line 267)
Message-ID: <202605030802.RcuPqkVb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mailbox/fixes-on-mfis
head:   2d8fe2dc5770bad929d446347506be6b28213997
commit: 3e92b484196d9a3ec5138e0961f02578015bea85 [4/13] soc: renesas: Add Renesas R-Car MFIS driver
:::::: branch date: 2 weeks ago
:::::: commit date: 3 weeks ago
config: mips-randconfig-r073-20260503 (https://download.01.org/0day-ci/archive/20260503/202605030802.RcuPqkVb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605030802.RcuPqkVb-lkp@intel.com/

smatch warnings:
drivers/soc/renesas/rcar-mfis.c:275 mfis_reg_probe() error: we previously assumed 'res' could be null (see line 267)

vim +/res +275 drivers/soc/renesas/rcar-mfis.c

3e92b484196d9a3 Wolfram Sang 2026-01-24  254  
3e92b484196d9a3 Wolfram Sang 2026-01-24  255  /********************************************************
3e92b484196d9a3 Wolfram Sang 2026-01-24  256   *			Common				*
3e92b484196d9a3 Wolfram Sang 2026-01-24  257   ********************************************************/
3e92b484196d9a3 Wolfram Sang 2026-01-24  258  static int mfis_reg_probe(struct platform_device *pdev, struct mfis_priv *priv,
3e92b484196d9a3 Wolfram Sang 2026-01-24  259  			  struct mfis_reg *mreg, const char *name, bool required)
3e92b484196d9a3 Wolfram Sang 2026-01-24  260  {
3e92b484196d9a3 Wolfram Sang 2026-01-24  261  	struct resource *res;
3e92b484196d9a3 Wolfram Sang 2026-01-24  262  	void __iomem *base;
3e92b484196d9a3 Wolfram Sang 2026-01-24  263  
3e92b484196d9a3 Wolfram Sang 2026-01-24  264  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
3e92b484196d9a3 Wolfram Sang 2026-01-24  265  
3e92b484196d9a3 Wolfram Sang 2026-01-24  266  	/* If there is no mailbox resource, registers are in the common space */
3e92b484196d9a3 Wolfram Sang 2026-01-24 @267  	if (!res && !required) {
3e92b484196d9a3 Wolfram Sang 2026-01-24  268  		*mreg = priv->common_reg;
3e92b484196d9a3 Wolfram Sang 2026-01-24  269  	} else {
3e92b484196d9a3 Wolfram Sang 2026-01-24  270  		base = devm_ioremap_resource(&pdev->dev, res);
3e92b484196d9a3 Wolfram Sang 2026-01-24  271  		if (IS_ERR(base))
3e92b484196d9a3 Wolfram Sang 2026-01-24  272  			return PTR_ERR(base);
3e92b484196d9a3 Wolfram Sang 2026-01-24  273  
3e92b484196d9a3 Wolfram Sang 2026-01-24  274  		mreg->base = base;
3e92b484196d9a3 Wolfram Sang 2026-01-24 @275  		mreg->start = res->start;
3e92b484196d9a3 Wolfram Sang 2026-01-24  276  		mreg->priv = priv;
3e92b484196d9a3 Wolfram Sang 2026-01-24  277  	}
3e92b484196d9a3 Wolfram Sang 2026-01-24  278  
3e92b484196d9a3 Wolfram Sang 2026-01-24  279  	return 0;
3e92b484196d9a3 Wolfram Sang 2026-01-24  280  }
3e92b484196d9a3 Wolfram Sang 2026-01-24  281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
