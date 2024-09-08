Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CCF3A1B5
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Sep 2024 23:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725838211; cv=none; b=U4Q7VoHQv7SxFwDG8WLLSIyUwuwTbSb3h4cwbxm0YMAvFwzz1Sbaf3wL+IXE/y9AxPm9G0f9CQL4fqw5jlRpLowjUSPssAEjZ9mXyV0qikSKP2G8/TT0yh1tjqGnZcrzRImGLqZtMSOcQ2BU3+iSzRRp14XXc3ONQPUsAfpfcOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725838211; c=relaxed/simple;
	bh=wWYRD0pBciF+8QwTxLG4JwxLGlbB+6PBD3I1J4hs4Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jv0zwSqbYZNx7STza7AKrwTUYMH+BT7MbYUxYr/M3ZvsHUIpX64ps8eeYsFQQO+wDT6+fkFrFJSizhNqOwiox1NnT4PLdNUV9cX5agJf+pvisqcbRIqCOcYIuejTXAMko5t9lzM6vGucAroJwnm1N40S0z6hQOxuQq/XN+QsCKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMDuoMHu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMDuoMHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725838209; x=1757374209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wWYRD0pBciF+8QwTxLG4JwxLGlbB+6PBD3I1J4hs4Yw=;
  b=eMDuoMHuaMkqp92kGr/Y+YoMxVmpcSWTvGFgIJ6POW61k5H2ApEUGAMl
   vpxC1ejNlCro48CP6kyLA0/2oR5aWVR2bZ0FA1YbA7tZddvNyN7NuXosK
   DvIRniow6ON9EnILN2mcOut1L4feNDHKt1Pzj1Jhj5JnJpi7/2qBw35rB
   HmomeZ8yc02NMmYcHYNUkfeZK6p9Oj2MtLaiYsAnJCkE8Th7dYFwBynyD
   q5BY1M37vtVTi6XRSX2Rf07QkbtUunoa6zzAOgzTE/Vgz7BvJ432dDUQx
   /1cXYrrX8iPrDB2I+k3nGyAtSpq1z85bNE9kqBleANHPrhH8H6ap+qz4O
   w==;
X-CSE-ConnectionGUID: cs7pYTN7TxyqDcxKCXMSyw==
X-CSE-MsgGUID: DArs3TVYSV6IcXvG1kFgMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35865350"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="35865350"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 16:30:08 -0700
X-CSE-ConnectionGUID: kS1V5cDISkO5MSOlDF3kWA==
X-CSE-MsgGUID: xGeuQVSxQ4KRFZLWHN6zEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66481163"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2024 16:30:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snRM4-000E4k-1O;
	Sun, 08 Sep 2024 23:30:04 +0000
Date: Mon, 9 Sep 2024 07:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/n2_core.c:1406 __n2_register_one_hmac() error:
 uninitialized symbol 'err'.
Message-ID: <202409090726.TP0WfY7p-lkp@intel.com>
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
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89f5e14d05b4852db5ecdf222dc6a13edc633658
commit: 8c20982caca4b10ca79aea8134a16ea98989ca03 crypto: n2 - Silence gcc format-truncation false positive warnings
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: sparc-randconfig-r071-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090726.TP0WfY7p-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409090726.TP0WfY7p-lkp@intel.com/

smatch warnings:
drivers/crypto/n2_core.c:1406 __n2_register_one_hmac() error: uninitialized symbol 'err'.

vim +/err +1406 drivers/crypto/n2_core.c

0a625fd2abaa0a David S. Miller    2010-05-19  1365  
49cfe4db2ddc4d Greg Kroah-Hartman 2012-12-21  1366  static int __n2_register_one_hmac(struct n2_ahash_alg *n2ahash)
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1367  {
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1368  	struct n2_hmac_alg *p = kzalloc(sizeof(*p), GFP_KERNEL);
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1369  	struct ahash_alg *ahash;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1370  	struct crypto_alg *base;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1371  	int err;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1372  
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1373  	if (!p)
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1374  		return -ENOMEM;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1375  
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1376  	p->child_alg = n2ahash->alg.halg.base.cra_name;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1377  	memcpy(&p->derived, n2ahash, sizeof(struct n2_ahash_alg));
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1378  	INIT_LIST_HEAD(&p->derived.entry);
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1379  
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1380  	ahash = &p->derived.alg;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1381  	ahash->digest = n2_hmac_async_digest;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1382  	ahash->setkey = n2_hmac_async_setkey;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1383  
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1384  	base = &ahash->halg.base;
8c20982caca4b1 Herbert Xu         2023-10-27  1385  	if (snprintf(base->cra_name, CRYPTO_MAX_ALG_NAME, "hmac(%s)",
8c20982caca4b1 Herbert Xu         2023-10-27  1386  		     p->child_alg) >= CRYPTO_MAX_ALG_NAME)
8c20982caca4b1 Herbert Xu         2023-10-27  1387  		goto out_free_p;
8c20982caca4b1 Herbert Xu         2023-10-27  1388  	if (snprintf(base->cra_driver_name, CRYPTO_MAX_ALG_NAME, "hmac-%s-n2",
8c20982caca4b1 Herbert Xu         2023-10-27  1389  		     p->child_alg) >= CRYPTO_MAX_ALG_NAME)
8c20982caca4b1 Herbert Xu         2023-10-27  1390  		goto out_free_p;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1391  
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1392  	base->cra_ctxsize = sizeof(struct n2_hmac_ctx);
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1393  	base->cra_init = n2_hmac_cra_init;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1394  	base->cra_exit = n2_hmac_cra_exit;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1395  
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1396  	list_add(&p->derived.entry, &hmac_algs);
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1397  	err = crypto_register_ahash(ahash);
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1398  	if (err) {
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1399  		pr_err("%s alg registration failed\n", base->cra_name);
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1400  		list_del(&p->derived.entry);
8c20982caca4b1 Herbert Xu         2023-10-27  1401  out_free_p:
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1402  		kfree(p);
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1403  	} else {
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1404  		pr_info("%s alg registered\n", base->cra_name);
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1405  	}
dc4ccfd15d4fc7 David S. Miller    2010-05-22 @1406  	return err;
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1407  }
dc4ccfd15d4fc7 David S. Miller    2010-05-22  1408  

:::::: The code at line 1406 was first introduced by commit
:::::: dc4ccfd15d4fc7a91ddf222bc5eed5cc4bcf10e6 n2_crypto: Add HMAC support.

:::::: TO: David S. Miller <davem@davemloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
