Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA6C1DF964
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496275; cv=none; b=rVMYw5hk0L8uDkRfOUgDv1PFkMVf81zdw2nD3ANvLZd08QyM1zQ+ITHQY9aqnxfSNYMvOZVMLYWNkIEFG+1AQ9HsmriGsVldwcGFTVpOlXIHHRFGMe/NJ5LenucbocCRPV3TNZJQQmRnAUvBkOXZ7HPbxZU/M6+tlXIs7SnwH/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496275; c=relaxed/simple;
	bh=EpX45TDm8D68Jr4bwgVK0N3GqR1Zm3HCSfVxW4xQtrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROiBTDj07iMGSntkPv034hHPq0SFRLjh3k1DFqEEsl/x7D/U7czvxpx26u00nPACOJXW3XpMXhGXQGf0WG0sik4TqgDz0FAh2yEvIOKOUw+g7BFZ5y+mG6W2Sn4IA14kGQTMRDRWg2gxcuK6VlKVDrv6/GDXPi81guj5JuuyuF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BdH1ax1k; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BdH1ax1k"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso40634545e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 00:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729496271; x=1730101071; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCpEtDOd0aXe7byb3DWEVoOlGs1Wogqcx6ypMiIAEFA=;
        b=BdH1ax1ktbugXs+dlbiFD/VoBA4Xgjixt58pX/Rzplgo+IqLZyBHPBMysfjrZFm1md
         vY72noDJ9f0zRNVY+A9qaS7TT/GeUJrIm9voP7gulP0l6eaAxdvdc8ea/D6nmOzzGjSM
         6N8GoGxl65rJWL5CGfEuLB/EEmYlCZwCB8mLi6/drvMWVgLXcnXjl3SSIVnCTKcJ7rOO
         yc9y7iEVbJD3jl6/ofgucK/7KpiXFmjy6zh8GnqFZFpyCON/aixg7JpOg88DiIv6SwV6
         5tsRdfELrzqq0CYL/ODNKEmLjrkdB2kfBZhlpklYh1InS5nXpfOMZBcyl7Z3AABxRbP2
         AVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496271; x=1730101071;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCpEtDOd0aXe7byb3DWEVoOlGs1Wogqcx6ypMiIAEFA=;
        b=oJA99nGNikFovTcHiY8otMNtLEJPcgAgikGhdgTSfJm/YXY1HVrYuFUdUVk1p2IBlm
         +MQwAt1Gd4TjVjHgbjgtj1jXPRTJZ3DZoYNxgomb0PdGtOoPtjorvBGNeeGf2dA8//uV
         HxJlB8w4unfcwhqbUPrlBANY9CvvcjzvY8Bjw4v3y0e8zZFoxx1SGJUyXhBGFtL84KJv
         vr3+SP9fZhmouCuBO00TNuC7C7OYCOUAJj3rndrfELr0i2rOehrF3/CZU79nZL+AbegS
         Tt3QDAIQVOmfkpSRLXiLMiZeIa4mJ9RoVjr4ZHXt06yvU42WUEv9hLzQvEg2qnF+Y6PM
         c0sg==
X-Gm-Message-State: AOJu0YxWUBQ40D4hNmf+E7WKXS1ky90T4XAiVjtaT5s8aaTq8M/I5D+P
	vRKsFYG4yIwI5f34sBSU7HUda/WrQw+nAWfIsMZwtz+r0E1MOcV4kpaj/MmrKhgTadLininkW2Q
	t
X-Google-Smtp-Source: AGHT+IFcbssLrqAkgCdjXy1/JBpQ4J3sMtafCfEGvETmBzf/M5UTMBfjMov+R491QFx5Niaq4JTkdQ==
X-Received: by 2002:a05:600c:3d9b:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-431616ad787mr82412215e9.30.1729496271109;
        Mon, 21 Oct 2024 00:37:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a477d9sm3580589f8f.26.2024.10.21.00.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:37:50 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:37:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [linuxtv-media-stage:fixes 4/14] drivers/media/dvb-core/dvbdev.c:554
 dvb_register_device() error: uninitialized symbol 'ret'.
Message-ID: <67d2d01d-a5ee-45af-983e-b2eea36f0912@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linuxtv.org/media_stage.git fixes
head:   ba9cf6b430433e57bfc8072364e944b7c0eca2a4
commit: 972e63e895abbe8aa1ccbdbb4e6362abda7cd457 [4/14] media: dvbdev: prevent the risk of out of memory access
config: arm-randconfig-r073-20241020 (https://download.01.org/0day-ci/archive/20241020/202410201717.ULWWdJv8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410201717.ULWWdJv8-lkp@intel.com/

smatch warnings:
drivers/media/dvb-core/dvbdev.c:554 dvb_register_device() error: uninitialized symbol 'ret'.

vim +/ret +554 drivers/media/dvb-core/dvbdev.c

972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  533  	if (minor >= MAX_DVB_MINORS) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  534  		if (new_node) {
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  535  			list_del(&new_node->list_head);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  536  			kfree(dvbdevfops);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  537  			kfree(new_node);
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  538  		}
627bb528b086b4 drivers/media/dvb-core/dvbdev.c     Hyunwoo Kim           2022-11-17  539  		list_del(&dvbdev->list_head);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  540  		kfree(dvbdev);
8c64f4cdf4e6cc drivers/media/dvb-core/dvbdev.c     Zhipeng Lu            2024-02-03  541  		*pdvbdev = NULL;
82163edcdfa4eb drivers/media/dvb/dvb-core/dvbdev.c Santosh Nayak         2012-06-23  542  		up_write(&minor_rwsem);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  543  		mutex_unlock(&dvbdev_register_lock);
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  544  		return -EINVAL;
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  545  	}
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  546  #else
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  547  	minor = nums2minor(adap->num, type, id);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  548  	if (minor >= MAX_DVB_MINORS) {
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  549  		dvb_media_device_free(dvbdev);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  550  		list_del(&dvbdev->list_head);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  551  		kfree(dvbdev);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  552  		*pdvbdev = NULL;
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  553  		mutex_unlock(&dvbdev_register_lock);
972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15 @554  		return ret;
                                                                                                        ^^^^^^^^^^^
This should be return -EINVAL;

972e63e895abbe drivers/media/dvb-core/dvbdev.c     Mauro Carvalho Chehab 2024-10-15  555  	}
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  556  #endif
5dd3f3071070f5 drivers/media/dvb/dvb-core/dvbdev.c Andreas Oberritter    2008-10-23  557  	dvbdev->minor = minor;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

