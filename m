Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248731E106
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766755041; cv=none; b=gVzCSnmj3B+l5HHw2ORihyRsWs5ykYnqVMgFw+U9ToC7xjsdbVRK3QZ4KDIKKUoHWLS4997XJxaYxDHkjWqnOgCMxBYx2CEwhMA4Ny5GV37fuMbCsiBNxlrSFGxw3WSDzTEMMZfkMPbS7oIUWWex9tTBncyarRM2ITdBgpweeZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766755041; c=relaxed/simple;
	bh=bxBw9WTqsdPsvVlLRGbxHJ6nYZczcf6QkHvZ/gvVMCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=quhpc9fgnn6OXaF38Ubi2sQ+FZcWiHkmkW9+oobwrH96cUbzo17QQ7Q7/HZAAIztv7hcN6hgUOLqJaAfgF5QGqUr8ghjfCwtXri3X5zXoxDx8ZFqRlQUReTXOcqSqPgm9nsNAJIH1LOydsqh7X9aE0lLzzTCqZRFtoODfXJTCyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mM0SQbMi; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mM0SQbMi"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso45473225e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766755037; x=1767359837; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3nq+EYlL++mG/3TFa3FwRdzZI9jSs+tcNFo3bySgaV0=;
        b=mM0SQbMi/NHLLNBiYWc1YwwX120fezEyJfNthLDvqjHLms74KbjpvRAF00Yp4DIQgR
         ZY9EPKNMr5hSMueSZqoJv0H0ljt7h1FYB6HqbtyrNr9mToIpkAV3ZvQeaJdaTfcC9bhh
         OGiYtBiLBcw6B3z8pSoNzzZiXyxtwKR6c/aVPH2nr+NdqRlDO4UiIA2DCnCNgKPxHSJa
         C6H1D5/QGHeo7VXjWfe87D7eANNZIRAEWEuLrNLnnvm0gxgIvQ+48A7UhUqPOvlRzNM6
         Q2ckV3SMH1yP8uEE3rGkr8zP9E8XWi1M/3OaJmRcEa6oMN6IGTaN0XysuNOwldGwodU8
         1H0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766755037; x=1767359837;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nq+EYlL++mG/3TFa3FwRdzZI9jSs+tcNFo3bySgaV0=;
        b=G+E6aygTAqujtkaN/mE21Q30+KN9T30MxVdBgdkz9ipeLY31OmLoB5nODXSsMvn0XE
         8yM5QyTLy/3dFtuEoe8++CJvjhcgw+fHnRRJ9ptXLyl7eS0UovNTBgbqOJIcUR7NyHNG
         zEEX/VTuBPSCojppP0SGJMSlMB6HAyii41AruA7qU7cJpe/0sB3GSku3BH5sIPJBc9Qg
         9qWoq/ZWWLHvyIa3OmFH1OEuXk+hG9wBad4ZSB/avV0FWFHC7eqSkn3sPuA9qedLF1gq
         ft3Amo26wmIfOSjdCBBcy5xC9jynOwKOBN/g3FZNaQ8b17oDftudPCTc8HUKh0gbhApo
         JdUA==
X-Gm-Message-State: AOJu0Yyo2a5VYv9jBhEFgySslcUvjaB85ukuN+J68DCC6OwoU/FD12Gi
	dG4ssjpzLjT9QuN0gv3itDhgOG5LdbXxsWDEAe4oxNrPoRnKwObPEx58v0ntCBPeFprLfZOGIQm
	hfd2T
X-Gm-Gg: AY/fxX6/kE+Ggy0JVLbhlJ69F09E+tx/CL0/ttWLgvKmChGVnPN4cy4Yf8cY6eDeWSw
	hIw5Y7gf2jYzjADNFxAIESFj/XhNQtje6kMgObG/wC6deQavh0gn2h6MzanOE4TecaOyiyc7l8H
	rOe6JPWFVmT0UrQtnySeKQTrfbBbfmyre2MbqTknQKNx5Wk9+n3Ik74JgzCjpJZ8mDTbEBNrQy+
	yoZik6W2zIRrDMWuJjAvW5nCNzijYfm9YtFkkR0kK5XDsJ1W4QpWDdxt1JwOA5EIvlPGGtxvb8w
	IxLQcDqtG9r+GalBpG0oTYrcDqDib94xqd+EEhBTVyxC2MDjBJy7thFbm6KE/FbF1WPrhu5ZhZv
	7Xx2yBYk4ZEqgeUB+4hPYqicE8DTT2/YAe5XVlueBBfEFlCVNNvzmAdIj+C+HTNypGLwX6yA4hQ
	dvh284lxp3plorr48s
X-Google-Smtp-Source: AGHT+IGemvX5W+7cNu+/fYMuzoT9IV7eJMQ9HN7J6El6QbJ0mh0x3X7WIlEDnhHX9DTKeesGfgSayQ==
X-Received: by 2002:a05:600c:1d1d:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-47d19532f48mr217783085e9.5.1766755037373;
        Fri, 26 Dec 2025 05:17:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272e46fsm434235755e9.4.2025.12.26.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 05:17:17 -0800 (PST)
Date: Fri, 26 Dec 2025 16:17:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
Message-ID: <202512251923.GDSbVal1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4@oss.qualcomm.com>
Message-ID: <20251226131714.q29fH8P9c4Q61hx9fMGmDvG2jpsWlTkKMAbDat9bk1E@z>

