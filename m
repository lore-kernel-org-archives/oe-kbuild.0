Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298AFC15
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZ49E9jm"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-991c786369cso606184066b.1
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Nov 2023 00:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699258932; x=1699863732; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YVp503bE1ru4IFxCLeuc6godEKHcqzF2XGlSQXQ8Upo=;
        b=qZ49E9jm9J64jDDlpsb4FqZhPB8Eo+WEvDr6GIyqIOOFCmRYqjbvgPwCRA68lUGqT5
         HJ6eo55nAvBDTxNlsVSLpzQsIPoQvGP1eGYRSsZQhWGWKpy6uq2ioqA+4UomoeXZHgBM
         +qjcluQ5v/y1FKDi/SXIgO5VkzHG+m5DPZ+VKFmg4NkZNvjMMUl3TXznMoLaSlcIBKpV
         YsjnRmhHqc6++QMTyNVWftzPAzADIViPV9fj+weGtXyAnRkMc/1eaL9W4mCnXiDo+lUI
         lOdsEy/IlW1R9hImKOO2GDhW3Hk24jE3ZdgAzc1wIFRR7ZvOz8SC3+AkO2KFAHpqyrzf
         Y5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699258932; x=1699863732;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVp503bE1ru4IFxCLeuc6godEKHcqzF2XGlSQXQ8Upo=;
        b=ZgcoCf41R1C8s/GDUqbsX+k6tKYTEigtisHara5Pno1cWHh+BdxgfLXn72k3WUPWit
         BZ9JHUIfjGNiaCvi3gdO8quUlzSVsxVIpcYsT89dOLLaCi0RubacLizaFCSQpQrHXtil
         j1/kx5k4uJu9Vzn+XO/Ckom66BoKeQcvWzZIc7mMcajDBzG/+Hkn3NUGnVBbXl4LhYq0
         Sg71eZ9npzSnsLuHuibWmwJgJh+OdfDuJUI/XqexRc056pf+40VFE3Ve1l86zmohr3il
         yzdqqSdbud4NKBVjNoMjUkRqeoQv5vDs7LNMSgBj6+HH2m/g/F8qXsAW44lOmLcbQomp
         syiQ==
X-Gm-Message-State: AOJu0Yw0U4wu7lAPKDXzPCriAl76+UHQhdL+9h8bXgyu/xPqa3HId1Jx
	cjtfHHBYsGAgVM+a2QF5dg8D3XU7zNdwtYVAZvU=
X-Google-Smtp-Source: AGHT+IHYFBWYigEohSXMoPCbFpHMyX9vKMbrZF15MfZxETJjjg08YOa343fiHuknpDiWHy7Znuw1Gg==
X-Received: by 2002:a17:907:318e:b0:9dd:7536:2b0 with SMTP id xe14-20020a170907318e00b009dd753602b0mr6406091ejb.50.1699258931783;
        Mon, 06 Nov 2023 00:22:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s19-20020a170906455300b009a1b857e3a5sm3883824ejq.54.2023.11.06.00.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 00:22:11 -0800 (PST)
Date: Mon, 6 Nov 2023 11:22:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 33/84] drivers/ufs/core/ufshcd.c:2294
 ufshcd_hba_capabilities() warn: missing error code? 'err'
Message-ID: <d37eb167-926f-41e5-b52d-0e05c3c82518@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   7bec8a8180669a95c44a767fa76f2a3dd3c46220
commit: 996bbaea824f317c30977c4967f84b10feb3cf40 [33/84] FROMGIT: scsi: ufs: core: Introduce multi-circular queue capability
config: i386-randconfig-141-20231104 (https://download.01.org/0day-ci/archive/20231104/202311041439.bhMvaFNy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311041439.bhMvaFNy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202311041439.bhMvaFNy-lkp@intel.com/

New smatch warnings:
drivers/ufs/core/ufshcd.c:2294 ufshcd_hba_capabilities() warn: missing error code? 'err'

Old smatch warnings:
drivers/ufs/core/ufshcd.c:5356 ufshcd_uic_cmd_compl() error: we previously assumed 'hba->active_uic_cmd' could be null (see line 5344)
drivers/ufs/core/ufshcd.c:8783 ufshcd_setup_clocks() warn: 'clki->clk' from clk_prepare_enable() not released on lines: 8763.

vim +/err +2294 drivers/ufs/core/ufshcd.c

27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2273  static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2274  {
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2275  	int err;
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2276  
b873a27538dff5 drivers/scsi/ufs/ufshcd.c Seungwon Jeon      2013-06-26  2277  	hba->capabilities = ufshcd_readl(hba, REG_CONTROLLER_CAPABILITIES);
6554400d6f66b9 drivers/ufs/core/ufshcd.c Yoshihiro Shimoda  2022-06-03  2278  	if (hba->quirks & UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS)
6554400d6f66b9 drivers/ufs/core/ufshcd.c Yoshihiro Shimoda  2022-06-03  2279  		hba->capabilities &= ~MASK_64_ADDRESSING_SUPPORT;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2280  
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2281  	/* nutrs and nutmrs are 0 based values */
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2282  	hba->nutrs = (hba->capabilities & MASK_TRANSFER_REQUESTS_SLOTS) + 1;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2283  	hba->nutmrs =
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2284  	((hba->capabilities & MASK_TASK_MANAGEMENT_REQUEST_SLOTS) >> 16) + 1;
945c3cca05d783 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  2285  	hba->reserved_slot = hba->nutrs - 1;
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2286  
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2287  	/* Read crypto capabilities */
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2288  	err = ufshcd_hba_init_crypto_capabilities(hba);
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2289  	if (err)
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2290  		dev_err(hba->dev, "crypto setup failed\n");
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2291  
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2292  	hba->mcq_sup = FIELD_GET(MASK_MCQ_SUPPORT, hba->capabilities);
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2293  	if (!hba->mcq_sup)
996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13 @2294  		return err;

"err" is zero here.  Presumably it should have been an error code.

996bbaea824f31 drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2295  
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2296  	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2297  	hba->ext_iid_sup = FIELD_GET(MASK_EXT_IID_SUPPORT,
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2298  				     hba->mcq_capabilities);
2be21deeeb950c drivers/ufs/core/ufshcd.c Asutosh Das        2023-01-13  2299  
27b2ed4395fee2 drivers/scsi/ufs/ufshcd.c Eric Biggers       2020-07-14  2300  	return err;

"err" is zero here as well.  Better to return 0;  More readable.

7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  2301  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

