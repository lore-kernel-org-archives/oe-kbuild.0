Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529723976A9
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Jul 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929735; cv=none; b=qlDA4mMFNyiYe7hYqZQPpQi7oBsrG5NFH2/pLJhxC1I+zkjRECc624UJkOHBpRXYTlKtoviH9VaUK/vlxDJIe/2dFushSiMA7tVpN+5FRLKvl+NddTyuhdHp4KOIEw0XSNiVjq61r8H2d1UNODt5vRPEcPUWSy/WpBqmC4mOW14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929735; c=relaxed/simple;
	bh=YBViu0L7Y3M+FAeaoXSNZX/nBA4xH9FB/oynmKFOFLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TzWC4+YL4f2hTcUZIgLFZSxV8IcCEaarEE6MVrYlQevUR9HG/EXH3m8JuT2JoamnascnnRdH0FzkD7kr0VnKH7fM80wzalD7+F4PobI5c73Ekil7PA7ZqEUCM18r3rChawf+penOC2G1LeC/8L/XFh/+yFzbE2ZR9MDPMv1kk+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXSjpg3l; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXSjpg3l"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6a38d7904b7so1589231eaf.2
        for <oe-kbuild@lists.linux.dev>; Mon, 13 Jul 2026 01:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783929733; x=1784534533; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LPSAIQSZBXuoWaWQUOeEPOiMUfHrmEtpLurSEx2WFQ=;
        b=NXSjpg3lcBZ+7uT4CuHg/OSGpGfNgpqkK4BcqAe0ImXdb3KvcZ2/y6zZJy1BQxuNuS
         uofdhTfnHktaRGbfYTA5Y8MMDHK7F8mWTHP5pXGdkrB8fu4yhb6f7VHBPVR/kdHO8iMp
         FQO80fTOrqusXLGbnPiiKz5caWaWfCPBjGUBDUZH5oFGYy7MIRKTH8oBihYZjPkoVmvs
         xgn1uC8xxj4bfU4q9MJOcqHoajbgM8yIkCxCPxeqQaFyss+LS7WcSlafS+UxWMOiSlNy
         TqiEo2JAlg9hoUQf9GGiGi8QbB2yqtEgl/qWKRuSvLElDlWgBpKCtbCtSvyqJJHFKshq
         4wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929733; x=1784534533;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LPSAIQSZBXuoWaWQUOeEPOiMUfHrmEtpLurSEx2WFQ=;
        b=pTA7h6iA8c7Sx/06rc1lBEXaZq+AFdzoNm4A48sZubGLBVAuwAUwTggUF8cWpvTssC
         4q5TCwPUg5u66wcsuV6kJDYXWZOGlecciLIMk2XaZmDCV0eea8Ksdx3IOea4VDlqrA+E
         NR6cTjh5GcfPwEA+U5HtoTh5jWrUT/9tUR2APtyS1eAm7VH04gPSuwOsnbPb5fzBCKP1
         jKFI2u7P3FhlxtsrBM4ZvZpcjXTnWtwSRsZGHKNt/2mUIZsRIv9R4BuI/Mc+hIwwW3EP
         LB1l0IKZPMCN+QQ4HPGYAS0k5dXybee5No0ickv77sKNnKs6K1EuaYCQQyURy5zilluE
         Is7A==
X-Gm-Message-State: AOJu0Yw+KMNqpR9xKlNcR49+9R2GTuHFr5hFWFcVJYiWcP+XjMbh1cB7
	ZcqNCPYD/U9FLnT1iPpJUa0grdvRLdbthBoof5q0tc6gESMED5aWbqdkI1LpbJ7RaU4=
X-Gm-Gg: AfdE7cnx99594k3KUXUdlvdW7fRmKp1JS9uKQiJVJbNTlGLTiwMQ0UTXYg2GETWA2BC
	niq3cV/52E1mm7SB7cBlPvXtJ3jrPOBn/px3m/wUJ5GHhXOACTwBizIxUdXyIm7oOS3jAeaa6ZM
	mtcjebP1/ucWbhMpvC2c/bMd3II+GBB4QfrWxiyJv5x8CWuRPIFIFtGsBmGdB0NR42GMizdL5jC
	5JZ5blXYRSgRzxhVqhhHacnsbDws1dWlEgwQIoFPxEMab+M9Tfbp9H+MJA1jp8j8W42PByHrB1P
	/60UwBiarf/hufTxZJ5Bzho5v/WtIypOy+LYUcEAiHVVivcYQzHAOditNsR/6G7CM3kbNTUPMHG
	Kl9m+mN0O34Ms2NGmbcg3lPsOKj74rRVKxDfvlVa2+xtIqE6+JyZuoCNhLSGytE3V+1+c0a3L8H
	bagSBQ
