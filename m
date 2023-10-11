Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D03847D
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 05:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaOBo1CC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697002897; x=1728538897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7zjCPw37jTy8fi+NIobvCWIQRWFmOhbFD/K7m7OER5M=;
  b=RaOBo1CCPke7Bc+riq3LR+upoxuNZQLRICYJih+5QZJnJtBakc2i79HS
   OIVYZr8mpDOqfMVqYa4UWemrs1cg7zWv/83PaYdZzKJljz7rCMAli7F7U
   2gHv+0OCWMPa/4uxq+iLvIRretqttiAzwVL8ulu8is9kEfsKdqilgy8kj
   z73unhxRYITHOcUrSTOJv2l8U46k3suIOs0bLkDgdEJ4+/CcAOPtteNOZ
   /w+lK8/QG9k3g1xkCLferoriv8mK9JnU0jRLi4tX+uSsBjAI/7jaKSi+D
   ivdWXGIOlzjR1L036WWn8nI/9WaKjL/IAAMNgm4gUYAz0fdkmBy7gBb0j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="451076440"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="451076440"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 22:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788864233"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="788864233"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 22:41:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqRyO-0001mh-35;
	Wed, 11 Oct 2023 05:41:32 +0000
Date: Wed, 11 Oct 2023 13:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5422/11192] crypto/lskcipher.c:639
 lskcipher_alloc_instance_simple() warn: passing zero to 'ERR_PTR'
