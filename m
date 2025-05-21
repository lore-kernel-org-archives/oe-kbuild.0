Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3122D7B1
	for <oe-kbuild@lists.linux.dev>; Wed, 21 May 2025 03:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747797016; cv=none; b=SnJ1SS+H+nUzksDGjvu5FsPYJO0Wo7t7eEXf79bLAt2XecNYgRafLhs54PSYBltmo/HDpvYAGZqwa9N/UZuggYX98xsFCWlydGPtzoAO4uRWwVCN/EWFmpuRTaYEdYOwrcy5mGQoTCkCjEfUZ3dYo9ANbXcQB7fB7ov2bq6PmYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747797016; c=relaxed/simple;
	bh=JXZaC4gko+KS3WdUHg9IMzDq6OSki2zCjcbWiCdbwNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=noTUEpUCJdSYOLhzfy3ZYclyUyuRrCoaVk//aX93fAs3QpqYm6n8caP4pFjOyuoURBMnsLNUDKWZlH+lwa/z0ZVUXRFqxZcdFzQ1CF5TfKE5jI1RfkBxcHbvCaE/lSd5M36cO7Exn8wccxFsNAXDqLW2pyGd6VHa/Ral/HszlCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJmMtQzL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJmMtQzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747797013; x=1779333013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JXZaC4gko+KS3WdUHg9IMzDq6OSki2zCjcbWiCdbwNM=;
  b=LJmMtQzLPAhZbpNrSlpCqK8Ok0zaTE7ddryGypOEupSEWd6FyilMaOS+
   Jx4TC+5/6LZLJ8TrQe1uzTyj2IWFLXiZUjJxTInAD6yuS8bxyzncjOokV
   Ntyp74Y3pPTa+869N8oKED8iPKagWsAOusdYExRkkrdTkXEFVsbR8/6eF
   UE0ssfU6Cp/HUH8V6+O5usXw2mgpN6dYanKVlAlmfouBU//fW86cN7F4y
   /m7BuVMFsRcT1DYDizYWyy6t/z61aaUyxnwLgRY/O4MP5jueReg/eDgBa
   EuCQiJBnBLHu6ev52Fzwgn35YEwVx/mbCjZs9dyDC59trqXAlYHM554JR
   g==;
X-CSE-ConnectionGUID: f9Tz0biuTNCblwsoO02Pgg==
X-CSE-MsgGUID: n1X0jxvcSsagti9EHYLVCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="72276772"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="72276772"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:10:09 -0700
X-CSE-ConnectionGUID: f040IXtISyOS0xQc3MfEtw==
X-CSE-MsgGUID: zLi8WdqySN+KXudqSBE9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="143882882"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2025 20:10:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHZqH-000Noa-23;
	Wed, 21 May 2025 03:10:05 +0000
Date: Wed, 21 May 2025 11:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mst-vhost:test 35/35] drivers/virtio/virtio_ring.c:1882
 virtqueue_add_packed_in_order() error: uninitialized symbol 'head_flags'.
Message-ID: <202505211002.AL0afLRx-lkp@intel.com>
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
CC: kvm@vger.kernel.org
CC: virtualization@lists.linux-foundation.org
CC: netdev@vger.kernel.org
TO: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git test
head:   f640220b1e149add1dff0be2978905c5df628eaf
commit: f640220b1e149add1dff0be2978905c5df628eaf [35/35] virtio_ring: add in order support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r071-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211002.AL0afLRx-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505211002.AL0afLRx-lkp@intel.com/

New smatch warnings:
drivers/virtio/virtio_ring.c:1882 virtqueue_add_packed_in_order() error: uninitialized symbol 'head_flags'.

Old smatch warnings:
drivers/virtio/virtio_ring.c:1725 virtqueue_add_packed() error: uninitialized symbol 'prev'.
drivers/virtio/virtio_ring.c:1733 virtqueue_add_packed() error: uninitialized symbol 'head_flags'.

vim +/head_flags +1882 drivers/virtio/virtio_ring.c

