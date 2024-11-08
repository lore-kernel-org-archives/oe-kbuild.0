Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9319DF8C
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 03:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731037851; cv=none; b=Dbh4qyL9Fq0PkHjB5m1G/ouvgByI23hdIKIGR/LORkdk8dSZyo/QB8XAUTEv14YkQpGIiUP9xgjt4S8QniHFoQ6eV76jZA4f4Pl71qX8TZaZHJ/j32KymP7gZN+l0U+mRzWYue2Ux8C3Dwr+zfrz3wgo2g1doXe0Gxi9N6zmjDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731037851; c=relaxed/simple;
	bh=Q/xV0HCFQS0jkbV6Nzn80Hzm8RwApAVSz9zbMifOAWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ac1etDSXogaLkqqWy2dFbFyBn+zl1rD6gnd+/d3L5+qFQM2XVZVIJgMPW9B8dCdEWW3bk4DDVjhJqT1ntVhTryDWTKLBXIvtBlizfaXsuqhvDirqWi45kkrrr05wgPR6gjgjyH2pFdQmtYFWflkO8+d8k/4b84g9upeuoUQS8Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQLkUWoR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQLkUWoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731037850; x=1762573850;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Q/xV0HCFQS0jkbV6Nzn80Hzm8RwApAVSz9zbMifOAWA=;
  b=kQLkUWoRGO58DsbHOJvPS/bIKobObPUGKEPTVUf4MQ/6iwROG5LzS9Rb
   ky6IfmRLAkBfQcvmInBE/XMEnDm0JopKlsE0ZY1ZIi0220s1lWdN4CxUO
   +073MnJwlXt3Zw7/9dGxixgHg9zlC2fE5BhwhDw+NI5wPLtR61A/KXiOW
   R+SU9OODyHf1bvIXTDLxdaZttIBIcOPmlGKMNGsQCcK/863bfT3U+p+2q
   3UTlHePG3XZMVFG9LGs5bCd2jYl94EZVc1yUQj7kepaszV3SdTwv4uR0Q
   X8ojpS6a/JLPQZUzJXU7t4Ti3B/miFapCdBst34w44UNCY/Jkm2OlDnh9
   A==;
X-CSE-ConnectionGUID: JYAtlAlfQxSyejchjr67lw==
X-CSE-MsgGUID: vSxpigKJRMCyqt+ntfzyBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34834799"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="34834799"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 19:50:49 -0800
X-CSE-ConnectionGUID: /WEndsXwRI20UR69V+/7eQ==
X-CSE-MsgGUID: f4E/fVNjQB+yu+2gkKvS7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="85345754"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Nov 2024 19:50:48 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9G1F-000qzK-1U;
	Fri, 08 Nov 2024 03:50:45 +0000
Date: Fri, 8 Nov 2024 11:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] crypto: caam - add error check to
 caam_rsa_set_priv_key_form
Message-ID: <202411081137.LPAjeqWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241104121511.1634822-1-chenridong@huaweicloud.com>
References: <20241104121511.1634822-1-chenridong@huaweicloud.com>
TO: Chen Ridong <chenridong@huaweicloud.com>
TO: horia.geanta@nxp.com
TO: pankaj.gupta@nxp.com
TO: gaurav.jain@nxp.com
TO: herbert@gondor.apana.org.au
TO: davem@davemloft.net
TO: tudor-dan.ambarus@nxp.com
TO: radu.alexe@nxp.com
CC: linux-crypto@vger.kernel.org
CC: chenridong@huawei.com
CC: wangweiyang2@huawei.com

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v6.12-rc6 next-20241107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/crypto-caam-add-error-check-to-caam_rsa_set_priv_key_form/20241104-202521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241104121511.1634822-1-chenridong%40huaweicloud.com
patch subject: [PATCH] crypto: caam - add error check to caam_rsa_set_priv_key_form
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r071-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081137.LPAjeqWV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411081137.LPAjeqWV-lkp@intel.com/

smatch warnings:
drivers/crypto/caam/caampkc.c:1085 caam_rsa_set_priv_key() warn: missing unwind goto?

vim +1085 drivers/crypto/caam/caampkc.c

