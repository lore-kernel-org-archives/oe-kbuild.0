Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC2179C5
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Jan 2023 13:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672752478; x=1704288478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u1+NYCK7ELkuXTs49A3fyr4tqNOvw54e0bxk9KsW/7M=;
  b=XZDSvLATkBQuXUblT+jxnnqO01dZpI72C7s30MCooOW07AsaiaHWndzq
   W+Kup4QV7mIxiCL0CD6XVfN5JVTGXsocJ6cjc91/5ZKRhzpXkXvQCiGRL
   UTKhn1qW1ON9NUUkyLPBiWQZuPkMLGU1Hs+CVGtXQAv8Zos8gRjcN8L6N
   KKLKYaB4n4h+BxCQacKAKG1msjH44k8ICykB4CeAzca2ssH9ybCFuhLuJ
   XD+ZRmjxbSgV364jfi5Trl1FAXGcbleVXwjs9KxSV74GRpxzxj3hCLEVA
   Sto/Ehq3PChN9xDZB1DF4GJTM/K++z5wttd1f5SZheim26raSaoMMdg/I
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="319364894"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="319364894"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 05:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="797177657"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="797177657"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2023 05:27:56 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pChKd-000SGl-28;
	Tue, 03 Jan 2023 13:27:55 +0000
Date: Tue, 3 Jan 2023 21:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/virtio/virtio_ring.c:1712:24: warning: Operator '|' with one
 operand equal to zero is redundant. [badBitmaskCheck]
Message-ID: <202301032130.JtPBe87w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/virtio/virtio_ring.c:1712:24: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "huangjie.albert" <huangjie.albert@bytedance.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69b41ac87e4a664de78a395ff97166f0b2943210
commit: a7722890fdfb2aaeb6b02d68bb0f1e411e58d539 virtio_ring : keep used_wrap_counter in vq->last_used_idx
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a7722890fdfb2aaeb6b02d68bb0f1e411e58d539
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/ucount.c:134:60: warning: Parameter 'ns' can be declared as pointer to const [constParameter]
   static struct ucounts *find_ucounts(struct user_namespace *ns, kuid_t uid, struct hlist_head *hashent)
                                                              ^
>> kernel/ucount.c:297:21: warning: Parameter 'last' can be declared as pointer to const [constParameter]
       struct ucounts *last, enum ucount_type type)
                       ^
>> kernel/ucount.c:35:46: warning: Parameter 'set' can be declared as pointer to const [constParameter]
   static int set_is_seen(struct ctl_table_set *set)
                                                ^
--
>> kernel/irq/manage.c:966:39: warning: Same expression in both branches of ternary operator. [duplicateExpressionTernary]
       chip ? (chip->name ? : "unknown") : "unknown");
                                         ^
>> kernel/irq/manage.c:1345:46: warning: Parameter 'dev_id' can be declared as pointer to const [constParameter]
   void irq_wake_thread(unsigned int irq, void *dev_id)
                                                ^
   kernel/irq/manage.c:1874:66: warning: Parameter 'dev_id' can be declared as pointer to const [constParameter]
   static struct irqaction *__free_irq(struct irq_desc *desc, void *dev_id)
                                                                    ^
   kernel/irq/manage.c:2460:77: warning: Parameter 'dev_id' can be declared as pointer to const [constParameter]
   static struct irqaction *__free_percpu_irq(unsigned int irq, void __percpu *dev_id)
                                                                               ^
>> drivers/virtio/virtio_ring.c:1712:24: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
    vq->last_used_idx = 0 | (1 << VRING_PACKED_EVENT_F_WRAP_CTR);
                          ^
>> fs/fuse/inode.c:411:17: warning: Uninitialized variable: fm_iter->sb [uninitvar]
     if (!fm_iter->sb)
                   ^
