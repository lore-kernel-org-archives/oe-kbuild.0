Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864D26AFB
	for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989990; cv=none; b=ihYRAIgvZvUQRo+JPL/sDOeGxWLYw/66C+aSUoTiDRnMniCx0x6B4Sn20KfMHIrRw8euPivhC22osobecwhJAD+1MiyvAF2EMkyHKEj9Y/PDsHodJXLZXpCJavEMZmsrMh4k6ADkg6lwKqEYj/NkZAkgRlX8+Pyjx6yzu5BH0r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989990; c=relaxed/simple;
	bh=ijDpkVd9bIudM+80lAMzls0AJOXrudy0VseWNBzEp7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=B2tOi5sNfl6yHhUcENkBvHjYC0TqhHOPxjx/OWmx0lmJeX50sHWJd6hy3nevQbSfv4ZP0fzgGlhP3jbjrtcniQuwlr1ILWfE6Q6kvIwCAUB76G7bcuGGk5uTFvZ5UrIRCrYt4E0QAx0rBT93AJn1PyCFV54InZ8osvb0L7itVB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygS2WRGL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygS2WRGL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-44a57d08bbfso13302825e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747989986; x=1748594786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F9P7Rk/7XrTl/pDcnuGIJWrvqaFCK/IVU3Vt6Py9KfY=;
        b=ygS2WRGLZGM1YN4WDaOZzLd9qIOKLxN6b0nwdgz5uqA+K00SJNg7OMoTmo1TV+DI0h
         pD7l+vYCeyhYETE5ceLISYg/pnK7TCR3heAuGhKZOoR8KbamycTRgH5+kFak9wrGkcCq
         7W+SulS9XVYSCZF7ZRj/HnDrjeVj/bhOK7dCuPqS+1osDvB/ISNnrke/62XgmY++sKaV
         9KI/FF/R3KaRsV+fXQ6mAjqD6IaDDco1YsmOSogCsXBZg+4A5WByt1YcJn9+Pd/Tr+15
         nRVsZJYAgepAHyN4z/AnUxcA1D6NjMvZEoG1lzLrEDoYpE3VwLQwUWmppay5i79MFwzE
         ZBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989986; x=1748594786;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9P7Rk/7XrTl/pDcnuGIJWrvqaFCK/IVU3Vt6Py9KfY=;
        b=GxjFt/f9rFQrT50Ahzpl0zTTCisGQHsn6SZvFREJ5GTuxZ/SdGfAcUgmd1jUkMzG1W
         hiimMizeMN15aCkjDbxEDwCstg822iK6mGiO/OiO5BgKfo6kBDs2rHfNM2wuA416EP8E
         Oc5nv2tpUvDCanYVLBqPCaCWLV+pYTMNhKe+MQHeuiE512s/lIkqgUhZyG0LX0Iz5es9
         6tbg5NYOJsKRJ/kmaKa15eD7qjf6B9xBJOXjcVR3pvlrx2a9ya0wCj69uY7E92aN2BC8
         3RrXQedsB48xsMwep3Mb/d3zHIBLYpjcl44ChQsp8TLdw7cJWDJJxaYaJomf57wyWpT9
         OlTQ==
X-Gm-Message-State: AOJu0Yyb1sCmnRGT+ykANJwN85LLDQGjV/0IYQljXthmpzOB5MNSsZsy
	vL2JEKACpTOJiQdhfDzbfvZ6jJzhvc0TNaJDVaXvgd7NUGOR3LzxhPTJ2g9f1gXCwYtG9k8s7s1
	yKe+J
X-Gm-Gg: ASbGncvLs6qf8wVRZjfwXbl4AJfhAS4+d9qCPWNLlHzzuC1vfUVjFpx5U4lAaVOIfkD
	khKdWjSGRwtuiaFW5ypC0jP75gpQ0lwT4/LrujZIZJXqVY4mnlv80qxTkUUWUMXvGfzeEyvBQSh
	xtOsO84z1E4Vuy6HNeZ6KfocbByyKkZqPC8ED28u4/errUc4V3AzCeex+WrPhkrk5hdTjYd1e0z
	e8iM7Jiw77UPCMeLRvB1eWb3YM/QKEn4c1tWJif87NTlxYL+cowW37o9/dsdIOUVXsxhhYLUuEz
	P47WI2+znABAH02vDLuC9j4qXFs5w1aLuzACKc7E9UXJtIy1qwsxBeGq
X-Google-Smtp-Source: AGHT+IHEFaNidkq//G3ga+4pKK+ukGJTHJ6vlDpZIaMqQUQ94hnKE3vGPQwUUoj4CTDfpbQOR/PKlg==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-442feffb6damr312276505e9.15.1747989985840;
        Fri, 23 May 2025 01:46:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f6b295e7sm131290155e9.2.2025.05.23.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:46:25 -0700 (PDT)
Date: Fri, 23 May 2025 11:46:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Binbin Zhou <zhoubinbin@loongson.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 18/36] mmc: omap_hsmmc: Use devm_mmc_alloc_host()
 helper
Message-ID: <202505230421.P12fqPfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21ef0c9eb527c17b0892af03ee010bca38207ad2.1747877176.git.zhoubinbin@loongson.cn>
Message-ID: <20250523084622.eJw9vh1AnldYdcFeEKbff5XpIk71gL9rfsNMIPVOBR4@z>

Hi Binbin,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mmc-alcor-Use-devm_mmc_alloc_host-helper/20250522-150218
base:   61bd8e76021e779f7ba3c761919b533fb3f6f584
patch link:    https://lore.kernel.org/r/21ef0c9eb527c17b0892af03ee010bca38207ad2.1747877176.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v2 18/36] mmc: omap_hsmmc: Use devm_mmc_alloc_host() helper
config: arc-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230421.P12fqPfB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505230421.P12fqPfB-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/omap_hsmmc.c:1842 omap_hsmmc_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1842 drivers/mmc/host/omap_hsmmc.c

4dffd7a251172d Adrian Hunter          2009-09-22  1837  	spin_lock_init(&host->irq_lock);
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1838  
9618195e5a152d Balaji T K             2014-05-09  1839  	host->fclk = devm_clk_get(&pdev->dev, "fck");
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1840  	if (IS_ERR(host->fclk)) {
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1841  		host->fclk = NULL;
                                                                        ^^^^^^^^^^^^^^^^^
need to preserve "ret = PTR_ERR(host->fclk);" before setting this to
NULL.

229ab512b90f8f Binbin Zhou            2025-05-22 @1842  		return PTR_ERR(host->fclk);
                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^

a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1843  	}
a45c6cb816474c Madhusudhan Chikkature 2009-01-23  1844  
9b68256cdef752 Paul Walmsley          2011-10-06  1845  	if (host->pdata->controller_flags & OMAP_HSMMC_BROKEN_MULTIBLOCK_READ) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

