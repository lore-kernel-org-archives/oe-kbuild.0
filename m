Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C4D171A6
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Jul 2023 09:22:46 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31751d7d96eso3545238f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 31 Jul 2023 02:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690795365; x=1691400165;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lgbharsQKntdUER6lVZNSvC7uX5P5g4vU3d2CiQCSZI=;
        b=HBx4eY3No4DDP4Mdjht6hrsNHYqF6NcaEYh9FQgreZ5QM0Ro0AaR4H9JY9SW4lNLmB
         0vkl+WKJHjlBHiBtFksEDJgky4JhfD6Z2kpgb1VhlKU1M/Pe2ZPIosafh9SrIQoETvf/
         udwaMy+HPCNj8LTKYJkwyW9DRime67iPoE1jpoDUaYI/83Gje/Z1BexzfK8sRKd569hO
         Tcbg8o2YVx5lk6EOa80PE7fxES85bJVYUIl0S19WXLUNAn09pS5c8Mk5fc/jPgmA/fzr
         Xc4AAtaheSvuKWNfOOIxggvikrSDSDWipMFNYCEQTCIbCaoG/DOcFo/utzoyG0YMMUQJ
         vJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690795365; x=1691400165;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgbharsQKntdUER6lVZNSvC7uX5P5g4vU3d2CiQCSZI=;
        b=QhtZwyza2xirDz2Hp1Ra2ufEYRfDqXpYAkLrsdn549BgdOP4ZqSFFpUmXHgxR1Qn5r
         0S0KC1Vz0d/0qnjLd3/tiUXIhIE9aCf1BjAifs6MdQzvtZkxf2Hx5ZL+GwI+KykMjla6
         dXzJMG4Z8tW9pKKlLv4zGpxZl6E5NHPpR7tE1/3E7f2HYidylMBOLZqjV8gYXKcqZCzA
         s4LzFV+lxHZ1PTCmGuAv2YDk3PCs93yItKPJoGFoMx1kxY8m6qmRKpEHH1FjYUcS/A40
         ivdcEXQxVtkzh4k+RcNo4QRI1sruSMs42pzwgz3xa5MlJJ6nvtYIb8aDZvXxS+l1xbxa
         PGtQ==
X-Gm-Message-State: ABy/qLaesk5R6tew3Amw4nPxE0PRxF2VJi3MKIudB+3I51aFA/mHSd4Q
	Hm+BpQfl9XRKnQ32scpOj0Sgg1rpZRetHYdW0IQ=
X-Google-Smtp-Source: APBJJlHw/GcIf7e08/QXfEbqiKdJncACDTkw/RFbul2a8Frea13WRXYpNkpCKC1KOZOxvCu1scRxyQ==
X-Received: by 2002:adf:e586:0:b0:314:4915:689 with SMTP id l6-20020adfe586000000b0031449150689mr6522564wrm.34.1690795364743;
        Mon, 31 Jul 2023 02:22:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f17-20020adffcd1000000b00313f61889ecsm12520466wrs.66.2023.07.31.02.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:22:44 -0700 (PDT)
Date: Mon, 31 Jul 2023 08:40:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Sergey Temerkhanov <sergey.temerkhanov@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [tnguy-next-queue:dev-queue 20/51]
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c:2181
 ice_read_phy_and_phc_time_e822() warn: if statement not indented
Message-ID: <f7214ccb-4adb-4184-9f62-09fba84bd744@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   79dc5308c824de000283d82a4496567bbedae5db
commit: a9c0311851c4ab40093e5c629881499f2639f229 [20/51] ice: prefix clock timer command enumeration values with ICE_PTP
config: i386-randconfig-m021-20230728 (https://download.01.org/0day-ci/archive/20230730/202307300951.kWJSF1tX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300951.kWJSF1tX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307300951.kWJSF1tX-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_ptp_hw.c:2181 ice_read_phy_and_phc_time_e822() warn: if statement not indented

vim +2181 drivers/net/ethernet/intel/ice/ice_ptp_hw.c

3a7496234d179a Jacob Keller       2021-10-13  2165  static int
3a7496234d179a Jacob Keller       2021-10-13  2166  ice_read_phy_and_phc_time_e822(struct ice_hw *hw, u8 port, u64 *phy_time,
3a7496234d179a Jacob Keller       2021-10-13  2167  			       u64 *phc_time)
3a7496234d179a Jacob Keller       2021-10-13  2168  {
3a7496234d179a Jacob Keller       2021-10-13  2169  	u64 tx_time, rx_time;
3a7496234d179a Jacob Keller       2021-10-13  2170  	u32 zo, lo;
3a7496234d179a Jacob Keller       2021-10-13  2171  	u8 tmr_idx;
3a7496234d179a Jacob Keller       2021-10-13  2172  	int err;
3a7496234d179a Jacob Keller       2021-10-13  2173  
3a7496234d179a Jacob Keller       2021-10-13  2174  	tmr_idx = ice_get_ptp_src_clock_index(hw);
3a7496234d179a Jacob Keller       2021-10-13  2175  
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2176  	/* Prepare the PHC timer for a ICE_PTP_READ_TIME capture command */
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2177  	ice_ptp_src_cmd(hw, ICE_PTP_READ_TIME);
3a7496234d179a Jacob Keller       2021-10-13  2178  
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2179  	/* Prepare the PHY timer for a ICE_PTP_READ_TIME capture command */
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2180  	err = ice_ptp_one_port_cmd(hw, port, ICE_PTP_READ_TIME);
3a7496234d179a Jacob Keller       2021-10-13 @2181  	if (err)

return err; statement is somehow missing.

3a7496234d179a Jacob Keller       2021-10-13  2182  
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2183  	/* Issue the sync to start the ICE_PTP_READ_TIME capture */
3a7496234d179a Jacob Keller       2021-10-13  2184  	ice_ptp_exec_tmr_cmd(hw);
3a7496234d179a Jacob Keller       2021-10-13  2185  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