Hi Jie,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-Refactoring-ctcu_get_active_port-and-make-it-generic/20251224-171604
base:   47b7b5e32bb7264b51b89186043e1ada4090b558
patch link:    https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4%40oss.qualcomm.com
patch subject: [PATCH v9 2/8] coresight: tmc: add create/clean functions for etr_buf_list
config: arm-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251923.GDSbVal1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512251923.GDSbVal1-lkp@intel.com/

smatch warnings:
drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing freed memory 'new_node' (line 1991)
drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing zero to 'PTR_ERR'

vim +/new_node +1992 drivers/hwtracing/coresight/coresight-tmc-etr.c

34af91eeb7e78e Jie Gan 2025-12-24  1959  int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
34af91eeb7e78e Jie Gan 2025-12-24  1960  {
34af91eeb7e78e Jie Gan 2025-12-24  1961  	struct etr_buf_node *new_node;
34af91eeb7e78e Jie Gan 2025-12-24  1962  	struct etr_buf *sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1963  	int i = 0, ret = 0;
34af91eeb7e78e Jie Gan 2025-12-24  1964  
34af91eeb7e78e Jie Gan 2025-12-24  1965  	/* We dont need a list if there is only one node */
34af91eeb7e78e Jie Gan 2025-12-24  1966  	if (num_nodes < 2)
34af91eeb7e78e Jie Gan 2025-12-24  1967  		return -EINVAL;
34af91eeb7e78e Jie Gan 2025-12-24  1968  
34af91eeb7e78e Jie Gan 2025-12-24  1969  	/* We expect that sysfs_buf in drvdata has already been allocated. */
34af91eeb7e78e Jie Gan 2025-12-24  1970  	if (drvdata->sysfs_buf) {
34af91eeb7e78e Jie Gan 2025-12-24  1971  		/* Directly insert the allocated sysfs_buf into the list first */
34af91eeb7e78e Jie Gan 2025-12-24  1972  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
34af91eeb7e78e Jie Gan 2025-12-24  1973  		if (IS_ERR(new_node))
34af91eeb7e78e Jie Gan 2025-12-24  1974  			return PTR_ERR(new_node);
34af91eeb7e78e Jie Gan 2025-12-24  1975  
34af91eeb7e78e Jie Gan 2025-12-24  1976  		new_node->sysfs_buf = drvdata->sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1977  		new_node->is_free = false;
34af91eeb7e78e Jie Gan 2025-12-24  1978  		list_add(&new_node->node, &drvdata->etr_buf_list);
34af91eeb7e78e Jie Gan 2025-12-24  1979  		i++;
34af91eeb7e78e Jie Gan 2025-12-24  1980  	}
34af91eeb7e78e Jie Gan 2025-12-24  1981  
34af91eeb7e78e Jie Gan 2025-12-24  1982  	while (i < num_nodes) {
34af91eeb7e78e Jie Gan 2025-12-24  1983  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
34af91eeb7e78e Jie Gan 2025-12-24  1984  		if (IS_ERR(new_node)) {
34af91eeb7e78e Jie Gan 2025-12-24  1985  			ret = PTR_ERR(new_node);
34af91eeb7e78e Jie Gan 2025-12-24  1986  			break;
34af91eeb7e78e Jie Gan 2025-12-24  1987  		}
34af91eeb7e78e Jie Gan 2025-12-24  1988  
34af91eeb7e78e Jie Gan 2025-12-24  1989  		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
34af91eeb7e78e Jie Gan 2025-12-24  1990  		if (IS_ERR(sysfs_buf)) {
34af91eeb7e78e Jie Gan 2025-12-24 @1991  			kfree(new_node);
34af91eeb7e78e Jie Gan 2025-12-24 @1992  			ret = PTR_ERR(new_node);

s/new_node/sysfs_buf/

34af91eeb7e78e Jie Gan 2025-12-24  1993  			break;
34af91eeb7e78e Jie Gan 2025-12-24  1994  		}
34af91eeb7e78e Jie Gan 2025-12-24  1995  
34af91eeb7e78e Jie Gan 2025-12-24  1996  		/* We dont have a available sysfs_buf in drvdata, setup one */
34af91eeb7e78e Jie Gan 2025-12-24  1997  		if (!drvdata->sysfs_buf) {
34af91eeb7e78e Jie Gan 2025-12-24  1998  			drvdata->sysfs_buf = sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1999  			new_node->is_free = false;
34af91eeb7e78e Jie Gan 2025-12-24  2000  		} else
34af91eeb7e78e Jie Gan 2025-12-24  2001  			new_node->is_free = true;
34af91eeb7e78e Jie Gan 2025-12-24  2002  
34af91eeb7e78e Jie Gan 2025-12-24  2003  		new_node->sysfs_buf = sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  2004  		list_add(&new_node->node, &drvdata->etr_buf_list);
34af91eeb7e78e Jie Gan 2025-12-24  2005  		i++;
34af91eeb7e78e Jie Gan 2025-12-24  2006  	}
34af91eeb7e78e Jie Gan 2025-12-24  2007  
34af91eeb7e78e Jie Gan 2025-12-24  2008  	/* Clean the list if there is an error */
34af91eeb7e78e Jie Gan 2025-12-24  2009  	if (ret)
34af91eeb7e78e Jie Gan 2025-12-24  2010  		tmc_clean_etr_buf_list(drvdata);
34af91eeb7e78e Jie Gan 2025-12-24  2011  
34af91eeb7e78e Jie Gan 2025-12-24  2012  	return ret;
34af91eeb7e78e Jie Gan 2025-12-24  2013  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

