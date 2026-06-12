Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CCB3624D4
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 21:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298329; cv=none; b=cOvHc7jt1e894qQqaxENEyV+6cDq3QoCJL7+Rk43EgjY/ZCjxyta/b7PGnNBKHGKcMP9yqqDCeutKaZzCuf1Utc2xK7pvsT8YVO5LMmLenOH4lKwIlDkaJxErJawJQeA3xp05c+NqpsEnZhhvhol1vPrbZuB5x0uZHBfcEG/dwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298329; c=relaxed/simple;
	bh=CW5DpGiT2ujjb5x+VUph14sQPJ/buE7SwSHQm5X/u/o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h+HIyGps3P1DOzgqIejOleHeCOj+baDbMw5F+po9cNk9e39mq923FikqUXvkSL1Fis80WaDPb647oPPd3OWdu9G0jGT6tsrjni2EcBVt5Kg/9GMW0JnpUvRGII1ClJVy2FlEzf32e4v+obkIBGVXrYGYu1z8/LeXmZNc8/JxY9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wfr/rTJg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wfr/rTJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298327; x=1812834327;
  h=date:from:to:cc:subject:message-id;
  bh=CW5DpGiT2ujjb5x+VUph14sQPJ/buE7SwSHQm5X/u/o=;
  b=Wfr/rTJgsan088R8NvRGy7zBylvBaSdL5C0uhZOX3bMhxf/Q4qsx6hdy
   70X/YhIHHR6rIjIkbIJOKSz2JHUzr30q4a/70alPqQjgYrl9vkMM+36WG
   xohsGDeAHVLzvRWe0v5Ez8N3XkG+CeC53JadjykSLQ4PeXlJv1DaEdGNz
   aLtmQurCPhlRrcwEYBYpYSSIDpihq59v6Mbc+jTLhgNJwW/cR9MoxH2qc
   PQieVM48gbQDW4gONbTC4UohwuIOeY4I1ZeT8vqzgTAp8QSNSron2TEDf
   +f+Z/JnJO0WHwAMiuQYlZJNUnoi8/R7cdNDqrWakRUYiXvE+cDfHkQT17
   Q==;
X-CSE-ConnectionGUID: PqoxyrWvQxG58GhJ+8YRgg==
X-CSE-MsgGUID: HnvWKneFSRel5o/fuLckkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99714732"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="99714732"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:05:27 -0700
X-CSE-ConnectionGUID: z1t5t8C5QvqsIVfomcK2Sg==
X-CSE-MsgGUID: P2XENcLmRqmetRFUIRNWIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="277114737"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2026 14:05:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY947-00000000PKD-0Ekz;
	Fri, 12 Jun 2026 21:05:23 +0000
Date: Sat, 13 Jun 2026 05:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/intel/qat/qat_common/qat_algs.c:127
 qat_alg_do_precomputes() error: buffer overflow 'hash->sha.state1' 64 <= 64
Message-ID: <202606130433.G4GtPpmV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 408cf4850f640f08470450569c209dc3fdfaf12d crypto: qat - Use library to prepare HMAC keys
date:   9 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20260611 (https://download.01.org/0day-ci/archive/20260613/202606130433.G4GtPpmV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 408cf4850f64 ("crypto: qat - Use library to prepare HMAC keys")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606130433.G4GtPpmV-lkp@intel.com/

smatch warnings:
drivers/crypto/intel/qat/qat_common/qat_algs.c:127 qat_alg_do_precomputes() error: buffer overflow 'hash->sha.state1' 64 <= 64

vim +127 drivers/crypto/intel/qat/qat_common/qat_algs.c

d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05   88  
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05   89  static int qat_alg_do_precomputes(struct icp_qat_hw_auth_algo_blk *hash,
338e84f3a9740ab drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-12-08   90  				  struct qat_alg_aead_ctx *ctx,
2bfd22766d00410 drivers/crypto/qat/qat_common/qat_algs.c       Wojciech Ziemba 2020-06-03   91  				  const u8 *auth_key,
26c3af6c1580a0a drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-09-10   92  				  unsigned int auth_keylen)
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05   93  {
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   94  	switch (ctx->qat_hash_alg) {
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   95  	case ICP_QAT_HW_AUTH_ALGO_SHA1: {
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   96  		struct hmac_sha1_key key;
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   97  		__be32 *istate = (__be32 *)hash->sha.state1;
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   98  		__be32 *ostate = (__be32 *)(hash->sha.state1 +
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   99  					    round_up(sizeof(key.istate.h), 8));
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  100  
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  101  		hmac_sha1_preparekey(&key, auth_key, auth_keylen);
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  102  		for (int i = 0; i < ARRAY_SIZE(key.istate.h); i++) {
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  103  			istate[i] = cpu_to_be32(key.istate.h[i]);
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  104  			ostate[i] = cpu_to_be32(key.ostate.h[i]);
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  105  		}
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  106  		memzero_explicit(&key, sizeof(key));
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  107  		return 0;
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  108  	}
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  109  	case ICP_QAT_HW_AUTH_ALGO_SHA256: {
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  110  		struct hmac_sha256_key key;
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  111  		__be32 *istate = (__be32 *)hash->sha.state1;
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  112  		__be32 *ostate = (__be32 *)(hash->sha.state1 +
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  113  					    sizeof(key.key.istate.h));
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  114  
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  115  		hmac_sha256_preparekey(&key, auth_key, auth_keylen);
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  116  		for (int i = 0; i < ARRAY_SIZE(key.key.istate.h); i++) {
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  117  			istate[i] = cpu_to_be32(key.key.istate.h[i]);
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  118  			ostate[i] = cpu_to_be32(key.key.ostate.h[i]);
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  119  		}
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  120  		memzero_explicit(&key, sizeof(key));
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  121  		return 0;
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  122  	}
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  123  	case ICP_QAT_HW_AUTH_ALGO_SHA512: {
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  124  		struct hmac_sha512_key key;
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  125  		__be64 *istate = (__be64 *)hash->sha.state1;
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  126  		__be64 *ostate = (__be64 *)(hash->sha.state1 +
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04 @127  					    sizeof(key.key.istate.h));
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  128  
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  129  		hmac_sha512_preparekey(&key, auth_key, auth_keylen);
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  130  		for (int i = 0; i < ARRAY_SIZE(key.key.istate.h); i++) {
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  131  			istate[i] = cpu_to_be64(key.key.istate.h[i]);
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  132  			ostate[i] = cpu_to_be64(key.key.ostate.h[i]);
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  133  		}
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  134  		memzero_explicit(&key, sizeof(key));
408cf4850f640f0 drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  135  		return 0;
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  136  	}
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  137  	default:
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  138  		return -EFAULT;
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  139  	}
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  140  }
d370cec32194906 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  141  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
