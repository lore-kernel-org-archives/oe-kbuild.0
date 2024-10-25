Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6161F80DC
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729866884; cv=none; b=Htqa7w2jNAMsOfPR/SFyxLsILX+t/1gXk6UmMoe0VDFWSXoeha3JO/O2aLyXpWnItB/5lDcpKrLVC2ZLK+qTSkeaj84B5ZxJ7UdPEHwG2XEYtqW9zC9gySzUVRd/vBK5mXlaxuDHMiFvCdjk65HCQx3gHn+8Ft07rySE5g71POk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729866884; c=relaxed/simple;
	bh=ryZ2C43R41J0Yc2L+92/UwFPSUdODY1r2Hxgxi1jWBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=GaazSIPpxuzzNTjtDvip+Jhz19EXHF/NnMvHwCvmCF7jX2Sx7llPfjj/+6BGGH82BwEj6axu2mGuBsyupipQJsoTgP6VZi8jJdNJziMRUoJvHhFIpmXr8QlsH1okgCpKi5AJPXo9Lnswb2OQLNwUojSeUpZ/t3mAt0TMmNVKafU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qL/72YAw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qL/72YAw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315eac969aso14736895e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729866880; x=1730471680; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D2Yr8EEmNPRUroD+TTomt6XCtgwDN7DROHjTn3fuIzE=;
        b=qL/72YAwwfrwUvFgW02neDNPzVJRhhFydcuUnROc8hY07T66Q1Kc5+W9jAiOvqzlWV
         TCD47YWJJ2NCd3/Aexu//9JWiRVXCgG6AMLVHYgcFEdeDIRzkZsg6ziXboFMSJxbPjph
         jsq7nVsrFkvbZ7Zx4bHa9V2e9GuN078W4Iu6pK1OkN30RK6KBrgqTCBfgzyqtw/ewD7a
         PV+WwOulwzlZ9WCrHRWFuM8ezaKBJ4DGz8OLAB3ddPCNpiUhpPESjLe7ogQ57Y1Q7lEC
         jjdHU2exh8Ku1DHc1daV78kYEVydgxmlHyjgCtNULGUNJ3Y6ASntZsIKZSSmOQaje7p6
         1eyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729866880; x=1730471680;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2Yr8EEmNPRUroD+TTomt6XCtgwDN7DROHjTn3fuIzE=;
        b=U486FODH77SCsrGQ1fdkBBS76yAHVNyf/xv8KYkYPGLpm9w4IetdfsJvvbAihvaDfs
         wm4mNvK11rkLU9yYel1kxss40cregEdP3cSkWkUtsOWIEw9wgT+aX2IvM+UEKcjCyuld
         KiL8B58i3mV/pLLMxvwIBejT+JWBHY5qINjfGKRM6hkiWp/M9npoPlh+OuHE1P7LBEYp
         6CQOB5PLIQ1h95zYvbDj9lesHdIvwkpsK30HLkcl6fQPhLXSy0Pie9AP4HzZ4a+Dt68S
         kA6NcOcOQVGFV3L4xqeKKIIcR4qcWTluZ8zz+k4r+zlzKFmvAzwnQ9nrZyD5UJSexjzu
         v6og==
X-Gm-Message-State: AOJu0YwuXN7fA4XpAwpe67BvYKJaQqqRztSNt+U26d/EYhKoiTBMiFVy
	uHXlmf17H6iEncNn4+O3MXPru9HJdXyOTMpO1uAIFm48twp+7eP0SNb56BgjCdPqY3NHtGn9Ymu
	UefwrCg==
X-Google-Smtp-Source: AGHT+IHQ51cd+qtz6SSuTLjdY9C0RA4c2ssPpUrMmivHkZkhJ9GaBbiBnAO01CUGDbjejVQB64JqHg==
X-Received: by 2002:a05:600c:3b9e:b0:42f:84ec:3e0 with SMTP id 5b1f17b1804b1-4318b5b301bmr49162895e9.9.1729866879999;
        Fri, 25 Oct 2024 07:34:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56ef06sm49777565e9.30.2024.10.25.07.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:34:39 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:34:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Rouven Czerwinski <r.czerwinski@pengutronix.de>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kernel@pengutronix.de,
	Rouven Czerwinski <r.czerwinski@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/panel: add Fitipower EK79007AD3 panel driver
Message-ID: <47f88a3d-52e5-4645-8a29-880123d58b57@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023124411.1153552-3-r.czerwinski@pengutronix.de>

Hi Rouven,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Rouven-Czerwinski/dt-bindings-display-panel-add-YAML-schema-for-LXD-M9189A/20241023-204826
base:   c2ee9f594da826bea183ed14f2cc029c719bf4da
patch link:    https://lore.kernel.org/r/20241023124411.1153552-3-r.czerwinski%40pengutronix.de
patch subject: [PATCH 3/3] drm/panel: add Fitipower EK79007AD3 panel driver
config: nios2-randconfig-r072-20241025 (https://download.01.org/0day-ci/archive/20241025/202410252201.QglvauIC-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410252201.QglvauIC-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-lxd-m9189a.c:193 ek79007ad3_probe() error: uninitialized symbol 'ret'.

vim +/ret +193 drivers/gpu/drm/panel/panel-lxd-m9189a.c

a69b961abc36b3 Rouven Czerwinski 2024-10-23  181  static int ek79007ad3_probe(struct mipi_dsi_device *dsi)
a69b961abc36b3 Rouven Czerwinski 2024-10-23  182  {
a69b961abc36b3 Rouven Czerwinski 2024-10-23  183  	struct device *dev = &dsi->dev;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  184  	struct ek79007ad3_panel *ctx;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  185  	int ret;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  186  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  187  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  188  	if (!ctx)
a69b961abc36b3 Rouven Czerwinski 2024-10-23  189  		return -ENOMEM;
a69b961abc36b3 Rouven Czerwinski 2024-10-23  190  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  191  	ctx->supply = devm_regulator_get(dev, "vdd");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  192  	if (IS_ERR(ctx->supply))
a69b961abc36b3 Rouven Czerwinski 2024-10-23 @193  		return dev_err_probe(dev, ret, "Failed to get regulator\n");

s/ret/PTR_ERR(ctx->supply)/

a69b961abc36b3 Rouven Czerwinski 2024-10-23  194  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  195  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  196  	if (IS_ERR(ctx->reset_gpio))
a69b961abc36b3 Rouven Czerwinski 2024-10-23  197  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
a69b961abc36b3 Rouven Czerwinski 2024-10-23  198  				     "Failed to get reset-gpios\n");
a69b961abc36b3 Rouven Czerwinski 2024-10-23  199  
a69b961abc36b3 Rouven Czerwinski 2024-10-23  200  	ctx->standby_gpio = devm_gpiod_get(dev, "standby", GPIOD_OUT_LOW);
a69b961abc36b3 Rouven Czerwinski 2024-10-23  201  	if (IS_ERR(ctx->standby_gpio))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

