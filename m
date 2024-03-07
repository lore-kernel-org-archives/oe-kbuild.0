Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C7A12E1F1
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Mar 2024 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821474; cv=none; b=T5hD+p9SeIPlzbpnSGouSab9Jt1SXNEFMKMKy/ipUfM6dmW7jswurm+xFGIIrw7Grx/ak0cnXRUc5oM3pVUl1vFMgz0n/AvDf93jM63cwyLM3sUls7kleh52c2t/8RXgd3PJc72G+PyUjuMu1mTIsIi404qn9zy+cNl51yTYuhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821474; c=relaxed/simple;
	bh=XfdgPqsryEimkaX+ec7UD2N0XK3t6eWPFGrc88DKSis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OFalocsW1yPoo7WioJ6xFbmraysGbzAAeQrIRfLNKN1JprvA5lCpNnhzUKwQ1l5toyJCvfYYADKZShR+vGYTzOOyhFzdlMt8SmwnPYjZcheuvpmDNHa7vfhUl170DkekkqXjZKdhGwh9UFV7zqIq/SRlj9aZ9Ysczi5WmpTQgaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IOj8bYRX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IOj8bYRX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412f1ccf8d8so9073785e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Mar 2024 06:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821471; x=1710426271; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KLkEU65YERPzZDXp5EuRPV0oeNk1pD4FHKA6c0/zoZU=;
        b=IOj8bYRXqr/NyR/UL5PeSGLfyTWLArHwlx+QdqKgnD3nKl7sxsYOKYuoUVVOJ9Tiyw
         C3lvIx0OkKo1M6C/B0eQxhTXnz6V6maS8mhM6zax7LMAiT0Hfaj4lQ8Vqxpme3fs41ma
         JUgPQ785UncwsrLd1io30TcuFatUDSWttxOPmJnJGvFzF7JDhCYyTeo+Ew1jmk7DJZcK
         E3XsTUk9NATXyjUDGHUQ8takuDm4+taDLdiJA6Rf4hcfoEB5wgJwnNM9KZvnscKfjCLQ
         IJyn7GjcSs7/eg5vu1soxqlNytZC1iQbeI/Y6iu0++++CsHetZyE2gwIzP78Weon4BK9
         Nhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821471; x=1710426271;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLkEU65YERPzZDXp5EuRPV0oeNk1pD4FHKA6c0/zoZU=;
        b=wvBrVeVf9nJ4spLgRXE3IeRSotrhXoDYYb1rAq9XMMgQzslNtpQt/0p0Ql3UcsGm1q
         r3VYxVYgw24No9Axp6qKgkpL2h6q4WdvdwrkRq5Ki5ipJG0odxT9GPLq3eRtv0zOCrBg
         ju4gv80gA6c4naNghCzfUCmAGbjbUrrMf0+LcOod+BhaeiiK7B3R0gEHb3goCEDZGn3c
         vmCG2nGyc29Sx6dbWPMx2gdgA4UuLPKhR2ofmWVeyCpVp45TKTI5JwqjP2fv7mszl+z4
         BLQa8n0K+Q+vBMUfF0EGdpxMtArvcbrTI7i2dECvcol6NGfljD6YkWcN+F6laB+RIVmf
         W9Qw==
X-Gm-Message-State: AOJu0YywyzcCWYsw7TVp7xZxuyuIts5lNBfVM/cKnTHfbti1c7RpVPdl
	HnGg+EGWnbj8rVKiwcNO5vMvobM6UgxduuMeZGi8o+1HbQB+n2wfbbUgD8kJIbC/AZQVrB5DzLf
	j
X-Google-Smtp-Source: AGHT+IFkS3QjWn6zABoMsQq7lMuBHhk7E02ZrOa2EckIwNumg7/2o3gzTOlzWBFXp44p7lqgjQ21Kw==
X-Received: by 2002:a05:600c:474a:b0:412:bf52:9ac2 with SMTP id w10-20020a05600c474a00b00412bf529ac2mr14481024wmo.14.1709821470461;
        Thu, 07 Mar 2024 06:24:30 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bq27-20020a5d5a1b000000b0033e6879817esm1363499wrb.58.2024.03.07.06.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:24:30 -0800 (PST)
Date: Thu, 7 Mar 2024 17:24:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Pavitrakumar M <pavitrakumarm@vayavyalabs.com>,
	herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Ruud.Derwig@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