--
>> fs/userfaultfd.c:876:40: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     BUG_ON(!!vma->vm_userfaultfd_ctx.ctx ^
                                          ^
   fs/userfaultfd.c:1343:40: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     BUG_ON(!!cur->vm_userfaultfd_ctx.ctx ^
                                          ^
   fs/userfaultfd.c:1550:40: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
     BUG_ON(!!cur->vm_userfaultfd_ctx.ctx ^
                                          ^
>> fs/userfaultfd.c:791:51: warning: Parameter 'ctx' can be declared as pointer to const [constParameter]
   static bool has_unmap_ctx(struct userfaultfd_ctx *ctx, struct list_head *unmaps,
                                                     ^
>> fs/userfaultfd.c:713:12: warning: Uninitialized variables: fctx.orig, fctx.new, fctx.list [uninitvar]
     dup_fctx(fctx);
              ^
>> fs/userfaultfd.c:843:42: warning: Uninitialized variable: ctx->ctx [uninitvar]
     userfaultfd_event_wait_completion(ctx->ctx, &ewq);
                                            ^

vim +1712 drivers/virtio/virtio_ring.c

5a22242160201b Jason Wang         2021-06-04  1658  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1659  static struct virtqueue *vring_create_virtqueue_packed(
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1660  	unsigned int index,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1661  	unsigned int num,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1662  	unsigned int vring_align,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1663  	struct virtio_device *vdev,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1664  	bool weak_barriers,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1665  	bool may_reduce_num,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1666  	bool context,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1667  	bool (*notify)(struct virtqueue *),
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1668  	void (*callback)(struct virtqueue *),
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1669  	const char *name)
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1670  {
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1671  	struct vring_virtqueue *vq;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1672  	struct vring_packed_desc *ring;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1673  	struct vring_packed_desc_event *driver, *device;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1674  	dma_addr_t ring_dma_addr, driver_event_dma_addr, device_event_dma_addr;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1675  	size_t ring_size_in_bytes, event_size_in_bytes;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1676  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1677  	ring_size_in_bytes = num * sizeof(struct vring_packed_desc);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1678  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1679  	ring = vring_alloc_queue(vdev, ring_size_in_bytes,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1680  				 &ring_dma_addr,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1681  				 GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1682  	if (!ring)
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1683  		goto err_ring;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1684  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1685  	event_size_in_bytes = sizeof(struct vring_packed_desc_event);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1686  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1687  	driver = vring_alloc_queue(vdev, event_size_in_bytes,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1688  				   &driver_event_dma_addr,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1689  				   GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1690  	if (!driver)
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1691  		goto err_driver;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1692  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1693  	device = vring_alloc_queue(vdev, event_size_in_bytes,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1694  				   &device_event_dma_addr,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1695  				   GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1696  	if (!device)
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1697  		goto err_device;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1698  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1699  	vq = kmalloc(sizeof(*vq), GFP_KERNEL);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1700  	if (!vq)
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1701  		goto err_vq;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1702  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1703  	vq->vq.callback = callback;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1704  	vq->vq.vdev = vdev;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1705  	vq->vq.name = name;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1706  	vq->vq.num_free = num;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1707  	vq->vq.index = index;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1708  	vq->we_own_ring = true;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1709  	vq->notify = notify;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1710  	vq->weak_barriers = weak_barriers;
8b4ec69d7e098a Jason Wang         2022-05-27  1711  	vq->broken = true;
a7722890fdfb2a huangjie.albert    2022-06-17 @1712  	vq->last_used_idx = 0 | (1 << VRING_PACKED_EVENT_F_WRAP_CTR);
8d622d21d24803 Michael S. Tsirkin 2021-04-13  1713  	vq->event_triggered = false;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1714  	vq->num_added = 0;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1715  	vq->packed_ring = true;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1716  	vq->use_dma_api = vring_use_dma_api(vdev);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1717  #ifdef DEBUG
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1718  	vq->in_use = false;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1719  	vq->last_add_time_valid = false;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1720  #endif
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1721  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1722  	vq->indirect = virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC) &&
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1723  		!context;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1724  	vq->event = virtio_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1725  
45383fb0f42db3 Tiwei Bie          2019-01-23  1726  	if (virtio_has_feature(vdev, VIRTIO_F_ORDER_PLATFORM))
45383fb0f42db3 Tiwei Bie          2019-01-23  1727  		vq->weak_barriers = false;
45383fb0f42db3 Tiwei Bie          2019-01-23  1728  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1729  	vq->packed.ring_dma_addr = ring_dma_addr;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1730  	vq->packed.driver_event_dma_addr = driver_event_dma_addr;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1731  	vq->packed.device_event_dma_addr = device_event_dma_addr;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1732  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1733  	vq->packed.ring_size_in_bytes = ring_size_in_bytes;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1734  	vq->packed.event_size_in_bytes = event_size_in_bytes;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1735  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1736  	vq->packed.vring.num = num;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1737  	vq->packed.vring.desc = ring;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1738  	vq->packed.vring.driver = driver;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1739  	vq->packed.vring.device = device;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1740  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1741  	vq->packed.next_avail_idx = 0;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1742  	vq->packed.avail_wrap_counter = 1;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1743  	vq->packed.event_flags_shadow = 0;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1744  	vq->packed.avail_used_flags = 1 << VRING_PACKED_DESC_F_AVAIL;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1745  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1746  	vq->packed.desc_state = kmalloc_array(num,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1747  			sizeof(struct vring_desc_state_packed),
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1748  			GFP_KERNEL);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1749  	if (!vq->packed.desc_state)
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1750  		goto err_desc_state;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1751  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1752  	memset(vq->packed.desc_state, 0,
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1753  		num * sizeof(struct vring_desc_state_packed));
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1754  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1755  	/* Put everything in free lists. */
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1756  	vq->free_head = 0;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1757  
5a22242160201b Jason Wang         2021-06-04  1758  	vq->packed.desc_extra = vring_alloc_desc_extra(vq, num);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1759  	if (!vq->packed.desc_extra)
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1760  		goto err_desc_extra;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1761  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1762  	/* No callback?  Tell other side not to bother us. */
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1763  	if (!callback) {
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1764  		vq->packed.event_flags_shadow = VRING_PACKED_EVENT_FLAG_DISABLE;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1765  		vq->packed.vring.driver->flags =
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1766  			cpu_to_le16(vq->packed.event_flags_shadow);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1767  	}
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1768  
0e566c8f0f2e83 Parav Pandit       2021-07-21  1769  	spin_lock(&vdev->vqs_list_lock);
e152d8af4220a0 Dan Carpenter      2020-12-04  1770  	list_add_tail(&vq->vq.list, &vdev->vqs);
0e566c8f0f2e83 Parav Pandit       2021-07-21  1771  	spin_unlock(&vdev->vqs_list_lock);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1772  	return &vq->vq;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1773  
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1774  err_desc_extra:
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1775  	kfree(vq->packed.desc_state);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1776  err_desc_state:
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1777  	kfree(vq);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1778  err_vq:
ae93d8ea0fa701 Dan Carpenter      2020-12-04  1779  	vring_free_queue(vdev, event_size_in_bytes, device, device_event_dma_addr);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1780  err_device:
ae93d8ea0fa701 Dan Carpenter      2020-12-04  1781  	vring_free_queue(vdev, event_size_in_bytes, driver, driver_event_dma_addr);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1782  err_driver:
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1783  	vring_free_queue(vdev, ring_size_in_bytes, ring, ring_dma_addr);
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1784  err_ring:
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1785  	return NULL;
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1786  }
1ce9e6055fa0a9 Tiwei Bie          2018-11-21  1787  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
