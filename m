Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FA91E505
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jun 2026 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489435; cv=none; b=hMePOZoxOaijNOCAEfEtj6MbYT/yZ+myafn3yvpgXasD3xTnO0wQmm6pppSMBx0ulo0g51UwLZZs+VtNFkLorrWKi6ijzRHYlcdRm/yTB9BDuJmIxn2VehCnD7/7AxBUOuIG04vU6gOuk7JLp5cIlTc9jBhGPODsAsnIvAfJ90o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489435; c=relaxed/simple;
	bh=/HLwS4mI2eBqvW28kayH15YvlJp3gc6EoFECf9FeH3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=efMOUzEiLiDXa6fweJEPAlE7gYgDGecLb0+J8nUkXMqsu67bY6bsWhQUY85GnO0R2BLkDHjjvBR1t8a7BaxK8mkIBHljQE7YMf1B+CCjVVi2Pi9S/wgnUrUEx7SojLztH/vNhUXz7jJUHFd0aj3moGCXTCmEewHNBXfiXv1Dn0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k6AShzBc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6AShzBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780489434; x=1812025434;
  h=date:from:to:cc:subject:message-id;
  bh=/HLwS4mI2eBqvW28kayH15YvlJp3gc6EoFECf9FeH3U=;
  b=k6AShzBcB1HmroK86oqc8sSLVjZVr2IqG/0CvykEhva23o3QVCLAy+JW
   CIAuJc+MacbQtJ9/OkLmoYLAh0Yru1bCLv6twH+EG4cHGccgPStIkQEn3
   nDhOGC+Z0czymgA8odYLcpwAO+YuZBRQBZ8nT4Vaadi7QURAcQqkBhyJJ
   ChhV5XL1Aq40E714zntVNGVE8QBckHAVjV+Qw6LqOjfvUfH+A3xW0d3Gh
   8dq17dbHmHGq4fHcfW9OO/s+urCrCKL2Zt4vdiyYb1tzbdUdrJkRGIqEJ
   TU6c7ARuU5RUr7d8wfrmA5tI674NOMBSOZEWRBbGfUIkzfBT6qyggngbM
   Q==;
X-CSE-ConnectionGUID: vZYcE5rTQ1etsI9L0MxBFA==
X-CSE-MsgGUID: WyWeeReoRC6ej2me5wHDpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92779393"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="92779393"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 05:23:53 -0700
X-CSE-ConnectionGUID: BSS/lVCvSSSiNgntJisj6A==
X-CSE-MsgGUID: 8TYafwc8ROCaE5b23mSo6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="248528373"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Jun 2026 05:23:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUkdR-00000000DPO-2AaW;
	Wed, 03 Jun 2026 12:23:49 +0000
Date: Wed, 03 Jun 2026 20:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline 1/1]
 drivers/misc/uid_sys_stats.c:123:32-33: WARNING opportunity for max()
