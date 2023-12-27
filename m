Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C0347F56
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Dec 2023 19:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dM8Yn47L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703703669; x=1735239669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ytgLjYKJbz89d7VWBH6HL3zz93avrJHflv6pqyM6AaE=;
  b=dM8Yn47Lp++aXb7Orq8p2boEAg7UzZxpeRqzsgP3K1NiNNBD880k3+gD
   YA7o7/sAhHW4t7MMJQQYCUZUQKP0Lf5WZ+0fF9qU0SBG08hrI2NQC9P3M
   ubVi3e4An4WDd0Dclmb3L42LH2F8e/mPtHJXQi1+RBMTEpL7ZuDgSlbvA
   HQCt6P5KblrpBirMkXMreB1cwot3BghuEp26xyE+CVT3dHEjOcOQ1cJeM
   Ro/ikqX8KjsfFHjpSiOsheZNUmR5gokm5S16RghlUYIQob8d1bt92gDcS
   OJh5yv+tz3C+hwIGdaUdvEbxtct8GdshKcdhz5Y/hRQTmNwLJKSuKGrk1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="375965674"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="375965674"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 11:01:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="12785006"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Dec 2023 11:01:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIZ9L-000Fgb-1M;
	Wed, 27 Dec 2023 19:01:03 +0000
Date: Thu, 28 Dec 2023 03:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:crypto-krb5 6/21] crypto/krb5/kdf.c:116
 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
Message-ID: <202312280208.kXOfvCcb-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   ebd44e15422341724b06a3a13590ea80244ebbd6
commit: b468b20c76d24a3eee1e29352769251daae938f9 [6/21] crypto/krb5: Provide infrastructure and key derivation
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231228/202312280208.kXOfvCcb-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312280208.kXOfvCcb-lkp@intel.com/

smatch warnings:
crypto/krb5/kdf.c:116 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
crypto/krb5/kdf.c:161 crypto_krb5_get_Ke() error: buffer overflow 'buf' 4 <= 4
crypto/krb5/kdf.c:206 crypto_krb5_get_Ki() error: buffer overflow 'buf' 4 <= 4

vim +/buf +116 crypto/krb5/kdf.c

