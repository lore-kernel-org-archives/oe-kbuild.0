Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F532564;
	Mon,  9 Jan 2023 08:23:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso6508566wmb.1;
        Mon, 09 Jan 2023 00:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a578hTGGRypT8VpwIYUDy4Cpht4E/0RV6MNINJJ/5NI=;
        b=e89qUKg6TbIxQZguGxwx0RUdCaVkQyTvIe0A7dw84u/cFFfqf3bbh3snQNH2tSRPqd
         C1HiJqv4LvlobJv9TZdb99/KSbItt8WlgkjSJ0f+kGJ+/31tJmXQ0fZjrIbMuL1JMOmg
         zXIlH7HZAvqtq4wtU5YPno8UrBP8i2zdWn/6mqk8XECe8gWIx2lqauzAv+TlZzOd/NQ1
         dIOZQCECnEfZ+PN0ObZmDp911EQ2DsVeIXpnXOosfiJ0EKskamYy/YIFwr8eRc9iBTbi
         JY9xmPXiUiYxeUhLxyeTPelg+3MaXZWSeW4XIc0/jG6teYS5Om8OifAumGisAJ+tos9P
         wlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a578hTGGRypT8VpwIYUDy4Cpht4E/0RV6MNINJJ/5NI=;
        b=vIdSNbXJ9lLXgDjJ4Dok+C7yUj5T2XqxildNjSqLt+IvzqeqRjKPra4xxBYys28J3m
         7Itn52u2oDZiVuLv3W3ZUVaeSKlE71wfKEWIUzIiYidY9rUMs5l6+Ht3HvpWaFTL0QZv
         UnKfjsUnsVl+jIhFVWMbVip7i4tsPCGRDb2myboOHcaDMox8VkaJZjyEvHscM6lmYLDc
         uS7+aiKm9IHbddkxE3qjD6MiQjYY7dhJxrr62pwMUyfdcPEyBjIGyHBqsMXfwEFSzva8
         4d0Ull/GGiOCfUIe8sdfaeZ0wy5zawFQOG4hP7LwmdORrvL6a+135XDNN1I/kqU5cXv1
         mljQ==
X-Gm-Message-State: AFqh2kqtxVbgcoA2bxH13KmQsf4JX0lOsGH5guE5GGHF72bBgXbaxusp
	T/5RQXhGddakT4aW21BwCvSfJmxp6r8=
X-Google-Smtp-Source: AMrXdXsL/AU6JwAaVmqJhPXyAn/AXc9czR/lbQuED6Lk3MKAWZvgQLHXoAuQaOGn1QBy3o50uBwngg==
X-Received: by 2002:a05:600c:1da3:b0:3d2:1761:3742 with SMTP id p35-20020a05600c1da300b003d217613742mr47614534wms.15.1673252602129;
        Mon, 09 Jan 2023 00:23:22 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z25-20020a1c4c19000000b003d1e1f421bfsm14834348wmf.10.2023.01.09.00.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 00:23:21 -0800 (PST)
Date: Mon, 9 Jan 2023 11:23:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Sylwester Dziedziuch <sylwesterx.dziedziuch@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Piotr Raczynski <piotr.raczynski@intel.com>,
	Andrii Staikov <andrii.staikov@intel.com>,
	Kamil Maziarz <kamil.maziarz@intel.com>
Subject: [tnguy-net-queue:dev-queue 17/18]
 drivers/net/ethernet/intel/i40e/i40e_main.c:13383 i40e_xdp_setup() warn:
 missing error code 'ret'
Message-ID: <202301090023.M6DN1R1S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20230109082318.G8-uPFIdFIQhkFQ0QPfCY8fHsRpda1ymPovIVSS2opM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
head:   1504740fc0229fa18e23c48232af1b8ef66608b2
commit: 599984216d420ff4877ba95f5bdb3cf0928206c0 [17/18] i40e: Fix crash when rebuild fails in i40e_xdp_setup
config: arc-randconfig-m031-20230108
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_main.c:13383 i40e_xdp_setup() warn: missing error code 'ret'

Old smatch warnings:
drivers/net/ethernet/intel/i40e/i40e_main.c:13573 i40e_queue_pair_toggle_rings() warn: missing error code? 'ret'
drivers/net/ethernet/intel/i40e/i40e_main.c:14361 i40e_vsi_setup_vectors() warn: missing error code? 'ret'

vim +/ret +13383 drivers/net/ethernet/intel/i40e/i40e_main.c

