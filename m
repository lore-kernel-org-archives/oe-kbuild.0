Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1419D35CBBE
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 13:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976982; cv=none; b=RTfjfvkMYZIQVKzBRzKeobVLEuQegIG2euVg71XsLE74XKTklNBWZyYIV0036rNZ/SBYIcSJp5cLeEYeKlfUj95vu9rqg3hLBpPK7ko4PUnq6+eROTs44bcRkF1WrVjCUZsZXu5XUN8SxHz0QC+I2dFyl0Ju11ZZf0Pie0QDmPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976982; c=relaxed/simple;
	bh=9liJC7+4oBLE2QPoI4aptM95WZ7WlbThyHiCCAp6IrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQ/WFMhmlQtZE2nxYTyH8DvxY7sOEHSoP01AmapztCuUe7c/TAfzwl5u/pU8qUbVzmPKfdQuO9vD5ByO/O3xtwezdw7sYl51PzZnqce6BdZ2LsS3IEnw+r+0wxdSnIhfkXjKKqb1wmrqSA0zvaAsPWlg1A+LHwYMpC5YpGNZ+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7bzOvSn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7bzOvSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765976981; x=1797512981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9liJC7+4oBLE2QPoI4aptM95WZ7WlbThyHiCCAp6IrI=;
  b=j7bzOvSnYGgJ1/IpC5J2rwNdj7I9YWDm5rbchjawlL+776LK9zFiz5Lf
   VKFAcI+xwZOAjBtJPXrJE3oTC0gYVEJ+rvKSqQsaY1Ja1FG8BS64Fo/Yp
   cZEwYdtWbDTf4jZ6+I7THRhLUH5JlqClEPWjT5Sv/MeFRcq4CjiEb8RgI
   9f00iixA0dTngeFSPtnEkDNGDFgxVHCp4KFunUPRkZJPRBv6CSwpPzSHW
   H45Mu7RNubaZWcdBpQQ5Cfp54dpXYnlC5o7sEx+ssG0ac7wC8bOicWswy
   goEDQ1uaYn7YFGNv4UKd42rK6GTA/VfRV6QOeAGHEYZms7R3jG0nEv17t
   A==;
X-CSE-ConnectionGUID: egTXmDuoTE+VK20GuQZtFg==
X-CSE-MsgGUID: cJw+5o+oRQKr+6eSWuJg6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67664360"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="67664360"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 05:09:40 -0800
X-CSE-ConnectionGUID: 3AdkgJicQSqxng+Rd5XKHg==
X-CSE-MsgGUID: U/aW0XBQTmyNVmP9HhVNbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="197403819"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Dec 2025 05:09:39 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVrHc-000000000aP-46Ty;
	Wed, 17 Dec 2025 13:09:36 +0000
Date: Wed, 17 Dec 2025 21:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/intel/qat/qat_common/qat_algs.c:127
 qat_alg_do_precomputes() error: buffer overflow 'hash->sha.state1' 64 <= 64
Message-ID: <202512172137.hTYpXkUM-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 408cf4850f640f08470450569c209dc3fdfaf12d crypto: qat - Use library to prepare HMAC keys
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-r072-20251217 (https://download.01.org/0day-ci/archive/20251217/202512172137.hTYpXkUM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512172137.hTYpXkUM-lkp@intel.com/

smatch warnings:
drivers/crypto/intel/qat/qat_common/qat_algs.c:127 qat_alg_do_precomputes() error: buffer overflow 'hash->sha.state1' 64 <= 64

vim +127 drivers/crypto/intel/qat/qat_common/qat_algs.c

d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05   88  
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05   89  static int qat_alg_do_precomputes(struct icp_qat_hw_auth_algo_blk *hash,
338e84f3a9740a drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-12-08   90  				  struct qat_alg_aead_ctx *ctx,
2bfd22766d0041 drivers/crypto/qat/qat_common/qat_algs.c       Wojciech Ziemba 2020-06-03   91  				  const u8 *auth_key,
26c3af6c1580a0 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-09-10   92  				  unsigned int auth_keylen)
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05   93  {
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   94  	switch (ctx->qat_hash_alg) {
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   95  	case ICP_QAT_HW_AUTH_ALGO_SHA1: {
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   96  		struct hmac_sha1_key key;
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   97  		__be32 *istate = (__be32 *)hash->sha.state1;
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   98  		__be32 *ostate = (__be32 *)(hash->sha.state1 +
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04   99  					    round_up(sizeof(key.istate.h), 8));
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  100  
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  101  		hmac_sha1_preparekey(&key, auth_key, auth_keylen);
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  102  		for (int i = 0; i < ARRAY_SIZE(key.istate.h); i++) {
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  103  			istate[i] = cpu_to_be32(key.istate.h[i]);
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  104  			ostate[i] = cpu_to_be32(key.ostate.h[i]);
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  105  		}
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  106  		memzero_explicit(&key, sizeof(key));
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  107  		return 0;
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  108  	}
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  109  	case ICP_QAT_HW_AUTH_ALGO_SHA256: {
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  110  		struct hmac_sha256_key key;
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  111  		__be32 *istate = (__be32 *)hash->sha.state1;
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  112  		__be32 *ostate = (__be32 *)(hash->sha.state1 +
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  113  					    sizeof(key.key.istate.h));
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  114  
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  115  		hmac_sha256_preparekey(&key, auth_key, auth_keylen);
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  116  		for (int i = 0; i < ARRAY_SIZE(key.key.istate.h); i++) {
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  117  			istate[i] = cpu_to_be32(key.key.istate.h[i]);
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  118  			ostate[i] = cpu_to_be32(key.key.ostate.h[i]);
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  119  		}
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  120  		memzero_explicit(&key, sizeof(key));
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  121  		return 0;
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  122  	}
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  123  	case ICP_QAT_HW_AUTH_ALGO_SHA512: {
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  124  		struct hmac_sha512_key key;
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  125  		__be64 *istate = (__be64 *)hash->sha.state1;
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  126  		__be64 *ostate = (__be64 *)(hash->sha.state1 +
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04 @127  					    sizeof(key.key.istate.h));
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  128  
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  129  		hmac_sha512_preparekey(&key, auth_key, auth_keylen);
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  130  		for (int i = 0; i < ARRAY_SIZE(key.key.istate.h); i++) {
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  131  			istate[i] = cpu_to_be64(key.key.istate.h[i]);
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  132  			ostate[i] = cpu_to_be64(key.key.ostate.h[i]);
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  133  		}
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  134  		memzero_explicit(&key, sizeof(key));
408cf4850f640f drivers/crypto/intel/qat/qat_common/qat_algs.c Eric Biggers    2025-09-04  135  		return 0;
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  136  	}
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  137  	default:
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  138  		return -EFAULT;
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  139  	}
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  140  }
d370cec3219490 drivers/crypto/qat/qat_common/qat_algs.c       Tadeusz Struk   2014-06-05  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
