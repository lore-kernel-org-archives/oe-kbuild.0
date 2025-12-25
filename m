Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F009292918
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 04:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766637103; cv=none; b=Kb87hkV3LGT5j2oW7D/uIZNCVu6YQ1xP6Yht+mplfXSt71I1U5yBgOUMjbJKzujEYCFFED6aDZd4ifN6Mrs37rNPEwJjyEstTQ+MKJJxDfHTzkkdJBZZBOfZKQC90x26NEIuGdSrxY23TOKse215GM4BEIjyXwdEedQ/oAQwJUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766637103; c=relaxed/simple;
	bh=/vUr7zYCiWI+uTMoyjoHU4z/uIp3o64HqWPX8ZD9Rvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUNbxedLkwHJc8Zp+1AbUQ9J/z0nlsEo3XMHqocbu9b5AJQ84mmL+7RoaNrq1q/W2+5TrHr4X7xjCznzw3bu5G/5NELpMuWIuCucYTC1v+S1TV+19s+syKCCLePw5rAppTWFvreAZ6ZRe6B8RzLpXzhN0XIE7QK+thuOdT6uJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnNr+J/t; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnNr+J/t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766637102; x=1798173102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/vUr7zYCiWI+uTMoyjoHU4z/uIp3o64HqWPX8ZD9Rvs=;
  b=nnNr+J/tg6kDdAPOnsQcZ2nELhNevQ7j16LwNyA9Cqomfu/E3sXcw44V
   AYvISoxTVaaRhhzw33zDP8OU7gJ7mv4cxERCEfUNd/J+U02YblU/5BVFs
   MrfIy4LOGDT33A3MF6IFS05CJBBEemofGHj3zPNCHyopJkSsKe9axZQlO
   sYQ9PCk3yRzDPBvn20tMq/t9xf6CQ3a1ki1SIYd/RyRGG5SuBLv+V2zej
   MLeCK02iKvzM+59AykWGhGGjYvyV9tHwUPiP+k2QFb/0TSuk+9QH/RdiE
   EQYWn7Q04bultLnWIAY4VORBTltpQ2zh+54GpAP0VLPn0Od0JVAeqz5/1
   g==;
X-CSE-ConnectionGUID: stfTqo1oSgi5HYaduBjy0A==
X-CSE-MsgGUID: BMgXSee9Tbq1Qv5wbvRvgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72080891"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="72080891"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 20:31:40 -0800
X-CSE-ConnectionGUID: RJuK1EQ+QQyDi1sZMoPf8g==
X-CSE-MsgGUID: 5BNP7zMbRBGcJSab/yaZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199391871"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Dec 2025 20:31:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYd0h-000000003kL-3Opr;
	Thu, 25 Dec 2025 04:31:35 +0000
Date: Thu, 25 Dec 2025 12:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V10 19/19] virtio_ring: add in order support
Message-ID: <202512251237.1g0MyG32-lkp@intel.com>
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
In-Reply-To: <20251224003309.23432-20-jasowang@redhat.com>
References: <20251224003309.23432-20-jasowang@redhat.com>
TO: Jason Wang <jasowang@redhat.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.19-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Wang/virtio_ring-rename-virtqueue_reinit_xxx-to-virtqueue_reset_xxx/20251224-085755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20251224003309.23432-20-jasowang%40redhat.com
patch subject: [PATCH V10 19/19] virtio_ring: add in order support
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251225/202512251237.1g0MyG32-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512251237.1g0MyG32-lkp@intel.com/

New smatch warnings:
drivers/virtio/virtio_ring.c:1896 virtqueue_add_packed_in_order() error: uninitialized symbol 'head_flags'.

Old smatch warnings:
drivers/virtio/virtio_ring.c:1734 virtqueue_add_packed() error: uninitialized symbol 'prev'.
drivers/virtio/virtio_ring.c:1742 virtqueue_add_packed() error: uninitialized symbol 'head_flags'.

vim +/head_flags +1896 drivers/virtio/virtio_ring.c

