Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C101BD39;
	Fri, 20 Jan 2023 08:54:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r2so4190360wrv.7;
        Fri, 20 Jan 2023 00:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vA6U513FDIj3fc5yXQaqgAvo5ZnMYfg6Pzt2xeGMuxs=;
        b=BnJhgZnL+YSSR57D0PuKcwb6qFqhvGRSjCpripeLBEcKSU6OhZwhAnpGiITo49ipuv
         vCacMAX2vXX/iTOK7LIQdPaImfZqv7rBNi8Mm606DnA6bR1eo6JzwbC6LEYDA8b1Woox
         txsmi0ZaxbvDDcbCkBnfaELCM9O7VqPOArLmxv8h+c4V2j1OQujybsOajEqYfNs667pa
         gCG5xoF71QPmFn8x4Q7+C6sJxm4fXNQZsVpoP7SAbV4EXy6Nd9dnQ15G1prZFTlkEz7D
         U7zEEkfmTz2wT5fR7OXA7dgW/m3hcD/0zK9yPg+vrtuT+DlXQ11szEeqSfr40gF1fOTj
         PXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vA6U513FDIj3fc5yXQaqgAvo5ZnMYfg6Pzt2xeGMuxs=;
        b=cnSXnLFTer/S2+XQroXD2nw88npeaFmHximVRkUPOutKL6h+kghEHGVqqUy15C+Q5Y
         rLSEvufBaeKcz1Eo4WrrU+AqNnLjoKGXyjYcMkZxf6ODGoWlXcQY/t73rX4o+ONhVxu+
         xlwDTI6IFPkekEwnT3ibKo6WnGDd09jdRZI8mFUnX0AVLF8oLY98FhkyB6RxfZyPFLaf
         zIni8ADhqAe4L22d9WeROGybE86hBVqLdYNabzw6yTRGIJClepMjM+6pJHN6RGTJ5p8C
         BDg3151uM4Mv7+RVFQyCksfbXcuqrNiVch4gNLnGhpF3N1ktsIxxC2xw2lpi42SyKlhp
         O38A==
X-Gm-Message-State: AFqh2koZoCRIEk9sfMIeDkETcxW9JtdSaNhws2YzrLl6OzgcfyHLc7lm
	qH/O9nt+yqgJKBwrTqzrJ6M63tRUr236UA==
X-Google-Smtp-Source: AMrXdXvgHBTa5hCcXAJgBnKjz869MWykaIf7OvwwEru3zqLwnrhfPBk52tmGsDu5pTbCJ2MO0p9kTg==
X-Received: by 2002:a5d:5f06:0:b0:2bd:d1be:ec99 with SMTP id cl6-20020a5d5f06000000b002bdd1beec99mr7688801wrb.66.1674204887781;
        Fri, 20 Jan 2023 00:54:47 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c14-20020adfa30e000000b002be50604c81sm2069475wrb.47.2023.01.20.00.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 00:54:47 -0800 (PST)
Date: Fri, 20 Jan 2023 11:54:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Christian Eggers <ceggers@arri.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [linux-next:master 3733/6912]
 drivers/net/dsa/microchip/ksz_ptp.c:217 ksz_ptp_clock_register() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202301201523.lxPMYgrH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230120085443.kNqenIuNf90QD6v7ndPdwvhWClSwKALQJJaZJdDPoGQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: eac1ea20261e1fac8ffbfb3b7da2d5e6b7c159e3 [3733/6912] net: dsa: microchip: ptp: add the posix clock support
config: csky-randconfig-m041-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201523.lxPMYgrH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/dsa/microchip/ksz_ptp.c:217 ksz_ptp_clock_register() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +217 drivers/net/dsa/microchip/ksz_ptp.c

