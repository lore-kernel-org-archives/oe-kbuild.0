Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B0337883D
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787504781; cv=none; b=M7vLp5zIU+mrNPfgAdmyeLgiJPqC89teDmPEYzaFp1UApe/Iej5rF1LJr9i83FsU5NW1XVIO6XBvLHZ4fu0j2l1vbn/oOmdYpscsDF9ItZFkF0Rvf6/8U6vhx7p1KEDQr2Ebsl6LiOpS/hyAsiMlj36e2cLXCJychAQookw90fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787504781; c=relaxed/simple;
	bh=ewM9wNckJJBhKvTeyqBzq9KQ/eUnMossN2NopETUapk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g9zlmt3Co3Ny4OaJFCoJF3vOAWWHXPMYIWa50WMh+boTpYbFfNUCQTKSQpfx9f4849hKlzcUcwjd+KH1vRu7SYuIVBX0GaSp+XHJjekSRpvyd0lIXDU3GMJjgLFkLYpPEYhUBAX1ZsRflIciNFANvABUdsOmLhyOTnTKNrCIE2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iI8k6vc1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iI8k6vc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787504777; x=1819040777;
  h=date:from:to:cc:subject:message-id;
  bh=ewM9wNckJJBhKvTeyqBzq9KQ/eUnMossN2NopETUapk=;
  b=iI8k6vc1iexZnp4Lg7ck9/GDZAegZhdvZZmSzopbgHDXmGDfyTxYgzWR
   6cQ+AdU+e4geJhkzmKKIUB2zfmL3NZakzhpnCrIiqyxUBud34SciKkq/x
   jdZ+LXFKD/UHhJD6+zrHanYEJouhEvPL2Obndg73RywTEMkMEQEwJ0Q6m
   +1w211BXm8v4+J9YsosZ6pNyBhG+RRonA6QOYf+jzNchvR8a3sRSqoVQ2
   Y50nAiUVAK356e7rXeEg9zWToCPBvofvGmQwep8m6udo/zsbhBFf7JF9O
   kdUHVYQDwLmvl5M8SNucqr2+mWCW0/KDBi7xfCVF74bj66LwF0URwKbq9
   Q==;
X-CSE-ConnectionGUID: 0jBSjmyAQaW0jzbm+OmFyA==
X-CSE-MsgGUID: gNohiE2lRBGlraO57+rSMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87983293"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="87983293"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 10:06:12 -0700
X-CSE-ConnectionGUID: hpN41HQNREujMNIpq1y3qg==
X-CSE-MsgGUID: wbG3Br+BTwi9XfO33dbDHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="267373664"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Aug 2026 10:06:11 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyBe4-000000000hz-33FG;
	Sun, 23 Aug 2026 17:06:08 +0000
Date: Mon, 24 Aug 2026 01:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1 13/13]
 drivers/virt/gunyah/rsc_mgr.c:626:26: sparse: sparse: unsigned value that
 used to be signed checked against zero?
Message-ID: <202608240021.zKpzZj1L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/virt/gunyah/rsc_mgr.c:626:26: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Elliot,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   057f1cf6ccb302346c3799917ec8893efcd87011
commit: f251362242ba3ef3a248b8dd3c7c8a00419607a0 [13/13] BACKPORT: FROMLIST: gunyah: vm_mgr: Introduce basic VM Manager
:::::: branch date: 2 days ago
:::::: commit date: 3 years, 5 months ago
config: arm64-randconfig-r133-20260823 (https://download.01.org/0day-ci/archive/20260824/202608240021.zKpzZj1L-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240021.zKpzZj1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608240021.zKpzZj1L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virt/gunyah/rsc_mgr.c:248:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long val @@     got restricted __le32 [usertype] msg_id @@
   drivers/virt/gunyah/rsc_mgr.c:248:57: sparse:     expected unsigned long val
   drivers/virt/gunyah/rsc_mgr.c:248:57: sparse:     got restricted __le32 [usertype] msg_id
>> drivers/virt/gunyah/rsc_mgr.c:626:26: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/virt/gunyah/rsc_mgr.c:625:38: sparse: signed value source

vim +626 drivers/virt/gunyah/rsc_mgr.c

f251362242ba3e Elliot Berman 2022-10-14  615  
d5e8df2cc4a170 Elliot Berman 2022-08-10  616  static int gh_msgq_platform_probe_direction(struct platform_device *pdev, bool tx,
d5e8df2cc4a170 Elliot Berman 2022-08-10  617  					    struct gh_resource *ghrsc)
d5e8df2cc4a170 Elliot Berman 2022-08-10  618  {
d5e8df2cc4a170 Elliot Berman 2022-08-10  619  	struct device_node *node = pdev->dev.of_node;
d5e8df2cc4a170 Elliot Berman 2022-08-10  620  	int ret;
d5e8df2cc4a170 Elliot Berman 2022-08-10  621  	int idx = tx ? 0 : 1;
d5e8df2cc4a170 Elliot Berman 2022-08-10  622  
d5e8df2cc4a170 Elliot Berman 2022-08-10  623  	ghrsc->type = tx ? GH_RESOURCE_TYPE_MSGQ_TX : GH_RESOURCE_TYPE_MSGQ_RX;
d5e8df2cc4a170 Elliot Berman 2022-08-10  624  
d5e8df2cc4a170 Elliot Berman 2022-08-10  625  	ghrsc->irq = platform_get_irq(pdev, idx);
d5e8df2cc4a170 Elliot Berman 2022-08-10 @626  	if (ghrsc->irq < 0) {
d5e8df2cc4a170 Elliot Berman 2022-08-10  627  		dev_err(&pdev->dev, "Failed to get irq%d: %d\n", idx, ghrsc->irq);
d5e8df2cc4a170 Elliot Berman 2022-08-10  628  		return ghrsc->irq;
d5e8df2cc4a170 Elliot Berman 2022-08-10  629  	}
d5e8df2cc4a170 Elliot Berman 2022-08-10  630  
d5e8df2cc4a170 Elliot Berman 2022-08-10  631  	ret = of_property_read_u64_index(node, "reg", idx, &ghrsc->capid);
d5e8df2cc4a170 Elliot Berman 2022-08-10  632  	if (ret) {
d5e8df2cc4a170 Elliot Berman 2022-08-10  633  		dev_err(&pdev->dev, "Failed to get capid%d: %d\n", idx, ret);
d5e8df2cc4a170 Elliot Berman 2022-08-10  634  		return ret;
d5e8df2cc4a170 Elliot Berman 2022-08-10  635  	}
d5e8df2cc4a170 Elliot Berman 2022-08-10  636  
d5e8df2cc4a170 Elliot Berman 2022-08-10  637  	return 0;
d5e8df2cc4a170 Elliot Berman 2022-08-10  638  }
d5e8df2cc4a170 Elliot Berman 2022-08-10  639  

:::::: The code at line 626 was first introduced by commit
:::::: d5e8df2cc4a17063dcebc67a939356ad49a665bd FROMLIST: gunyah: rsc_mgr: Add resource manager RPC core

:::::: TO: Elliot Berman <quic_eberman@quicinc.com>
:::::: CC: Aleksei Vetrov <vvvvvv@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