1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1770  
b8ff8e25553483 Jason Wang 2025-12-24  1771  static inline int virtqueue_add_packed_in_order(struct vring_virtqueue *vq,
b8ff8e25553483 Jason Wang 2025-12-24  1772  						struct scatterlist *sgs[],
b8ff8e25553483 Jason Wang 2025-12-24  1773  						unsigned int total_sg,
b8ff8e25553483 Jason Wang 2025-12-24  1774  						unsigned int out_sgs,
b8ff8e25553483 Jason Wang 2025-12-24  1775  						unsigned int in_sgs,
b8ff8e25553483 Jason Wang 2025-12-24  1776  						void *data,
b8ff8e25553483 Jason Wang 2025-12-24  1777  						void *ctx,
b8ff8e25553483 Jason Wang 2025-12-24  1778  						bool premapped,
b8ff8e25553483 Jason Wang 2025-12-24  1779  						gfp_t gfp)
b8ff8e25553483 Jason Wang 2025-12-24  1780  {
b8ff8e25553483 Jason Wang 2025-12-24  1781  	struct vring_packed_desc *desc;
b8ff8e25553483 Jason Wang 2025-12-24  1782  	struct scatterlist *sg;
b8ff8e25553483 Jason Wang 2025-12-24  1783  	unsigned int i, n, sg_count, err_idx, total_in_len = 0;
b8ff8e25553483 Jason Wang 2025-12-24  1784  	__le16 head_flags, flags;
b8ff8e25553483 Jason Wang 2025-12-24  1785  	u16 head, avail_used_flags;
b8ff8e25553483 Jason Wang 2025-12-24  1786  	int err;
b8ff8e25553483 Jason Wang 2025-12-24  1787  
b8ff8e25553483 Jason Wang 2025-12-24  1788  	START_USE(vq);
b8ff8e25553483 Jason Wang 2025-12-24  1789  
b8ff8e25553483 Jason Wang 2025-12-24  1790  	BUG_ON(data == NULL);
b8ff8e25553483 Jason Wang 2025-12-24  1791  	BUG_ON(ctx && vq->indirect);
b8ff8e25553483 Jason Wang 2025-12-24  1792  
b8ff8e25553483 Jason Wang 2025-12-24  1793  	if (unlikely(vq->broken)) {
b8ff8e25553483 Jason Wang 2025-12-24  1794  		END_USE(vq);
b8ff8e25553483 Jason Wang 2025-12-24  1795  		return -EIO;
b8ff8e25553483 Jason Wang 2025-12-24  1796  	}
b8ff8e25553483 Jason Wang 2025-12-24  1797  
b8ff8e25553483 Jason Wang 2025-12-24  1798  	LAST_ADD_TIME_UPDATE(vq);
b8ff8e25553483 Jason Wang 2025-12-24  1799  
b8ff8e25553483 Jason Wang 2025-12-24  1800  	BUG_ON(total_sg == 0);
b8ff8e25553483 Jason Wang 2025-12-24  1801  
b8ff8e25553483 Jason Wang 2025-12-24  1802  	if (virtqueue_use_indirect(vq, total_sg)) {
b8ff8e25553483 Jason Wang 2025-12-24  1803  		err = virtqueue_add_indirect_packed(vq, sgs, total_sg, out_sgs,
b8ff8e25553483 Jason Wang 2025-12-24  1804  						    in_sgs, data, premapped, gfp,
b8ff8e25553483 Jason Wang 2025-12-24  1805  						    vq->packed.next_avail_idx);
b8ff8e25553483 Jason Wang 2025-12-24  1806  		if (err != -ENOMEM) {
b8ff8e25553483 Jason Wang 2025-12-24  1807  			END_USE(vq);
b8ff8e25553483 Jason Wang 2025-12-24  1808  			return err;
b8ff8e25553483 Jason Wang 2025-12-24  1809  		}
b8ff8e25553483 Jason Wang 2025-12-24  1810  
b8ff8e25553483 Jason Wang 2025-12-24  1811  		/* fall back on direct */
b8ff8e25553483 Jason Wang 2025-12-24  1812  	}
b8ff8e25553483 Jason Wang 2025-12-24  1813  
b8ff8e25553483 Jason Wang 2025-12-24  1814  	head = vq->packed.next_avail_idx;
b8ff8e25553483 Jason Wang 2025-12-24  1815  	avail_used_flags = vq->packed.avail_used_flags;
b8ff8e25553483 Jason Wang 2025-12-24  1816  
b8ff8e25553483 Jason Wang 2025-12-24  1817  	WARN_ON_ONCE(total_sg > vq->packed.vring.num && !vq->indirect);
b8ff8e25553483 Jason Wang 2025-12-24  1818  
b8ff8e25553483 Jason Wang 2025-12-24  1819  	desc = vq->packed.vring.desc;
b8ff8e25553483 Jason Wang 2025-12-24  1820  	i = head;
b8ff8e25553483 Jason Wang 2025-12-24  1821  
b8ff8e25553483 Jason Wang 2025-12-24  1822  	if (unlikely(vq->vq.num_free < total_sg)) {
b8ff8e25553483 Jason Wang 2025-12-24  1823  		pr_debug("Can't add buf len %i - avail = %i\n",
b8ff8e25553483 Jason Wang 2025-12-24  1824  			 total_sg, vq->vq.num_free);
b8ff8e25553483 Jason Wang 2025-12-24  1825  		END_USE(vq);
b8ff8e25553483 Jason Wang 2025-12-24  1826  		return -ENOSPC;
b8ff8e25553483 Jason Wang 2025-12-24  1827  	}
b8ff8e25553483 Jason Wang 2025-12-24  1828  
b8ff8e25553483 Jason Wang 2025-12-24  1829  	sg_count = 0;
b8ff8e25553483 Jason Wang 2025-12-24  1830  	for (n = 0; n < out_sgs + in_sgs; n++) {
b8ff8e25553483 Jason Wang 2025-12-24  1831  		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
b8ff8e25553483 Jason Wang 2025-12-24  1832  			dma_addr_t addr;
b8ff8e25553483 Jason Wang 2025-12-24  1833  			u32 len;
b8ff8e25553483 Jason Wang 2025-12-24  1834  
b8ff8e25553483 Jason Wang 2025-12-24  1835  			flags = 0;
b8ff8e25553483 Jason Wang 2025-12-24  1836  			if (++sg_count != total_sg)
b8ff8e25553483 Jason Wang 2025-12-24  1837  				flags |= cpu_to_le16(VRING_DESC_F_NEXT);
b8ff8e25553483 Jason Wang 2025-12-24  1838  			if (n >= out_sgs)
b8ff8e25553483 Jason Wang 2025-12-24  1839  				flags |= cpu_to_le16(VRING_DESC_F_WRITE);
b8ff8e25553483 Jason Wang 2025-12-24  1840  
b8ff8e25553483 Jason Wang 2025-12-24  1841  			if (vring_map_one_sg(vq, sg, n < out_sgs ?
b8ff8e25553483 Jason Wang 2025-12-24  1842  					     DMA_TO_DEVICE : DMA_FROM_DEVICE,
b8ff8e25553483 Jason Wang 2025-12-24  1843  					     &addr, &len, premapped))
b8ff8e25553483 Jason Wang 2025-12-24  1844  				goto unmap_release;
b8ff8e25553483 Jason Wang 2025-12-24  1845  
b8ff8e25553483 Jason Wang 2025-12-24  1846  			flags |= cpu_to_le16(vq->packed.avail_used_flags);
b8ff8e25553483 Jason Wang 2025-12-24  1847  
b8ff8e25553483 Jason Wang 2025-12-24  1848  			if (i == head)
b8ff8e25553483 Jason Wang 2025-12-24  1849  				head_flags = flags;
b8ff8e25553483 Jason Wang 2025-12-24  1850  			else
b8ff8e25553483 Jason Wang 2025-12-24  1851  				desc[i].flags = flags;
b8ff8e25553483 Jason Wang 2025-12-24  1852  
b8ff8e25553483 Jason Wang 2025-12-24  1853  			desc[i].addr = cpu_to_le64(addr);
b8ff8e25553483 Jason Wang 2025-12-24  1854  			desc[i].len = cpu_to_le32(len);
b8ff8e25553483 Jason Wang 2025-12-24  1855  			desc[i].id = cpu_to_le16(head);
b8ff8e25553483 Jason Wang 2025-12-24  1856  
b8ff8e25553483 Jason Wang 2025-12-24  1857  			if (unlikely(vq->use_map_api)) {
b8ff8e25553483 Jason Wang 2025-12-24  1858  				vq->packed.desc_extra[i].addr = premapped ?
b8ff8e25553483 Jason Wang 2025-12-24  1859  				      DMA_MAPPING_ERROR: addr;
b8ff8e25553483 Jason Wang 2025-12-24  1860  				vq->packed.desc_extra[i].len = len;
b8ff8e25553483 Jason Wang 2025-12-24  1861  				vq->packed.desc_extra[i].flags =
b8ff8e25553483 Jason Wang 2025-12-24  1862  					le16_to_cpu(flags);
b8ff8e25553483 Jason Wang 2025-12-24  1863  			}
b8ff8e25553483 Jason Wang 2025-12-24  1864  
b8ff8e25553483 Jason Wang 2025-12-24  1865  			if ((unlikely(++i >= vq->packed.vring.num))) {
b8ff8e25553483 Jason Wang 2025-12-24  1866  				i = 0;
b8ff8e25553483 Jason Wang 2025-12-24  1867  				vq->packed.avail_used_flags ^=
b8ff8e25553483 Jason Wang 2025-12-24  1868  					1 << VRING_PACKED_DESC_F_AVAIL |
b8ff8e25553483 Jason Wang 2025-12-24  1869  					1 << VRING_PACKED_DESC_F_USED;
b8ff8e25553483 Jason Wang 2025-12-24  1870  				vq->packed.avail_wrap_counter ^= 1;
b8ff8e25553483 Jason Wang 2025-12-24  1871  			}
b8ff8e25553483 Jason Wang 2025-12-24  1872  
b8ff8e25553483 Jason Wang 2025-12-24  1873  			if (n >= out_sgs)
b8ff8e25553483 Jason Wang 2025-12-24  1874  				total_in_len += len;
b8ff8e25553483 Jason Wang 2025-12-24  1875  		}
b8ff8e25553483 Jason Wang 2025-12-24  1876  	}
b8ff8e25553483 Jason Wang 2025-12-24  1877  
b8ff8e25553483 Jason Wang 2025-12-24  1878  	/* We're using some buffers from the free list. */
b8ff8e25553483 Jason Wang 2025-12-24  1879  	vq->vq.num_free -= total_sg;
b8ff8e25553483 Jason Wang 2025-12-24  1880  
b8ff8e25553483 Jason Wang 2025-12-24  1881  	/* Update free pointer */
b8ff8e25553483 Jason Wang 2025-12-24  1882  	vq->packed.next_avail_idx = i;
b8ff8e25553483 Jason Wang 2025-12-24  1883  
b8ff8e25553483 Jason Wang 2025-12-24  1884  	/* Store token. */
b8ff8e25553483 Jason Wang 2025-12-24  1885  	vq->packed.desc_state[head].num = total_sg;
b8ff8e25553483 Jason Wang 2025-12-24  1886  	vq->packed.desc_state[head].data = data;
b8ff8e25553483 Jason Wang 2025-12-24  1887  	vq->packed.desc_state[head].indir_desc = ctx;
b8ff8e25553483 Jason Wang 2025-12-24  1888  	vq->packed.desc_state[head].total_in_len = total_in_len;
b8ff8e25553483 Jason Wang 2025-12-24  1889  
b8ff8e25553483 Jason Wang 2025-12-24  1890  	/*
b8ff8e25553483 Jason Wang 2025-12-24  1891  	 * A driver MUST NOT make the first descriptor in the list
b8ff8e25553483 Jason Wang 2025-12-24  1892  	 * available before all subsequent descriptors comprising
b8ff8e25553483 Jason Wang 2025-12-24  1893  	 * the list are made available.
b8ff8e25553483 Jason Wang 2025-12-24  1894  	 */
b8ff8e25553483 Jason Wang 2025-12-24  1895  	virtio_wmb(vq->weak_barriers);
b8ff8e25553483 Jason Wang 2025-12-24 @1896  	vq->packed.vring.desc[head].flags = head_flags;
b8ff8e25553483 Jason Wang 2025-12-24  1897  	vq->num_added += total_sg;
b8ff8e25553483 Jason Wang 2025-12-24  1898  
b8ff8e25553483 Jason Wang 2025-12-24  1899  	pr_debug("Added buffer head %i to %p\n", head, vq);
b8ff8e25553483 Jason Wang 2025-12-24  1900  	END_USE(vq);
b8ff8e25553483 Jason Wang 2025-12-24  1901  
b8ff8e25553483 Jason Wang 2025-12-24  1902  	return 0;
b8ff8e25553483 Jason Wang 2025-12-24  1903  
b8ff8e25553483 Jason Wang 2025-12-24  1904  unmap_release:
b8ff8e25553483 Jason Wang 2025-12-24  1905  	err_idx = i;
b8ff8e25553483 Jason Wang 2025-12-24  1906  	i = head;
b8ff8e25553483 Jason Wang 2025-12-24  1907  	vq->packed.avail_used_flags = avail_used_flags;
b8ff8e25553483 Jason Wang 2025-12-24  1908  
b8ff8e25553483 Jason Wang 2025-12-24  1909  	for (n = 0; n < total_sg; n++) {
b8ff8e25553483 Jason Wang 2025-12-24  1910  		if (i == err_idx)
b8ff8e25553483 Jason Wang 2025-12-24  1911  			break;
b8ff8e25553483 Jason Wang 2025-12-24  1912  		vring_unmap_extra_packed(vq, &vq->packed.desc_extra[i]);
b8ff8e25553483 Jason Wang 2025-12-24  1913  		i++;
b8ff8e25553483 Jason Wang 2025-12-24  1914  		if (i >= vq->packed.vring.num)
b8ff8e25553483 Jason Wang 2025-12-24  1915  			i = 0;
b8ff8e25553483 Jason Wang 2025-12-24  1916  	}
b8ff8e25553483 Jason Wang 2025-12-24  1917  
b8ff8e25553483 Jason Wang 2025-12-24  1918  	END_USE(vq);
b8ff8e25553483 Jason Wang 2025-12-24  1919  	return -EIO;
b8ff8e25553483 Jason Wang 2025-12-24  1920  }
b8ff8e25553483 Jason Wang 2025-12-24  1921  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
