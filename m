Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB392165EE1
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Aug 2024 22:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724194439; cv=none; b=gbqG4EsIby/QwYPecDYS/51ulAq7UqxZq8BJT+fduOMPXzym3xD5VEy8S8W1fsKPzBvKyBiZO9QPV6JCYLG/zWOJR69RqigVDXIBQrqxN7IwPzx05t2dzeImKUdvfXxrdKXz9GkDkiBiYSTd0lazEDVX2xs1KLA1jEJgApvLV6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724194439; c=relaxed/simple;
	bh=jBEj8kLKdLUHWv9jmrMJ4Y/RWUVSWTpMcEd8G9KA1ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uff/7t0/UhI+aRVG9qj9VtKXm3fVIEz1mDA4DqVB14gMalzUM/LjDQ8Clg40PKDULarUND3UUQEfLWOOpi29O+t+fDzXPRFR7/ztCEen3n2xaDRccktr3iAmN84UVcUI+y6QJfbixHmdSWKqpVN0KpMASntEM8gPRdD4ybgPpQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRJM60fS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRJM60fS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724194438; x=1755730438;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jBEj8kLKdLUHWv9jmrMJ4Y/RWUVSWTpMcEd8G9KA1ys=;
  b=HRJM60fS2NcCwesyCEhfxy43kMGwH5WGF5NW8dvi3Lu1EWwWq125NlB7
   DOtxlK0vyhB4HZUKcAFs2Pg3rYgY2CtJy5XPQ0gYvXJtuhiNIy5U+NEFp
   0Qfax/MY6vKSnpjdFKsHYNv5MTjaxJqcj/wh7R7i36qzS/X87tK/SZ0Ju
   ThlZgEYc8RyjmAbu4TWorcB2YW+u5fffboK68/J2IdP6b2w1+o1lWJ2mV
   3xM57keq6AJmxOzllbd94GfWPLLCCY+o0Ml5GUbsCugKV+kuBMa0tWxHy
   D4ATGinptcz7Zcv+DJw37Y/8IzQw/NJxPleePlsOaPXh3gwJfKV7xD/xc
   g==;
X-CSE-ConnectionGUID: zF3jK/xmRGOHjAvA6vslqw==
X-CSE-MsgGUID: zVKwv/JsQaOYsRQnvitDJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="13121034"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="13121034"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:53:57 -0700
X-CSE-ConnectionGUID: sVodCnz4Qn+QpiUoEkpohw==
X-CSE-MsgGUID: GpF7/24fTyi1mqCV13fHCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="60593713"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Aug 2024 15:53:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgXje-000Afc-0Y;
	Tue, 20 Aug 2024 22:53:54 +0000
Date: Wed, 21 Aug 2024 06:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 03/13] virtio_ring: packed: harden dma unmap for
 indirect
Message-ID: <202408210655.dx8v5uRW-lkp@intel.com>
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
In-Reply-To: <20240820073330.9161-4-xuanzhuo@linux.alibaba.com>
References: <20240820073330.9161-4-xuanzhuo@linux.alibaba.com>
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
TO: netdev@vger.kernel.org
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: "Eugenio Pérez" <eperezma@redhat.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Jesper Dangaard Brouer <hawk@kernel.org>
CC: John Fastabend <john.fastabend@gmail.com>
CC: virtualization@lists.linux.dev
CC: bpf@vger.kernel.org

Hi Xuan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio_ring-introduce-vring_need_unmap_buffer/20240820-153644
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240820073330.9161-4-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH net-next 03/13] virtio_ring: packed: harden dma unmap for indirect
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-161-20240820 (https://download.01.org/0day-ci/archive/20240821/202408210655.dx8v5uRW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408210655.dx8v5uRW-lkp@intel.com/

New smatch warnings:
drivers/virtio/virtio_ring.c:1634 detach_buf_packed() error: uninitialized symbol 'desc'.

Old smatch warnings:
drivers/virtio/virtio_ring.c:1508 virtqueue_add_packed() error: uninitialized symbol 'prev'.
drivers/virtio/virtio_ring.c:1516 virtqueue_add_packed() error: uninitialized symbol 'head_flags'.
drivers/virtio/virtio_ring.c:636 virtqueue_add_split() error: uninitialized symbol 'prev'.

vim +/desc +1634 drivers/virtio/virtio_ring.c

1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1593  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1594  static void detach_buf_packed(struct vring_virtqueue *vq,
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1595  			      unsigned int id, void **ctx)
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1596  {
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1597  	struct vring_desc_state_packed *state = NULL;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1598  	struct vring_packed_desc *desc;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1599  	unsigned int i, curr;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1600  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1601  	state = &vq->packed.desc_state[id];
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1602  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1603  	/* Clear data ptr. */
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1604  	state->data = NULL;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1605  
aeef9b4733c5c2 Jason Wang 2021-06-04  1606  	vq->packed.desc_extra[state->last].next = vq->free_head;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1607  	vq->free_head = id;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1608  	vq->vq.num_free += state->num;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1609  
d5c0ed17fea60c Xuan Zhuo  2024-02-23  1610  	if (unlikely(vq->use_dma_api)) {
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1611  		curr = id;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1612  		for (i = 0; i < state->num; i++) {
d80dc15bb6e76a Xuan Zhuo  2022-02-24  1613  			vring_unmap_extra_packed(vq,
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1614  						 &vq->packed.desc_extra[curr]);
aeef9b4733c5c2 Jason Wang 2021-06-04  1615  			curr = vq->packed.desc_extra[curr].next;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1616  		}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1617  	}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1618  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1619  	if (vq->indirect) {
dfcc54f92ab71c Xuan Zhuo  2024-08-20  1620  		struct vring_desc_extra *extra;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1621  		u32 len;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1622  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1623  		/* Free the indirect table, if any, now that it's unmapped. */
dfcc54f92ab71c Xuan Zhuo  2024-08-20  1624  		extra = state->indir;
dfcc54f92ab71c Xuan Zhuo  2024-08-20  1625  		if (!extra)
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1626  			return;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1627  
de6a29c4b4c442 Xuan Zhuo  2024-08-20  1628  		if (vring_need_unmap_buffer(vq)) {
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1629  			len = vq->packed.desc_extra[id].len;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1630  			for (i = 0; i < len / sizeof(struct vring_packed_desc);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1631  					i++)
dfcc54f92ab71c Xuan Zhuo  2024-08-20  1632  				vring_unmap_extra_packed(vq, &extra[i]);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1633  		}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21 @1634  		kfree(desc);
dfcc54f92ab71c Xuan Zhuo  2024-08-20  1635  		state->indir = NULL;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1636  	} else if (ctx) {
dfcc54f92ab71c Xuan Zhuo  2024-08-20  1637  		*ctx = state->indir;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1638  	}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1639  }
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1640  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
