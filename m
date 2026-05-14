Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4558D33507C
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747885; cv=none; b=dPdVx2cgCnq7tGXFz1pLG5FrfmRUc2k5lHhxalVEjcck8hkcL+TowX8i9Uim7UGVfdiq5Rmcg1+ATUHCXIdQ6UQreqyJouqmvCGH61ynphB8LCvjUrpIyeBh/ixlScKLYJWoYOv4R242RWbKxJ0P4Za/tFABu+Xhj78oLv2Q/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747885; c=relaxed/simple;
	bh=8iN6myPZoLiVAPt+FVSusd85qvALA/l6rMcO7XRd8Vo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WTT3K+ZVmS66Mdqfx47oVL/tigsoLIlLic2gPCFmbma9/E8BeCBaK5abCHM/snojFhqgbth374B+H7ah+1ficc+lBQpcnDJWpPbPEdlnonXh6sk3V1cREwJpKvKdDKx3VpEVdIW+JnRW59CGi2pjMW7rWKHGt1OuH/ezE5AHloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkrAdWdh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkrAdWdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778747884; x=1810283884;
  h=date:from:to:cc:subject:message-id;
  bh=8iN6myPZoLiVAPt+FVSusd85qvALA/l6rMcO7XRd8Vo=;
  b=NkrAdWdh/+kUfY+3tjBhS+yjGBahoXQRtT2eoB/f68mmYhF7vEDEcOH8
   cKsfKGd9DO4MRzg1tGYKROwhyfnKmlV6yG2Y4crJwdpdNQNXHzgJQ8aic
   2kGuhvgOGAjC5BEJB5WFEXClxdXJN8Azw2odLlIz8QW0A+PVi2STlPhXK
   rNT//EJmsNZ6Qo6akt+pOBsZWVFCF9b1zpLxO14a0lFDoPbP/6D15P72u
   XG5068xLmMZQ2J3I8UUW2m27VZurepVjHOFRQCrbmdGvqpq7cJB7Ye+6b
   NzzwnTTB248+2qNheyZfFJz8suah2tiBM3q0U9omkpsmmL7AY+Kzg8i9B
   Q==;
X-CSE-ConnectionGUID: y3RNsAI9RGWGvrtXI3WTLA==
X-CSE-MsgGUID: 9d84+pdeTDicBEUAhpO+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79400261"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79400261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 01:38:03 -0700
X-CSE-ConnectionGUID: ffTETIg4RAmpKhnx+2ShHA==
X-CSE-MsgGUID: AfYlozd9T7Cu5UR61+oDKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="276411323"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2026 01:38:02 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNRZv-000000006Dd-0N1P;
	Thu, 14 May 2026 08:37:59 +0000
Date: Thu, 14 May 2026 16:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/intel/idpf/idpf_idc.c:93
 idpf_plug_core_aux_dev() error: dereferencing freed memory 'adev' (line 75)
Message-ID: <202605141659.ITAp29HS-lkp@intel.com>
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
commit: f4312e6bfa2a98e94dacc75f96f916b76bdf4259 idpf: implement core RDMA auxiliary dev create, init, and destroy
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141659.ITAp29HS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f4312e6bfa2a ("idpf: implement core RDMA auxiliary dev create, init, and destroy")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141659.ITAp29HS-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_idc.c:93 idpf_plug_core_aux_dev() error: dereferencing freed memory 'adev' (line 75)

vim +/adev +93 drivers/net/ethernet/intel/idpf/idpf_idc.c

