Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1820B328B47
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 21:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769723840; cv=none; b=LLhepts2t0CzjbxZ/HpDLJYXn4d9fvnCJ2kodWt/gJLIeyMUiZ1yir7rHqVfmuDGR7ikxtvArQcFq77tiJqbiuvsESyo79cqrns0TSt+07Aw/repYdSn00MFbx8Ys4M2tek5M+W/q5xX/vipf2iNpVGXoh4Y40roZGZRmc+pTXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769723840; c=relaxed/simple;
	bh=tyD3dk0PZuyVOEAjWP4XhjZGmi9LlHARydAjqhmFDf8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VPm58hjEgS/9HnfVHfiABEezKQ5sgVFmkAFCVYXzkwd0NKUY+sEWO6t0/aN0lJhEvC9AOkuW6a5svbSDOYJXhwVzbb1g+8h7bteMerOuhzuEEXl7LEIJ5HTMM4/yJ7HclcQFBQsI7XpSHN360DMIhRVPl+Kn+H21uhUNXApAoYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8oBYIIn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8oBYIIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769723840; x=1801259840;
  h=date:from:to:cc:subject:message-id;
  bh=tyD3dk0PZuyVOEAjWP4XhjZGmi9LlHARydAjqhmFDf8=;
  b=f8oBYIInoMWRDXjPbw9Tgn4apnfHDO6ycGd/NVLREUTjqzb4q53MlONd
   ieuZoZBayBzssPJzdJix37c7o1V6N7cC1vW9RILdsfmE0HE6Q8nr+5XED
   j+BcVWaN1eqXOeVtxIRIJG2M50/ZGIMp6aDKIYU0FAeHBlju7I4c9JXLc
   TC45sQ3vX4GUgcrTh5ypC6+WrCyQUSFBUEOSZ3lAFgHOdOFvXLacpAAAI
   tAS26XJ5VZokn5AQ5P231f3kXEwhYDmVRRzi6k3LLrQt6TRPZygyAdLiY
   j65A1gvrU6QP7ApIB2B90Mw21888cPQkTzv+ps0aqee3A/ZpYrUBl3BeD
   g==;
X-CSE-ConnectionGUID: z9E0HjjZQdO263ltDvMrGA==
X-CSE-MsgGUID: 8/g2u1NTQrOpB33koVH5Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74601833"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="74601833"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 13:57:19 -0800
X-CSE-ConnectionGUID: fYZ38Tf+SjCIKLvVXNx1Nw==
X-CSE-MsgGUID: 3WRMTv1hT3Kgz9Th9FOMMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="208483353"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jan 2026 13:57:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vla0o-00000000bvg-3UX0;
	Thu, 29 Jan 2026 21:57:14 +0000
Date: Fri, 30 Jan 2026 05:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:vcam 5/5] drivers/media/vcam.c:2125
 vcam_ioc_create() warn: missing unwind goto?
