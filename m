Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5294E638
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Aug 2023 03:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692243074; x=1723779074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i6ZrP6rd/Hysytpm8p0okSF2ntnkgY9sEUHwnW96MVY=;
  b=MMTpucINj0WGpVAWhcvP/UfIjEMTBfMfbrurWn0Vk9DEXa3LAyiULcUc
   oF29ubC+qjcX6/XwiNFWmiQcjGkwwKeM99kwA/GdGOb/OHlIzm0JJKcCH
   KDzDd100bqfdQ84poII76/sUOGeiCCVxrBE5zoxe3YfhEiOJWpatl6ihd
   ipCOMQRPF6P+KawIjLaPFzTtn49oWOYKjLZV4UhRthfNR0ABrIn5xWozO
   4Ez+B3eObxNPUQsQrAywN9vcAFIJAVZZSJKC7a2VC0PuEjhRy2F/T1kvx
   TWmJ9B6LqiM9KZAlYxZbTiRzaFqoScGY2amldvCbBSKhWRN+/Ut3FCsR0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436604411"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="436604411"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 20:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="684284294"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="684284294"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Aug 2023 20:31:11 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWTj5-0000lh-01;
	Thu, 17 Aug 2023 03:31:11 +0000
Date: Thu, 17 Aug 2023 11:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/at_hdmac.c:1371 atc_prep_slave_sg() warn: possible
 memory leak of 'desc'
Message-ID: <202308171150.OuNmC3Uc-lkp@intel.com>
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
TO: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: ac803b56860f6506c55a3c9330007837e3f4edda dmaengine: at_hdmac: Convert driver to use virt-dma
date:   9 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-m041-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171150.OuNmC3Uc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171150.OuNmC3Uc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308171150.OuNmC3Uc-lkp@intel.com/

smatch warnings:
drivers/dma/at_hdmac.c:1371 atc_prep_slave_sg() warn: possible memory leak of 'desc'

vim +/desc +1371 drivers/dma/at_hdmac.c

