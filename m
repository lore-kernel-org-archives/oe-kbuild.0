Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6883209;
	Mon,  7 Nov 2022 12:42:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id i6-20020a1c3b06000000b003cfa97c05cdso352437wma.4;
        Mon, 07 Nov 2022 04:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJPmXnTsKP02YfcGbKW5ExxRmuwNbbi3qNw0GTjFy4Y=;
        b=B6dySm4zxKC4mMf0+BtZnPKWgmRAkj23/SulHM8Z5NjcSyO5k/0zm6ALd+7ORhL5D/
         mjU9B3veecbKiL3LhkxyFdBmovab4uL5RUUmhcpK1fFHB1BVskXmpj8PskJ6IJf8oZ7u
         1gHO7fZuUKNBBW/V7dNpef7Ui3u4MXXChIEqmv6KWEcphpB80q8U1zpzpnupr9sGKkBg
         T1wJZDGWzbjuhu780zTTYR/1+8qxlgB0ui71h+FlM1fXNK138UPMIywQHv5VGO52F2yS
         V3dwn8yS3rfC6zURZ7Cbj32viLT6G34vVRoOImWniNyFca1+VIpvXlLq2AKKNDqg0VK4
         O+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJPmXnTsKP02YfcGbKW5ExxRmuwNbbi3qNw0GTjFy4Y=;
        b=IxOn9aLq0ot1ZsOhxIrj/TCMXjbaTH+KsdiWrXENW30pQIp9x2QS0p+vEFgTzOoJ6o
         KrVOC4I/H9v+o3PTWL28Ot7ZdQkNk72BQfBrgJO04uKigJ360Z/4X+BPwHKcqcm/kv5G
         wOY51mN1uh0albN2yyFwM+I5y+Js3Xtvn8qXlUa3emPrips9Osy5+sQk0OkkD5H5mHBo
         4dGNNGjy2gbSPaUNaIoeGTY2Q7pscLfZFBcGocm1HRcQ9Crv2n6mTrcHbvVgoRzDDJAu
         7YQPJYYLQqLe0nj6DzLEhYYPqzrp5D0o/vofsNcxZo8PD2blt0CfPGUTjljV4xZlaUFD
         YMUA==
X-Gm-Message-State: ACrzQf0DeAV/ZRLTYhF1nvcqyfmykA3dbwyNyCJYP7Nn4jT9Poc6dpJQ
	i7yRXhd+lv65V22c3C4jjVNg3ryRMHo=
X-Google-Smtp-Source: AMsMyM6SEKgomoAz7QFLatpWhoC6okyPwajT3oWNfgXTh0qr4wgp/TKF0Nnu9BYEHkLC/fpcyZboSw==
X-Received: by 2002:a7b:c303:0:b0:3b4:6e89:e5d5 with SMTP id k3-20020a7bc303000000b003b46e89e5d5mr33498950wmj.111.1667824943617;
        Mon, 07 Nov 2022 04:42:23 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bca55000000b003c6c182bef9sm13481560wml.36.2022.11.07.04.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 04:42:23 -0800 (PST)
Date: Mon, 7 Nov 2022 15:42:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:for-6.2/work 146/184]
 drivers/gpu/drm/tiny/simpledrm.c:729 simpledrm_device_create() error:
 uninitialized symbol 'mem'.
Message-ID: <202211070649.WWsKIQkw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221107124220.Jm-lwxdnwjtROIpa_aSjZoevVGXSlfV9KLWC4hPvVqM@z>

tree:   https://github.com/thierryreding/linux for-6.2/work
head:   5138d79f6489133193083f414f0b4f7b90387996
commit: 2fae30160a1f31fb600c4d8bfebbc05f008f1236 [146/184] drm/simpledrm: Add support for system memory framebuffers
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/tiny/simpledrm.c:729 simpledrm_device_create() error: uninitialized symbol 'mem'.

vim +/mem +729 drivers/gpu/drm/tiny/simpledrm.c

