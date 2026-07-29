Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0776222D785
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 05:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785303965; cv=none; b=K727EqfRHQ5zwc3piI+s+s5ecihBA/umf76QrQT2K5Q8nInTeG3zSutSkebD/yHxu0nqJN3UYKCRLG4b4AzpnNIWACZgkKd0FtYQQfgfuYxrmWgMljt4u8z/RJQwVBcOMij3UHVpRMMZAo+o1EYMk1ApmnEcC+y7PTT29qtLA0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785303965; c=relaxed/simple;
	bh=NNRhx5kCrh7KxH5C17Ma8caUSEtsaxgQsdVLvCvhiCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Msp2SCTqdeCHX769JeDUhIMErLfMzDQaGhDfiSiLhsCPFwQ5an41kz3iJ53zogUfzMfHZBOOyzhPwjQWrXphHmJruRbD45apG3A6DQDDqc45642CgVh+eizeIWYgfkSjosZlz+mA9m0JEAmeyKW7C4+264eXheMm/fZGmFDZ9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXXSfQZG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXXSfQZG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4955de8797cso3333265e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 22:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785303962; x=1785908762; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVwpUPi151eolMFYb/dgE7OHy6q7d6NUaiE4xjATEk0=;
        b=VXXSfQZGMLPcheQBMcIr29BchM6PXAQSq7ywOCSE2hUTNI3jlllMQlfWvDvKlG6coA
         Krt76L1fR2MjsZV2zbU14+WXU3pCFYt928b4SYuVoRVr0TZCEjJ9PjbH1cOu1/IPBNdA
         kpYf7Nh/6qdBlj5DA5pjVnHbUrPl30BHuLAi8wQolqs1pMIszqgQx2YKjBvQR8XBPcty
         AYKVfwjeWmVqjO1dOqGHyYOIO6ZboBf4Hz7hps8ZN70ZOi/3Nk4n01OCntOIZJS44cs8
         riJjTiQ0vLBdJ9ji9/IE0mDWP/QLUFpjStWpy3I38QhLutOneAtSmjNIeTg/RtUqCngP
         gWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785303962; x=1785908762;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVwpUPi151eolMFYb/dgE7OHy6q7d6NUaiE4xjATEk0=;
        b=Oo/DhdWFjhKuUImGBs4MsdDhQER4eHibwmGOBxGqRvhc02+smtarra0f11BUn6gGdV
         v2wTqkwYVPgONzJy7yCICFvSYI7d9ZHFYrQE0qIW/NIiPj5eJr+/r55FTk/XrNr7XUB/
         R1xVfYhz6ZOtcNjBXLfLXd32p0gBZddwzbqGO5IgDHS3/Sg6Ej7OzrIzoxQiCxqN4h2d
         7XpjBPapBPpBixMbMDIMUnQFbWBuSoF9gep6sKGyiAwsWbb7oBu8PtBHcfDz2AvO3mBl
         J05YYisi+AJ9XWW/rLptn9Rgno59pckzO7negSkZY/L6ZGcOobNKpMKQDalKhdBhmAmv
         EJgg==
X-Gm-Message-State: AOJu0YwOAVeRyNmin3PvKYW/MwmvB18jy/rqyydCBvmF+ECgPWBRDyng
	8nDwQl3KohiPVYS3YES709jHZ4GrcRFtmAJH+QA4pj8II0Nwi3dPPUYpvNR3LOGH9NQ=
X-Gm-Gg: AR+sD13VwZBAWpq2PYVVkdZrbNPdnT1kEwu0uukl5dNrODJZ+fxrJVSucT1liBN8WA6
	hHzALexuIM2NplVSF4aFkA9wbAFCu0hrx0mXafw9700ITfLvzHp/CF+BU2JHxSk7tah7X+/+6cM
	xtPWVJmIUb161wsRUoMYF9GhGWzhsnYojKdiEhfpo3ztWqXDN4fOQG1NqHu58uffRb8JkbUMfWG
	QdExMfHXbWJ8bE7MG2onMxheJUjJYxAWLXrahPnhfqfbkyAKVwc91cwSa33gosCb42Ej9kuccMC
	ZUTMtAH4WUqOwKSqV2HEoUqcjX7DSFfErsLjdkghQ6zhaRi5wEnuBPg5eKb27rI7o53vFU1FDaK
	RE0B94v00feUn1n5c2Eo77vjNhLB+ic9e/TcnOknFlSXY8XbEEFq0LBii8S/SPtOjTkRUJsnBFr
	zJ6gr/xnQ6Cj6J8w7/ItQMU/SS0+KcqqpIGWftZM/kgXXLs6cVj+jrptvS