67d25f0d4e2477 Maxime Ripard     2015-10-22  1225  
808347f6a31792 Nicolas Ferre     2009-07-22  1226  /**
808347f6a31792 Nicolas Ferre     2009-07-22  1227   * atc_prep_slave_sg - prepare descriptors for a DMA_SLAVE transaction
808347f6a31792 Nicolas Ferre     2009-07-22  1228   * @chan: DMA channel
808347f6a31792 Nicolas Ferre     2009-07-22  1229   * @sgl: scatterlist to transfer to/from
808347f6a31792 Nicolas Ferre     2009-07-22  1230   * @sg_len: number of entries in @scatterlist
808347f6a31792 Nicolas Ferre     2009-07-22  1231   * @direction: DMA direction
808347f6a31792 Nicolas Ferre     2009-07-22  1232   * @flags: tx descriptor status flags
185ecb5f4fd439 Alexandre Bounine 2012-03-08  1233   * @context: transaction context (ignored)
808347f6a31792 Nicolas Ferre     2009-07-22  1234   */
808347f6a31792 Nicolas Ferre     2009-07-22  1235  static struct dma_async_tx_descriptor *
808347f6a31792 Nicolas Ferre     2009-07-22  1236  atc_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
db8196df4bb6f1 Vinod Koul        2011-10-13  1237  		unsigned int sg_len, enum dma_transfer_direction direction,
185ecb5f4fd439 Alexandre Bounine 2012-03-08  1238  		unsigned long flags, void *context)
808347f6a31792 Nicolas Ferre     2009-07-22  1239  {
ac803b56860f65 Tudor Ambarus     2022-10-25  1240  	struct at_dma		*atdma = to_at_dma(chan->device);
808347f6a31792 Nicolas Ferre     2009-07-22  1241  	struct at_dma_chan	*atchan = to_at_dma_chan(chan);
808347f6a31792 Nicolas Ferre     2009-07-22  1242  	struct at_dma_slave	*atslave = chan->private;
beeaa103eecc7a Nicolas Ferre     2012-03-14  1243  	struct dma_slave_config	*sconfig = &atchan->dma_sconfig;
ac803b56860f65 Tudor Ambarus     2022-10-25  1244  	struct at_desc		*desc;
808347f6a31792 Nicolas Ferre     2009-07-22  1245  	u32			ctrla;
808347f6a31792 Nicolas Ferre     2009-07-22  1246  	u32			ctrlb;
808347f6a31792 Nicolas Ferre     2009-07-22  1247  	dma_addr_t		reg;
808347f6a31792 Nicolas Ferre     2009-07-22  1248  	unsigned int		reg_width;
808347f6a31792 Nicolas Ferre     2009-07-22  1249  	unsigned int		mem_width;
808347f6a31792 Nicolas Ferre     2009-07-22  1250  	unsigned int		i;
808347f6a31792 Nicolas Ferre     2009-07-22  1251  	struct scatterlist	*sg;
808347f6a31792 Nicolas Ferre     2009-07-22  1252  	size_t			total_len = 0;
808347f6a31792 Nicolas Ferre     2009-07-22  1253  
cc52a10a048fc1 Nicolas Ferre     2011-04-30  1254  	dev_vdbg(chan2dev(chan), "prep_slave_sg (%d): %s f0x%lx\n",
cc52a10a048fc1 Nicolas Ferre     2011-04-30  1255  			sg_len,
db8196df4bb6f1 Vinod Koul        2011-10-13  1256  			direction == DMA_MEM_TO_DEV ? "TO DEVICE" : "FROM DEVICE",
808347f6a31792 Nicolas Ferre     2009-07-22  1257  			flags);
808347f6a31792 Nicolas Ferre     2009-07-22  1258  
808347f6a31792 Nicolas Ferre     2009-07-22  1259  	if (unlikely(!atslave || !sg_len)) {
c618a9be0e8c0f Nicolas Ferre     2012-09-11  1260  		dev_dbg(chan2dev(chan), "prep_slave_sg: sg length is zero!\n");
808347f6a31792 Nicolas Ferre     2009-07-22  1261  		return NULL;
808347f6a31792 Nicolas Ferre     2009-07-22  1262  	}
808347f6a31792 Nicolas Ferre     2009-07-22  1263  
ac803b56860f65 Tudor Ambarus     2022-10-25  1264  	desc = kzalloc(struct_size(desc, sg, sg_len), GFP_ATOMIC);
ac803b56860f65 Tudor Ambarus     2022-10-25  1265  	if (!desc)
ac803b56860f65 Tudor Ambarus     2022-10-25  1266  		return NULL;
ac803b56860f65 Tudor Ambarus     2022-10-25  1267  	desc->sglen = sg_len;
ac803b56860f65 Tudor Ambarus     2022-10-25  1268  
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1269  	ctrla = FIELD_PREP(ATC_SCSIZE, sconfig->src_maxburst) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1270  		FIELD_PREP(ATC_DCSIZE, sconfig->dst_maxburst);
ae14d4b5e0a4eb Nicolas Ferre     2011-04-30  1271  	ctrlb = ATC_IEN;
808347f6a31792 Nicolas Ferre     2009-07-22  1272  
808347f6a31792 Nicolas Ferre     2009-07-22  1273  	switch (direction) {
db8196df4bb6f1 Vinod Koul        2011-10-13  1274  	case DMA_MEM_TO_DEV:
beeaa103eecc7a Nicolas Ferre     2012-03-14  1275  		reg_width = convert_buswidth(sconfig->dst_addr_width);
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1276  		ctrla |= FIELD_PREP(ATC_DST_WIDTH, reg_width);
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1277  		ctrlb |= FIELD_PREP(ATC_DST_ADDR_MODE,
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1278  				    ATC_DST_ADDR_MODE_FIXED) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1279  			 FIELD_PREP(ATC_SRC_ADDR_MODE, ATC_SRC_ADDR_MODE_INCR) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1280  			 FIELD_PREP(ATC_FC, ATC_FC_MEM2PER) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1281  			 FIELD_PREP(ATC_SIF, atchan->mem_if) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1282  			 FIELD_PREP(ATC_DIF, atchan->per_if);
beeaa103eecc7a Nicolas Ferre     2012-03-14  1283  		reg = sconfig->dst_addr;
808347f6a31792 Nicolas Ferre     2009-07-22  1284  		for_each_sg(sgl, sg, sg_len, i) {
ac803b56860f65 Tudor Ambarus     2022-10-25  1285  			struct atdma_sg *atdma_sg = &desc->sg[i];
ac803b56860f65 Tudor Ambarus     2022-10-25  1286  			struct at_lli *lli;
808347f6a31792 Nicolas Ferre     2009-07-22  1287  			u32		len;
808347f6a31792 Nicolas Ferre     2009-07-22  1288  			u32		mem;
808347f6a31792 Nicolas Ferre     2009-07-22  1289  
ac803b56860f65 Tudor Ambarus     2022-10-25  1290  			atdma_sg->lli = dma_pool_alloc(atdma->lli_pool,
ac803b56860f65 Tudor Ambarus     2022-10-25  1291  						       GFP_NOWAIT,
ac803b56860f65 Tudor Ambarus     2022-10-25  1292  						       &atdma_sg->lli_phys);
ac803b56860f65 Tudor Ambarus     2022-10-25  1293  			if (!atdma_sg->lli)
808347f6a31792 Nicolas Ferre     2009-07-22  1294  				goto err_desc_get;
ac803b56860f65 Tudor Ambarus     2022-10-25  1295  			lli = atdma_sg->lli;
808347f6a31792 Nicolas Ferre     2009-07-22  1296  
0f70e8cea3ac6a Nicolas Ferre     2010-12-15  1297  			mem = sg_dma_address(sg);
808347f6a31792 Nicolas Ferre     2009-07-22  1298  			len = sg_dma_len(sg);
c456797681db81 Nicolas Ferre     2012-09-11  1299  			if (unlikely(!len)) {
c456797681db81 Nicolas Ferre     2012-09-11  1300  				dev_dbg(chan2dev(chan),
c456797681db81 Nicolas Ferre     2012-09-11  1301  					"prep_slave_sg: sg(%d) data length is zero\n", i);
c456797681db81 Nicolas Ferre     2012-09-11  1302  				goto err;
c456797681db81 Nicolas Ferre     2012-09-11  1303  			}
808347f6a31792 Nicolas Ferre     2009-07-22  1304  			mem_width = 2;
808347f6a31792 Nicolas Ferre     2009-07-22  1305  			if (unlikely(mem & 3 || len & 3))
808347f6a31792 Nicolas Ferre     2009-07-22  1306  				mem_width = 0;
808347f6a31792 Nicolas Ferre     2009-07-22  1307  
ac803b56860f65 Tudor Ambarus     2022-10-25  1308  			lli->saddr = mem;
ac803b56860f65 Tudor Ambarus     2022-10-25  1309  			lli->daddr = reg;
ac803b56860f65 Tudor Ambarus     2022-10-25  1310  			lli->ctrla = ctrla |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1311  				     FIELD_PREP(ATC_SRC_WIDTH, mem_width) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1312  				     len >> mem_width;
ac803b56860f65 Tudor Ambarus     2022-10-25  1313  			lli->ctrlb = ctrlb;
808347f6a31792 Nicolas Ferre     2009-07-22  1314  
ac803b56860f65 Tudor Ambarus     2022-10-25  1315  			atdma_sg->len = len;
808347f6a31792 Nicolas Ferre     2009-07-22  1316  			total_len += len;
ac803b56860f65 Tudor Ambarus     2022-10-25  1317  
ac803b56860f65 Tudor Ambarus     2022-10-25  1318  			desc->sg[i].len = len;
ac803b56860f65 Tudor Ambarus     2022-10-25  1319  			atdma_lli_chain(desc, i);
808347f6a31792 Nicolas Ferre     2009-07-22  1320  		}
808347f6a31792 Nicolas Ferre     2009-07-22  1321  		break;
db8196df4bb6f1 Vinod Koul        2011-10-13  1322  	case DMA_DEV_TO_MEM:
beeaa103eecc7a Nicolas Ferre     2012-03-14  1323  		reg_width = convert_buswidth(sconfig->src_addr_width);
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1324  		ctrla |= FIELD_PREP(ATC_SRC_WIDTH, reg_width);
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1325  		ctrlb |= FIELD_PREP(ATC_DST_ADDR_MODE, ATC_DST_ADDR_MODE_INCR) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1326  			 FIELD_PREP(ATC_SRC_ADDR_MODE,
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1327  				    ATC_SRC_ADDR_MODE_FIXED) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1328  			 FIELD_PREP(ATC_FC, ATC_FC_PER2MEM) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1329  			 FIELD_PREP(ATC_SIF, atchan->per_if) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1330  			 FIELD_PREP(ATC_DIF, atchan->mem_if);
808347f6a31792 Nicolas Ferre     2009-07-22  1331  
beeaa103eecc7a Nicolas Ferre     2012-03-14  1332  		reg = sconfig->src_addr;
808347f6a31792 Nicolas Ferre     2009-07-22  1333  		for_each_sg(sgl, sg, sg_len, i) {
ac803b56860f65 Tudor Ambarus     2022-10-25  1334  			struct atdma_sg *atdma_sg = &desc->sg[i];
ac803b56860f65 Tudor Ambarus     2022-10-25  1335  			struct at_lli *lli;
808347f6a31792 Nicolas Ferre     2009-07-22  1336  			u32		len;
808347f6a31792 Nicolas Ferre     2009-07-22  1337  			u32		mem;
808347f6a31792 Nicolas Ferre     2009-07-22  1338  
ac803b56860f65 Tudor Ambarus     2022-10-25  1339  			atdma_sg->lli = dma_pool_alloc(atdma->lli_pool,
ac803b56860f65 Tudor Ambarus     2022-10-25  1340  						       GFP_NOWAIT,
ac803b56860f65 Tudor Ambarus     2022-10-25  1341  						       &atdma_sg->lli_phys);
ac803b56860f65 Tudor Ambarus     2022-10-25  1342  			if (!atdma_sg->lli)
808347f6a31792 Nicolas Ferre     2009-07-22  1343  				goto err_desc_get;
ac803b56860f65 Tudor Ambarus     2022-10-25  1344  			lli = atdma_sg->lli;
808347f6a31792 Nicolas Ferre     2009-07-22  1345  
0f70e8cea3ac6a Nicolas Ferre     2010-12-15  1346  			mem = sg_dma_address(sg);
808347f6a31792 Nicolas Ferre     2009-07-22  1347  			len = sg_dma_len(sg);
c456797681db81 Nicolas Ferre     2012-09-11  1348  			if (unlikely(!len)) {
c456797681db81 Nicolas Ferre     2012-09-11  1349  				dev_dbg(chan2dev(chan),
c456797681db81 Nicolas Ferre     2012-09-11  1350  					"prep_slave_sg: sg(%d) data length is zero\n", i);
c456797681db81 Nicolas Ferre     2012-09-11  1351  				goto err;
c456797681db81 Nicolas Ferre     2012-09-11  1352  			}
808347f6a31792 Nicolas Ferre     2009-07-22  1353  			mem_width = 2;
808347f6a31792 Nicolas Ferre     2009-07-22  1354  			if (unlikely(mem & 3 || len & 3))
808347f6a31792 Nicolas Ferre     2009-07-22  1355  				mem_width = 0;
808347f6a31792 Nicolas Ferre     2009-07-22  1356  
ac803b56860f65 Tudor Ambarus     2022-10-25  1357  			lli->saddr = reg;
ac803b56860f65 Tudor Ambarus     2022-10-25  1358  			lli->daddr = mem;
ac803b56860f65 Tudor Ambarus     2022-10-25  1359  			lli->ctrla = ctrla |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1360  				     FIELD_PREP(ATC_DST_WIDTH, mem_width) |
d8840a7edcf0aa Tudor Ambarus     2022-10-25  1361  				     len >> reg_width;
ac803b56860f65 Tudor Ambarus     2022-10-25  1362  			lli->ctrlb = ctrlb;
808347f6a31792 Nicolas Ferre     2009-07-22  1363  
ac803b56860f65 Tudor Ambarus     2022-10-25  1364  			desc->sg[i].len = len;
808347f6a31792 Nicolas Ferre     2009-07-22  1365  			total_len += len;
ac803b56860f65 Tudor Ambarus     2022-10-25  1366  
ac803b56860f65 Tudor Ambarus     2022-10-25  1367  			atdma_lli_chain(desc, i);
808347f6a31792 Nicolas Ferre     2009-07-22  1368  		}
808347f6a31792 Nicolas Ferre     2009-07-22  1369  		break;
808347f6a31792 Nicolas Ferre     2009-07-22  1370  	default:
808347f6a31792 Nicolas Ferre     2009-07-22 @1371  		return NULL;
808347f6a31792 Nicolas Ferre     2009-07-22  1372  	}
808347f6a31792 Nicolas Ferre     2009-07-22  1373  
808347f6a31792 Nicolas Ferre     2009-07-22  1374  	/* set end-of-link to the last link descriptor of list*/
ac803b56860f65 Tudor Ambarus     2022-10-25  1375  	set_lli_eol(desc, i - 1);
808347f6a31792 Nicolas Ferre     2009-07-22  1376  
ac803b56860f65 Tudor Ambarus     2022-10-25  1377  	desc->total_len = total_len;
bdf6c79278b3fb Torsten Fleischer 2015-02-23  1378  
ac803b56860f65 Tudor Ambarus     2022-10-25  1379  	return vchan_tx_prep(&atchan->vc, &desc->vd, flags);
808347f6a31792 Nicolas Ferre     2009-07-22  1380  
808347f6a31792 Nicolas Ferre     2009-07-22  1381  err_desc_get:
808347f6a31792 Nicolas Ferre     2009-07-22  1382  	dev_err(chan2dev(chan), "not enough descriptors available\n");
c456797681db81 Nicolas Ferre     2012-09-11  1383  err:
ac803b56860f65 Tudor Ambarus     2022-10-25  1384  	atdma_desc_free(&desc->vd);
808347f6a31792 Nicolas Ferre     2009-07-22  1385  	return NULL;
808347f6a31792 Nicolas Ferre     2009-07-22  1386  }
808347f6a31792 Nicolas Ferre     2009-07-22  1387  

:::::: The code at line 1371 was first introduced by commit
:::::: 808347f6a31792079e345ec865e9cfcb6e8ae6b2 dmaengine: at_hdmac: add DMA slave transfers

:::::: TO: Nicolas Ferre <nicolas.ferre@atmel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