c25b69604fc445 Thomas Zimmermann 2022-08-01  643  static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
c25b69604fc445 Thomas Zimmermann 2022-08-01  644  							struct platform_device *pdev)
11e8f5fd223bd4 Thomas Zimmermann 2021-04-30  645  {
c25b69604fc445 Thomas Zimmermann 2022-08-01  646  	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
c25b69604fc445 Thomas Zimmermann 2022-08-01  647  	struct device_node *of_node = pdev->dev.of_node;
c25b69604fc445 Thomas Zimmermann 2022-08-01  648  	struct simpledrm_device *sdev;
c25b69604fc445 Thomas Zimmermann 2022-08-01  649  	struct drm_device *dev;
c25b69604fc445 Thomas Zimmermann 2022-08-01  650  	int width, height, stride;
c25b69604fc445 Thomas Zimmermann 2022-08-01  651  	const struct drm_format_info *format;
c25b69604fc445 Thomas Zimmermann 2022-08-01  652  	struct resource *res, *mem;
de40c281fe0b6b Thomas Zimmermann 2022-08-01  653  	struct drm_plane *primary_plane;
de40c281fe0b6b Thomas Zimmermann 2022-08-01  654  	struct drm_crtc *crtc;
de40c281fe0b6b Thomas Zimmermann 2022-08-01  655  	struct drm_encoder *encoder;
c25b69604fc445 Thomas Zimmermann 2022-08-01  656  	struct drm_connector *connector;
9239f3e1807c28 Thomas Zimmermann 2021-11-10  657  	unsigned long max_width, max_height;
11e8f5fd223bd4 Thomas Zimmermann 2021-04-30  658  	size_t nformats;
11e8f5fd223bd4 Thomas Zimmermann 2021-04-30  659  	int ret;
11e8f5fd223bd4 Thomas Zimmermann 2021-04-30  660  
c25b69604fc445 Thomas Zimmermann 2022-08-01  661  	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device, dev);
c25b69604fc445 Thomas Zimmermann 2022-08-01  662  	if (IS_ERR(sdev))
c25b69604fc445 Thomas Zimmermann 2022-08-01  663  		return ERR_CAST(sdev);
c25b69604fc445 Thomas Zimmermann 2022-08-01  664  	dev = &sdev->dev;
c25b69604fc445 Thomas Zimmermann 2022-08-01  665  	platform_set_drvdata(pdev, sdev);
c25b69604fc445 Thomas Zimmermann 2022-08-01  666  
c25b69604fc445 Thomas Zimmermann 2022-08-01  667  	/*
c25b69604fc445 Thomas Zimmermann 2022-08-01  668  	 * Hardware settings
c25b69604fc445 Thomas Zimmermann 2022-08-01  669  	 */
c25b69604fc445 Thomas Zimmermann 2022-08-01  670  
c25b69604fc445 Thomas Zimmermann 2022-08-01  671  	ret = simpledrm_device_init_clocks(sdev);
c25b69604fc445 Thomas Zimmermann 2022-08-01  672  	if (ret)
c25b69604fc445 Thomas Zimmermann 2022-08-01  673  		return ERR_PTR(ret);
c25b69604fc445 Thomas Zimmermann 2022-08-01  674  	ret = simpledrm_device_init_regulators(sdev);
c25b69604fc445 Thomas Zimmermann 2022-08-01  675  	if (ret)
c25b69604fc445 Thomas Zimmermann 2022-08-01  676  		return ERR_PTR(ret);
c25b69604fc445 Thomas Zimmermann 2022-08-01  677  
c25b69604fc445 Thomas Zimmermann 2022-08-01  678  	if (pd) {
c25b69604fc445 Thomas Zimmermann 2022-08-01  679  		width = simplefb_get_width_pd(dev, pd);
c25b69604fc445 Thomas Zimmermann 2022-08-01  680  		if (width < 0)
c25b69604fc445 Thomas Zimmermann 2022-08-01  681  			return ERR_PTR(width);
c25b69604fc445 Thomas Zimmermann 2022-08-01  682  		height = simplefb_get_height_pd(dev, pd);
c25b69604fc445 Thomas Zimmermann 2022-08-01  683  		if (height < 0)
c25b69604fc445 Thomas Zimmermann 2022-08-01  684  			return ERR_PTR(height);
c25b69604fc445 Thomas Zimmermann 2022-08-01  685  		stride = simplefb_get_stride_pd(dev, pd);
c25b69604fc445 Thomas Zimmermann 2022-08-01  686  		if (stride < 0)
c25b69604fc445 Thomas Zimmermann 2022-08-01  687  			return ERR_PTR(stride);
c25b69604fc445 Thomas Zimmermann 2022-08-01  688  		format = simplefb_get_format_pd(dev, pd);
c25b69604fc445 Thomas Zimmermann 2022-08-01  689  		if (IS_ERR(format))
c25b69604fc445 Thomas Zimmermann 2022-08-01  690  			return ERR_CAST(format);
c25b69604fc445 Thomas Zimmermann 2022-08-01  691  	} else if (of_node) {
c25b69604fc445 Thomas Zimmermann 2022-08-01  692  		width = simplefb_get_width_of(dev, of_node);
c25b69604fc445 Thomas Zimmermann 2022-08-01  693  		if (width < 0)
c25b69604fc445 Thomas Zimmermann 2022-08-01  694  			return ERR_PTR(width);
c25b69604fc445 Thomas Zimmermann 2022-08-01  695  		height = simplefb_get_height_of(dev, of_node);
c25b69604fc445 Thomas Zimmermann 2022-08-01  696  		if (height < 0)
c25b69604fc445 Thomas Zimmermann 2022-08-01  697  			return ERR_PTR(height);
c25b69604fc445 Thomas Zimmermann 2022-08-01  698  		stride = simplefb_get_stride_of(dev, of_node);
c25b69604fc445 Thomas Zimmermann 2022-08-01  699  		if (stride < 0)
c25b69604fc445 Thomas Zimmermann 2022-08-01  700  			return ERR_PTR(stride);
c25b69604fc445 Thomas Zimmermann 2022-08-01  701  		format = simplefb_get_format_of(dev, of_node);
c25b69604fc445 Thomas Zimmermann 2022-08-01  702  		if (IS_ERR(format))
c25b69604fc445 Thomas Zimmermann 2022-08-01  703  			return ERR_CAST(format);
2fae30160a1f31 Thierry Reding    2022-09-05  704  		mem = simplefb_get_memory_of(dev, of_node);
2fae30160a1f31 Thierry Reding    2022-09-05  705  		if (IS_ERR(mem))
2fae30160a1f31 Thierry Reding    2022-09-05  706  			return ERR_CAST(mem);

Not initailized on if (pd) is true.

c25b69604fc445 Thomas Zimmermann 2022-08-01  707  	} else {
c25b69604fc445 Thomas Zimmermann 2022-08-01  708  		drm_err(dev, "no simplefb configuration found\n");
c25b69604fc445 Thomas Zimmermann 2022-08-01  709  		return ERR_PTR(-ENODEV);
c25b69604fc445 Thomas Zimmermann 2022-08-01  710  	}
7bfa5c7b28d66d Thomas Zimmermann 2022-09-22  711  	if (!stride) {
7bfa5c7b28d66d Thomas Zimmermann 2022-09-22  712  		stride = drm_format_info_min_pitch(format, 0, width);
7bfa5c7b28d66d Thomas Zimmermann 2022-09-22  713  		if (drm_WARN_ON(dev, !stride))
7bfa5c7b28d66d Thomas Zimmermann 2022-09-22  714  			return ERR_PTR(-EINVAL);
7bfa5c7b28d66d Thomas Zimmermann 2022-09-22  715  	}
fd9e3169e42b7b Thomas Zimmermann 2022-08-01  716  
c25b69604fc445 Thomas Zimmermann 2022-08-01  717  	sdev->mode = simpledrm_mode(width, height);
c25b69604fc445 Thomas Zimmermann 2022-08-01  718  	sdev->format = format;
c25b69604fc445 Thomas Zimmermann 2022-08-01  719  	sdev->pitch = stride;
c25b69604fc445 Thomas Zimmermann 2022-08-01  720  
c25b69604fc445 Thomas Zimmermann 2022-08-01  721  	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sdev->mode));
c25b69604fc445 Thomas Zimmermann 2022-08-01  722  	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
c25b69604fc445 Thomas Zimmermann 2022-08-01  723  		&format->format, width, height, stride);
c25b69604fc445 Thomas Zimmermann 2022-08-01  724  
c25b69604fc445 Thomas Zimmermann 2022-08-01  725  	/*
c25b69604fc445 Thomas Zimmermann 2022-08-01  726  	 * Memory management
c25b69604fc445 Thomas Zimmermann 2022-08-01  727  	 */
c25b69604fc445 Thomas Zimmermann 2022-08-01  728  
2fae30160a1f31 Thierry Reding    2022-09-05 @729  	if (mem) {

Uninitialized.

2fae30160a1f31 Thierry Reding    2022-09-05  730  		void *screen_base;
2fae30160a1f31 Thierry Reding    2022-09-05  731  
2fae30160a1f31 Thierry Reding    2022-09-05  732  		ret = devm_aperture_acquire_from_firmware(dev, mem->start, resource_size(mem));
2fae30160a1f31 Thierry Reding    2022-09-05  733  		if (ret) {
2fae30160a1f31 Thierry Reding    2022-09-05  734  			drm_err(dev, "could not acquire memory range %pr: %d\n", mem, ret);
2fae30160a1f31 Thierry Reding    2022-09-05  735  			return ERR_PTR(ret);
2fae30160a1f31 Thierry Reding    2022-09-05  736  		}
2fae30160a1f31 Thierry Reding    2022-09-05  737  
2fae30160a1f31 Thierry Reding    2022-09-05  738  		drm_info(dev, "using system memory framebuffer at %pr\n", mem);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

