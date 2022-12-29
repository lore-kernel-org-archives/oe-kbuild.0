Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DAB1C06;
	Thu, 29 Dec 2022 09:06:03 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso12807063wmb.0;
        Thu, 29 Dec 2022 01:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75Rhb7yr4CFALeAESpUIY1hruG7ddcbfO3zbvxmqiH0=;
        b=DQGCnoF7rxoGdN6dXxDyiHk5VWScUYolP70xQ9EroV7lyVX74VHu0QdVuJybHSBSj+
         UmIsNdkzni1wSXtj7AcXlPuIGgyr8JB9d8l7pQG6F45XP7ia1KULgmZr7LzoXv7Iqn7A
         NnOSpsm08Hco5aXkjScGpQ9z0oj9FyZWkaWHwXZqUxFCFjpf6rS8poI44nSO4AAbji26
         G3hGTRCvKZPrhCPWUQLlzsGcClqPfESph9qtqfzEO0rKmilzp4zvbXS8ywWGxq8zpPZD
         DI2xW5tT1MCsbNhywVH1TfPQDhvcWjsej6MFrK/3tXWGAaHdcw9Mg4gSHvtaglplTNnu
         s94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75Rhb7yr4CFALeAESpUIY1hruG7ddcbfO3zbvxmqiH0=;
        b=Vsu21bDIWhgKlkY2Bx244liDYSbFsNpsPCj+AGsJ+SM/9S2e4uXYMVXD0hIjIO8KZs
         hrVRp/lJ+9fTQqOGwLECuQuIhAUOXX3fimka2Qez3r4/QbHAvSfczr7sjToDSv05oJgW
         DTL6qXHDoWQyQ0m4aQegCvSUUjDqFim72hDnqOWFlvmGOMe1xyXCVF0To01RIJM8i34P
         UHpQTHnWuwSJcXjDFzdR0pgIbxANL9xogCmbQnoXO5rqNvT2J7jr7DWPPA34iCoZvTd+
         p1eyI8Ema7ULVcJahZJeU6yHqLdB5uoq77slrTKOj2MXulMA/mzn2GHjhHS2BXknnvSM
         AfWA==
X-Gm-Message-State: AFqh2kpSxXasybeTaX/XwqCm1npD0kWJkyIgl0CvfqWpjxgN5YvQ0mW/
	b0OdowlbLlsJ1aawVCeXwFAsdkNRK5Nk1Q==
X-Google-Smtp-Source: AMrXdXvCenDHhsBYy4xBubR3lORanAhgPCqxK/T3BBuB7Sp/HUqghcPB1BewFS3CuRYHnLckAcsr0w==
X-Received: by 2002:a05:600c:4e53:b0:3c6:e60f:3f4a with SMTP id e19-20020a05600c4e5300b003c6e60f3f4amr19246203wmq.1.1672304762056;
        Thu, 29 Dec 2022 01:06:02 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id iv7-20020a05600c548700b003d35c09d4b9sm32514263wmb.40.2022.12.29.00.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 01:06:01 -0800 (PST)
Date: Thu, 29 Dec 2022 11:58:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Paul M Stillwell Jr <paul.m.stillwell.jr@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-net-queue:dev-queue 2/17]
 drivers/net/ethernet/intel/ice/ice_main.c:4921 ice_probe() warn: missing
 error code 'err'
Message-ID: <202212291532.mOisbpke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221229085808.nbUBdB_52uC8MqqjlC2aOplV0eY5vIS4x1W2ILOEw74@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
head:   c342bc11f5a438cf39e2280bafda39ec2c6953f1
commit: e51d0e34580892d22107a85390d1752fa7a7d56a [2/17] ice: move devlink port creation/deletion
config: powerpc-randconfig-m031-20221226
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/ethernet/intel/ice/ice_main.c:4921 ice_probe() warn: missing error code 'err'

vim +/err +4921 drivers/net/ethernet/intel/ice/ice_main.c

