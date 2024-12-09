Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5A5156F41
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718193; cv=none; b=TOgTUnxL/1D5+4na02WnN+5jhGeWvdCLDraNXKYg1/7dnIvUYIJhFHNJKFzj4DSlEVxj7xSAr2/Gp8qjv+brlCiV1FLVlSctPbZCkXFh+DHZGejOdHubTPBB2zYjP3fH3KSYMjtskvv3AkgdQ7XiJaG211ALlRZ+v75ggSC39o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718193; c=relaxed/simple;
	bh=cp7dmiVr9oeKVeRd+soNHtZR4m2xmn+2lgp8GtWbp7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QfnvWURQDAM5PaHtDlYmclRBVSyVsHMz9kGYA47iHNCFGc8KdUunIhvzntHgoiZR0SDpUhZ2jZCDgus6i7ePtocG/zu8yVnY8NK2Fz2qHlgKi0dwlgIOEhibeIMww2V+X6voGlSPakQz1VfhcFVv0/Y2adEC9FqonfOoO1ARKxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvyL52A/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvyL52A/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718192; x=1765254192;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cp7dmiVr9oeKVeRd+soNHtZR4m2xmn+2lgp8GtWbp7s=;
  b=WvyL52A/1iASQspG/zLdS1itONSbweWqNAhRLpVNJ3kuPJlGP6WQtR1u
   iWrU82emPtvvXsW3LrW1V+7Qf80MUUeLqaUjDD9pdsO1HhGzQNtqHmMmS
   WX6ZxWTtm0Ovzcu/9FlzQP0cMwDTJ40Ud8oswIhXwcFalNUDRw6Lz2yiF
   ofGEntRHpHZHaffpDhlf7UJFQ4AUsjtVuikZa/Qu4TL3KzH1XXw5nrSWf
   rtqRbx4cWdga544ErXPolSW5smdO1il17ScwMsh1pjKZysLzjjxdd7ZwM
   F/NYwuF8MKcQt8xWSoHTke1Jo7EfQav2GoIiP395yF0qepAgRN8AkGJyG
   A==;
X-CSE-ConnectionGUID: p9ngM7NBR+a1RUaQTsg+pg==
X-CSE-MsgGUID: E2uTh9pJTByqslqZP3W/ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="21591909"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="21591909"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:23:11 -0800
X-CSE-ConnectionGUID: VEqRSgOcRkS/exUBwRjTzQ==
X-CSE-MsgGUID: Ut17dWRqSYOqGIXzfPb+Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125842604"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2024 20:23:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVIZ-0003qN-0u;
	Mon, 09 Dec 2024 04:23:07 +0000
Date: Mon, 9 Dec 2024 12:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/caam/caampkc.c:1085 caam_rsa_set_priv_key() warn:
 missing unwind goto?
