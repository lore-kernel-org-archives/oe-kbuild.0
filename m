Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17902E5B0D
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 13:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015253; cv=none; b=J4+4UtjyuwfiblW+rPQv50/9l3DLgpAyqLaOZnoverm6RsZ2hkSzONQj1YBu3eaUbewMfTli7/9B81cVHrae9D3Vxn4KDbL0FXpp/beLHZmPoa28Cll8oJC9p4HDkV6vlm60VH1NDroP+8lI/UnGJb3T1tdAf9pkbEqTpV1nCcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015253; c=relaxed/simple;
	bh=uNYeVSF69LK1Z2YCClCxdJlXAYFg0MkVT2TqToHCT+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=he8bJM5C69DQU1QDKjX0s6RBZ78amii1x2n1J/RZ7pPt7hGwzCBEkNd0tcL+ZhP2nXsFMQujzknUbozGbaZ4wfY2dTtXVs/5b28DTjghGE9O6c5hCDvSL323m//K/dFbyQuBc6UmSSq5vs3oEFFP6SBq4bE3MHMcPrVJa5I+y+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htAYrmAi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htAYrmAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760015252; x=1791551252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uNYeVSF69LK1Z2YCClCxdJlXAYFg0MkVT2TqToHCT+o=;
  b=htAYrmAi/3KSprgkiL8s/X/gkOZdlgUzCSJl4OWkm+l+311Wd0slUUSd
   TrKeRQxilZT+g5hT50H31Ui48j7lV1zmtR4C7kbTdK7q+wlQJTYKSFcO0
   ey7wiB+ORDF285ATjbfYbXx4jJyOHhmvl3hbmYKHQRPMHbGP/PppKX+ru
   4XuWhKRzxSuqNBl/lslCSS/GFUyEGHpQwZ+f6nH1EwNAHJR2sGUeTcgo4
   71cleP+q1RazFwt3GRHyxngmbeY04FHybL4/uVjtZfdbftO/lPRvsXoVa
   t8TyA9sU7U0h0HdcR04/aTwNwd5QQgES1Z+Oxnf06ipkCQMZEOmN5UnF+
   g==;
X-CSE-ConnectionGUID: kRrZdugKSVKwc9Ys9+Is3w==
X-CSE-MsgGUID: Byr9okQKQx2cJEH7pDp55w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62164536"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62164536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 06:07:31 -0700
X-CSE-ConnectionGUID: 4CUTS79oTDesojR5q6oz7A==
X-CSE-MsgGUID: Ez3v91+TRoWMoFsriCAhuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="185837751"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2025 06:07:30 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6qMh-0000ix-2N;
	Thu, 09 Oct 2025 13:07:27 +0000
Date: Thu, 9 Oct 2025 21:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: we never
 enter this loop
