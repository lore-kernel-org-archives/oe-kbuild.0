Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B1B31B812
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770196456; cv=none; b=OjFQUsbYcaRuSYXkDV5NMszJVhnAK0P0WCa/tPdWzxAkz74+TrYRx1G7VP/wLsXifm73OfbpWJYq+wpKI5rCPF4g1m8GL83fpfi+vSAjW39yuzlwts94rKfVk9e/EWFGbXeQv/IGyUBSEm85eWZsRnXcu3xMa2c8qYTQcq0rGq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770196456; c=relaxed/simple;
	bh=ut5m73/Hdbi5nb1VZLRiXthTNwiSNLXw5wqQ4GlNzRY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rP0vshSel2d7xy1f4oFX41J3nX8D1wWO8yqHTS0rSHaXzd8HpNk3+IZk869LcfMPZCFoLbbsYIQFV21lPqmFQrQlO7dEY1mb1T7/QEmFEaqBUv8nznBAeTnDwDmB0AdsYk0lCcNhrSVW/FL1jw4ISAiT8UxJ3GlM6N7RBxJJ1do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGKva6lu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGKva6lu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770196456; x=1801732456;
  h=date:from:to:cc:subject:message-id;
  bh=ut5m73/Hdbi5nb1VZLRiXthTNwiSNLXw5wqQ4GlNzRY=;
  b=mGKva6luDon+nhNpsDe6prmkJTGNmbpJkdNW9fo+vrSBzzLdZt34vhcZ
   cIYfXE1z//g08SyML5vIwNJnkUEnFUqPnlURppuh5HsVmb92T1mYTc8Yo
   gp/mPV6wZ6UuLhHhMtm+DXXayaSYnc84xHTmvcRCfdRZyAMWHgg4YgL+T
   kVKMHz65wlnxNMfmh34yNhdwlu23XlbF43H/U37Zct0JtyRxHR2ub6cV2
   YkLz7UF/DHcoPdTGhi33VF1QCFJpyKOU/GnApuhkHBrJFmSWwIdH/1LHq
   lNVQrD8W1DyYJpaQ1HVccCTBNvJiuN/BIb2Q6ZQD94ggUaUk77OvgwZV7
   w==;
X-CSE-ConnectionGUID: u8NVoQFtTwmSbH7BO9vnOw==
X-CSE-MsgGUID: C8Bem4HRROSto5lhY7Hqhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82121215"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82121215"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 01:14:15 -0800
X-CSE-ConnectionGUID: yU2tAMg6TKyNlOajTiymzg==
X-CSE-MsgGUID: Tqh4a43nSbagREvzsF5WHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="215092025"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2026 01:14:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnYxf-00000000hdE-2R2j;
	Wed, 04 Feb 2026 09:14:11 +0000
Date: Wed, 04 Feb 2026 17:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jarkko-tpmdd:vcam 5/5] drivers/media/swcam.c:1954
 swcam_ioc_create() error: double free of 'frame_rates' (line 1875)
Message-ID: <202602041717.HUkAFTTl-lkp@intel.com>
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
head:   2ad939d7a72b6d8166199e95dcffe000d3a6401e
commit: 2ad939d7a72b6d8166199e95dcffe000d3a6401e [5/5] media: Software-defined camera driver
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: sparc-randconfig-r072-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041717.HUkAFTTl-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602041717.HUkAFTTl-lkp@intel.com/

smatch warnings:
drivers/media/swcam.c:1954 swcam_ioc_create() error: double free of 'frame_rates' (line 1875)
drivers/media/swcam.c:1956 swcam_ioc_create() error: double free of 'pix_formats' (line 1876)

vim +/frame_rates +1954 drivers/media/swcam.c

