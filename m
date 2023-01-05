Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B867FD;
	Thu,  5 Jan 2023 04:38:34 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z16so18536460wrw.1;
        Wed, 04 Jan 2023 20:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TbkR5l1BVKkSnLBfm6IidXwGNiJLoWvBkttH25maf6s=;
        b=FA+EN0yUV9TtT0RgBCWK8qA2Ot9W9gYDs4DVsZxyAlw7uZzNMmkqNcEdLXzoI0p0NY
         xwqSS5R2rl28wPtd5yKokCEFRI3ggP0J07a1p6ytL6FwlFUb+ipF7ul0Z+cBqeoRB6TA
         f03cTKvdNqkl7vHOE87W8+3mQv06vzcsgXin+xNshoJIY+YoVrHqrmPwhtRdQCQdw+6B
         iUyS8xaaW30TwEiIG8oac9oHS8hPvhSB283EHN3Tk1PIg35qNM5Zyik72YrpkPmwaHWP
         DCtyEYpO8KhFTvygzmdMaAoVfmfhwj1ClnXYgnfv1TTC3cPUoIVitsW4ZlRf1vInXqzC
         jwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TbkR5l1BVKkSnLBfm6IidXwGNiJLoWvBkttH25maf6s=;
        b=eabApAYn3oVDMU+tuyo/dJktkcPUivCq9d1ayreV5JJsdhRibnIUftvKbWl63wsQAv
         TnKrCYxEhkBUu7JR62lGMPr+EafLWKsa5jLkoY0zxLyUkACHQ9Kfu29JZEjSi0kl8gpL
         M2rmftsLjoEIXRAoMk+vJYiTe2EJxUImDfrgyc9PuWNj0E5mSEXLuFvPolaGULsbDV8n
         ZxSlmN3HW8XiKXy5L/SXzQ+GNON9h9opCSlsX8+oTPQ9F/+oPmG9tt/IhXFMwYgCnH4d
         V5Ebi1O+kder5YzDxv7alNLA8EaKJcFr2CbIHnzCZrgBvF6lfMpFh96gV5fKLK0NIZx/
         p6FA==
X-Gm-Message-State: AFqh2krrkeYNXCBw7iIskdBFhEWEbwvz9y+XDxOnM2GIa0liAI5DufrO
	xqNhCReNZfbE37AbnbAyoRy5CrdM0lSjz4T1
X-Google-Smtp-Source: AMrXdXvgbzlUulGqlbNnPDJViDl/gwJ7/5W0urBSZjfKBR2LDphY6xir4zAwzuT9lLq/Pc6KDJ0OzQ==
X-Received: by 2002:adf:f944:0:b0:2a2:6b1f:6105 with SMTP id q4-20020adff944000000b002a26b1f6105mr2729794wrr.37.1672893512995;
        Wed, 04 Jan 2023 20:38:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x16-20020a5d6510000000b002755e301eeasm33406475wru.100.2023.01.04.20.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 20:38:32 -0800 (PST)
Date: Thu, 5 Jan 2023 07:38:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Shay Drory <shayd@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Saeed Mahameed <saeedm@nvidia.com>,
	Moshe Shemesh <moshe@nvidia.com>
Subject: [linux-next:pending-fixes 137/332]
 drivers/net/ethernet/mellanox/mlx5/core/health.c:701
 mlx5_fw_fatal_reporter_err_work() warn: inconsistent returns
 '&dev->intf_state_mutex'.
Message-ID: <202301051053.ssk20pwE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230105043829.jJOjGqwy4IzHXmSFinmXOCPlFG7sedBildcSxp3i49w@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   2d3ca5d07c8e43c0bdb602fad9396b140f7b9857
commit: 9078e843efec530f279a155f262793c58b0746bd [137/332] net/mlx5: Avoid recovery in probe flows
config: i386-randconfig-m021-20230102
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/health.c:701 mlx5_fw_fatal_reporter_err_work() warn: inconsistent returns '&dev->intf_state_mutex'.

vim +701 drivers/net/ethernet/mellanox/mlx5/core/health.c