1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1761  
f640220b1e149a Jason Wang 2025-03-24  1762  static inline int virtqueue_add_packed_in_order(struct vring_virtqueue *vq,
f640220b1e149a Jason Wang 2025-03-24  1763  						struct scatterlist *sgs[],
f640220b1e149a Jason Wang 2025-03-24  1764  						unsigned int total_sg,
f640220b1e149a Jason Wang 2025-03-24  1765  						unsigned int out_sgs,
f640220b1e149a Jason Wang 2025-03-24  1766  						unsigned int in_sgs,
f640220b1e149a Jason Wang 2025-03-24  1767  						void *data,
f640220b1e149a Jason Wang 2025-03-24  1768  						void *ctx,
f640220b1e149a Jason Wang 2025-03-24  1769  						bool premapped,
f640220b1e149a Jason Wang 2025-03-24  1770  						gfp_t gfp)
f640220b1e149a Jason Wang 2025-03-24  1771  {
f640220b1e149a Jason Wang 2025-03-24  1772  	struct vring_packed_desc *desc;
f640220b1e149a Jason Wang 2025-03-24  1773  	struct scatterlist *sg;
f640220b1e149a Jason Wang 2025-03-24  1774  	unsigned int i, n, c, err_idx, total_len = 0;
f640220b1e149a Jason Wang 2025-03-24  1775  	__le16 head_flags, flags;
f640220b1e149a Jason Wang 2025-03-24  1776  	u16 head, avail_used_flags;
f640220b1e149a Jason Wang 2025-03-24  1777  	int err;
f640220b1e149a Jason Wang 2025-03-24  1778  
f640220b1e149a Jason Wang 2025-03-24  1779  	START_USE(vq);
f640220b1e149a Jason Wang 2025-03-24  1780  
f640220b1e149a Jason Wang 2025-03-24  1781  	BUG_ON(data == NULL);
f640220b1e149a Jason Wang 2025-03-24  1782  	BUG_ON(ctx && vq->indirect);
f640220b1e149a Jason Wang 2025-03-24  1783  
f640220b1e149a Jason Wang 2025-03-24  1784  	if (unlikely(vq->broken)) {
f640220b1e149a Jason Wang 2025-03-24  1785  		END_USE(vq);
f640220b1e149a Jason Wang 2025-03-24  1786  		return -EIO;
f640220b1e149a Jason Wang 2025-03-24  1787  	}
f640220b1e149a Jason Wang 2025-03-24  1788  
f640220b1e149a Jason Wang 2025-03-24  1789  	LAST_ADD_TIME_UPDATE(vq);
f640220b1e149a Jason Wang 2025-03-24  1790  
f640220b1e149a Jason Wang 2025-03-24  1791  	BUG_ON(total_sg == 0);
f640220b1e149a Jason Wang 2025-03-24  1792  
f640220b1e149a Jason Wang 2025-03-24  1793  	if (virtqueue_use_indirect(vq, total_sg)) {
f640220b1e149a Jason Wang 2025-03-24  1794  		err = virtqueue_add_indirect_packed(vq, sgs, total_sg, out_sgs,
f640220b1e149a Jason Wang 2025-03-24  1795  						    in_sgs, data, premapped, gfp,
f640220b1e149a Jason Wang 2025-03-24  1796  						    vq->next_avail_idx);
f640220b1e149a Jason Wang 2025-03-24  1797  		if (err != -ENOMEM) {
f640220b1e149a Jason Wang 2025-03-24  1798  			END_USE(vq);
f640220b1e149a Jason Wang 2025-03-24  1799  			return err;
f640220b1e149a Jason Wang 2025-03-24  1800  		}
f640220b1e149a Jason Wang 2025-03-24  1801  
f640220b1e149a Jason Wang 2025-03-24  1802  		/* fall back on direct */
f640220b1e149a Jason Wang 2025-03-24  1803  	}
f640220b1e149a Jason Wang 2025-03-24  1804  
f640220b1e149a Jason Wang 2025-03-24  1805  	head = vq->next_avail_idx;
f640220b1e149a Jason Wang 2025-03-24  1806  	avail_used_flags = vq->packed.avail_used_flags;
f640220b1e149a Jason Wang 2025-03-24  1807  
f640220b1e149a Jason Wang 2025-03-24  1808  	WARN_ON_ONCE(total_sg > vq->packed.vring.num && !vq->indirect);
f640220b1e149a Jason Wang 2025-03-24  1809  
f640220b1e149a Jason Wang 2025-03-24  1810  	desc = vq->packed.vring.desc;
f640220b1e149a Jason Wang 2025-03-24  1811  	i = head;
f640220b1e149a Jason Wang 2025-03-24  1812  
f640220b1e149a Jason Wang 2025-03-24  1813  	if (unlikely(vq->vq.num_free < total_sg)) {
f640220b1e149a Jason Wang 2025-03-24  1814  		pr_debug("Can't add buf len %i - avail = %i\n",
f640220b1e149a Jason Wang 2025-03-24  1815  			 total_sg, vq->vq.num_free);
f640220b1e149a Jason Wang 2025-03-24  1816  		END_USE(vq);
f640220b1e149a Jason Wang 2025-03-24  1817  		return -ENOSPC;
f640220b1e149a Jason Wang 2025-03-24  1818  	}
f640220b1e149a Jason Wang 2025-03-24  1819  
f640220b1e149a Jason Wang 2025-03-24  1820  	c = 0;
f640220b1e149a Jason Wang 2025-03-24  1821  	for (n = 0; n < out_sgs + in_sgs; n++) {
f640220b1e149a Jason Wang 2025-03-24  1822  		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
f640220b1e149a Jason Wang 2025-03-24  1823  			dma_addr_t addr;
f640220b1e149a Jason Wang 2025-03-24  1824  			u32 len;
f640220b1e149a Jason Wang 2025-03-24  1825  
f640220b1e149a Jason Wang 2025-03-24  1826  			if (vring_map_one_sg(vq, sg, n < out_sgs ?
f640220b1e149a Jason Wang 2025-03-24  1827  					     DMA_TO_DEVICE : DMA_FROM_DEVICE,
f640220b1e149a Jason Wang 2025-03-24  1828  					     &addr, &len, premapped))
f640220b1e149a Jason Wang 2025-03-24  1829  				goto unmap_release;
f640220b1e149a Jason Wang 2025-03-24  1830  
f640220b1e149a Jason Wang 2025-03-24  1831  			flags = cpu_to_le16(vq->packed.avail_used_flags |
f640220b1e149a Jason Wang 2025-03-24  1832  				    (++c == total_sg ? 0 : VRING_DESC_F_NEXT) |
f640220b1e149a Jason Wang 2025-03-24  1833  				    (n < out_sgs ? 0 : VRING_DESC_F_WRITE));
f640220b1e149a Jason Wang 2025-03-24  1834  			if (i == head)
f640220b1e149a Jason Wang 2025-03-24  1835  				head_flags = flags;
f640220b1e149a Jason Wang 2025-03-24  1836  			else
f640220b1e149a Jason Wang 2025-03-24  1837  				desc[i].flags = flags;
f640220b1e149a Jason Wang 2025-03-24  1838  
f640220b1e149a Jason Wang 2025-03-24  1839  
f640220b1e149a Jason Wang 2025-03-24  1840  			desc[i].addr = cpu_to_le64(addr);
f640220b1e149a Jason Wang 2025-03-24  1841  			desc[i].len = cpu_to_le32(len);
f640220b1e149a Jason Wang 2025-03-24  1842  			desc[i].id = cpu_to_le16(head);
f640220b1e149a Jason Wang 2025-03-24  1843  
f640220b1e149a Jason Wang 2025-03-24  1844  			if (unlikely(vq->use_dma_api)) {
f640220b1e149a Jason Wang 2025-03-24  1845  				vq->packed.desc_extra[i].addr = premapped ?
f640220b1e149a Jason Wang 2025-03-24  1846  				      DMA_MAPPING_ERROR: addr;
f640220b1e149a Jason Wang 2025-03-24  1847  				vq->packed.desc_extra[i].len = len;
f640220b1e149a Jason Wang 2025-03-24  1848  				vq->packed.desc_extra[i].flags =
f640220b1e149a Jason Wang 2025-03-24  1849  					le16_to_cpu(flags);
f640220b1e149a Jason Wang 2025-03-24  1850  			}
f640220b1e149a Jason Wang 2025-03-24  1851  
f640220b1e149a Jason Wang 2025-03-24  1852  			if ((unlikely(++i >= vq->packed.vring.num))) {
f640220b1e149a Jason Wang 2025-03-24  1853  				i = 0;
f640220b1e149a Jason Wang 2025-03-24  1854  				vq->packed.avail_used_flags ^=
f640220b1e149a Jason Wang 2025-03-24  1855  					1 << VRING_PACKED_DESC_F_AVAIL |
f640220b1e149a Jason Wang 2025-03-24  1856  					1 << VRING_PACKED_DESC_F_USED;
f640220b1e149a Jason Wang 2025-03-24  1857  				vq->packed.avail_wrap_counter ^= 1;
f640220b1e149a Jason Wang 2025-03-24  1858  			}
f640220b1e149a Jason Wang 2025-03-24  1859  
f640220b1e149a Jason Wang 2025-03-24  1860  			total_len += len;
f640220b1e149a Jason Wang 2025-03-24  1861  		}
f640220b1e149a Jason Wang 2025-03-24  1862  	}
f640220b1e149a Jason Wang 2025-03-24  1863  
f640220b1e149a Jason Wang 2025-03-24  1864  	/* We're using some buffers from the free list. */
f640220b1e149a Jason Wang 2025-03-24  1865  	vq->vq.num_free -= total_sg;
f640220b1e149a Jason Wang 2025-03-24  1866  
f640220b1e149a Jason Wang 2025-03-24  1867  	/* Update free pointer */
f640220b1e149a Jason Wang 2025-03-24  1868  	vq->next_avail_idx = i;
f640220b1e149a Jason Wang 2025-03-24  1869  
f640220b1e149a Jason Wang 2025-03-24  1870  	/* Store token. */
f640220b1e149a Jason Wang 2025-03-24  1871  	vq->packed.desc_state[head].num = total_sg;
f640220b1e149a Jason Wang 2025-03-24  1872  	vq->packed.desc_state[head].data = data;
f640220b1e149a Jason Wang 2025-03-24  1873  	vq->packed.desc_state[head].indir_desc = ctx;
f640220b1e149a Jason Wang 2025-03-24  1874  	vq->packed.desc_state[head].total_len = total_len;
f640220b1e149a Jason Wang 2025-03-24  1875  
f640220b1e149a Jason Wang 2025-03-24  1876  	/*
f640220b1e149a Jason Wang 2025-03-24  1877  	 * A driver MUST NOT make the first descriptor in the list
f640220b1e149a Jason Wang 2025-03-24  1878  	 * available before all subsequent descriptors comprising
f640220b1e149a Jason Wang 2025-03-24  1879  	 * the list are made available.
f640220b1e149a Jason Wang 2025-03-24  1880  	 */
f640220b1e149a Jason Wang 2025-03-24  1881  	virtio_wmb(vq->weak_barriers);
f640220b1e149a Jason Wang 2025-03-24 @1882  	vq->packed.vring.desc[head].flags = head_flags;
f640220b1e149a Jason Wang 2025-03-24  1883  	vq->num_added += total_sg;
f640220b1e149a Jason Wang 2025-03-24  1884  
f640220b1e149a Jason Wang 2025-03-24  1885  	pr_debug("Added buffer head %i to %p\n", head, vq);
f640220b1e149a Jason Wang 2025-03-24  1886  	END_USE(vq);
f640220b1e149a Jason Wang 2025-03-24  1887  
f640220b1e149a Jason Wang 2025-03-24  1888  	return 0;
f640220b1e149a Jason Wang 2025-03-24  1889  
f640220b1e149a Jason Wang 2025-03-24  1890  unmap_release:
f640220b1e149a Jason Wang 2025-03-24  1891  	err_idx = i;
f640220b1e149a Jason Wang 2025-03-24  1892  	i = head;
f640220b1e149a Jason Wang 2025-03-24  1893  	vq->packed.avail_used_flags = avail_used_flags;
f640220b1e149a Jason Wang 2025-03-24  1894  
f640220b1e149a Jason Wang 2025-03-24  1895  	for (n = 0; n < total_sg; n++) {
f640220b1e149a Jason Wang 2025-03-24  1896  		if (i == err_idx)
f640220b1e149a Jason Wang 2025-03-24  1897  			break;
f640220b1e149a Jason Wang 2025-03-24  1898  		vring_unmap_extra_packed(vq, &vq->packed.desc_extra[i]);
f640220b1e149a Jason Wang 2025-03-24  1899  		i++;
f640220b1e149a Jason Wang 2025-03-24  1900  		if (i >= vq->packed.vring.num)
f640220b1e149a Jason Wang 2025-03-24  1901  			i = 0;
f640220b1e149a Jason Wang 2025-03-24  1902  	}
f640220b1e149a Jason Wang 2025-03-24  1903  
f640220b1e149a Jason Wang 2025-03-24  1904  	END_USE(vq);
f640220b1e149a Jason Wang 2025-03-24  1905  	return -EIO;
f640220b1e149a Jason Wang 2025-03-24  1906  }
f640220b1e149a Jason Wang 2025-03-24  1907  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
