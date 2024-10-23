Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381913DB9F
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 07:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669098; cv=none; b=W1MjgFEcJe/jyn6BSEbkdv+ugE4lrd7eKX+1nfC4JBX9v5fwFJyhh2c4h2+fInfL0/U5CWdmlwDOmi7+3/dAYaSS2bQJimLD8TW3ATA6G/mXWAbP3/iyIuZr9JDzG6Omr5enddRHhpDby9jJmFxn4VRz+mIZ5+5tvPFhJ/bh29w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669098; c=relaxed/simple;
	bh=nXPzMclz3nXaozUblDi+1q2LpZPAFo82Yk8wKHOx4RA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TYHgnVCSmriuT50XuA8BB4s103awq/8cp370/tG6+rUDzlGJWn4gAIByBkMkFtOp9rWTG3n3Ip+NsUwPwZE9vvKZfDOY3tZCvj3EEyU9uuHI9hA685sZNZiJQiynb7wrCYvx/eVQCf0k/+/Mjr+swGqM+KsnzzXna85n6E1xOvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQ+AmG20; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQ+AmG20"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so5810429f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 23 Oct 2024 00:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729669095; x=1730273895; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Izd4rZebQ7y8hQL9rGqqYb2xqbH/AuKR6LjqM8RIkOU=;
        b=tQ+AmG20mVV5t0sttU8B9rYuExmus+amRjiE2M5nAFuaqVEbyFaSr890rAoupta9+J
         zyXoX1gh29MNRKEixsh9688Tcqg++B0xVG1QtjloRwzoehvv4rH5kUPB4WCLWip4gVyM
         k4jTeH+ObHc49a8qB9RqdR8XCY70EGxarUnT5O3PoT+KpE+4jjWheMF3I4QnDcmExQiW
         fyl8H0LnEl+NpCR4vePT0e3hljfU4XosrwFcMJUVr7RYG/huq7a144Gmk2a4zoh0/IU8
         HTwxiYiFfAtCQilpKDt/MJMw1bkLjKoC6L/QphTkk6bUCxW4cyTyUbJ6PzcKw/8EQCSl
         DO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729669095; x=1730273895;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Izd4rZebQ7y8hQL9rGqqYb2xqbH/AuKR6LjqM8RIkOU=;
        b=CwHGuglSScpBELoBUxKgCPIOB6ORX6Ngf0qEYrLz7ADZqnyCOBNBt4caMZgSYWFvpK
         w0gdR0jVT6bQbTejtwQjZ6oUcmdhqCBeURTaCfKM8Jd/s2pnYPXxDyLi/g+cn+9hnzXo
         FkirmS4//n+fdtiYB7oovTXijVg7n4xPfMBobRusUTw8FnLjfnZ3KCWqNPW89paSjjL0
         lWWzTzqv/eXmU2dIgMLKaqfygHf1sn2ZYM8+LmUyeaHBEanDc29gH1WPA8wdzenNkDr1
         klylWlt54gBXQ23gDYL6GaNq6asLdBHQmtAIWRvWwt6Y05QnY0fLe6YvRVv/Z/fC7XlO
         oxwA==
X-Gm-Message-State: AOJu0YwVC/FrUPnar0rnHbe23iLGh7jucvjIlxW09eBTrPW8ShYUzUsS
	v90EwjwJSZVNQ2e28rsmeBoNC3y7UHUQuH1WvMpafS5DIBBc1WWuVelUBvq90dv3/RiAD7PoNmD
	WfK8=
X-Google-Smtp-Source: AGHT+IGVfOx2MFMafq++3ld4fk//SAc9KA8h9Cp96SGBaQB1n47UMGfxDyD9GlwfkRyJYxaS8onAXQ==
X-Received: by 2002:adf:f7c2:0:b0:37d:5318:bf0a with SMTP id ffacd0b85a97d-37efcee59ffmr1250154f8f.1.1729669094492;
        Wed, 23 Oct 2024 00:38:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b943fasm8288253f8f.69.2024.10.23.00.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 00:38:13 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:38:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lu Baolu <baolu.lu@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Subject: drivers/gpu/drm/tegra/drm.c:1155 host1x_drm_probe() warn:
 'tegra->domain' is an error pointer or valid
Message-ID: <0671f92b-915d-4089-acbc-81249f3423fe@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: 45c690aea8ee5b7d012cd593bd288540a4bfdbf0 drm/tegra: Use iommu_paging_domain_alloc()
config: arc-randconfig-r073-20241023 (https://download.01.org/0day-ci/archive/20241023/202410231515.U2XBsu6b-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410231515.U2XBsu6b-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tegra/drm.c:1155 host1x_drm_probe() warn: 'tegra->domain' is an error pointer or valid

vim +1155 drivers/gpu/drm/tegra/drm.c

2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1136  static int host1x_drm_probe(struct host1x_device *dev)
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1137  {
45c690aea8ee5b drivers/gpu/drm/tegra/drm.c  Lu Baolu          2024-09-02  1138  	struct device *dma_dev = dev->dev.parent;
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1139  	struct tegra_drm *tegra;
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1140  	struct drm_device *drm;
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1141  	int err;
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1142  
70a59dd82959f8 drivers/gpu/drm/tegra/drm.c  Daniel Vetter     2020-11-04  1143  	drm = drm_dev_alloc(&tegra_drm_driver, &dev->dev);
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1144  	if (IS_ERR(drm))
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1145  		return PTR_ERR(drm);
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1146  
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1147  	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1148  	if (!tegra) {
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1149  		err = -ENOMEM;
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1150  		goto put;
2d9384ff91770a drivers/gpu/drm/tegra/drm.c  Thierry Reding    2020-02-04  1151  	}
fa6661b7aa0b52 drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1152  
45c690aea8ee5b drivers/gpu/drm/tegra/drm.c  Lu Baolu          2024-09-02  1153  	if (host1x_drm_wants_iommu(dev) && device_iommu_mapped(dma_dev)) {
45c690aea8ee5b drivers/gpu/drm/tegra/drm.c  Lu Baolu          2024-09-02  1154  		tegra->domain = iommu_paging_domain_alloc(dma_dev);
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28 @1155  		if (!tegra->domain) {

I already sent a patch for this a month back:
https://lore.kernel.org/all/ba31cf3a-af3d-4ff1-87a8-f05aaf8c780b@stanley.mountain/

a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1156  			err = -ENOMEM;
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1157  			goto free;
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1158  		}
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1159  
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1160  		err = iova_cache_get();
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1161  		if (err < 0)
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1162  			goto domain;
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1163  	}
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1164  
a7303f7735717c drivers/gpu/drm/tegra/drm.c  Thierry Reding    2019-10-28  1165  	mutex_init(&tegra->clients_lock);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

