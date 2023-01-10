Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D98F17E5;
	Tue, 10 Jan 2023 05:11:00 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso198700wmb.1;
        Mon, 09 Jan 2023 21:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReLrFKfh84Gdpa+LdX4DPx8RCW3Nljx3Icxd0DnXzMM=;
        b=c+lId2L4pVgcH5fy5tDRrbzQ+zwf2zRsw6czeqLhJTvuwauFvIYRQMjK0PgSMFqlsL
         GglxNottTD6N5z0326XcV26CJ08rehQYgAekxArh6g8HqKKdMxbcrUFFpFMRYGOQByI/
         WS1z53aA5UHEvEWD4lYDGQEPoGx6sdmdEms6a1/UFeb37AAztLFcODwKvJt+SWATvn2H
         0LPkqUsIuLedIY1izEMQufAT24i203pm1N8X5S/1lODdKSJmME2gMA9Q5aZSvhMABf3b
         AfL82vsGdN33ChM6jNZ2wFiK9MDkYcJRLysb+mXD/Y9IPjPWTg/THn9dN5ggC883LdgC
         GocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReLrFKfh84Gdpa+LdX4DPx8RCW3Nljx3Icxd0DnXzMM=;
        b=MUvygloPz8Zkuxz1NakApVnk/5Vb8hjRtvLOVYXPiFVW7a9AwzenO7eF8j3A2qNX0B
         N2ylrPJA9kg9nwx1I/PPAutQNTwHt0WOg9A+olTlq51G1zBbKLhF2F523Hl6IzaZ3KSk
         Fri+ZX0XdwmA2CuPiv2dtOtCROItuOjHyYSAHwoKiKVeyajgPh7Qjjyb/a+rnOX3QW/N
         AQ822RVOWbsMqdgncZA7YFz7KC9ogTiuT1foJi6JFefcSw6fRf/cAXaLrQjCCkhkzCj5
         WllXHYBnq3TSLh80Qh6RE7piKTDxTGTD0Ob6ikH+r50lLQ8q05QvyJbvM3WUGje/ArLc
         /xJQ==
X-Gm-Message-State: AFqh2kpJu9JaJS5p7f/l75tcFor8wI7q8Hi21JB4uamlDnSjGJqype9+
	EptAHYPvjyUGR0zDGUoCFfMLgUPwXQs=
X-Google-Smtp-Source: AMrXdXu80iYOf41zcXmSavZBRXwqwt8pB/CK4L/ZGBNVwSJ4xDOhhlw0DvirLKNy3Hqc6hjPmlArTQ==
X-Received: by 2002:a05:600c:35cc:b0:3d3:3c93:af34 with SMTP id r12-20020a05600c35cc00b003d33c93af34mr58559524wmq.2.1673327458290;
        Mon, 09 Jan 2023 21:10:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600c198c00b003d9de0c39fasm16707235wmq.36.2023.01.09.21.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 21:10:57 -0800 (PST)
Date: Tue, 10 Jan 2023 08:10:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Maxim Mikityanskiy <maximmi@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/en/params.c:481
 mlx5e_mpwrq_validate_xsk() error: we previously assumed 'xsk' could be null
 (see line 478)
Message-ID: <202301100424.sL6nSNSL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230110051054.5_7ljqMv7l5jo3IxuMVbhOt7weIPClxBpVpybOB7o5g@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1fe4fd6f5cad346e598593af36caeadc4f5d4fa9
commit: 6470d2e7e8ed8e9dd560d8dc3e09d1100a17ee26 net/mlx5e: xsk: Use KSM for unaligned XSK
config: i386-randconfig-m021-20230102
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en/params.c:481 mlx5e_mpwrq_validate_xsk() error: we previously assumed 'xsk' could be null (see line 478)

Old smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/en/params.c:314 mlx5e_mpwqe_get_log_num_strides() warn: signedness bug returning '(-255)'

vim +/xsk +481 drivers/net/ethernet/mellanox/mlx5/core/en/params.c

44f4fd03b51705 Maxim Mikityanskiy 2022-09-27  474  int mlx5e_mpwrq_validate_xsk(struct mlx5_core_dev *mdev, struct mlx5e_params *params,
44f4fd03b51705 Maxim Mikityanskiy 2022-09-27  475  			     struct mlx5e_xsk_param *xsk)
44f4fd03b51705 Maxim Mikityanskiy 2022-09-27  476  {
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  477  	u8 page_shift = mlx5e_mpwrq_page_shift(mdev, xsk);
6470d2e7e8ed8e Maxim Mikityanskiy 2022-09-29 @478  	bool unaligned = xsk ? xsk->unaligned : false;
                                                                         ^^^
Assumes xsk can be NULL

e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  479  	u16 max_mtu_pkts;
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  480  
6470d2e7e8ed8e Maxim Mikityanskiy 2022-09-29 @481  	if (!mlx5e_check_fragmented_striding_rq_cap(mdev, page_shift, xsk->unaligned))
                                                                                                                      ^^^^^
Unchecked dereference

44f4fd03b51705 Maxim Mikityanskiy 2022-09-27  482  		return -EOPNOTSUPP;
44f4fd03b51705 Maxim Mikityanskiy 2022-09-27  483  
44f4fd03b51705 Maxim Mikityanskiy 2022-09-27  484  	if (!mlx5e_rx_mpwqe_is_linear_skb(mdev, params, xsk))
44f4fd03b51705 Maxim Mikityanskiy 2022-09-27  485  		return -EINVAL;
44f4fd03b51705 Maxim Mikityanskiy 2022-09-27  486  
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  487  	/* Current RQ length is too big for the given frame size, the
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  488  	 * needed number of WQEs exceeds the maximum.
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  489  	 */
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  490  	max_mtu_pkts = min_t(u8, MLX5E_PARAMS_MAXIMUM_LOG_RQ_SIZE,
6470d2e7e8ed8e Maxim Mikityanskiy 2022-09-29  491  			     mlx5e_mpwrq_max_log_rq_pkts(mdev, page_shift, unaligned));
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  492  	if (params->log_rq_mtu_frames > max_mtu_pkts) {
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  493  		mlx5_core_err(mdev, "Current RQ length %d is too big for XSK with given frame size %u\n",
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  494  			      1 << params->log_rq_mtu_frames, xsk->chunk_size);
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  495  		return -EINVAL;
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  496  	}
e5a3cc83d54019 Maxim Mikityanskiy 2022-09-29  497  
44f4fd03b51705 Maxim Mikityanskiy 2022-09-27  498  	return 0;
b3a131c2a1602e Tariq Toukan       2021-03-07  499  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