f4312e6bfa2a98 Joshua Hay 2025-07-08   47  
f4312e6bfa2a98 Joshua Hay 2025-07-08   48  /**
f4312e6bfa2a98 Joshua Hay 2025-07-08   49   * idpf_plug_core_aux_dev - allocate and register an Auxiliary device
f4312e6bfa2a98 Joshua Hay 2025-07-08   50   * @cdev_info: IDC core device info pointer
f4312e6bfa2a98 Joshua Hay 2025-07-08   51   *
f4312e6bfa2a98 Joshua Hay 2025-07-08   52   * Return: 0 on success or error code on failure.
f4312e6bfa2a98 Joshua Hay 2025-07-08   53   */
f4312e6bfa2a98 Joshua Hay 2025-07-08   54  static int idpf_plug_core_aux_dev(struct iidc_rdma_core_dev_info *cdev_info)
f4312e6bfa2a98 Joshua Hay 2025-07-08   55  {
f4312e6bfa2a98 Joshua Hay 2025-07-08   56  	struct iidc_rdma_core_auxiliary_dev *iadev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   57  	char name[IDPF_IDC_MAX_ADEV_NAME_LEN];
f4312e6bfa2a98 Joshua Hay 2025-07-08   58  	struct auxiliary_device *adev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   59  	int ret;
f4312e6bfa2a98 Joshua Hay 2025-07-08   60  
f4312e6bfa2a98 Joshua Hay 2025-07-08   61  	iadev = kzalloc(sizeof(*iadev), GFP_KERNEL);
f4312e6bfa2a98 Joshua Hay 2025-07-08   62  	if (!iadev)
f4312e6bfa2a98 Joshua Hay 2025-07-08   63  		return -ENOMEM;
f4312e6bfa2a98 Joshua Hay 2025-07-08   64  
f4312e6bfa2a98 Joshua Hay 2025-07-08   65  	adev = &iadev->adev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   66  	cdev_info->adev = adev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   67  	iadev->cdev_info = cdev_info;
f4312e6bfa2a98 Joshua Hay 2025-07-08   68  
f4312e6bfa2a98 Joshua Hay 2025-07-08   69  	ret = ida_alloc(&idpf_idc_ida, GFP_KERNEL);
f4312e6bfa2a98 Joshua Hay 2025-07-08   70  	if (ret < 0) {
f4312e6bfa2a98 Joshua Hay 2025-07-08   71  		pr_err("failed to allocate unique device ID for Auxiliary driver\n");
f4312e6bfa2a98 Joshua Hay 2025-07-08   72  		goto err_ida_alloc;
f4312e6bfa2a98 Joshua Hay 2025-07-08   73  	}
f4312e6bfa2a98 Joshua Hay 2025-07-08   74  	adev->id = ret;
f4312e6bfa2a98 Joshua Hay 2025-07-08  @75  	adev->dev.release = idpf_core_adev_release;
f4312e6bfa2a98 Joshua Hay 2025-07-08   76  	adev->dev.parent = &cdev_info->pdev->dev;
f4312e6bfa2a98 Joshua Hay 2025-07-08   77  	sprintf(name, "%04x.rdma.core", cdev_info->pdev->vendor);
f4312e6bfa2a98 Joshua Hay 2025-07-08   78  	adev->name = name;
f4312e6bfa2a98 Joshua Hay 2025-07-08   79  
f4312e6bfa2a98 Joshua Hay 2025-07-08   80  	ret = auxiliary_device_init(adev);
f4312e6bfa2a98 Joshua Hay 2025-07-08   81  	if (ret)
f4312e6bfa2a98 Joshua Hay 2025-07-08   82  		goto err_aux_dev_init;
f4312e6bfa2a98 Joshua Hay 2025-07-08   83  
f4312e6bfa2a98 Joshua Hay 2025-07-08   84  	ret = auxiliary_device_add(adev);
f4312e6bfa2a98 Joshua Hay 2025-07-08   85  	if (ret)
f4312e6bfa2a98 Joshua Hay 2025-07-08   86  		goto err_aux_dev_add;
f4312e6bfa2a98 Joshua Hay 2025-07-08   87  
f4312e6bfa2a98 Joshua Hay 2025-07-08   88  	return 0;
f4312e6bfa2a98 Joshua Hay 2025-07-08   89  
f4312e6bfa2a98 Joshua Hay 2025-07-08   90  err_aux_dev_add:
f4312e6bfa2a98 Joshua Hay 2025-07-08   91  	auxiliary_device_uninit(adev);
f4312e6bfa2a98 Joshua Hay 2025-07-08   92  err_aux_dev_init:
f4312e6bfa2a98 Joshua Hay 2025-07-08  @93  	ida_free(&idpf_idc_ida, adev->id);
f4312e6bfa2a98 Joshua Hay 2025-07-08   94  err_ida_alloc:
f4312e6bfa2a98 Joshua Hay 2025-07-08   95  	cdev_info->adev = NULL;
f4312e6bfa2a98 Joshua Hay 2025-07-08   96  	kfree(iadev);
f4312e6bfa2a98 Joshua Hay 2025-07-08   97  
f4312e6bfa2a98 Joshua Hay 2025-07-08   98  	return ret;
f4312e6bfa2a98 Joshua Hay 2025-07-08   99  }
f4312e6bfa2a98 Joshua Hay 2025-07-08  100  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
