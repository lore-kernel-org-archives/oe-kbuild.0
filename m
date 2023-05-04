Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C7139A
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 06:49:57 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3063208beedso3752157f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 03 May 2023 23:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683182995; x=1685774995;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQqXGf1khZMm/Ac992X2sUyPgyTbXXTPdveByQedJuU=;
        b=IV1YjJIjI+E9KxYdcHhf37x1OcPFbnEHr0AmBL7XslVfnulS7x/fCbHWiAbF0UzSGg
         0RMYxoI1xThIhrkwQpqy0/g/cSY9b7Rq+mXrCq8QhnglUQXMEqCCh+Ov5McjGMOPXrms
         YyrH3BaWUB1qqQVEdYaQmXWTdHCy44jx7tONCfnW+kKIr7gDfwTEyHOpJjuS07Pptc4c
         0w2nrhNpkt5WAYGtb66RIey++2YtmkTbKIr/mz91n1V6sAAkClNN+EQA24TjBcNMLuEI
         jP5E9ZTSrF4mEadjPxmPbv6EGP6DenwvssWkOgwSWiOgKvV04tAOBnuPMHa3eFq1vTSk
         bjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683182995; x=1685774995;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQqXGf1khZMm/Ac992X2sUyPgyTbXXTPdveByQedJuU=;
        b=jMzqjyEchK3hz9tS2JTaRgPMmwtfFAEJqYdVlqFnJN3b8CckJzewmoWEnk96FWw+tV
         BHZJkUHx+MdiuR+Lo3D9c+EzmU0QEyO5+v9OxpDO3ZUAhZBKj83rHeSQPejITU5VSDXl
         R+YvHSAQaeKFLQ0Cr+KcofDaoY/0SD8xbsyTKFKe+mdarcCDuHcgff7twF0Kw8pCcUyb
         7sMGxKCvXVuX3FuVf+RInfPBzvmB9tKZXfPeTa42Vc3FeTJYUS+3hgFXz5vvrI0OAND0
         j+puDg383g1U1A6V4coRP8dDpjWpruUl+Zbj0OdhjpWtAL8h6IlBX3yOr6OxwUMt4D9v
         oW6w==
X-Gm-Message-State: AC+VfDwWerHopCjt0pWR5uF6GK4k76BVKYRGw0aGXZB9p4nx40oSsXY7
	uOC8SDA7gTzHwipA+aR0wLrt0tEK8WpkK6TcKZg=
X-Google-Smtp-Source: ACHHUZ75c6QjWYDZMddaVlr0bF/lU/Ar4eTq/MJsLcrDwAmV714Ies0UshusbVm7LhjfG9IDk2LwEA==
X-Received: by 2002:adf:cc84:0:b0:2ef:b052:1296 with SMTP id p4-20020adfcc84000000b002efb0521296mr1668968wrj.22.1683182995079;
        Wed, 03 May 2023 23:49:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c0b5700b003ef5bb63f13sm3866220wmr.10.2023.05.03.23.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 23:49:53 -0700 (PDT)
Date: Thu, 4 May 2023 09:48:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Eggers <ceggers@arri.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: drivers/net/dsa/microchip/ksz_ptp.c:217 ksz_ptp_clock_register()
 warn: passing zero to 'PTR_ERR'
Message-ID: <00deb2fc-8489-4d9f-836b-6db828dbb61d@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa31fc82fb775445c176e576304c4098222f47f2
commit: eac1ea20261e1fac8ffbfb3b7da2d5e6b7c159e3 net: dsa: microchip: ptp: add the posix clock support
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230504/202305041244.tDo9luPw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305041244.tDo9luPw-lkp@intel.com/

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


PTR_ERR(NULL) is success.

This code suggests that ptp_clock_register() is required.  If it is
required then it should be enforced by the .config instead of leaving
the user with a module that can never be probed.

However, if it's not absolutely required and the user is allowed to
disable it in their .config then the way to write it is:

	ptp_data->clock = ptp_clock_register(&ptp_data->caps, dev->dev);
	if (IS_ERR(ptp_data->clock))
		return PTR_ERR(ptp_data->clock);

Just add NULL checks before every ptp_data->clock dereference inside the
driver.  (All the clock functions will be no-ops at that point so don't
worry about them).

See my blog for more info:
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

eac1ea20261e1f Christian Eggers 2023-01-10  218  
eac1ea20261e1f Christian Eggers 2023-01-10  219  	return 0;
eac1ea20261e1f Christian Eggers 2023-01-10  220  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

