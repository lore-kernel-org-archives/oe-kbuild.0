Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9866223B61F
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037078; cv=none; b=dKVj1XZ3aEc8FleXCs+9TSKBeLu9R+XVdBUdh4rj2Pwv6yHkEBEFjEK4wJvBpxSAohXnGgZ3s9GXk6gPd3CjNQIwPo7Abu1Vi4VQm2Rwu/E3gydjfX6OWleYjy5SZ+nRYMjk0u3laR8NkTbWCXq2w/lior0aUAE1N9YqWXnWHd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037078; c=relaxed/simple;
	bh=Z7OVEITjaJ2wnB7b8uq2sdIWlqEv5MBjxZU5tTkgpMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rns8ZeTuXI6vV873KcLFOVajXsZ7ufs/WXkrLCSvjoVuMLhMvlx9Jrspmkv0uFcFEDr04b0vq+YIzH6GhampDLBYr2ieQJU2szieRGpV/Ly4UDerHkviXheKp0lI0hmG9kLrTUgBb2RRTLAP0Oe5wpJlJbE3evWKrDaC1qNavX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdA6AS7V; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdA6AS7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751037077; x=1782573077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z7OVEITjaJ2wnB7b8uq2sdIWlqEv5MBjxZU5tTkgpMM=;
  b=BdA6AS7Vau+iF/R8Tyu+PcMl0kU578GYaS9W2lz+unLwO6kkJRJmtXa5
   lOi3aPVvVtEWhB8GNPAXDXqrtZjkTgV/OfmvilDmcM6NXw7d2sAXR5DXX
   wdRmWOyiJgj4vEw0dwjPF8Ys+YWLD/qDOxI7d40E3Vjb11uLzDCbhCe6E
   3VTO1EAZKx/nMFvZPF5X3euLBBgYZHSKKi1dKO/ZblBXihVE77frQqEfy
   TYHbwh2n0a+eGSs3fDakcxd/HHlCwN1DqSxOYkNePIb936zRII3qJaLc9
   jvFlf7Fs/miBXKspxV3mgA1YAmBzz4g75UAlvy3heZoYp/bAIaW9DhX2w
   Q==;
X-CSE-ConnectionGUID: uw3NaNjATGypbWT9AMlR8g==
X-CSE-MsgGUID: Cv+5+ed6SAqK8afZ2IXV2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57134950"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57134950"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:11:16 -0700
X-CSE-ConnectionGUID: XJvcrhd9SXWTVA+cZqnMzA==
X-CSE-MsgGUID: Z1HHPXwLR6mrj+XjfypNYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="176506767"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jun 2025 08:11:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVAjQ-000WJ9-2D;
	Fri, 27 Jun 2025 15:11:12 +0000
Date: Fri, 27 Jun 2025 23:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5568/5998] block/genhd.c:150:23-24: WARNING
 opportunity for max()
Message-ID: <202506272336.CvAqaAxB-lkp@intel.com>
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
TO: Yu Kuai <yukuai3@huawei.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: c007062188d8e402c294117db53a24b2bed2b83f [5568/5998] block: fix false warning in bdev_count_inflight_rw()
:::::: branch date: 6 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-101-20250627 (https://download.01.org/0day-ci/archive/20250627/202506272336.CvAqaAxB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506272336.CvAqaAxB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> block/genhd.c:150:23-24: WARNING opportunity for max()
   block/genhd.c:151:25-26: WARNING opportunity for max()

vim +150 block/genhd.c

ea18e0f0a63af9 Konstantin Khlebnikov 2020-03-25  127  
f2987c5816bda0 Yu Kuai               2025-05-06  128  static void bdev_count_inflight_rw(struct block_device *part,
6b6c3a97abdebf Yu Kuai               2025-05-06  129  		unsigned int inflight[2], bool mq_driver)
bf0ddaba65ddbb Omar Sandoval         2018-04-26  130  {
c007062188d8e4 Yu Kuai               2025-06-26  131  	int write = 0;
c007062188d8e4 Yu Kuai               2025-06-26  132  	int read = 0;
1226b8dd0e9133 Mikulas Patocka       2018-12-06  133  	int cpu;
1226b8dd0e9133 Mikulas Patocka       2018-12-06  134  
6b6c3a97abdebf Yu Kuai               2025-05-06  135  	if (mq_driver) {
6b6c3a97abdebf Yu Kuai               2025-05-06  136  		blk_mq_in_driver_rw(part, inflight);
c007062188d8e4 Yu Kuai               2025-06-26  137  		return;
6b6c3a97abdebf Yu Kuai               2025-05-06  138  	}
c007062188d8e4 Yu Kuai               2025-06-26  139  
c007062188d8e4 Yu Kuai               2025-06-26  140  	for_each_possible_cpu(cpu) {
c007062188d8e4 Yu Kuai               2025-06-26  141  		read += part_stat_local_read_cpu(part, in_flight[READ], cpu);
c007062188d8e4 Yu Kuai               2025-06-26  142  		write += part_stat_local_read_cpu(part, in_flight[WRITE], cpu);
1226b8dd0e9133 Mikulas Patocka       2018-12-06  143  	}
6b6c3a97abdebf Yu Kuai               2025-05-06  144  
c007062188d8e4 Yu Kuai               2025-06-26  145  	/*
c007062188d8e4 Yu Kuai               2025-06-26  146  	 * While iterating all CPUs, some IOs may be issued from a CPU already
c007062188d8e4 Yu Kuai               2025-06-26  147  	 * traversed and complete on a CPU that has not yet been traversed,
c007062188d8e4 Yu Kuai               2025-06-26  148  	 * causing the inflight number to be negative.
c007062188d8e4 Yu Kuai               2025-06-26  149  	 */
c007062188d8e4 Yu Kuai               2025-06-26 @150  	inflight[READ] = read > 0 ? read : 0;
c007062188d8e4 Yu Kuai               2025-06-26  151  	inflight[WRITE] = write > 0 ? write : 0;
bf0ddaba65ddbb Omar Sandoval         2018-04-26  152  }
bf0ddaba65ddbb Omar Sandoval         2018-04-26  153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
