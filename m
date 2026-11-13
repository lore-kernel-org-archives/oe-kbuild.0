Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571739;
	b=irK8XYIIsfZfg1uaBcmwsLplC0T02haqQRAXjTUjj3dZrEIyX+SO7jfiMGWYiywShSGQ
	 lW77QqhjzRWwcIOjEZkBBz8dEgDRnHiARnSg5z24GQD14mp1JQLlrD/991aKNwGg3IEGx
	 MEPgZ4vC2+e2++fP+CoieeFXOjX9iRplzs4LgrhxA3VSacA3HTJw1RTHqc9Co+x1HXgaB
	 u+S9897yR2y0XqUottM87p1EGnpFCsAlZO3NGKV5VhLTLF9/iEcZHtZPzf0/mU0AKROeN
	 KPub+piXM+UXE3mEj2VHJ6jOSWXzUKtb16K3obv1uh8iR+6J2lBiTFGivot1CKG4FUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571739;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=h2sFPAYVFvqqVQ9H9v25TASuzFTXnbmgvFSZ30DyThc=;
	b=VZZnUlmKfTagdE/Ui4ps34bKfYw/Cb45APDsHtHO5J3eRiVa1zUSqwcYb/SQkAO1cBua
	 R290fVz5cNeHDyE9wojMkUeisvgStLHjU98gWykeUdPuA3TvdkEFTFF+hXJj/cl3E9faj
	 EiLpMugfSLcCFNpqbknq6yvImHNBLE9P3MbVMY55mUa6OCsnfzaTWkjniYiChv50UPry/
	 d/Txg1hb+GtMOf45SLIspDJE/PkflRqRSBW3T0rsHeQcBo6OHOxhMBoEdoyrP6KY+lvP2
	 g2CYJeIII0N9DK3oKox95Va9D0H2M0duC/p9weLxgp2LNWi+xVrxidcCWltiHz9s9LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lf+9DCKg;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D969606B5B1
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 12:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D969606B5B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lf+9DCKg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794571739; x=1826107739;
  h=date:from:to:cc:subject:message-id;
  bh=cXwwIkNTVIo0RBlopDn2xDo+H8vK07yFiD5Mb0ob2Mk=;
  b=Lf+9DCKguBCy2tSeTi42scr0VcpIsBFW8loYytkP5IidJV1AbJ2pp6cZ
   Ab+eMf2q9bDoWvbqspkutRm4V4K632l0BQGn3kMHjXi9ATDN0w2phMGjD
   YCtHzRT9qenSBb4vVoVVRdWUNIO+XvIW73Kbq6QkDDTgGf476B3pXplP3
   Z5tNXT14O5jrrz4yJR0zGSpTCbNUAx1xBqsXwfLQLiAtmlIKLf2yrJKKz
   HgUQNmDgmIq8WY2y1Y1cJUqxPkAT9tiD1+jRMH3cfabhtg4ojxOicEy+t
   nhZcyK24ViIA08311zmQbFi71nNCDNR6le7K6WRILpmGvuhor01ppNaG9
   w==;
X-CSE-ConnectionGUID: Hps1PjTZRW6H8DylVId5Pg==
X-CSE-MsgGUID: 1BICGkIISPO0xwYS2oom7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3373207"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3373207"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 04:08:58 -0800
X-CSE-ConnectionGUID: cG91PNalQfO3QpFyN9COAA==
X-CSE-MsgGUID: maSSKoRJRNiVnkKjqWGQEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="10803838"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 13 Nov 2026 04:08:57 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRq5N-000000001GN-3asz;
	Fri, 13 Nov 2026 12:08:53 +0000
Date: Fri, 13 Nov 2026 13:08:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bvanassche:thread-safety 432/438]
 drivers/fpga/fpga-region.c:65 fpga_region_get() warn: variable dereferenced
 before IS_ERR check 'region' (see line 57)
