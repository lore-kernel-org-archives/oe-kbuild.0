Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1166FD6
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676565520; x=1708101520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p58qn2MqFMyEWlC7oDrqUOHuP2IqEvgeKcb114Fxzpo=;
  b=Cf0zPQw6Dm3Fkd+5pexuj79r1nvDtAJl4qPeNBXgS1TqVdbiUa2vW+Rn
   3FApHgbhVQH6sxztR4UrSs/CgJRuUs09iBFJT4Z07FizNUXUI31LiLMm/
   nd9TMMqIjCFvPiHUI5LHu0W1syj6lVtQrDqHGzPQdjWnJzdYQ5T9wgKrz
   oKvJTSzpfweJJKYheUac0rwh7Ap7t1qvVgy8hExm1OQYGTtlUS25tFfs9
   tVXyc4tfvTFLVE6gCPgtU1wE/djiIsGh6/vFwXbMWq6RLttVcXCjREjFD
   e2jKcYDCe8AaI7WV20dAMu4VOmG1vgUhL1VOWbOMipKrzOwfprvKO98nV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333952366"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="333952366"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 08:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="620041637"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="620041637"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Feb 2023 08:23:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSh2g-000ALL-0P;
	Thu, 16 Feb 2023 16:23:30 +0000
Date: Fri, 17 Feb 2023 00:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12848/13217] drivers/virtio/virtio_ring.c:692
 virtqueue_add_split_vring() error: uninitialized symbol 'prev'.
Message-ID: <202302170026.ZWBh7H3o-lkp@intel.com>
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
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   509583475828c4fd86897113f78315c1431edcc3
commit: cf965d707e9fdf9368860ee71f699842c5fefa3f [12848/13217] virtio_ring: split: refactor virtqueue_add_split() for premapped
:::::: branch date: 12 hours ago
:::::: commit date: 26 hours ago
config: microblaze-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230217/202302170026.ZWBh7H3o-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302170026.ZWBh7H3o-lkp@intel.com/

New smatch warnings:
drivers/virtio/virtio_ring.c:692 virtqueue_add_split_vring() error: uninitialized symbol 'prev'.

Old smatch warnings:
drivers/virtio/virtio_ring.c:1555 virtqueue_add_packed() error: uninitialized symbol 'prev'.
drivers/virtio/virtio_ring.c:1563 virtqueue_add_packed() error: uninitialized symbol 'head_flags'.

vim +/prev +692 drivers/virtio/virtio_ring.c

