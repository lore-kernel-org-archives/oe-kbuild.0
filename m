Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB87A37F8C1
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 23:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777679109; cv=none; b=kgSPOVwM3M4E+E82wgwIqfaqJAW7a+1rmyyvPQagJHloBJuMmkkoZ5BlQjP+RiwJhZ/BuZuIxFKT0L6svE7jlc+1swfaYq+bd9X/w+yZ7uSjMjy2Z8+LeCFZhgTmqAUI8VBJY0R4v0cRc6+XrDJlMO/HlRv4ZhOYZtpkPEQHlPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777679109; c=relaxed/simple;
	bh=Vl4Em1aYJeB+QUlZvSfp8w2IgM1ki8oS3d54ePTCWmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DlSDtiWc6GZ+WgxLwTGRBqK8fMZnC4QWYGYwfjbngNnTGuznSmyP1KWAlq3uymcA3vFOFNfV6t44uhhenxM++bPP14JxJ/acGX/F49ZTYEwX5UMD9rtvZjhyPCvoIEmvyUd49NcYBmvJDvDSaiBOhMB2krm6/zsQFGs6iaeAcDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAn6zoc8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAn6zoc8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777679106; x=1809215106;
  h=date:from:to:cc:subject:message-id;
  bh=Vl4Em1aYJeB+QUlZvSfp8w2IgM1ki8oS3d54ePTCWmw=;
  b=KAn6zoc8ALWs9dfbi36DDOrNJCpyVCFlmK6wWPe6vbU/Ysza25kuWgPD
   40iOYSRqujNJyhZEBaAA2Y5vrBdpIneprT7x18K4dmsWl6s2DafF58sGM
   a3S7Oiy6K0GcP3v0FFi/njvPUitPae+uAjqrWA99+0WkH4H8hw5xYKSu8
   0XgHLu0h6+6t9mTfTJuroSch+qqT2qmIMYt45lsac5KULG888QrmIEG5i
   OcOs7ZQG8u8MNevGL0ZgniLrwGUZhjeuJp1U1wwOIgrOcKqQVOQPz2uV1
   rxKGt+G9iOEmmxpl1Qlj3TtwFIlz/ibVvNiYMosI1jCDDsSFKrigZkzHU
   A==;
X-CSE-ConnectionGUID: AoHy51YWSjigbUAGyzV4eA==
X-CSE-MsgGUID: xuLfabe9TTOixehQ/UlWNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="82509747"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="82509747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:45:05 -0700
X-CSE-ConnectionGUID: P9ptpPm+R4yF3O5jgL/CyQ==
X-CSE-MsgGUID: Zp9Gpf1HQTizQUimzCHA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="236769891"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2026 16:45:03 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIxXY-000000000xX-3hM0;
	Fri, 01 May 2026 23:45:00 +0000
Date: Sat, 02 May 2026 07:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: we
 never enter this loop
