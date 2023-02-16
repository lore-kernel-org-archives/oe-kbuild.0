Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7A6FD6
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676570146; x=1708106146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+EkxZK3WrJdLfY93KmG7DHXQUC0UZ1AjkF9vAooqhY=;
  b=VXDUrkPQ66w8k57oMmp6eieURNbdBdsI0vsSdrd0gOxDjL4UvT7yoQBh
   H3IXuUwmjr1m2sSBTt08zBIzAfzmQwCP62+KUBmJCsemJtEucUk2D2Njn
   9R3YMEI2RYUCJYqwvBazDNeR+jN2cR4L5HtGER/8MzIlpIuewU0eaPPNP
   /+wp4GuRqDAfltf0wcOI/oAYP0nL++dRk2oRH8U3ukM3HZ4TuZi/OWsb6
   0fovLetuBlw/HtjSMQaAoopZnEK1nnvdRd3WmEgALyUKsCf/YyIMp+MXH
   q/4TcxOIOPQmJ6QmN0JORD8JSeQDHJ6vNKEK8IaogGjvsPV9hP1/OgeUG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359224930"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="359224930"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 09:55:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813050790"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="813050790"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2023 09:55:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSiTk-000APB-2o;
	Thu, 16 Feb 2023 17:55:32 +0000
Date: Fri, 17 Feb 2023 01:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12850/13217] drivers/virtio/virtio_ring.c:1530
 virtqueue_add_packed_vring() error: uninitialized symbol 'prev'.
Message-ID: <202302170106.UvPCoZs0-lkp@intel.com>
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
commit: 6e1f9b89a6436acbe383d38f628ea81091ec26f2 [12850/13217] virtio_ring: packed: refactor virtqueue_add_packed() for premapped
:::::: branch date: 14 hours ago
:::::: commit date: 28 hours ago
config: microblaze-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230217/202302170106.UvPCoZs0-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302170106.UvPCoZs0-lkp@intel.com/

New smatch warnings:
drivers/virtio/virtio_ring.c:1530 virtqueue_add_packed_vring() error: uninitialized symbol 'prev'.
drivers/virtio/virtio_ring.c:1538 virtqueue_add_packed_vring() error: uninitialized symbol 'head_flags'.

Old smatch warnings:
drivers/virtio/virtio_ring.c:692 virtqueue_add_split_vring() error: uninitialized symbol 'prev'.

vim +/prev +1530 drivers/virtio/virtio_ring.c

6e1f9b89a6436a Xuan Zhuo  2023-02-14  1463  
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1464  static void virtqueue_add_packed_vring(struct vring_virtqueue *vq,
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1465  				       struct scatterlist *sgs[],
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1466  				       unsigned int total_sg,
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1467  				       unsigned int out_sgs,
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1468  				       unsigned int in_sgs)
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1469  {
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1470  	struct vring_packed_desc *desc;
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1471  	struct scatterlist *sg;
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1472  	unsigned int i, n, c, descs_used;
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1473  	__le16 head_flags, flags;
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1474  	u16 head, id, prev, curr;
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1475  
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1476  	desc = vq->packed.vring.desc;
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1477  	head = vq->packed.next_avail_idx;
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1478  	i = head;
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1479  	descs_used = total_sg;
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1480  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1481  	id = vq->free_head;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1482  	BUG_ON(id == vq->packed.vring.num);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1483  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1484  	curr = id;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1485  	c = 0;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1486  	for (n = 0; n < out_sgs + in_sgs; n++) {
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1487  		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1488  			flags = cpu_to_le16(vq->packed.avail_used_flags |
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1489  				    (++c == total_sg ? 0 : VRING_DESC_F_NEXT) |
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1490  				    (n < out_sgs ? 0 : VRING_DESC_F_WRITE));
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1491  			if (i == head)
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1492  				head_flags = flags;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1493  			else
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1494  				desc[i].flags = flags;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1495  
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1496  			desc[i].addr = cpu_to_le64(sg->dma_address);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1497  			desc[i].len = cpu_to_le32(sg->length);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1498  			desc[i].id = cpu_to_le16(id);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1499  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1500  			if (unlikely(vq->use_dma_api)) {
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1501  				vq->packed.desc_extra[curr].addr = sg->dma_address;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1502  				vq->packed.desc_extra[curr].len = sg->length;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1503  				vq->packed.desc_extra[curr].flags =
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1504  					le16_to_cpu(flags);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1505  			}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1506  			prev = curr;
aeef9b4733c5c2 Jason Wang 2021-06-04  1507  			curr = vq->packed.desc_extra[curr].next;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1508  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1509  			if ((unlikely(++i >= vq->packed.vring.num))) {
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1510  				i = 0;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1511  				vq->packed.avail_used_flags ^=
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1512  					1 << VRING_PACKED_DESC_F_AVAIL |
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1513  					1 << VRING_PACKED_DESC_F_USED;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1514  			}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1515  		}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1516  	}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1517  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1518  	if (i < head)
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1519  		vq->packed.avail_wrap_counter ^= 1;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1520  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1521  	/* We're using some buffers from the free list. */
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1522  	vq->vq.num_free -= descs_used;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1523  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1524  	/* Update free pointer */
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1525  	vq->packed.next_avail_idx = i;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1526  	vq->free_head = curr;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1527  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1528  	/* Store token. */
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1529  	vq->packed.desc_state[id].num = descs_used;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21 @1530  	vq->packed.desc_state[id].last = prev;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1531  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1532  	/*
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1533  	 * A driver MUST NOT make the first descriptor in the list
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1534  	 * available before all subsequent descriptors comprising
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1535  	 * the list are made available.
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1536  	 */
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1537  	virtio_wmb(vq->weak_barriers);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21 @1538  	vq->packed.vring.desc[head].flags = head_flags;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1539  	vq->num_added += descs_used;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1540  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1541  	pr_debug("Added buffer head %i to %p\n", head, vq);
6e1f9b89a6436a Xuan Zhuo  2023-02-14  1542  }
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1543  

:::::: The code at line 1530 was first introduced by commit
:::::: 1ce9e6055fa0a9043405c5604cf19169ec5379ff virtio_ring: introduce packed ring support

:::::: TO: Tiwei Bie <tiwei.bie@intel.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