X-Received: by 2002:a05:600c:4f91:b0:495:7eab:3abd with SMTP id 5b1f17b1804b1-496c65a26bemr53982335e9.33.1785303962326;
        Tue, 28 Jul 2026 22:46:02 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49764d77970sm31931095e9.5.2026.07.28.22.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:46:01 -0700 (PDT)
Date: Wed, 29 Jul 2026 08:45:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Niranjan H Y <niranjan.hy@ti.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn: missing
 error code 'ret'
Message-ID: <202607291308.8OeeiyIv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260729054558.MWTHkD-kwjuYPeSRCV6VXWDaEIVqAYpvrSGOGBdtKF0@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
commit: 38c89fededd5a9472e8222a20aa066058585f7b2 ASoC: tac5xx2-sdw: add soundwire based codec driver
date:   3 months ago
config: i386-randconfig-r073-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291308.8OeeiyIv-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 38c89fededd5 ("ASoC: tac5xx2-sdw: add soundwire based codec driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607291308.8OeeiyIv-lkp@intel.com/

smatch warnings:
sound/soc/codecs/tac5xx2-sdw.c:984 tac5xx2_jack_init() warn: missing error code 'ret'

vim +/ret +984 sound/soc/codecs/tac5xx2-sdw.c

38c89fededd5a9 Niranjan H Y 2026-05-05   979  static int tac5xx2_jack_init(struct tac5xx2_prv *tac_dev)
38c89fededd5a9 Niranjan H Y 2026-05-05   980  {
38c89fededd5a9 Niranjan H Y 2026-05-05   981  	int ret = 0;
38c89fededd5a9 Niranjan H Y 2026-05-05   982  
38c89fededd5a9 Niranjan H Y 2026-05-05   983  	if (!tac_dev->hs_jack)
38c89fededd5a9 Niranjan H Y 2026-05-05  @984  		goto disable_interrupts;

Is this supposed to be an error path?  tac_dev->hs_jack can't be NULL
in real life.

38c89fededd5a9 Niranjan H Y 2026-05-05   985  
38c89fededd5a9 Niranjan H Y 2026-05-05   986  	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
38c89fededd5a9 Niranjan H Y 2026-05-05   987  			   SDW_SCP_SDCA_INTMASK_SDCA_11);
38c89fededd5a9 Niranjan H Y 2026-05-05   988  	if (ret) {
38c89fededd5a9 Niranjan H Y 2026-05-05   989  		dev_err(tac_dev->dev,
38c89fededd5a9 Niranjan H Y 2026-05-05   990  			"Failed to register jack detection interrupt: %d\n", ret);
38c89fededd5a9 Niranjan H Y 2026-05-05   991  		goto disable_interrupts;
38c89fededd5a9 Niranjan H Y 2026-05-05   992  	}
38c89fededd5a9 Niranjan H Y 2026-05-05   993  
38c89fededd5a9 Niranjan H Y 2026-05-05   994  	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3,
38c89fededd5a9 Niranjan H Y 2026-05-05   995  			   SDW_SCP_SDCA_INTMASK_SDCA_16);
38c89fededd5a9 Niranjan H Y 2026-05-05   996  	if (ret) {
38c89fededd5a9 Niranjan H Y 2026-05-05   997  		dev_err(tac_dev->dev,
38c89fededd5a9 Niranjan H Y 2026-05-05   998  			"Failed to register for button detect interrupt: %d\n", ret);
38c89fededd5a9 Niranjan H Y 2026-05-05   999  		goto disable_interrupts;
38c89fededd5a9 Niranjan H Y 2026-05-05  1000  	}
38c89fededd5a9 Niranjan H Y 2026-05-05  1001  
38c89fededd5a9 Niranjan H Y 2026-05-05  1002  	return 0;
38c89fededd5a9 Niranjan H Y 2026-05-05  1003  
38c89fededd5a9 Niranjan H Y 2026-05-05  1004  disable_interrupts:
38c89fededd5a9 Niranjan H Y 2026-05-05  1005  	/* ignore errors while disabling interrupts */
38c89fededd5a9 Niranjan H Y 2026-05-05  1006  	regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2, 0);
38c89fededd5a9 Niranjan H Y 2026-05-05  1007  	regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3, 0);
38c89fededd5a9 Niranjan H Y 2026-05-05  1008  
38c89fededd5a9 Niranjan H Y 2026-05-05  1009  	return ret;
38c89fededd5a9 Niranjan H Y 2026-05-05  1010  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

