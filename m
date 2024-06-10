Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46806F2E1
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718018106; cv=none; b=tGkeCX2e4kGXm9Gx6AqP4dy1CYdNZZ7SCn4tjMfGqmQyJQVXwqdJClGI8NWR5hwmYr2E8sL+rIJfd754Q8PSnkG48bYQrPkZQjGwApdU72rCxaja/Al9oQCYNNak8YEQ4MY8UlI1htjlzhbs6AYnyWmKV9YxhyonVJH3e/Bn97c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718018106; c=relaxed/simple;
	bh=rJXR6HC757rGtjbAupTdUJjwnS6riF76ucEDrpzm/eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ais+OagJfkXi/cvwJ+cJXc1SzG+Q6+xv30KcSxoIEMr0NCoTXqYbGO3/K2HRnf6S7dpFioScE8utc0HmJAFX3DcwlGBoNNORoJvvzZMc7htFxIPrUUuqwa6YNkbDJFUHEkunN+/j6XFk5yRpDBrDLaiP7UgJQdYlRJKKhhzjJuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uXZ5Lt/Q; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uXZ5Lt/Q"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4217136a74dso20894025e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 04:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718018102; x=1718622902; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXxPNnEmpx9qjXLrV3pPIdByt/cbJUkvJm//N19Z+ho=;
        b=uXZ5Lt/QCImhg86bbiqPbEk17cJWDT1KT17vxZ0nq0JzjsqQGcjV09A3T6f2EwcodI
         Oyko2llDYLzyp5l7iclAkogCBTJiZ7iEmHEi3TIz6zMExF4r8CZNFQEK/6kz5RyOukd+
         P9aMneVKZVx7milpKQXTf+YSl4QzzZfuBP+Z19fuMJnZ0Vz/fRpTDTpqwYAp2iQRHsUo
         y3ulEt2fjCw62Rv/6Z10S9ERT8iRR5iijfie00lV6Q0O5g14NWpquLqio46+t8CmfLPx
         pffb0k+6XhWGo5Hx473T51KsfZ/WYP6sXtZJkcHvFcG202QSlr8ZjK3NgLw20/WtRAce
         uhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718018102; x=1718622902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXxPNnEmpx9qjXLrV3pPIdByt/cbJUkvJm//N19Z+ho=;
        b=I7nlByRw+fPqL7lKNxxDWiU/mWEwWRQPQLrTsnZUB17JpwAtTG/TJ+r6g8zfHGJiwZ
         9nxsYlif55jP1NgLhFlAs8PY3/CSnBzdBtXRtPS3yvU2me2EORTqmdjV+1lgHfw9E8T0
         ddZ5hUHRlMLawKvhcd8ElPPmJ36jXU67RhK+A+Lf67sW97THz3/S5d2Y6OUQv4pJVajE
         nHT2AJSRersjO3Y55Vu3JEwBBTg9G30UTWqd9enlja5Ka6Zi8TtfyhlbNBMxpwNORmK7
         JrBU2Wz1YUc+kPQXHS4AghH0S2O9fmlddh0TwD37sOme7zOL1ElgMIxWLVCyNVqTuSPk
         1pJA==
X-Gm-Message-State: AOJu0YzjPIXAvB3RsN/6fkT4Zv0lIp51g8M8gA1/AOdRK4mFsD2gB+q3
	xMi7SQ6ViIhD9scmuL51cd9yrqtPBR5t6WuPVV9JKgp18fmAfH4/yMv9/UU/6MWj3+q5H3g8G1p
	C
X-Google-Smtp-Source: AGHT+IGL8ruqwKEMco+7n+EybdLMRlGTt33KxYlGoe2p5in03WXN0lGXcbdwn816AFaQstJXLTUZYw==
X-Received: by 2002:a05:6000:1942:b0:355:21f:be29 with SMTP id ffacd0b85a97d-35efed285e9mr6175834f8f.9.1718018102411;
        Mon, 10 Jun 2024 04:15:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f271ead7bsm1437705f8f.20.2024.06.10.04.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 04:15:02 -0700 (PDT)
Date: Mon, 10 Jun 2024 14:14:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jmondi:imx8mp/media-state/extensible-format 6/8]
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:467 rkisp1_isp_start()
 error: uninitialized symbol 'ret'.
Message-ID: <97ab9086-eb7a-48c4-a63e-0286532b4d01@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git imx8mp/media-state/extensible-format
head:   091749220cf4a01bcfc64c9125ab07d632d578fe
commit: 84e966f8b939937d8998c5866a1b63c7b420e504 [6/8] media: rkisp1: Propagate pre/post-config errors
config: sparc64-randconfig-r071-20240609 (https://download.01.org/0day-ci/archive/20240610/202406101851.Bxtiu89R-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406101851.Bxtiu89R-lkp@intel.com/

smatch warnings:
drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:467 rkisp1_isp_start() error: uninitialized symbol 'ret'.

vim +/ret +467 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c

fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  435  static int rkisp1_isp_start(struct rkisp1_isp *isp,
91eef099f88e17 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-05-09  436  			    const struct v4l2_subdev_state *sd_state,
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  437  			    struct media_pad *source)
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  438  {
bba100df1730f6 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2022-06-14  439  	struct rkisp1_device *rkisp1 = isp->rkisp1;
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  440  	const struct v4l2_mbus_framefmt *src_fmt;
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  441  	const struct rkisp1_mbus_info *src_info;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  442  	u32 val;
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  443  	int ret;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  444  
bba100df1730f6 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2022-06-14  445  	rkisp1_config_clk(isp);
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  446  
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  447  	if (rkisp1->info->isp_ver == RKISP1_V_IMX8MP) {
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  448  		ret = rkisp1_gasket_enable(rkisp1, source);
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  449  		if (ret)
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  450  			return ret;
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  451  	}
fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  452  
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  453  	/* Activate ISP */
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  454  	val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_CTRL);
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  455  	val |= RKISP1_CIF_ISP_CTRL_ISP_CFG_UPD |
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  456  	       RKISP1_CIF_ISP_CTRL_ISP_ENABLE |
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  457  	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
0ef7dc305bd44d drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2022-03-03  458  	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
4b07e2b8f7b53e drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2022-08-17  459  
bc0e8d91feec72 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Sakari Ailus     2023-10-13  460  	src_fmt = v4l2_subdev_state_get_format(sd_state,
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  461  					       RKISP1_ISP_PAD_SOURCE_VIDEO);
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  462  	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  463  
2cce0a369dbdb5 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2023-01-26  464  	if (src_info->pixel_enc != V4L2_PIXEL_ENC_BAYER)
84e966f8b93993 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Jacopo Mondi     2024-05-30  465  		ret = rkisp1_params_post_configure(&rkisp1->params);

ret not initalized on else path.

fdac4ce9f4fd21 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Laurent Pinchart 2024-02-16  466  
84e966f8b93993 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c Jacopo Mondi     2024-05-30 @467  	return ret;
d65dd85281fbf7 drivers/staging/media/rkisp1/rkisp1-isp.c           Helen Koike      2020-01-08  468  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

