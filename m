Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD7143C5D
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728825038; cv=none; b=hOVmkq/b0QMchI7dxgSj44Gj3L/W548k5HRYBUghGqJapCLMmf9K0EdgG3Be6MgrLOANu7BLcYjNKAzoZx3Ec1CbNU/hFT7O/XZmkjtNPpu7x90wuEa5n5aVa4Fge6MTLLapF9d3VWngymW52mna3umaMlLoOWIEoIV/hEvfDlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728825038; c=relaxed/simple;
	bh=wzcxfYeSJZjtVidkrKG3NCopsw8G1fnQwrUyijVJnic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzwUDkFvtc5sKU5Evbqey85eetionOP0tv9M/X/mLX4pfV6rsmC1o+Fejv1Wh71jZFXvke8kIeEvEWxzwlmYl9VE74MasTdLScw6q6D+C6TNVERTzDwM302MWArgXlSPos3f8bgdUrEaz6DJdrzOWjG5oCfnpRhEzbslnoBGkCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PX3eDBlo; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PX3eDBlo"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a994cd82a3bso502086966b.2
        for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728825034; x=1729429834; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RmhVzZWaYpGgo5jji9BT1Mz/NRT8JqO4PMF3sNeIjU=;
        b=PX3eDBlozKMnVTo2VLtjxipqK76AiLeyuggV0oIRgMsfPxg1YBneODLxtq8IffWdva
         ihG/KIkV5N9NACVLBvLy8d95bGA8Lvw+FLKdJ4cKCgSFc5gmFMrLtNVnP24+Uy+MambU
         9yaubOwDSebToAfS6T2IWv/s5Y4hWYR65FS34F5W1+mJDp2F5AAQDNA3dr9dWOpLM4Xj
         VLHIoEv394IPZD/oFnQ7RQPpN3zXmNlKOvFVZwDBBJYC7hZEx+PUNG+1vnw/b0J4PhQe
         MQManRPM7Wuh/9RARAecSUnieX6gsCMtwfwYCdH14BSuveV8hcSFX2Q1KF+YU4eKKBgk
         hUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728825034; x=1729429834;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RmhVzZWaYpGgo5jji9BT1Mz/NRT8JqO4PMF3sNeIjU=;
        b=mRC8/VUxfVNo+VgtIF+1sgb/i86M5VnLfYYEo8IDSpJBAIQJf3hLmPJmvHnMLNoFIl
         si7YIruQgbHYEnKwi3WoiJU1VzLAvE4QY13xttQkj+8loFJDqX10DU5LJYjHOMmO8pas
         wlmh8gf+ncEUcXzlW2jzx1hJ7c66kiOC4AQXnoNYtfwms1yNzvbZlAoyWXO34dK0scXI
         7TSbHMthmiXyYa+T0h16Pos+KR/D+iSZoSmJ9TDu2EZp0fXXkBxN2IJ97oO5WqhLUmO/
         D5w1UWYaYjSSfwxmqzZW7BuVq+pJepMegbP93WV4WVP7f+HRSsPPyExNCqLFQrf4eJw/
         9KPg==
X-Gm-Message-State: AOJu0YwhwPXXzk5eZQwE9XI69ZvtpQRfonRVyYqTK1UqEEk+6am0TXs/
	ulBBc+bnSWTWKmQKmkwQg4fOa+XuxmjzOWoCMYsnfW6yO+uuWGOWZkcDyDm4/R8yjQrodXqxs31
	j
X-Google-Smtp-Source: AGHT+IERtQg6IrWwPi6EJnDFHtfuz2s3SWelnjet4RDpaSdohjVrKCZ7V7hn4GyBSss6HYvAxTzZcw==
X-Received: by 2002:a17:907:6e89:b0:a9a:a5c:e23b with SMTP id a640c23a62f3a-a9a0a5ce2d0mr88319266b.58.1728825034159;
        Sun, 13 Oct 2024 06:10:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80cb013sm444649666b.131.2024.10.13.06.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 06:10:33 -0700 (PDT)
Date: Sun, 13 Oct 2024 16:10:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Subject: drivers/net/wireless/st/cw1200/cw1200_spi.c:440
 cw1200_spi_disconnect() error: we previously assumed 'self' could be null
 (see line 433)
Message-ID: <72b5769f-c9f3-44c0-812a-0ba0c6e8176b@stanley.mountain>
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
head:   09f6b0c8904bfaa1e0601bc102e1b6aa6de8c98f
commit: 2719a9e7156c4b3983b43db467c1ff96801bda99 wifi: cw1200: Convert to GPIO descriptors
date:   8 months ago
config: x86_64-randconfig-161-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121505.nyghqEkK-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410121505.nyghqEkK-lkp@intel.com/

smatch warnings:
drivers/net/wireless/st/cw1200/cw1200_spi.c:440 cw1200_spi_disconnect() error: we previously assumed 'self' could be null (see line 433)

vim +/self +440 drivers/net/wireless/st/cw1200/cw1200_spi.c

a0386bba70934d drivers/net/wireless/st/cw1200/cw1200_spi.c Uwe Kleine-König 2022-01-23  429  static void cw1200_spi_disconnect(struct spi_device *func)
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  430  {
911373cca1b455 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-06-01  431  	struct hwbus_priv *self = spi_get_drvdata(func);
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  432  
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24 @433  	if (self) {
                                                                                                    ^^^^
If self is NULL

a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  434  		cw1200_spi_irq_unsubscribe(self);
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  435  		if (self->core) {
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  436  			cw1200_core_release(self->core);
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  437  			self->core = NULL;
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  438  		}
a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  439  	}
2719a9e7156c4b drivers/net/wireless/st/cw1200/cw1200_spi.c Linus Walleij    2024-01-31 @440  	cw1200_spi_off(self, dev_get_platdata(&func->dev));
                                                                                                               ^^^^
This will oops

a910e4a94f6923 drivers/net/wireless/cw1200/cw1200_spi.c    Solomon Peachy   2013-05-24  441  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

