Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445A96FAB;
	Tue, 21 Feb 2023 16:54:11 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id 6so4764137wrb.11;
        Tue, 21 Feb 2023 08:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbWYngeCadFKqGA240sb/SJZ7hSohNtA8+THdt0x0kQ=;
        b=NtrRvvA9p13aaDnw/gLcpRXCK671TeMD953mHwXMILgjMf9iv6l3IsyrVJkEV7vq3x
         ZYVyP6tAmFIrmQC3PtSA0ljL5BNrMJoZg5ZF/RK2qpC5OYRywyb9UqmKP39vVD1aUo/h
         aYWG/qc/YG/eab1bM9Mdv5Ucr8EeKOjDBTAl7fDFxg1V3ibb4FMRnmBiI/hLc+bg7c/n
         Qng44Ma/SvRjY+ZyzPcIVgo20NlTh7TPfRVsW6enQl7cNLjmUpF3UyqBPybw6cy3IfCb
         gL4iz+oHB0AcluVdCWZVaYVS4t0IV/x9pKdJESs8ErMT7kq8SBbFFv7iapTXg5iU0HJ9
         716Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbWYngeCadFKqGA240sb/SJZ7hSohNtA8+THdt0x0kQ=;
        b=16QLz+3iqkUkot4FqBHJGYTmaAKJZYSxioW++FiTlCpIKyBKL4dX3EfG+UQuPoeJBl
         0ez+RsX4/qFJKiMhOjIOo+FKiYD4oqC9a1wNf60ch63U6c3m1pdlH4MIjv6QVFDIhYSU
         mXe+pDphISxPPTQ9zMJO6Wq7YxkeMjLSB8f4vgUGFpW1p7sfVYMH6wtcm/U3USt63x/w
         llrJ8eBGzMw2wN1pjRpV4T0F4sWkKBzuJfBa3Rhlz7p69eJzQlQDca7+LLx/6BhlaAPq
         c2H6vtOnbBVbs0UFNt5huGJaMnHUZcL4FTL/2baR80h6JvMTFVlgxoRSlxKn0Dnyq6ua
         4jyg==
X-Gm-Message-State: AO0yUKX0d8I2hKcvrp90RPt62D5PHASNdJW0QVrKGtyTkmVYrcY6JPlq
	5QUZlyn/mxuD/7QQofR0w4scydDglEI=
X-Google-Smtp-Source: AK7set/uAQKy4a0Mvt24/CBiYkwqUkucbiaw0h/70ehgHb9VoQH5b5hK76IyvTxywyeBIns7qnXnLg==
X-Received: by 2002:a5d:6950:0:b0:2bf:cfb4:2e1 with SMTP id r16-20020a5d6950000000b002bfcfb402e1mr4520958wrw.45.1676998449100;
        Tue, 21 Feb 2023 08:54:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q6-20020a05600c46c600b003dc47d458cdsm5629715wmo.15.2023.02.21.08.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 08:54:08 -0800 (PST)
Date: Tue, 21 Feb 2023 19:54:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Parav Pandit <parav@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Saeed Mahameed <saeedm@nvidia.com>, Shay Drory <shayd@nvidia.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [linux-next:master 13057/13664]
 drivers/net/ethernet/mellanox/mlx5/core/eq.c:1010
 mlx5_comp_irq_get_affinity_mask() warn: iterator used outside loop: 'eq'
Message-ID: <202302220006.nXIY6No9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230221165404.OV_ofO9zRNmiot4VodtivwE_0aGtjePOWO6RgmGVn_8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   465461cf48465b8a0a54025db5ae2b3df7a04577
commit: 3ac0b6aa892a1961d3bc62c87e3e3c9646e9d309 [13057/13664] net/mlx5: Simplify eq list traversal
config: s390-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230222/202302220006.nXIY6No9-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302220006.nXIY6No9-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eq.c:1010 mlx5_comp_irq_get_affinity_mask() warn: iterator used outside loop: 'eq'

vim +/eq +1010 drivers/net/ethernet/mellanox/mlx5/core/eq.c

f2f3df5501391b Saeed Mahameed 2018-11-19   998  struct cpumask *
f2f3df5501391b Saeed Mahameed 2018-11-19   999  mlx5_comp_irq_get_affinity_mask(struct mlx5_core_dev *dev, int vector)
f2f3df5501391b Saeed Mahameed 2018-11-19  1000  {
fc63dd2a85be1f Shay Drory     2021-02-23  1001  	struct mlx5_eq_table *table = dev->priv.eq_table;
3ac0b6aa892a19 Parav Pandit   2023-02-15  1002  	struct mlx5_eq_comp *eq;
fc63dd2a85be1f Shay Drory     2021-02-23  1003  	int i = 0;
fc63dd2a85be1f Shay Drory     2021-02-23  1004  
3ac0b6aa892a19 Parav Pandit   2023-02-15  1005  	list_for_each_entry(eq, &table->comp_eqs_list, list) {
fc63dd2a85be1f Shay Drory     2021-02-23  1006  		if (i++ == vector)
fc63dd2a85be1f Shay Drory     2021-02-23  1007  			break;
fc63dd2a85be1f Shay Drory     2021-02-23  1008  	}
561aa15ad69e9d Yuval Avnery   2019-06-10  1009  
fc63dd2a85be1f Shay Drory     2021-02-23 @1010  	return mlx5_irq_get_affinity_mask(eq->core.irq);
                                                                                          ^^^^
Iterator points to bogus memory if we exited the loop without finding
if (i++ == vector) and hitting the break.

f2f3df5501391b Saeed Mahameed 2018-11-19  1011  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

