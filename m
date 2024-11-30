Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539F719F121
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732982071; cv=none; b=IYJSauaiivDnS1ei0PzjTpa9tcac+2aJ4KA5+s3VU9lwTwqAAJIH3X979AZCRYvHwYIWWAb+0sK1uo4eSdw9cTN82pGIgSS3TfPLQ3rehVUpU8nAfga09fS4DFOiSGuFGYFMH7ZV5pcT6+J6q8SsXTo0SBM9c2ienzPZZiMun8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732982071; c=relaxed/simple;
	bh=fPINurpBvzEOEixbYbqSeiiaOJB6aUyizq1CxAy61Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VuwX/yFrc3k9zXimuowICf3mPs93DGhEwI/DYJ8Sa8uSBevicplofJwLQ4wJv1nb53XuUoCdc7OUSLcTXb/NtCWhmLOg9zJ9uWjFeCdIQkyMCYaZc/IOYoSuwb3GEto8nhIDaWXxUZv6wFakLCRZk26BwEVvOPHeeU5ZUfiCrCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vKR+3gyT; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKR+3gyT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d0bd12374cso794876a12.3
        for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 07:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732982067; x=1733586867; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKwWzGZlj30zR5uG3r8pc5O9AbO9pAuOvOctXvF3moE=;
        b=vKR+3gyTI+gbfXd7MOCq9C/XVcbQSdgyM+Vv3MBOT0/nG1uOLgFy9Wt328KL8MzJiJ
         RqVjmnC6fFq/iI6t4UHbOXbhX0seagA5rkwu2OtJs3W8t+Gr8IWVvSTOz1kmoWhHZPK+
         aPGMxvOXR5J9IkF7wcdsPJppMB3u+6W9PzJpncVkF/BKfE3FTM4pxiIUscs9gy6mnDfe
         SrwUhzybP31E+b7EvePUksBLioAVjRYx8xP+RsY/4L27Y4dWZ1bQ6CbEGYL/e0q5S/TS
         ciqz72T9hFKhJhsVqD1t9/LhOexU45CvvNT5OgtwB0NFHWpLzg5BBGODuoOBuNRbP92b
         6BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732982067; x=1733586867;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKwWzGZlj30zR5uG3r8pc5O9AbO9pAuOvOctXvF3moE=;
        b=v80GBZ1A4wSgU0xxGE0Lc6rU7nVsCyKeRhtGO7cMv5uOS471SG0twOQXDb7EntKxN7
         ICBqfXm2o1TTmIlht/Mx2mi9DxAqnq1A1ZN8GMI4stH+5DRtWI+/pGHW9WhZ/rGb0WYH
         KHbOh7ojhJkTDoJOiqYCy2xuL0cP6mu7QAqCXhhs4ED7d1mW0Pv32wS/zPfTTzrDmrGe
         zNcmXBWFyACbbieTrt9/OyN5Y7IOmsmrGU3VmKYZ5kQyVKkZlrZhVeRsI40UbWrav89o
         MCg6z5cR/XS0Z/1lLFBB7oDRZHoF+9zjhOogf13LSSmtUU1HyIrD2VHgXww5Z/58pr21
         f4wA==
X-Gm-Message-State: AOJu0YwJhbye/XqPWZD4t/rM6J3rQID5UrBtrkAbLxXp5WrPDk8fJJEz
	6iYJPbz0b3DfyQNyR3kx3J83+O+nJ++AHOU784rrUb9IhV1C7+hI1TnuLXQZ8XZhe+InS+AdfkY
	W
X-Gm-Gg: ASbGncufe+mtBnwCAu1DkwKGp4RfIXlaUj4AyD/lx6N4esNFjOL0ApLfVEkBklXdfS7
	9U07TQxEYv+khgx4XxjyF/hQ7A82+JnAMhwI6rOMRVw8zLyTJ064hpMNDvkyXjm6kEUVrwV/dGL
	Ig7P+Qcl2AGrwXCtakN4LC+30PagrjAJJ0m72YgrKltYHru0EldDUI1hJ/DSvuGiOYpkLvRI6SB
	6N0nUZCOajk5YLJi4Bn2zlPz1Rpi1HO7Cq6OXUNPYyL3yf3p6mmSB4SIpC9Mc/pmoIVZL7m
X-Google-Smtp-Source: AGHT+IHBkIAuWmfbDNtg/9ztOOmya2ShVS9Hw3bM4eNoJLWIM5eK9WriL+fLJVTbXc07AX+5qZtP9g==
X-Received: by 2002:a05:6402:42c3:b0:5d0:96db:dd97 with SMTP id 4fb4d7f45d1cf-5d096dbe5a8mr13940585a12.10.1732982067548;
        Sat, 30 Nov 2024 07:54:27 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0c6a8e9b0sm1062632a12.41.2024.11.30.07.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:54:27 -0800 (PST)
Date: Sat, 30 Nov 2024 18:54:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Subject: drivers/net/wireless/st/cw1200/cw1200_spi.c:440
 cw1200_spi_disconnect() error: we previously assumed 'self' could be null
 (see line 433)
Message-ID: <72e9e3bb-e96a-445a-8c31-8505f3a4ffaa@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aaf20f870da056752f6386693cc0d8e25421ef35
commit: 2719a9e7156c4b3983b43db467c1ff96801bda99 wifi: cw1200: Convert to GPIO descriptors
config: riscv-randconfig-r073-20241111 (https://download.01.org/0day-ci/archive/20241127/202411271742.Xa7CNVh1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411271742.Xa7CNVh1-lkp@intel.com/

smatch warnings:
drivers/net/wireless/st/cw1200/cw1200_spi.c:440 cw1200_spi_disconnect() error: we previously assumed 'self' could be null (see line 433)

vim +/self +440 drivers/net/wireless/st/cw1200/cw1200_spi.c

a0386bba70934d drivers/net/wireless/st/cw1200/cw1200_spi.c Uwe Kleine-König 2022-01-23  429  static void cw1200_spi_disconnect(struct spi_device *func)
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  430  {
911373cca1b455 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-06-01  431  	struct hwbus_priv *self = spi_get_drvdata(func);
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  432  
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24 @433  	if (self) {

Check for NULL

a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  434  		cw1200_spi_irq_unsubscribe(self);
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  435  		if (self->core) {
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  436  			cw1200_core_release(self->core);
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  437  			self->core = NULL;
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  438  		}
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  439  	}
2719a9e7156c4b drivers/net/wireless/st/cw1200/cw1200_spi.c Linus Walleij    2024-01-31 @440  	cw1200_spi_off(self, dev_get_platdata(&func->dev));
                                                                                                               ^^^^
Unchecked dereference

a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  441  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

