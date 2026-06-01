Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40EE2236E0
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343902; cv=none; b=qhqNMb043Ci5RqJpPMINDh1+Yujpl6YEXhD6uZSB1naXITqpMaQgwiP75jlQ0xkM1WXfauyzNvxFFdT7u0ZM06FCAdYCgc6dxEphzGb5UqkmaWW5Kelp5rrcl7kjqNVNs2KfLmnuKFFfu1YtIUQMtzgZsnISWGkz7vwXp01YyI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343902; c=relaxed/simple;
	bh=AsYIR0TMuqmnHJlOa98INfMwDuF0vz8Wl8bnQOlXy60=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LvY6apl8HB0Wi5UBtjebtbp1JvSEDk/TS0Fibcsx9nl6/ARiXWiQng2e4g1peQIk3N482Mj/ggdmXwluuFYICSYUrUN7GkoOekwUp+fejt2fktV6uf3nvCnsBZ208UxdqrN3AHU1Ur/BpitsdOuhzPtUpaAM9RMyklUaF7tjHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsPYZUF9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsPYZUF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780343901; x=1811879901;
  h=date:from:to:cc:subject:message-id;
  bh=AsYIR0TMuqmnHJlOa98INfMwDuF0vz8Wl8bnQOlXy60=;
  b=GsPYZUF9oKlMlCN6kcxcRtrevzsq0ZqlIRMBNB7GZFUCtagOJNKJUrnB
   ShFVt+R4yuO/fyf+nO5Jfg2TvyUGoeAFyM6PCS8RKsAeewqlsW8RhDuhH
   bsvsf/G9hXJyNxjDs8L/UTc/RElHSX5hUxCF2Ichc+h4lvslJDfnggNKs
   QjLkrqDSxl7/HeaYk5skz/RwgKkKkiUgeQ0pbbFVpr3LIvL2+8wl78EWO
   mlQbiUw+piYjSVSP25DrpyJiq5CBmF8/M2zGj/QKGfwg3RztlYBw2a75g
   HLA26Rcf5VemcUjIiN+cEollIAq/Ec3pXuJFx9jBAqxo3ngou4T5J0LP4
   w==;
X-CSE-ConnectionGUID: 4bcOZ3mRQqaGRbYIYVh3og==
X-CSE-MsgGUID: vWRDtVsuRn6cNPRWoCzYhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80256581"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80256581"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:58:21 -0700
X-CSE-ConnectionGUID: oh+XTNqsQd6FnDGT6IYBJg==
X-CSE-MsgGUID: 9UinY2GHQXW/nUM06UBriQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243774361"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jun 2026 12:58:20 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU8m8-00000000B2A-3SG3;
	Mon, 01 Jun 2026 19:58:16 +0000
Date: Tue, 02 Jun 2026 03:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8735/9870] lib/crc/crc64-neon.c:22
 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'
Message-ID: <202606020347.dVghkfIx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 061cef5fcee5a4bbaa8726f8c5fc1d5e2f89bff7 [8735/9870] lib/crc: Turn NEON intrinsics crc64 implementation into common code
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r073-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020347.dVghkfIx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606020347.dVghkfIx-lkp@intel.com/

New smatch warnings:
lib/crc/crc64-neon.c:22 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'

Old smatch warnings:
lib/crc/crc64-neon.c:23 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'
lib/crc/crc64-neon.c:24 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'
lib/crc/crc64-neon.c:41 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'
lib/crc/crc64-neon.c:42 crc64_nvme_neon() warn: statement has no effect 'uint64x2_t'

vim +/uint64x2_t +22 lib/crc/crc64-neon.c

63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  12  
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  13  /* x^191 mod G, x^127 mod G */
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  14  static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  15  					0x21e9761e252621acULL };
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  16  /* floor(x^127 / G), (G - x^64) / x */
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  17  static const u64 bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  18  				    0x34d926535897936aULL };
63432fd625372a lib/crc/arm64/crc64-neon-inner.c Demian Shulhan 2026-03-29  19  
061cef5fcee5a4 lib/crc/crc64-neon.c             Ard Biesheuvel 2026-04-22  20  u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30  21  {
8fdef85d601db6 lib/crc/arm64/crc64-neon-inner.c Ard Biesheuvel 2026-03-30 @22  	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);

:::::: The code at line 22 was first introduced by commit
:::::: 8fdef85d601db670e9c178314eedffe7bbb07e52 lib/crc: arm64: Simplify intrinsics implementation

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
