Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657E164E;
	Thu, 13 Apr 2023 05:06:15 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso14044144wmq.2;
        Wed, 12 Apr 2023 22:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681362373; x=1683954373;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ktDyVxsXXRmM6SrltHeQ0EejeMAffTs50d6hQVnaTkk=;
        b=cL3MIVpFPF472IITtrfxRG2UFuTFRlukAhqmybt//e7vXMFsmogx85vJdiYRFZI363
         9V10/exy1eefpo/R4pL5dNPSFCy5zhKq5583Tvn5jU0H1+8EfSkovZQNu9tO/ABPGm3T
         OWjnsXyuV7+8n9OdhGG6qM/1AzX82VaSEeCbpNmb7mQyUpeiDr/AQvQdP8Ij1SkMJVF7
         x8vlQian6+IZcBe+buHc4c2AVcXl2aBejZLYK+yztGybAzNzrRqBv7uFez2hoPz+0qjM
         SX8f1Lo1LA7se5q8aXRHKnQ0gicIS/vLY1gC1LpuI23UAOdIkuqLVM5zEHNEOKwVmhJ0
         /b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681362373; x=1683954373;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktDyVxsXXRmM6SrltHeQ0EejeMAffTs50d6hQVnaTkk=;
        b=TEQVOxrQrGBnldeYQKOHNTCX0Cxk476aPsS8rgndEqRSw+NOK1syuPdhGsRaAJXaxX
         LYXv0SvobrFpojDpBpJTesCkHfb7rmTozdrLwjHnBpiXJVHRZZQ5mG3Wqoge3+3I+gSY
         iP/vuGWR++OzBdtp7Yha6DlAb84PlXBcokTBpRcKb0EOoG1Kr+H7xvEaRBW+NuiNmz+W
         eWa/4mj2mrSlckF1+0fR3FwiLVa+Q2xJyWT1XAWOafimiIXjLFetH5L47E7aeXcVlyd4
         CnJfobugZ+xZAt2FGIu+u4yGi1TbVy5+4nlOOg5XNUVrJ9sXD/azvujPXxzvTwG/SlNK
         ClKw==
X-Gm-Message-State: AAQBX9eoAT6ieITrm8/pIVkbPpMhocvpqHHenMxbEiwhEhq8CoYPjBAK
	mNbkjMArduyoxIlD1Nqy1nkAIbAOdJQ=
X-Google-Smtp-Source: AKy350bTVcddQZ+PubcAF/KOMJA3OqHIiuFkdgJFYqUNNoHVLLwrlA/5es7dMHz4/65shIdrr8B/fA==
X-Received: by 2002:a05:600c:500b:b0:3ed:24f7:2b48 with SMTP id n11-20020a05600c500b00b003ed24f72b48mr357740wmr.8.1681362373276;
        Wed, 12 Apr 2023 22:06:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c450700b003ee2a0d49dbsm4404759wmo.25.2023.04.12.22.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 22:06:12 -0700 (PDT)
Date: Thu, 13 Apr 2023 08:06:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 8309/10976] drivers/gpu/host1x/context.c:82
 host1x_memory_context_list_init() warn: missing error code 'err'
