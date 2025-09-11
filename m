Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA45221264
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616992; cv=none; b=lUbAc64UiRbGtle4+qcBshE8qSLYa460KG+aEIuH9/qASTdLrHI+/ejz59Pvm4/U+TIHIAQ/VtBQZLF3/ERKckTNaa29/7LszWF4syS43/vQvVKhHSTQov02QrTPKYhZupisFvyYL6/vCd3CBPaCLZ4RxAf/5d2/k0vzPSq3buM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616992; c=relaxed/simple;
	bh=eAdLzTunp6L8F8igg9QJsHgjGZpfmMZdlpVSOJGx2X8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gC88e8UGguwBshvfxP6repMLVCkvfGpTQAbVuh3/GWajitFGo0ZHh6Mcl25PDiG35Tpne29rZ3LueU5M8bLD/uk3+/XlTbSzxdda5OCymVJvS9xpCXfPWS17udbpGf+3Yat7q2YJYfrJlrgp/aqoqiQf6FUubmPpgs8hlluO9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjjXFVJt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjjXFVJt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45cb5492350so8349345e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757616988; x=1758221788; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/1lynTtqP2L5WpIgf11yv0i1GAbDVPfxl3F12KWmkU=;
        b=gjjXFVJt2ZHfZ0sPGNyXl1o78o9cgSgE7f83+OVMG9m1eEoYdgk2hIKcz3FxndhZKK
         FoGEcDZTXXmvzTchP99dOfg2fRnHxagLp81knCgVp1u1+HNnvihSZ75RsD0+3NX2LJct
         AcMb6gSyB3hiIfavH/ATNAKhZeD+MtWS1rv1G99Zfh5XkFpI5QYv2ApQDBdEsamCYiLx
         pP3souQWUkKDzy3ZDC9KelZ4ElrScKl+zIvUqH/H9pUXK0FRWUtkA7A0Ppf/VmJw97zf
         EWz1zy75PjjCU+GHfS2GVewVhavvA2N+E14swFZOJMakEOYS6IVUWmFztE6VFWWyYJsa
         tGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616988; x=1758221788;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/1lynTtqP2L5WpIgf11yv0i1GAbDVPfxl3F12KWmkU=;
        b=Fha59U/dq/gD/lYFY3PhY1XxaUSjK6YqwtSoWouUz1B9hbYNwOuzMIIcK88lD0g0n8
         cb0TNnefvYv3fe41DQb2XXe3Jn1t+g5uYv38aU8kX8PMdL/HZnNqGYW2UCnt2OmayVU5
         KYDhCzNq/ysOqE6EckdoP2WgLXFWUic4Y1p0r/N1EMMGJdwypkgypadVAnMZqZ7rmvFW
         XvzGye7rCOswc7zyFa6c5b/chxHZ9J/C48Q9tzrliIyCDTBBAlBG6PRB1jWoyl+QHyLn
         jBNkB4xm4lbFTUcX1rXwaKfzSS+1DUS1Ga4ryv+qVIhgEf903XB/FTySM2PiQFq/avp/
         UBSA==
X-Gm-Message-State: AOJu0Yzp7J/nZz6zC8DwW5zScnUEg6J/+GjEhrBYS9bBjxs4MZsxp+jX
	RuHwTXqNY9TFteT8LOxwVdwLBHm5P8zZrdEadgIS/HR2n7ALH52bASLBY7xY83oyiIOy0lXyW3k
	UOQHr
X-Gm-Gg: ASbGncuvlq7gwKEP3sYoJtoipXnezl+dQ1+Xkf+JCDc1Xw1eXPi9gtxXK/833KRFfOH
	oazSiETljxNC2W72S0yJ0tk2H6JXd001Nn+aXuvvQUBcslPHTJwJGsSIc6C49nNeKlLqZuUF4m4
	PQNXh7DA/JpaoERmTKbtRZcSz2GaeeHdgKxY7SrGS/HFgJ2tf2rfKQ0tpPGJPg+kiStCG2vzX3R
	zljsCftOn6/z2RBKBdBx/6HTRFzBwLl/8ihoHbjmRsC4/ixdoZqlR25V+Aeeb2PGinJvj9N75l9
	mlA6I+fn6pcFTnHQOcdrtRT9Wbx9B60bRb/NpNPWlm0bG5EgT3YqW6aIqRHFDPzl5WJGsphTkYK
	9XEpGm3MskjdE6HOUYBUxnIqD0UV8rdU/4sPhPw==
X-Google-Smtp-Source: AGHT+IFV+iGP6JXuNINcLc+xNqYu9tc6riiU4ldB2MbFh50FgLmnwd57JrSwyYJPi75xAVNmN1570g==
X-Received: by 2002:a05:6000:40cd:b0:3e7:615a:17f6 with SMTP id ffacd0b85a97d-3e765793d9dmr306925f8f.28.1757616987898;
        Thu, 11 Sep 2025 11:56:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e017b4222sm37086375e9.20.2025.09.11.11.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:56:27 -0700 (PDT)
Date: Thu, 11 Sep 2025 21:56:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Denis Aleksandrov <daleksan@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [linux-next:master 7959/8263] drivers/char/tpm/tpm_ppi.c:349
 tpm_show_ppi_tcg_operations() warn: inconsistent returns 'global
 &tpm_ppi_lock'.
