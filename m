Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF3D494826
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467423; cv=none; b=Qm9EFU9rFIOTslEBB3M29dCOanW83G5woIGcOgPtM5YjKzxjjaPztw+8ve9IQ9ZXj+op7yJ2zx6+1IAEFKDrea2AIJ5296YRvWNET/k/gXSfxmDKMvs7cbCf7As0b25tZd4UDIntY47B5cYF0ekdoUI7d7L9yjwkMFXmGK0y6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467423; c=relaxed/simple;
	bh=c2deSyO4oV4J6uJxvfzDRDXGjitv0Cea2P0ctGWJclU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZcT84RhagnOwaiUqFmmKXu2+I7affyVPOORCz9bg+7h0ML/UGKOoVKQv/eRnWI4SlDb9BpS0/3GNZxkQVbOyqt3IfZlVzKVmgw5EbBYlrsmlxnueZRCNP7xRFkkSEF01n/jpv+a5Q2iRjvHJo/XGnb07kR21xF8JnKp4wlFhJw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/aV8CwC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/aV8CwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791467422; x=1823003422;
  h=date:from:to:cc:subject:message-id;
  bh=c2deSyO4oV4J6uJxvfzDRDXGjitv0Cea2P0ctGWJclU=;
  b=O/aV8CwCFEFSKuf22DV9waRzWIgHkc+J/1mVL5hMoPVNApaLO77l2iXl
   aXRkQKBl70Mg1rVofJhv2GZvkjaOAHqRAW6YLePBWXw9Dl1dCgd+voo6l
   +JBITVg4uEAKQDNCHe0sVWsgY2KHsBh2f7MJUSdmjnRHKO5VZjiPgs8Hu
   wFn4eC5USg67KMAI26ZWFee/ONFRq/f4S12kJsKPIKw6S5WQffmfxmHDS
   //lb1UNUavAWWgsGzxW81+TNM78rGEiBLmeinZ3gb/9tg8rPAMwjaxXlo
   /AiKCtsMz4L0qHSkeLNUnMXhwdHbeu2+zKSs2xUN06H9jCGY3FrtENYO1
   Q==;
X-CSE-ConnectionGUID: OnI/zVV/QGWGC5MosVspoQ==
X-CSE-MsgGUID: VlLwVXfbT0qNnatsDQptJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="150232"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="150232"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 06:50:22 -0700
X-CSE-ConnectionGUID: KI3pq+ITTjmF0gscH2/n7A==
X-CSE-MsgGUID: kpjaKe2VTw64yAtsio38vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="491403"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Oct 2026 06:50:20 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEoVl-000000005Wn-3J0b;
	Thu, 08 Oct 2026 13:50:17 +0000
Date: Thu, 08 Oct 2026 15:49:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 11569/15343]
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1931:32-50: opportunity for
 str_on_off(mes -> dbgext_active)
Message-ID: <202610081540.BPLUol7s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yongqiang Sun <Yongqiang.Sun@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Shaoyun Liu <Shaoyun.Liu@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: a367f2657fd6bce9ad5eb23a04619ac449cc3685 [11569/15343] drm/amdgpu: add mes_dbgext core support
:::::: branch date: 4 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-2100-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081540.BPLUol7s-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610081540.BPLUol7s-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1931:32-50: opportunity for str_on_off(mes -> dbgext_active)

vim +1931 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c

b2662d4cc4ce2d shaoyunl      2023-11-23  1914  
a367f2657fd6bc Yongqiang Sun 2026-09-18  1915  /*
a367f2657fd6bc Yongqiang Sun 2026-09-18  1916   * Runtime on/off switch for the MES firmware debug extension.
a367f2657fd6bc Yongqiang Sun 2026-09-18  1917   *
a367f2657fd6bc Yongqiang Sun 2026-09-18  1918   *   cat  <debugfs>/amdgpu_mes_dbgext   -> current state / size / mode
a367f2657fd6bc Yongqiang Sun 2026-09-18  1919   *   echo 1 > <debugfs>/amdgpu_mes_dbgext   -> enable
a367f2657fd6bc Yongqiang Sun 2026-09-18  1920   *   echo 0 > <debugfs>/amdgpu_mes_dbgext   -> disable
a367f2657fd6bc Yongqiang Sun 2026-09-18  1921   *
a367f2657fd6bc Yongqiang Sun 2026-09-18  1922   * When enabled with no boot-time size (mes_dbgext_buffer_size=0) a default
a367f2657fd6bc Yongqiang Sun 2026-09-18  1923   * buffer size is used; the collection method still follows mes_dbgext_options.
a367f2657fd6bc Yongqiang Sun 2026-09-18  1924   */
a367f2657fd6bc Yongqiang Sun 2026-09-18  1925  static int amdgpu_debugfs_mes_dbgext_show(struct seq_file *m, void *unused)
a367f2657fd6bc Yongqiang Sun 2026-09-18  1926  {
a367f2657fd6bc Yongqiang Sun 2026-09-18  1927  	struct amdgpu_device *adev = m->private;
a367f2657fd6bc Yongqiang Sun 2026-09-18  1928  	struct amdgpu_mes *mes = &adev->mes;
a367f2657fd6bc Yongqiang Sun 2026-09-18  1929  
a367f2657fd6bc Yongqiang Sun 2026-09-18  1930  	mutex_lock(&mes->dbgext_lock);
a367f2657fd6bc Yongqiang Sun 2026-09-18 @1931  	seq_printf(m, "state:   %s\n", mes->dbgext_active ? "on" : "off");
a367f2657fd6bc Yongqiang Sun 2026-09-18  1932  	seq_printf(m, "size:    %u KB x %u xcc\n", mes->dbgext_log_size / SZ_1K,
a367f2657fd6bc Yongqiang Sun 2026-09-18  1933  		   mes->dbgext_num_xcc ? mes->dbgext_num_xcc : 1);
a367f2657fd6bc Yongqiang Sun 2026-09-18  1934  	seq_printf(m, "mode:    %s\n",
a367f2657fd6bc Yongqiang Sun 2026-09-18  1935  		   mes->dbgext_use_irq ? "interrupt" : "polling");
a367f2657fd6bc Yongqiang Sun 2026-09-18  1936  	seq_printf(m, "options: 0x%llx\n", mes->dbgext_log_options);
a367f2657fd6bc Yongqiang Sun 2026-09-18  1937  	mutex_unlock(&mes->dbgext_lock);
b2662d4cc4ce2d shaoyunl      2023-11-23  1938  
a367f2657fd6bc Yongqiang Sun 2026-09-18  1939  	return 0;
a367f2657fd6bc Yongqiang Sun 2026-09-18  1940  }
a367f2657fd6bc Yongqiang Sun 2026-09-18  1941  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
