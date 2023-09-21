Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03260AD49
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Sep 2023 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695298779; x=1726834779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mAdbjKnUJJKMjWElVLSxJXOuIU4jXRYeL02O/Drs5wA=;
  b=FYB1CicmA8s7HfPgM8M/hlfWlRGW12QbRn6FdcAnhz/5ssgiC+F39Fma
   VaqSojhin7Rgkc5zl6kbN/+4MQ4vcaP8VKtlfYg+IgRo29VGFf9kbVOK9
   YRAyfQQL7lCwmW0B78m0hloe/0cQCeAUaKh09SR0y7PfXzFVKQiNL6GEM
   MUKr9SX7CHs4MEXikrvT+30al2DuVGJH/NnsqchGx2DtrzXOZciN0i2G8
   HYOfG8JJlD67FV68iPQKC/OslQax27jFmrMHwenZdDNvifk7tq1PPbLfY
   U85ErdBPUwwgxSCeDGjoJWScuVJlqRI6jopIKQx7hgn909ki7OluhvFct
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444608001"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="444608001"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 05:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862441256"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="862441256"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2023 05:19:24 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjIeQ-0009wi-2g;
	Thu, 21 Sep 2023 12:19:22 +0000
Date: Thu, 21 Sep 2023 20:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:466
 gf100_gr_chan_new() warn: inconsistent returns '&gr->fecs.mutex'.
Message-ID: <202309212003.QBTiXXwc-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@redhat.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42dc814987c1feb6410904e58cfd4c36c4146150
commit: ca081fff6ecc63c86a99918230cc9b947bebae8a drm/nouveau/gr/gf100-: generate golden context during first object alloc
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20230920 (https://download.01.org/0day-ci/archive/20230921/202309212003.QBTiXXwc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230921/202309212003.QBTiXXwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309212003.QBTiXXwc-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:466 gf100_gr_chan_new() warn: inconsistent returns '&gr->fecs.mutex'.

vim +466 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c

27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  376  
27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  377  static int
27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  378  gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  379  		  const struct nvkm_oclass *oclass,
e3c71eb27419b60 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-01-14  380  		  struct nvkm_object **pobject)
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  381  {
27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  382  	struct gf100_gr *gr = gf100_gr(base);
bfee3f3d97db88b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  383  	struct gf100_gr_data *data = gr->mmio_data;
bfee3f3d97db88b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  384  	struct gf100_gr_mmio *mmio = gr->mmio_list;
e3c71eb27419b60 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-01-14  385  	struct gf100_gr_chan *chan;
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  386  	struct gf100_vmm_map_v0 args = { .priv = 1 };
227c95d90a3c50d drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  387  	struct nvkm_device *device = gr->base.engine.subdev.device;
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  388  	int ret, i;
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  389  
27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  390  	if (!(chan = kzalloc(sizeof(*chan), GFP_KERNEL)))
27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  391  		return -ENOMEM;
27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  392  	nvkm_object_ctor(&gf100_gr_chan, oclass, &chan->object);
27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  393  	chan->gr = gr;
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  394  	chan->vmm = nvkm_vmm_ref(fifoch->vmm);
27f3d6cf8032494 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  395  	*pobject = &chan->object;
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  396  
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  397  	/* Generate golden context image. */
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  398  	mutex_lock(&gr->fecs.mutex);
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  399  	if (gr->data == NULL) {
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  400  		ret = gf100_grctx_generate(gr, chan, fifoch->inst);
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  401  		if (ret) {
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  402  			nvkm_error(&base->engine.subdev, "failed to construct context\n");
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  403  			return ret;
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  404  		}
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  405  	}
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  406  	mutex_unlock(&gr->fecs.mutex);
ca081fff6ecc63c drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2022-06-01  407  
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  408  	/* allocate memory for a "mmio list" buffer that's used by the HUB
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  409  	 * fuc to modify some per-context register settings on first load
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  410  	 * of the context.
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  411  	 */
227c95d90a3c50d drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  412  	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x100,
227c95d90a3c50d drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  413  			      false, &chan->mmio);
73a60c0d218a292 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-07-13  414  	if (ret)
73a60c0d218a292 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-07-13  415  		return ret;
73a60c0d218a292 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-07-13  416  
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  417  	ret = nvkm_vmm_get(fifoch->vmm, 12, 0x1000, &chan->mmio_vma);
73a60c0d218a292 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-07-13  418  	if (ret)
73a60c0d218a292 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-07-13  419  		return ret;
73a60c0d218a292 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-07-13  420  
f66c57d9229c313 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  421  	ret = nvkm_memory_map(chan->mmio, 0, fifoch->vmm,
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  422  			      chan->mmio_vma, &args, sizeof(args));
19a82e492c3d71e drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  423  	if (ret)
19a82e492c3d71e drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  424  		return ret;
227c95d90a3c50d drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  425  
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  426  	/* allocate buffers referenced by mmio list */
bfee3f3d97db88b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  427  	for (i = 0; data->size && i < ARRAY_SIZE(gr->mmio_data); i++) {
227c95d90a3c50d drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  428  		ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST,
227c95d90a3c50d drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  429  				      data->size, data->align, false,
227c95d90a3c50d drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  430  				      &chan->data[i].mem);
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  431  		if (ret)
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  432  			return ret;
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  433  
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  434  		ret = nvkm_vmm_get(fifoch->vmm, 12,
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  435  				   nvkm_memory_size(chan->data[i].mem),
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  436  				   &chan->data[i].vma);
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  437  		if (ret)
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  438  			return ret;
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  439  
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  440  		args.priv = data->priv;
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  441  
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  442  		ret = nvkm_memory_map(chan->data[i].mem, 0, chan->vmm,
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  443  				      chan->data[i].vma, &args, sizeof(args));
19a82e492c3d71e drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  444  		if (ret)
19a82e492c3d71e drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  445  			return ret;
19a82e492c3d71e drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  446  
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  447  		data++;
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  448  	}
73a60c0d218a292 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-07-13  449  
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  450  	/* finally, fill in the mmio list and point the context at it */
142ea05f49b9517 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  451  	nvkm_kmap(chan->mmio);
bfee3f3d97db88b drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  452  	for (i = 0; mmio->addr && i < ARRAY_SIZE(gr->mmio_list); i++) {
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  453  		u32 addr = mmio->addr;
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  454  		u32 data = mmio->data;
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  455  
694c6caf9261582 drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2014-08-10  456  		if (mmio->buffer >= 0) {
019e4d76c6e91b3 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2017-11-01  457  			u64 info = chan->data[mmio->buffer].vma->addr;
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  458  			data |= info >> mmio->shift;
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  459  		}
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  460  
142ea05f49b9517 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  461  		nvkm_wo32(chan->mmio, chan->mmio_nr++ * 4, addr);
142ea05f49b9517 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  462  		nvkm_wo32(chan->mmio, chan->mmio_nr++ * 4, data);
ac1499d9573f4aa drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-08-04  463  		mmio++;
966a5b7daa15e15 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-11-24  464  	}
142ea05f49b9517 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c   Ben Skeggs 2015-08-20  465  	nvkm_done(chan->mmio);
ebb945a94bba2ce drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c Ben Skeggs 2012-07-20 @466  	return 0;
4b223eefe43d201 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-08-03  467  }
4b223eefe43d201 drivers/gpu/drm/nouveau/nvc0_graph.c             Ben Skeggs 2010-08-03  468  

:::::: The code at line 466 was first introduced by commit
:::::: ebb945a94bba2ce8dff7b0942ff2b3f2a52a0a69 drm/nouveau: port all engines to new engine module format

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
