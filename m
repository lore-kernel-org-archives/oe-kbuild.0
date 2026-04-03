Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20613272E7C
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206083; cv=none; b=sc0ax/jQvk1ySBPkb1NFiKDTA6GtewPhtmkpL1rDTFe8YT1ufHs7Iw0E88bSjMejFfzX33CSBu0mTTJNdEabqrtWueAna2NsqXHqYFo3HE2JLPjM3KP7hoTs2/2GmFSiGOZdR0sOJwfEF+QjsjXLU/ehON1zOZZlXUgVtti4Beo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206083; c=relaxed/simple;
	bh=ds/vySF+ISbuY7c1HdaiOHM8FTjL5TSyNOAkvt3vq4Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oCApd/KPDNk4ndbMDm/AHpxB5EWN0G3UjBhbcZg9hJkASvVroIJvs17MdymCdBsNQ6M62sDhmUdK3iqxXy0RyuYMaAoE0010oN0M+/VhWu0KdekA8Q0quiS6l7hVmvavM97NRQkNWDEBGL+X9De/j7GmWvyBBqurdRHqNyvTj+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxfdGv9j; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxfdGv9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206082; x=1806742082;
  h=date:from:to:cc:subject:message-id;
  bh=ds/vySF+ISbuY7c1HdaiOHM8FTjL5TSyNOAkvt3vq4Q=;
  b=dxfdGv9jAaiUfI1x/Fs/P66Vk9mRTmxw0IfFgFqivdxu14PwcnLTgXGw
   NHKQDVlKFK590NaFCPiLgTaEC7JL0c1zDxseFblYtoL7Cvl52HS2h9vKt
   e7qyT2U84xH3qxJpQdYV6T4XpgjSSt32L+1Jls2qDIhqpMFAsdul8WR3E
   LKAeDJI/lLPfoQGcbqnXfYlO6llGNbhl2+bf0ydMfcgmp8JKF4FJ/AQ1i
   41x73UZwAqyLnO+iHz+9v2QaMQ/C53vrjO6+bVZc0YAtYvY4VCKHwf0aN
   n3P4haCD5KTPdwfVoUvs7zO/CuCEm9qBtfqepbiXZRg+U2aoj5OiZDrLz
   w==;
X-CSE-ConnectionGUID: nBn3M1YtQjeeDq7d6+M2UQ==
X-CSE-MsgGUID: 6LpfMrBSTrmkLOj11n/jbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76239381"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76239381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:48:01 -0700
X-CSE-ConnectionGUID: lzmGtJMISvW/ZpUgvn9O9g==
X-CSE-MsgGUID: MDZYHii2R+GIC/1OGEnzIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="222355510"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2026 01:47:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aC5-0000000017T-0gE5;
	Fri, 03 Apr 2026 08:47:57 +0000
Date: Fri, 03 Apr 2026 16:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:mirror-poly-aosp-pixel-malibu 4/4]
 drivers/mtd/nand/raw/cadence-nand-controller.c:2982 cadence_nand_remove()
 warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2975)
Message-ID: <202604031520.q5yF6AKB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu
head:   aa00e9e9abd8b1848b806e405774c2145acdf1f3
commit: 0ce5416863965ddd86e066484a306867cf1e01a8 [4/4] mtd: rawnand: cadence: use dma_map_resource for sdma address
:::::: branch date: 29 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20260331 (https://download.01.org/0day-ci/archive/20260403/202604031520.q5yF6AKB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604031520.q5yF6AKB-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/cadence-nand-controller.c:2982 cadence_nand_remove() warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2975)

vim +2982 drivers/mtd/nand/raw/cadence-nand-controller.c

ec4ba01e894d31 Piotr Sroka         2019-09-26  2970  
ec4ba01e894d31 Piotr Sroka         2019-09-26  2971  /* Driver exit point. */
ec4ba01e894d31 Piotr Sroka         2019-09-26  2972  static void cadence_nand_remove(struct cdns_nand_ctrl *cdns_ctrl)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2973  {
ec4ba01e894d31 Piotr Sroka         2019-09-26  2974  	cadence_nand_chips_cleanup(cdns_ctrl);
0ce5416863965d Niravkumar L Rabara 2025-02-10 @2975  	dma_unmap_resource(cdns_ctrl->dmac->device->dev, cdns_ctrl->io.iova_dma,
0ce5416863965d Niravkumar L Rabara 2025-02-10  2976  			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2977  	cadence_nand_irq_cleanup(cdns_ctrl->irq, cdns_ctrl);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2978  	kfree(cdns_ctrl->buf);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2979  	dma_free_coherent(cdns_ctrl->dev, sizeof(struct cadence_nand_cdma_desc),
ec4ba01e894d31 Piotr Sroka         2019-09-26  2980  			  cdns_ctrl->cdma_desc, cdns_ctrl->dma_cdma_desc);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2981  
ec4ba01e894d31 Piotr Sroka         2019-09-26 @2982  	if (cdns_ctrl->dmac)
ec4ba01e894d31 Piotr Sroka         2019-09-26  2983  		dma_release_channel(cdns_ctrl->dmac);
ec4ba01e894d31 Piotr Sroka         2019-09-26  2984  }
ec4ba01e894d31 Piotr Sroka         2019-09-26  2985  

:::::: The code at line 2982 was first introduced by commit
:::::: ec4ba01e894d3165e4d1ccbef782ef5593b708b4 mtd: rawnand: Add new Cadence NAND driver to MTD subsystem

:::::: TO: Piotr Sroka <piotrs@cadence.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