X-Received: by 2002:a05:6820:5710:10b0:6a3:7701:660c with SMTP id 006d021491bc7-6a39a5c80camr2981797eaf.20.1783929732986;
        Mon, 13 Jul 2026 01:02:12 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm11549821fac.7.2026.07.13.01.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:02:11 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:02:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 5449/5655] drivers/spi/spi-geni-qcom.c:637
 spi_geni_init() warn: missing error code? 'ret'
Message-ID: <202607122241.qzP3QAXF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260713080206.IkxkIMcNIQ9_YNZWUF4Cc_aH8RNe70_J0f_aTVtaTxc@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: d8e9ea989acb54508477e4a8c9d9eaf8217e0081 [5449/5655] spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()
config: microblaze-randconfig-r071-20260711 (https://download.01.org/0day-ci/archive/20260712/202607122241.qzP3QAXF-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607122241.qzP3QAXF-lkp@intel.com/

New smatch warnings:
drivers/spi/spi-geni-qcom.c:637 spi_geni_init() warn: missing error code? 'ret'

Old smatch warnings:
drivers/spi/spi-geni-qcom.c:648 spi_geni_init() warn: missing error code? 'ret'

vim +/ret +637 drivers/spi/spi-geni-qcom.c

561de45f72bd5f Girish Mahadevan        2018-10-03  617  static int spi_geni_init(struct spi_geni_master *mas)
561de45f72bd5f Girish Mahadevan        2018-10-03  618  {
14cea92338a077 Uwe Kleine-König        2024-02-07  619  	struct spi_controller *spi = dev_get_drvdata(mas->dev);
561de45f72bd5f Girish Mahadevan        2018-10-03  620  	struct geni_se *se = &mas->se;
561de45f72bd5f Girish Mahadevan        2018-10-03  621  	unsigned int proto, major, minor, ver;
b59c122484ecb1 Vinod Koul              2021-10-20  622  	u32 spi_tx_cfg, fifo_disable;
b59c122484ecb1 Vinod Koul              2021-10-20  623  	int ret = -ENXIO;
561de45f72bd5f Girish Mahadevan        2018-10-03  624  
d8e9ea989acb54 Praveen Talari          2026-07-10  625  	PM_RUNTIME_ACQUIRE_IF_ENABLED(mas->dev, pm);
d8e9ea989acb54 Praveen Talari          2026-07-10  626  	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
d8e9ea989acb54 Praveen Talari          2026-07-10  627  	if (ret < 0) {
d8e9ea989acb54 Praveen Talari          2026-07-10  628  		dev_err(mas->dev, "Failed to resume and get %d\n", ret);
d8e9ea989acb54 Praveen Talari          2026-07-10  629  		return ret;
d8e9ea989acb54 Praveen Talari          2026-07-10  630  	}
561de45f72bd5f Girish Mahadevan        2018-10-03  631  
561de45f72bd5f Girish Mahadevan        2018-10-03  632  	proto = geni_se_read_proto(se);
d7f74cc31a89a4 Praveen Talari          2023-07-14  633  
8726bdcef62eac Yang Yingliang          2023-11-28  634  	if (spi->target) {
d7f74cc31a89a4 Praveen Talari          2023-07-14  635  		if (proto != GENI_SE_SPI_SLAVE) {
d7f74cc31a89a4 Praveen Talari          2023-07-14  636  			dev_err(mas->dev, "Invalid proto %d\n", proto);
d8e9ea989acb54 Praveen Talari          2026-07-10 @637  			return ret;

s/ret/-EINVAL/

d7f74cc31a89a4 Praveen Talari          2023-07-14  638  		}
d7f74cc31a89a4 Praveen Talari          2023-07-14  639  		spi_slv_setup(mas);
99cf351ee1c46b Viken Dadhaniya         2025-09-11  640  	} else if (proto == GENI_SE_INVALID_PROTO) {
99cf351ee1c46b Viken Dadhaniya         2025-09-11  641  		ret = geni_load_se_firmware(se, GENI_SE_SPI);
99cf351ee1c46b Viken Dadhaniya         2025-09-11  642  		if (ret) {
99cf351ee1c46b Viken Dadhaniya         2025-09-11  643  			dev_err(mas->dev, "spi master firmware load failed ret: %d\n", ret);
d8e9ea989acb54 Praveen Talari          2026-07-10  644  			return ret;
99cf351ee1c46b Viken Dadhaniya         2025-09-11  645  		}
d7f74cc31a89a4 Praveen Talari          2023-07-14  646  	} else if (proto != GENI_SE_SPI) {
561de45f72bd5f Girish Mahadevan        2018-10-03  647  		dev_err(mas->dev, "Invalid proto %d\n", proto);
d8e9ea989acb54 Praveen Talari          2026-07-10  648  		return ret;

Same.

561de45f72bd5f Girish Mahadevan        2018-10-03  649  	}
561de45f72bd5f Girish Mahadevan        2018-10-03  650  	mas->tx_fifo_depth = geni_se_get_tx_fifo_depth(se);
561de45f72bd5f Girish Mahadevan        2018-10-03  651  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

