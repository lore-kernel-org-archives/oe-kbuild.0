Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8468C47F2DE
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181882; cv=none; b=uDWdMed2Btk9MFgJ60N7uq7DdfCnU3XW+lHAXzXSNpva+n4xN2Z/L7DAXH5VkCaKUrmTTEK9QenWHwsTroWSKX3Z9qYu02Yf03Z0BrqL1dAMPs329Y67+jETq8ULLR1q74sLg3yNX6fnECd//aa6q/qkaYJuFNdLazhOwkoS1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181882; c=relaxed/simple;
	bh=e0nldu/bc3gB7FvjlxOVxZoCSNl9zS0c2ddowtwh9dA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O88DPuHGKaKF0SuPoV3eWb2g+ANF76tCYmb46yg2BO+u7Irh/VEA4CvnRgb6cGgr8Nw8FWVXr0q4wzzVfqQX8dLyTMwgbJQBuQC/yXYoOGkORzO/TyzyCkrslbp7WVE73+tY9pSBT4RcMmB8FSNXoHd91+t13IbUrmmNKheFNSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2ikpEZ7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2ikpEZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778181878; x=1809717878;
  h=date:from:to:cc:subject:message-id;
  bh=e0nldu/bc3gB7FvjlxOVxZoCSNl9zS0c2ddowtwh9dA=;
  b=Y2ikpEZ7P93L3bwH69ydJMLvyLPCp/inakPympwPZim+F7AMgln2oRXY
   zts9hSaGe/VOkrQ4pCOa7VmzA4VaqScyggeVQKsESUQbClcDfah6nj2yY
   6dgO+xOgH086shX4qIZbjyT5X3uWBO9t0cVItChLbHKN9XY9V7ugaNl2/
   P3JeqOImWn+haYAd3uBUOIJjZqv3lTZPb97rGGEx+u7riew80D/yf1oyn
   /hxEKwfbZzo2KGWHPSZbetJIkAjjOphtdRO4qYsOyEzoSpWNFeXFjsOfh
   LJFMPCuPOJxLTRxx1pWQBsndkLgLiNh1NX2sBW5VF05PtPO9A9IpqmomY
   g==;
X-CSE-ConnectionGUID: It0FdvF/TASU80pFL9C+1Q==
X-CSE-MsgGUID: X+xlD5G1QMaoxvwYb2zuyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89735392"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="89735392"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 12:24:38 -0700
X-CSE-ConnectionGUID: JNQqhDPRRMq/c44VfUfSGA==
X-CSE-MsgGUID: 34gs27LFSVGip1NCwcYyHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="241547171"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2026 12:24:37 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL4Ko-000000000Oj-0dgt;
	Thu, 07 May 2026 19:24:34 +0000
Date: Fri, 08 May 2026 03:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: samples/rpmsg/rpmsg_client_sample.c:66:4: warning: format
 specifies type 'long' but the argument has type 'ssize_t' (aka 'int')
Message-ID: <202605080314.3ReAbbdv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Tanmay-Shah/rpmsg-virtio_rpmsg_bus-allow-different-size-of-tx-and-rx-bufs/20260507-142615, commit: 3e451c450d540c8d733336d136eed8f559eb9038"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Tanmay Shah <tanmay.shah@amd.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tanmay-Shah/rpmsg-virtio_rpmsg_bus-allow-different-size-of-tx-and-rx-bufs/20260507-142615
head:   2496f9ad32bd2e27c5c7006f3c2c5e7f170db4d5
commit: 3e451c450d540c8d733336d136eed8f559eb9038 samples: rpmsg: add mtu size info
date:   10 hours ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260508/202605080314.3ReAbbdv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080314.3ReAbbdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605080314.3ReAbbdv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/rpmsg/rpmsg_client_sample.c:66:4: warning: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Wformat]
      65 |         dev_info(&rpdev->dev, "rpmsg mtu size = %ld\n",
         |                                                 ~~~
         |                                                 %zd
      66 |                  rpmsg_get_mtu(rpdev->ept));
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +66 samples/rpmsg/rpmsg_client_sample.c

779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  50  
92e1de51bf2cb8d Bjorn Andersson 2016-09-01  51  static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  52  {
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  53  	int ret;
a138c883193a66c Anna, Suman     2016-08-12  54  	struct instance_data *idata;
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  55  
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  56  	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  57  					rpdev->src, rpdev->dst);
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  58  
a138c883193a66c Anna, Suman     2016-08-12  59  	idata = devm_kzalloc(&rpdev->dev, sizeof(*idata), GFP_KERNEL);
a138c883193a66c Anna, Suman     2016-08-12  60  	if (!idata)
a138c883193a66c Anna, Suman     2016-08-12  61  		return -ENOMEM;
a138c883193a66c Anna, Suman     2016-08-12  62  
a138c883193a66c Anna, Suman     2016-08-12  63  	dev_set_drvdata(&rpdev->dev, idata);
a138c883193a66c Anna, Suman     2016-08-12  64  
3e451c450d540c8 Tanmay Shah     2026-04-29  65  	dev_info(&rpdev->dev, "rpmsg mtu size = %ld\n",
3e451c450d540c8 Tanmay Shah     2026-04-29 @66  		 rpmsg_get_mtu(rpdev->ept));
3e451c450d540c8 Tanmay Shah     2026-04-29  67  
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  68  	/* send a message to our remote processor */
2a48d7322dc88f1 Bjorn Andersson 2016-09-01  69  	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  70  	if (ret) {
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  71  		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  72  		return ret;
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  73  	}
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  74  
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  75  	return 0;
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  76  }
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  77  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
