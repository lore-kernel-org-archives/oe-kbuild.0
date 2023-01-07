Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68427EC7;
	Sat,  7 Jan 2023 08:33:33 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so2596001wms.2;
        Sat, 07 Jan 2023 00:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iPT2ZOMOLUsQNvf+1YxI5DBhgI/ld9FbsEi0DhjkRXc=;
        b=PTPSoiZySlrJx+P5BRk096MdPTKVWN9It9WUFZAxC2/7H5TvIJTQe/xajq1L6dD5On
         JaDM/Ck1ZOWEmPodgRKCOdK+X4q8cjxrgkXhj24s8sBu5e3t2o3jS7bRfFE6L4vZRZgh
         WzAoOtxQBm96sQtrS3VAxFxfSPIvDn/laxhjxQ1uFqZnqslJytquQVIe4HX1S7BmyB3S
         To5HnO0ZLu3wwhsf7p+dEN5I+vz6SS97T7L+3ztuzsSw0lp3Vq4YlyonLkbuiEGyma/P
         Mjf0DXulD2ZQU3umeqeQxZSbpNGWpPrnbNZxVoD5MzcNxFtk7aXIbYRKe/KgZW/wjt0m
         2sCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPT2ZOMOLUsQNvf+1YxI5DBhgI/ld9FbsEi0DhjkRXc=;
        b=2rFjvp9XmF7NN20JERQknPmycgleghQeGe8eZBIavE0qYOc3pOD+jqRLUCuh4/tGPF
         /E8jR732ApnQ9GRB/RV9Tl/y+kUMSE7RwZ4yycYDLzwBkKylj18QwONdq4P+uFxeMZFk
         B0lMnRCspkhhZdJofwz1mMc/E349Mn9siTPHCV1fS5XB5P+M9pl+uRMENs10G1nIV7FQ
         dkcsyeecLbfdlY9qrBCCqYpnlPxlfrI7enaO7ZACe9z6xUNbzYqrSyEVjn/CzF6Y7D/m
         SqQ0OSseQvK9kUTLTwhK6vjvccsuN9XzMSQYw5tvcfp5LFTnx7cY2AMDToiPCIzyf0Yx
         e2ng==
X-Gm-Message-State: AFqh2komxB+vnIp+1/9/V6PKJFxZq1jHcwYIqaXhQTVZmkd++pxXhgFF
	65oNEdaUPys+l2ujsk65q4tr5LDlAD323gIg
X-Google-Smtp-Source: AMrXdXtPX80UYKugy/n70TxupH81z1Ius9dBnYabO/H+QM4/tur/Mgnj3NgY2SuZJ/38t/vfJzAmFQ==
X-Received: by 2002:a05:600c:54eb:b0:3c6:e63e:89aa with SMTP id jb11-20020a05600c54eb00b003c6e63e89aamr40850700wmb.6.1673080411342;
        Sat, 07 Jan 2023 00:33:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b003d34faca949sm4510206wmb.39.2023.01.07.00.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 00:33:30 -0800 (PST)
Date: Sat, 7 Jan 2023 11:33:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Divya Koppera <Divya.Koppera@microchip.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/phy/micrel.c:2613 lan8814_ptp_probe_once() warn: passing
 zero to 'PTR_ERR'
Message-ID: <202301070307.5CkACLRd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230107083327.v1GyJJ_BSTxkVoK9gFNx1JF28GKfibLJuUJ8ANAj8Is@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f5abbd77e2c1787e74b7c2caffac97def78ba52
commit: ece19502834d84ece2e056db28257ca2aa6e4d48 net: phy: micrel: 1588 support for LAN8814 phy
config: arc-randconfig-m041-20230106
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/net/phy/micrel.c:2613 lan8814_ptp_probe_once() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/net/phy/micrel.c:1750 ksz886x_cable_test_get_status() error: uninitialized symbol 'ret'.

vim +/PTR_ERR +2613 drivers/net/phy/micrel.c