Message-ID: <202412072135.YsRBSVle-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Chen Ridong <chenridong@huawei.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Gaurav Jain <gaurav.jain@nxp.com>
CC: "Horia Geantă" <horia.geanta@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: b64140c74e954f1db6eae5548ca3a1f41b6fad79 crypto: caam - add error check to caam_rsa_set_priv_key_form
date:   3 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: nios2-randconfig-r073-20241206 (https://download.01.org/0day-ci/archive/20241207/202412072135.YsRBSVle-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412072135.YsRBSVle-lkp@intel.com/

smatch warnings:
drivers/crypto/caam/caampkc.c:1085 caam_rsa_set_priv_key() warn: missing unwind goto?

vim +1085 drivers/crypto/caam/caampkc.c

52e26d77b8b3de2 Radu Alexe    2017-04-25  1048  
8c419778ab57e49 Tudor Ambarus 2016-07-04  1049  static int caam_rsa_set_priv_key(struct crypto_akcipher *tfm, const void *key,
8c419778ab57e49 Tudor Ambarus 2016-07-04  1050  				 unsigned int keylen)
8c419778ab57e49 Tudor Ambarus 2016-07-04  1051  {
4cb4f7c11deef52 Herbert Xu    2022-11-25  1052  	struct caam_rsa_ctx *ctx = akcipher_tfm_ctx_dma(tfm);
8439e94fceb3812 Horia Geantă  2016-11-09  1053  	struct rsa_key raw_key = {NULL};
8c419778ab57e49 Tudor Ambarus 2016-07-04  1054  	struct caam_rsa_key *rsa_key = &ctx->key;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1055  	int ret;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1056  
8c419778ab57e49 Tudor Ambarus 2016-07-04  1057  	/* Free the old RSA key if any */
8c419778ab57e49 Tudor Ambarus 2016-07-04  1058  	caam_rsa_free_key(rsa_key);
8c419778ab57e49 Tudor Ambarus 2016-07-04  1059  
8c419778ab57e49 Tudor Ambarus 2016-07-04  1060  	ret = rsa_parse_priv_key(&raw_key, key, keylen);
8c419778ab57e49 Tudor Ambarus 2016-07-04  1061  	if (ret)
8c419778ab57e49 Tudor Ambarus 2016-07-04  1062  		return ret;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1063  
8c419778ab57e49 Tudor Ambarus 2016-07-04  1064  	/* Copy key in DMA zone */
199354d7fb6eaa2 Herbert Xu    2022-12-30  1065  	rsa_key->d = kmemdup(raw_key.d, raw_key.d_sz, GFP_KERNEL);
8c419778ab57e49 Tudor Ambarus 2016-07-04  1066  	if (!rsa_key->d)
8c419778ab57e49 Tudor Ambarus 2016-07-04  1067  		goto err;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1068  
199354d7fb6eaa2 Herbert Xu    2022-12-30  1069  	rsa_key->e = kmemdup(raw_key.e, raw_key.e_sz, GFP_KERNEL);
8c419778ab57e49 Tudor Ambarus 2016-07-04  1070  	if (!rsa_key->e)
8c419778ab57e49 Tudor Ambarus 2016-07-04  1071  		goto err;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1072  
8c419778ab57e49 Tudor Ambarus 2016-07-04  1073  	/*
8c419778ab57e49 Tudor Ambarus 2016-07-04  1074  	 * Skip leading zeros and copy the positive integer to a buffer
199354d7fb6eaa2 Herbert Xu    2022-12-30  1075  	 * allocated in the GFP_KERNEL zone. The decryption descriptor
8c419778ab57e49 Tudor Ambarus 2016-07-04  1076  	 * expects a positive integer for the RSA modulus and uses its length as
8c419778ab57e49 Tudor Ambarus 2016-07-04  1077  	 * decryption output length.
8c419778ab57e49 Tudor Ambarus 2016-07-04  1078  	 */
8c419778ab57e49 Tudor Ambarus 2016-07-04  1079  	rsa_key->n = caam_read_raw_data(raw_key.n, &raw_key.n_sz);
8c419778ab57e49 Tudor Ambarus 2016-07-04  1080  	if (!rsa_key->n)
8c419778ab57e49 Tudor Ambarus 2016-07-04  1081  		goto err;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1082  
8c419778ab57e49 Tudor Ambarus 2016-07-04  1083  	if (caam_rsa_check_key_length(raw_key.n_sz << 3)) {
8c419778ab57e49 Tudor Ambarus 2016-07-04  1084  		caam_rsa_free_key(rsa_key);
8c419778ab57e49 Tudor Ambarus 2016-07-04 @1085  		return -EINVAL;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1086  	}
8c419778ab57e49 Tudor Ambarus 2016-07-04  1087  
8c419778ab57e49 Tudor Ambarus 2016-07-04  1088  	rsa_key->d_sz = raw_key.d_sz;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1089  	rsa_key->e_sz = raw_key.e_sz;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1090  	rsa_key->n_sz = raw_key.n_sz;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1091  
b64140c74e954f1 Chen Ridong   2024-11-04  1092  	ret = caam_rsa_set_priv_key_form(ctx, &raw_key);
b64140c74e954f1 Chen Ridong   2024-11-04  1093  	if (ret)
b64140c74e954f1 Chen Ridong   2024-11-04  1094  		goto err;
52e26d77b8b3de2 Radu Alexe    2017-04-25  1095  
8c419778ab57e49 Tudor Ambarus 2016-07-04  1096  	return 0;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1097  
8c419778ab57e49 Tudor Ambarus 2016-07-04  1098  err:
8c419778ab57e49 Tudor Ambarus 2016-07-04  1099  	caam_rsa_free_key(rsa_key);
8c419778ab57e49 Tudor Ambarus 2016-07-04  1100  	return -ENOMEM;
8c419778ab57e49 Tudor Ambarus 2016-07-04  1101  }
8c419778ab57e49 Tudor Ambarus 2016-07-04  1102  

:::::: The code at line 1085 was first introduced by commit
:::::: 8c419778ab57e497b5de1352aa39dbe2efb3ed54 crypto: caam - add support for RSA algorithm

:::::: TO: Tudor Ambarus <tudor-dan.ambarus@nxp.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