Message-ID: <202605020752.jIIJtYx7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef5f46b630235b75beec43174348c3d01d6fc49a
commit: ac90aad0e9bf7c37e706fdc08ce763a553890bdf crypto: testmgr - reinstate kconfig control over full self-tests
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-r071-20260502 (https://download.01.org/0day-ci/archive/20260502/202605020752.jIIJtYx7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ac90aad0e9bf ("crypto: testmgr - reinstate kconfig control over full self-tests")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605020752.jIIJtYx7-lkp@intel.com/

New smatch warnings:
crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: we never enter this loop
crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn: we never enter this loop
crypto/testmgr.c:3175 test_skcipher_vs_generic_impl() warn: we never enter this loop
crypto/testmgr.c:3175 test_skcipher_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:3175 test_skcipher_vs_generic_impl() warn: unsigned 'i' is never less than zero.

Old smatch warnings:
crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2564 test_aead_vs_generic_impl() warn: we never enter this loop
crypto/testmgr.c:2564 test_aead_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2564 test_aead_vs_generic_impl() warn: unsigned 'i' is never less than zero.

vim +1847 crypto/testmgr.c

9a8a6b3f0950c0 Eric Biggers  2019-04-11  1748  
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1749  /*
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1750   * Test the hash algorithm represented by @req against the corresponding generic
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1751   * implementation, if one is available.
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1752   */
79cafe9a8b16f7 Eric Biggers  2020-10-26  1753  static int test_hash_vs_generic_impl(const char *generic_driver,
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1754  				     unsigned int maxkeysize,
9764d5b0cd0ea4 Herbert Xu    2025-03-30  1755  				     struct ahash_request *req,
d8ea98aa3cd464 Eric Biggers  2019-05-28  1756  				     struct shash_desc *desc,
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1757  				     struct test_sglist *tsgl,
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1758  				     u8 *hashstate)
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1759  {
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1760  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1761  	const unsigned int digestsize = crypto_ahash_digestsize(tfm);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1762  	const unsigned int blocksize = crypto_ahash_blocksize(tfm);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1763  	const unsigned int maxdatasize = (2 * PAGE_SIZE) - TESTMGR_POISON_LEN;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1764  	const char *algname = crypto_hash_alg_common(tfm)->base.cra_name;
79cafe9a8b16f7 Eric Biggers  2020-10-26  1765  	const char *driver = crypto_ahash_driver_name(tfm);
f900fde2888360 Eric Biggers  2023-02-27  1766  	struct rnd_state rng;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1767  	char _generic_driver[CRYPTO_MAX_ALG_NAME];
c2a813545ed481 Herbert Xu    2025-05-15  1768  	struct ahash_request *generic_req = NULL;
c2a813545ed481 Herbert Xu    2025-05-15  1769  	struct crypto_ahash *generic_tfm = NULL;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1770  	unsigned int i;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1771  	struct hash_testvec vec = { 0 };
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1772  	char vec_name[64];
6b5ca646ca9d99 Arnd Bergmann 2019-06-18  1773  	struct testvec_config *cfg;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1774  	char cfgname[TESTVEC_CONFIG_NAMELEN];
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1775  	int err;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1776  
42e45119efba92 Eric Biggers  2025-05-05  1777  	if (noslowtests)
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1778  		return 0;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1779  
f900fde2888360 Eric Biggers  2023-02-27  1780  	init_rnd_state(&rng);
f900fde2888360 Eric Biggers  2023-02-27  1781  
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1782  	if (!generic_driver) { /* Use default naming convention? */
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1783  		err = build_generic_driver_name(algname, _generic_driver);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1784  		if (err)
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1785  			return err;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1786  		generic_driver = _generic_driver;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1787  	}
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1788  
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1789  	if (strcmp(generic_driver, driver) == 0) /* Already the generic impl? */
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1790  		return 0;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1791  
c2a813545ed481 Herbert Xu    2025-05-15  1792  	generic_tfm = crypto_alloc_ahash(generic_driver, 0, 0);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1793  	if (IS_ERR(generic_tfm)) {
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1794  		err = PTR_ERR(generic_tfm);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1795  		if (err == -ENOENT) {
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1796  			pr_warn("alg: hash: skipping comparison tests for %s because %s is unavailable\n",
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1797  				driver, generic_driver);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1798  			return 0;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1799  		}
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1800  		pr_err("alg: hash: error allocating %s (generic impl of %s): %d\n",
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1801  		       generic_driver, algname, err);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1802  		return err;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1803  	}
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1804  
6b5ca646ca9d99 Arnd Bergmann 2019-06-18  1805  	cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
6b5ca646ca9d99 Arnd Bergmann 2019-06-18  1806  	if (!cfg) {
6b5ca646ca9d99 Arnd Bergmann 2019-06-18  1807  		err = -ENOMEM;
6b5ca646ca9d99 Arnd Bergmann 2019-06-18  1808  		goto out;
6b5ca646ca9d99 Arnd Bergmann 2019-06-18  1809  	}
6b5ca646ca9d99 Arnd Bergmann 2019-06-18  1810  
c2a813545ed481 Herbert Xu    2025-05-15  1811  	generic_req = ahash_request_alloc(generic_tfm, GFP_KERNEL);
c2a813545ed481 Herbert Xu    2025-05-15  1812  	if (!generic_req) {
149c4e6ef7788d Arnd Bergmann 2019-06-18  1813  		err = -ENOMEM;
149c4e6ef7788d Arnd Bergmann 2019-06-18  1814  		goto out;
149c4e6ef7788d Arnd Bergmann 2019-06-18  1815  	}
149c4e6ef7788d Arnd Bergmann 2019-06-18  1816  
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1817  	/* Check the algorithm properties for consistency. */
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1818  
c2a813545ed481 Herbert Xu    2025-05-15  1819  	if (digestsize != crypto_ahash_digestsize(generic_tfm)) {
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1820  		pr_err("alg: hash: digestsize for %s (%u) doesn't match generic impl (%u)\n",
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1821  		       driver, digestsize,
c2a813545ed481 Herbert Xu    2025-05-15  1822  		       crypto_ahash_digestsize(generic_tfm));
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1823  		err = -EINVAL;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1824  		goto out;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1825  	}
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1826  
c2a813545ed481 Herbert Xu    2025-05-15  1827  	if (blocksize != crypto_ahash_blocksize(generic_tfm)) {
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1828  		pr_err("alg: hash: blocksize for %s (%u) doesn't match generic impl (%u)\n",
c2a813545ed481 Herbert Xu    2025-05-15  1829  		       driver, blocksize, crypto_ahash_blocksize(generic_tfm));
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1830  		err = -EINVAL;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1831  		goto out;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1832  	}
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1833  
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1834  	/*
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1835  	 * Now generate test vectors using the generic implementation, and test
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1836  	 * the other implementation against them.
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1837  	 */
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1838  
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1839  	vec.key = kmalloc(maxkeysize, GFP_KERNEL);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1840  	vec.plaintext = kmalloc(maxdatasize, GFP_KERNEL);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1841  	vec.digest = kmalloc(digestsize, GFP_KERNEL);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1842  	if (!vec.key || !vec.plaintext || !vec.digest) {
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1843  		err = -ENOMEM;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1844  		goto out;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1845  	}
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1846  
9a8a6b3f0950c0 Eric Biggers  2019-04-11 @1847  	for (i = 0; i < fuzz_iterations * 8; i++) {
c2a813545ed481 Herbert Xu    2025-05-15  1848  		generate_random_hash_testvec(&rng, generic_req, &vec,
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1849  					     maxkeysize, maxdatasize,
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1850  					     vec_name, sizeof(vec_name));
f900fde2888360 Eric Biggers  2023-02-27  1851  		generate_random_testvec_config(&rng, cfg, cfgname,
f900fde2888360 Eric Biggers  2023-02-27  1852  					       sizeof(cfgname));
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1853  
79cafe9a8b16f7 Eric Biggers  2020-10-26  1854  		err = test_hash_vec_cfg(&vec, vec_name, cfg,
9764d5b0cd0ea4 Herbert Xu    2025-03-30  1855  					req, desc, tsgl, hashstate);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1856  		if (err)
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1857  			goto out;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1858  		cond_resched();
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1859  	}
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1860  	err = 0;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1861  out:
6b5ca646ca9d99 Arnd Bergmann 2019-06-18  1862  	kfree(cfg);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1863  	kfree(vec.key);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1864  	kfree(vec.plaintext);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1865  	kfree(vec.digest);
c2a813545ed481 Herbert Xu    2025-05-15  1866  	ahash_request_free(generic_req);
c2a813545ed481 Herbert Xu    2025-05-15  1867  	crypto_free_ahash(generic_tfm);
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1868  	return err;
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1869  }
9a8a6b3f0950c0 Eric Biggers  2019-04-11  1870  

:::::: The code at line 1847 was first introduced by commit
:::::: 9a8a6b3f0950c0df220b684b686c26a902cfcf1a crypto: testmgr - fuzz hashes against their generic implementation

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
