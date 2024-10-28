Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D26017CA1B
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104549; cv=none; b=ss09AyM6I+YhqHr+oVCnNEfaafJ9bGRmwVsPnR3q9W86BdLoHgVRRZ7sYHgVd/tWDLUtdOFRVdHML7sbzGWs9iknstWsBIIHnxNUmVo2+ki6S2NVMiupVRVbn608hXICcw2ZNf6xl5S5d96SnIGm4++IdV1AxF3h0Tly8NtxX+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104549; c=relaxed/simple;
	bh=P8lI1lay1x+GaaB2apksJXWv2VLbTRlDo04+gH+Wl98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J6zKUXnI8WCEiJwtT6DfJVSRCth103ngNHupLO+CP3JBOz8aW76ILNP99L3OiECskambdOqgQwWEIS19Yb9mjdPiHqbJN0CAJ8EoaJ/QdPhpvkzcEVMfC88KeoNd0ig6oObEuNtbl14YhfhHxhNsQPeT0xN2i1wZJECrBPDS0fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mClUavq1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mClUavq1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d3ecad390so3643080f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730104545; x=1730709345; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u31EBV70pjXiqnYAeflEhLBiqLsm8DBZP0IlSJFiLBM=;
        b=mClUavq1OwvdQErcMxR8F1ZidyLQOgUDzKrCbGeL5kp9i5EA4OWVgrRI4ucqqBwFUj
         dxUofE1UBPPMzt/mu7ufH4m6PK3QYqP9ICQYH6kJMK4kQM+1V/pCnsrHLM0cji2UNIqM
         wHcVHElvFdtLCnv2iCsKLu0OgO6MN8n086+LbI9K0jOwAN1qdfEiuG8abUYnjGf1NlYp
         AcdXirL8skHQYDG/7s+8R+UYD5EVb6cDuzp7wWstPrVkFrBZwa3Z1iP8ieMQeLzvavOI
         mq5VeHJLCE9xJ+S87l7oq3bTxFH9RYlexelALD3eL21DOK62SeqhRVFIkR+wHmiTd71V
         LbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104545; x=1730709345;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u31EBV70pjXiqnYAeflEhLBiqLsm8DBZP0IlSJFiLBM=;
        b=ghBi02l1pJiLDdTwHvkHdo5ManD/rg3Y84BqPWX73INVGNuy+XIwJlZDdWbMJSkgDb
         SgiApUYlurt3HfcTwpWq70OhtbuA1dSzjVIN9dsZO0a3Gp949+2aOIlE7bIzKxX+6XuB
         y91pUa9zXZn7/Nh7m3w21YYQsIAym7M+Qp1EhPu8tuBVgz6yGSPYXgJBHKc6gzi2xGId
         SUSbfocpAy0tZD7Cp+bl7BYYZA4rJ84BZ40EGPBl5tBGgzPMU3bZiW1+OOfAxMq+zve4
         nRq+KcIgMuxJwqac4sEgcs+/A6xahZ8FTTZ8Kx5k7I8diJyDh/sUA7vSf66K4iq8VA2B
         Xkfg==
X-Gm-Message-State: AOJu0YxOuvKUlarh6Wm6fttvGtXll+mtFkZjUjplB1Vg4TQNSww+IlYx
	YFHMfoOgjL5quzipvErGIHUyyL4ni+ie8IWRYpGLTdqGhuNOHlkAIh6CEmGEbV0r0JXZJMrWjeT
	9azs=
X-Google-Smtp-Source: AGHT+IG7V2/KyJh3HaaT1kGnOmZdo9MCVq5OCETyqzWB69NHishESA/bMptAKAS3tkCmFkY12dYJRQ==
X-Received: by 2002:a5d:6a02:0:b0:376:dbb5:10c2 with SMTP id ffacd0b85a97d-38060f56d0fmr5400857f8f.29.1730104544865;
        Mon, 28 Oct 2024 01:35:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9d008sm8773854f8f.107.2024.10.28.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:35:44 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:35:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ben Chuang <ben.chuang@genesyslogic.com.tw>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: [ulfh-mmc:next 49/61] drivers/mmc/host/sdhci-uhs2.c:436
 sdhci_uhs2_do_detect_init() error: we previously assumed 'host->ops' could
 be null (see line 416)