613142b0bb8840 Eryk Rybak           2021-01-14  13350  static int i40e_xdp_setup(struct i40e_vsi *vsi, struct bpf_prog *prog,
613142b0bb8840 Eryk Rybak           2021-01-14  13351  			  struct netlink_ext_ack *extack)
0c8493d90b6bb0 Björn Töpel          2017-05-24  13352  {
0c8493d90b6bb0 Björn Töpel          2017-05-24  13353  	int frame_size = vsi->netdev->mtu + ETH_HLEN + ETH_FCS_LEN + VLAN_HLEN;
599984216d420f Sylwester Dziedziuch 2022-12-21  13354  	bool is_xdp_enabled = i40e_enabled_xdp_vsi(vsi);
599984216d420f Sylwester Dziedziuch 2022-12-21  13355  	bool if_running = netif_running(vsi->netdev);
599984216d420f Sylwester Dziedziuch 2022-12-21  13356  	bool need_reinit = is_xdp_enabled != !!prog;
0c8493d90b6bb0 Björn Töpel          2017-05-24  13357  	struct i40e_pf *pf = vsi->back;
0c8493d90b6bb0 Björn Töpel          2017-05-24  13358  	struct bpf_prog *old_prog;
599984216d420f Sylwester Dziedziuch 2022-12-21  13359  	int ret = 0;
0c8493d90b6bb0 Björn Töpel          2017-05-24  13360  
0c8493d90b6bb0 Björn Töpel          2017-05-24  13361  	/* Don't allow frames that span over multiple buffers */
0c87b545a2ed5c Bartosz Staszewski   2022-12-09  13362  	if (frame_size > i40e_calculate_vsi_rx_buf_len(vsi)) {
613142b0bb8840 Eryk Rybak           2021-01-14  13363  		NL_SET_ERR_MSG_MOD(extack, "MTU too large to enable XDP");
0c8493d90b6bb0 Björn Töpel          2017-05-24  13364  		return -EINVAL;
613142b0bb8840 Eryk Rybak           2021-01-14  13365  	}
0c8493d90b6bb0 Björn Töpel          2017-05-24  13366  
6533e558c6505e Karen Sornek         2022-01-12  13367  	/* VSI shall be deleted in a moment, just return EINVAL */
6533e558c6505e Karen Sornek         2022-01-12  13368  	if (test_bit(__I40E_IN_REMOVE, pf->state))
6533e558c6505e Karen Sornek         2022-01-12  13369  		return -EINVAL;
6533e558c6505e Karen Sornek         2022-01-12  13370  
0c8493d90b6bb0 Björn Töpel          2017-05-24  13371  	old_prog = xchg(&vsi->xdp_prog, prog);
0c8493d90b6bb0 Björn Töpel          2017-05-24  13372  
599984216d420f Sylwester Dziedziuch 2022-12-21  13373  	if (!need_reinit)
599984216d420f Sylwester Dziedziuch 2022-12-21  13374  		goto assign_prog;
599984216d420f Sylwester Dziedziuch 2022-12-21  13375  
599984216d420f Sylwester Dziedziuch 2022-12-21  13376  	if (if_running && !test_and_set_bit(__I40E_VSI_DOWN, vsi->state))
599984216d420f Sylwester Dziedziuch 2022-12-21  13377  		i40e_down(vsi);
599984216d420f Sylwester Dziedziuch 2022-12-21  13378  
599984216d420f Sylwester Dziedziuch 2022-12-21  13379  	vsi = i40e_vsi_reinit_setup(vsi, true);
599984216d420f Sylwester Dziedziuch 2022-12-21  13380  
599984216d420f Sylwester Dziedziuch 2022-12-21  13381  	if (!vsi) {
599984216d420f Sylwester Dziedziuch 2022-12-21  13382  		NL_SET_ERR_MSG_MOD(extack, "Failed to reinitialize VSI during XDP setup");
599984216d420f Sylwester Dziedziuch 2022-12-21 @13383  		goto err_vsi_setup;

ret = -ESOMETHING;

b3873a5be757b4 Maxim Mikityanskiy   2019-12-17  13384  	}
0c8493d90b6bb0 Björn Töpel          2017-05-24  13385  
599984216d420f Sylwester Dziedziuch 2022-12-21  13386  	/* allocate descriptors */
599984216d420f Sylwester Dziedziuch 2022-12-21  13387  	ret = i40e_vsi_setup_tx_resources(vsi);
599984216d420f Sylwester Dziedziuch 2022-12-21  13388  	if (ret) {
599984216d420f Sylwester Dziedziuch 2022-12-21  13389  		NL_SET_ERR_MSG_MOD(extack, "Failed to configure TX resources during XDP setup");
599984216d420f Sylwester Dziedziuch 2022-12-21  13390  		goto err_setup_tx;
599984216d420f Sylwester Dziedziuch 2022-12-21  13391  	}
599984216d420f Sylwester Dziedziuch 2022-12-21  13392  	ret = i40e_vsi_setup_rx_resources(vsi);
599984216d420f Sylwester Dziedziuch 2022-12-21  13393  	if (ret) {
599984216d420f Sylwester Dziedziuch 2022-12-21  13394  		NL_SET_ERR_MSG_MOD(extack, "Failed to configure RX resources during XDP setup");
599984216d420f Sylwester Dziedziuch 2022-12-21  13395  		goto err_setup_rx;
aae425efdfd1b1 Jan Sokolowski       2022-10-12  13396  	}
aae425efdfd1b1 Jan Sokolowski       2022-10-12  13397  
599984216d420f Sylwester Dziedziuch 2022-12-21  13398  	if (!is_xdp_enabled && prog)
599984216d420f Sylwester Dziedziuch 2022-12-21  13399  		ret = i40e_realloc_rx_bi_zc(vsi, true);
599984216d420f Sylwester Dziedziuch 2022-12-21  13400  	else if (is_xdp_enabled && !prog)
599984216d420f Sylwester Dziedziuch 2022-12-21  13401  		ret = i40e_realloc_rx_bi_zc(vsi, false);
599984216d420f Sylwester Dziedziuch 2022-12-21  13402  
599984216d420f Sylwester Dziedziuch 2022-12-21  13403  	if (ret) {
599984216d420f Sylwester Dziedziuch 2022-12-21  13404  		NL_SET_ERR_MSG_MOD(extack, "Failed to reallocate RX resources during XDP setup");
599984216d420f Sylwester Dziedziuch 2022-12-21  13405  		goto err_vsi_setup;
599984216d420f Sylwester Dziedziuch 2022-12-21  13406  	}
599984216d420f Sylwester Dziedziuch 2022-12-21  13407  
599984216d420f Sylwester Dziedziuch 2022-12-21  13408  	if (if_running) {
599984216d420f Sylwester Dziedziuch 2022-12-21  13409  		ret = i40e_up(vsi);
599984216d420f Sylwester Dziedziuch 2022-12-21  13410  
599984216d420f Sylwester Dziedziuch 2022-12-21  13411  		if (ret) {
599984216d420f Sylwester Dziedziuch 2022-12-21  13412  			NL_SET_ERR_MSG_MOD(extack, "Failed to open VSI during XDP setup");
599984216d420f Sylwester Dziedziuch 2022-12-21  13413  			goto err_vsi_setup;
599984216d420f Sylwester Dziedziuch 2022-12-21  13414  		}
599984216d420f Sylwester Dziedziuch 2022-12-21  13415  	}
599984216d420f Sylwester Dziedziuch 2022-12-21  13416  
599984216d420f Sylwester Dziedziuch 2022-12-21  13417  assign_prog:
599984216d420f Sylwester Dziedziuch 2022-12-21  13418  	i40e_vsi_assign_bpf_prog(vsi, prog);
0c8493d90b6bb0 Björn Töpel          2017-05-24  13419  
0c8493d90b6bb0 Björn Töpel          2017-05-24  13420  	if (old_prog)
0c8493d90b6bb0 Björn Töpel          2017-05-24  13421  		bpf_prog_put(old_prog);
0c8493d90b6bb0 Björn Töpel          2017-05-24  13422  
14ffeb52f3693a Magnus Karlsson      2019-01-29  13423  	/* Kick start the NAPI context if there is an AF_XDP socket open
14ffeb52f3693a Magnus Karlsson      2019-01-29  13424  	 * on that queue id. This so that receiving will start.
14ffeb52f3693a Magnus Karlsson      2019-01-29  13425  	 */
599984216d420f Sylwester Dziedziuch 2022-12-21  13426  	if (need_reinit && prog)
599984216d420f Sylwester Dziedziuch 2022-12-21  13427  		i40e_vsi_rx_napi_schedule(vsi);
14ffeb52f3693a Magnus Karlsson      2019-01-29  13428  
0c8493d90b6bb0 Björn Töpel          2017-05-24  13429  	return 0;
599984216d420f Sylwester Dziedziuch 2022-12-21  13430  
599984216d420f Sylwester Dziedziuch 2022-12-21  13431  err_setup_rx:
599984216d420f Sylwester Dziedziuch 2022-12-21  13432  	i40e_vsi_free_rx_resources(vsi);
599984216d420f Sylwester Dziedziuch 2022-12-21  13433  err_setup_tx:
599984216d420f Sylwester Dziedziuch 2022-12-21  13434  	i40e_vsi_free_tx_resources(vsi);
599984216d420f Sylwester Dziedziuch 2022-12-21  13435  err_vsi_setup:
599984216d420f Sylwester Dziedziuch 2022-12-21  13436  	i40e_do_reset(pf, I40E_PF_RESET_FLAG, true);
599984216d420f Sylwester Dziedziuch 2022-12-21  13437  	i40e_vsi_assign_bpf_prog(vsi, old_prog);
599984216d420f Sylwester Dziedziuch 2022-12-21  13438  
599984216d420f Sylwester Dziedziuch 2022-12-21  13439  	return ret;
0c8493d90b6bb0 Björn Töpel          2017-05-24  13440  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