Message-ID: <ac98d66d-8735-4963-8cdb-be891d134cb3@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
commit: f75d19827b731c6f24930ef77e5a46cf2242bc68 [8309/10976] drm/tegra: Allow compile test on !ARM v2
config: xtensa-randconfig-m041-20230411 (https://download.01.org/0day-ci/archive/20230413/202304131214.MOOEMszN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304131214.MOOEMszN-lkp@intel.com/

smatch warnings:
drivers/gpu/host1x/context.c:82 host1x_memory_context_list_init() warn: missing error code 'err'

vim +/err +82 drivers/gpu/host1x/context.c

8aa5bcb6161206 Mikko Perttunen 2022-06-27  21  int host1x_memory_context_list_init(struct host1x *host1x)
8aa5bcb6161206 Mikko Perttunen 2022-06-27  22  {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  23  	struct host1x_memory_context_list *cdl = &host1x->context_list;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  24  	struct device_node *node = host1x->dev->of_node;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  25  	struct host1x_memory_context *ctx;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  26  	unsigned int i;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  27  	int err;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  28  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  29  	cdl->devs = NULL;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  30  	cdl->len = 0;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  31  	mutex_init(&cdl->lock);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  32  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  33  	err = of_property_count_u32_elems(node, "iommu-map");
8aa5bcb6161206 Mikko Perttunen 2022-06-27  34  	if (err < 0)
8aa5bcb6161206 Mikko Perttunen 2022-06-27  35  		return 0;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  36  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  37  	cdl->devs = kcalloc(err, sizeof(*cdl->devs), GFP_KERNEL);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  38  	if (!cdl->devs)
8aa5bcb6161206 Mikko Perttunen 2022-06-27  39  		return -ENOMEM;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  40  	cdl->len = err / 4;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  41  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  42  	for (i = 0; i < cdl->len; i++) {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  43  		ctx = &cdl->devs[i];
8aa5bcb6161206 Mikko Perttunen 2022-06-27  44  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  45  		ctx->host = host1x;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  46  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  47  		device_initialize(&ctx->dev);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  48  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  49  		/*
8aa5bcb6161206 Mikko Perttunen 2022-06-27  50  		 * Due to an issue with T194 NVENC, only 38 bits can be used.
8aa5bcb6161206 Mikko Perttunen 2022-06-27  51  		 * Anyway, 256GiB of IOVA ought to be enough for anyone.
8aa5bcb6161206 Mikko Perttunen 2022-06-27  52  		 */
8aa5bcb6161206 Mikko Perttunen 2022-06-27  53  		ctx->dma_mask = DMA_BIT_MASK(38);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  54  		ctx->dev.dma_mask = &ctx->dma_mask;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  55  		ctx->dev.coherent_dma_mask = ctx->dma_mask;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  56  		dev_set_name(&ctx->dev, "host1x-ctx.%d", i);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  57  		ctx->dev.bus = &host1x_context_device_bus_type;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  58  		ctx->dev.parent = host1x->dev;
55879dad0f3ae8 Yang Yingliang  2022-11-26  59  		ctx->dev.release = host1x_memory_context_release;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  60  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  61  		dma_set_max_seg_size(&ctx->dev, UINT_MAX);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  62  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  63  		err = device_add(&ctx->dev);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  64  		if (err) {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  65  			dev_err(host1x->dev, "could not add context device %d: %d\n", i, err);
55879dad0f3ae8 Yang Yingliang  2022-11-26  66  			put_device(&ctx->dev);
55879dad0f3ae8 Yang Yingliang  2022-11-26  67  			goto unreg_devices;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  68  		}
8aa5bcb6161206 Mikko Perttunen 2022-06-27  69  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  70  		err = of_dma_configure_id(&ctx->dev, node, true, &i);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  71  		if (err) {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  72  			dev_err(host1x->dev, "IOMMU configuration failed for context device %d: %d\n",
8aa5bcb6161206 Mikko Perttunen 2022-06-27  73  				i, err);
55879dad0f3ae8 Yang Yingliang  2022-11-26  74  			device_unregister(&ctx->dev);
55879dad0f3ae8 Yang Yingliang  2022-11-26  75  			goto unreg_devices;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  76  		}
8aa5bcb6161206 Mikko Perttunen 2022-06-27  77  
9026ba722360ce Thierry Reding  2022-11-17  78  		if (!tegra_dev_iommu_get_stream_id(&ctx->dev, &ctx->stream_id) ||
9026ba722360ce Thierry Reding  2022-11-17  79  		    !device_iommu_mapped(&ctx->dev)) {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  80  			dev_err(host1x->dev, "Context device %d has no IOMMU!\n", i);
55879dad0f3ae8 Yang Yingliang  2022-11-26  81  			device_unregister(&ctx->dev);
55879dad0f3ae8 Yang Yingliang  2022-11-26 @82  			goto unreg_devices;

error code?

8aa5bcb6161206 Mikko Perttunen 2022-06-27  83  		}
8aa5bcb6161206 Mikko Perttunen 2022-06-27  84  	}
8aa5bcb6161206 Mikko Perttunen 2022-06-27  85  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  86  	return 0;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  87  
55879dad0f3ae8 Yang Yingliang  2022-11-26  88  unreg_devices:
8aa5bcb6161206 Mikko Perttunen 2022-06-27  89  	while (i--)
55879dad0f3ae8 Yang Yingliang  2022-11-26  90  		device_unregister(&cdl->devs[i].dev);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  91  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  92  	kfree(cdl->devs);
8466ff24a37a9a Yang Yingliang  2022-11-26  93  	cdl->devs = NULL;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  94  	cdl->len = 0;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  95  
8aa5bcb6161206 Mikko Perttunen 2022-06-27  96  	return err;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  97  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