Message-ID: <202606032002.UydOeH7I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   8a1ef95dff70e217ecf338928493d4f93d59a287
commit: 4a5826e549a3bd3bc3d81e19a1e2420f5f2070ef [1/1] Revert "ANDROID: disble the UID_SYS_STATS driver"
:::::: branch date: 16 hours ago
:::::: commit date: 2 years, 3 months ago
config: arm64-randconfig-r053-20260603 (https://download.01.org/0day-ci/archive/20260603/202606032002.UydOeH7I-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606032002.UydOeH7I-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/misc/uid_sys_stats.c:123:32-33: WARNING opportunity for max()
   drivers/misc/uid_sys_stats.c:126:33-34: WARNING opportunity for max()
   drivers/misc/uid_sys_stats.c:128:27-28: WARNING opportunity for max()
   drivers/misc/uid_sys_stats.c:130:27-28: WARNING opportunity for max()
   drivers/misc/uid_sys_stats.c:132:27-28: WARNING opportunity for max()

vim +123 drivers/misc/uid_sys_stats.c

ecc74079f6109b Jin Qian 2017-01-10  109  
ecc74079f6109b Jin Qian 2017-01-10  110  static void compute_io_bucket_stats(struct io_stats *io_bucket,
ecc74079f6109b Jin Qian 2017-01-10  111  					struct io_stats *io_curr,
ecc74079f6109b Jin Qian 2017-01-10  112  					struct io_stats *io_last,
ecc74079f6109b Jin Qian 2017-01-10  113  					struct io_stats *io_dead)
ecc74079f6109b Jin Qian 2017-01-10  114  {
ecc74079f6109b Jin Qian 2017-01-10  115  	/* tasks could switch to another uid group, but its io_last in the
ecc74079f6109b Jin Qian 2017-01-10  116  	 * previous uid group could still be positive.
ecc74079f6109b Jin Qian 2017-01-10  117  	 * therefore before each update, do an overflow check first
ecc74079f6109b Jin Qian 2017-01-10  118  	 */
ecc74079f6109b Jin Qian 2017-01-10  119  	int64_t delta;
ecc74079f6109b Jin Qian 2017-01-10  120  
ecc74079f6109b Jin Qian 2017-01-10  121  	delta = io_curr->read_bytes + io_dead->read_bytes -
ecc74079f6109b Jin Qian 2017-01-10  122  		io_last->read_bytes;
ecc74079f6109b Jin Qian 2017-01-10 @123  	io_bucket->read_bytes += delta > 0 ? delta : 0;
ecc74079f6109b Jin Qian 2017-01-10  124  	delta = io_curr->write_bytes + io_dead->write_bytes -
ecc74079f6109b Jin Qian 2017-01-10  125  		io_last->write_bytes;
ecc74079f6109b Jin Qian 2017-01-10  126  	io_bucket->write_bytes += delta > 0 ? delta : 0;
ecc74079f6109b Jin Qian 2017-01-10  127  	delta = io_curr->rchar + io_dead->rchar - io_last->rchar;
ecc74079f6109b Jin Qian 2017-01-10  128  	io_bucket->rchar += delta > 0 ? delta : 0;
ecc74079f6109b Jin Qian 2017-01-10  129  	delta = io_curr->wchar + io_dead->wchar - io_last->wchar;
ecc74079f6109b Jin Qian 2017-01-10  130  	io_bucket->wchar += delta > 0 ? delta : 0;
ecc74079f6109b Jin Qian 2017-01-10  131  	delta = io_curr->fsync + io_dead->fsync - io_last->fsync;
ecc74079f6109b Jin Qian 2017-01-10  132  	io_bucket->fsync += delta > 0 ? delta : 0;
ecc74079f6109b Jin Qian 2017-01-10  133  
ecc74079f6109b Jin Qian 2017-01-10  134  	io_last->read_bytes = io_curr->read_bytes;
ecc74079f6109b Jin Qian 2017-01-10  135  	io_last->write_bytes = io_curr->write_bytes;
ecc74079f6109b Jin Qian 2017-01-10  136  	io_last->rchar = io_curr->rchar;
ecc74079f6109b Jin Qian 2017-01-10  137  	io_last->wchar = io_curr->wchar;
ecc74079f6109b Jin Qian 2017-01-10  138  	io_last->fsync = io_curr->fsync;
ecc74079f6109b Jin Qian 2017-01-10  139  
ecc74079f6109b Jin Qian 2017-01-10  140  	memset(io_dead, 0, sizeof(struct io_stats));
ecc74079f6109b Jin Qian 2017-01-10  141  }
ecc74079f6109b Jin Qian 2017-01-10  142  

:::::: The code at line 123 was first introduced by commit
:::::: ecc74079f6109b7b43dc9660d5ed73cb7abb98ca ANDROID: uid_cputime: add per-uid IO usage accounting

:::::: TO: Jin Qian <jinqian@google.com>
:::::: CC: Todd Kjos <tkjos@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
