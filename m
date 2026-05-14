Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF313128DF
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763771; cv=none; b=p1En6ZaCTIS9vP1m5N+vjGpQ4U3klL0bkOJOiWMKGOKrd3sAsKKfSd9XYxJQcQfLH1bjoZrNpMohvc945MN5f3ybZQpT8e3QXWyNvGFrOnfvFVm0Q++lZ2V7yVfSDE6pPyJDmuHMj2sfKgMQqSOOqRmyCroE/z8QXoZTrhjRaeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763771; c=relaxed/simple;
	bh=ZoDsyzSolKD5XXg2S+X1GV2kK0ZNABtjQq3qXcWI48c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ETLqplDm4P4iYhPzWMgjIS42GJRh9kpQhhjuxegaQO/AnmbjICIu7+2Bps6dY95tUsQyXbtudqs8vjXZvbA1BvnmkvHJXvKXWvz2oR5dqVztgQI4ovkkdYMlFfy5GXGbej1ByLbbWj0A/WTd/hQ3qKsX5woVXDoviTQjwlbdvjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5AofIJA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5AofIJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778763769; x=1810299769;
  h=date:from:to:cc:subject:message-id;
  bh=ZoDsyzSolKD5XXg2S+X1GV2kK0ZNABtjQq3qXcWI48c=;
  b=X5AofIJAmPhvIk7niLuF6XHaqelE7P8aMKuK0xAXvSjSGYlWuEHdTlP0
   SmLFne4r7VHiH3HquMY23JxVTV0XsN9ehYXJd/CbbaZCg7+TiEEK303t5
   8RsidBgwOjWQ/1rVc3uIrbtCWRXpRw8ZeOi9vROfG3tV5z2DA3KsZFubL
   w25Uzvpi+qudhL9HhXxH5awEnv4xmTShZhm39mV7ie9XJzRRaW4CuEChz
   YuGKRA7KW7oK9RKnMxJ5eDhzCR2FVpGKEYs3UWoK74qA9GEbcxfA82plv
   Q3M4E7DhExjFqU7vU+SaOh994EXnxZ/vMG8LMK3OLvfzIOFGESrLqaIC7
   w==;
X-CSE-ConnectionGUID: PfcsbX1sSICsxU2JKGlMeA==
X-CSE-MsgGUID: 1/WiwiYlSCyI2ri9gtmQXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79563901"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79563901"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 06:02:47 -0700
X-CSE-ConnectionGUID: pXFCqoYiTV6fQCe2MJVhvw==
X-CSE-MsgGUID: 2wOWCtUgT/OTd3qvh/+b3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237396679"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2026 06:02:46 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNVi7-000000006ZX-0Q9s;
	Thu, 14 May 2026 13:02:43 +0000
Date: Thu, 14 May 2026 21:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/idpf/idpf_idc.c:95
 idpf_plug_vport_aux_dev() error: dereferencing freed memory 'adev' (line 77)
Message-ID: <202605142014.gNPFJ2JV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Joshua Hay <joshua.a.hay@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Madhu Chittim <madhu.chittim@intel.com>
CC: Tatyana Nikolova <tatyana.e.nikolova@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: be91128c579c86d295da4325f6ac4710e4e6d2b4 idpf: implement RDMA vport auxiliary dev create, init, and destroy
date:   10 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142014.gNPFJ2JV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: be91128c579c ("idpf: implement RDMA vport auxiliary dev create, init, and destroy")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605142014.gNPFJ2JV-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_idc.c:95 idpf_plug_vport_aux_dev() error: dereferencing freed memory 'adev' (line 77)

Old smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_idc.c:202 idpf_plug_core_aux_dev() error: dereferencing freed memory 'adev' (line 184)

vim +/adev +95 drivers/net/ethernet/intel/idpf/idpf_idc.c

