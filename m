Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7114A3C
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 07:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766734521; cv=none; b=rW4iC+zHQInIk5U8eAqwsBtq9v09H8NGPqTY3z2M7sdiWibiHG6M5qSHod/B4htVdDhdYA5WNuho0zm2BP7UJjHznIVqd5P9p+aEPAldM+a8Tgdo9U3kYxXh8yEleMonApsyV+MqM/j7eIWJpKyG0+O4vidMDUnOUdNoOD9k4b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766734521; c=relaxed/simple;
	bh=5XJEtAZRDnGJdPDBJz464SrXI1kdpafUmGa43hgvf20=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eCQEHH8+hTpS6ui4ZiMQvNluI++LvAIAlB9H9p92M7nEAsqzJqI9JXHg3nr3FrLLA1ZKseiF+2cApmzXRSfIBlRUNZLft3+m4KACWaRes+o6i7wFjpTVG0RcPcr6THfzl4Pu01tOwG57AjHtui/WP75cmwrVXLIKKW3tvyvHZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3+2nGi5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3+2nGi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766734520; x=1798270520;
  h=date:from:to:cc:subject:message-id;
  bh=5XJEtAZRDnGJdPDBJz464SrXI1kdpafUmGa43hgvf20=;
  b=S3+2nGi5ghMTwfgxBqkOIyyofA4zBr5KDMlAayjYeOsMLBiUJV8DQvOL
   X9ZK/LssEnsZDNPRMcfHYr7KpskSA396acwH4FJhYm4UDvxYkQUXoQ4q6
   X0ZxCFiixK9AZkY56oKVUnvbvpHy7EidxMKBW+g3ncuZSlKtSqZ15BdCF
   RZNW0MXoY7MRfogWvAbIU4HjJ14KiNQLNV2YKRpamj44dkpkeqp1k6lJV
   v7PE310RDmW9+PsVWO/utQu84EvvHQq4dAiZKQQclmi4Z3uZkRl07Yto8
   qFrjMPcpMmyxcnb5P/F8TTdeSkiIdHbf1iEGQHJdl+mYWu0NZPqXklrAx
   w==;
X-CSE-ConnectionGUID: jDsXOiz3T3ueCi6V3VUejw==
X-CSE-MsgGUID: QsU+IQS9R76reODwf9wwPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="67497128"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="67497128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 23:35:19 -0800
X-CSE-ConnectionGUID: mBh4Q6JgQK6VaOd1b02flg==
X-CSE-MsgGUID: eZeb6zGsQs2gGct+ywBmdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200316123"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Dec 2025 23:35:15 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ2LW-000000004qL-3lpb;
	Fri, 26 Dec 2025 07:34:48 +0000
Date: Fri, 26 Dec 2025 15:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:392:28: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202512261505.UPPI3kcG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sumanth Korikkar <sumanthk@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Jens Remus <jremus@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
commit: 991a20173a1fbafd9fc0df0c7e17bb62d44a4deb s390: Fix linker error when -no-pie option is unavailable
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: s390-randconfig-r121-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261505.UPPI3kcG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261505.UPPI3kcG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512261505.UPPI3kcG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/s390/boot/decompressor.c: note: in included file (through arch/s390/include/uapi/../../../../lib/decompress_unxz.c):
>> arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:392:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:392:28: sparse:     expected restricted __le32 const [usertype] *p
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:392:28: sparse:     got unsigned int const [usertype] *
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:426:48: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:426:48: sparse:     expected restricted __le32 const [usertype] *p
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:426:48: sparse:     got unsigned int const [usertype] *
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:434:37: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:434:37: sparse:     expected restricted __le32 const [usertype] *p
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:434:37: sparse:     got unsigned int const [usertype] *
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:458:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:458:28: sparse:     expected restricted __le32 const [usertype] *p
   arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c:458:28: sparse:     got unsigned int const [usertype] *

vim +392 arch/s390/include/uapi/../../../../lib/xz/xz_dec_stream.c

24fa0402a9b6a5 Lasse Collin 2011-01-12  384  
24fa0402a9b6a5 Lasse Collin 2011-01-12  385  /* Decode the Stream Header field (the first 12 bytes of the .xz Stream). */
24fa0402a9b6a5 Lasse Collin 2011-01-12  386  static enum xz_ret dec_stream_header(struct xz_dec *s)
24fa0402a9b6a5 Lasse Collin 2011-01-12  387  {
24fa0402a9b6a5 Lasse Collin 2011-01-12  388  	if (!memeq(s->temp.buf, HEADER_MAGIC, HEADER_MAGIC_SIZE))
24fa0402a9b6a5 Lasse Collin 2011-01-12  389  		return XZ_FORMAT_ERROR;
24fa0402a9b6a5 Lasse Collin 2011-01-12  390  
24fa0402a9b6a5 Lasse Collin 2011-01-12  391  	if (xz_crc32(s->temp.buf + HEADER_MAGIC_SIZE, 2, 0)
24fa0402a9b6a5 Lasse Collin 2011-01-12 @392  			!= get_le32(s->temp.buf + HEADER_MAGIC_SIZE + 2))
24fa0402a9b6a5 Lasse Collin 2011-01-12  393  		return XZ_DATA_ERROR;
24fa0402a9b6a5 Lasse Collin 2011-01-12  394  
24fa0402a9b6a5 Lasse Collin 2011-01-12  395  	if (s->temp.buf[HEADER_MAGIC_SIZE] != 0)
24fa0402a9b6a5 Lasse Collin 2011-01-12  396  		return XZ_OPTIONS_ERROR;
24fa0402a9b6a5 Lasse Collin 2011-01-12  397  
24fa0402a9b6a5 Lasse Collin 2011-01-12  398  	/*
24fa0402a9b6a5 Lasse Collin 2011-01-12  399  	 * Of integrity checks, we support only none (Check ID = 0) and
24fa0402a9b6a5 Lasse Collin 2011-01-12  400  	 * CRC32 (Check ID = 1). However, if XZ_DEC_ANY_CHECK is defined,
24fa0402a9b6a5 Lasse Collin 2011-01-12  401  	 * we will accept other check types too, but then the check won't
24fa0402a9b6a5 Lasse Collin 2011-01-12  402  	 * be verified and a warning (XZ_UNSUPPORTED_CHECK) will be given.
24fa0402a9b6a5 Lasse Collin 2011-01-12  403  	 */
4f8d7abaa413c3 Lasse Collin 2021-10-11  404  	if (s->temp.buf[HEADER_MAGIC_SIZE + 1] > XZ_CHECK_MAX)
4f8d7abaa413c3 Lasse Collin 2021-10-11  405  		return XZ_OPTIONS_ERROR;
4f8d7abaa413c3 Lasse Collin 2021-10-11  406  
24fa0402a9b6a5 Lasse Collin 2011-01-12  407  	s->check_type = s->temp.buf[HEADER_MAGIC_SIZE + 1];
24fa0402a9b6a5 Lasse Collin 2011-01-12  408  

:::::: The code at line 392 was first introduced by commit
:::::: 24fa0402a9b6a537e87e38341e78b7da86486846 decompressors: add XZ decompressor module

:::::: TO: Lasse Collin <lasse.collin@tukaani.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