2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1705  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1706  static int swcam_ioc_create(struct file *file, struct swcam *dev,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1707  			    struct swcam_ioc_create *config, char *card_label,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1708  			    unsigned int len)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1709  {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1710  	u32 first_mode_sorted = config->nr_modes;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1711  	struct swcam_mode *modes = NULL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1712  	struct swcam_mode first_mode;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1713  	struct v4l2_pix_format *pix_formats = NULL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1714  	u32 *frame_rates = NULL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1715  	struct v4l2_format try_fmt;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1716  	struct video_device *vdev;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1717  	struct vb2_queue *queue;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1718  	struct v4l2_format fmt;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1719  	long ret;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1720  	u32 i;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1721  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1722  	strscpy(dev->v4l2_dev.name, "swcam", sizeof(dev->v4l2_dev.name));
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1723  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1724  	ret = v4l2_device_register(NULL, &dev->v4l2_dev);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1725  	if (ret)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1726  		return ret;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1727  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1728  	vdev = video_device_alloc();
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1729  	if (!vdev) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1730  		ret = -ENOMEM;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1731  		goto err_unregister;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1732  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1733  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1734  	dev->vdev = vdev;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1735  	video_set_drvdata(vdev, dev);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1736  	memcpy(vdev->name, card_label, len);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1737  	vdev->name[len] = '\0';
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1738  	vdev->vfl_type = VFL_TYPE_VIDEO;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1739  	vdev->fops = &swcam_vdev_fops;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1740  	vdev->ioctl_ops = &swcam_ioctl_ops;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1741  	vdev->release = &video_device_release;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1742  	vdev->minor = -1;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1743  	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1744  	vdev->vfl_dir = VFL_DIR_RX;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1745  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1746  	mutex_init(&dev->lock);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1747  	spin_lock_init(&dev->frame_lock);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1748  	spin_lock_init(&dev->status_lock);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1749  	INIT_LIST_HEAD(&dev->capture_list);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1750  	INIT_LIST_HEAD(&dev->output_list);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1751  	dev->status = SWCAM_STATUS_IDLE;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1752  	init_waitqueue_head(&dev->status_waitq);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1753  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1754  	dev->vdev->v4l2_dev = &dev->v4l2_dev;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1755  	dev->vdev->queue = &dev->capture_queue;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1756  	dev->vdev->lock = &dev->lock;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1757  	dev->capture.capability = 0;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1758  	dev->capture.capturemode = 0;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1759  	dev->capture.extendedmode = 0;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1760  	dev->capture.readbuffers = SWCAM_MIN_FRAMES;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1761  	dev->capture.timeperframe.numerator = 1;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1762  	dev->capture.timeperframe.denominator = 30;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1763  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1764  	if (!IS_ENABLED(CONFIG_DMA_SHARED_BUFFER) ||
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1765  	    !vb2_vmalloc_memops.attach_dmabuf) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1766  		ret = -EOPNOTSUPP;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1767  		goto err_unregister;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1768  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1769  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1770  	pix_formats = kcalloc(config->nr_modes, sizeof(*pix_formats), GFP_KERNEL);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1771  	if (!pix_formats) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1772  		ret = -ENOMEM;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1773  		goto err_unregister;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1774  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1775  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1776  	frame_rates = kcalloc(config->nr_modes, sizeof(*frame_rates), GFP_KERNEL);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1777  	if (!frame_rates) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1778  		ret = -ENOMEM;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1779  		goto err_pix_formats;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1780  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1781  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1782  	if (copy_from_user(pix_formats, u64_to_user_ptr(config->pix_formats),
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1783  			   config->nr_modes * sizeof(*pix_formats))) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1784  		ret = -EFAULT;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1785  		goto err_frame_rates;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1786  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1787  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1788  	if (copy_from_user(frame_rates, u64_to_user_ptr(config->frame_rates),
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1789  			   config->nr_modes * sizeof(*frame_rates))) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1790  		ret = -EFAULT;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1791  		goto err_frame_rates;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1792  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1793  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1794  	modes = kcalloc(config->nr_modes, sizeof(*modes), GFP_KERNEL);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1795  	if (!modes) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1796  		ret = -ENOMEM;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1797  		goto err_frame_rates;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1798  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1799  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1800  	for (i = 0; i < config->nr_modes; i++) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1801  		struct swcam_mode *mode = &modes[i];
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1802  		struct v4l2_pix_format *pix = &pix_formats[i];
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1803  		u32 frame_rate = frame_rates[i];
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1804  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1805  		if (!pix->width || !pix->height || !pix->pixelformat) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1806  			ret = -EINVAL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1807  			goto err_modes;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1808  		}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1809  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1810  		if (frame_rate && !swcam_frame_rate_valid(frame_rate)) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1811  			ret = -EINVAL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1812  			goto err_modes;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1813  		}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1814  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1815  		fmt = (struct v4l2_format){
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1816  			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1817  			.fmt.pix = { .width = pix->width,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1818  				     .height = pix->height,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1819  				     .pixelformat = pix->pixelformat,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1820  				     .bytesperline = pix->bytesperline,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1821  				     .colorspace = pix->colorspace,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1822  				     .xfer_func = pix->xfer_func,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1823  				     .ycbcr_enc = pix->ycbcr_enc,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1824  				     .quantization = pix->quantization,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1825  				     .field = V4L2_FIELD_NONE }
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1826  		};
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1827  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1828  		try_fmt = fmt;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1829  		ret = swcam_set_format(&try_fmt);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1830  		if (ret)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1831  			goto err_modes;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1832  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1833  		if (try_fmt.fmt.pix.width != pix->width ||
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1834  		    try_fmt.fmt.pix.height != pix->height ||
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1835  		    try_fmt.fmt.pix.pixelformat != pix->pixelformat ||
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1836  		    (pix->bytesperline &&
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1837  		     try_fmt.fmt.pix.bytesperline != pix->bytesperline)) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1838  			ret = -EINVAL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1839  			goto err_modes;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1840  		}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1841  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1842  		mode->width = try_fmt.fmt.pix.width;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1843  		mode->height = try_fmt.fmt.pix.height;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1844  		mode->pixelformat = try_fmt.fmt.pix.pixelformat;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1845  		mode->stride = try_fmt.fmt.pix.bytesperline;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1846  		mode->colorspace = try_fmt.fmt.pix.colorspace;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1847  		mode->xfer_func = try_fmt.fmt.pix.xfer_func;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1848  		mode->ycbcr_enc = try_fmt.fmt.pix.ycbcr_enc;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1849  		mode->quantization = try_fmt.fmt.pix.quantization;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1850  		if (!frame_rate)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1851  			frame_rate = dev->capture.timeperframe.denominator;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1852  		mode->frame_rate = clamp_t(u32, frame_rate, SWCAM_FPS_MIN,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1853  					   SWCAM_FPS_MAX);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1854  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1855  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1856  	first_mode = modes[config->first_mode];
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1857  	sort(modes, config->nr_modes, sizeof(*modes), swcam_mode_cmp, NULL);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1858  	for (i = 0; i < config->nr_modes; i++) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1859  		if (i && swcam_mode_equal(&modes[i - 1], &modes[i])) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1860  			ret = -EINVAL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1861  			goto err_modes;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1862  		}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1863  		if (swcam_mode_equal(&modes[i], &first_mode))
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1864  			first_mode_sorted = i;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1865  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1866  	if (first_mode_sorted == config->nr_modes) {
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1867  		ret = -EINVAL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1868  		goto err_modes;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1869  	}
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1870  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1871  	dev->modes = modes;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1872  	dev->nr_modes = config->nr_modes;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1873  	dev->nr_frames = config->nr_frames;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1874  	modes = NULL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23 @1875  	kfree(frame_rates);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23 @1876  	kfree(pix_formats);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1877  	dev->pix_format = (struct v4l2_pix_format){
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1878  		.width = dev->modes[first_mode_sorted].width,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1879  		.height = dev->modes[first_mode_sorted].height,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1880  		.pixelformat = dev->modes[first_mode_sorted].pixelformat,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1881  		.bytesperline = dev->modes[first_mode_sorted].stride,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1882  		.field = V4L2_FIELD_NONE,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1883  	};
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1884  	dev->capture.timeperframe.numerator = 1;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1885  	dev->capture.timeperframe.denominator =
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1886  		dev->modes[first_mode_sorted].frame_rate;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1887  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1888  	fmt = (struct v4l2_format){
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1889  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1890  		.fmt.pix = dev->pix_format,
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1891  	};
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1892  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1893  	ret = swcam_set_format(&fmt);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1894  	if (ret)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1895  		goto err_unregister;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1896  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1897  	dev->pix_format = fmt.fmt.pix;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1898  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1899  	queue = &dev->capture_queue;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1900  	queue->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1901  	queue->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1902  	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1903  	queue->drv_priv = dev;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1904  	queue->buf_struct_size = sizeof(struct swcam_buf);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1905  	queue->ops = &swcam_vb2_ops;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1906  	queue->mem_ops = &vb2_vmalloc_memops;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1907  	queue->lock = &dev->lock;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1908  	queue->dev = &dev->vdev->dev;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1909  	ret = vb2_queue_init(queue);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1910  	if (ret)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1911  		goto err_unregister;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1912  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1913  	queue = &dev->output_queue;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1914  	queue->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1915  	queue->io_modes = VB2_DMABUF;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1916  	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1917  	queue->drv_priv = dev;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1918  	queue->buf_struct_size = sizeof(struct swcam_buf);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1919  	queue->ops = &swcam_vb2_ops;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1920  	queue->mem_ops = &vb2_vmalloc_memops;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1921  	queue->lock = &dev->lock;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1922  	queue->dev = &dev->vdev->dev;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1923  	ret = vb2_queue_init(queue);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1924  	if (ret)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1925  		goto err_capture_queue;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1926  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1927  	ret = __swcam_ioc_alloc(dev, config->nr_frames, file->private_data);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1928  	if (ret)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1929  		goto err_output_queue;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1930  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1931  	ret = video_register_device(dev->vdev, VFL_TYPE_VIDEO, -1);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1932  	if (ret < 0)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1933  		goto err_output_queue;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1934  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1935  	config->device_nr = dev->vdev->num;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1936  	return 0;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1937  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1938  err_output_queue:
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1939  	vb2_queue_release(&dev->output_queue);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1940  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1941  err_capture_queue:
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1942  	vb2_queue_release(&dev->capture_queue);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1943  
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1944  err_unregister:
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1945  	if (dev->vdev)
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1946  		video_device_release(dev->vdev);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1947  	v4l2_device_unregister(&dev->v4l2_dev);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1948  err_modes:
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1949  	kfree(dev->modes);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1950  	dev->modes = NULL;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1951  	dev->nr_modes = 0;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1952  	kfree(modes);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1953  err_frame_rates:
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23 @1954  	kfree(frame_rates);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1955  err_pix_formats:
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23 @1956  	kfree(pix_formats);
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1957  	return ret;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1958  }
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1959  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