ece19502834d84 Divya Koppera 2022-03-04  2589  static int lan8814_ptp_probe_once(struct phy_device *phydev)
ece19502834d84 Divya Koppera 2022-03-04  2590  {
ece19502834d84 Divya Koppera 2022-03-04  2591  	struct lan8814_shared_priv *shared = phydev->shared->priv;
ece19502834d84 Divya Koppera 2022-03-04  2592  
ece19502834d84 Divya Koppera 2022-03-04  2593  	/* Initialise shared lock for clock*/
ece19502834d84 Divya Koppera 2022-03-04  2594  	mutex_init(&shared->shared_lock);
ece19502834d84 Divya Koppera 2022-03-04  2595  
ece19502834d84 Divya Koppera 2022-03-04  2596  	shared->ptp_clock_info.owner = THIS_MODULE;
ece19502834d84 Divya Koppera 2022-03-04  2597  	snprintf(shared->ptp_clock_info.name, 30, "%s", phydev->drv->name);
ece19502834d84 Divya Koppera 2022-03-04  2598  	shared->ptp_clock_info.max_adj = 31249999;
ece19502834d84 Divya Koppera 2022-03-04  2599  	shared->ptp_clock_info.n_alarm = 0;
ece19502834d84 Divya Koppera 2022-03-04  2600  	shared->ptp_clock_info.n_ext_ts = 0;
ece19502834d84 Divya Koppera 2022-03-04  2601  	shared->ptp_clock_info.n_pins = 0;
ece19502834d84 Divya Koppera 2022-03-04  2602  	shared->ptp_clock_info.pps = 0;
ece19502834d84 Divya Koppera 2022-03-04  2603  	shared->ptp_clock_info.pin_config = NULL;
ece19502834d84 Divya Koppera 2022-03-04  2604  	shared->ptp_clock_info.adjfine = lan8814_ptpci_adjfine;
ece19502834d84 Divya Koppera 2022-03-04  2605  	shared->ptp_clock_info.adjtime = lan8814_ptpci_adjtime;
ece19502834d84 Divya Koppera 2022-03-04  2606  	shared->ptp_clock_info.gettime64 = lan8814_ptpci_gettime64;
ece19502834d84 Divya Koppera 2022-03-04  2607  	shared->ptp_clock_info.settime64 = lan8814_ptpci_settime64;
ece19502834d84 Divya Koppera 2022-03-04  2608  	shared->ptp_clock_info.getcrosststamp = NULL;
ece19502834d84 Divya Koppera 2022-03-04  2609  
ece19502834d84 Divya Koppera 2022-03-04  2610  	shared->ptp_clock = ptp_clock_register(&shared->ptp_clock_info,
ece19502834d84 Divya Koppera 2022-03-04  2611  					       &phydev->mdio.dev);
ece19502834d84 Divya Koppera 2022-03-04  2612  	if (IS_ERR_OR_NULL(shared->ptp_clock)) {
ece19502834d84 Divya Koppera 2022-03-04 @2613  		phydev_err(phydev, "ptp_clock_register failed %lu\n",
ece19502834d84 Divya Koppera 2022-03-04  2614  			   PTR_ERR(shared->ptp_clock));
ece19502834d84 Divya Koppera 2022-03-04  2615  		return -EINVAL;

I sent a detailed explanation of this bug earlier but it still has not
been fixed.  Search lore.kernel.org for more info.

ece19502834d84 Divya Koppera 2022-03-04  2616  	}
ece19502834d84 Divya Koppera 2022-03-04  2617  
ece19502834d84 Divya Koppera 2022-03-04  2618  	phydev_dbg(phydev, "successfully registered ptp clock\n");
ece19502834d84 Divya Koppera 2022-03-04  2619  
ece19502834d84 Divya Koppera 2022-03-04  2620  	shared->phydev = phydev;
ece19502834d84 Divya Koppera 2022-03-04  2621  
ece19502834d84 Divya Koppera 2022-03-04  2622  	/* The EP.4 is shared between all the PHYs in the package and also it
ece19502834d84 Divya Koppera 2022-03-04  2623  	 * can be accessed by any of the PHYs
ece19502834d84 Divya Koppera 2022-03-04  2624  	 */
ece19502834d84 Divya Koppera 2022-03-04  2625  	lanphy_write_page_reg(phydev, 4, LTC_HARD_RESET, LTC_HARD_RESET_);
ece19502834d84 Divya Koppera 2022-03-04  2626  	lanphy_write_page_reg(phydev, 4, PTP_OPERATING_MODE,
ece19502834d84 Divya Koppera 2022-03-04  2627  			      PTP_OPERATING_MODE_STANDALONE_);
ece19502834d84 Divya Koppera 2022-03-04  2628  
ece19502834d84 Divya Koppera 2022-03-04  2629  	return 0;
ece19502834d84 Divya Koppera 2022-03-04  2630  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