b3bd076f7501af Moshe Shemesh 2019-01-27  664  static void mlx5_fw_fatal_reporter_err_work(struct work_struct *work)
b3bd076f7501af Moshe Shemesh 2019-01-27  665  {
b3bd076f7501af Moshe Shemesh 2019-01-27  666  	struct mlx5_fw_reporter_ctx fw_reporter_ctx;
b3bd076f7501af Moshe Shemesh 2019-01-27  667  	struct mlx5_core_health *health;
b3bd076f7501af Moshe Shemesh 2019-01-27  668  	struct mlx5_core_dev *dev;
d3dbdc9f8ddce4 Moshe Shemesh 2022-07-28  669  	struct devlink *devlink;
b3bd076f7501af Moshe Shemesh 2019-01-27  670  	struct mlx5_priv *priv;
b3bd076f7501af Moshe Shemesh 2019-01-27  671  
b3bd076f7501af Moshe Shemesh 2019-01-27  672  	health = container_of(work, struct mlx5_core_health, fatal_report_work);
b3bd076f7501af Moshe Shemesh 2019-01-27  673  	priv = container_of(health, struct mlx5_priv, health);
b3bd076f7501af Moshe Shemesh 2019-01-27  674  	dev = container_of(priv, struct mlx5_core_dev, priv);
d3dbdc9f8ddce4 Moshe Shemesh 2022-07-28  675  	devlink = priv_to_devlink(dev);
b3bd076f7501af Moshe Shemesh 2019-01-27  676  
9078e843efec53 Shay Drory    2022-11-24  677  	mutex_lock(&dev->intf_state_mutex);
9078e843efec53 Shay Drory    2022-11-24  678  	if (test_bit(MLX5_DROP_NEW_HEALTH_WORK, &health->flags)) {
9078e843efec53 Shay Drory    2022-11-24  679  		mlx5_core_err(dev, "health works are not permitted at this stage\n");
9078e843efec53 Shay Drory    2022-11-24  680  		return;

mutex_unlock(&dev->intf_state_mutex);?

9078e843efec53 Shay Drory    2022-11-24  681  	}
9078e843efec53 Shay Drory    2022-11-24  682  	mutex_unlock(&dev->intf_state_mutex);
51d138c2610a23 Shay Drory    2020-11-23  683  	enter_error_state(dev, false);
b3bd076f7501af Moshe Shemesh 2019-01-27  684  	if (IS_ERR_OR_NULL(health->fw_fatal_reporter)) {
d3dbdc9f8ddce4 Moshe Shemesh 2022-07-28  685  		devl_lock(devlink);
b3bd076f7501af Moshe Shemesh 2019-01-27  686  		if (mlx5_health_try_recover(dev))
b3bd076f7501af Moshe Shemesh 2019-01-27  687  			mlx5_core_err(dev, "health recovery failed\n");
d3dbdc9f8ddce4 Moshe Shemesh 2022-07-28  688  		devl_unlock(devlink);
b3bd076f7501af Moshe Shemesh 2019-01-27  689  		return;
b3bd076f7501af Moshe Shemesh 2019-01-27  690  	}
b3bd076f7501af Moshe Shemesh 2019-01-27  691  	fw_reporter_ctx.err_synd = health->synd;
b3bd076f7501af Moshe Shemesh 2019-01-27  692  	fw_reporter_ctx.miss_counter = health->miss_counter;
7f331bf0f060c2 Aya Levin     2021-06-16  693  	if (devlink_health_report(health->fw_fatal_reporter,
7f331bf0f060c2 Aya Levin     2021-06-16  694  				  "FW fatal error reported", &fw_reporter_ctx) == -ECANCELED) {
7f331bf0f060c2 Aya Levin     2021-06-16  695  		/* If recovery wasn't performed, due to grace period,
7f331bf0f060c2 Aya Levin     2021-06-16  696  		 * unload the driver. This ensures that the driver
7f331bf0f060c2 Aya Levin     2021-06-16  697  		 * closes all its resources and it is not subjected to
7f331bf0f060c2 Aya Levin     2021-06-16  698  		 * requests from the kernel.
7f331bf0f060c2 Aya Levin     2021-06-16  699  		 */
7f331bf0f060c2 Aya Levin     2021-06-16  700  		mlx5_core_err(dev, "Driver is in error state. Unloading\n");
7f331bf0f060c2 Aya Levin     2021-06-16 @701  		mlx5_unload_one(dev);
7f331bf0f060c2 Aya Levin     2021-06-16  702  	}
b3bd076f7501af Moshe Shemesh 2019-01-27  703  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

