Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DEADF71
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 02:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733021077; cv=none; b=SRMkMBHsi6fNTgDiRnPj4bY2TB7UdleX3D34R1RN2bUUjPJtLUU2huGOyLLHaBVpf1c6IPOW2i1aTenESlcmvSgjEVfuuG6XvMOXUbnReagpqOSQYutiGilxvrQI8bE8KEY9iB/VEI6cp1Zv6Zj6u5/j+k1ywVuUVmyO+syxreo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733021077; c=relaxed/simple;
	bh=MfhvPwDSQd1Brs2CCL/qfcEjOfXURON7qVKJeD0KlqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NhGM/gyNgAK5nJ7E+2js++c5yxDj0uGbtn/miuG/PSetCeE6lVprhS1Pb3GklRJmUaOA090Y1jxx3HwHb8TInBB5kuH34eDEG1JYv+kj/Wq7M8EdQHy//hC/CRfPPAcDGaxTP4oc3j/iCypu3/61cE4opeE7pcLo4JYd1vPgtL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ND51lg1d; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ND51lg1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733021075; x=1764557075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MfhvPwDSQd1Brs2CCL/qfcEjOfXURON7qVKJeD0KlqM=;
  b=ND51lg1dCE+t24oOSsnVvNMl90sigV7U+o0d4aFiJ2VjoFVNlkfiDuYg
   4C6Gi/25IQN1m/3kJTLGfn8YQ8+Lbij66puA0HxyuhVuMyIpdyvhi9/1Y
   f6QrVsDVDI8uiI5X9iSRosjtJrIrM6oQHBmmMpU3HGbzQZE/5lOQPvB4W
   7opWKuT3+0mible6N+xeanGOvuVIDY5nIZ99O9ULQYLWWPPayI/aWcqqm
   oBYubLkEGkebecN/ocOAzc89ON6LakqfXcPeGDtKQoH3/t+/gCzAbydy4
   JddvvFyQz137hJoaWWGDfjYGnSFocL/y1+8jq1itaFKTZH+eruxbvpg2l
   A==;
X-CSE-ConnectionGUID: 8PeofEWjQSGKKXzL0s2VHw==
X-CSE-MsgGUID: xzefUWmfQYiRLTR3yfdSsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="55694052"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="55694052"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 18:44:33 -0800
X-CSE-ConnectionGUID: dlaX5wjoShGwq0vpziI0OQ==
X-CSE-MsgGUID: 2p/egesuQoKyoZ8oZf+Slw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92869908"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Nov 2024 18:44:32 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHZwj-0001AL-1R;
	Sun, 01 Dec 2024 02:44:29 +0000
Date: Sun, 1 Dec 2024 10:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/counter/counter-chrdev.c:394:8-24: WARNING: counter_fops:
 .read() has stream semantic; safe to change nonseekable_open -> stream_open.
Message-ID: <202412011055.IRmn2Cty-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: William Breathitt Gray <vilhelm.gray@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c4bb3a2d641c02ac2c7aa45534b4cefdf9bf416b
commit: b6c50affda5957a3629b149a91c7f6688ffce7f7 counter: Add character device interface
date:   3 years, 2 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 years, 2 months ago
config: csky-randconfig-r064-20241117 (https://download.01.org/0day-ci/archive/20241201/202412011055.IRmn2Cty-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412011055.IRmn2Cty-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/counter/counter-chrdev.c:394:8-24: WARNING: counter_fops: .read() has stream semantic; safe to change nonseekable_open -> stream_open.

vim +394 drivers/counter/counter-chrdev.c

b6c50affda5957 William Breathitt Gray 2021-09-29  380  
b6c50affda5957 William Breathitt Gray 2021-09-29  381  static int counter_chrdev_open(struct inode *inode, struct file *filp)
b6c50affda5957 William Breathitt Gray 2021-09-29  382  {
b6c50affda5957 William Breathitt Gray 2021-09-29  383  	struct counter_device *const counter = container_of(inode->i_cdev,
b6c50affda5957 William Breathitt Gray 2021-09-29  384  							    typeof(*counter),
b6c50affda5957 William Breathitt Gray 2021-09-29  385  							    chrdev);
b6c50affda5957 William Breathitt Gray 2021-09-29  386  
b6c50affda5957 William Breathitt Gray 2021-09-29  387  	/* Ensure chrdev is not opened more than 1 at a time */
b6c50affda5957 William Breathitt Gray 2021-09-29  388  	if (!atomic_add_unless(&counter->chrdev_lock, 1, 1))
b6c50affda5957 William Breathitt Gray 2021-09-29  389  		return -EBUSY;
b6c50affda5957 William Breathitt Gray 2021-09-29  390  
b6c50affda5957 William Breathitt Gray 2021-09-29  391  	get_device(&counter->dev);
b6c50affda5957 William Breathitt Gray 2021-09-29  392  	filp->private_data = counter;
b6c50affda5957 William Breathitt Gray 2021-09-29  393  
b6c50affda5957 William Breathitt Gray 2021-09-29 @394  	return nonseekable_open(inode, filp);
b6c50affda5957 William Breathitt Gray 2021-09-29  395  }
b6c50affda5957 William Breathitt Gray 2021-09-29  396  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