Message-ID: <202601300538.JXMn1pFr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   f29b36ecc2e18e1d170008dd2401fea768fac4f0
commit: f29b36ecc2e18e1d170008dd2401fea768fac4f0 [5/5] media: Virtual camera driver
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20260130 (https://download.01.org/0day-ci/archive/20260130/202601300538.JXMn1pFr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601300538.JXMn1pFr-lkp@intel.com/

smatch warnings:
drivers/media/vcam.c:2125 vcam_ioc_create() warn: missing unwind goto?

vim +2125 drivers/media/vcam.c

f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2059  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2060  static int vcam_ioc_create(struct file *file, struct vcam *dev,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2061  			   struct vcam_ioc_create *config, char *card_label,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2062  			   unsigned int len, struct file **control_file)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2063  {
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2064  	const struct vb2_mem_ops *mem_ops = &vb2_vmalloc_memops;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2065  	struct v4l2_format fmt;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2066  	struct vb2_queue *queue;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2067  	long ret;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2068  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2069  	memset((u8 *)dev + sizeof(dev->flags), 0,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2070  	       sizeof(*dev) - sizeof(dev->flags));
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2071  	kref_init(&dev->ref);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2072  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2073  	dev->device_nr = -1;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2074  	strscpy(dev->v4l2_dev.name, "vcam", sizeof(dev->v4l2_dev.name));
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2075  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2076  	ret = v4l2_device_register(NULL, &dev->v4l2_dev);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2077  	if (ret)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2078  		return ret;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2079  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2080  	dev->vdev = vcam_dev_new(dev, card_label, len);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2081  	if (!dev->vdev) {
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2082  		ret = -ENOMEM;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2083  		goto err_unregister;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2084  	}
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2085  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2086  	mutex_init(&dev->lock);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2087  	spin_lock_init(&dev->frame_lock);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2088  	spin_lock_init(&dev->control_lock);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2089  	INIT_LIST_HEAD(&dev->capture_list);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2090  	INIT_LIST_HEAD(&dev->output_list);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2091  	set_bit(VCAM_FLAG_CREATED, &dev->flags);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2092  	dev->out_queue_released = false;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2093  	atomic_set(&dev->sequence, 0);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2094  	dev->capture_control_flags = 0;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2095  	dev->output_control_flags = 0;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2096  	dev->output_memory = VB2_MEMORY_MMAP;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2097  	dev->output_dmabufs = NULL;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2098  	dev->output_dmabuf_count = 0;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2099  	init_waitqueue_head(&dev->control_waitq);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2100  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2101  	dev->vdev->v4l2_dev = &dev->v4l2_dev;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2102  	dev->vdev->queue = &dev->capture_queue;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2103  	dev->vdev->lock = &dev->lock;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2104  	dev->capture.capability = 0;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2105  	dev->capture.capturemode = 0;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2106  	dev->capture.extendedmode = 0;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2107  	dev->capture.readbuffers = VCAM_MIN_FRAMES;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2108  	dev->capture.timeperframe.numerator = 1;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2109  	dev->capture.timeperframe.denominator = 30;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2110  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2111  	if (config->features & VCAM_FEATURE_CONTIG) {
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2112  		ret = dma_set_mask_and_coherent(&dev->vdev->dev,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2113  						DMA_BIT_MASK(64));
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2114  		if (ret)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2115  			ret = dma_set_mask_and_coherent(&dev->vdev->dev,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2116  							DMA_BIT_MASK(32));
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2117  		if (ret)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2118  			return -EOPNOTSUPP;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2119  		mem_ops = &vb2_dma_contig_memops;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2120  	}
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2121  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2122  	if ((config->features & VCAM_FEATURE_DMABUF) &&
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2123  	    (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER) ||
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2124  	     !mem_ops->attach_dmabuf))
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23 @2125  		return -EOPNOTSUPP;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2126  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2127  	fmt = (struct v4l2_format){
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2128  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2129  		.fmt.pix = { .width = config->width,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2130  			     .height = config->height,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2131  			     .pixelformat = config->pixelformat,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2132  			     .colorspace = config->colorspace,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2133  			     .bytesperline = config->bytesperline,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2134  			     .field = V4L2_FIELD_NONE }
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2135  	};
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2136  	{
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2137  		struct v4l2_format try_fmt = fmt;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2138  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2139  		ret = vcam_try_fmt_out(dev, &try_fmt);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2140  		if (ret)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2141  			goto err_unregister;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2142  		if (try_fmt.fmt.pix.width != fmt.fmt.pix.width ||
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2143  		    try_fmt.fmt.pix.height != fmt.fmt.pix.height ||
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2144  		    try_fmt.fmt.pix.pixelformat != fmt.fmt.pix.pixelformat ||
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2145  		    (fmt.fmt.pix.colorspace != V4L2_COLORSPACE_DEFAULT &&
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2146  		     try_fmt.fmt.pix.colorspace != fmt.fmt.pix.colorspace) ||
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2147  		    try_fmt.fmt.pix.bytesperline != fmt.fmt.pix.bytesperline) {
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2148  			ret = -EINVAL;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2149  			goto err_unregister;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2150  		}
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2151  	}
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2152  	ret = vcam_s_fmt_out(dev, &fmt);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2153  	if (ret)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2154  		goto err_unregister;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2155  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2156  	queue = &dev->capture_queue;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2157  	queue->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2158  	queue->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2159  	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2160  	queue->drv_priv = dev;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2161  	queue->buf_struct_size = sizeof(struct vcam_buf);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2162  	queue->ops = &vcam_vb2_ops;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2163  	queue->mem_ops = mem_ops;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2164  	queue->lock = &dev->lock;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2165  	queue->dev = &dev->vdev->dev;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2166  	ret = vb2_queue_init(queue);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2167  	if (ret)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2168  		goto err_unregister;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2169  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2170  	queue = &dev->output_queue;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2171  	queue->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2172  	queue->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2173  	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2174  	queue->drv_priv = dev;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2175  	queue->buf_struct_size = sizeof(struct vcam_buf);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2176  	queue->ops = &vcam_vb2_ops;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2177  	queue->mem_ops = mem_ops;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2178  	queue->lock = &dev->lock;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2179  	queue->dev = &dev->vdev->dev;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2180  	ret = vb2_queue_init(queue);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2181  	if (ret)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2182  		goto err_capture_queue;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2183  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2184  	ret = video_register_device(dev->vdev, VFL_TYPE_VIDEO, -1);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2185  	if (ret < 0)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2186  		goto err_output_queue;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2187  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2188  	ret = vcam_ioc_alloc_priv(file, dev, config->nr_frames,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2189  				  (void __user *)(uintptr_t)config->frames,
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2190  				  (config->features & VCAM_FEATURE_DMABUF) ?
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2191  				  VB2_MEMORY_DMABUF : VB2_MEMORY_MMAP);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2192  	if (ret)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2193  		goto err_vdev;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2194  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2195  	dev->device_nr = dev->vdev->num;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2196  	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "vcam-%d",
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2197  		 dev->device_nr);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2198  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2199  	ret = vcam_control_create(dev, config, control_file);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2200  	if (ret)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2201  		goto err_vdev;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2202  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2203  	config->device_nr = dev->vdev->num;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2204  	return 0;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2205  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2206  err_vdev:
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2207  	video_unregister_device(dev->vdev);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2208  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2209  err_output_queue:
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2210  	if (!dev->out_queue_released)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2211  		vb2_queue_release(&dev->output_queue);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2212  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2213  err_capture_queue:
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2214  	vb2_queue_release(&dev->capture_queue);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2215  
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2216  err_unregister:
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2217  	if (dev->vdev)
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2218  		video_device_release(dev->vdev);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2219  	v4l2_device_unregister(&dev->v4l2_dev);
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2220  	return ret;
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2221  }
f29b36ecc2e18e1 Jarkko Sakkinen 2026-01-23  2222  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
