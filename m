Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9DD31D367
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Mar 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772475356; cv=none; b=W5VtsFiPwIE5cc2vCiPbznt/z96HYA1MW+eYZTQKbK8NXgR48suO0R36SHY5XZGfItGBAw9t6ZoUI8WW6LiddARsPSn1845j+GU4I+PGQfpFxrT9Fn9F45C9sl90Oeoo75SUdXpnt4hSw4bTsb5sd1/PIVnMvv1brbFAQUoyTh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772475356; c=relaxed/simple;
	bh=h8dg6IJwiMzAKy9pUJCmeJ23bAYTBA3lGuwl7oMjj2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4uAYpehW82vSXgIDFyP7vrfft/ag9IhfB2xg/3535H25hLJ1hWTScI5QAZOC6rEVHTCrf34hUa9g4t+r4vhKSoiJHiiUxKYzQSZDvE1Nk3bsprwia9dh7lTyaU9/8wsgDgDhWKyPAmLJKr0XV1T/KEkA8DcLBjBAwTxH105KJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QQfD9aS0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QQfD9aS0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48372efa020so41449405e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 02 Mar 2026 10:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772475352; x=1773080152; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ly3HA8CVT/qmA0QrPKvm+q33/myg29MXsLP+2Ew4xC0=;
        b=QQfD9aS0/HUIKHW++nDxGNRiiwmLE+uc2dq+eElcbwCaaNXFZP/Si1GrTpOzGd6akp
         8ExtAP+CN+xdA3xb6/gIzo0AtQZEbCn5M3Rc0zwVdwDKSqH3WP9DmsmGDnMTPBbMZTN+
         G6N8c3LRf8XoYQx3vtFdRa0B5uBw7H8vx4XqZvcJYvvA21wTsnViOiziP7qVgQNjlZmy
         KpH6XGZKuM7A1M3lIZSkqLrtEEO9kVFNKHsDYCGsSGgmXQhpyiiTI0RX+mdfjSZKtkoY
         hqzvO39zb5rAMtK9ig88gpDhth6rDE8VqeplNz9y6Bg7MLHy6+aPD7ZE2XcTXSMmOxsx
         NZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772475352; x=1773080152;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ly3HA8CVT/qmA0QrPKvm+q33/myg29MXsLP+2Ew4xC0=;
        b=lhkWOQij9GvIgxpUaiVc9UeODfghXdFkssNguc0L4MpeXZnMkddYZiU+IJuMp8tIZ+
         NI7XJjWggV/qKvfaAyZ/qyzJDPqRZUePTqtl2IEQMiSXY+h+dBfulxO0K6+0x9ATs24w
         QAxbBNDjcx9OEay7nellFchj2sSIlz46JQ/SkLAuMNSNNDlb6npkmELu8uarkipLhLle
         pVHDT6KYziwqJ5tJLGSl53Prxccc9lVVbOaE7mezp7dPgBgXSIV407OSNDzLD8R/wSGZ
         CYGQCxB+6teaPlGcXGaNTqtF3AVnC1HvpkATvVyxnnNst3r3srQ/I2Koy6ywkoJcGm3G
         SUXg==
X-Gm-Message-State: AOJu0YxVojtNNluURIQ8UCjcNGkgBAbtfh4TcW1Nap2OS7Q4MemK9F1e
	TtnheoNnQi7RyCw7V/Ie7hlCOurWR2HwDGMtpVXlmrZ4dLSePDQZcTeF1Zdgy0daPuZwVYkrPxQ
	VgO7T
