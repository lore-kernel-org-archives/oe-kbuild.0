Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB88331A70
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581372; cv=none; b=ButpFgR/RQ96AWZHSuFCj6ometCxVXom7dbARzbXDc/1d6guq9VqY6Et7wGIyambiunWI9RvopN+yWgz1RZWvgfWU1guQ+FCxF88nSuUecp9lJ+Ur8y3XBUi2SFJm1MZyN3vL/BeRxvOww6nUF8Hd/p2ivmwrZXOrdl2F1nAQuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581372; c=relaxed/simple;
	bh=PM2Vcmkjwmsa9Uvv1ForvjP4bxAFkqctBiD4n3e8RyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uGIvDbffmYsi9AP6/uC01aCjgNtU+muhTpxVkzxrm1rn65IcwjlPFPtHrigmIoilUgtNDtuHyYxKGKz4L281AF7McquUXWLyBPRv5KFEbZBKxAQZOHfzLHNT28i1UkrozJ5gn+TyJcadD8ccHssHocaQuFvKRa7xu2b0dv+VhgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDfjAKdN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDfjAKdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771581370; x=1803117370;
  h=date:from:to:cc:subject:message-id;
  bh=PM2Vcmkjwmsa9Uvv1ForvjP4bxAFkqctBiD4n3e8RyY=;
  b=CDfjAKdNQkA68T+fwmZ1jsVKxYl2IqFDDx9pa7oSH6o2aaPPnW+Uh5rG
   HKgtAreaI5mYW091mE9ccjvuGVlmYqTKA5miuvtASZtOQUo2iwTeO9RqS
   HzpdkQ2PJQk8MgLOne7i6ZLE955xbvdImeg4iZ03Top16rwfEKiH0Ah4q
   tMit4qNp9nLVbEzZ3de3W6g17Ok68M0qnwFeCI5XjcgBFHGFefT/NJrNQ
   I0EJkrZAhngw+0j2OYBt3ox1P3AFnaoas8+uaDQ1iHEVF28uGIs+XEGkn
   Rq+qDir0JiK8ym8OGgoiPJsgUH5/ETIw1XVXIRtJFSffOIVK50ppg6jxm
   A==;
X-CSE-ConnectionGUID: unOh7COhTJKpheoPC0/jOg==
X-CSE-MsgGUID: 191y7ZitR16AUMoKviUS/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71698306"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="71698306"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 01:56:09 -0800
X-CSE-ConnectionGUID: MGMP6bsxT3WGxkD9G3p8DA==
X-CSE-MsgGUID: SMDmPdsfSnW803vcJ9wa8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="219355375"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Feb 2026 01:56:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtNEz-000000013zw-3I34;
	Fri, 20 Feb 2026 09:56:05 +0000
Date: Fri, 20 Feb 2026 17:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [arm-integrator:b4/ks8995-fixups 5/7]
 drivers/net/dsa/ks8995.c:314 ks8995_get_revision() warn: was || intended here
 instead of &&?
Message-ID: <202602201735.XhNCovu6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ks8995-fixups
head:   ea4d9288b053886fb1063467e90076b1bac75212
commit: 8391defbf00b98a8458722096cc571e598e5b8da [5/7] net: dsa: ks8955: Delete KSZ8864 and KSZ8795 support
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20260220 (https://download.01.org/0day-ci/archive/20260220/202602201735.XhNCovu6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602201735.XhNCovu6-lkp@intel.com/

smatch warnings:
drivers/net/dsa/ks8995.c:314 ks8995_get_revision() warn: was || intended here instead of &&?

vim +314 drivers/net/dsa/ks8995.c

a8e510f682fe6d drivers/net/phy/spi_ks8995.c Frederic LAMBERT 2011-12-18  285  
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  286  /* ks8995_get_revision - get chip revision
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  287   * @ks: pointer to switch instance
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  288   *
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  289   * Verify chip family and id and get chip revision.
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  290   */
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  291  static int ks8995_get_revision(struct ks8995_switch *ks)
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  292  {
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  293  	int err;
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  294  	u8 id0, id1;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  295  
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  296  	/* read family id */
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  297  	err = ks8995_read_reg(ks, KS8995_REG_ID0, &id0);
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  298  	if (err)
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  299  		return -EIO;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  300  
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  301  	/* verify family id */
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  302  	if (id0 != FAMILY_KS8995) {
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  303  		dev_err(&ks->spi->dev, "chip family id mismatch: expected 0x%02x but 0x%02x read\n",
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  304  			FAMILY_KS8995, id0);
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  305  		return -ENODEV;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  306  	}
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  307  
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  308  	/* try reading chip id at CHIP ID1 */
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  309  	err = ks8995_read_reg(ks, KS8995_REG_ID1, &id1);
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  310  	if (err)
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  311  		return -EIO;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  312  
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  313  	/* verify chip id */
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09 @314  	if ((get_chip_id(id1) == CHIPID_M) &&
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  315  	    (get_chip_id(id1) == KS8995_CHIP_ID)) {
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  316  		/* KS8995MA */
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  317  		ks->revision_id = get_chip_rev(id1);
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  318  	} else {
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  319  		dev_err(&ks->spi->dev, "unsupported chip id for KS8995 family: 0x%02x\n",
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  320  			id1);
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  321  		return -ENODEV;
c0e6cb1fed5a73 drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  322  	}
c0e6cb1fed5a73 drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  323  
8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  324  	return 0;
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  325  }
484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  326  

:::::: The code at line 314 was first introduced by commit
:::::: 484e36ff18341ca1fca4258139100b2e90530f53 net: phy: spi_ks8995: verify chip and determine revision

:::::: TO: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