Message-ID: <fbbdcf40-d6ab-42e7-8e26-f1864368a7b5@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   3c0946b6a378fb92658aabcda5c70ea3e83143bf
commit: 379e4dc5b68a6642fc13b94543be33307ed09704 [49/61] mmc: sdhci-uhs2: add pre-detect_init hook
config: arm-randconfig-r071-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271835.tqz9s9JV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410271835.tqz9s9JV-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-uhs2.c:436 sdhci_uhs2_do_detect_init() error: we previously assumed 'host->ops' could be null (see line 416)

vim +436 drivers/mmc/host/sdhci-uhs2.c

4f412f7918048c Victor Shih 2024-10-18  410  static int sdhci_uhs2_do_detect_init(struct mmc_host *mmc)
4f412f7918048c Victor Shih 2024-10-18  411  {
4f412f7918048c Victor Shih 2024-10-18  412  	struct sdhci_host *host = mmc_priv(mmc);
4f412f7918048c Victor Shih 2024-10-18  413  
4f412f7918048c Victor Shih 2024-10-18  414  	DBG("Begin do uhs2 detect init.\n");
4f412f7918048c Victor Shih 2024-10-18  415  
379e4dc5b68a66 Ben Chuang  2024-10-18 @416  	if (host->ops && host->ops->uhs2_pre_detect_init)

host->ops probably can't be NULL here.  Smatch doesn't print a warning if it
can determine the check doesn't matter one way or another, but the kbuid bot
can't use cross function analysis (it's very slow and doesn't scale to the level
that kbuild bot needs).  I'm wondering if it's worth reporting these when they're
probably fine.

379e4dc5b68a66 Ben Chuang  2024-10-18  417  		host->ops->uhs2_pre_detect_init(host);
379e4dc5b68a66 Ben Chuang  2024-10-18  418  
4f412f7918048c Victor Shih 2024-10-18  419  	if (sdhci_uhs2_interface_detect(host)) {
4f412f7918048c Victor Shih 2024-10-18  420  		pr_warn("%s: cannot detect UHS2 interface.\n", mmc_hostname(host->mmc));
4f412f7918048c Victor Shih 2024-10-18  421  		return -EIO;
4f412f7918048c Victor Shih 2024-10-18  422  	}
4f412f7918048c Victor Shih 2024-10-18  423  
4f412f7918048c Victor Shih 2024-10-18  424  	if (sdhci_uhs2_init(host)) {
4f412f7918048c Victor Shih 2024-10-18  425  		pr_warn("%s: UHS2 init fail.\n", mmc_hostname(host->mmc));
4f412f7918048c Victor Shih 2024-10-18  426  		return -EIO;
4f412f7918048c Victor Shih 2024-10-18  427  	}
4f412f7918048c Victor Shih 2024-10-18  428  
4f412f7918048c Victor Shih 2024-10-18  429  	/* Init complete, do soft reset and enable UHS2 error irqs. */
4f412f7918048c Victor Shih 2024-10-18  430  	sdhci_uhs2_reset(host, SDHCI_UHS2_SW_RESET_SD);
4f412f7918048c Victor Shih 2024-10-18  431  	sdhci_uhs2_clear_set_irqs(host, SDHCI_INT_ALL_MASK, SDHCI_UHS2_INT_ERROR_MASK);
4f412f7918048c Victor Shih 2024-10-18  432  	/*
4f412f7918048c Victor Shih 2024-10-18  433  	 * N.B SDHCI_INT_ENABLE and SDHCI_SIGNAL_ENABLE was cleared
4f412f7918048c Victor Shih 2024-10-18  434  	 * by SDHCI_UHS2_SW_RESET_SD
4f412f7918048c Victor Shih 2024-10-18  435  	 */
4f412f7918048c Victor Shih 2024-10-18 @436  	sdhci_writel(host, host->ier, SDHCI_INT_ENABLE);
                                                             ^^^^
If host->ops were NULL it would crash here

4f412f7918048c Victor Shih 2024-10-18  437  	sdhci_writel(host, host->ier, SDHCI_SIGNAL_ENABLE);
4f412f7918048c Victor Shih 2024-10-18  438  
4f412f7918048c Victor Shih 2024-10-18  439  	return 0;
4f412f7918048c Victor Shih 2024-10-18  440  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

