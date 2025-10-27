Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9F30B538
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574329; cv=none; b=Wpxl4Td/VERu1n2dUUPqGDvYZ8SoeAFvlQKMBzcgbO+NilJUvxQee4jFeglU0pngbqRpnmQoiYIEhUk81bhgndsgBsOHqLV0JvHmz/zZdduIpS0tRAPwLDpM7VE7VDr1LovUPdomG9HQhpdGsuMDqHhQM0xFN+lmnoaRmhtnM50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574329; c=relaxed/simple;
	bh=JpmhN5vbyn+/p8nihnTmv+9yFuL+VOmYXxPDQe6s8Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=geBsKsCQa5IBRt7XkkgXfXLAZnARPwAsx+FzWhNsK5D8GSB7HHUFhR+4l7/vUW/7aETtRT5K/0pqOHYvNnlg1UwI5bgAitBxLfYYC0ARViuaDZaegvxvzBal6LYrTBFrHW3sKC014qqFfbf4WZFKSchQL+PdEVbCgZDZvneX9GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FEULVUiV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FEULVUiV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42557c5cedcso3191894f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761574325; x=1762179125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4gIfIP5yihC7vTlY9itbu2GFZv1/1E7yjILDIsozZj0=;
        b=FEULVUiV7efvwcr40Gx9+Abw53dWDHC3Ey2je6eXLH/3B2JHx9jSX2QWz7JHpthaYT
         d6Lm+ab/COAuTvlf7QmKxYCrvjPb0iml7qvAUwVx1Ij3KTgziYe/MxqNcKx/XHuq71zi
         EFfBqxvSypsAcK8QyehC38sRnxmdIlW6BsvbeM/iiDHzBO/+wQZsC7HyIeyofRs76G5x
         PlasQtXh+rTyvskpFPRnvy5CcAISFFhfcVwCHGXJn0n1d+TnK7SnCRXX6drjDSKtZwnn
         2nQny2gg7/US0L8DbuJ4sXXpt69GPBymrCT3YrDSU7K3gEStnAvk4GToZh/AU3J/LKKC
         Ytew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574325; x=1762179125;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gIfIP5yihC7vTlY9itbu2GFZv1/1E7yjILDIsozZj0=;
        b=WkMjzrifqpyIBs/XOIdQ/6YpFiv0aZfErO5BHw247e/q+XvtXWXnU5B7KZnRjMOjmf
         RdQwaICoQxAYJJFiQoPMdvMSLG7x8jjfDxh9YQo//jEDu280QFdBklSS0MsAr9pudUEN
         l98Jra+CYQQvJhMzgVwJymZBGfFGbUD3RNs7FUvuYD0pNgGlnI14B1LpuIh20Ia/d4Jl
         LEnlOD1gZ4H89z6CnMLLOptTDcUf1mslUxt362VqTccjN49BWnO188GxV5YwxVHUIOt5
         g1pRZt2Wlx4BaWa+YGhT9Iog0f3zgLXgHvG3VmHpRmqsufAYLqYvtWki0G9PSxtqHu2f
         RqJg==
X-Gm-Message-State: AOJu0Yxkm2vNkJs3jRbnCC1OtUd2xBQQapiXdbReTRGYOhWZ1+dvzIZQ
	M4umV6QI/Qm3H2p9Flc3g+RiAafRnt07P5PUDEv9El++hFmrPIr4FfeWxfXEEM8pTs5WFG74BOE
	K8nTo
X-Gm-Gg: ASbGnctEHihGyRSUhE6CAwrJZm85cAwD31ice7xBsB8ulrYHOzr6n+F86oZNA5EIEOq
	3OEPfWwCfgKF2hQsI0EMRcn+nfITzxYaCbelga/n+z1FgxikI3s9KN2nAJsoEuDMFKudCw/j0JJ
	z9FLLKt4Y+WFr4wpI1ddZYRsrRbXwgdAtWpdkHPtKb/UOn//MEkpfg4tPBQk0UyPyGfG8aGDxkw
	ktHyl5pr+cNSWuWyyFageiYQOquU7NO2UhPv/A0B9VG4QaeqKQb7EyyKDUzGLGNOgRYRRc42Ofu
	W3RXmqPXYOg8JyOtmQL8Eqfzh2SPf0Ujng2bMqPgGSVNfSLg92O7Y2rPr3w0OZL/+U1oK5zSBVb
	BQDE+A9yy6nmNLqNC/1TVjkqrq+gVRmD6gaOd575wA/zJ38Yyojp1NBK0neUjA7nPBbMHPJ0HBE
	J0xZ1oPw==