Message-ID: <202611131301.NSbZ3bLn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   8ea0e62cf4d68a895e3152c92a5f6ead6d5c9554
commit: 67c65b05abaf7a89e1e4f8ed3033513d6053a749 [432/438] treewide: Replace __context_unsafe() with precise lock annotations
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131301.NSbZ3bLn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611131301.NSbZ3bLn-lkp@intel.com/

smatch warnings:
drivers/fpga/fpga-region.c:65 fpga_region_get() warn: variable dereferenced before IS_ERR check 'region' (see line 57)

vim +/region +65 drivers/fpga/fpga-region.c

503d4b7a446b38 Alan Tull       2017-11-15  34  
0fa20cdfcc1f68 Alan Tull       2016-11-01  35  /**
011c49e3703854 Tom Rix         2021-06-08  36   * fpga_region_get - get an exclusive reference to an fpga region
0fa20cdfcc1f68 Alan Tull       2016-11-01  37   * @region: FPGA Region struct
0fa20cdfcc1f68 Alan Tull       2016-11-01  38   *
0fa20cdfcc1f68 Alan Tull       2016-11-01  39   * Caller should call fpga_region_put() when done with region.
0fa20cdfcc1f68 Alan Tull       2016-11-01  40   *
baa57b333e0116 Marco Pagani    2023-07-06  41   * Return:
baa57b333e0116 Marco Pagani    2023-07-06  42   * * fpga_region struct if successful.
baa57b333e0116 Marco Pagani    2023-07-06  43   * * -EBUSY if someone already has a reference to the region.
baa57b333e0116 Marco Pagani    2023-07-06  44   * * -ENODEV if can't take parent driver module refcount.
0fa20cdfcc1f68 Alan Tull       2016-11-01  45   */
0fa20cdfcc1f68 Alan Tull       2016-11-01  46  static struct fpga_region *fpga_region_get(struct fpga_region *region)
67c65b05abaf7a Bart Van Assche 2026-11-03  47  	__cond_acquires_err_ptr(&region->mutex)
0fa20cdfcc1f68 Alan Tull       2016-11-01  48  {
0fa20cdfcc1f68 Alan Tull       2016-11-01  49  	struct device *dev = &region->dev;
0fa20cdfcc1f68 Alan Tull       2016-11-01  50  
0fa20cdfcc1f68 Alan Tull       2016-11-01  51  	if (!mutex_trylock(&region->mutex)) {
0fa20cdfcc1f68 Alan Tull       2016-11-01  52  		dev_dbg(dev, "%s: FPGA Region already in use\n", __func__);
0fa20cdfcc1f68 Alan Tull       2016-11-01  53  		return ERR_PTR(-EBUSY);
0fa20cdfcc1f68 Alan Tull       2016-11-01  54  	}
0fa20cdfcc1f68 Alan Tull       2016-11-01  55  
0fa20cdfcc1f68 Alan Tull       2016-11-01  56  	get_device(dev);
b7c0e1ecee403a Marco Pagani    2024-04-19 @57  	if (!try_module_get(region->ops_owner)) {
0fa20cdfcc1f68 Alan Tull       2016-11-01  58  		put_device(dev);
0fa20cdfcc1f68 Alan Tull       2016-11-01  59  		mutex_unlock(&region->mutex);
0fa20cdfcc1f68 Alan Tull       2016-11-01  60  		return ERR_PTR(-ENODEV);
0fa20cdfcc1f68 Alan Tull       2016-11-01  61  	}
0fa20cdfcc1f68 Alan Tull       2016-11-01  62  
c3d971ad32fc19 Alan Tull       2017-11-15  63  	dev_dbg(dev, "get\n");
0fa20cdfcc1f68 Alan Tull       2016-11-01  64  
67c65b05abaf7a Bart Van Assche 2026-11-03 @65  	if (IS_ERR(region))
67c65b05abaf7a Bart Van Assche 2026-11-03  66  		unreachable();
67c65b05abaf7a Bart Van Assche 2026-11-03  67  
0fa20cdfcc1f68 Alan Tull       2016-11-01  68  	return region;
0fa20cdfcc1f68 Alan Tull       2016-11-01  69  }
0fa20cdfcc1f68 Alan Tull       2016-11-01  70  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
