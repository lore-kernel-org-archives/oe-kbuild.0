Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E491F6FBF
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 16:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086041; cv=none; b=M+Zwqu7au2pZPDBmQZam+JmjO7y1suDYc94UayTpRs/s/7ECDUxpOeBpDTsA8FT5vBrfyAnF8orXCuZCujt2HkujUFmNaNp1rwoLQMfGBGdIH2RL1USj7aWAv82MJANyomLLuNczX3M2ofDUGTOpxntjzORHbvoC0rNHFz/iOtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086041; c=relaxed/simple;
	bh=ZZtDd2sM5UGp5aoWi77dUjx63qL89UXo1YgXutcsJ+U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oghT4HP/3IISA46jow65wygX0m8PWzBpInEX/0BO5tUeeA4Lqs/DClGHjqUNznsEUeK0T/3216rS2ODoe0kB/cEYDjtcIB0HswPV1bID5DJb4asuah7FTD/JrKCvtFnYgijmUKPsiG2zGrJCAVKv+HTA5i+0GV/D7TVyew9K7WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=micVeZWm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="micVeZWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778086040; x=1809622040;
  h=date:from:to:cc:subject:message-id;
  bh=ZZtDd2sM5UGp5aoWi77dUjx63qL89UXo1YgXutcsJ+U=;
  b=micVeZWmOy8YIQvU1dOPV4WVDUaZzOL3CsLCIPGf5V6gcBolef9zVkdq
   KygnODMWnD8xbMISyiCL97BYlKBKroIZWze1I2OgkrDAQJvBOtOVy0T4h
   yy9/+JWLAVZiwwgT4YLVtS1tv7mD7YY7i8VL+IcFH4Ig6gJMAhmw+CVQg
   pQtyeXM7l7MAVIMZPapur+ENCVjfi50Yq2Ky+xxAPyUCG47ipN5cumbUc
   CJ0lSdDUJdqjCa2op8TavjVG0krAD9PLwCz5ZZmBAkogi/EkTBztcQk5y
   b53Xucewl1F0Y5QPjmAA+i2NjbiPdmqf6zQ/gsUSN3a4uxOVPWjk/QjLX
   w==;
X-CSE-ConnectionGUID: sYkPmhdASZ6Mdspolt0lXA==
X-CSE-MsgGUID: OhGw04XCSPKOhGIXc9BC8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79071586"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="79071586"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 09:47:19 -0700
X-CSE-ConnectionGUID: rw96BlzqSxSfQKN76zebKg==
X-CSE-MsgGUID: /f034vnFR+qFfDOhjzua8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259891866"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 May 2026 09:47:18 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKfP1-0000000014f-354i;
	Wed, 06 May 2026 16:47:15 +0000
Date: Thu, 07 May 2026 00:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1 2/2]
 fs/squashfs/decompressor_multi_percpu.c:84:9: sparse: sparse: no generic
 selection for 'struct local_lock_t *'
Message-ID: <202605070046.L2QE4e4A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/squashfs/decompressor_multi_percpu.c:84:9: sparse: sparse: no generic selection for 'struct local_lock_t *'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   bc1567eb8cdef6c0456563b30f1ce83dbaf3dacb
commit: 9183a054c2a4d512a704667591d974f1a88fe8b7 [2/2] UPSTREAM: locking/local_lock: fix _Generic() matching of local_trylock_t
:::::: branch date: 5 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-r131-20260506 (https://download.01.org/0day-ci/archive/20260507/202605070046.L2QE4e4A-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070046.L2QE4e4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605070046.L2QE4e4A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/squashfs/decompressor_multi_percpu.c:84:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct local_lock_t * @@
   fs/squashfs/decompressor_multi_percpu.c:84:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   fs/squashfs/decompressor_multi_percpu.c:84:9: sparse:     got struct local_lock_t *
>> fs/squashfs/decompressor_multi_percpu.c:84:9: sparse: sparse: no generic selection for 'struct local_lock_t *'
   fs/squashfs/decompressor_multi_percpu.c:90:9: sparse: sparse: no generic selection for 'struct local_lock_t *'

vim +84 fs/squashfs/decompressor_multi_percpu.c

d208383d640727b Phillip Lougher  2013-11-18  77  
93e72b3c612adca Philippe Liard   2020-06-01  78  int squashfs_decompress(struct squashfs_sb_info *msblk, struct bio *bio,
93e72b3c612adca Philippe Liard   2020-06-01  79  	int offset, int length, struct squashfs_page_actor *output)
d208383d640727b Phillip Lougher  2013-11-18  80  {
fd56200a16c72c7 Julia Cartwright 2020-05-27  81  	struct squashfs_stream *stream;
fd56200a16c72c7 Julia Cartwright 2020-05-27  82  	int res;
fd56200a16c72c7 Julia Cartwright 2020-05-27  83  
fd56200a16c72c7 Julia Cartwright 2020-05-27 @84  	local_lock(&msblk->stream->lock);
fd56200a16c72c7 Julia Cartwright 2020-05-27  85  	stream = this_cpu_ptr(msblk->stream);
fd56200a16c72c7 Julia Cartwright 2020-05-27  86  
93e72b3c612adca Philippe Liard   2020-06-01  87  	res = msblk->decompressor->decompress(msblk, stream->stream, bio,
846b730e99518a1 Phillip Lougher  2013-11-18  88  					      offset, length, output);
fd56200a16c72c7 Julia Cartwright 2020-05-27  89  
fd56200a16c72c7 Julia Cartwright 2020-05-27  90  	local_unlock(&msblk->stream->lock);
d208383d640727b Phillip Lougher  2013-11-18  91  
d208383d640727b Phillip Lougher  2013-11-18  92  	if (res < 0)
d208383d640727b Phillip Lougher  2013-11-18  93  		ERROR("%s decompression failed, data probably corrupt\n",
d208383d640727b Phillip Lougher  2013-11-18  94  			msblk->decompressor->name);
d208383d640727b Phillip Lougher  2013-11-18  95  
d208383d640727b Phillip Lougher  2013-11-18  96  	return res;
d208383d640727b Phillip Lougher  2013-11-18  97  }
d208383d640727b Phillip Lougher  2013-11-18  98  

:::::: The code at line 84 was first introduced by commit
:::::: fd56200a16c72c7c3ec3e54e06160dfaa5b8dee8 squashfs: Make use of local lock in multi_cpu decompressor

:::::: TO: Julia Cartwright <julia@ni.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