X-Google-Smtp-Source: AGHT+IHkgsBRbcOjdNG+k37q1tq3tc5u8M0EcaQ7C9q9qeqrzjsLZXgNXLI2c+3id09MIjkEvP860Q==
X-Received: by 2002:a05:6000:1865:b0:425:8bd2:24de with SMTP id ffacd0b85a97d-42704d145c9mr21310881f8f.9.1761574324747;
        Mon, 27 Oct 2025 07:12:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952da12dsm14731146f8f.29.2025.10.27.07.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:12:03 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:12:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pengjie Zhang <zhangpengjie2@huawei.com>,
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
	cw00.choi@samsung.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com, lihuisong@huawei.com, yubowen8@huawei.com,
	linhongye@h-partners.com, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, zhangpengjie2@huawei.com
Subject: Re: [PATCH] PM / devfreq: use _visible attribute to replace
 create/remove_sysfs_files()
Message-ID: <202510272106.x7zgW7pK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025135238.3576861-1-zhangpengjie2@huawei.com>
Message-ID: <20251027141200.5socp4g7NYibTXqDX0b1cpXLBq69iOtmanvLdegMpUQ@z>

Hi Pengjie,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengjie-Zhang/PM-devfreq-use-_visible-attribute-to-replace-create-remove_sysfs_files/20251025-215510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git devfreq-testing
patch link:    https://lore.kernel.org/r/20251025135238.3576861-1-zhangpengjie2%40huawei.com
patch subject: [PATCH] PM / devfreq: use _visible attribute to replace create/remove_sysfs_files()
config: loongarch-randconfig-r072-20251026 (https://download.01.org/0day-ci/archive/20251027/202510272106.x7zgW7pK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510272106.x7zgW7pK-lkp@intel.com/

smatch warnings:
drivers/devfreq/devfreq.c:1927 timer_store() warn: inconsistent returns 'global &devfreq_list_lock'.

vim +1927 drivers/devfreq/devfreq.c

4dc3bab8687f1e Chanwoo Choi  2020-07-02  1874  static ssize_t timer_store(struct device *dev, struct device_attribute *attr,
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1875  			      const char *buf, size_t count)
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1876  {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1877  	struct devfreq *df = to_devfreq(dev);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1878  	char str_timer[DEVFREQ_NAME_LEN + 1];
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1879  	int timer = -1;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1880  	int ret = 0, i;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1881  
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1882  	mutex_lock(&devfreq_list_lock);
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1883  	if (!df->governor || !df->profile ||
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1884  	    !IS_SUPPORTED_ATTR(df->governor->attrs, TIMER)) {
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1885  		mutex_unlock(&devfreq_list_lock);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1886  		return -EINVAL;
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1887  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1888  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1889  	ret = sscanf(buf, "%16s", str_timer);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1890  	if (ret != 1)
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1891  		return -EINVAL;

mutex_unlock(&devfreq_list_lock);

4dc3bab8687f1e Chanwoo Choi  2020-07-02  1892  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1893  	for (i = 0; i < DEVFREQ_TIMER_NUM; i++) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1894  		if (!strncmp(timer_name[i], str_timer, DEVFREQ_NAME_LEN)) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1895  			timer = i;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1896  			break;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1897  		}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1898  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1899  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1900  	if (timer < 0) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1901  		ret = -EINVAL;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1902  		goto out;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1903  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1904  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1905  	if (df->profile->timer == timer) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1906  		ret = 0;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1907  		goto out;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1908  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1909  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1910  	mutex_lock(&df->lock);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1911  	df->profile->timer = timer;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1912  	mutex_unlock(&df->lock);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1913  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1914  	ret = df->governor->event_handler(df, DEVFREQ_GOV_STOP, NULL);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1915  	if (ret) {
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1916  		dev_warn(dev, "%s: Governor %s not stopped(%d)\n",
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1917  			 __func__, df->governor->name, ret);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1918  		goto out;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1919  	}
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1920  
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1921  	ret = df->governor->event_handler(df, DEVFREQ_GOV_START, NULL);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1922  	if (ret)
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1923  		dev_warn(dev, "%s: Governor %s not started(%d)\n",
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1924  			 __func__, df->governor->name, ret);
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1925  out:
88ea5f098ddcf4 Pengjie Zhang 2025-10-25  1926  	mutex_unlock(&devfreq_list_lock);
4dc3bab8687f1e Chanwoo Choi  2020-07-02 @1927  	return ret ? ret : count;
4dc3bab8687f1e Chanwoo Choi  2020-07-02  1928  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