52e26d77b8b3de Radu Alexe    2017-04-25  1048  
8c419778ab57e4 Tudor Ambarus 2016-07-04  1049  static int caam_rsa_set_priv_key(struct crypto_akcipher *tfm, const void *key,
8c419778ab57e4 Tudor Ambarus 2016-07-04  1050  				 unsigned int keylen)
8c419778ab57e4 Tudor Ambarus 2016-07-04  1051  {
4cb4f7c11deef5 Herbert Xu    2022-11-25  1052  	struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
8439e94fceb381 Horia Geantă  2016-11-09  1053  	struct rsa_key raw_key = {NULL};
8c419778ab57e4 Tudor Ambarus 2016-07-04  1054  	struct caam_rsa_key *rsa_key = &ctx->key;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1055  	int ret;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1056  
8c419778ab57e4 Tudor Ambarus 2016-07-04  1057  	/* Free the old RSA key if any */
8c419778ab57e4 Tudor Ambarus 2016-07-04  1058  	caam_rsa_free_key(rsa_key);
8c419778ab57e4 Tudor Ambarus 2016-07-04  1059  
8c419778ab57e4 Tudor Ambarus 2016-07-04  1060  	ret = rsa_parse_priv_key(&raw_key, key, keylen);
8c419778ab57e4 Tudor Ambarus 2016-07-04  1061  	if (ret)
8c419778ab57e4 Tudor Ambarus 2016-07-04  1062  		return ret;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1063  
8c419778ab57e4 Tudor Ambarus 2016-07-04  1064  	/* Copy key in DMA zone */
199354d7fb6eaa Herbert Xu    2022-12-30  1065  	rsa_key->d = kmemdup(raw_key.d, raw_key.d_sz, GFP_KERNEL);
8c419778ab57e4 Tudor Ambarus 2016-07-04  1066  	if (!rsa_key->d)
8c419778ab57e4 Tudor Ambarus 2016-07-04  1067  		goto err;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1068  
199354d7fb6eaa Herbert Xu    2022-12-30  1069  	rsa_key->e = kmemdup(raw_key.e, raw_key.e_sz, GFP_KERNEL);
8c419778ab57e4 Tudor Ambarus 2016-07-04  1070  	if (!rsa_key->e)
8c419778ab57e4 Tudor Ambarus 2016-07-04  1071  		goto err;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1072  
8c419778ab57e4 Tudor Ambarus 2016-07-04  1073  	/*
8c419778ab57e4 Tudor Ambarus 2016-07-04  1074  	 * Skip leading zeros and copy the positive integer to a buffer
199354d7fb6eaa Herbert Xu    2022-12-30  1075  	 * allocated in the GFP_KERNEL zone. The decryption descriptor
8c419778ab57e4 Tudor Ambarus 2016-07-04  1076  	 * expects a positive integer for the RSA modulus and uses its length as
8c419778ab57e4 Tudor Ambarus 2016-07-04  1077  	 * decryption output length.
8c419778ab57e4 Tudor Ambarus 2016-07-04  1078  	 */
8c419778ab57e4 Tudor Ambarus 2016-07-04  1079  	rsa_key->n = caam_read_raw_data(raw_key.n, &raw_key.n_sz);
8c419778ab57e4 Tudor Ambarus 2016-07-04  1080  	if (!rsa_key->n)
8c419778ab57e4 Tudor Ambarus 2016-07-04  1081  		goto err;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1082  
8c419778ab57e4 Tudor Ambarus 2016-07-04  1083  	if (caam_rsa_check_key_length(raw_key.n_sz << 3)) {
8c419778ab57e4 Tudor Ambarus 2016-07-04  1084  		caam_rsa_free_key(rsa_key);
8c419778ab57e4 Tudor Ambarus 2016-07-04 @1085  		return -EINVAL;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1086  	}
8c419778ab57e4 Tudor Ambarus 2016-07-04  1087  
8c419778ab57e4 Tudor Ambarus 2016-07-04  1088  	rsa_key->d_sz = raw_key.d_sz;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1089  	rsa_key->e_sz = raw_key.e_sz;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1090  	rsa_key->n_sz = raw_key.n_sz;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1091  
0aa745ef94c209 Chen Ridong   2024-11-04  1092  	ret = caam_rsa_set_priv_key_form(ctx, &raw_key);
0aa745ef94c209 Chen Ridong   2024-11-04  1093  	if (ret)
0aa745ef94c209 Chen Ridong   2024-11-04  1094  		goto err;
52e26d77b8b3de Radu Alexe    2017-04-25  1095  
8c419778ab57e4 Tudor Ambarus 2016-07-04  1096  	return 0;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1097  
8c419778ab57e4 Tudor Ambarus 2016-07-04  1098  err:
8c419778ab57e4 Tudor Ambarus 2016-07-04  1099  	caam_rsa_free_key(rsa_key);
8c419778ab57e4 Tudor Ambarus 2016-07-04  1100  	return -ENOMEM;
8c419778ab57e4 Tudor Ambarus 2016-07-04  1101  }
8c419778ab57e4 Tudor Ambarus 2016-07-04  1102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
