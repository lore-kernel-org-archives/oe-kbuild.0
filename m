Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD1A17C2
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Sep 2023 06:30:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso57717265e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 23:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694500258; x=1695105058; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIn4Kk7jIwQSG9c/HJ5tAWmDzOcZ4E4d9oYfZniuHQY=;
        b=prUop93NYlNcJKRRb2EiFcWvh1bzsNfhGKruV7yJVW1fesn/+dL1NAt4rk6MpdWoFd
         nWqV/Ip9e7N5ZNB7FugLfCYBHeUZcXK2B4topnOmIsidwQCxBf1l95DjOZ2DLCt9r04J
         E1PYNTwbQAQcBG68nwwZVdMcaL+NxvNNYqT131IVODge173v78feMLmDPARjFj1jDCyi
         TWQnRdXiDhNxM6WKTbPQ+2Ff2KLvSS6g+cYxx91bXofTwrD28RxgiszhAqlEjI+aptmH
         v7+F8l1mea4KltluxXyQK4mmV4ARKXhpNSsqKewNwGN4Htdxjgfy3z5MrSXjePBeIVnb
         jKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694500258; x=1695105058;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIn4Kk7jIwQSG9c/HJ5tAWmDzOcZ4E4d9oYfZniuHQY=;
        b=h+rWML4OoBY/uzXK3qHaPrfdTc4K94R2JV7wA1uTuRZM3+flOZ8dfsAX76cj3fbc3I
         h0KzqtZ1M31vwuc6tmqVUqoRHjkVzoffA+E27Us+o/10Ol9kav4PhTJdpA2+wyqHcU31
         jSWxf+jXSGYBtXrabDTt5fAPXfGm2FuSuxOUkkwhMYI7u/TqdXaIWaHG1LjHikYCesPL
         pDMP14x6uCD0HUII6DYo6JDpvLI+epwc6PwNukc6y78Y6sApeACHqOa0dk6r7bm7inOo
         JJxFSjfPDjhnCAHd1MLEDTJqc8GlDoStvJO3SL8/BCuRxD9CAVi+jE25Kv7dq6UIBgG9
         CkCw==
X-Gm-Message-State: AOJu0YzXBn74ouB/+7Fq7pd9VHnXvW/sFMWpzSQ+hGaO4qAbrRPYHBwr
	38y9eJbjUxg44WuLsp+MXZlM2gGGMwBS/eftvTw=
X-Google-Smtp-Source: AGHT+IHqUEFDSVjWI0pr1H57n4SR2+Zw7yL7UkRBYDe6yujnqynyVa2WqHIF7BHIZdepvXSDL+sJDw==
X-Received: by 2002:adf:ce89:0:b0:31a:d4d0:6e98 with SMTP id r9-20020adfce89000000b0031ad4d06e98mr8895825wrn.8.1694500258109;
        Mon, 11 Sep 2023 23:30:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a5d594c000000b0031ad5470f89sm11838554wri.18.2023.09.11.23.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 23:30:57 -0700 (PDT)
Date: Tue, 12 Sep 2023 09:30:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lyude Paul <lyude@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ben Skeggs <bskeggs@redhat.com>
Subject: [skeggsb-nouveau:00.02-gsp-rm 10/88]
 drivers/gpu/drm/nouveau/dispnv50/disp.c:2565 nv50_display_read_hw_or_state()
 error: uninitialized symbol 'head_idx'.
Message-ID: <d7387068-2163-4316-9ad7-c00747817596@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   89551217290c31848a7662d659ced417db386bc7
commit: c38b1778a9baee914921a6743ba924907b96caa2 [10/88] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230912/202309120801.w9evdkkZ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230912/202309120801.w9evdkkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309120801.w9evdkkZ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/nouveau/dispnv50/disp.c:2565 nv50_display_read_hw_or_state() error: uninitialized symbol 'head_idx'.

vim +/head_idx +2565 drivers/gpu/drm/nouveau/dispnv50/disp.c

c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2524  static inline void
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2525  nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2526  			      struct nouveau_encoder *outp)
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2527  {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2528  	struct drm_crtc *crtc;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2529  	struct drm_connector_list_iter conn_iter;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2530  	struct drm_connector *conn;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2531  	struct nv50_head_atom *armh;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2532  	const u32 encoder_mask = drm_encoder_mask(&outp->base.base);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2533  	bool found_conn = false, found_head = false;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2534  	u8 proto;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2535  	int head_idx;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2536  	int ret;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2537  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2538  	switch (outp->dcb->type) {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2539  	case DCB_OUTPUT_TMDS:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2540  		ret = nvif_outp_inherit_tmds(&outp->outp, &proto);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2541  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2542  	case DCB_OUTPUT_DP:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2543  		ret = nvif_outp_inherit_dp(&outp->outp, &proto);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2544  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2545  	case DCB_OUTPUT_LVDS:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2546  		ret = nvif_outp_inherit_lvds(&outp->outp, &proto);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2547  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2548  	case DCB_OUTPUT_ANALOG:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2549  		ret = nvif_outp_inherit_rgb_crt(&outp->outp, &proto);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2550  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2551  	default:
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2552  		drm_dbg_kms(dev, "Readback for %s not implemented yet, skipping\n",
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2553  			    outp->base.base.name);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2554  		drm_WARN_ON(dev, true);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2555  		return;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2556  	}
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2557  	if (ret >= 0) {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2558  		head_idx = ret;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2559  		ret = 0;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2560  	} else if (ret == -ENODEV) {

Why only -ENODEV?

c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2561  		return;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2562  	}
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2563  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2564  	drm_for_each_crtc(crtc, dev) {
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11 @2565  		if (crtc->index != head_idx)

Uninitialized for other error codes.

c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2566  			continue;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2567  
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2568  		armh = nv50_head_atom(crtc->state);
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2569  		found_head = true;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2570  		break;
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2571  	}
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2572  	if (drm_WARN_ON(dev, !found_head))
c38b1778a9baee9 drivers/gpu/drm/nouveau/dispnv50/disp.c Lyude Paul 2022-11-11  2573  		return;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

