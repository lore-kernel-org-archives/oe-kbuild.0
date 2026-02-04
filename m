Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476A3D522B
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200733; cv=none; b=LO9e2Hlpr61EUI0PnRfOzxBULRNaLLDaGM9tSEQKOBNZBSz/rKx0wMSmcQnV3Gp1o2l8hOOx2yM0KKxSj1QCTBzBv2r3DF2y8r6fPetzeGsbut1RoPPkWSFZwQr5NUmb1jxXMDHYL9lSWAmPERTAHzQ2lHivUaHUBid7/o5foFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200733; c=relaxed/simple;
	bh=N4M8hqg9OqWFgVss8E/CoKnXGuO4lMxUozWFy04r9Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vC5ESaFQuGkB1JJz/DbCCUQqkIEbtWDIMq09n2uZXE/49ZWC34a6/HYKLrCDmkMpMo8yEH+qsc1b8XCsYGbYKk+7rJBPA9QnP1r8M3kht0JubFWkYIhJ1VrOu9OBV4HrA49epBTQKCKJNSU1+qe23nQFK/8HlEy5+Qg5Q4VrkC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQ0i0zXj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQ0i0zXj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so5639806f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Feb 2026 02:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770200731; x=1770805531; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XmJYm5ByN8BcQLUPY53VS+5oHFqm+miXhLBsXTLeQ08=;
        b=DQ0i0zXjs8roKoPVnfmBjfz2IwuuxSKje+SxTF7YOFsXyPthe1ccNBgYRi6Wt+Zpmw
         SKRkz0EUe1KF8Hv5wv3vzMAc58zKkG4+A25Sh/wtyM1h8Qqa7gUDOxJaULU8dayvORIL
         gO8D6GGZ5Va8NyUUc7+vaJREUa1wllv8508rhlew0cOi0KJqo5XbqKEG+4NqxY2VDiyq
         f0JAFEMlHFhtlZkH1NnM5Ihor0Ol27j19UNalDMWxftnP+fyRiAnDUnINKQfWU77S56J
         GVO1RHhMsZyrHfEuhFJlzB1LXF7ZFDn11aZBR2hagKQ6yreNSI0BVFfT5QL3iP6c1Z5y
         CBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200731; x=1770805531;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmJYm5ByN8BcQLUPY53VS+5oHFqm+miXhLBsXTLeQ08=;
        b=vyqts2wmq+0VEcgw4BemEtT0FRWVDJaMu5MNCYN2vdD/NPs5PGkvzCRJ/6zWEP7Exp
         qQugqrVMRel8+DAr1EcnpblaDfS7F7WG6v4xXpLnUrlseciFZC5haejc52EpO6AiyfAM
         iPWNPcwyke8y0TsCzQfNuxhRVX1sBIJHz4JeE9izaamAI6fafiU9NhwoG3Y/rMGevkzq
         F1Rjunbj6INrF5N9epIskeuVhgs0PGT66ulpntcmeI7oMB5LRatAxpY8SRxAzOYkBYHd
         9d/q3nqsc5YwlPCdTpbPg+5DHxeYqh//Opxd3vM6sLbjtKCc6HfT6CeXS/yoNhMqMgcV
         FfnQ==
X-Gm-Message-State: AOJu0Yzt7AANROoslxyDXpzXG5bP8QCJ5v/iDORZ6IVibH4caj91yQL7
	pOUBPD7oemC4Ql2y2m1QcB/BDbi8O/0NUkRJincFhT+0oCj7JxBryF4XGvmvNFGuPlQ+hQqaBZh
	ckvTgYrE=
X-Gm-Gg: AZuq6aLR2JH0wamnZ7Dt6I56QpygDPg5TCl/tdsSnhz8Swl3l2aDWsg6ZOaWR9Cde5R
	S+W8Lihp5JOmiif69YGWE2KVjGpFHABRwS283wwoTV3qCfkLuHk/xB1z68zKNGkg7PMxKIE7BlM
	NibndU5oVHE5NNgg7eC8GaX1vK2xZmSpJbfKpTTdLpIut6CGKIK8rbf8Q5sH3/axYwAhAGwvIwp
	PL8XulK4JqpVwrqNzC2mMYlr4l2asaLr7hXj32Mo2xwxx185umgDFh+nU+8lA9ouy+FGni/1VRw
	q6MeR8ZwHbWDY/jU/8wHjREqU9u9Qz7cd5zdWGcfIwubQ49xeZhsZCj6uDJZ/s/LbT2zU5UZW0/
	/VGEC5jCwZ7QbvvFgOaXrYe9kwYxTF45Z9NBMfhKDGLNzbBwurqf/VEJtLj2HKmTgfq5hLyWcEH
	nJ2GfDKV1lZM0YuP22
X-Received: by 2002:a05:6000:4027:b0:435:94c1:3714 with SMTP id ffacd0b85a97d-43617cce061mr3296861f8f.0.1770200730612;
        Wed, 04 Feb 2026 02:25:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e387b9sm5607952f8f.12.2026.02.04.02.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:25:30 -0800 (PST)
Date: Wed, 4 Feb 2026 13:25:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] drivers/media/swcam.c:1954
 swcam_ioc_create() error: double free of 'frame_rates' (line 1875)
Message-ID: <202602041717.HUkAFTTl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260204102526.00iq47TW4HGqC_fOaCX0maIgzZllo6ncbq8r2WyGFl4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   2ad939d7a72b6d8166199e95dcffe000d3a6401e
commit: 2ad939d7a72b6d8166199e95dcffe000d3a6401e [5/5] media: Software-defined camera driver
config: sparc-randconfig-r072-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041717.HUkAFTTl-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602041717.HUkAFTTl-lkp@intel.com/

smatch warnings:
drivers/media/swcam.c:1954 swcam_ioc_create() error: double free of 'frame_rates' (line 1875)
drivers/media/swcam.c:1956 swcam_ioc_create() error: double free of 'pix_formats' (line 1876)

vim +/frame_rates +1954 drivers/media/swcam.c

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

Freed here

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

And again on the error handling paths

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

Here.

2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1957  	return ret;
2ad939d7a72b6d Jarkko Sakkinen 2026-01-23  1958  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

