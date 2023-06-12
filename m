Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F70E17E1
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jun 2023 04:47:06 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30fbf6603d2so697839f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 11 Jun 2023 21:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686545223; x=1689137223;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ZE/PD9WY5/Xe7Q+mkkF3IRj2uSW1xGOtSNMp2g/a9s=;
        b=ykizEb2seUre/jPhV9CZVGrJz2NpQj+N3uZIJNEqFZ2T414FsGLZwB99OEUwAOWFHe
         e1DIKZSe8/Jy1in67COOTQNPpZiaRGZ5PkQum29zcvAkSnaG7vANDo2xoPRsD2+s/hsN
         zEdUTkg3j0a/m/aqzNvb/KXFTjOSjt15UAf8yp7SM30zUo3VuArfI4CliskkgCmJe2N1
         6yqZuNfDwEMiAMvBHXlu0tR9fEonPFGRHdfBzuTap1TBTWABcLVEMNHHDEozLLAViNPx
         ZGvhd+IzsoqXVC5a0rNoXjbeRW/WlUAehyVYovoDWNpjUyJM8qS7LoqhiUBkF2QmxBCE
         7ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686545223; x=1689137223;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZE/PD9WY5/Xe7Q+mkkF3IRj2uSW1xGOtSNMp2g/a9s=;
        b=JlUXcnf5JaLywIifZE9LfC5dTJP2xmkl4gpbyp2jZc/MrRplF3XUl5FSNtrVvC4u/r
         G5Af9ZLw963PpgVKQhfSIlJq21ldVe4anMp2zu1Oz977ZHbGWWb3PxU4GkJgfzTq9m3m
         wQL57r32gQd+WW07K6kfC6YXXrD9GD9JbPr3TAa/vOdx7fsigBZP8BCDu4j6uXCvi41S
         S8v+HJLifKU/tVHj7EGN2NWpoKYzL5QBl6NiKZ+yenJKugpVS6zzfAgFyECeOMqAs2G0
         KicV8jSx9uc5IP/qyaCZ8VCjmgbryVBBs+kGM38r4ycRw9TgskcffcTEjg3echOD1yYH
         g2FA==
X-Gm-Message-State: AC+VfDwIrCooajY5Y2XyLa7ZUP4IHO6ySu7zyAuErdCyblckJEKWkDlT
	5Jk0X5C4OoYxtNTWluxIRI9sZ+jXjaf+sUxShTY=
X-Google-Smtp-Source: ACHHUZ7oX93/BAT6aroLNDAxh44gkTgd0BySepMzGScrpVWlntyKJcHGrsFtUXGYsNWFyjWmLijVSw==
X-Received: by 2002:a5d:4ac7:0:b0:30a:e5bc:547c with SMTP id y7-20020a5d4ac7000000b0030ae5bc547cmr3624633wrs.9.1686545222951;
        Sun, 11 Jun 2023 21:47:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c029a00b003f7298a32ccsm10072758wmk.41.2023.06.11.21.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 21:47:00 -0700 (PDT)
Date: Mon, 12 Jun 2023 07:46:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 4/19] crypto/krb5/kdf.c:116
 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
Message-ID: <2b6ee4cb-cc6d-4484-bea3-f60fd9d90fae@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   5b181cb5852b03279d830e9d98cdc20ae1ca6e8e
commit: 6eb566f6e69de76d49623aa065bae4351343d9da [4/19] crypto/krb5: Provide infrastructure and key derivation
config: i386-randconfig-m021-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101812.yrGNOuqN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306101812.yrGNOuqN-lkp@intel.com/

smatch warnings:
crypto/krb5/kdf.c:116 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
crypto/krb5/kdf.c:161 crypto_krb5_get_Ke() error: buffer overflow 'buf' 4 <= 4
crypto/krb5/kdf.c:206 crypto_krb5_get_Ki() error: buffer overflow 'buf' 4 <= 4

vim +/buf +116 crypto/krb5/kdf.c

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

On i386 the CRYPTO_MINALIGN is alignof(unsigned long long) but that's
the same as alignof(unsigned long) which is 4.  The alignment is less
than sizeof().

6eb566f6e69de7 David Howells 2020-09-03  113  	struct krb5_buffer usage_constant = { .len = 5, .data = buf };
6eb566f6e69de7 David Howells 2020-09-03  114  
6eb566f6e69de7 David Howells 2020-09-03  115  	*(__be32 *)buf = cpu_to_be32(usage);
6eb566f6e69de7 David Howells 2020-09-03 @116  	buf[4] = KEY_USAGE_SEED_CHECKSUM;

So this will overflow.

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

Same with the other places.

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

