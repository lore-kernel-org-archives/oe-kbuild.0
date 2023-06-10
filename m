Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D123F1FAE
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686391713; x=1717927713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CMadKlkBabrMkMxA74RyK/1XzUfBiHINyLVmi03h+VA=;
  b=mTR81I/Tsrji1xlIZkjF8sG5y3YJ47Z4GBpkuNB/GPJY4H0zxWEEOGZS
   /iKxD7f3Ao6tYqBMLDX0KTPdHPDeo+MLy1EtVk1WN8U+P1X10Z9M3ES4o
   Sb1GCLwOc2my76wJB28Qe7GLHjitLi4WGZkGqPPVi4IOkIoY1yz5uZ06o
   3uJNf1N6NiCyJMjryyBK+MHf74/0eesIEaJePjPGykXs6JoISzeOEu6AL
   jRRD4S5CiZ+WCXiZNpzbLg5pVI2t9+XDLhm2aQPgIspkBfyfNCn2TglfN
   BGV+KaYEV/BxANi9FkAWlg6alVKczWmSOHL3IyEQ5O9XeR3MALAxCdAzY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361114469"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="361114469"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 03:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="834906293"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="834906293"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Jun 2023 03:08:29 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7vWG-0009zg-2B;
	Sat, 10 Jun 2023 10:08:28 +0000
Date: Sat, 10 Jun 2023 18:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:crypto-krb5 4/19] crypto/krb5/kdf.c:116
 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
Message-ID: <202306101812.yrGNOuqN-lkp@intel.com>
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
head:   5b181cb5852b03279d830e9d98cdc20ae1ca6e8e
commit: 6eb566f6e69de76d49623aa065bae4351343d9da [4/19] crypto/krb5: Provide infrastructure and key derivation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101812.yrGNOuqN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306101812.yrGNOuqN-lkp@intel.com/

smatch warnings:
crypto/krb5/kdf.c:116 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
crypto/krb5/kdf.c:161 crypto_krb5_get_Ke() error: buffer overflow 'buf' 4 <= 4
crypto/krb5/kdf.c:206 crypto_krb5_get_Ki() error: buffer overflow 'buf' 4 <= 4

vim +/buf +116 crypto/krb5/kdf.c