be91128c579c86d Joshua Hay 2025-07-08   47  
be91128c579c86d Joshua Hay 2025-07-08   48  /**
be91128c579c86d Joshua Hay 2025-07-08   49   * idpf_plug_vport_aux_dev - allocate and register a vport Auxiliary device
be91128c579c86d Joshua Hay 2025-07-08   50   * @cdev_info: IDC core device info pointer
be91128c579c86d Joshua Hay 2025-07-08   51   * @vdev_info: IDC vport device info pointer
be91128c579c86d Joshua Hay 2025-07-08   52   *
be91128c579c86d Joshua Hay 2025-07-08   53   * Return: 0 on success or error code on failure.
be91128c579c86d Joshua Hay 2025-07-08   54   */
be91128c579c86d Joshua Hay 2025-07-08   55  static int idpf_plug_vport_aux_dev(struct iidc_rdma_core_dev_info *cdev_info,
be91128c579c86d Joshua Hay 2025-07-08   56  				   struct iidc_rdma_vport_dev_info *vdev_info)
be91128c579c86d Joshua Hay 2025-07-08   57  {
be91128c579c86d Joshua Hay 2025-07-08   58  	struct iidc_rdma_vport_auxiliary_dev *iadev;
be91128c579c86d Joshua Hay 2025-07-08   59  	char name[IDPF_IDC_MAX_ADEV_NAME_LEN];
be91128c579c86d Joshua Hay 2025-07-08   60  	struct auxiliary_device *adev;
be91128c579c86d Joshua Hay 2025-07-08   61  	int ret;
be91128c579c86d Joshua Hay 2025-07-08   62  
be91128c579c86d Joshua Hay 2025-07-08   63  	iadev = kzalloc(sizeof(*iadev), GFP_KERNEL);
be91128c579c86d Joshua Hay 2025-07-08   64  	if (!iadev)
be91128c579c86d Joshua Hay 2025-07-08   65  		return -ENOMEM;
be91128c579c86d Joshua Hay 2025-07-08   66  
be91128c579c86d Joshua Hay 2025-07-08   67  	adev = &iadev->adev;
be91128c579c86d Joshua Hay 2025-07-08   68  	vdev_info->adev = &iadev->adev;
be91128c579c86d Joshua Hay 2025-07-08   69  	iadev->vdev_info = vdev_info;
be91128c579c86d Joshua Hay 2025-07-08   70  
be91128c579c86d Joshua Hay 2025-07-08   71  	ret = ida_alloc(&idpf_idc_ida, GFP_KERNEL);
be91128c579c86d Joshua Hay 2025-07-08   72  	if (ret < 0) {
be91128c579c86d Joshua Hay 2025-07-08   73  		pr_err("failed to allocate unique device ID for Auxiliary driver\n");
be91128c579c86d Joshua Hay 2025-07-08   74  		goto err_ida_alloc;
be91128c579c86d Joshua Hay 2025-07-08   75  	}
be91128c579c86d Joshua Hay 2025-07-08   76  	adev->id = ret;
be91128c579c86d Joshua Hay 2025-07-08  @77  	adev->dev.release = idpf_vport_adev_release;
be91128c579c86d Joshua Hay 2025-07-08   78  	adev->dev.parent = &cdev_info->pdev->dev;
be91128c579c86d Joshua Hay 2025-07-08   79  	sprintf(name, "%04x.rdma.vdev", cdev_info->pdev->vendor);
be91128c579c86d Joshua Hay 2025-07-08   80  	adev->name = name;
be91128c579c86d Joshua Hay 2025-07-08   81  
be91128c579c86d Joshua Hay 2025-07-08   82  	ret = auxiliary_device_init(adev);
be91128c579c86d Joshua Hay 2025-07-08   83  	if (ret)
be91128c579c86d Joshua Hay 2025-07-08   84  		goto err_aux_dev_init;
be91128c579c86d Joshua Hay 2025-07-08   85  
be91128c579c86d Joshua Hay 2025-07-08   86  	ret = auxiliary_device_add(adev);
be91128c579c86d Joshua Hay 2025-07-08   87  	if (ret)
be91128c579c86d Joshua Hay 2025-07-08   88  		goto err_aux_dev_add;
be91128c579c86d Joshua Hay 2025-07-08   89  
be91128c579c86d Joshua Hay 2025-07-08   90  	return 0;
be91128c579c86d Joshua Hay 2025-07-08   91  
be91128c579c86d Joshua Hay 2025-07-08   92  err_aux_dev_add:
be91128c579c86d Joshua Hay 2025-07-08   93  	auxiliary_device_uninit(adev);
be91128c579c86d Joshua Hay 2025-07-08   94  err_aux_dev_init:
be91128c579c86d Joshua Hay 2025-07-08  @95  	ida_free(&idpf_idc_ida, adev->id);
be91128c579c86d Joshua Hay 2025-07-08   96  err_ida_alloc:
be91128c579c86d Joshua Hay 2025-07-08   97  	vdev_info->adev = NULL;
be91128c579c86d Joshua Hay 2025-07-08   98  	kfree(iadev);
be91128c579c86d Joshua Hay 2025-07-08   99  
be91128c579c86d Joshua Hay 2025-07-08  100  	return ret;
be91128c579c86d Joshua Hay 2025-07-08  101  }
be91128c579c86d Joshua Hay 2025-07-08  102  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
