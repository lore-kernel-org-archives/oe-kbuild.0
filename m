Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49303156661
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251909; cv=none; b=kIVmKeP7hzcu67ArTtHKvB3qX9UlmLj+HFgxleNymiiR4cuqjqOi5JodwlIb0MBvA+6qTSHkdvadSwsprNkdg9SPNoA3NOKfGkrXYfPOEvl12nBiFF8d8hpQ3uDajdq0YAbyTCDY2coRB8COYhHZb44s5yFeM3qYg/ggoKbIGKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251909; c=relaxed/simple;
	bh=EncN5QktJw5IAKuKGgmPGiJO0WnvXEgimbNUDfsNK5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Me+an7ST2Z1GeZ8747R6Vqho0XgJN7kC7TBkUnXrq+Iw0m0eQSa0vY8dJD2D0mtXygFWQm5jdB4RFMOedX4pm4QhA83M0E4jZMOrHmcq6NHuwncRtXDbiXeRfXYvTK2f9c72Gtfza4cX3r8w7fFxNEspDOicp65bsv39Xl6s6Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJ+z+GEV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJ+z+GEV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so55801145e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727251905; x=1727856705; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcmhRdVEW6RLh9FFPD0T2qatqtJXh1Qrn0t1bzrhU64=;
        b=DJ+z+GEVy/0BOtYov1t71f/aq+kPUZ+Unsf5i4J3ukYQyntw3CrIk7m4iqpQK+by0A
         Ypu6vDOz8ekgBpBnTEkl7wWIiLdTDvyXP6BtYitWcoThlxyBNwK/dsFMtPWUxvLnIAIT
         99AcelyOs0VdknD2BQHyeJwBEN6HdtFxBHpe1E6Z/mr+DKYM1aXbZafwSMvkgNPNXqz/
         nwN90cthJ80z/kjm9JDccIw1yf7QpDBeX9MFwHy6lVM2eZy2nNzAV7TChze8epidiYPP
         MxgQu7Wqzcdv9rELx8yHenJ71aVgFQS7iX45aKY9542qiPMfNJSCq03we6kXfbnrRCqh
         tZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251905; x=1727856705;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcmhRdVEW6RLh9FFPD0T2qatqtJXh1Qrn0t1bzrhU64=;
        b=t21jvyBlJmHS1doSLtBKYq+Zx7tw4D2/uD1dMInu6rPACu1X4lQFpXm0V2Wj3ARIbN
         G7rgcpUoBolkm+K6/w3C5snmSAZflfECBZ/gZmxCvvDa4QuSWWUwK3gT9wWtA35GQQTU
         gYnXfsBf6l+c5iHkrogcvu3uX/3oG12xOl6yMxr093+Lc3q2Fi+G1skgSCL+I9KVEZGf
         Fkg9de8+qD5n35nnevpn43i7kfICw5gDrRmEP5gH+XzsRmq29Jdzl4RZnf8liRsPovDq
         Zsv+7a2kBZTmnxUigJhG8YMT86bgux3CMq1sHnIIJPBA8uv/T3xBQ9injJO3St57F6M3
         geVw==
X-Gm-Message-State: AOJu0YwfcRNXxZhSdSwRPnWFzR/hkXtIfbtnWRMkci0r1pzSE4r0XDHc
	6QA063h2DJoLRIBbrow2iVqwK8wMAlJUHmUJcldGCb5JtJHgempkCy6O4MqKLyDYopTmWsdR9VJ
	q
X-Google-Smtp-Source: AGHT+IEAGjVVslEdQKpTMyL9ykeqU1DgH/BO3ExDn+x+2vaRRx7u3D7+fDJjr7HWlPH2iE/B2z1hlg==
X-Received: by 2002:a05:600c:5127:b0:42b:a9b4:3f59 with SMTP id 5b1f17b1804b1-42e9610de2emr12270565e9.14.1727251905466;
        Wed, 25 Sep 2024 01:11:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969f2429sm10617575e9.18.2024.09.25.01.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:11:44 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:11:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tomas Winkler <tomas.winkler@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 658/30000] drivers/nvme/host/rpmb.c:77
 nvme_rpmb_add() error: 'rdev' dereferencing possible ERR_PTR()
Message-ID: <a6552e82-6c99-400a-90c6-f863f70ff778@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 62aa2255c310ca50d66cd739fb513d8717038ecb [658/30000] nvme: connect to rpmb layer
config: i386-randconfig-141-20240913 (https://download.01.org/0day-ci/archive/20240922/202409220410.hO6UmQew-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409220410.hO6UmQew-lkp@intel.com/

smatch warnings:
drivers/nvme/host/rpmb.c:77 nvme_rpmb_add() error: 'rdev' dereferencing possible ERR_PTR()

vim +/rdev +77 drivers/nvme/host/rpmb.c

62aa2255c310ca Tomas Winkler 2018-04-25  62  static void nvme_rpmb_add(struct nvme_ctrl *ctrl)
62aa2255c310ca Tomas Winkler 2018-04-25  63  {
62aa2255c310ca Tomas Winkler 2018-04-25  64  	struct rpmb_dev *rdev;
62aa2255c310ca Tomas Winkler 2018-04-25  65  	int ndevs = ctrl->rpmbs & 0x7;
62aa2255c310ca Tomas Winkler 2018-04-25  66  	int i;
62aa2255c310ca Tomas Winkler 2018-04-25  67  
62aa2255c310ca Tomas Winkler 2018-04-25  68  	nvme_rpmb_set_cap(ctrl, &nvme_rpmb_dev_ops);
62aa2255c310ca Tomas Winkler 2018-04-25  69  
62aa2255c310ca Tomas Winkler 2018-04-25  70  	/* Add RPMB partitions */
62aa2255c310ca Tomas Winkler 2018-04-25  71  	for (i = 0; i < ndevs; i++) {
62aa2255c310ca Tomas Winkler 2018-04-25  72  		rdev = rpmb_dev_register(ctrl->device, i, &nvme_rpmb_dev_ops);
62aa2255c310ca Tomas Winkler 2018-04-25  73  		if (IS_ERR(rdev)) {
62aa2255c310ca Tomas Winkler 2018-04-25  74  			dev_warn(ctrl->device, "%s: cannot register to rpmb %ld\n",
62aa2255c310ca Tomas Winkler 2018-04-25  75  				 dev_name(ctrl->device), PTR_ERR(rdev));

return?

62aa2255c310ca Tomas Winkler 2018-04-25  76  		}
62aa2255c310ca Tomas Winkler 2018-04-25 @77  		dev_set_drvdata(&rdev->dev, ctrl);
                                                                         ^^^^
This will crash.

62aa2255c310ca Tomas Winkler 2018-04-25  78  	}
62aa2255c310ca Tomas Winkler 2018-04-25  79  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