6eb566f6e69de7 David Howells 2020-09-03   89  
6eb566f6e69de7 David Howells 2020-09-03   90  /**
6eb566f6e69de7 David Howells 2020-09-03   91   * crypto_krb5_get_Kc - Derive key Kc and install into a hash
6eb566f6e69de7 David Howells 2020-09-03   92   * @krb5: The encryption type to use
6eb566f6e69de7 David Howells 2020-09-03   93   * @TK: The base key
6eb566f6e69de7 David Howells 2020-09-03   94   * @usage: The key usage number
6eb566f6e69de7 David Howells 2020-09-03   95   * @key: Prepped buffer to store the key into
6eb566f6e69de7 David Howells 2020-09-03   96   * @_shash: Where to put the hash (or NULL if not wanted)
6eb566f6e69de7 David Howells 2020-09-03   97   * @gfp: Allocation restrictions
6eb566f6e69de7 David Howells 2020-09-03   98   *
6eb566f6e69de7 David Howells 2020-09-03   99   * Derive the Kerberos Kc checksumming key and, optionally, allocate a hash and
6eb566f6e69de7 David Howells 2020-09-03  100   * install the key into it, returning the hash.  The key is stored into the
6eb566f6e69de7 David Howells 2020-09-03  101   * prepared buffer.
6eb566f6e69de7 David Howells 2020-09-03  102   */
6eb566f6e69de7 David Howells 2020-09-03  103  int crypto_krb5_get_Kc(const struct krb5_enctype *krb5,
6eb566f6e69de7 David Howells 2020-09-03  104  		       const struct krb5_buffer *TK,
6eb566f6e69de7 David Howells 2020-09-03  105  		       u32 usage,
6eb566f6e69de7 David Howells 2020-09-03  106  		       struct krb5_buffer *key,
6eb566f6e69de7 David Howells 2020-09-03  107  		       struct crypto_shash **_shash,
6eb566f6e69de7 David Howells 2020-09-03  108  		       gfp_t gfp)
6eb566f6e69de7 David Howells 2020-09-03  109  {
6eb566f6e69de7 David Howells 2020-09-03  110  	struct crypto_shash *shash;
6eb566f6e69de7 David Howells 2020-09-03  111  	int ret;
6eb566f6e69de7 David Howells 2020-09-03  112  	u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
6eb566f6e69de7 David Howells 2020-09-03  113  	struct krb5_buffer usage_constant = { .len = 5, .data = buf };
6eb566f6e69de7 David Howells 2020-09-03  114  
6eb566f6e69de7 David Howells 2020-09-03  115  	*(__be32 *)buf = cpu_to_be32(usage);
6eb566f6e69de7 David Howells 2020-09-03 @116  	buf[4] = KEY_USAGE_SEED_CHECKSUM;
6eb566f6e69de7 David Howells 2020-09-03  117  
6eb566f6e69de7 David Howells 2020-09-03  118  	key->len = krb5->Kc_len;
6eb566f6e69de7 David Howells 2020-09-03  119  	ret = krb5->profile->calc_Kc(krb5, TK, &usage_constant, key, gfp);
6eb566f6e69de7 David Howells 2020-09-03  120  	if (ret < 0)
6eb566f6e69de7 David Howells 2020-09-03  121  		return ret;
6eb566f6e69de7 David Howells 2020-09-03  122  
6eb566f6e69de7 David Howells 2020-09-03  123  	if (_shash) {
6eb566f6e69de7 David Howells 2020-09-03  124  		shash = crypto_alloc_shash(krb5->cksum_name, 0, 0);
6eb566f6e69de7 David Howells 2020-09-03  125  		if (IS_ERR(shash))
6eb566f6e69de7 David Howells 2020-09-03  126  			return (PTR_ERR(shash) == -ENOENT) ? -ENOPKG : PTR_ERR(shash);
6eb566f6e69de7 David Howells 2020-09-03  127  		*_shash = shash;
6eb566f6e69de7 David Howells 2020-09-03  128  		ret = crypto_shash_setkey(shash, key->data, key->len);
6eb566f6e69de7 David Howells 2020-09-03  129  	}
6eb566f6e69de7 David Howells 2020-09-03  130  
6eb566f6e69de7 David Howells 2020-09-03  131  	return ret;
6eb566f6e69de7 David Howells 2020-09-03  132  }
6eb566f6e69de7 David Howells 2020-09-03  133  EXPORT_SYMBOL(crypto_krb5_get_Kc);
6eb566f6e69de7 David Howells 2020-09-03  134  
6eb566f6e69de7 David Howells 2020-09-03  135  /**
6eb566f6e69de7 David Howells 2020-09-03  136   * crypto_krb5_get_Ke - Derive key Ke and install into an skcipher
6eb566f6e69de7 David Howells 2020-09-03  137   * @krb5: The encryption type to use
6eb566f6e69de7 David Howells 2020-09-03  138   * @TK: The base key
6eb566f6e69de7 David Howells 2020-09-03  139   * @usage: The key usage number
6eb566f6e69de7 David Howells 2020-09-03  140   * @key: Prepped buffer to store the key into
6eb566f6e69de7 David Howells 2020-09-03  141   * @_ci: Where to put the cipher (or NULL if not wanted)
6eb566f6e69de7 David Howells 2020-09-03  142   * @gfp: Allocation restrictions
6eb566f6e69de7 David Howells 2020-09-03  143   *
6eb566f6e69de7 David Howells 2020-09-03  144   * Derive the Kerberos Ke encryption key and, optionally, allocate an skcipher
6eb566f6e69de7 David Howells 2020-09-03  145   * and install the key into it, returning the cipher.  The key is stored into
6eb566f6e69de7 David Howells 2020-09-03  146   * the prepared buffer.
6eb566f6e69de7 David Howells 2020-09-03  147   */
6eb566f6e69de7 David Howells 2020-09-03  148  int crypto_krb5_get_Ke(const struct krb5_enctype *krb5,
6eb566f6e69de7 David Howells 2020-09-03  149  		       const struct krb5_buffer *TK,
6eb566f6e69de7 David Howells 2020-09-03  150  		       u32 usage,
6eb566f6e69de7 David Howells 2020-09-03  151  		       struct krb5_buffer *key,
6eb566f6e69de7 David Howells 2020-09-03  152  		       struct crypto_sync_skcipher **_ci,
6eb566f6e69de7 David Howells 2020-09-03  153  		       gfp_t gfp)
6eb566f6e69de7 David Howells 2020-09-03  154  {
6eb566f6e69de7 David Howells 2020-09-03  155  	struct crypto_sync_skcipher *ci;
6eb566f6e69de7 David Howells 2020-09-03  156  	int ret;
6eb566f6e69de7 David Howells 2020-09-03  157  	u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
6eb566f6e69de7 David Howells 2020-09-03  158  	struct krb5_buffer usage_constant = { .len = 5, .data = buf };
6eb566f6e69de7 David Howells 2020-09-03  159  
6eb566f6e69de7 David Howells 2020-09-03  160  	*(__be32 *)buf = cpu_to_be32(usage);
6eb566f6e69de7 David Howells 2020-09-03 @161  	buf[4] = KEY_USAGE_SEED_ENCRYPTION;
6eb566f6e69de7 David Howells 2020-09-03  162  
6eb566f6e69de7 David Howells 2020-09-03  163  	key->len = krb5->Ke_len;
6eb566f6e69de7 David Howells 2020-09-03  164  	ret = krb5->profile->calc_Ke(krb5, TK, &usage_constant, key, gfp);
6eb566f6e69de7 David Howells 2020-09-03  165  	if (ret < 0)
6eb566f6e69de7 David Howells 2020-09-03  166  		return ret;
6eb566f6e69de7 David Howells 2020-09-03  167  
6eb566f6e69de7 David Howells 2020-09-03  168  	if (_ci) {
6eb566f6e69de7 David Howells 2020-09-03  169  		ci = crypto_alloc_sync_skcipher(krb5->encrypt_name, 0, 0);
6eb566f6e69de7 David Howells 2020-09-03  170  		if (IS_ERR(ci))
6eb566f6e69de7 David Howells 2020-09-03  171  			return (PTR_ERR(ci) == -ENOENT) ? -ENOPKG : PTR_ERR(ci);
6eb566f6e69de7 David Howells 2020-09-03  172  		*_ci = ci;
6eb566f6e69de7 David Howells 2020-09-03  173  		ret = crypto_sync_skcipher_setkey(ci, key->data, key->len);
6eb566f6e69de7 David Howells 2020-09-03  174  	}
6eb566f6e69de7 David Howells 2020-09-03  175  
6eb566f6e69de7 David Howells 2020-09-03  176  	return ret;
6eb566f6e69de7 David Howells 2020-09-03  177  }
6eb566f6e69de7 David Howells 2020-09-03  178  EXPORT_SYMBOL(crypto_krb5_get_Ke);
6eb566f6e69de7 David Howells 2020-09-03  179  
6eb566f6e69de7 David Howells 2020-09-03  180  /**
6eb566f6e69de7 David Howells 2020-09-03  181   * crypto_krb5_get_Ki - Derive key Ki and install into a hash
6eb566f6e69de7 David Howells 2020-09-03  182   * @krb5: The encryption type to use
6eb566f6e69de7 David Howells 2020-09-03  183   * @TK: The base key
6eb566f6e69de7 David Howells 2020-09-03  184   * @usage: The key usage number
6eb566f6e69de7 David Howells 2020-09-03  185   * @key: Prepped buffer to store the key into
6eb566f6e69de7 David Howells 2020-09-03  186   * @_shash: Where to put the hash (or NULL if not wanted)
6eb566f6e69de7 David Howells 2020-09-03  187   * @gfp: Allocation restrictions
6eb566f6e69de7 David Howells 2020-09-03  188   *
6eb566f6e69de7 David Howells 2020-09-03  189   * Derive the Kerberos Ki integrity checksum key and, optionally, allocate a
6eb566f6e69de7 David Howells 2020-09-03  190   * hash and install the key into it, returning the hash.  The key is stored
6eb566f6e69de7 David Howells 2020-09-03  191   * into the prepared buffer.
6eb566f6e69de7 David Howells 2020-09-03  192   */
6eb566f6e69de7 David Howells 2020-09-03  193  int crypto_krb5_get_Ki(const struct krb5_enctype *krb5,
6eb566f6e69de7 David Howells 2020-09-03  194  		       const struct krb5_buffer *TK,
6eb566f6e69de7 David Howells 2020-09-03  195  		       u32 usage,
6eb566f6e69de7 David Howells 2020-09-03  196  		       struct krb5_buffer *key,
6eb566f6e69de7 David Howells 2020-09-03  197  		       struct crypto_shash **_shash,
6eb566f6e69de7 David Howells 2020-09-03  198  		       gfp_t gfp)
6eb566f6e69de7 David Howells 2020-09-03  199  {
6eb566f6e69de7 David Howells 2020-09-03  200  	struct crypto_shash *shash;
6eb566f6e69de7 David Howells 2020-09-03  201  	int ret;
6eb566f6e69de7 David Howells 2020-09-03  202  	u8 buf[CRYPTO_MINALIGN] __aligned(CRYPTO_MINALIGN);
6eb566f6e69de7 David Howells 2020-09-03  203  	struct krb5_buffer usage_constant = { .len = 5, .data = buf };
6eb566f6e69de7 David Howells 2020-09-03  204  
6eb566f6e69de7 David Howells 2020-09-03  205  	*(__be32 *)buf = cpu_to_be32(usage);
6eb566f6e69de7 David Howells 2020-09-03 @206  	buf[4] = KEY_USAGE_SEED_INTEGRITY;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
