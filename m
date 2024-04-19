Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847558565E
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Apr 2024 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713531724; cv=none; b=kLmZk/+Knoh2EiRMomx/Jz5NIm4BJQn4mv+KcpK8gQKa+iHq1pKc/LrlyP2i+GS4XSFLBWICWyzSg/KH8PAjpIdo/rVQ9neYgw7H50GANBRTdGrtt0iST+u0M7W9nbi7JcjU2EylA5h4KVZ6bzGY+TSEE8OABrYyry+xzSwe2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713531724; c=relaxed/simple;
	bh=v6+IB5XPZNdBQbnmG/sI6syrNdMBx8hPvOBwepnYeAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+hk+GZguUIeADnJPstBXyFqnG0N70Q75Cd68LoP5nhQdnf2pp4MN73cg84lbvOoXp3TrD4fPZClOvtl16rchMKryrfNtbIaWNo7ecoE44s5itF49aZJYV9BINJgWmeN42wPesP+FyZ0kSoDc9J0YdKNj0nzvZhbAdQ6WbapgO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzovUIHJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzovUIHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713531720; x=1745067720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6+IB5XPZNdBQbnmG/sI6syrNdMBx8hPvOBwepnYeAE=;
  b=HzovUIHJZKHDE+MvaNcpCJJTCw/jZw5YYSKymz1tfMc9eITC60ZQ5GS3
   JZhuiE6gpli2bnH+t9YYjIaqcXJcJTmRw1wUkvzfwTQuSbnft1k/nOUV3
   Wfn5T5yRDVNQW43MReW3zZ3CcachVALOkXQr/4WvDrW+OM170vuWxIaaq
   7mN0x+cCSWMRsgE61te49NBX666fLoZtHm2lFoItMGA0u3Riup7XrIBAw
   +OueQ2GwLm+gw0K3cFXy5zNvo6nehVIXnoLRfhbR6BFbk8YIT1BNUT4Da
   FDwzlk6KQDPtJoxRV+hiX1RyUlxQHj9bEf8u4qerXa/Rk8HPQQ/nrVvVu
   g==;
X-CSE-ConnectionGUID: ULArQFGXQIyTOTna5AFqtA==
X-CSE-MsgGUID: aWVU3XoIQP6E8J9dIGNLXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26642786"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="26642786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 06:01:59 -0700
X-CSE-ConnectionGUID: nxnZPyKpRTeUODti9Rl4Wg==
X-CSE-MsgGUID: FXsJ3k1QTyyhCO53xnb7Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23307273"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Apr 2024 06:01:58 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxnsI-000A9A-2E;
	Fri, 19 Apr 2024 13:01:54 +0000
Date: Fri, 19 Apr 2024 21:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/fsi/fsi-master-ast-cf.c:1083:8-16: WARNING: please use
 sysfs_emit or sysfs_emit_at
Message-ID: <202404192006.bRG2jyOb-lkp@intel.com>
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
TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2668e3ae2ef36d5e7c52f818ad7d90822c037de4
commit: 6a794a27daca9c5a39de13c03b0748bb2d4a7a70 fsi: master-ast-cf: Add new FSI master using Aspeed ColdFire
date:   6 years ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 years ago
config: arm-randconfig-r063-20240419 (https://download.01.org/0day-ci/archive/20240419/202404192006.bRG2jyOb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404192006.bRG2jyOb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/fsi/fsi-master-ast-cf.c:1083:8-16: WARNING: please use sysfs_emit or sysfs_emit_at

vim +1083 drivers/fsi/fsi-master-ast-cf.c

6a794a27daca9c Benjamin Herrenschmidt 2018-06-12  1077  
6a794a27daca9c Benjamin Herrenschmidt 2018-06-12  1078  static ssize_t external_mode_show(struct device *dev,
6a794a27daca9c Benjamin Herrenschmidt 2018-06-12  1079  				  struct device_attribute *attr, char *buf)
6a794a27daca9c Benjamin Herrenschmidt 2018-06-12  1080  {
6a794a27daca9c Benjamin Herrenschmidt 2018-06-12  1081  	struct fsi_master_acf *master = dev_get_drvdata(dev);
6a794a27daca9c Benjamin Herrenschmidt 2018-06-12  1082  
6a794a27daca9c Benjamin Herrenschmidt 2018-06-12 @1083  	return snprintf(buf, PAGE_SIZE - 1, "%u\n",
6a794a27daca9c Benjamin Herrenschmidt 2018-06-12  1084  			master->external_mode ? 1 : 0);
6a794a27daca9c Benjamin Herrenschmidt 2018-06-12  1085  }
6a794a27daca9c Benjamin Herrenschmidt 2018-06-12  1086  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
