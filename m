Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2074D1BBBC4
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731947522; cv=none; b=mvXjhv3V+xNNZh4jWyEIW8XbFSqe6YD/VuSiGrAK0HetAf6hCl3dsJG7uYd/KAiEcyoSE+3lfogr1Oeuq8JjwE08t2sf3hEomM4sgS0c/GCcHLS2Anw4r3FaQxniS/DUgTcmNTvwsrj40jy8l5kDavdCMrkbxDVqr20Em340IDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731947522; c=relaxed/simple;
	bh=pfPU5zqdhdd868A2fVnmpjd8RYGZtBpZOGNFt+mhmWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WluI1oD3lf99xMCa7ozqz4R7fbaNR1wZTXN0E0drafvIKI25yNx6EyXzQUG4ZjeziGc2CGQnwV7lRW9lQx6jsNIh0+ahXCv1w2LoHcGYV2De2wGQU3lb5i33FBkZfO+DAj3Ups8z4SMrpd8gg4cFlkuhMEw8HY6z4XtqEZui41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxZmJ3L8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxZmJ3L8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731947520; x=1763483520;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pfPU5zqdhdd868A2fVnmpjd8RYGZtBpZOGNFt+mhmWI=;
  b=DxZmJ3L8loAqqdLjEsGeuFmIx2hoc6a3Pb9gwF9/hS8o3LAh4Ae+WOG2
   seZpb/ABtiEst5Jo493J5zDx9t8kArWHkgQuEoFOV/OPTdH89/2arNm5x
   pmmaYvMwz31RY32fDHwT8oqLFx+GvdjQhnADANajT+taYeUFMRtYx5fqH
   3zEWaBVvY5EoCJvvcrbjYMa5OYM662e1dvKAzYkVPBEpER5dLqmT1/5SJ
   lTGyx95AT4ihVOVjjNk3cvLWPi18GVkO41w3f/TbstUTVB9XyOAudSj/W
   ow+Vry2sKLO8kIripkwRJ6EgRv++Pyg1a3XDBWR0FBmMEWY1QlxvhhzGH
   A==;
X-CSE-ConnectionGUID: KSXdenIfRymTo6HIVJs0JQ==
X-CSE-MsgGUID: +GtbQPdCSui+SW9RywgOGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32012455"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32012455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 08:31:59 -0800
X-CSE-ConnectionGUID: hgxHP3j1Q9+w20oq1vms9A==
X-CSE-MsgGUID: 6ZfSH00QRhKHiVwO0isgaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89668183"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2024 08:31:59 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD4fM-0002Wv-09;
	Mon, 18 Nov 2024 16:31:56 +0000
Date: Tue, 19 Nov 2024 00:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [driver-core:driver-core-next 25/26] drivers/perf/arm-ni.c:250:9:
 sparse: sparse: missing braces around initializer
Message-ID: <202411190050.InhaZMNi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/perf/arm-ni.c:250:9: sparse: sparse: missing braces around initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: "Thomas Weißschuh" <linux@weissschuh.net>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-next
head:   5943c0dc7912210be1ab2732e0b663c1082ab543
commit: 906c508afdca3487c4273bfeda8abedc8e21047b [25/26] sysfs: attribute_group: allow registration of const bin_attribute
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190050.InhaZMNi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241119/202411190050.InhaZMNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411190050.InhaZMNi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm-ni.c:250:9: sparse: sparse: missing braces around initializer
   drivers/perf/arm-ni.c: note: in included file:
   include/linux/io-64-nonatomic-lo-hi.h:38:9: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)

vim +250 drivers/perf/arm-ni.c

4d5a7680f2b4d0 Robin Murphy 2024-09-04  247  
4d5a7680f2b4d0 Robin Murphy 2024-09-04  248  static const struct attribute_group arm_ni_other_attr_group = {
4d5a7680f2b4d0 Robin Murphy 2024-09-04  249  	.attrs = arm_ni_other_attrs,
4d5a7680f2b4d0 Robin Murphy 2024-09-04 @250  	NULL
4d5a7680f2b4d0 Robin Murphy 2024-09-04  251  };
4d5a7680f2b4d0 Robin Murphy 2024-09-04  252  

:::::: The code at line 250 was first introduced by commit
:::::: 4d5a7680f2b4d0c2955e1d9f9a594b050d637436 perf: Add driver for Arm NI-700 interconnect PMU

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
