Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC4F18631
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n0mMg+dm"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5537dd673e5so8012127a12.0
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jan 2024 01:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704275475; x=1704880275; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xz96zpZamnuctw20aOBbPKcLc59nkqAsmoJMPTjuCo=;
        b=n0mMg+dmGDmKNAZS1xQLyzGt72gTN/HrQjLhh6P6cx2NUGotJlDL+UTANQ1wohnQM5
         erkTTpDdZPGtAQxFSbQeCTb7PLimZCUrAZCMFsyKRXLQi/EfOF1kASHww4rmN5FmjC/s
         axk0lWS+yGxSdgA2iir2/FG0OSfna0QUlXIbllEff/yaHtYp/DE5gMuCEVjO3ufU7xWP
         aUkzo//qPcJg3i+/Q5wZUA/dx3L6xW8+IFZrU1UyfKA09NBHgx4X1HKfhD3tuqlQLFI3
         XUg2fKZatLp44kOCZ26AVpkaxsLYyO4+pFNlszgwOlePDlhqok/8NJ8FpMG52gwG0sv+
         D8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704275475; x=1704880275;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9xz96zpZamnuctw20aOBbPKcLc59nkqAsmoJMPTjuCo=;
        b=hsJmS68Q8t0rxwdV52W9cYoqhfkKsSjwbRSotOAGKeiD24WMFmIxQdlu6n8zx0ZjdY
         BNenqhohxq3qCc/Oi93o8sC1Ud4ZNg2aceTL100etbTjr0tNqxNVTXd/attTEGdL+Ar0
         CzufOveVRVxrruVuZ5RN3p304QZYRic5PYx+PUirv7GAAwPtekXUUXOvPk06SvwMzxRf
         rGnCyV9/Wto2itsapXEFUvq138q97ZT58tVvU5mDxX4OV0djJLU3lbKEID1Y0y5zRrA6
         m9fU/5CK19hBJbqwHa1flZBNeInx3zAm65KUOpq/8Jqe7X2GLRcGyipI/e6fFepGO6hG
         bwNg==
X-Gm-Message-State: AOJu0Yz9TzrgU6ZnYRtrn8IOfDvXzQqjXvnglXRm6KHTgZVpoXyq4sLj
	0CzLILuAyMu2HD98tFLhJTkjGPECJvx6meRZA85SWxX6mLM=
X-Google-Smtp-Source: AGHT+IGfKTc+Py7i8LdLGx/i1V4Wa4lS2rgURpQzd2pME/OVI7Sj7UBHlJevkQc1MVZxPtZi1HUxJg==
X-Received: by 2002:a50:d59b:0:b0:553:2dc2:4b9b with SMTP id v27-20020a50d59b000000b005532dc24b9bmr12044606edi.14.1704275474715;
        Wed, 03 Jan 2024 01:51:14 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id fj25-20020a0564022b9900b00556cd818dd2sm577119edb.70.2024.01.03.01.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 01:51:14 -0800 (PST)
Date: Wed, 3 Jan 2024 12:51:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Umang Jain <umang.jain@ideasonboard.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 87/153]
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:686
 vchiq_initialise() error: we previously assumed 'state' could be null (see
 line 681)
Message-ID: <7a7fd5e8-7f06-4da5-9123-c7a154c05fc2@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   5e8cdb6f6ebe28976876ab04995a5d3779b85082
commit: e70f17ed997cb7ee6c34089f2cdc2a9edc886503 [87/153] staging: vc04_services: Drop vchiq_log_error() in favour of dev_err
config: csky-randconfig-r081-20231218 (https://download.01.org/0day-ci/archive/20231219/202312190038.zuEX32PB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312190038.zuEX32PB-lkp@intel.com/

smatch warnings:
drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:686 vchiq_initialise() error: we previously assumed 'state' could be null (see line 681)

vim +/state +686 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c

abf2836a381a307 Stefan Wahren        2021-04-25  668  int vchiq_initialise(struct vchiq_instance **instance_out)
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  669  {
2d0a0291135fd2f Dominic Braun        2018-12-14  670  	struct vchiq_state *state;
4ddf9a2555caf21 Jamal Shareef        2019-11-05  671  	struct vchiq_instance *instance = NULL;
abf2836a381a307 Stefan Wahren        2021-04-25  672  	int i, ret;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  673  
3da8757576ef789 Amarjargal Gundjalam 2020-10-28  674  	/*
3da8757576ef789 Amarjargal Gundjalam 2020-10-28  675  	 * VideoCore may not be ready due to boot up timing.
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  676  	 * It may never be ready if kernel and firmware are mismatched,so don't
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  677  	 * block forever.
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  678  	 */
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  679  	for (i = 0; i < VCHIQ_INIT_RETRIES; i++) {
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  680  		state = vchiq_get_state();
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02 @681  		if (state)

We exit early if state is valid

5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  682  			break;
81244ba0f03691a Stefan Wahren        2018-03-31  683  		usleep_range(500, 600);
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  684  	}
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  685  	if (i == VCHIQ_INIT_RETRIES) {
e70f17ed997cb7e Umang Jain           2023-12-05 @686  		dev_err(state->dev, "core: %s: Videocore not initialized\n", __func__);
                                                                        ^^^^^^^^^^
state is NULL at this point.

abf2836a381a307 Stefan Wahren        2021-04-25  687  		ret = -ENOTCONN;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  688  		goto failed;
5c5e6ef6287cbf3 Arnd Bergmann        2018-02-02  689  	} else if (i > 0) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

