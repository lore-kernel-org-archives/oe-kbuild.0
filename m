Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123462F
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Apr 2023 04:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681359936; x=1712895936;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mqG94CePaVvRFRozpEQPO9VowjPk+0CxirHDAKmG4d8=;
  b=McKUrj7l7tZlVj79a8C+P0FFKKcluILNihKfSssSMLFmmsmIBgt1QUyb
   9P39D6Aaz5MX+AJgr+zX6JPnMRK3E+OhRYet5mV7PkXabC+IwstwLb3Bb
   smSdMP5iV8CNkkF2zD6GoTCeikCXUu0x/Iv53f7MzrFIGApOSpmxRqmic
   yMFPlqacC8rix29qpBLp3qCb0zTyJHjGB7zsyEkVopu2PhudR4UpdMKiW
   EUS57039AAvuAETiSRtGeVrZZxRI9iRgM5mDpcOSsTh42jbWdjmzxhGnC
   NhekbjaRLSAa5tVaANdZSNEqsou8UCREgeo3oscLZAeHNuRulz657fXas
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332789938"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="332789938"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 21:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935366886"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="935366886"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2023 21:25:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmoWc-000YLB-0O;
	Thu, 13 Apr 2023 04:25:34 +0000
Date: Thu, 13 Apr 2023 12:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8309/10976] drivers/gpu/host1x/context.c:82
 host1x_memory_context_list_init() warn: missing error code 'err'
Message-ID: <202304131214.MOOEMszN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian König" <christian.koenig@amd.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
commit: f75d19827b731c6f24930ef77e5a46cf2242bc68 [8309/10976] drm/tegra: Allow compile test on !ARM v2
:::::: branch date: 23 hours ago
:::::: commit date: 9 days ago
config: xtensa-randconfig-m041-20230411 (https://download.01.org/0day-ci/archive/20230413/202304131214.MOOEMszN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304131214.MOOEMszN-lkp@intel.com/

smatch warnings:
drivers/gpu/host1x/context.c:82 host1x_memory_context_list_init() warn: missing error code 'err'
drivers/gpu/host1x/dev.c:417 host1x_iommu_attach() warn: passing zero to 'ERR_PTR'

vim +/err +82 drivers/gpu/host1x/context.c

55879dad0f3ae8 Yang Yingliang  2022-11-26  20  
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
8aa5bcb6161206 Mikko Perttunen 2022-06-27  98  

:::::: The code at line 82 was first introduced by commit
:::::: 55879dad0f3ae8468444b42f785ad79eac05fe5b gpu: host1x: Fix memory leak of device names

:::::: TO: Yang Yingliang <yangyingliang@huawei.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