X-Gm-Gg: ATEYQzyeogZeTEtimttpF4vZzrn9Yall2YIa2tuj7J5rqDyxjxQ/QdFc21cG0kKGyiE
	XIlKT14+3HKW8dqBoe+VE2ZSaQBXVna3R6eNYpDqxAFNAtWjggPRAJ+yTwO3/ioG4gP5+TXq4s7
	MicJfVu7Sl2PXMy2nl4ciRrJEYIBEznQjr4CfgbXvBSrcR7OBwiJl1s4UVR25drU7jqABT28kx1
	lCRDCzxLtzvRllPQACFD0AxIIdq7y8T3ysZ3MM/ZWqHaVFNAvKKDcJjAAlLTX/N40pTxJJPAdnY
	FlhNapGkeCfr3nl279pdvUmNzZgHE15DjXjlkXSMK6RgyyTbMmuC3brxynQs4nITlHNC6rECMWl
	4irjaEyPPpatasH0Y9Um2TMmONAuJEopvmLfb4yxmXAaYv9C0PSauv3L1B+hJCTCkpaSOeeZHEJ
	nWP4KlU+O3sBRBrJPQvbaA3GK4FIk=
X-Received: by 2002:a05:600c:3b18:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-483c9bc1f39mr264118075e9.13.1772475352512;
        Mon, 02 Mar 2026 10:15:52 -0800 (PST)
