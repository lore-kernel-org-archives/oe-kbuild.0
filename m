Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2E41D223C
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883774; cv=none; b=rXKNUuUCUtGy7SYRz+dAjJecTARgjeuev7PelJgvHomLFlF+fN2rbbDRSlX+xuOG9bTsUAXg2txKihoDvkwcFS8Vz1eKJET5GkkdIuPfVZJkKMXc8kyeAOmq5nOUSYZfWvV15T8xPnxiimBbuq+TDnH7WoaUSKro9PDmGgEe9IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883774; c=relaxed/simple;
	bh=wkiSx2L3FRGCekqQ7QLIWons3eW0fV1skB3j390UhM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZfNjw4pa0c2BC/qlqfzK8eMCAY8rlSKYU05RruM/k4Nsfkn/nAeBLsZSxkFNPtLQAPKTOLuvD4gT+TYzjlHj6M4SPWZdR9XGoMIoYAO6Lpgu/vR9PBxkjX8EMhP+etud5aSe8NiKWIRNiLT4MSB6ZmZqnWnrgzNya3/h4zrjfyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VeD76St7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VeD76St7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so830770766b.0
        for <oe-kbuild@lists.linux.dev>; Wed, 06 Nov 2024 01:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730883770; x=1731488570; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhCN9N2PIYL8fJCfWyOzbPk8OoOeq1ahkwvsQIC+958=;
        b=VeD76St7xVurkb2vt8uRN+2Ltfr+e5PyxLaDDqP8CxQ0xNe/gG17yItg2BO8xCfxGZ
         8qw8eHG++hN3qCkDaT6tdrIgm8hLF/5egTtF0clzGEP4MgwxH4mbjww2HovbdciG5sQg
         mK62HPjNsaFN9LtWQyqofIqPXcdOS+9KXWAhdvchus7YkFh2SqSpiqLndnz6aqE22bh5
         ywhqmrlsU9gYuzbnatc7dbticYQ6SlQfMzCvF83+Buz55o5ACTrfhI/AbLFtTruuJcaM
         tRh02Jr/Mu1tKvexAeH2Es4VUvnb5OWBCj055t9paQhkiTeZTpHizadkhtzr7lPsiXSn
         pInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883770; x=1731488570;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhCN9N2PIYL8fJCfWyOzbPk8OoOeq1ahkwvsQIC+958=;
        b=dgEqXVMFgYvdEIhlVGSnkHPB5ocSauH843rzRp7b/IqebDy1fzq5LZdqQ784XPm89a
         G23n6YaEaLao2MWPKeOO8BcZ95abxPAaDswWlfll/07KZ8QZQKJkGaLCLbMcbsoVC111
         NFLMaoIfiNQX2t4bWCaRuwr9+nej2S6YPD5cIbLLGBovcmnvqJl2ed9dm6mjT+fq/n3r
         NNExYzArsGQh8mI+eFs/6v5xFh78U+mmJxTFJiB5qrCYM0/ZZsqnHpdg6+kGsqYMTyZM
         ORFHWPoJn24jjNOexphZtDzvFGLVn4ng4G4lZ7k1eBocrCEkYAdYnIU0jRqPANrd/192
         ygSQ==
X-Gm-Message-State: AOJu0YyC0u6qeCAgfZY8xrAubeZU9OpkZ7LPhOKkYtcApgfrMPA/qMJX
	ilnNJfuCWod/XLQmQvONeho2pEX/ODDC+RHxqI3Oujmlwnoog4DHXx+uCh5cTNFQE4TYk78eSP3
	mrRMnEQ==
X-Google-Smtp-Source: AGHT+IGOVugMsz5XLxUytdJ3KiPUlh7M0Bz5RDuNDWXr9lWW21TQ/brUpX453gS7dhPjhTkiCvXTcA==
X-Received: by 2002:a17:907:9813:b0:a9a:1253:4d81 with SMTP id a640c23a62f3a-a9e50b56a34mr1774011666b.47.1730883769861;
        Wed, 06 Nov 2024 01:02:49 -0800 (PST)