Subject: Re: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <c9d89052-74c8-4746-a54c-c199786743fb@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305112831.3380896-5-pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-driver-to-Linux-kernel/20240305-193337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20240305112831.3380896-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
config: m68k-randconfig-r081-20240307 (https://download.01.org/0day-ci/archive/20240307/202403072256.em3Fk3At-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403072256.em3Fk3At-lkp@intel.com/

New smatch warnings:
drivers/crypto/dwc-spacc/spacc_ahash.c:1057 spacc_hash_digest() error: uninitialized symbol 'total_len'.

Old smatch warnings:
drivers/crypto/dwc-spacc/spacc_ahash.c:271 spacc_hash_init_dma() error: uninitialized symbol 'sgl_buffer'.

vim +/total_len +1057 drivers/crypto/dwc-spacc/spacc_ahash.c

6ad822cec22644 Pavitrakumar M 2024-03-05   981  
6ad822cec22644 Pavitrakumar M 2024-03-05   982  static int spacc_hash_digest(struct ahash_request *req)
6ad822cec22644 Pavitrakumar M 2024-03-05   983  {
6ad822cec22644 Pavitrakumar M 2024-03-05   984  	int final = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05   985  	int rc, total_len;
6ad822cec22644 Pavitrakumar M 2024-03-05   986  	struct crypto_ahash *reqtfm = crypto_ahash_reqtfm(req);
6ad822cec22644 Pavitrakumar M 2024-03-05   987  	struct spacc_crypto_ctx *tctx = crypto_ahash_ctx(reqtfm);
6ad822cec22644 Pavitrakumar M 2024-03-05   988  	struct spacc_crypto_reqctx *ctx = ahash_request_ctx(req);
6ad822cec22644 Pavitrakumar M 2024-03-05   989  	struct spacc_priv *priv = dev_get_drvdata(tctx->dev);
6ad822cec22644 Pavitrakumar M 2024-03-05   990  
6ad822cec22644 Pavitrakumar M 2024-03-05   991  	if (tctx->flag_ppp) {
6ad822cec22644 Pavitrakumar M 2024-03-05   992  		/* from finup */
6ad822cec22644 Pavitrakumar M 2024-03-05   993  		ctx->single_shot = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05   994  		ctx->final_part_pck = 1;
6ad822cec22644 Pavitrakumar M 2024-03-05   995  		final = 2;
6ad822cec22644 Pavitrakumar M 2024-03-05   996  	} else {
6ad822cec22644 Pavitrakumar M 2024-03-05   997  		/* direct single shot digest call */
6ad822cec22644 Pavitrakumar M 2024-03-05   998  		ctx->single_shot = 1;
6ad822cec22644 Pavitrakumar M 2024-03-05   999  		ctx->rem_len = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05  1000  		ctx->total_nents = sg_nents(req->src);
6ad822cec22644 Pavitrakumar M 2024-03-05  1001  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  1002  
6ad822cec22644 Pavitrakumar M 2024-03-05  1003  	if (tctx->handle < 0 || !tctx->ctx_valid ||
6ad822cec22644 Pavitrakumar M 2024-03-05  1004  	    req->nbytes > priv->max_msg_len)
6ad822cec22644 Pavitrakumar M 2024-03-05  1005  		goto fallback;

"total_len" not intialized for these gotos

6ad822cec22644 Pavitrakumar M 2024-03-05  1006  
6ad822cec22644 Pavitrakumar M 2024-03-05  1007  	rc = spacc_hash_init_dma(tctx->dev, req, final);
6ad822cec22644 Pavitrakumar M 2024-03-05  1008  	if (rc < 0)
6ad822cec22644 Pavitrakumar M 2024-03-05  1009  		goto fallback;
6ad822cec22644 Pavitrakumar M 2024-03-05  1010  
6ad822cec22644 Pavitrakumar M 2024-03-05  1011  	if (rc == 0)
6ad822cec22644 Pavitrakumar M 2024-03-05  1012  		return 0;
6ad822cec22644 Pavitrakumar M 2024-03-05  1013  
6ad822cec22644 Pavitrakumar M 2024-03-05  1014  	if (final) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1015  		if (ctx->total_nents) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1016  			/* INIT-UPDATE-UPDATE-FINUP/FINAL */
6ad822cec22644 Pavitrakumar M 2024-03-05  1017  			total_len = tctx->ppp_sgl[0].length;
6ad822cec22644 Pavitrakumar M 2024-03-05  1018  		} else if (req->src->length == 0 && ctx->total_nents == 0) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1019  			/* zero msg handling */
6ad822cec22644 Pavitrakumar M 2024-03-05  1020  			total_len = 0;
6ad822cec22644 Pavitrakumar M 2024-03-05  1021  		} else {
6ad822cec22644 Pavitrakumar M 2024-03-05  1022  			/* handle INIT-FINUP sequence, process req->nbytes */
6ad822cec22644 Pavitrakumar M 2024-03-05  1023  			total_len = req->nbytes;
6ad822cec22644 Pavitrakumar M 2024-03-05  1024  		}
6ad822cec22644 Pavitrakumar M 2024-03-05  1025  
6ad822cec22644 Pavitrakumar M 2024-03-05  1026  		rc = spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
6ad822cec22644 Pavitrakumar M 2024-03-05  1027  				&ctx->src, &ctx->dst, total_len,
6ad822cec22644 Pavitrakumar M 2024-03-05  1028  				0, total_len, 0, 0, 0);
6ad822cec22644 Pavitrakumar M 2024-03-05  1029  	} else {
6ad822cec22644 Pavitrakumar M 2024-03-05  1030  		rc = spacc_packet_enqueue_ddt(&priv->spacc, ctx->acb.new_handle,
6ad822cec22644 Pavitrakumar M 2024-03-05  1031  				&ctx->src, &ctx->dst, req->nbytes,
6ad822cec22644 Pavitrakumar M 2024-03-05  1032  				0, req->nbytes, 0, 0, 0);
6ad822cec22644 Pavitrakumar M 2024-03-05  1033  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  1034  
6ad822cec22644 Pavitrakumar M 2024-03-05  1035  	if (rc < 0) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1036  		spacc_hash_cleanup_dma(tctx->dev, req);
6ad822cec22644 Pavitrakumar M 2024-03-05  1037  		spacc_close(&priv->spacc, ctx->acb.new_handle);
6ad822cec22644 Pavitrakumar M 2024-03-05  1038  
6ad822cec22644 Pavitrakumar M 2024-03-05  1039  		if (rc != -EBUSY) {
6ad822cec22644 Pavitrakumar M 2024-03-05  1040  			pr_debug("Failed to enqueue job, ERR: %d\n", rc);
6ad822cec22644 Pavitrakumar M 2024-03-05  1041  			return rc;
6ad822cec22644 Pavitrakumar M 2024-03-05  1042  		}
6ad822cec22644 Pavitrakumar M 2024-03-05  1043  
6ad822cec22644 Pavitrakumar M 2024-03-05  1044  		if (!(req->base.flags & CRYPTO_TFM_REQ_MAY_BACKLOG))
6ad822cec22644 Pavitrakumar M 2024-03-05  1045  			return -EBUSY;
6ad822cec22644 Pavitrakumar M 2024-03-05  1046  
6ad822cec22644 Pavitrakumar M 2024-03-05  1047  		goto fallback;
6ad822cec22644 Pavitrakumar M 2024-03-05  1048  	}
6ad822cec22644 Pavitrakumar M 2024-03-05  1049  
6ad822cec22644 Pavitrakumar M 2024-03-05  1050  	return -EINPROGRESS;
6ad822cec22644 Pavitrakumar M 2024-03-05  1051  
6ad822cec22644 Pavitrakumar M 2024-03-05  1052  fallback:
6ad822cec22644 Pavitrakumar M 2024-03-05  1053  	/* Start from scratch as init is not called before digest */
6ad822cec22644 Pavitrakumar M 2024-03-05  1054  	ctx->fb.hash_req.base = req->base;
6ad822cec22644 Pavitrakumar M 2024-03-05  1055  	ahash_request_set_tfm(&ctx->fb.hash_req, tctx->fb.hash);
6ad822cec22644 Pavitrakumar M 2024-03-05  1056  
6ad822cec22644 Pavitrakumar M 2024-03-05 @1057  	ctx->fb.hash_req.nbytes = total_len;
                                                                                  ^^^^^^^^^

6ad822cec22644 Pavitrakumar M 2024-03-05  1058  	ctx->fb.hash_req.src = req->src;
6ad822cec22644 Pavitrakumar M 2024-03-05  1059  	ctx->fb.hash_req.result = req->result;
6ad822cec22644 Pavitrakumar M 2024-03-05  1060  
6ad822cec22644 Pavitrakumar M 2024-03-05  1061  	return crypto_ahash_digest(&ctx->fb.hash_req);
6ad822cec22644 Pavitrakumar M 2024-03-05  1062  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