Received: from localhost ([41.210.147.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm686222915e9.0.2026.03.02.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:15:52 -0800 (PST)
Date: Mon, 2 Mar 2026 21:15:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 30/34]
 drivers/iommu/iommufd/pages.c:1486 iopt_map_dmabuf() warn: passing zero to
 'PTR_ERR'
Message-ID: <202603030132.eYdqJKik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260302181547.3sa4NyxHdBY-dIyH6KLOpiqMZRw8Ny_m4Xds3WM2cx8@z>

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   c37cf2824740d833b21eb816e21f94836100291f
commit: f8983286b743407cc7350f9635f6b3157f8bbeb1 [30/34] iommufd: Use the PAL mapping type instead of a vfio function
config: i386-randconfig-141-20260302 (https://download.01.org/0day-ci/archive/20260303/202603030132.eYdqJKik-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603030132.eYdqJKik-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/pages.c:1486 iopt_map_dmabuf() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1486 drivers/iommu/iommufd/pages.c

71db84a092c399 Jason Gunthorpe 2025-11-21  1461  static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
71db84a092c399 Jason Gunthorpe 2025-11-21  1462  			   struct dma_buf *dmabuf)
71db84a092c399 Jason Gunthorpe 2025-11-21  1463  {
f8983286b74340 Jason Gunthorpe 2026-02-09  1464  	struct dma_buf_mapping_match pal_match[] = { DMA_BUF_IMAPPING_PAL() };
71db84a092c399 Jason Gunthorpe 2025-11-21  1465  	struct dma_buf_attachment *attach;
71db84a092c399 Jason Gunthorpe 2025-11-21  1466  	int rc;
71db84a092c399 Jason Gunthorpe 2025-11-21  1467  
f8983286b74340 Jason Gunthorpe 2026-02-09  1468  	attach = dma_buf_mapping_attach(dmabuf, pal_match,
f8983286b74340 Jason Gunthorpe 2026-02-09  1469  					ARRAY_SIZE(pal_match),
f8983286b74340 Jason Gunthorpe 2026-02-09  1470  					&iopt_dmabuf_attach_revoke_ops, pages);
71db84a092c399 Jason Gunthorpe 2025-11-21  1471  	if (IS_ERR(attach))
71db84a092c399 Jason Gunthorpe 2025-11-21  1472  		return PTR_ERR(attach);
71db84a092c399 Jason Gunthorpe 2025-11-21  1473  
71db84a092c399 Jason Gunthorpe 2025-11-21  1474  	dma_resv_lock(dmabuf->resv, NULL);
71db84a092c399 Jason Gunthorpe 2025-11-21  1475  	/*
71db84a092c399 Jason Gunthorpe 2025-11-21  1476  	 * Lock ordering requires the mutex to be taken inside the reservation,
71db84a092c399 Jason Gunthorpe 2025-11-21  1477  	 * make sure lockdep sees this.
71db84a092c399 Jason Gunthorpe 2025-11-21  1478  	 */
71db84a092c399 Jason Gunthorpe 2025-11-21  1479  	if (IS_ENABLED(CONFIG_LOCKDEP)) {
71db84a092c399 Jason Gunthorpe 2025-11-21  1480  		mutex_lock(&pages->mutex);
71db84a092c399 Jason Gunthorpe 2025-11-21  1481  		mutex_unlock(&pages->mutex);
71db84a092c399 Jason Gunthorpe 2025-11-21  1482  	}
71db84a092c399 Jason Gunthorpe 2025-11-21  1483  
8c5f9645c3893f Leon Romanovsky 2026-01-31  1484  	rc = dma_buf_pin(attach);
f8983286b74340 Jason Gunthorpe 2026-02-09  1485  	if (rc) {
f8983286b74340 Jason Gunthorpe 2026-02-09 @1486  		rc = PTR_ERR(pages->dmabuf.exp_phys);

Delete this line.  It's a copy and paste bug.

71db84a092c399 Jason Gunthorpe 2025-11-21  1487  		goto err_detach;
f8983286b74340 Jason Gunthorpe 2026-02-09  1488  	}
71db84a092c399 Jason Gunthorpe 2025-11-21  1489  
f8983286b74340 Jason Gunthorpe 2026-02-09  1490  	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
f8983286b74340 Jason Gunthorpe 2026-02-09  1491  	if (IS_ERR(pages->dmabuf.exp_phys)) {
f8983286b74340 Jason Gunthorpe 2026-02-09  1492  		rc = PTR_ERR(pages->dmabuf.exp_phys);
8c5f9645c3893f Leon Romanovsky 2026-01-31  1493  		goto err_unpin;
f8983286b74340 Jason Gunthorpe 2026-02-09  1494  	}
f8983286b74340 Jason Gunthorpe 2026-02-09  1495  
f8983286b74340 Jason Gunthorpe 2026-02-09  1496  	/* For now only works with single range exporters */
f8983286b74340 Jason Gunthorpe 2026-02-09  1497  	if (pages->dmabuf.exp_phys->length != 1) {
f8983286b74340 Jason Gunthorpe 2026-02-09  1498  		rc = -EINVAL;
f8983286b74340 Jason Gunthorpe 2026-02-09  1499  		goto err_unmap;
f8983286b74340 Jason Gunthorpe 2026-02-09  1500  	}
f8983286b74340 Jason Gunthorpe 2026-02-09  1501  	pages->dmabuf.phys = pages->dmabuf.exp_phys->phys[0];
8c5f9645c3893f Leon Romanovsky 2026-01-31  1502  
71db84a092c399 Jason Gunthorpe 2025-11-21  1503  	dma_resv_unlock(dmabuf->resv);
71db84a092c399 Jason Gunthorpe 2025-11-21  1504  
71db84a092c399 Jason Gunthorpe 2025-11-21  1505  	/* On success iopt_release_pages() will detach and put the dmabuf. */
71db84a092c399 Jason Gunthorpe 2025-11-21  1506  	pages->dmabuf.attach = attach;
71db84a092c399 Jason Gunthorpe 2025-11-21  1507  	return 0;
71db84a092c399 Jason Gunthorpe 2025-11-21  1508  
f8983286b74340 Jason Gunthorpe 2026-02-09  1509  err_unmap:
f8983286b74340 Jason Gunthorpe 2026-02-09  1510  	dma_buf_pal_unmap_phys(attach, pages->dmabuf.exp_phys);
8c5f9645c3893f Leon Romanovsky 2026-01-31  1511  err_unpin:
8c5f9645c3893f Leon Romanovsky 2026-01-31  1512  	dma_buf_unpin(attach);
71db84a092c399 Jason Gunthorpe 2025-11-21  1513  err_detach:
71db84a092c399 Jason Gunthorpe 2025-11-21  1514  	dma_resv_unlock(dmabuf->resv);
71db84a092c399 Jason Gunthorpe 2025-11-21  1515  	dma_buf_detach(dmabuf, attach);
71db84a092c399 Jason Gunthorpe 2025-11-21  1516  	return rc;
71db84a092c399 Jason Gunthorpe 2025-11-21  1517  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