eac1ea20261e1f Christian Eggers 2023-01-10  186  int ksz_ptp_clock_register(struct dsa_switch *ds)
eac1ea20261e1f Christian Eggers 2023-01-10  187  {
eac1ea20261e1f Christian Eggers 2023-01-10  188  	struct ksz_device *dev = ds->priv;
eac1ea20261e1f Christian Eggers 2023-01-10  189  	struct ksz_ptp_data *ptp_data;
eac1ea20261e1f Christian Eggers 2023-01-10  190  	int ret;
eac1ea20261e1f Christian Eggers 2023-01-10  191  
eac1ea20261e1f Christian Eggers 2023-01-10  192  	ptp_data = &dev->ptp_data;
eac1ea20261e1f Christian Eggers 2023-01-10  193  	mutex_init(&ptp_data->lock);
eac1ea20261e1f Christian Eggers 2023-01-10  194  
eac1ea20261e1f Christian Eggers 2023-01-10  195  	ptp_data->caps.owner		= THIS_MODULE;
eac1ea20261e1f Christian Eggers 2023-01-10  196  	snprintf(ptp_data->caps.name, 16, "Microchip Clock");
eac1ea20261e1f Christian Eggers 2023-01-10  197  	ptp_data->caps.max_adj		= KSZ_MAX_DRIFT_CORR;
eac1ea20261e1f Christian Eggers 2023-01-10  198  	ptp_data->caps.gettime64	= ksz_ptp_gettime;
eac1ea20261e1f Christian Eggers 2023-01-10  199  	ptp_data->caps.settime64	= ksz_ptp_settime;
eac1ea20261e1f Christian Eggers 2023-01-10  200  	ptp_data->caps.adjfine		= ksz_ptp_adjfine;
eac1ea20261e1f Christian Eggers 2023-01-10  201  	ptp_data->caps.adjtime		= ksz_ptp_adjtime;
eac1ea20261e1f Christian Eggers 2023-01-10  202  
eac1ea20261e1f Christian Eggers 2023-01-10  203  	ret = ksz_ptp_start_clock(dev);
eac1ea20261e1f Christian Eggers 2023-01-10  204  	if (ret)
eac1ea20261e1f Christian Eggers 2023-01-10  205  		return ret;
eac1ea20261e1f Christian Eggers 2023-01-10  206  
eac1ea20261e1f Christian Eggers 2023-01-10  207  	/* Currently only P2P mode is supported. When 802_1AS bit is set, it
eac1ea20261e1f Christian Eggers 2023-01-10  208  	 * forwards all PTP packets to host port and none to other ports.
eac1ea20261e1f Christian Eggers 2023-01-10  209  	 */
eac1ea20261e1f Christian Eggers 2023-01-10  210  	ret = ksz_rmw16(dev, REG_PTP_MSG_CONF1, PTP_TC_P2P | PTP_802_1AS,
eac1ea20261e1f Christian Eggers 2023-01-10  211  			PTP_TC_P2P | PTP_802_1AS);
eac1ea20261e1f Christian Eggers 2023-01-10  212  	if (ret)
eac1ea20261e1f Christian Eggers 2023-01-10  213  		return ret;
eac1ea20261e1f Christian Eggers 2023-01-10  214  
eac1ea20261e1f Christian Eggers 2023-01-10  215  	ptp_data->clock = ptp_clock_register(&ptp_data->caps, dev->dev);
eac1ea20261e1f Christian Eggers 2023-01-10  216  	if (IS_ERR_OR_NULL(ptp_data->clock))
eac1ea20261e1f Christian Eggers 2023-01-10 @217  		return PTR_ERR(ptp_data->clock);

This returns success if ptp_clock_register() returns NULL (which it
would do if CONFIG_PTP_1588_CLOCK is disabled).  Returning success is
correct, but this would be cleaner as:

	if (IS_ERR(ptp_data->clock))
		return PTR_ERR(ptp_data->clock);

	return 0;

eac1ea20261e1f Christian Eggers 2023-01-10  218  
eac1ea20261e1f Christian Eggers 2023-01-10  219  	return 0;
eac1ea20261e1f Christian Eggers 2023-01-10  220  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

