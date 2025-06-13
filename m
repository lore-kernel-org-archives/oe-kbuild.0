Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2102149C51
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 13:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821322; cv=none; b=ZG8Rmp7x7YAfwBJPgbx8D4yI2JKc3UPb0sEjbIQVm2a0XrmmSxR1NBgCsU/IoYit2+AsPtB6M/8BQqNQ+3g6cev+eAggYWDrEoX6LELCY4lh8wfStRl+0XgUjmhbUZJHkWq1cCZYEKazU5TvHS+yfOHPOr5YXjnYUa1EDUq5e60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821322; c=relaxed/simple;
	bh=XA1SI6rQ4TsSP9J6zAP0hhxxULPEa4B8zuojHdm+loU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ax2RqGFHwQzuLy1gDOjEequgKdiG7unylHmexuDcmdtOE9tdM9DceQiJ41tGQIi05BypQk1igpsXqDn0d73k+FpH/2FXkTuVaTEPR7ndusGQ62VfAVCC1iLH7UhjeIcLbN1TBS+JNKNTOrJDTkxWj+NGq86RXnE1WM24N7OIc+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPth72A5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPth72A5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749821321; x=1781357321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XA1SI6rQ4TsSP9J6zAP0hhxxULPEa4B8zuojHdm+loU=;
  b=CPth72A5L7OL826+MzFxMe2cGMbgBZWLNS3sx8TgzL+OnryMfhUqAjmM
   8EGGz8oo9x1w3+R97HgJSuizKi7s6a/iDLh/spLjxST/DeymbK2xzhfzk
   3mW7PElDpYM/lRrs/ZnGsx0RyXez3MKS2SiEXnt+WcCnij5RtyJqDoecQ
   HRKeRCCij98KsbwM8suPoVvX656aiuA49X4/HdMORf6M2BRx+OBckVHE7
   ozC8wW7qb4Ze8DqSD3+XmRSYr36qVQosaoCJa67WpDp2Nan9Mvh84E8fb
   tXYHevXjh9BNhtw10EHvkRTVjafyvbpmOkmW5RdlgxQyE9pQsCblAS8oQ
   Q==;
X-CSE-ConnectionGUID: RVgX3CcCSd6v0TBWK+aKeA==
X-CSE-MsgGUID: UrSLhhPdRIal+XCT2lpBYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55708330"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55708330"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 06:28:40 -0700
X-CSE-ConnectionGUID: SiuQPgW2RNuQO+iKF33zeA==
X-CSE-MsgGUID: v66aZmjnSFGhdcQvozcD8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148296337"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 06:28:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ4SS-000CeI-0e;
	Fri, 13 Jun 2025 13:28:36 +0000
Date: Fri, 13 Jun 2025 21:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:tpm2-rsassa-pkcs1 9/9]
 crypto/asymmetric_keys/tpm2_key_rsa.c:143 tpm2_key_rsa_encrypt() error:
 uninitialized symbol 'tfm'.
Message-ID: <202506132119.0FPtnHOK-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-rsassa-pkcs1
head:   c233b7cd00588a7a3397f17fd2650880aa7cecf7
commit: c233b7cd00588a7a3397f17fd2650880aa7cecf7 [9/9] KEYS: asymmetric: TPM2 RSA key
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: powerpc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132119.0FPtnHOK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506132119.0FPtnHOK-lkp@intel.com/

smatch warnings:
crypto/asymmetric_keys/tpm2_key_rsa.c:143 tpm2_key_rsa_encrypt() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:142 tpm2_key_rsa_encrypt() error: uninitialized symbol 'buf'.
crypto/asymmetric_keys/tpm2_key_rsa.c:143 tpm2_key_rsa_encrypt() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:325 tpm2_key_rsa_sign() error: uninitialized symbol 'padded'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:325 tpm2_key_rsa_sign() error: uninitialized symbol 'padded'.
crypto/asymmetric_keys/tpm2_key_rsa.c:325 tpm2_key_rsa_sign() error: uninitialized symbol 'padded'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:326 tpm2_key_rsa_sign() error: uninitialized symbol 'wrapped'.
crypto/asymmetric_keys/tpm2_key_rsa.c:412 tpm2_key_rsa_verify() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:411 tpm2_key_rsa_verify() error: uninitialized symbol 'buf'.
crypto/asymmetric_keys/tpm2_key_rsa.c:412 tpm2_key_rsa_verify() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:411 tpm2_key_rsa_verify() error: uninitialized symbol 'buf'.
crypto/asymmetric_keys/tpm2_key_rsa.c:412 tpm2_key_rsa_verify() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:450 tpm2_key_rsa_query() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:449 tpm2_key_rsa_query() error: uninitialized symbol 'buf'.
crypto/asymmetric_keys/tpm2_key_rsa.c:450 tpm2_key_rsa_query() error: uninitialized symbol 'tfm'.
crypto/asymmetric_keys/tpm2_key_rsa.c:546 tpm2_key_rsa_preparse() error: uninitialized symbol 'ret'.

