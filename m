Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058A420E0
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 05:20:08 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3174aac120aso1471852f8f.2
        for <oe-kbuild@lists.linux.dev>; Thu, 03 Aug 2023 22:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691126407; x=1691731207;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/azxbjU48alN7RCsivjCgkRTH8UZaCezXDGgcFlKkA=;
        b=zKsHCcX4gqdpdIKzTJM/pyeZFZwvQXpBefkbDaXgWucF2XAxafcOnXlTEUHxDsLDeb
         93NcCnfdAXju9Pb5wyHH/Rk70LZ1yYTwxeQPwuBlXKOfgtey6hQ6xM1MmDjv/3YClqXU
         dg/wdtvT5MBJTli6X8X03PSlbCJCLKHzE4raJO4N6mpUwzyscWIFciSZvCd8tSWUxUvv
         91sQvxL3Xs1j4wzvboDVsjqQ7ae2p8553pXzwcyX1OlLYc1l6Gq0Bq5L70XGqOmFgv/r
         p1Ahm1eZd6fCdf9OLc4FVY7hzSozGZSsh0F0IqRBPV+qbpDwzkK6kNXJ4ZUVLG0oSQhZ
         EWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691126407; x=1691731207;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/azxbjU48alN7RCsivjCgkRTH8UZaCezXDGgcFlKkA=;
        b=AI4eYsOsdqvkv4fLmZiklq5NKslbpZj/wEgkEE1GnrKY21UYIxL+ODIy6GS6emmQoD
         vgBEz8U3N7DBSP0BUN2qivhYa9jH8JSHWmqAJb/iLyYoTf7zdHYIki7PdY2+GuM0f2SO
         UJDKs5glt/XzPzt5y0qSC5/ZIUXbNM1LX9WZni/4UrgrhbZuCHMjplzNIAl8S2F6jfnJ
         9kPDzHazwhY2/G0sIWtfE23NCoGyHiYL1VbD9laT7+HSfkMXRbNxILMk/Vk++32Tc4yl
         GTSBHISEWNdGaw7PG5yeLIR+W3H7pbMWdU5ST/qpWE0Y8kuKsFO5LHW4IsQuB+ego1QF
         ni9A==
X-Gm-Message-State: AOJu0YzbpItypIS1H/c4R6phyVHAW9or4pD3ysFpv98+gqo5KNvB2r2j
	015q0/GeL2afAFX20+LZLMk6YakfInOC8V8yXTg=
X-Google-Smtp-Source: AGHT+IEmqVF8qGeEfmnIY+0mIneIix3hdl20UIum3fTzSAwnErhOsveCmkFon1vau4W95puFdT5W4A==
X-Received: by 2002:adf:d844:0:b0:314:21b:1ea2 with SMTP id k4-20020adfd844000000b00314021b1ea2mr341391wrl.39.1691126406835;
        Thu, 03 Aug 2023 22:20:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b3-20020adfee83000000b0031773e3cf46sm1518910wro.61.2023.08.03.22.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 22:20:06 -0700 (PDT)
Date: Fri, 4 Aug 2023 08:20:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roi Dayan <roid@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Saeed Mahameed <saeedm@nvidia.com>, Eli Cohen <elic@nvidia.com>,
	Shay Drory <shayd@nvidia.com>
Subject: [linux-next:master 4511/6910]
 drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:264
 mlx5_devcom_send_event() warn: variable dereferenced before IS_ERR check
 'devcom' (see line 259)
Message-ID: <a181425f-6c87-4813-a703-dddca235454a@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fb4327106e5250ee360d0d8b056c1eef7eeb9a98
commit: 88d162b479815f5d6b6a4ff5fdb07aec9dc6280c [4511/6910] net/mlx5: Devcom, Infrastructure changes
config: x86_64-randconfig-m001-20230803 (https://download.01.org/0day-ci/archive/20230804/202308041028.AkXYDwJ6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041028.AkXYDwJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308041028.AkXYDwJ6-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:264 mlx5_devcom_send_event() warn: variable dereferenced before IS_ERR check 'devcom' (see line 259)

vim +/devcom +264 drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c

88d162b479815f Roi Dayan   2023-05-04  255  int mlx5_devcom_send_event(struct mlx5_devcom_comp_dev *devcom,
e2a82bf8a42816 Shay Drory  2023-02-06  256  			   int event, int rollback_event,
fadd59fc50d010 Aviv Heller 2018-12-04  257  			   void *event_data)
fadd59fc50d010 Aviv Heller 2018-12-04  258  {
88d162b479815f Roi Dayan   2023-05-04 @259  	struct mlx5_devcom_comp *comp = devcom->comp;
                                                                                ^^^^^^^^^^^^
Dereference

88d162b479815f Roi Dayan   2023-05-04  260  	struct mlx5_devcom_comp_dev *pos;
88d162b479815f Roi Dayan   2023-05-04  261  	int err = 0;
88d162b479815f Roi Dayan   2023-05-04  262  	void *data;
fadd59fc50d010 Aviv Heller 2018-12-04  263  
fadd59fc50d010 Aviv Heller 2018-12-04 @264  	if (IS_ERR_OR_NULL(devcom))
                                                                   ^^^^^^
Checked too late

88d162b479815f Roi Dayan   2023-05-04  265  		return -ENODEV;
fadd59fc50d010 Aviv Heller 2018-12-04  266  
fadd59fc50d010 Aviv Heller 2018-12-04  267  	down_write(&comp->sem);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

