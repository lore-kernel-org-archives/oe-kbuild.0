Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792F98F6A
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 07:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eAQy+HiU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c032962c5so21848925e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Dec 2023 23:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701674328; x=1702279128; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fi3hpr0cHxx12GZtLwmUPUIkOwLCvXJWVDSx0cpa88g=;
        b=eAQy+HiUy33uJxsflozqsw034U2wPJvSLlyalsJpgHH3+7axP79PzXxTcdz7qEI2Ri
         EVcVyVD9hnaBJwimqDGAaTLHSRuJG+JgNLs/IvpD7s4zxPwJIH4MQkUZe1QUFmLdFV7U
         cmh+Vndx4pIMbo/FDldJorh51a/emnRyplzaQZKxj3gvG5lDHY6F+6fC6xCgKFRooAOg
         A8WzhvY8L2WHcF8I8IYNPEkwjNi2INf4qbUXdReWVIUwz5VsAIFZ49rL3XmnLK1OjHMj
         wY/Ax97NLyys7p0n+NKTLss+FYJx+G+alH2BeYuWnE1QVp1frY4Oslg8475bW8pSEqeq
         L6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701674328; x=1702279128;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi3hpr0cHxx12GZtLwmUPUIkOwLCvXJWVDSx0cpa88g=;
        b=FK98J5iNXTEN5H7263KhCcO0uV0ko9YELAEqI9acur6o5lZC42+qZdeXU8+2VULHby
         8Utan64FkrDpaYc9UI36GwYrA7qOcZ5ZGNioMIqWh3fi9z0rrarOKalvTyKD4dEjndNF
         LK/mkqqqeIkf47MRViIRN2NXYRoxuHLwRsLxv9w9lWePcfNW4mFYpdGkExZVvJcOeNvL
         LYR7mjE0I/atHtMVqtUxgR14y4ECR8oZeVUnyiRuT3QxB90B57PqsFJyEg82YvkzNFqy
         E4GDsMHdYkahjgUi08Tl9h+7SNbe7CHnfxS7bUt9izR4LHyKGUyQKTMUl+caUCFeXCUU
         oJsw==
X-Gm-Message-State: AOJu0YxMPEnwHQ7sIM7x5NbnDcNSilGWhEs3Fi5Lnlvqhpma222Xk9yF
	yFDP8fb7+jrA1CR+KpDFdeVR4ME4NDmwOz7al8w=
X-Google-Smtp-Source: AGHT+IHTJZPgn1igTSaSOMA9yAKQ+r/YPyqOdfW1wVBF1zkCtYQGNmA3D7yPtB1abWxOSw/BJghDjQ==
X-Received: by 2002:a05:600c:468f:b0:40b:5e21:c5e7 with SMTP id p15-20020a05600c468f00b0040b5e21c5e7mr1577142wmo.181.1701674328040;
        Sun, 03 Dec 2023 23:18:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p36-20020a05600c1da400b0040b478da760sm13950950wms.48.2023.12.03.23.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 23:18:47 -0800 (PST)
Date: Mon, 4 Dec 2023 10:18:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:466
 gf100_gr_chan_new() warn: inconsistent returns '&gr->fecs.mutex'.
Message-ID: <09303e3b-40ba-4558-b001-e4b8586c6a60@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: ca081fff6ecc63c86a99918230cc9b947bebae8a drm/nouveau/gr/gf100-: generate golden context during first object alloc
config: i386-randconfig-141-20231105 (https://download.01.org/0day-ci/archive/20231203/202312031611.BpCtNGvw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031611.BpCtNGvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312031611.BpCtNGvw-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:466 gf100_gr_chan_new() warn: inconsistent returns '&gr->fecs.mutex'.

vim +466 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c

27f3d6cf803249 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  377  static int
27f3d6cf803249 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  378  gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
27f3d6cf803249 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  379  		  const struct nvkm_oclass *oclass,
e3c71eb27419b6 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-01-14  380  		  struct nvkm_object **pobject)
966a5b7daa15e1 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  381  {
27f3d6cf803249 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  382  	struct gf100_gr *gr = gf100_gr(base);
bfee3f3d97db88 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  383  	struct gf100_gr_data *data = gr->mmio_data;
bfee3f3d97db88 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  384  	struct gf100_gr_mmio *mmio = gr->mmio_list;
e3c71eb27419b6 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-01-14  385  	struct gf100_gr_chan *chan;
019e4d76c6e91b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  386  	struct gf100_vmm_map_v0 args = { .priv = 1 };
227c95d90a3c50 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  387  	struct nvkm_device *device = gr->base.engine.subdev.device;
966a5b7daa15e1 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  388  	int ret, i;
966a5b7daa15e1 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  389  
27f3d6cf803249 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  390  	if (!(chan = kzalloc(sizeof(*chan), GFP_KERNEL)))
27f3d6cf803249 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  391  		return -ENOMEM;
27f3d6cf803249 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  392  	nvkm_object_ctor(&gf100_gr_chan, oclass, &chan->object);
27f3d6cf803249 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  393  	chan->gr = gr;
019e4d76c6e91b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  394  	chan->vmm = nvkm_vmm_ref(fifoch->vmm);
27f3d6cf803249 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  395  	*pobject = &chan->object;
966a5b7daa15e1 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  396  
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  397  	/* Generate golden context image. */
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  398  	mutex_lock(&gr->fecs.mutex);
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  399  	if (gr->data == NULL) {
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  400  		ret = gf100_grctx_generate(gr, chan, fifoch->inst);
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  401  		if (ret) {
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  402  			nvkm_error(&base->engine.subdev, "failed to construct context\n");
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  403  			return ret;

mutex_unlock(&gr->fecs.mutex) before returning?

ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  404  		}
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  405  	}
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  406  	mutex_unlock(&gr->fecs.mutex);
ca081fff6ecc63 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  407  
ac1499d9573f4a drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  408  	/* allocate memory for a "mmio list" buffer that's used by the HUB
ac1499d9573f4a drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  409  	 * fuc to modify some per-context register settings on first load
ac1499d9573f4a drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  410  	 * of the context.
ac1499d9573f4a drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  411  	 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

