Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE05E77113
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Sep 2024 02:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725505053; cv=none; b=k+y+2Ok+tm0nsqmhsvRXIZ6aRgzwBzmf22ZlPVrH4ulJXmue8bjHMSUd0KMLNg4uP+JCfntzzMjf/ajTv1ANcSzuHc3JC/2S9UX7wlMoKaVhVRQMwrnpUcQja+DqLvBFtXutVCX/S/w7Id8xV1LfgZSZDtPElVYJ+t1TVFT5zek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725505053; c=relaxed/simple;
	bh=/XKQz9E4IpSuVaKi2vqWteWCp03Bja2TwmtCsXxy5S0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cSL0uxysQDmBkIJFo6ByNOy9PNQ1wdeYzFJtGOKbvt3HfVEXUbP4f57xgD9QZCxtL2H8RvwUzi5Hr2QbvFIHvofVSA/6CuHtlABWuIavosOznQ9mQvxzLTH8mYjj2HplI3hXV3+mGutbGbYLVitExJoss+wBqnEaF7+0+3pDp1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRVzde/H; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRVzde/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725505051; x=1757041051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/XKQz9E4IpSuVaKi2vqWteWCp03Bja2TwmtCsXxy5S0=;
  b=SRVzde/H5LV5gcbPgtUnDl1e3xZ+8jc5p7tGUmnXGPZlCGV59+Uv/uk7
   gUVbp5vBsQXBUJhpdj4dW5aM3KozZu43dglPENPz2EIHiIVHyTOgb2zzG
   jgBfInf55BfTV7zQEKlGA2Sielj7pOHltpMQACcGQ7enrJambWw+plRGD
   DDEefVKdE/zAb0u9of5/W0Qnkol1RGstpf4PMgNvgMZlfHpCvuFCONjqv
   Ih6O1kiMusu55fpNPS/uxmA9ghcgKx79DZfXuysy+hy6zX17kdoHbjT2m
   LNdYV2boycwAA8kMWbqrsH5bzhkMoe25ENX2zHvGhSIr3rFy0UZT3QJa9
   A==;
X-CSE-ConnectionGUID: U7Uk2O9bR/uo8QXvY+WEvw==
X-CSE-MsgGUID: fsPoZc3NTdW/kweVqebg0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="28085698"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="28085698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 19:57:30 -0700
X-CSE-ConnectionGUID: QznKcERBS6qpkIgPY9RkQA==
X-CSE-MsgGUID: +HA0kxfPSbeXPTGXx9fsQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="70383930"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2024 19:57:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm2gY-0008qd-27;
	Thu, 05 Sep 2024 02:57:26 +0000
Date: Thu, 5 Sep 2024 10:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/3] cxl: Move mailbox related bits to the same context
Message-ID: <202409051031.WY4y1MhJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240904000020.1686611-2-dave.jiang@intel.com>
References: <20240904000020.1686611-2-dave.jiang@intel.com>
TO: Dave Jiang <dave.jiang@intel.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.11-rc6 next-20240904]
[cannot apply to cxl/next cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/cxl-Move-mailbox-related-bits-to-the-same-context/20240904-080307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240904000020.1686611-2-dave.jiang%40intel.com
patch subject: [PATCH v3 1/3] cxl: Move mailbox related bits to the same context
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20240904 (https://download.01.org/0day-ci/archive/20240905/202409051031.WY4y1MhJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409051031.WY4y1MhJ-lkp@intel.com/

smatch warnings:
drivers/cxl/core/mbox.c:1429 cxl_mailbox_init() error: we previously assumed 'cxl_mbox' could be null (see line 1426)

vim +/cxl_mbox +1429 drivers/cxl/core/mbox.c

d0abf5787adc03 Alison Schofield 2023-04-18  1423  
1390c0beea9575 Dave Jiang       2024-09-03  1424  int cxl_mailbox_init(struct cxl_mailbox *cxl_mbox, struct device *host)
1390c0beea9575 Dave Jiang       2024-09-03  1425  {
1390c0beea9575 Dave Jiang       2024-09-03 @1426  	if (!cxl_mbox && !host)
1390c0beea9575 Dave Jiang       2024-09-03  1427  		return -EINVAL;
1390c0beea9575 Dave Jiang       2024-09-03  1428  
1390c0beea9575 Dave Jiang       2024-09-03 @1429  	cxl_mbox->host = host;
1390c0beea9575 Dave Jiang       2024-09-03  1430  	mutex_init(&cxl_mbox->mbox_mutex);
1390c0beea9575 Dave Jiang       2024-09-03  1431  	rcuwait_init(&cxl_mbox->mbox_wait);
1390c0beea9575 Dave Jiang       2024-09-03  1432  
1390c0beea9575 Dave Jiang       2024-09-03  1433  	return 0;
1390c0beea9575 Dave Jiang       2024-09-03  1434  }
1390c0beea9575 Dave Jiang       2024-09-03  1435  EXPORT_SYMBOL_NS_GPL(cxl_mailbox_init, CXL);
1390c0beea9575 Dave Jiang       2024-09-03  1436  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
