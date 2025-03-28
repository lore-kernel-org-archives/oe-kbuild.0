Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4540517548
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Mar 2025 00:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743122021; cv=none; b=GBn8lL/XcKU7CBT95WnNhff2Hw0/IcVVUDF+VK99ZuxG66irfw/6Ptw8wSBuCgO/xNGXgbKxUW6wQcHVkO4Am82tDSVR9h+EbwCcK9O1yXvRrYTJPUHU5w2wl8db3gNHzhAyPNtFGdHrn7IoHbwE9cmamrjAyb4eEFPg626LBB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743122021; c=relaxed/simple;
	bh=KV7cN+S1V5aBwPFOrXbDk/Fgo5Fi75+hkE3p1CseuZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bAcvQVSEELv2b/I0Q79nO6JEMCbhZ/RoZVicUQNB4YQAad8dw5p+QhI9Bfg1F/PKoOeei9p5ldGZg/u/Lj5Ivl/DiV5xy4GJBjd9fXdTk1iUJqe5mFc/Khfv2Y7l5blUmfmeH9IsGcEe9HgxG9uEe0A9lUt1P85jNA+P0W7BN5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZTCiLTK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZTCiLTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743122019; x=1774658019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KV7cN+S1V5aBwPFOrXbDk/Fgo5Fi75+hkE3p1CseuZk=;
  b=EZTCiLTKcI14AQi8bONyJC47OmySmnoqK4IMCbm+Ygcd4KDdViMkIPOs
   jJJMZmlLnfcN+mUUsA0WREmuamYzT4L7CYLe/OJvn8X9M5frKMz721M/H
   a0XxdhNIrAOR7VfyZeIhVTDPJO6v2m94K83QUet0PodB0MwpmoNEFGmy3
   2JqnN0b9aUXPUSJtbESYqHA6N4zRaoLvEd/iBZCVUM1Fz8O/DO+twHOEF
   lVQt/fDmHvsppvF1Tu71c8k61yqy+MzqUjtCxsX4WxQdPg8kOb43msi4L
   bukDmRZs5WYQKsuGy3JGu8xu8kxMH8NMhtbBLR1zCBkugQ6cIpT/UaR72
   g==;
X-CSE-ConnectionGUID: AiFAaOWFSiGWN2PcTX0WqA==
X-CSE-MsgGUID: jaj/JbdHSlKguHA1ILlu2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69841315"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="69841315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 17:33:38 -0700
X-CSE-ConnectionGUID: Z/ON3G+5SzOXWUyGaeozew==
X-CSE-MsgGUID: Ls2YVkU1TD2HiLExXSn4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="125313670"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Mar 2025 17:33:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txxfC-00072A-0m;
	Fri, 28 Mar 2025 00:33:34 +0000
Date: Fri, 28 Mar 2025 08:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ceph-client:tls_logger 19/40] fs/ceph/super.c:1042
 ceph_umount_begin() warn: variable dereferenced before check 'fsc' (see line
 1041)
Message-ID: <202503280852.YDB3pxUY-lkp@intel.com>
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
CC: ceph-devel@vger.kernel.org
TO: Alex Markuze <amarkuze@redhat.com>

tree:   https://github.com/ceph/ceph-client.git tls_logger
head:   3d957afa4285ed4deaaf42d200ba7ee1f3092f8d
commit: 75b56e556ea415e29a13a8b7e98d302fbbec4c01 [19/40] cephsan new logger
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-r071-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280852.YDB3pxUY-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503280852.YDB3pxUY-lkp@intel.com/

smatch warnings:
fs/ceph/super.c:1042 ceph_umount_begin() warn: variable dereferenced before check 'fsc' (see line 1041)

vim +/fsc +1042 fs/ceph/super.c

50c9132ddfb202 Jeff Layton  2020-09-25  1032  
16725b9d2a2e3d Sage Weil    2009-10-06  1033  /*
f1f565a2697661 Randy Dunlap 2020-07-17  1034   * ceph_umount_begin - initiate forced umount.  Tear down the
3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1035   * mount, skipping steps that may hang while waiting for server(s).
16725b9d2a2e3d Sage Weil    2009-10-06  1036   */
631ed4b0828727 Jeff Layton  2021-10-14  1037  void ceph_umount_begin(struct super_block *sb)
16725b9d2a2e3d Sage Weil    2009-10-06  1038  {
5995d90d2d19f3 Xiubo Li     2023-06-12  1039  	struct ceph_fs_client *fsc = ceph_sb_to_fs_client(sb);
3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1040  
38d46409c4639a Xiubo Li     2023-06-12 @1041  	doutc(fsc->client, "starting forced umount\n");
3d14c5d2b6e15c Yehuda Sadeh 2010-04-06 @1042  	if (!fsc)
3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1043  		return;
3d14c5d2b6e15c Yehuda Sadeh 2010-04-06  1044  	fsc->mount_state = CEPH_MOUNT_SHUTDOWN;
50c9132ddfb202 Jeff Layton  2020-09-25  1045  	__ceph_umount_begin(fsc);
16725b9d2a2e3d Sage Weil    2009-10-06  1046  }
16725b9d2a2e3d Sage Weil    2009-10-06  1047  

:::::: The code at line 1042 was first introduced by commit
:::::: 3d14c5d2b6e15c21d8e5467dc62d33127c23a644 ceph: factor out libceph from Ceph file system

:::::: TO: Yehuda Sadeh <yehuda@hq.newdream.net>
:::::: CC: Sage Weil <sage@newdream.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
