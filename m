Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C49F2040A7
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345217; cv=none; b=PbrNoqK/G3EGzS/EJs8nupbLUyj/Wt2zKlHpJTY+Gb/K9armF1eu1XYy3XXT3BR9WsAnMfKKrxXHT0u+prQ4Ws6HcQE1oxmnBQe+LiU/EIYesWAecxPp3W33+haq5ggktdDNOsNUhS1Nlh/EA7hGLW7h2IKOmEhoonF6f6Ah7kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345217; c=relaxed/simple;
	bh=Stf0Jb6AOQt3UW45VdcZWRKlmtA1GKvuSfA1nYZiAmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rV/qu8BleT0GUBMLY4eetysr78tP8JXH/cwqFIWLgmaTfmgjmOzJ1kGWV22i1y1sobqBWAqQLVJ1angnQD2NZNQi3Oky33uO63p3noKpI4An+0ndkJE7/2QK41knCrwCtI/SNx1Nj0+UFI9QzZwpViA9fZLniefdRnAbiHshHqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Je2oQQnR; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Je2oQQnR"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so589592a12.2
        for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 23:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739345214; x=1739950014; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AJTh/3LX42S4U+/p3ueXWIJVVkrm4MNl6nXiRtJNaS8=;
        b=Je2oQQnROiJgoi/TkDLIOz33GvoTTHB6zorTliimdm1FLaAzGLbxvVq5p8LZvpf8QS
         nmX+xK72bxyoA2C7qioB9P6/DnIxZNW27ySMZCIqj8CHy77wDdAaRDhdFeKqGUeSAmrE
         RePSHdXPeY4DHG6keanOF7Xj4HBR2WXvmbXvqyqlpEmV5K0zLWVc96h3vu2gJShG+Dpi
         k1ZT5mm8gteF6YzFkeF8/sQeGtMkfFLrSKx8TyKp06n8I5PzJpwb+ZBYwqs09VlRCA9G
         4a3hBR66533zPDf0L6s45Zqvh4ddKmEdUaKCXdgwPchb19/vj4IUGmsD7IfHxQ9ycI2E
         UImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739345214; x=1739950014;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJTh/3LX42S4U+/p3ueXWIJVVkrm4MNl6nXiRtJNaS8=;
        b=Tv7GxEVeUioY9zL3H7DxxEd7rFzIwhsZcZlEvUfn7Q+mK74In5Er+xpDpZ12xqPeeJ
         ktsp9wubw/Nu7fTU/KySsbVdfuDRPYYeyBEFi+aTqZrAglnt+3xDCVsxrnXP4Tnc6qtM
         xqoSFtDWphudfMOVyDC1+WA5SurLmPsb6cl+/G0JJh21yVfOYGIg6f82yl7we6CvuW8L
         pzATuzYqxplwZBgm7X+Z2+ueQQ/yzSWV62JVRJyO8P/tE9JdKiqlJbyzH0+u3yaBv72/
         FTm7v6k6yYdJj5c5gfTUTgcMGAlCHlqqQcEB8cgCuiVEzwVfZcWsWcYA3D/0rVmqISDe
         Zqcw==
X-Gm-Message-State: AOJu0YwKci8NS/l3rfyJcmU1/q+x2H8cVC2SfylOymhCJH08+f226Ddb
	fZk7NKL2C78+vr6YFcXXkQA0/fNZx4lXnWasw7M8QxDJreW+/iLAvUwQTHrvObSjcA9vpnkCe6D
	u
X-Gm-Gg: ASbGncseaFBHf2l9DbNLmCmXycCB33Zx260kxc2KBpDOLiPcVbiq3vsmVFs9bTbAZEX
	qRK733OMVK1NuF5iWbv15BKj7UU1OH80m/ifxbObSi8US0cUHZFvZeVBmG2A3cK5Hnj0sMGFdff
	WVugWv5KgiDlK82RNxAY1b7746Ynz+3zr+LeU0wLWY5cBgyh8ADSa/grvA7dPcagRg7pGTx/izm
	ineEFBggfRYjdl74bxDwcIK7vxUZ257q1fNO6FN+0IVLS25TrGFZxSrj2aHalK5pBMQVf8edj4w
	0faRTa3KZXshKAA8yEdQ
X-Google-Smtp-Source: AGHT+IFEIukrsfK6bZlW7MrqvUc4H7nNhVSu1KFPTEnyStLzMs/D5F7VfW3cbMd6Iv6A4IGV/jSXWQ==
X-Received: by 2002:a05:6402:3553:b0:5d1:1f1:a283 with SMTP id 4fb4d7f45d1cf-5deadd7bc87mr1609569a12.4.1739345213733;
        Tue, 11 Feb 2025 23:26:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de5a2fc79esm7995187a12.10.2025.02.11.23.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:26:53 -0800 (PST)
Date: Wed, 12 Feb 2025 10:26:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clk: clk-imx8mp-audiomix: use the auxiliary
 device creation helper
Message-ID: <7bb0b7ea-8ca4-4ea1-a7ec-d56646240e59@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-aux-device-create-helper-v2-6-fa6a0f326527@baylibre.com>

Hi Jerome,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/driver-core-auxiliary-bus-add-device-creation-helper/20250207-023433
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250206-aux-device-create-helper-v2-6-fa6a0f326527%40baylibre.com
patch subject: [PATCH v2 6/7] clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
config: xtensa-randconfig-r071-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081655.FlCrxpYN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502081655.FlCrxpYN-lkp@intel.com/

smatch warnings:
drivers/clk/imx/clk-imx8mp-audiomix.c:241 clk_imx8mp_audiomix_reset_controller_register() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +241 drivers/clk/imx/clk-imx8mp-audiomix.c

c350f4c434316c Jerome Brunet 2025-02-06  231  static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
6f0e817175c5b2 Shengjiu Wang 2024-06-14  232  {
c350f4c434316c Jerome Brunet 2025-02-06  233  	struct auxiliary_device *adev;
6f0e817175c5b2 Shengjiu Wang 2024-06-14  234  
6f0e817175c5b2 Shengjiu Wang 2024-06-14  235  	if (!of_property_present(dev->of_node, "#reset-cells"))
6f0e817175c5b2 Shengjiu Wang 2024-06-14  236  		return 0;
6f0e817175c5b2 Shengjiu Wang 2024-06-14  237  
c350f4c434316c Jerome Brunet 2025-02-06  238  	adev = devm_auxiliary_device_create(dev, KBUILD_MODNAME,
c350f4c434316c Jerome Brunet 2025-02-06  239  					    "reset", NULL, 0);
c350f4c434316c Jerome Brunet 2025-02-06  240  	if (IS_ERR_OR_NULL(adev))
c350f4c434316c Jerome Brunet 2025-02-06 @241  		return PTR_ERR(adev);

If devm_auxiliary_device_create() could return NULL then that would count
as success.  But devm_auxiliary_device_create() can't return NULL.  It
only makes sense to return NULL if the auxiliary device is optional.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

6f0e817175c5b2 Shengjiu Wang 2024-06-14  242  
6f0e817175c5b2 Shengjiu Wang 2024-06-14  243  	return 0;
6f0e817175c5b2 Shengjiu Wang 2024-06-14  244  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

