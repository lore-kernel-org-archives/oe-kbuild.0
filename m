Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB66523C511
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 19:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747079999; cv=none; b=k+Yrs9a15elb90orxHg8BS+6VO3644XYi+lU9aNXdP//XC9lib8FJR73BQYkeGzafsysqUbnut2WRbNS19jVKnuz4AMmL9rQja+aAz3ZyvrTfjXFaDfT1KqeoyttV/H6x7s+XR+ZpXUK2jBr+VTf7ux1Iy4RofdmoAei7X3dVL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747079999; c=relaxed/simple;
	bh=F1WbSIOmizAC+REs4XXVJETJ9PXKrtQ4ZWk4L0T3qjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uwtFRCW499E9nUj3GET5J7s8HHBAGp0wKbSQLtoNnW+e0o63HIA15YA/NnudI777HJPYcSyoq7XLvKntOWcu2KfIZz3fjrS6hwXBCuyZEO4eqCZ8l6bqAqZSVdokbbgupyJhCzfsOqHAuhEdxezYZPflqGWrlVeT1JWJCUTREt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gU1FTTBy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gU1FTTBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747079997; x=1778615997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F1WbSIOmizAC+REs4XXVJETJ9PXKrtQ4ZWk4L0T3qjM=;
  b=gU1FTTBy7j7bNIvCGnHJirrNowwak6oVBOu44s8A+6sAq8wriKEJOHSv
   Zv6spOnhrPFsxUHvpHN+xfOn4AetIssn+386czqAumXP5Tepm+/avEkCG
   ZOTkL+TKhyGc+WVsMZWdk33biuljNl/XKNwJdddsCgjkX7GNeK/iyW4BQ
   zrctqw5j0Ipr1R2yM3JlU1QpGwDkinScxy3uEKfWnDgaDi5Yh5cLyrYsX
   0VRC2xSrW0UIqQviT7g5tbhWZkEc/QE1NPwDuS7HM/GBvQz5v0qL67EK1
   76trTFZNCxyNWzzyyZR7o1bbg5VNkuiH97n9DljNfWRxUtL6TG4pJJuS8
   g==;
X-CSE-ConnectionGUID: Ly7EjvynToq/WQaxvQ6ppg==
X-CSE-MsgGUID: Tp7aqrCNRCOr3fR/gkmY2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49046381"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="49046381"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 12:59:56 -0700
X-CSE-ConnectionGUID: SvV5yaTrQiuqD1EyzQ93Ng==
X-CSE-MsgGUID: Pp3vrzCbTAeF0BeW6Blqbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="142594348"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 May 2025 12:59:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEZJY-000FMV-2O;
	Mon, 12 May 2025 19:59:52 +0000
Date: Tue, 13 May 2025 03:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8447/10491] fs/btrfs/extent-io-tree.o: warning:
 objtool: set_extent_bit+0x2e8: unreachable instruction
Message-ID: <202505130328.imEtvNTt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Filipe,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
commit: 3427dd2170685c5a7fc22781587240c45377d971 [8447/10491] btrfs: remove double underscore prefix from __set_extent_bit()
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505130328.imEtvNTt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130328.imEtvNTt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505130328.imEtvNTt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_extent_io_tree_release+0x9c: unreachable instruction
>> fs/btrfs/extent-io-tree.o: warning: objtool: set_extent_bit+0x2e8: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_get_range_bits+0x90: unreachable instruction
   fs/btrfs/extent-io-tree.o: warning: objtool: btrfs_test_range_bit+0x78: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