b468b20c76d24a David Howells 2020-09-03   89  
b468b20c76d24a David Howells 2020-09-03   90  /**
b468b20c76d24a David Howells 2020-09-03   91   * crypto_krb5_get_Kc - Derive key Kc and install into a hash
b468b20c76d24a David Howells 2020-09-03   92   * @krb5: The encryption type to use
b468b20c76d24a David Howells 2020-09-03   93   * @TK: The base key
b468b20c76d24a David Howells 2020-09-03   94   * @usage: The key usage number
b468b20c76d24a David Howells 2020-09-03   95   * @key: Prepped buffer to store the key into
b468b20c76d24a David Howells 2020-09-03   96   * @_shash: Where to put the hash (or NULL if not wanted)
b468b20c76d24a David Howells 2020-09-03   97   * @gfp: Allocation restrictions
b468b20c76d24a David Howells 2020-09-03   98   *
b468b20c76d24a David Howells 2020-09-03   99   * Derive the Kerberos Kc checksumming key and, optionally, allocate a hash and
b468b20c76d24a David Howells 2020-09-03  100   * install the key into it, returning the hash.  The key is stored into the
b468b20c76d24a David Howells 2020-09-03  101   * prepared buffer.
b468b20c76d24a David Howells 2020-09-03  102   */
b468b20c76d24a David Howells 2020-09-03  103  int crypto_krb5_get_Kc(const struct krb5_enctype *krb5,
b468b20c76d24a David Howells 2020-09-03  104  		       const struct krb5_buffer *TK,
b468b20c76d24a David Howells 2020-09-03  105  		       u32 usage,
b468b20c76d24a David Howells 2020-09-03  106  		       struct krb5_buffer *key,
b468b20c76d24a David Howells 2020-09-03  107  		       struct crypto_shash **_shash,
b468b20c76d24a David Howells 2020-09-03  108  		       gfp_t gfp)
b468b20c76d24a David Howells 2020-09-03  109  {
b468b20c76d24a David Howells 2020-09-03  110  	struct crypto_shash *shash;
b468b20c76d24a David Howells 2020-09-03  111  	int ret;
b468b20c76d24a David Howells 2020-09-03  112  	u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
b468b20c76d24a David Howells 2020-09-03  113  	struct krb5_buffer usage_constant = { .len = 5, .data = buf };
b468b20c76d24a David Howells 2020-09-03  114  
b468b20c76d24a David Howells 2020-09-03  115  	*(__be32 *)buf = cpu_to_be32(usage);
b468b20c76d24a David Howells 2020-09-03 @116  	buf[4] = KEY_USAGE_SEED_CHECKSUM;
b468b20c76d24a David Howells 2020-09-03  117  
b468b20c76d24a David Howells 2020-09-03  118  	key->len = krb5->Kc_len;
b468b20c76d24a David Howells 2020-09-03  119  	ret = krb5->profile->calc_Kc(krb5, TK, &usage_constant, key, gfp);
b468b20c76d24a David Howells 2020-09-03  120  	if (ret < 0)
b468b20c76d24a David Howells 2020-09-03  121  		return ret;
b468b20c76d24a David Howells 2020-09-03  122  
b468b20c76d24a David Howells 2020-09-03  123  	if (_shash) {
b468b20c76d24a David Howells 2020-09-03  124  		shash = crypto_alloc_shash(krb5->cksum_name, 0, 0);
b468b20c76d24a David Howells 2020-09-03  125  		if (IS_ERR(shash))
b468b20c76d24a David Howells 2020-09-03  126  			return (PTR_ERR(shash) == -ENOENT) ? -ENOPKG : PTR_ERR(shash);
b468b20c76d24a David Howells 2020-09-03  127  		*_shash = shash;
b468b20c76d24a David Howells 2020-09-03  128  		ret = crypto_shash_setkey(shash, key->data, key->len);
b468b20c76d24a David Howells 2020-09-03  129  	}
b468b20c76d24a David Howells 2020-09-03  130  
b468b20c76d24a David Howells 2020-09-03  131  	return ret;
b468b20c76d24a David Howells 2020-09-03  132  }
b468b20c76d24a David Howells 2020-09-03  133  EXPORT_SYMBOL(crypto_krb5_get_Kc);
b468b20c76d24a David Howells 2020-09-03  134  
b468b20c76d24a David Howells 2020-09-03  135  /**
b468b20c76d24a David Howells 2020-09-03  136   * crypto_krb5_get_Ke - Derive key Ke and install into an skcipher
b468b20c76d24a David Howells 2020-09-03  137   * @krb5: The encryption type to use
b468b20c76d24a David Howells 2020-09-03  138   * @TK: The base key
b468b20c76d24a David Howells 2020-09-03  139   * @usage: The key usage number
b468b20c76d24a David Howells 2020-09-03  140   * @key: Prepped buffer to store the key into
b468b20c76d24a David Howells 2020-09-03  141   * @_ci: Where to put the cipher (or NULL if not wanted)
b468b20c76d24a David Howells 2020-09-03  142   * @gfp: Allocation restrictions
b468b20c76d24a David Howells 2020-09-03  143   *
b468b20c76d24a David Howells 2020-09-03  144   * Derive the Kerberos Ke encryption key and, optionally, allocate an skcipher
b468b20c76d24a David Howells 2020-09-03  145   * and install the key into it, returning the cipher.  The key is stored into
b468b20c76d24a David Howells 2020-09-03  146   * the prepared buffer.
b468b20c76d24a David Howells 2020-09-03  147   */
b468b20c76d24a David Howells 2020-09-03  148  int crypto_krb5_get_Ke(const struct krb5_enctype *krb5,
b468b20c76d24a David Howells 2020-09-03  149  		       const struct krb5_buffer *TK,
b468b20c76d24a David Howells 2020-09-03  150  		       u32 usage,
b468b20c76d24a David Howells 2020-09-03  151  		       struct krb5_buffer *key,
b468b20c76d24a David Howells 2020-09-03  152  		       struct crypto_sync_skcipher **_ci,
b468b20c76d24a David Howells 2020-09-03  153  		       gfp_t gfp)
b468b20c76d24a David Howells 2020-09-03  154  {
b468b20c76d24a David Howells 2020-09-03  155  	struct crypto_sync_skcipher *ci;
b468b20c76d24a David Howells 2020-09-03  156  	int ret;
b468b20c76d24a David Howells 2020-09-03  157  	u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
b468b20c76d24a David Howells 2020-09-03  158  	struct krb5_buffer usage_constant = { .len = 5, .data = buf };
b468b20c76d24a David Howells 2020-09-03  159  
b468b20c76d24a David Howells 2020-09-03  160  	*(__be32 *)buf = cpu_to_be32(usage);
b468b20c76d24a David Howells 2020-09-03 @161  	buf[4] = KEY_USAGE_SEED_ENCRYPTION;
b468b20c76d24a David Howells 2020-09-03  162  
b468b20c76d24a David Howells 2020-09-03  163  	key->len = krb5->Ke_len;
b468b20c76d24a David Howells 2020-09-03  164  	ret = krb5->profile->calc_Ke(krb5, TK, &usage_constant, key, gfp);
b468b20c76d24a David Howells 2020-09-03  165  	if (ret < 0)
b468b20c76d24a David Howells 2020-09-03  166  		return ret;
b468b20c76d24a David Howells 2020-09-03  167  
b468b20c76d24a David Howells 2020-09-03  168  	if (_ci) {
b468b20c76d24a David Howells 2020-09-03  169  		ci = crypto_alloc_sync_skcipher(krb5->encrypt_name, 0, 0);
b468b20c76d24a David Howells 2020-09-03  170  		if (IS_ERR(ci))
b468b20c76d24a David Howells 2020-09-03  171  			return (PTR_ERR(ci) == -ENOENT) ? -ENOPKG : PTR_ERR(ci);
b468b20c76d24a David Howells 2020-09-03  172  		*_ci = ci;
b468b20c76d24a David Howells 2020-09-03  173  		ret = crypto_sync_skcipher_setkey(ci, key->data, key->len);
b468b20c76d24a David Howells 2020-09-03  174  	}
b468b20c76d24a David Howells 2020-09-03  175  
b468b20c76d24a David Howells 2020-09-03  176  	return ret;
b468b20c76d24a David Howells 2020-09-03  177  }
b468b20c76d24a David Howells 2020-09-03  178  EXPORT_SYMBOL(crypto_krb5_get_Ke);
b468b20c76d24a David Howells 2020-09-03  179  
b468b20c76d24a David Howells 2020-09-03  180  /**
b468b20c76d24a David Howells 2020-09-03  181   * crypto_krb5_get_Ki - Derive key Ki and install into a hash
b468b20c76d24a David Howells 2020-09-03  182   * @krb5: The encryption type to use
b468b20c76d24a David Howells 2020-09-03  183   * @TK: The base key
b468b20c76d24a David Howells 2020-09-03  184   * @usage: The key usage number
b468b20c76d24a David Howells 2020-09-03  185   * @key: Prepped buffer to store the key into
b468b20c76d24a David Howells 2020-09-03  186   * @_shash: Where to put the hash (or NULL if not wanted)
b468b20c76d24a David Howells 2020-09-03  187   * @gfp: Allocation restrictions
b468b20c76d24a David Howells 2020-09-03  188   *
b468b20c76d24a David Howells 2020-09-03  189   * Derive the Kerberos Ki integrity checksum key and, optionally, allocate a
b468b20c76d24a David Howells 2020-09-03  190   * hash and install the key into it, returning the hash.  The key is stored
b468b20c76d24a David Howells 2020-09-03  191   * into the prepared buffer.
b468b20c76d24a David Howells 2020-09-03  192   */
b468b20c76d24a David Howells 2020-09-03  193  int crypto_krb5_get_Ki(const struct krb5_enctype *krb5,
b468b20c76d24a David Howells 2020-09-03  194  		       const struct krb5_buffer *TK,
b468b20c76d24a David Howells 2020-09-03  195  		       u32 usage,
b468b20c76d24a David Howells 2020-09-03  196  		       struct krb5_buffer *key,
b468b20c76d24a David Howells 2020-09-03  197  		       struct crypto_shash **_shash,
b468b20c76d24a David Howells 2020-09-03  198  		       gfp_t gfp)
b468b20c76d24a David Howells 2020-09-03  199  {
b468b20c76d24a David Howells 2020-09-03  200  	struct crypto_shash *shash;
b468b20c76d24a David Howells 2020-09-03  201  	int ret;
b468b20c76d24a David Howells 2020-09-03  202  	u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
b468b20c76d24a David Howells 2020-09-03  203  	struct krb5_buffer usage_constant = { .len = 5, .data = buf };
b468b20c76d24a David Howells 2020-09-03  204  
b468b20c76d24a David Howells 2020-09-03  205  	*(__be32 *)buf = cpu_to_be32(usage);
b468b20c76d24a David Howells 2020-09-03 @206  	buf[4] = KEY_USAGE_SEED_INTEGRITY;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
