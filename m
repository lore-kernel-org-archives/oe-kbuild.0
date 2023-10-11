Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9FE18C1B
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCBzjo/t"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5033918c09eso8228477e87.2
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697008774; x=1697613574; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XCbt7AJhoTITBZG4cbkFQYUSlwUGs9oveivlxnvifE=;
        b=DCBzjo/t99E2cLx49AzzeXTjB9JCZMN0xqN51Sk9Xjq2+cKU9omKWNbFfLhYY+quHU
         IFN+Pk2lvYoGAmAxBhqtKmntecV5JaCBq3NJMlpvQH3rtLEh/TQ74AwlxDGm3qwdk3yN
         DHC1FXGcybKJnwcB8wh521/dLs4u0FImPC5EewhErRmyS6k2FqD2Yp7VxT/CDTX/Ktqw
         RJIy5HX4EgOHgs8NC2YjAT813hcBr5vYxNmX9uu7bu2o8BHSjgYeTbF/9XdmhwlevzC0
         GvuQ6IdIzkA1DBGpEG4cIf2wizoGurZ3uBIJBqqTZCfXQil2NoTQZjCTxH49bJmld/BE
         uUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697008774; x=1697613574;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XCbt7AJhoTITBZG4cbkFQYUSlwUGs9oveivlxnvifE=;
        b=jWKuKVr5j8KzToTagn5uYxECjKxKJWanH8WY6MbLeCISNJw34sgYDBzLnb0O1QSEow
         sGv/gmpn2rB66uACTFQEHA1wm2glPkz+FYyYyL7I8LsZO7awW/yLlhxMtSthTpa7FA6Y
         NxJ2Lq5xo4O4T+zHXJvWF4wzwUmsTpbjZ5Ivr4BKM5orH0JkBS+VOmVZ+ASvVrsnQ+YW
         +f+njM/KE0LOrq63JAMIKE46a9WXJs/n6f9gyRFqovNdBnFZrpqEH0+72oKpdVqr8Eg9
         1Ph+aRPx6os5TWHwNqHCZIv1CRJg9sW84ZH0qqfvm5cIYVCXIr9fngyyzKQv9H/vscje
         LP1g==
X-Gm-Message-State: AOJu0YyNi+wtFfFZiMfRSys4VD1y8GxHJvKIscxxVBvJTEow48H3I3Wy
	RFHkvugZym1V8odVczREMctVpu8jD2lHGmitT9k=
X-Google-Smtp-Source: AGHT+IFC9W5Tc/9vhf2kNKusIKo6qn5clErVPjmbQl6u47DKrrfXdgHo+5vcPc0ztZvb88iWnFv3rA==
X-Received: by 2002:ac2:5b4b:0:b0:503:c45:a6e1 with SMTP id i11-20020ac25b4b000000b005030c45a6e1mr14413339lfp.46.1697008774055;
        Wed, 11 Oct 2023 00:19:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a12-20020adff7cc000000b0031423a8f4f7sm14607237wrq.56.2023.10.11.00.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 00:19:33 -0700 (PDT)
Date: Wed, 11 Oct 2023 10:19:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5422/11192] crypto/lskcipher.c:639
 lskcipher_alloc_instance_simple() warn: passing zero to 'ERR_PTR'
Message-ID: <f9ae1fe1-5a78-442f-a3fb-3c01e6273d3f@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0a6edb636cba9c0d1db966a54d910a02e52e4be
commit: 8aee5d4ebd113319f6882b2cd0475d270fdc0d41 [5422/11192] crypto: lskcipher - Add compatibility wrapper around ECB
config: i386-randconfig-141-20230921 (https://download.01.org/0day-ci/archive/20231011/202310111323.ZjK7bzjw-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310111323.ZjK7bzjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310111323.ZjK7bzjw-lkp@intel.com/

smatch warnings:
crypto/lskcipher.c:639 lskcipher_alloc_instance_simple() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +639 crypto/lskcipher.c

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

Error not set on this error path

8aee5d4ebd1133 Herbert Xu 2023-09-14  590  
8aee5d4ebd1133 Herbert Xu 2023-09-14  591  		if (ecb_name[len - 1] != ')')
8aee5d4ebd1133 Herbert Xu 2023-09-14  592  			goto err_free_inst;

And here

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

