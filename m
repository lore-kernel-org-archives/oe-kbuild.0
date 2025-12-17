Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DF935BDC0
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977612; cv=none; b=TG1JB+1fW3w4LlFZB6r21nFjJRDYbT5luAlXyZwluBbaGXfU1XFSXss3kT3jCnEul+V0sEXkOozBb4lBm+eBN5oKNnmwxDVB/laU3Fmf8Bi1juqxK1XE4vjyOVB1+D9plut4nP17EudpxvrAr0RMhKCuvPL3hScp/tkIJKIz/b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977612; c=relaxed/simple;
	bh=pLRdhzvSu88pSVWDOngVnhVPoTuGAyA0SiWedY0Wg4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bWaI6mU+RD1YmJBakye7+dSOXEhKPuMtuyT8p44oY6P+pKKnJoRxXzfspDOgftov/XooD4jgnWie3GY0Psmbbxl38Zb5P8/SXjN7JZDI1qIX7RLznj+e0679OlEHg61mAWOuOHzIWLd+GBcQUQyJhCKJ5NjYg/sOtiqIOL0WEpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrQmmqSC; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrQmmqSC"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-42fbc305552so3418629f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 05:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765977607; x=1766582407; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fTIw9DM0cHhKePwv9AKGgFw92mWPgI0fhPn3ZfdMOEE=;
        b=IrQmmqSC1/8pDMHINe97lDpYE7l7LIUYQO7uY6owaGX+Uoag7eQM/qS9IKmPYUoiWp
         NEwWKX3meTSbxY/pyrYX5ZFn9GB+weaNhQgn4sEtAMo6tOgYxxaC/w//B+fC4kLSE32R
         1XCqQbiUwykeNlLAFdCNyktw878RKs6I3RD8Bkp6X35K50DdFSX8QWNBGt2fTqaVjX4E
         +P7cCQoYsHlDbIrw59KJ+TRvSHLullWZgrJ2URM46bTWfyZx7v86LoCDVynAWWEUesUn
         77GOForwjlzmIrsvbN3iaWzqcjosbjSDUDiNXjCpmg4ek7meh354vXeesc5uwvbFyT6f
         8YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977607; x=1766582407;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTIw9DM0cHhKePwv9AKGgFw92mWPgI0fhPn3ZfdMOEE=;
        b=Q3GjNDD4uqYKPz0VefXrXScVyLi5FKiGn/biB4N+lKcfK3vW94VxfKr2exoHzcRGPS
         r2yD8YlvLXUM3GAEiJA3kJ407k5wMH+53sjPJB1gP9FA41joovwvlj2PrMKSvn+2NAQu
         tud4eaOHAVRPioo/WcIK9y76mJtWqsnPq0pOeLSzeaWMEtqFKV1IlPJzQqhvcuYEmY+h
         PR8QubcAwCBZDmoSbUSmA9KpwOljjt7VQEFx70kOu/CrKxYMuI9s3PDpw4v+kTtBXsfP
         d6k37TxQM7ClAmOzQm1v4gqPjLrRNn++p0wmLMd/hDfNtHVwo3N1HuuQBgTeVlI+K90B
         Vpcg==
X-Gm-Message-State: AOJu0Ywj5yAVgJLCOtIWK6Z/I6bF82iERY48vMV4j/wsvzEIk1eepxwX
	zdaUdJX148ZpRIF1Qj8m1vBW68QEdyjZ22UhLVeTdh/jSmN8BEJUBB2uFb4/0hKYFi+MFKXqX64
	CUHR2
X-Gm-Gg: AY/fxX6M9oz45anpK5xh8xwhnFR1Hpr1CKVZlpJfr6V7M4gciUuyptGYcJoovJd/g79
	LvxQ2QVjh6TAI9wB9ZrKN1FnbS7XO3uG2bWTg6T9Ejqre4Ht4E45Z4sxfrFMo9M0IB0pKuJgzpY
	rK88VwUm3uwyv7dkGLP6PKCANgMT0vya6YwuciLbnkO5jR+PlXZTZMiAy/eWyiY8TdsMcR18Y6X
	G7KvuWK5QNgcn9NQJUVlpUDF8P3Fn6WPIvY8YPvumOftbs6t+xCsY88Icw62NAscWzlmpkwZWBw
	f8CQ+87WbKCK/32oyiIoUGvnlcdymQManKUBcH6ptfQMwXnCtHgTlf4cOZxVr+Os9P2xdqGFcaI
	nyV5klaHM0sQbevpKjboUUotXnTsXIq7VU1mpt8oCVIMfFRCQ81SGo5MOWpUAXYeS8fl/WV4i85
	QzCiLtbsvu96nkBTAk
X-Google-Smtp-Source: AGHT+IF3jRL5fJna4tVheIKFH8bDLQB3AmOSU6niu7Q4gpFEYCm2UZcftl4yU5UCX3bXSvWKuxd2NA==
X-Received: by 2002:a05:6000:4383:b0:430:f255:14b3 with SMTP id ffacd0b85a97d-430f255186bmr16405062f8f.43.1765977606681;
        Wed, 17 Dec 2025 05:20:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ad4ee46sm4659067f8f.0.2025.12.17.05.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 05:20:06 -0800 (PST)
Date: Wed, 17 Dec 2025 16:20:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>
Subject: drivers/mailbox/mailbox-mchp-ipc-sbi.c:187
 mchp_ipc_cluster_aggr_isr() error: uninitialized symbol 'hartid'.
Message-ID: <202512171533.CDLdScMY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251217132002.ckekJQaHK0iaxfrh_FKHwMIbiZyBWJa-rPeCkIgsYG0@z>

Hi Valentina,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: c1382852330ee2e78d884bab2da25b880488fa1c riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
config: riscv-randconfig-r071-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171533.CDLdScMY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512171533.CDLdScMY-lkp@intel.com/

Old smatch warnings:
drivers/mailbox/mailbox-mchp-ipc-sbi.c:422 mchp_ipc_probe() warn: passing zero to 'dev_err_probe'

vim +/hartid +187 drivers/mailbox/mailbox-mchp-ipc-sbi.c
   410  static int mchp_ipc_probe(struct platform_device *pdev)
   411  {
   412          struct device *dev = &pdev->dev;
   413          struct mchp_ipc_mbox_info ipc_info;
   414          struct mchp_ipc_sbi_mbox *ipc;
   415          struct mchp_ipc_sbi_chan *priv;
   416          bool irq_avail = false;
   417          int ret;
   418          u32 chan_id;
   419  
   420          ret = sbi_probe_extension(SBI_EXT_MICROCHIP_TECHNOLOGY);
   421          if (ret <= 0)
   422                  return dev_err_probe(dev, ret, "Microchip SBI extension not detected\n");
                                                  ^^^
sbi_probe_extension() returns zero on error which is success here.

   423  
   424          ipc = devm_kzalloc(dev, sizeof(*ipc), GFP_KERNEL);
   425          if (!ipc)
   426                  return -ENOMEM;
   427  
   428          platform_set_drvdata(pdev, ipc);
   429  
   430          ipc->buf_base = devm_kmalloc(dev, sizeof(struct mchp_ipc_mbox_info), GFP_KERNEL);
   431          if (!ipc->buf_base)
   432                  return -ENOMEM;
   433  
   434          ipc->buf_base_addr = __pa(ipc->buf_base);
   435  
   436          ret = mchp_ipc_sbi_send(SBI_EXT_IPC_PROBE, ipc->buf_base_addr);
   437          if (ret < 0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