Received: from localhost ([89.101.241.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16e0d27sm246047366b.81.2024.11.06.01.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:02:49 -0800 (PST)
Date: Wed, 6 Nov 2024 12:02:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ira Weiny <ira.weiny@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [weiny2:dcd-v4-2024-11-05 15/28] drivers/cxl/core/port.c:209
 mode_store() error: buffer overflow 'cxl_decoder_mode_names' 12 <= 12
Message-ID: <630a7899-b4ac-409b-81ad-a2936e0400a6@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-11-05
head:   dba3b28deacf7cfa58557386a37dc0aceb7dcb64
commit: d3250f65fdd004a774008ed2c989cda1053fb738 [15/28] cxl/port: Add endpoint decoder DC mode support to sysfs
config: i386-randconfig-141-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061211.ULVM47Ie-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411061211.ULVM47Ie-lkp@intel.com/

New smatch warnings:
drivers/cxl/core/port.c:209 mode_store() error: buffer overflow 'cxl_decoder_mode_names' 12 <= 12
drivers/cxl/core/port.c:213 mode_store() error: testing array offset 'mode' after use.

vim +/cxl_decoder_mode_names +209 drivers/cxl/core/port.c

cf880423b6a059 Dan Williams  2022-05-23  201  static ssize_t mode_store(struct device *dev, struct device_attribute *attr,
cf880423b6a059 Dan Williams  2022-05-23  202  			  const char *buf, size_t len)
cf880423b6a059 Dan Williams  2022-05-23  203  {
cf880423b6a059 Dan Williams  2022-05-23  204  	struct cxl_endpoint_decoder *cxled = to_cxl_endpoint_decoder(dev);
cf880423b6a059 Dan Williams  2022-05-23  205  	enum cxl_decoder_mode mode;
cf880423b6a059 Dan Williams  2022-05-23  206  	ssize_t rc;
cf880423b6a059 Dan Williams  2022-05-23  207  
d3250f65fdd004 Navneet Singh 2023-07-05  208  	for (mode = 0; mode < CXL_DECODER_MODE_MAX; mode++)
d3250f65fdd004 Navneet Singh 2023-07-05 @209  		if (sysfs_streq(buf, cxl_decoder_mode_names[mode]))
                                                                             ^^^^^^^^^^^^^^^^^^^^^^
I don't have any context outside this email but presumably
CXL_DECODER_MODE_MAX increased and the array didn't get larger.

d3250f65fdd004 Navneet Singh 2023-07-05  210  			break;
d3250f65fdd004 Navneet Singh 2023-07-05  211  
d3250f65fdd004 Navneet Singh 2023-07-05  212  	if (mode == CXL_DECODER_NONE ||
d3250f65fdd004 Navneet Singh 2023-07-05 @213  	    mode == CXL_DECODER_DEAD ||
d3250f65fdd004 Navneet Singh 2023-07-05  214  	    mode == CXL_DECODER_MODE_MAX)
d3250f65fdd004 Navneet Singh 2023-07-05  215  		return -EINVAL;
d3250f65fdd004 Navneet Singh 2023-07-05  216  
d3250f65fdd004 Navneet Singh 2023-07-05  217  	/* Not yet supported */
d3250f65fdd004 Navneet Singh 2023-07-05  218  	if (mode >= CXL_DECODER_MIXED)
cf880423b6a059 Dan Williams  2022-05-23  219  		return -EINVAL;
cf880423b6a059 Dan Williams  2022-05-23  220  
cf880423b6a059 Dan Williams  2022-05-23  221  	rc = cxl_dpa_set_mode(cxled, mode);
cf880423b6a059 Dan Williams  2022-05-23  222  	if (rc)
cf880423b6a059 Dan Williams  2022-05-23  223  		return rc;
cf880423b6a059 Dan Williams  2022-05-23  224  
cf880423b6a059 Dan Williams  2022-05-23  225  	return len;
cf880423b6a059 Dan Williams  2022-05-23  226  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