vim +/tfm +143 crypto/asymmetric_keys/tpm2_key_rsa.c

c233b7cd00588a Jarkko Sakkinen 2024-05-26  137  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  138  static int tpm2_key_rsa_encrypt(struct tpm2_key *key,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  139  				struct kernel_pkey_params *params,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  140  				const void *in, void *out)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  141  {
c233b7cd00588a Jarkko Sakkinen 2024-05-26 @142  	u8 *buf __free(kfree);
c233b7cd00588a Jarkko Sakkinen 2024-05-26 @143  	struct crypto_akcipher *tfm __free(akcipher);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  144  	char cipher[CRYPTO_MAX_ALG_NAME];
c233b7cd00588a Jarkko Sakkinen 2024-05-26  145  	struct scatterlist in_sg, out_sg;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  146  	struct akcipher_request *req;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  147  	struct crypto_wait cwait;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  148  	int ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  149  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  150  	ret = tpm2_key_rsa_alg_name(params->encoding, params->hash_algo, cipher);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  151  	if (ret < 0)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  152  		return ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  153  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  154  	buf = kzalloc(TPM2_KEY_BYTES_MAX, GFP_KERNEL);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  155  	if (!buf)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  156  		return -ENOMEM;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  157  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  158  	tfm = crypto_alloc_akcipher(cipher, 0, 0);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  159  	if (IS_ERR(tfm))
c233b7cd00588a Jarkko Sakkinen 2024-05-26  160  		return PTR_ERR(tfm);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  161  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  162  	ret = tpm2_key_rsa_pub_key(key, buf);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  163  	if (ret < 0)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  164  		return ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  165  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  166  	ret = crypto_akcipher_set_pub_key(tfm, buf, ret);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  167  	if (ret < 0)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  168  		return ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  169  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  170  	req = akcipher_request_alloc(tfm, GFP_KERNEL);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  171  	if (!req)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  172  		return -ENOMEM;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  173  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  174  	sg_init_one(&in_sg, in, params->in_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  175  	sg_init_one(&out_sg, out, params->out_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  176  	akcipher_request_set_crypt(req, &in_sg, &out_sg, params->in_len,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  177  				   params->out_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  178  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  179  	crypto_init_wait(&cwait);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  180  	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
c233b7cd00588a Jarkko Sakkinen 2024-05-26  181  				      CRYPTO_TFM_REQ_MAY_SLEEP,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  182  				      crypto_req_done, &cwait);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  183  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  184  	ret = crypto_akcipher_encrypt(req);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  185  	if (ret)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  186  		return ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  187  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  188  	ret = crypto_wait_req(ret, &cwait);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  189  	if (!ret)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  190  		ret = req->dst_len;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  191  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  192  	akcipher_request_free(req);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  193  	return ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  194  }
c233b7cd00588a Jarkko Sakkinen 2024-05-26  195  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  196  static int __tpm2_key_rsa_decrypt(struct tpm_chip *chip,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  197  				  struct tpm2_key *key,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  198  				  struct kernel_pkey_params *params,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  199  				  const void *in, int in_len, void *out)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  200  {
c233b7cd00588a Jarkko Sakkinen 2024-05-26  201  	u32 key_handle = 0;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  202  	struct tpm_buf buf;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  203  	u16 decrypted_len;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  204  	u8 *pos;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  205  	int ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  206  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  207  	ret = tpm_try_get_ops(chip);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  208  	if (ret)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  209  		return ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  210  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  211  	ret = tpm2_start_auth_session(chip);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  212  	if (ret)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  213  		goto err_ops;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  214  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  215  	ret = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  216  	if (ret < 0)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  217  		goto err_auth;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  218  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  219  	tpm_buf_append_name(chip, &buf, key->parent, NULL);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  220  	tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_CONTINUE_SESSION |
c233b7cd00588a Jarkko Sakkinen 2024-05-26  221  				    TPM2_SA_ENCRYPT, NULL, 0);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  222  	tpm_buf_append(&buf, &key->data[0], key->priv_len + key->pub_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  223  	if (buf.flags & TPM_BUF_OVERFLOW) {
c233b7cd00588a Jarkko Sakkinen 2024-05-26  224  		ret = -E2BIG;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  225  		goto err_buf;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  226  	}
c233b7cd00588a Jarkko Sakkinen 2024-05-26  227  	tpm_buf_fill_hmac_session(chip, &buf);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  228  	ret = tpm_transmit_cmd(chip, &buf, 4, "TPM2_CC_LOAD");
c233b7cd00588a Jarkko Sakkinen 2024-05-26  229  	ret = tpm_buf_check_hmac_response(chip, &buf, ret);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  230  	if (ret) {
c233b7cd00588a Jarkko Sakkinen 2024-05-26  231  		ret = -EIO;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  232  		goto err_buf;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  233  	}
c233b7cd00588a Jarkko Sakkinen 2024-05-26  234  	key_handle = be32_to_cpup((__be32 *)&buf.data[TPM_HEADER_SIZE]);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  235  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  236  	tpm_buf_reset(&buf, TPM2_ST_SESSIONS, TPM2_CC_RSA_DECRYPT);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  237  	tpm_buf_append_name(chip, &buf, key_handle, NULL);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  238  	tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_DECRYPT, NULL, 0);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  239  	tpm_buf_append_u16(&buf, in_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  240  	tpm_buf_append(&buf, in, in_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  241  	tpm_buf_append_u16(&buf, TPM_ALG_NULL);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  242  	tpm_buf_append_u16(&buf, 0);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  243  	tpm_buf_fill_hmac_session(chip, &buf);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  244  	ret = tpm_transmit_cmd(chip, &buf, 4, "TPM2_RSA_DECRYPT");
c233b7cd00588a Jarkko Sakkinen 2024-05-26  245  	ret = tpm_buf_check_hmac_response(chip, &buf, ret);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  246  	if (ret) {
c233b7cd00588a Jarkko Sakkinen 2024-05-26  247  		ret = -EIO;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  248  		goto err_blob;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  249  	}
c233b7cd00588a Jarkko Sakkinen 2024-05-26  250  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  251  	pos = buf.data + TPM_HEADER_SIZE + 4;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  252  	decrypted_len = be16_to_cpup((__be16 *)pos);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  253  	pos += 2;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  254  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  255  	if (params->out_len < decrypted_len) {
c233b7cd00588a Jarkko Sakkinen 2024-05-26  256  		ret = -EMSGSIZE;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  257  		goto err_blob;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  258  	}
c233b7cd00588a Jarkko Sakkinen 2024-05-26  259  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  260  	memcpy(out, pos, decrypted_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  261  	ret = decrypted_len;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  262  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  263  err_blob:
c233b7cd00588a Jarkko Sakkinen 2024-05-26  264  	tpm2_flush_context(chip, key_handle);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  265  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  266  err_buf:
c233b7cd00588a Jarkko Sakkinen 2024-05-26  267  	tpm_buf_destroy(&buf);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  268  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  269  err_auth:
c233b7cd00588a Jarkko Sakkinen 2024-05-26  270  	if (ret < 0)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  271  		tpm2_end_auth_session(chip);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  272  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  273  err_ops:
c233b7cd00588a Jarkko Sakkinen 2024-05-26  274  	tpm_put_ops(chip);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  275  	return ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  276  }
c233b7cd00588a Jarkko Sakkinen 2024-05-26  277  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  278  static int tpm2_key_rsa_decrypt(struct tpm_chip *chip, struct tpm2_key *key,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  279  				struct kernel_pkey_params *params,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  280  				const void *in, void *out)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  281  {
c233b7cd00588a Jarkko Sakkinen 2024-05-26  282  	const u8 *ptr;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  283  	int out_len;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  284  	u8 *work;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  285  	int ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  286  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  287  	work = kzalloc(TPM2_KEY_BYTES_MAX, GFP_KERNEL);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  288  	if (!work)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  289  		return -ENOMEM;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  290  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  291  	ret = __tpm2_key_rsa_decrypt(chip, key, params, in, params->in_len,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  292  				     work);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  293  	if (ret < 0)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  294  		goto err;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  295  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  296  	ptr = tpm2_key_rsa_unpad_pkcs1(work, ret, &out_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  297  	if (!ptr) {
c233b7cd00588a Jarkko Sakkinen 2024-05-26  298  		ret = -EINVAL;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  299  		goto err;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  300  	}
c233b7cd00588a Jarkko Sakkinen 2024-05-26  301  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  302  	if (out_len > params->out_len) {
c233b7cd00588a Jarkko Sakkinen 2024-05-26  303  		ret = -EMSGSIZE;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  304  		goto err;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  305  	}
c233b7cd00588a Jarkko Sakkinen 2024-05-26  306  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  307  	memcpy(out, ptr, out_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  308  	kfree(work);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  309  	return out_len;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  310  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  311  err:
c233b7cd00588a Jarkko Sakkinen 2024-05-26  312  	kfree(work);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  313  	return ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  314  }
c233b7cd00588a Jarkko Sakkinen 2024-05-26  315  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  316  /*
c233b7cd00588a Jarkko Sakkinen 2024-05-26  317   * Sign operation is encryption using the TPM's private key. With RSA the only
c233b7cd00588a Jarkko Sakkinen 2024-05-26  318   * difference between encryption and decryption is where the padding goes.
c233b7cd00588a Jarkko Sakkinen 2024-05-26  319   * Thus, TPM2_RSA_Decrypt can be repurposed to do encryption.
c233b7cd00588a Jarkko Sakkinen 2024-05-26  320   */
c233b7cd00588a Jarkko Sakkinen 2024-05-26  321  static int tpm2_key_rsa_sign(struct tpm_chip *chip, struct tpm2_key *key,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  322  			     struct kernel_pkey_params *params,
c233b7cd00588a Jarkko Sakkinen 2024-05-26  323  			     const void *in, void *out)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  324  {
c233b7cd00588a Jarkko Sakkinen 2024-05-26 @325  	u8 *padded __free(kfree);
c233b7cd00588a Jarkko Sakkinen 2024-05-26 @326  	void *wrapped __free(kfree);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  327  	off_t o = key->priv_len + 2 + sizeof(*key->desc);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  328  	struct tpm2_rsa_parms *p = (struct tpm2_rsa_parms *)&key->data[o];
c233b7cd00588a Jarkko Sakkinen 2024-05-26  329  	u16 modulus_size = be16_to_cpu(p->modulus_size);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  330  	const struct hash_prefix *prefix;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  331  	u32 in_len = params->in_len;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  332  	int ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  333  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  334  	if (strcmp(params->encoding, "pkcs1") != 0)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  335  		return -ENOPKG;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  336  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  337  	if (params->hash_algo) {
c233b7cd00588a Jarkko Sakkinen 2024-05-26  338  		prefix = rsassa_pkcs1_find_hash_prefix(params->hash_algo);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  339  		if (!prefix)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  340  			return -ENOPKG;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  341  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  342  		wrapped = kzalloc(in_len + prefix->size, GFP_KERNEL);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  343  		if (!wrapped)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  344  			return -ENOMEM;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  345  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  346  		memcpy(wrapped, prefix->data, prefix->size);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  347  		memcpy(wrapped + prefix->size, in, in_len);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  348  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  349  		in = wrapped;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  350  		in_len += prefix->size;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  351  	}
c233b7cd00588a Jarkko Sakkinen 2024-05-26  352  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  353  	padded = kzalloc(modulus_size, GFP_KERNEL);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  354  	if (!padded)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  355  		return -ENOMEM;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  356  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  357  	ret = tpm2_key_rsa_pad_pkcs1(in, in_len, padded, modulus_size);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  358  	if (ret < 0)
c233b7cd00588a Jarkko Sakkinen 2024-05-26  359  		return ret;
c233b7cd00588a Jarkko Sakkinen 2024-05-26  360  
c233b7cd00588a Jarkko Sakkinen 2024-05-26  361  	return __tpm2_key_rsa_decrypt(chip, key, params, padded, modulus_size, out);
c233b7cd00588a Jarkko Sakkinen 2024-05-26  362  }
c233b7cd00588a Jarkko Sakkinen 2024-05-26  363  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