Message-ID: <202509120229.YpG1CcD3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250911185623.WNOV9-V1sSijGo6qhU3f2LUrcIwSHCzz9SuABMSNKUQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: 18aada46edf7f79dba1ab89a100d0fc350d4a5c8 [7959/8263] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
config: x86_64-randconfig-161-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120229.YpG1CcD3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509120229.YpG1CcD3-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_ppi.c:349 tpm_show_ppi_tcg_operations() warn: inconsistent returns 'global &tpm_ppi_lock'.
drivers/char/tpm/tpm_ppi.c:378 tpm_show_ppi_vs_operations() warn: inconsistent returns 'global &tpm_ppi_lock'.

vim +349 drivers/char/tpm/tpm_ppi.c

81198078d7da42 Xiaoyan Zhang     2013-08-29  323  static ssize_t tpm_show_ppi_tcg_operations(struct device *dev,
81198078d7da42 Xiaoyan Zhang     2013-08-29  324  					   struct device_attribute *attr,
81198078d7da42 Xiaoyan Zhang     2013-08-29  325  					   char *buf)
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  326  {
9b774d5cf2db4b Jarkko Sakkinen   2015-04-14  327  	struct tpm_chip *chip = to_tpm_chip(dev);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  328  	ssize_t len = 0;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  329  	u32 ret;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  330  	int i;
0dc553652102c5 Jarkko Sakkinen   2014-12-12  331  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  332  	spin_lock(&tpm_ppi_lock);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  333  	if (!ppi_cache_populated) {
18aada46edf7f7 Denis Aleksandrov 2025-09-10  334  		len = cache_ppi_operations(chip->acpi_dev_handle, buf);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  335  		if (len < 0)
18aada46edf7f7 Denis Aleksandrov 2025-09-10  336  			return len;

spin_unlock(&tpm_ppi_lock) before returning.

18aada46edf7f7 Denis Aleksandrov 2025-09-10  337  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  338  		ppi_cache_populated = true;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  339  	}
18aada46edf7f7 Denis Aleksandrov 2025-09-10  340  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  341  	for (i = 0; i <= PPI_TPM_REQ_MAX; i++) {
18aada46edf7f7 Denis Aleksandrov 2025-09-10  342  		ret = ppi_operations_cache[i];
18aada46edf7f7 Denis Aleksandrov 2025-09-10  343  		if (ret >= 0 && ret < ARRAY_SIZE(tpm_ppi_info))
18aada46edf7f7 Denis Aleksandrov 2025-09-10  344  			len += sysfs_emit_at(buf, len, "%d %d: %s\n",
18aada46edf7f7 Denis Aleksandrov 2025-09-10  345  							i, ret, tpm_ppi_info[ret]);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  346  	}
18aada46edf7f7 Denis Aleksandrov 2025-09-10  347  	spin_unlock(&tpm_ppi_lock);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  348  
18aada46edf7f7 Denis Aleksandrov 2025-09-10 @349  	return len;
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  350  }
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  351  
81198078d7da42 Xiaoyan Zhang     2013-08-29  352  static ssize_t tpm_show_ppi_vs_operations(struct device *dev,
81198078d7da42 Xiaoyan Zhang     2013-08-29  353  					  struct device_attribute *attr,
81198078d7da42 Xiaoyan Zhang     2013-08-29  354  					  char *buf)
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  355  {
9b774d5cf2db4b Jarkko Sakkinen   2015-04-14  356  	struct tpm_chip *chip = to_tpm_chip(dev);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  357  	ssize_t len = 0;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  358  	u32 ret;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  359  	int i;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  360  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  361  	spin_lock(&tpm_ppi_lock);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  362  	if (!ppi_cache_populated) {
18aada46edf7f7 Denis Aleksandrov 2025-09-10  363  		len = cache_ppi_operations(chip->acpi_dev_handle, buf);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  364  		if (len < 0)
18aada46edf7f7 Denis Aleksandrov 2025-09-10  365  			return len;

Same.

18aada46edf7f7 Denis Aleksandrov 2025-09-10  366  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  367  		ppi_cache_populated = true;
18aada46edf7f7 Denis Aleksandrov 2025-09-10  368  	}
0dc553652102c5 Jarkko Sakkinen   2014-12-12  369  
18aada46edf7f7 Denis Aleksandrov 2025-09-10  370  	for (i = PPI_VS_REQ_START; i <= PPI_VS_REQ_END; i++) {
18aada46edf7f7 Denis Aleksandrov 2025-09-10  371  		ret = ppi_operations_cache[i];
18aada46edf7f7 Denis Aleksandrov 2025-09-10  372  		if (ret >= 0 && ret < ARRAY_SIZE(tpm_ppi_info))
18aada46edf7f7 Denis Aleksandrov 2025-09-10  373  			len += sysfs_emit_at(buf, len, "%d %d: %s\n",
18aada46edf7f7 Denis Aleksandrov 2025-09-10  374  							i, ret, tpm_ppi_info[ret]);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  375  	}
18aada46edf7f7 Denis Aleksandrov 2025-09-10  376  	spin_unlock(&tpm_ppi_lock);
18aada46edf7f7 Denis Aleksandrov 2025-09-10  377  
18aada46edf7f7 Denis Aleksandrov 2025-09-10 @378  	return len;
f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  379  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

