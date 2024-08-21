Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D501C19ABD0
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Aug 2024 08:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230457; cv=none; b=eBqSzfBgN21jfKMJicK5zXscvY6FMwnUEn/iLEMCtc6Xz+rJIP3YWXnj2bpkN8KHiIMatWFx9iz4EPnotNfmMso5qYiZCcMULFtaCZdcsPLPZx12pSDBMnb9d/Bga/uY/JwpGxzHnW2VOq8Ev8uXC7tuLMzxkCKta12Uj3DyAlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230457; c=relaxed/simple;
	bh=hKk9/fgwcayiGikuEfw16S2ri1DV4q31K69raq8ttZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dABBwX0I1bRj7+aRzFQBiC8IsgBiH18SSjp6jI43Hk56CvAVx+ND+2mvgrnLBqXuRlTG8AKJrXxljUR5PG38bst3R0VwkIxfDKqnjxvnqlzZajv2Ko2AidpTnmuyxjA+ySjrDYvlai8wX+kWhrEzt1XbKrUJhhwummByOCrq84Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHrUffLZ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHrUffLZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bf006f37daso969451a12.1
        for <oe-kbuild@lists.linux.dev>; Wed, 21 Aug 2024 01:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724230454; x=1724835254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5PwpfWJBg4VL77bHtinD2D9Ddh+cX6mslBqHqUnUGpE=;
        b=mHrUffLZAuEHqBobHhVPWCELACgYHBV1xy/mEwvpIdBJFnvPeEydCRBcmzsqSo9eKj
         bHebrYBfBfLfwjXuQwO/rSidEti+r1Tftt7VxIYBU5KNrshYa0C+IzKemRThnh8yXTYn
         qHrFG+e6xbCqigy66vsXBUXcORuVF+mXaPccx3JTy1dt1Hpr9fbh3wyG+jQO8vsm6psD
         /jf3YHUfpNb9aEPb8MWW5kMnKCp1JxbfZT8TwczwD+4z8T+b7wovDSzcFqk7NuPHf6Kk
         M+b37leWmMiUkwqjgdMJcmh+2ri+DkJXMwlX++j44e7bq3Lbx1M/aGkyR7CrSyBUJb7M
         XOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230454; x=1724835254;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PwpfWJBg4VL77bHtinD2D9Ddh+cX6mslBqHqUnUGpE=;
        b=loVXoitv8zezG3rCu+btxtjGDll/kDzST1s677Gq+HDRMYkgswoQQv1lPDtTtHOYAa
         wVF4g7in4zj6Ei4Q1Xb/vsPVFElPXecnW6eCk6K9Ec2FrstlemVLeGb40+rBQNumIKVx
         uy9cOKJZWCJOF5wlXuOXe8nyFLBf8t/CYvI+vhDxDCNTvLBD0WD2ecXDWNf8aDhpd/Sk
         1sgmbl4muC3k1sQVnEDkxIYN+1cWkjocTVhW/tcif1PMdyEJG4FeXAGfD/PCN/g1sMLl
         mwz9b6vhRAoWYtGG7zH7ix3DiMHZ2Wn/xhLIVJyue+5uczuJ33csBRdmngEz4Hlv42Pq
         23Yw==
X-Gm-Message-State: AOJu0YxQb6d+S0d17n56b6UDNXIyfWrZYUskmHuyPCCHxfYMN49CaC2t
	lmogMnNRQqeRY0pTgQ9NYcmnf/dthsrcq8vwBh5SWaXEzQa5EVnbW9ZX59cvpntgg7Nw/MJDroD
	S
X-Google-Smtp-Source: AGHT+IHqniaD95wWus1dUs8I0Ds16yyLnF/G5gMUwehcGxhDJjRsnQPQLN+BSei0nmBBpkxAspsBIA==
X-Received: by 2002:a05:6402:d0d:b0:5be:fadc:8710 with SMTP id 4fb4d7f45d1cf-5bf1e6d6c6cmr1425459a12.7.1724230453674;
        Wed, 21 Aug 2024 01:54:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bf0110009bsm2845518a12.37.2024.08.21.01.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:54:12 -0700 (PDT)
Date: Wed, 21 Aug 2024 11:54:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	virtualization@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH net-next 03/13] virtio_ring: packed: harden dma unmap for
 indirect
Message-ID: <8c34ab7c-6063-4686-8623-7dfd31b5ff0d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820073330.9161-4-xuanzhuo@linux.alibaba.com>

Hi Xuan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio_ring-introduce-vring_need_unmap_buffer/20240820-153644
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240820073330.9161-4-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH net-next 03/13] virtio_ring: packed: harden dma unmap for indirect
config: x86_64-randconfig-161-20240820 (https://download.01.org/0day-ci/archive/20240821/202408210655.dx8v5uRW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408210655.dx8v5uRW-lkp@intel.com/

New smatch warnings:
drivers/virtio/virtio_ring.c:1634 detach_buf_packed() error: uninitialized symbol 'desc'.

vim +/desc +1634 drivers/virtio/virtio_ring.c

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
                                                              ^^^^
desc is never initialized/used.

dfcc54f92ab71c Xuan Zhuo  2024-08-20  1635  		state->indir = NULL;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1636  	} else if (ctx) {
dfcc54f92ab71c Xuan Zhuo  2024-08-20  1637  		*ctx = state->indir;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1638  	}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1639  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