cf965d707e9fdf Xuan Zhuo          2023-02-14  635  
cf965d707e9fdf Xuan Zhuo          2023-02-14  636  static inline int virtqueue_add_split_vring(struct vring_virtqueue *vq,
cf965d707e9fdf Xuan Zhuo          2023-02-14  637  					    struct scatterlist *sgs[],
cf965d707e9fdf Xuan Zhuo          2023-02-14  638  					    unsigned int total_sg,
cf965d707e9fdf Xuan Zhuo          2023-02-14  639  					    unsigned int out_sgs,
cf965d707e9fdf Xuan Zhuo          2023-02-14  640  					    unsigned int in_sgs,
cf965d707e9fdf Xuan Zhuo          2023-02-14  641  					    struct vring_desc *desc)
cf965d707e9fdf Xuan Zhuo          2023-02-14  642  {
cf965d707e9fdf Xuan Zhuo          2023-02-14  643  	unsigned int n, i, avail, descs_used, prev;
cf965d707e9fdf Xuan Zhuo          2023-02-14  644  	struct virtqueue *_vq = &vq->vq;
cf965d707e9fdf Xuan Zhuo          2023-02-14  645  	struct scatterlist *sg;
cf965d707e9fdf Xuan Zhuo          2023-02-14  646  	bool indirect;
cf965d707e9fdf Xuan Zhuo          2023-02-14  647  	int head;
cf965d707e9fdf Xuan Zhuo          2023-02-14  648  
cf965d707e9fdf Xuan Zhuo          2023-02-14  649  	head = vq->free_head;
cf965d707e9fdf Xuan Zhuo          2023-02-14  650  
cf965d707e9fdf Xuan Zhuo          2023-02-14  651  	if (desc) {
cf965d707e9fdf Xuan Zhuo          2023-02-14  652  		/* Use a single buffer which doesn't continue */
cf965d707e9fdf Xuan Zhuo          2023-02-14  653  		indirect = true;
cf965d707e9fdf Xuan Zhuo          2023-02-14  654  		/* Set up rest to use this indirect table. */
cf965d707e9fdf Xuan Zhuo          2023-02-14  655  		i = 0;
cf965d707e9fdf Xuan Zhuo          2023-02-14  656  		descs_used = 1;
cf965d707e9fdf Xuan Zhuo          2023-02-14  657  	} else {
cf965d707e9fdf Xuan Zhuo          2023-02-14  658  		indirect = false;
cf965d707e9fdf Xuan Zhuo          2023-02-14  659  		desc = vq->split.vring.desc;
cf965d707e9fdf Xuan Zhuo          2023-02-14  660  		i = head;
cf965d707e9fdf Xuan Zhuo          2023-02-14  661  		descs_used = total_sg;
cf965d707e9fdf Xuan Zhuo          2023-02-14  662  	}
cf965d707e9fdf Xuan Zhuo          2023-02-14  663  
13816c768d4658 Rusty Russell      2013-03-20  664  	for (n = 0; n < out_sgs; n++) {
eeebf9b1fc0862 Rusty Russell      2014-09-11  665  		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
0a8a69dd77ddbd Rusty Russell      2007-10-22  666  			prev = i;
72b5e8958738aa Jason Wang         2021-06-04  667  			/* Note that we trust indirect descriptor
72b5e8958738aa Jason Wang         2021-06-04  668  			 * table since it use stream DMA mapping.
72b5e8958738aa Jason Wang         2021-06-04  669  			 */
cf965d707e9fdf Xuan Zhuo          2023-02-14  670  			i = virtqueue_add_desc_split(_vq, desc, i,
cf965d707e9fdf Xuan Zhuo          2023-02-14  671  						     sg->dma_address,
cf965d707e9fdf Xuan Zhuo          2023-02-14  672  						     sg->length,
72b5e8958738aa Jason Wang         2021-06-04  673  						     VRING_DESC_F_NEXT,
72b5e8958738aa Jason Wang         2021-06-04  674  						     indirect);
13816c768d4658 Rusty Russell      2013-03-20  675  		}
0a8a69dd77ddbd Rusty Russell      2007-10-22  676  	}
13816c768d4658 Rusty Russell      2013-03-20  677  	for (; n < (out_sgs + in_sgs); n++) {
eeebf9b1fc0862 Rusty Russell      2014-09-11  678  		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
0a8a69dd77ddbd Rusty Russell      2007-10-22  679  			prev = i;
72b5e8958738aa Jason Wang         2021-06-04  680  			/* Note that we trust indirect descriptor
72b5e8958738aa Jason Wang         2021-06-04  681  			 * table since it use stream DMA mapping.
72b5e8958738aa Jason Wang         2021-06-04  682  			 */
cf965d707e9fdf Xuan Zhuo          2023-02-14  683  			i = virtqueue_add_desc_split(_vq, desc, i,
cf965d707e9fdf Xuan Zhuo          2023-02-14  684  						     sg->dma_address,
fe4c3862df630e Jason Wang         2021-06-04  685  						     sg->length,
fe4c3862df630e Jason Wang         2021-06-04  686  						     VRING_DESC_F_NEXT |
72b5e8958738aa Jason Wang         2021-06-04  687  						     VRING_DESC_F_WRITE,
72b5e8958738aa Jason Wang         2021-06-04  688  						     indirect);
13816c768d4658 Rusty Russell      2013-03-20  689  		}
0a8a69dd77ddbd Rusty Russell      2007-10-22  690  	}
0a8a69dd77ddbd Rusty Russell      2007-10-22  691  	/* Last one doesn't continue. */
00e6f3d9d9e356 Michael S. Tsirkin 2014-10-22 @692  	desc[prev].flags &= cpu_to_virtio16(_vq->vdev, ~VRING_DESC_F_NEXT);
72b5e8958738aa Jason Wang         2021-06-04  693  	if (!indirect && vq->use_dma_api)
890d33561337ff Vincent Whitchurch 2021-10-26  694  		vq->split.desc_extra[prev & (vq->split.vring.num - 1)].flags &=
72b5e8958738aa Jason Wang         2021-06-04  695  			~VRING_DESC_F_NEXT;
0a8a69dd77ddbd Rusty Russell      2007-10-22  696  
780bc7903a32ed Andy Lutomirski    2016-02-02  697  	if (indirect) {
780bc7903a32ed Andy Lutomirski    2016-02-02  698  		/* Now that the indirect table is filled in, map it. */
780bc7903a32ed Andy Lutomirski    2016-02-02  699  		dma_addr_t addr = vring_map_single(
780bc7903a32ed Andy Lutomirski    2016-02-02  700  			vq, desc, total_sg * sizeof(struct vring_desc),
780bc7903a32ed Andy Lutomirski    2016-02-02  701  			DMA_TO_DEVICE);
780bc7903a32ed Andy Lutomirski    2016-02-02  702  		if (vring_mapping_error(vq, addr))
cf965d707e9fdf Xuan Zhuo          2023-02-14  703  			return -ENOMEM;
780bc7903a32ed Andy Lutomirski    2016-02-02  704  
fe4c3862df630e Jason Wang         2021-06-04  705  		virtqueue_add_desc_split(_vq, vq->split.vring.desc,
fe4c3862df630e Jason Wang         2021-06-04  706  					 head, addr,
fe4c3862df630e Jason Wang         2021-06-04  707  					 total_sg * sizeof(struct vring_desc),
72b5e8958738aa Jason Wang         2021-06-04  708  					 VRING_DESC_F_INDIRECT,
72b5e8958738aa Jason Wang         2021-06-04  709  					 false);
780bc7903a32ed Andy Lutomirski    2016-02-02  710  	}
780bc7903a32ed Andy Lutomirski    2016-02-02  711  
780bc7903a32ed Andy Lutomirski    2016-02-02  712  	/* We're using some buffers from the free list. */
780bc7903a32ed Andy Lutomirski    2016-02-02  713  	vq->vq.num_free -= descs_used;
780bc7903a32ed Andy Lutomirski    2016-02-02  714  
0a8a69dd77ddbd Rusty Russell      2007-10-22  715  	/* Update free pointer */
b25bd2515ea32c Rusty Russell      2014-09-11  716  	if (indirect)
72b5e8958738aa Jason Wang         2021-06-04  717  		vq->free_head = vq->split.desc_extra[head].next;
b25bd2515ea32c Rusty Russell      2014-09-11  718  	else
0a8a69dd77ddbd Rusty Russell      2007-10-22  719  		vq->free_head = i;
0a8a69dd77ddbd Rusty Russell      2007-10-22  720  
0a8a69dd77ddbd Rusty Russell      2007-10-22  721  	/* Put entry in available array (but don't update avail->idx until they
3b720b8c865098 Rusty Russell      2012-01-12  722  	 * do sync). */
e593bf9751566e Tiwei Bie          2018-11-21  723  	avail = vq->split.avail_idx_shadow & (vq->split.vring.num - 1);
e593bf9751566e Tiwei Bie          2018-11-21  724  	vq->split.vring.avail->ring[avail] = cpu_to_virtio16(_vq->vdev, head);
0a8a69dd77ddbd Rusty Russell      2007-10-22  725  
ee7cd8981e15bc Rusty Russell      2012-01-12  726  	/* Descriptors and available array need to be set before we expose the
ee7cd8981e15bc Rusty Russell      2012-01-12  727  	 * new available array entries. */
a9a0fef7790748 Rusty Russell      2013-03-18  728  	virtio_wmb(vq->weak_barriers);
e593bf9751566e Tiwei Bie          2018-11-21  729  	vq->split.avail_idx_shadow++;
e593bf9751566e Tiwei Bie          2018-11-21  730  	vq->split.vring.avail->idx = cpu_to_virtio16(_vq->vdev,
e593bf9751566e Tiwei Bie          2018-11-21  731  						vq->split.avail_idx_shadow);
ee7cd8981e15bc Rusty Russell      2012-01-12  732  	vq->num_added++;
ee7cd8981e15bc Rusty Russell      2012-01-12  733  
5e05bf5833eb3d Tetsuo Handa       2015-02-11  734  	pr_debug("Added buffer head %i to %p\n", head, vq);
5e05bf5833eb3d Tetsuo Handa       2015-02-11  735  	END_USE(vq);
5e05bf5833eb3d Tetsuo Handa       2015-02-11  736  
ee7cd8981e15bc Rusty Russell      2012-01-12  737  	/* This is very unlikely, but theoretically possible.  Kick
ee7cd8981e15bc Rusty Russell      2012-01-12  738  	 * just in case. */
ee7cd8981e15bc Rusty Russell      2012-01-12  739  	if (unlikely(vq->num_added == (1 << 16) - 1))
ee7cd8981e15bc Rusty Russell      2012-01-12  740  		virtqueue_kick(_vq);
ee7cd8981e15bc Rusty Russell      2012-01-12  741  
98e8c6bc66048d Rusty Russell      2012-10-16  742  	return 0;
cf965d707e9fdf Xuan Zhuo          2023-02-14  743  }
cf965d707e9fdf Xuan Zhuo          2023-02-14  744  

:::::: The code at line 692 was first introduced by commit
:::::: 00e6f3d9d9e356dbf08369ffc4576f79438d51ea virtio_ring: switch to new memory access APIs

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
