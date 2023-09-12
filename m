Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A72171B1
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Sep 2023 06:22:05 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-402cc6b8bedso59380235e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 23:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694499724; x=1695104524; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHZmX0HdVaeA7e+GTMUWOnquBG2VN2h00kw4Wwdycoc=;
        b=C982y8V7YvcGJdWknTCseJE2lyauX5sBk0bmFpHD+LWnVD7mO3mKmjSU7HgjNLmea4
         p8CQ9EjY6S+yIZLIzrYk4EJeobqMbXMLqYt0dWGTe8Mnd1cbea+nslbkfs40KHCxj85e
         33hmm2iyVZ2mT91HHvglnCeLxM7Kgu10iUfRjfrs18Jg2NzPIzCT/JIcLK+y4kRB7ATo
         VUfeVoQvqPiJElW771lKujyKyyhy5KNv8/sRlEjZ8VIvB1WzhoAGLVat2i1X6iNJcdtH
         33ma/MfMJaZ/MP/0wortOejV1NCayEecm6v0oh/B88M7q5sbmDwsHwaamz+xNqRNbv7f
         xqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694499724; x=1695104524;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHZmX0HdVaeA7e+GTMUWOnquBG2VN2h00kw4Wwdycoc=;
        b=dPb55KzAGqy2C8MFfmVH+3onirnoEUoF8h1UkU1IlPYEHyKamwuHURi/U/xgq9LLSU
         MmfDMzD1GLYzHNee/SDynGI6JOXKGDpjAlTq8ekn7I6Zl90KDlt1LqC/0p1/HGG/EVut
         p6Q+HiVTA/Soi4u+oilh8P1A/XHfJMEWr7u5y9BX1qwvmHPJQOcFG/jxhtiEkbBsISgQ
         WkBflw0bWDJJB8yBAdTMHGOSq6Iv9/k2ADGUeenKIA249sWyCHPvb0OgMQ7+qDbqAafA
         jNSarGK1JJcxPAa1L3yBz3x+QFkMmirqS5uI9iLymzI3YjDJ/Lh2vY3I5wSueL3vnxpe
         x7ng==
X-Gm-Message-State: AOJu0Yzntc+WirDnngFtxP0yNHbMY+D59j/45uyvopLWzApDcyWdZ/f5
	hF8jHqjt+mDsFj68+MFo5RWUJ6CKauSOAU64iB8=
X-Google-Smtp-Source: AGHT+IG+I5BM37b86sq3KhHg2M4gwi+dJ5j0QXzcWb/eRJJdZtbiMZShPPawrSYbiYVy5fd/1WoMtA==
X-Received: by 2002:a7b:c7d5:0:b0:3fe:d1b9:7ea8 with SMTP id z21-20020a7bc7d5000000b003fed1b97ea8mr9409877wmk.28.1694499724016;
        Mon, 11 Sep 2023 23:22:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c22c300b003fe2b6d64c8sm15036691wmg.21.2023.09.11.23.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 23:22:03 -0700 (PDT)
Date: Tue, 12 Sep 2023 09:22:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Cai Huoqing <cai.huoqing@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/huawei/hinic/hinic_port.c:459
 hinic_set_vlan_fliter() warn: variable dereferenced before check 'hwdev'
 (see line 453)
Message-ID: <dce439ac-bf77-408a-b017-1ffe5ccdd755@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 2acf960e3be6177f437baade6d1883ebe4c641b2 net: hinic: Add support for configuration of rx-vlan-filter by ethtool
config: x86_64-randconfig-161-20230911 (https://download.01.org/0day-ci/archive/20230911/202309112354.pikZCmyk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309112354.pikZCmyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309112354.pikZCmyk-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/huawei/hinic/hinic_port.c:459 hinic_set_vlan_fliter() warn: variable dereferenced before check 'hwdev' (see line 453)

vim +/hwdev +459 drivers/net/ethernet/huawei/hinic/hinic_port.c

2acf960e3be617 Cai Huoqing  2022-11-03  450  int hinic_set_vlan_fliter(struct hinic_dev *nic_dev, u32 en)
2acf960e3be617 Cai Huoqing  2022-11-03  451  {
2acf960e3be617 Cai Huoqing  2022-11-03  452  	struct hinic_hwdev *hwdev = nic_dev->hwdev;
2acf960e3be617 Cai Huoqing  2022-11-03 @453  	struct hinic_hwif *hwif = hwdev->hwif;
                                                                          ^^^^^^^
Dereference

2acf960e3be617 Cai Huoqing  2022-11-03  454  	struct pci_dev *pdev = hwif->pdev;
2acf960e3be617 Cai Huoqing  2022-11-03  455  	struct hinic_vlan_filter vlan_filter;
2acf960e3be617 Cai Huoqing  2022-11-03  456  	u16 out_size = sizeof(vlan_filter);
2acf960e3be617 Cai Huoqing  2022-11-03  457  	int err;
2acf960e3be617 Cai Huoqing  2022-11-03  458  
2acf960e3be617 Cai Huoqing  2022-11-03 @459  	if (!hwdev)
                                                    ^^^^^^
Checked too late.

2acf960e3be617 Cai Huoqing  2022-11-03  460  		return -EINVAL;
2acf960e3be617 Cai Huoqing  2022-11-03  461  
2acf960e3be617 Cai Huoqing  2022-11-03  462  	vlan_filter.func_idx = HINIC_HWIF_FUNC_IDX(hwif);
2acf960e3be617 Cai Huoqing  2022-11-03  463  	vlan_filter.enable = en;
2acf960e3be617 Cai Huoqing  2022-11-03  464  
2acf960e3be617 Cai Huoqing  2022-11-03  465  	err = hinic_port_msg_cmd(hwdev, HINIC_PORT_CMD_SET_VLAN_FILTER,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