df006dd4b1dca8 Dave Ertman            2020-11-20  4908  	if (ice_init_lag(pf))
df006dd4b1dca8 Dave Ertman            2020-11-20  4909  		dev_warn(dev, "Failed to init link aggregation support\n");
df006dd4b1dca8 Dave Ertman            2020-11-20  4910  
e18ff118181bca Paul Greenwalt         2019-10-09  4911  	/* print PCI link speed and width */
e18ff118181bca Paul Greenwalt         2019-10-09  4912  	pcie_print_link_status(pf->pdev);
e18ff118181bca Paul Greenwalt         2019-10-09  4913  
de75135b5c04c9 Anirudh Venkataramanan 2020-05-07  4914  probe_done:
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4915  	err = ice_devlink_create_pf_port(pf);
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4916  	if (err)
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4917  		goto err_create_pf_port;
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4918  
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4919  	vsi = ice_get_main_vsi(pf);
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4920  	if (!vsi || !vsi->netdev)
e51d0e34580892 Paul M Stillwell Jr    2022-11-18 @4921  		goto err_netdev_reg;

This seems like an error path so "err = -EINVAL;"

e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4922  
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4923  	SET_NETDEV_DEVLINK_PORT(vsi->netdev, &pf->devlink_port);
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4924  
1e23f076b25424 Anirudh Venkataramanan 2021-03-02  4925  	err = ice_register_netdev(pf);
1e23f076b25424 Anirudh Venkataramanan 2021-03-02  4926  	if (err)
1e23f076b25424 Anirudh Venkataramanan 2021-03-02  4927  		goto err_netdev_reg;
1e23f076b25424 Anirudh Venkataramanan 2021-03-02  4928  
e523af4ee56090 Shiraz Saleem          2021-10-18  4929  	err = ice_devlink_register_params(pf);
e523af4ee56090 Shiraz Saleem          2021-10-18  4930  	if (err)
e523af4ee56090 Shiraz Saleem          2021-10-18  4931  		goto err_netdev_reg;
e523af4ee56090 Shiraz Saleem          2021-10-18  4932  
de75135b5c04c9 Anirudh Venkataramanan 2020-05-07  4933  	/* ready to go, so clear down state bit */
7e408e07b42dce Anirudh Venkataramanan 2021-03-02  4934  	clear_bit(ICE_DOWN, pf->state);
88f62aea1cff0c Dave Ertman            2022-02-11  4935  	if (ice_is_rdma_ena(pf)) {
d25a0fc41c1f92 Dave Ertman            2021-05-20  4936  		pf->aux_idx = ida_alloc(&ice_aux_ida, GFP_KERNEL);
d25a0fc41c1f92 Dave Ertman            2021-05-20  4937  		if (pf->aux_idx < 0) {
d25a0fc41c1f92 Dave Ertman            2021-05-20  4938  			dev_err(dev, "Failed to allocate device ID for AUX driver\n");
d25a0fc41c1f92 Dave Ertman            2021-05-20  4939  			err = -ENOMEM;
e523af4ee56090 Shiraz Saleem          2021-10-18  4940  			goto err_devlink_reg_param;
d25a0fc41c1f92 Dave Ertman            2021-05-20  4941  		}
d25a0fc41c1f92 Dave Ertman            2021-05-20  4942  
d25a0fc41c1f92 Dave Ertman            2021-05-20  4943  		err = ice_init_rdma(pf);
d25a0fc41c1f92 Dave Ertman            2021-05-20  4944  		if (err) {
d25a0fc41c1f92 Dave Ertman            2021-05-20  4945  			dev_err(dev, "Failed to initialize RDMA: %d\n", err);
d25a0fc41c1f92 Dave Ertman            2021-05-20  4946  			err = -EIO;
d25a0fc41c1f92 Dave Ertman            2021-05-20  4947  			goto err_init_aux_unroll;
d25a0fc41c1f92 Dave Ertman            2021-05-20  4948  		}
d25a0fc41c1f92 Dave Ertman            2021-05-20  4949  	} else {
d25a0fc41c1f92 Dave Ertman            2021-05-20  4950  		dev_warn(dev, "RDMA is not supported on this device\n");
d25a0fc41c1f92 Dave Ertman            2021-05-20  4951  	}
d25a0fc41c1f92 Dave Ertman            2021-05-20  4952  
838cefd5e52c4a Leon Romanovsky        2021-09-25  4953  	ice_devlink_register(pf);
837f08fdecbe4b Anirudh Venkataramanan 2018-03-20  4954  	return 0;
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  4955  
d25a0fc41c1f92 Dave Ertman            2021-05-20  4956  err_init_aux_unroll:
d25a0fc41c1f92 Dave Ertman            2021-05-20  4957  	pf->adev = NULL;
d25a0fc41c1f92 Dave Ertman            2021-05-20  4958  	ida_free(&ice_aux_ida, pf->aux_idx);
e523af4ee56090 Shiraz Saleem          2021-10-18  4959  err_devlink_reg_param:
e523af4ee56090 Shiraz Saleem          2021-10-18  4960  	ice_devlink_unregister_params(pf);
1e23f076b25424 Anirudh Venkataramanan 2021-03-02  4961  err_netdev_reg:
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4962  	ice_devlink_destroy_pf_port(pf);
e51d0e34580892 Paul M Stillwell Jr    2022-11-18  4963  err_create_pf_port:
78116e979ddc49 Marcin Szycik          2020-07-13  4964  err_send_version_unroll:
78116e979ddc49 Marcin Szycik          2020-07-13  4965  	ice_vsi_release_all(pf);
3a858ba392c3b1 Anirudh Venkataramanan 2018-03-20  4966  err_alloc_sw_unroll:
7e408e07b42dce Anirudh Venkataramanan 2021-03-02  4967  	set_bit(ICE_SERVICE_DIS, pf->state);
7e408e07b42dce Anirudh Venkataramanan 2021-03-02  4968  	set_bit(ICE_DOWN, pf->state);
4015d11e4b9720 Brett Creeley          2019-11-08  4969  	devm_kfree(dev, pf->first_sw);
940b61af02f497 Anirudh Venkataramanan 2018-03-20  4970  err_msix_misc_unroll:
940b61af02f497 Anirudh Venkataramanan 2018-03-20  4971  	ice_free_irq_msix_misc(pf);
940b61af02f497 Anirudh Venkataramanan 2018-03-20  4972  err_init_interrupt_unroll:
940b61af02f497 Anirudh Venkataramanan 2018-03-20  4973  	ice_clear_interrupt_scheme(pf);
288ecf491b1654 Benjamin Mikailenko    2022-11-18  4974  err_init_vsi_stats_unroll:
288ecf491b1654 Benjamin Mikailenko    2022-11-18  4975  	devm_kfree(dev, pf->vsi_stats);
288ecf491b1654 Benjamin Mikailenko    2022-11-18  4976  	pf->vsi_stats = NULL;
bc3a024101ca49 Jacob Keller           2020-05-15  4977  err_init_vsi_unroll:
77ed84f49aeed1 Bruce Allan            2019-02-08  4978  	devm_kfree(dev, pf->vsi);
940b61af02f497 Anirudh Venkataramanan 2018-03-20  4979  err_init_pf_unroll:
940b61af02f497 Anirudh Venkataramanan 2018-03-20  4980  	ice_deinit_pf(pf);
dce730f17825f4 Jacob Keller           2020-03-26  4981  	ice_devlink_destroy_regions(pf);
940b61af02f497 Anirudh Venkataramanan 2018-03-20  4982  	ice_deinit_hw(hw);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  4983  err_exit_unroll:
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  4984  	pci_disable_pcie_error_reporting(pdev);
769c500dcc1edb Akeem G Abodunrin      2020-07-09  4985  	pci_disable_device(pdev);
f31e4b6fe227df Anirudh Venkataramanan 2018-03-20  4986  	return err;
837f08fdecbe4b Anirudh Venkataramanan 2018-03-20  4987  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

