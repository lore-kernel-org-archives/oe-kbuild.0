Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8AA407CF4
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593752; cv=none; b=mybPpqs9mW3iGT68PRCB4hND6vQiD+Y6/piKZHCsCgRYAu1j/876BQHb1SA/ezkOd7Md57/TfuwDnIk+49XWBe1hWvRtEA/eDcZhcBqxnlk3lZq0F3eUOwZd6buHgt3r0L/3K4YDZJNDRttIpEhCyvUIJYxZxXForE2JbpkJMLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593752; c=relaxed/simple;
	bh=wRyd2vfRdql4h/Kz7A5B/FCEp6F8EqRGdnY2ZwKx+cY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1rmvoziee8PxJY4hS63wSibjaSOPqCJklUqntoOf97B1X2VKqj+uiVylrUjojOcRrkDIA5RiaHcXo5EHjSf1eh2d6rGXvOFKfGau7xQXOCRRprQ6QY0w9YZVj+MMlF2wh0sa4XCGevfcpG/uovy6TQNbh4BzdPZc1hKmGUnVyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcPX4T+0; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcPX4T+0"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-488b3fd8d0dso770719b6e.1
        for <oe-kbuild@lists.linux.dev>; Thu, 09 Jul 2026 03:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593749; x=1784198549; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqY9tTm6V78GGL+zIVOxCNvg7lHNudn+dnRY3++oib4=;
        b=VcPX4T+0caQjyjrJm/LV2rx3XvIegvThkLMknLHuv+TBxoXzpuq3E26aJt7zvco5QR
         TcIo4ubue++NO6zz0UW6YgXr3XKTXK/3hQBZvulZRv4OEf9HNsx2QQGq+650RHjm1/q4
         P46FRfgObWt3N6ystlSIhdTWU07p87EmKYChBy0E273wUJK0bvKdNXQCOOZmKbVSov+m
         UBz7I7JtT/quTahFeMWNJ8qvb3pRuhzBwiMOiqmRfpUsF3fnoqlAitKXfoo6cqGMeits
         EsWADkkeWLgYwGtzmusCgEA9ptHGHxJXIWVK3R6luNh+WwU0b+z7T3SYLWudTgOxdCxh
         Ie/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593749; x=1784198549;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqY9tTm6V78GGL+zIVOxCNvg7lHNudn+dnRY3++oib4=;
        b=b0vbSqn3tVLzbffDqw+F74STeYiGcIRmkudQ4TV07JUFI6zh0AjcLYEniOIToA2XNS
         LnTLv9zGn+qLqcLnF9UcW45CCbeCR17m/UQPx6DACRIan/LNsAr4W3p1bV8I3BtlEYhl
         xpAP9P0cGqTLg0S48rprof5FpWcI57rVXVX6/KSwbZtqxTFNGVFRUtt9fxmH1uotn4wc
         8Y8uVA9rR1yI1FZeR4RI9Z2NaRcehriREN4zeoIBKI7mP+/rQSeOw+hE+NihSYaZkKkz
         03joe8Eq28W3d1mgeGunyBJs8rlGDbLqKnNPQSveq3U7TfnhNim/GZcdFhGImiiyqzlq
         g9nA==
X-Gm-Message-State: AOJu0YznobQL2WxJ+bXoaBvDade+JyKNmMOKJEe1oJrY7V3PjRs/5/5p
	WXHcyKVR5hNOAbDRT/vdFQsGBsZTKMUVvhwotntWso2VfAzkke3r1kpPeBF30/ZZXFA=
X-Gm-Gg: AfdE7clwwA0aHPKF8R4s2a7euv3Lo+gW4Q9lfUwQFWNAxGqYYay/QSYJ2HJO4/kCwEo
	eRGHl8OAYBh2wWm40elnZ8SeJ6BlxZmsoWK1QyId+DCTYPXFKDJ8/dTDQ2NSOE4E4tSP/GmLbxS
	wcHmcHZjhQlMz8omc5X3hZ5vW8EzBNhdSeQt0ZNz2DbmFziY8IxjmvwMU/3yinnCq5MTcCYOnMB
	8ZKNtsKXQzho7GIkU2lhkkwsoSMyWoOykNJ3itvVxZqDvE2JgTEObRNi1KyLvLj4bCksv7KVWmj
	d3yy9Yjshdu7KRRzIOErIaQL3kQFT+faIQ+bcRNUgYE7lU8td9O8y1jD2uQIm8ruFjhrdVgW8Si
	z+P69JfAOugjj31YLjr2H5KguHE3gkETS6IitgyINfS6P7PNWgjWzIe5kNVXBWO5Oi7vSyIeTD9
	KGO9Ugd4dAeT5rDVk=
X-Received: by 2002:a05:6808:3198:b0:48b:9987:ba17 with SMTP id 5614622812f47-4a204bdf898mr4818811b6e.35.1783593749407;
        Thu, 09 Jul 2026 03:42:29 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f31sm3343228b6e.4.2026.07.09.03.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:42:27 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:42:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn:
 variable dereferenced before check 'pdev' (see line 500)
Message-ID: <202607031755.QZSurBLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260709104221.p81vbMavJUcDXvJPqtKGzYKPW8PkGtPHkbT791UQqXQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
date:   8 months ago
config: arm64-randconfig-r072-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031755.QZSurBLv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 491fadb2b818 ("drm/msm/adreno: Move adreno_gpu_func to catalogue")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031755.QZSurBLv-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)

vim +/pdev +503 drivers/gpu/drm/msm/adreno/a2xx_gpu.c

491fadb2b818e1 Akhil P Oommen 2025-11-18  493  static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
21af872cd8c695 Jonathan Marek 2018-11-21  494  {
21af872cd8c695 Jonathan Marek 2018-11-21  495  	struct a2xx_gpu *a2xx_gpu = NULL;
21af872cd8c695 Jonathan Marek 2018-11-21  496  	struct adreno_gpu *adreno_gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  497  	struct msm_gpu *gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  498  	struct msm_drm_private *priv = dev->dev_private;
21af872cd8c695 Jonathan Marek 2018-11-21  499  	struct platform_device *pdev = priv->gpu_pdev;
491fadb2b818e1 Akhil P Oommen 2025-11-18 @500  	struct adreno_platform_config *config = pdev->dev.platform_data;
                                                                                        ^^^^^^

21af872cd8c695 Jonathan Marek 2018-11-21  501  	int ret;
21af872cd8c695 Jonathan Marek 2018-11-21  502  
21af872cd8c695 Jonathan Marek 2018-11-21 @503  	if (!pdev) {
                                                    ^^^^^^
Hopefully, this code could be deleted.

21af872cd8c695 Jonathan Marek 2018-11-21  504  		dev_err(dev->dev, "no a2xx device\n");
21af872cd8c695 Jonathan Marek 2018-11-21  505  		ret = -ENXIO;
21af872cd8c695 Jonathan Marek 2018-11-21  506  		goto fail;
21af872cd8c695 Jonathan Marek 2018-11-21  507  	}
21af872cd8c695 Jonathan Marek 2018-11-21  508  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