Message-ID: <202510092154.6cn2xGth-lkp@intel.com>
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
TO: Eric Biggers <ebiggers@google.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec714e371f22f716a04e6ecb2a24988c92b26911
commit: ac90aad0e9bf7c37e706fdc08ce763a553890bdf crypto: testmgr - reinstate kconfig control over full self-tests
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: alpha-randconfig-r071-20251009 (https://download.01.org/0day-ci/archive/20251009/202510092154.6cn2xGth-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510092154.6cn2xGth-lkp@intel.com/

smatch warnings:
crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: we never enter this loop
crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn: we never enter this loop
crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2564 test_aead_vs_generic_impl() warn: we never enter this loop
crypto/testmgr.c:2564 test_aead_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2564 test_aead_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:3175 test_skcipher_vs_generic_impl() warn: we never enter this loop
crypto/testmgr.c:3175 test_skcipher_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:3175 test_skcipher_vs_generic_impl() warn: unsigned 'i' is never less than zero.

vim +1847 crypto/testmgr.c

9a8a6b3f0950c0d Eric Biggers  2019-04-11  1748  
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1749  /*
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1750   * Test the hash algorithm represented by @req against the corresponding generic
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1751   * implementation, if one is available.
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1752   */
79cafe9a8b16f7a Eric Biggers  2020-10-26  1753  static int test_hash_vs_generic_impl(const char *generic_driver,
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1754  				     unsigned int maxkeysize,
9764d5b0cd0ea48 Herbert Xu    2025-03-30  1755  				     struct ahash_request *req,
d8ea98aa3cd4646 Eric Biggers  2019-05-28  1756  				     struct shash_desc *desc,
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1757  				     struct test_sglist *tsgl,
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1758  				     u8 *hashstate)
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1759  {
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1760  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1761  	const unsigned int digestsize = crypto_ahash_digestsize(tfm);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1762  	const unsigned int blocksize = crypto_ahash_blocksize(tfm);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1763  	const unsigned int maxdatasize = (2 * PAGE_SIZE) - TESTMGR_POISON_LEN;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1764  	const char *algname = crypto_hash_alg_common(tfm)->base.cra_name;
79cafe9a8b16f7a Eric Biggers  2020-10-26  1765  	const char *driver = crypto_ahash_driver_name(tfm);
f900fde28883602 Eric Biggers  2023-02-27  1766  	struct rnd_state rng;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1767  	char _generic_driver[CRYPTO_MAX_ALG_NAME];
c2a813545ed4810 Herbert Xu    2025-05-15  1768  	struct ahash_request *generic_req = NULL;
c2a813545ed4810 Herbert Xu    2025-05-15  1769  	struct crypto_ahash *generic_tfm = NULL;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1770  	unsigned int i;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1771  	struct hash_testvec vec = { 0 };
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1772  	char vec_name[64];
6b5ca646ca9d996 Arnd Bergmann 2019-06-18  1773  	struct testvec_config *cfg;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1774  	char cfgname[TESTVEC_CONFIG_NAMELEN];
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1775  	int err;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1776  
42e45119efba924 Eric Biggers  2025-05-05  1777  	if (noslowtests)
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1778  		return 0;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1779  
f900fde28883602 Eric Biggers  2023-02-27  1780  	init_rnd_state(&rng);
f900fde28883602 Eric Biggers  2023-02-27  1781  
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1782  	if (!generic_driver) { /* Use default naming convention? */
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1783  		err = build_generic_driver_name(algname, _generic_driver);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1784  		if (err)
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1785  			return err;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1786  		generic_driver = _generic_driver;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1787  	}
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1788  
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1789  	if (strcmp(generic_driver, driver) == 0) /* Already the generic impl? */
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1790  		return 0;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1791  
c2a813545ed4810 Herbert Xu    2025-05-15  1792  	generic_tfm = crypto_alloc_ahash(generic_driver, 0, 0);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1793  	if (IS_ERR(generic_tfm)) {
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1794  		err = PTR_ERR(generic_tfm);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1795  		if (err == -ENOENT) {
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1796  			pr_warn("alg: hash: skipping comparison tests for %s because %s is unavailable\n",
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1797  				driver, generic_driver);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1798  			return 0;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1799  		}
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1800  		pr_err("alg: hash: error allocating %s (generic impl of %s): %d\n",
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1801  		       generic_driver, algname, err);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1802  		return err;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1803  	}
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1804  
6b5ca646ca9d996 Arnd Bergmann 2019-06-18  1805  	cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
6b5ca646ca9d996 Arnd Bergmann 2019-06-18  1806  	if (!cfg) {
6b5ca646ca9d996 Arnd Bergmann 2019-06-18  1807  		err = -ENOMEM;
6b5ca646ca9d996 Arnd Bergmann 2019-06-18  1808  		goto out;
6b5ca646ca9d996 Arnd Bergmann 2019-06-18  1809  	}
6b5ca646ca9d996 Arnd Bergmann 2019-06-18  1810  
c2a813545ed4810 Herbert Xu    2025-05-15  1811  	generic_req = ahash_request_alloc(generic_tfm, GFP_KERNEL);
c2a813545ed4810 Herbert Xu    2025-05-15  1812  	if (!generic_req) {
149c4e6ef7788d5 Arnd Bergmann 2019-06-18  1813  		err = -ENOMEM;
149c4e6ef7788d5 Arnd Bergmann 2019-06-18  1814  		goto out;
149c4e6ef7788d5 Arnd Bergmann 2019-06-18  1815  	}
149c4e6ef7788d5 Arnd Bergmann 2019-06-18  1816  
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1817  	/* Check the algorithm properties for consistency. */
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1818  
c2a813545ed4810 Herbert Xu    2025-05-15  1819  	if (digestsize != crypto_ahash_digestsize(generic_tfm)) {
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1820  		pr_err("alg: hash: digestsize for %s (%u) doesn't match generic impl (%u)\n",
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1821  		       driver, digestsize,
c2a813545ed4810 Herbert Xu    2025-05-15  1822  		       crypto_ahash_digestsize(generic_tfm));
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1823  		err = -EINVAL;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1824  		goto out;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1825  	}
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1826  
c2a813545ed4810 Herbert Xu    2025-05-15  1827  	if (blocksize != crypto_ahash_blocksize(generic_tfm)) {
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1828  		pr_err("alg: hash: blocksize for %s (%u) doesn't match generic impl (%u)\n",
c2a813545ed4810 Herbert Xu    2025-05-15  1829  		       driver, blocksize, crypto_ahash_blocksize(generic_tfm));
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1830  		err = -EINVAL;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1831  		goto out;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1832  	}
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1833  
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1834  	/*
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1835  	 * Now generate test vectors using the generic implementation, and test
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1836  	 * the other implementation against them.
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1837  	 */
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1838  
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1839  	vec.key = kmalloc(maxkeysize, GFP_KERNEL);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1840  	vec.plaintext = kmalloc(maxdatasize, GFP_KERNEL);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1841  	vec.digest = kmalloc(digestsize, GFP_KERNEL);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1842  	if (!vec.key || !vec.plaintext || !vec.digest) {
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1843  		err = -ENOMEM;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1844  		goto out;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1845  	}
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1846  
9a8a6b3f0950c0d Eric Biggers  2019-04-11 @1847  	for (i = 0; i < fuzz_iterations * 8; i++) {
c2a813545ed4810 Herbert Xu    2025-05-15  1848  		generate_random_hash_testvec(&rng, generic_req, &vec,
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1849  					     maxkeysize, maxdatasize,
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1850  					     vec_name, sizeof(vec_name));
f900fde28883602 Eric Biggers  2023-02-27  1851  		generate_random_testvec_config(&rng, cfg, cfgname,
f900fde28883602 Eric Biggers  2023-02-27  1852  					       sizeof(cfgname));
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1853  
79cafe9a8b16f7a Eric Biggers  2020-10-26  1854  		err = test_hash_vec_cfg(&vec, vec_name, cfg,
9764d5b0cd0ea48 Herbert Xu    2025-03-30  1855  					req, desc, tsgl, hashstate);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1856  		if (err)
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1857  			goto out;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1858  		cond_resched();
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1859  	}
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1860  	err = 0;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1861  out:
6b5ca646ca9d996 Arnd Bergmann 2019-06-18  1862  	kfree(cfg);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1863  	kfree(vec.key);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1864  	kfree(vec.plaintext);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1865  	kfree(vec.digest);
c2a813545ed4810 Herbert Xu    2025-05-15  1866  	ahash_request_free(generic_req);
c2a813545ed4810 Herbert Xu    2025-05-15  1867  	crypto_free_ahash(generic_tfm);
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1868  	return err;
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1869  }
9a8a6b3f0950c0d Eric Biggers  2019-04-11  1870  

:::::: The code at line 1847 was first introduced by commit
:::::: 9a8a6b3f0950c0df220b684b686c26a902cfcf1a crypto: testmgr - fuzz hashes against their generic implementation

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
