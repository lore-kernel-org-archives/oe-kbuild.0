Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0C4309EF9
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 06:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036067; cv=none; b=HfeiD1ZKnunT9SKxxIuW8uBMGGtVf0b9wVjcZhuW9GlRvfxQhBcp+ezuwX7bFvdqgkyRDCqCDuo8sPqTP4tVzOkQRQTTi+5WCu4gMs1bqTaInTTpDhDHVnsQ568EbD/XBjVwzEHFMmk/ok2n926bSJ8CovAk4L0O8HyZvdEmPGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036067; c=relaxed/simple;
	bh=dMl1DHBCvY9ZEvbIfOkJgKXeEqHBHi4soO7IR5NLZYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lbxIK6dV//K3my+N2g2qh6zUQLd1Ca7jFKbRM88z1B9unKKrFiF3aBTFzW7uqvRJI+vbfkSkmohPmS8+RctgwCERasoB83ijOLQpbAo4Nkx+HqonMGgkr77MeK9TmdY0mdNeu+aJVc7r2LqjhCQg4CYG4F/duUIEM+JsUajmDtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/UhvmCp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/UhvmCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780036066; x=1811572066;
  h=date:from:to:cc:subject:message-id;
  bh=dMl1DHBCvY9ZEvbIfOkJgKXeEqHBHi4soO7IR5NLZYE=;
  b=n/UhvmCpnoh2VqIBLMEgWBSzxPeo9wTqilrONRn95GwppcKq7eAzMsG7
   iQECQe6EKHo3UfzngeE4LGrg2DZIrl/owe4BZiwVAnAgUZug8S8WvrV/y
   Nf2EmrjSDbQAuduyhOgmj91hF0E5FOYWQTumE94mDuPj0tkbCCFLTFyQe
   +5iEFLwUXO/mYXLHmxqoOWPbGwIFS58PJ0Nia1xXLnJ75+5JT5+8nQ9YG
   t2KFE04ACetvl1kxUoCzsbqD6eI4MucqtyWTHjDwu5WmrGOEoYgLKZ1Fs
   5/WPncherRF4UsxWg3wiqURZjbOrxmBySLZu6nB7kHjruQwq8L8YGrgd2
   A==;
X-CSE-ConnectionGUID: 5XEz4i6VScKn1jM5gQY3Xw==
X-CSE-MsgGUID: P2Bsq8A+RrCYgWQiFxFQJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98300939"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="98300939"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:27:45 -0700
X-CSE-ConnectionGUID: GcwyeKU2TVmaH71ZRiCZcw==
X-CSE-MsgGUID: zpL5bGMcQ1WffHwN9ZAw1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="247708163"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2026 23:27:44 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSqh4-000000006qE-0a06;
	Fri, 29 May 2026 06:27:42 +0000
Date: Fri, 29 May 2026 14:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_trace_support_v4 46/61]
 arch/riscv/kernel/sbi_mpxy.c:103:19-20: WARNING opportunity for min()
Message-ID: <202605291415.zwBUuMyv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anup Patel <anup.patel@oss.qualcomm.com>
CC: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   f532a039b5f6357db1cefa8fba19666b46049341
commit: d715c82481af6e5c6576ae0cb3a17bdb66a9e4ea [46/61] RISC-V: Move common MPXY helper routines to arch/riscv
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r061-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291415.zwBUuMyv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605291415.zwBUuMyv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/sbi_mpxy.c:103:19-20: WARNING opportunity for min()

vim +103 arch/riscv/kernel/sbi_mpxy.c

d715c82481af6e Anup Patel 2026-05-26   79  
d715c82481af6e Anup Patel 2026-05-26   80  int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
d715c82481af6e Anup Patel 2026-05-26   81  {
d715c82481af6e Anup Patel 2026-05-26   82  	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
d715c82481af6e Anup Patel 2026-05-26   83  	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
d715c82481af6e Anup Patel 2026-05-26   84  	u32 remaining, returned, count, start_index = 0;
d715c82481af6e Anup Patel 2026-05-26   85  	struct sbiret sret;
d715c82481af6e Anup Patel 2026-05-26   86  
d715c82481af6e Anup Patel 2026-05-26   87  	if (!mpxy->shmem_active)
d715c82481af6e Anup Patel 2026-05-26   88  		return -ENODEV;
d715c82481af6e Anup Patel 2026-05-26   89  	if (!channel_count || !channel_ids)
d715c82481af6e Anup Patel 2026-05-26   90  		return -EINVAL;
d715c82481af6e Anup Patel 2026-05-26   91  
d715c82481af6e Anup Patel 2026-05-26   92  	get_cpu();
d715c82481af6e Anup Patel 2026-05-26   93  
d715c82481af6e Anup Patel 2026-05-26   94  	do {
d715c82481af6e Anup Patel 2026-05-26   95  		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
d715c82481af6e Anup Patel 2026-05-26   96  				 start_index, 0, 0, 0, 0, 0);
d715c82481af6e Anup Patel 2026-05-26   97  		if (sret.error)
d715c82481af6e Anup Patel 2026-05-26   98  			goto err_put_cpu;
d715c82481af6e Anup Patel 2026-05-26   99  
d715c82481af6e Anup Patel 2026-05-26  100  		remaining = le32_to_cpu(sdata->remaining);
d715c82481af6e Anup Patel 2026-05-26  101  		returned = le32_to_cpu(sdata->returned);
d715c82481af6e Anup Patel 2026-05-26  102  
d715c82481af6e Anup Patel 2026-05-26 @103  		count = returned < (channel_count - start_index) ?
d715c82481af6e Anup Patel 2026-05-26  104  			returned : (channel_count - start_index);
d715c82481af6e Anup Patel 2026-05-26  105  		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
d715c82481af6e Anup Patel 2026-05-26  106  		start_index += count;
d715c82481af6e Anup Patel 2026-05-26  107  	} while (remaining && start_index < channel_count);
d715c82481af6e Anup Patel 2026-05-26  108  
d715c82481af6e Anup Patel 2026-05-26  109  err_put_cpu:
d715c82481af6e Anup Patel 2026-05-26  110  	put_cpu();
d715c82481af6e Anup Patel 2026-05-26  111  	return sbi_err_map_linux_errno(sret.error);
d715c82481af6e Anup Patel 2026-05-26  112  }
d715c82481af6e Anup Patel 2026-05-26  113  EXPORT_SYMBOL_GPL(sbi_mpxy_get_channel_ids);
d715c82481af6e Anup Patel 2026-05-26  114  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