Message-ID: <202310111323.ZjK7bzjw-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0a6edb636cba9c0d1db966a54d910a02e52e4be
commit: 8aee5d4ebd113319f6882b2cd0475d270fdc0d41 [5422/11192] crypto: lskcipher - Add compatibility wrapper around ECB
:::::: branch date: 24 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20230921 (https://download.01.org/0day-ci/archive/20231011/202310111323.ZjK7bzjw-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310111323.ZjK7bzjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310111323.ZjK7bzjw-lkp@intel.com/

smatch warnings:
crypto/lskcipher.c:639 lskcipher_alloc_instance_simple() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +639 crypto/lskcipher.c

31865c4c4db2b7 Herbert Xu 2023-09-14  515  
31865c4c4db2b7 Herbert Xu 2023-09-14  516  /**
31865c4c4db2b7 Herbert Xu 2023-09-14  517   * lskcipher_alloc_instance_simple - allocate instance of simple block cipher
31865c4c4db2b7 Herbert Xu 2023-09-14  518   *
31865c4c4db2b7 Herbert Xu 2023-09-14  519   * Allocate an lskcipher_instance for a simple block cipher mode of operation,
31865c4c4db2b7 Herbert Xu 2023-09-14  520   * e.g. cbc or ecb.  The instance context will have just a single crypto_spawn,
31865c4c4db2b7 Herbert Xu 2023-09-14  521   * that for the underlying cipher.  The {min,max}_keysize, ivsize, blocksize,
31865c4c4db2b7 Herbert Xu 2023-09-14  522   * alignmask, and priority are set from the underlying cipher but can be
31865c4c4db2b7 Herbert Xu 2023-09-14  523   * overridden if needed.  The tfm context defaults to
31865c4c4db2b7 Herbert Xu 2023-09-14  524   * struct crypto_lskcipher *, and default ->setkey(), ->init(), and
31865c4c4db2b7 Herbert Xu 2023-09-14  525   * ->exit() methods are installed.
31865c4c4db2b7 Herbert Xu 2023-09-14  526   *
31865c4c4db2b7 Herbert Xu 2023-09-14  527   * @tmpl: the template being instantiated
31865c4c4db2b7 Herbert Xu 2023-09-14  528   * @tb: the template parameters
31865c4c4db2b7 Herbert Xu 2023-09-14  529   *
31865c4c4db2b7 Herbert Xu 2023-09-14  530   * Return: a pointer to the new instance, or an ERR_PTR().  The caller still
31865c4c4db2b7 Herbert Xu 2023-09-14  531   *	   needs to register the instance.
31865c4c4db2b7 Herbert Xu 2023-09-14  532   */
31865c4c4db2b7 Herbert Xu 2023-09-14  533  struct lskcipher_instance *lskcipher_alloc_instance_simple(
31865c4c4db2b7 Herbert Xu 2023-09-14  534  	struct crypto_template *tmpl, struct rtattr **tb)
31865c4c4db2b7 Herbert Xu 2023-09-14  535  {
31865c4c4db2b7 Herbert Xu 2023-09-14  536  	u32 mask;
31865c4c4db2b7 Herbert Xu 2023-09-14  537  	struct lskcipher_instance *inst;
31865c4c4db2b7 Herbert Xu 2023-09-14  538  	struct crypto_lskcipher_spawn *spawn;
8aee5d4ebd1133 Herbert Xu 2023-09-14  539  	char ecb_name[CRYPTO_MAX_ALG_NAME];
31865c4c4db2b7 Herbert Xu 2023-09-14  540  	struct lskcipher_alg *cipher_alg;
8aee5d4ebd1133 Herbert Xu 2023-09-14  541  	const char *cipher_name;
31865c4c4db2b7 Herbert Xu 2023-09-14  542  	int err;
31865c4c4db2b7 Herbert Xu 2023-09-14  543  
31865c4c4db2b7 Herbert Xu 2023-09-14  544  	err = crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_LSKCIPHER, &mask);
31865c4c4db2b7 Herbert Xu 2023-09-14  545  	if (err)
31865c4c4db2b7 Herbert Xu 2023-09-14  546  		return ERR_PTR(err);
31865c4c4db2b7 Herbert Xu 2023-09-14  547  
8aee5d4ebd1133 Herbert Xu 2023-09-14  548  	cipher_name = crypto_attr_alg_name(tb[1]);
8aee5d4ebd1133 Herbert Xu 2023-09-14  549  	if (IS_ERR(cipher_name))
8aee5d4ebd1133 Herbert Xu 2023-09-14  550  		return ERR_CAST(cipher_name);
8aee5d4ebd1133 Herbert Xu 2023-09-14  551  
31865c4c4db2b7 Herbert Xu 2023-09-14  552  	inst = kzalloc(sizeof(*inst) + sizeof(*spawn), GFP_KERNEL);
31865c4c4db2b7 Herbert Xu 2023-09-14  553  	if (!inst)
31865c4c4db2b7 Herbert Xu 2023-09-14  554  		return ERR_PTR(-ENOMEM);
31865c4c4db2b7 Herbert Xu 2023-09-14  555  
31865c4c4db2b7 Herbert Xu 2023-09-14  556  	spawn = lskcipher_instance_ctx(inst);
31865c4c4db2b7 Herbert Xu 2023-09-14  557  	err = crypto_grab_lskcipher(spawn,
31865c4c4db2b7 Herbert Xu 2023-09-14  558  				    lskcipher_crypto_instance(inst),
8aee5d4ebd1133 Herbert Xu 2023-09-14  559  				    cipher_name, 0, mask);
8aee5d4ebd1133 Herbert Xu 2023-09-14  560  
8aee5d4ebd1133 Herbert Xu 2023-09-14  561  	ecb_name[0] = 0;
8aee5d4ebd1133 Herbert Xu 2023-09-14  562  	if (err == -ENOENT && !!memcmp(tmpl->name, "ecb", 4)) {
8aee5d4ebd1133 Herbert Xu 2023-09-14  563  		err = -ENAMETOOLONG;
8aee5d4ebd1133 Herbert Xu 2023-09-14  564  		if (snprintf(ecb_name, CRYPTO_MAX_ALG_NAME, "ecb(%s)",
8aee5d4ebd1133 Herbert Xu 2023-09-14  565  			     cipher_name) >= CRYPTO_MAX_ALG_NAME)
8aee5d4ebd1133 Herbert Xu 2023-09-14  566  			goto err_free_inst;
8aee5d4ebd1133 Herbert Xu 2023-09-14  567  
8aee5d4ebd1133 Herbert Xu 2023-09-14  568  		err = crypto_grab_lskcipher(spawn,
8aee5d4ebd1133 Herbert Xu 2023-09-14  569  					    lskcipher_crypto_instance(inst),
8aee5d4ebd1133 Herbert Xu 2023-09-14  570  					    ecb_name, 0, mask);
8aee5d4ebd1133 Herbert Xu 2023-09-14  571  	}
8aee5d4ebd1133 Herbert Xu 2023-09-14  572  
31865c4c4db2b7 Herbert Xu 2023-09-14  573  	if (err)
31865c4c4db2b7 Herbert Xu 2023-09-14  574  		goto err_free_inst;
8aee5d4ebd1133 Herbert Xu 2023-09-14  575  
31865c4c4db2b7 Herbert Xu 2023-09-14  576  	cipher_alg = crypto_lskcipher_spawn_alg(spawn);
31865c4c4db2b7 Herbert Xu 2023-09-14  577  
31865c4c4db2b7 Herbert Xu 2023-09-14  578  	err = crypto_inst_setname(lskcipher_crypto_instance(inst), tmpl->name,
31865c4c4db2b7 Herbert Xu 2023-09-14  579  				  &cipher_alg->co.base);
31865c4c4db2b7 Herbert Xu 2023-09-14  580  	if (err)
31865c4c4db2b7 Herbert Xu 2023-09-14  581  		goto err_free_inst;
31865c4c4db2b7 Herbert Xu 2023-09-14  582  
8aee5d4ebd1133 Herbert Xu 2023-09-14  583  	if (ecb_name[0]) {
8aee5d4ebd1133 Herbert Xu 2023-09-14  584  		int len;
8aee5d4ebd1133 Herbert Xu 2023-09-14  585  
8aee5d4ebd1133 Herbert Xu 2023-09-14  586  		len = strscpy(ecb_name, &cipher_alg->co.base.cra_name[4],
8aee5d4ebd1133 Herbert Xu 2023-09-14  587  			      sizeof(ecb_name));
8aee5d4ebd1133 Herbert Xu 2023-09-14  588  		if (len < 2)
8aee5d4ebd1133 Herbert Xu 2023-09-14  589  			goto err_free_inst;
8aee5d4ebd1133 Herbert Xu 2023-09-14  590  
8aee5d4ebd1133 Herbert Xu 2023-09-14  591  		if (ecb_name[len - 1] != ')')
8aee5d4ebd1133 Herbert Xu 2023-09-14  592  			goto err_free_inst;
8aee5d4ebd1133 Herbert Xu 2023-09-14  593  
8aee5d4ebd1133 Herbert Xu 2023-09-14  594  		ecb_name[len - 1] = 0;
8aee5d4ebd1133 Herbert Xu 2023-09-14  595  
8aee5d4ebd1133 Herbert Xu 2023-09-14  596  		err = -ENAMETOOLONG;
8aee5d4ebd1133 Herbert Xu 2023-09-14  597  		if (snprintf(inst->alg.co.base.cra_name, CRYPTO_MAX_ALG_NAME,
8aee5d4ebd1133 Herbert Xu 2023-09-14  598  			     "%s(%s)", tmpl->name, ecb_name) >=
8aee5d4ebd1133 Herbert Xu 2023-09-14  599  		    CRYPTO_MAX_ALG_NAME)
8aee5d4ebd1133 Herbert Xu 2023-09-14  600  			goto err_free_inst;
8aee5d4ebd1133 Herbert Xu 2023-09-14  601  
8aee5d4ebd1133 Herbert Xu 2023-09-14  602  		if (strcmp(ecb_name, cipher_name) &&
8aee5d4ebd1133 Herbert Xu 2023-09-14  603  		    snprintf(inst->alg.co.base.cra_driver_name,
8aee5d4ebd1133 Herbert Xu 2023-09-14  604  			     CRYPTO_MAX_ALG_NAME,
8aee5d4ebd1133 Herbert Xu 2023-09-14  605  			     "%s(%s)", tmpl->name, cipher_name) >=
8aee5d4ebd1133 Herbert Xu 2023-09-14  606  		    CRYPTO_MAX_ALG_NAME)
8aee5d4ebd1133 Herbert Xu 2023-09-14  607  			goto err_free_inst;
8aee5d4ebd1133 Herbert Xu 2023-09-14  608  	} else {
31865c4c4db2b7 Herbert Xu 2023-09-14  609  		/* Don't allow nesting. */
31865c4c4db2b7 Herbert Xu 2023-09-14  610  		err = -ELOOP;
31865c4c4db2b7 Herbert Xu 2023-09-14  611  		if ((cipher_alg->co.base.cra_flags & CRYPTO_ALG_INSTANCE))
31865c4c4db2b7 Herbert Xu 2023-09-14  612  			goto err_free_inst;
8aee5d4ebd1133 Herbert Xu 2023-09-14  613  	}
31865c4c4db2b7 Herbert Xu 2023-09-14  614  
31865c4c4db2b7 Herbert Xu 2023-09-14  615  	err = -EINVAL;
31865c4c4db2b7 Herbert Xu 2023-09-14  616  	if (cipher_alg->co.ivsize)
31865c4c4db2b7 Herbert Xu 2023-09-14  617  		goto err_free_inst;
31865c4c4db2b7 Herbert Xu 2023-09-14  618  
31865c4c4db2b7 Herbert Xu 2023-09-14  619  	inst->free = lskcipher_free_instance_simple;
31865c4c4db2b7 Herbert Xu 2023-09-14  620  
31865c4c4db2b7 Herbert Xu 2023-09-14  621  	/* Default algorithm properties, can be overridden */
31865c4c4db2b7 Herbert Xu 2023-09-14  622  	inst->alg.co.base.cra_blocksize = cipher_alg->co.base.cra_blocksize;
31865c4c4db2b7 Herbert Xu 2023-09-14  623  	inst->alg.co.base.cra_alignmask = cipher_alg->co.base.cra_alignmask;
31865c4c4db2b7 Herbert Xu 2023-09-14  624  	inst->alg.co.base.cra_priority = cipher_alg->co.base.cra_priority;
31865c4c4db2b7 Herbert Xu 2023-09-14  625  	inst->alg.co.min_keysize = cipher_alg->co.min_keysize;
31865c4c4db2b7 Herbert Xu 2023-09-14  626  	inst->alg.co.max_keysize = cipher_alg->co.max_keysize;
31865c4c4db2b7 Herbert Xu 2023-09-14  627  	inst->alg.co.ivsize = cipher_alg->co.base.cra_blocksize;
31865c4c4db2b7 Herbert Xu 2023-09-14  628  
31865c4c4db2b7 Herbert Xu 2023-09-14  629  	/* Use struct crypto_lskcipher * by default, can be overridden */
31865c4c4db2b7 Herbert Xu 2023-09-14  630  	inst->alg.co.base.cra_ctxsize = sizeof(struct crypto_lskcipher *);
31865c4c4db2b7 Herbert Xu 2023-09-14  631  	inst->alg.setkey = lskcipher_setkey_simple;
31865c4c4db2b7 Herbert Xu 2023-09-14  632  	inst->alg.init = lskcipher_init_tfm_simple;
31865c4c4db2b7 Herbert Xu 2023-09-14  633  	inst->alg.exit = lskcipher_exit_tfm_simple;
31865c4c4db2b7 Herbert Xu 2023-09-14  634  
31865c4c4db2b7 Herbert Xu 2023-09-14  635  	return inst;
31865c4c4db2b7 Herbert Xu 2023-09-14  636  
31865c4c4db2b7 Herbert Xu 2023-09-14  637  err_free_inst:
31865c4c4db2b7 Herbert Xu 2023-09-14  638  	lskcipher_free_instance_simple(inst);
31865c4c4db2b7 Herbert Xu 2023-09-14 @639  	return ERR_PTR(err);

:::::: The code at line 639 was first introduced by commit
:::::: 31865c4c4db2b742fec6ccbff80483fa3e7ab9b9 crypto: skcipher - Add lskcipher

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
