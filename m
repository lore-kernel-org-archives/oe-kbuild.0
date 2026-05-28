Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054944AEEF
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 02:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779933945; cv=none; b=LLdOKVsTVS9wBdMWg/p3y1od4k0NaERCv6xn2n/rDR+KTaJ6aPmuwz39k9InHHY5jqSXbQxBLwuSuiV4EUP00J6Wirb8dFxcprpc75C5SdvcYfgiTCbHFWHgJ4XgbHZDcShoTxliN3XE+XiI2BNkKu0Bs8pzUgkUkjUXgZEjzJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779933945; c=relaxed/simple;
	bh=0bVqlHXGo4CSqlxHdQM+e1PWA8E27NrmfNYmyQvmc1c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pYLLHAI7ckzNyprmc65fMJV/FWCeWBOsvDXGP6ThWW2danQg9+LsDPdlCQ58V15kHrVc9JaFVCX7bwF3gbvhvnNM40H5JRnY7HpK6C9Mdxwp0Y3eysEHYmJ11mgkCqk24e1mFTupmwtO4QVbOccNPVyKPflP4c/Kj6sFtv1EMTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijCtXhtj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijCtXhtj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779933942; x=1811469942;
  h=date:from:to:cc:subject:message-id;
  bh=0bVqlHXGo4CSqlxHdQM+e1PWA8E27NrmfNYmyQvmc1c=;
  b=ijCtXhtjwDH/S3A1TgHuIgNGN4TEIZF8T7JQo0V0pkKYfcC+UAcebzuu
   8NohI2MunLIYk9P/FlV4rplfyff/E6eoGdVF6uKlg3b9sdw4ytBZrRyFS
   hiS6LipPESrVbu0be98zGgvILj342fj5hmyC5lqHx27zmSxxRWjfo7z/p
   ENVsntxwVzxaImkSBOceYeNBjPkvIXXuutTqdurSzB59u3Lnn59ktlxwv
   R0HZ+lTP334sT8e0MMnFDii/8931OMt4eNjvqKMlCE8e7J6qiQ1mrou/i
   6gyZUN+gasZ5U1cX/6w9N6maiT9JeBA6oc62nwLyXI1NQOidDPE9iqfRi
   w==;
X-CSE-ConnectionGUID: ExXjq/u/Tu+0/NXmH+Bkww==
X-CSE-MsgGUID: rahQGZYPRQaL5FErjhSskQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="98350675"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="98350675"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 19:05:41 -0700
X-CSE-ConnectionGUID: O8a1CpQXTiqxpsmQy4PebA==
X-CSE-MsgGUID: llxszeHtT9+pHQUpSwnIyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="242562033"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 May 2026 19:05:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSQ7u-000000005Qg-1k1g;
	Thu, 28 May 2026 02:05:38 +0000
Date: Thu, 28 May 2026 10:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8381/8766]
 lib/raid/raid6/arm/recov_neon_inner.c:32 __raid6_2data_recov_neon() warn:
 statement has no effect 'uint8x16_t'
Message-ID: <202605280927.Yv6FGE1L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7d700e14934e68f86338c5610cf2ae76798b663
commit: cbda5b30bb93e72b17b43946270a5fd9750ebc34 [8381/8766] raid6: move to lib/raid/
:::::: branch date: 11 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-r071-20260528 (https://download.01.org/0day-ci/archive/20260528/202605280927.Yv6FGE1L-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605280927.Yv6FGE1L-lkp@intel.com/

New smatch warnings:
lib/raid/raid6/arm/recov_neon_inner.c:32 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:81 __raid6_datap_recov_neon() warn: statement has no effect 'uint8x16_t'

Old smatch warnings:
lib/raid/raid6/arm/recov_neon_inner.c:33 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:34 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:35 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:36 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:51 __raid6_2data_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:82 __raid6_datap_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:83 __raid6_datap_recov_neon() warn: statement has no effect 'uint8x16_t'
lib/raid/raid6/arm/recov_neon_inner.c:93 __raid6_datap_recov_neon() warn: statement has no effect 'uint8x16_t'

vim +/uint8x16_t +32 lib/raid/raid6/arm/recov_neon_inner.c

6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  27  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  28  void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t *dp,
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  29  			      uint8_t *dq, const uint8_t *pbmul,
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  30  			      const uint8_t *qmul)
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  31  {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13 @32  	uint8x16_t pm0 = vld1q_u8(pbmul);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  33  	uint8x16_t pm1 = vld1q_u8(pbmul + 16);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  34  	uint8x16_t qm0 = vld1q_u8(qmul);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  35  	uint8x16_t qm1 = vld1q_u8(qmul + 16);
1ad3935b39da78 lib/raid6/recov_neon_inner.c Nick Desaulniers 2019-02-25  36  	uint8x16_t x0f = vdupq_n_u8(0x0f);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  37  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  38  	/*
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  39  	 * while ( bytes-- ) {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  40  	 *	uint8_t px, qx, db;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  41  	 *
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  42  	 *	px    = *p ^ *dp;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  43  	 *	qx    = qmul[*q ^ *dq];
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  44  	 *	*dq++ = db = pbmul[px] ^ qx;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  45  	 *	*dp++ = db ^ px;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  46  	 *	p++; q++;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  47  	 * }
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  48  	 */
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  49  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  50  	while (bytes) {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  51  		uint8x16_t vx, vy, px, qx, db;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  52  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  53  		px = veorq_u8(vld1q_u8(p), vld1q_u8(dp));
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  54  		vx = veorq_u8(vld1q_u8(q), vld1q_u8(dq));
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  55  
335ebe3035b6fc lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  56  		vy = vshrq_n_u8(vx, 4);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  57  		vx = vqtbl1q_u8(qm0, vandq_u8(vx, x0f));
335ebe3035b6fc lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  58  		vy = vqtbl1q_u8(qm1, vy);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  59  		qx = veorq_u8(vx, vy);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  60  
335ebe3035b6fc lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  61  		vy = vshrq_n_u8(px, 4);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  62  		vx = vqtbl1q_u8(pm0, vandq_u8(px, x0f));
335ebe3035b6fc lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  63  		vy = vqtbl1q_u8(pm1, vy);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  64  		vx = veorq_u8(vx, vy);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  65  		db = veorq_u8(vx, qx);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  66  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  67  		vst1q_u8(dq, db);
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  68  		vst1q_u8(dp, veorq_u8(db, px));
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  69  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  70  		bytes -= 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  71  		p += 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  72  		q += 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  73  		dp += 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  74  		dq += 16;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  75  	}
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  76  }
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  77  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  78  void __raid6_datap_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t *dq,
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  79  			      const uint8_t *qmul)
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  80  {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13 @81  	uint8x16_t qm0 = vld1q_u8(qmul);

:::::: The code at line 32 was first introduced by commit
:::::: 6ec4e2514decd6fb4782a9364fa71d6244d05af4 md/raid6: implement recovery using ARM NEON intrinsics

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
