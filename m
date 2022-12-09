Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D117FA3F;
	Fri,  9 Dec 2022 08:48:24 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 125-20020a1c0283000000b003d1e906ca23so2757999wmc.3;
        Fri, 09 Dec 2022 00:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UBHNtorY+J7StDgE1NEDwmXJfNigTXe7nrbFusL5N4s=;
        b=DDhk7Eb9THqSSCeKjax12kk/ioLQNnqMf7av1npvNtxYItgCPW5MXtYaYYSZDirwCi
         /nVbMc2zmZpoA2uIqoJYUV0EbvkmfX0YWietrZQBmLF42Uq7HEE07CXbSVoAAUxRcT4x
         IQkiAJtYKERmseHH3VYkjBc8oN0HpDcvNLSwtCTwb6aHpHYeVlLle9QiKNMifM7IwXzG
         Lyb5hSoO0Ble4t1eR/nKdVc6YwzmPHEX5Qgvn2WZJd2ufV5k8GHYK0jjFdvcX5QgnXeu
         C7q2OTrJ010C8q7A5mmU0W3xL68pZVYo6pKNgazAEBnENUuWv3gTVX0l2SJQ1uVpJAWQ
         nKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBHNtorY+J7StDgE1NEDwmXJfNigTXe7nrbFusL5N4s=;
        b=DMuI0dQkA/0Aa2MBpSov0ueSl9ZTNEURq5enX1RblNaeJtsQe6kOJPTxwv+ZiKm+8z
         8boNGz7KOOIxupyf/GTbxWtKoSlDop1C3UbSndN1MMhuYg2xAaN8K2uWBkuV8bytdD8y
         wpYBwfWEAAflAkzEngIVOALjiiQca4iE2hRE6ESB/mHp449L8IHuNN46ZUAp4Bz0MpYG
         h+5FcY2w8DCowrywRQXefaYk1s3Q7YvSJhMvoF66c3hwyPNrumv7ou6snXrCh5NgC3mf
         kidvMgP4lHjPnx7XlbpjiapF0QygYjz1r4w0mN5NuoSdi4ZfYWqJ7hJVjDWMtrO5fkyh
         /ItA==
X-Gm-Message-State: ANoB5pmM3KnyjypMeV2mY1LEBpXPZoDxpTCIhspMMs/zKpSUOIuB0FDI
	vp3cRN/QbNIxcEN8MulUj4unQf+dOSCjCeMZ
X-Google-Smtp-Source: AA0mqf5cgaM7N02iXihMn6PVRTtM19uju97gBE6MEC8uDZJru81XI3nbmlH7ApzB9wLxzVa3fWzPVA==
X-Received: by 2002:a7b:c017:0:b0:3cf:8e5d:7184 with SMTP id c23-20020a7bc017000000b003cf8e5d7184mr4014313wmb.28.1670575702783;
        Fri, 09 Dec 2022 00:48:22 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c434700b003d1e34bcbb2sm1094210wme.13.2022.12.09.00.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 00:48:22 -0800 (PST)
Date: Fri, 9 Dec 2022 11:48:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Veerasenareddy Burru <vburru@marvell.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	lironh@marvell.com, aayarekar@marvell.com, sedara@marvell.com,
	sburla@marvell.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	Veerasenareddy Burru <vburru@marvell.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 8/9] octeon_ep: add PF-VF mailbox
 communication
Message-ID: <202212090526.fK0Eqrfp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129130933.25231-9-vburru@marvell.com>
Message-ID: <20221209084817.H9vsH3qEExqa98mSSguZCL-N7Iz5K4mD5XBosiJG-ZI@z>

Hi Veerasenareddy,

url:    https://github.com/intel-lab-lkp/linux/commits/Veerasenareddy-Burru/octeon_ep-Update-PF-mailbox-for-VF/20221130-110134
base:   7a168f560e3c3829b74a893d3655caab14a7aef8
patch link:    https://lore.kernel.org/r/20221129130933.25231-9-vburru%40marvell.com
patch subject: [PATCH net-next v2 8/9] octeon_ep: add PF-VF mailbox communication
config: ia64-randconfig-m041-20221204
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:1105 octep_probe() warn: missing unwind goto?

vim +1105 drivers/net/ethernet/marvell/octeon_ep/octep_main.c

862cd659a6fbac Veerasenareddy Burru 2022-04-12  1046  static int octep_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1047  {
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1048  	struct octep_device *octep_dev = NULL;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1049  	struct net_device *netdev;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1050  	int err;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1051  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1052  	err = pci_enable_device(pdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1053  	if (err) {
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1054  		dev_err(&pdev->dev, "Failed to enable PCI device\n");
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1055  		return  err;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1056  	}
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1057  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1058  	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1059  	if (err) {
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1060  		dev_err(&pdev->dev, "Failed to set DMA mask !!\n");
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1061  		goto err_dma_mask;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1062  	}
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1063  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1064  	err = pci_request_mem_regions(pdev, OCTEP_DRV_NAME);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1065  	if (err) {
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1066  		dev_err(&pdev->dev, "Failed to map PCI memory regions\n");
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1067  		goto err_pci_regions;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1068  	}
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1069  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1070  	pci_enable_pcie_error_reporting(pdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1071  	pci_set_master(pdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1072  
a36869e03997c0 Veerasenareddy Burru 2022-11-29  1073  #define FW_STATUS_READY    1
a36869e03997c0 Veerasenareddy Burru 2022-11-29  1074  	if (get_fw_ready_status(pdev) != FW_STATUS_READY) {
a36869e03997c0 Veerasenareddy Burru 2022-11-29  1075  		dev_notice(&pdev->dev, "Firmware not ready; defer probe.\n");
a36869e03997c0 Veerasenareddy Burru 2022-11-29  1076  		err = -EPROBE_DEFER;
a36869e03997c0 Veerasenareddy Burru 2022-11-29  1077  		goto err_alloc_netdev;
a36869e03997c0 Veerasenareddy Burru 2022-11-29  1078  	}
a36869e03997c0 Veerasenareddy Burru 2022-11-29  1079  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1080  	netdev = alloc_etherdev_mq(sizeof(struct octep_device),
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1081  				   OCTEP_MAX_QUEUES);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1082  	if (!netdev) {
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1083  		dev_err(&pdev->dev, "Failed to allocate netdev\n");
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1084  		err = -ENOMEM;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1085  		goto err_alloc_netdev;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1086  	}
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1087  	SET_NETDEV_DEV(netdev, &pdev->dev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1088  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1089  	octep_dev = netdev_priv(netdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1090  	octep_dev->netdev = netdev;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1091  	octep_dev->pdev = pdev;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1092  	octep_dev->dev = &pdev->dev;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1093  	pci_set_drvdata(pdev, octep_dev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1094  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1095  	err = octep_device_setup(octep_dev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1096  	if (err) {
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1097  		dev_err(&pdev->dev, "Device setup failed\n");
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1098  		goto err_octep_config;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1099  	}
f13f1764c1708a Veerasenareddy Burru 2022-11-29  1100  
f13f1764c1708a Veerasenareddy Burru 2022-11-29  1101  	err = octep_setup_pfvf_mbox(octep_dev);
f13f1764c1708a Veerasenareddy Burru 2022-11-29  1102  	if (err) {
f13f1764c1708a Veerasenareddy Burru 2022-11-29  1103  		dev_err(&pdev->dev, " pfvf mailbox setup failed\n");
f13f1764c1708a Veerasenareddy Burru 2022-11-29  1104  		octep_ctrl_net_uninit(octep_dev);
f13f1764c1708a Veerasenareddy Burru 2022-11-29 @1105  		return err;

This doesn't call free_netdev(netdev); so it's a leak.

The octep_device_cleanup() function calls octep_ctrl_net_uninit() but
presumably calling octep_device_cleanup() if octep_setup_pfvf_mbox()
fails is a bug...  Ideally there would be a function which could clean
up octep_device_setup() and a different function which could clean up
octep_setup_pfvf_mbox() but maybe that's impossible because of weird
ordering constraints.

f13f1764c1708a Veerasenareddy Burru 2022-11-29  1106  	}
f13f1764c1708a Veerasenareddy Burru 2022-11-29  1107  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1108  	INIT_WORK(&octep_dev->tx_timeout_task, octep_tx_timeout_task);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1109  	INIT_WORK(&octep_dev->ctrl_mbox_task, octep_ctrl_mbox_task);
c310a95e2434e5 Veerasenareddy Burru 2022-11-29  1110  	INIT_DELAYED_WORK(&octep_dev->intr_poll_task, octep_intr_poll_task);
c310a95e2434e5 Veerasenareddy Burru 2022-11-29  1111  	octep_dev->poll_non_ioq_intr = true;
c310a95e2434e5 Veerasenareddy Burru 2022-11-29  1112  	queue_delayed_work(octep_wq, &octep_dev->intr_poll_task,
c310a95e2434e5 Veerasenareddy Burru 2022-11-29  1113  			   msecs_to_jiffies(OCTEP_INTR_POLL_TIME_MSECS));
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1114  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1115  	netdev->netdev_ops = &octep_netdev_ops;
5cc256e79bff06 Veerasenareddy Burru 2022-04-12  1116  	octep_set_ethtool_ops(netdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1117  	netif_carrier_off(netdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1118  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1119  	netdev->hw_features = NETIF_F_SG;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1120  	netdev->features |= netdev->hw_features;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1121  	netdev->min_mtu = OCTEP_MIN_MTU;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1122  	netdev->max_mtu = OCTEP_MAX_MTU;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1123  	netdev->mtu = OCTEP_DEFAULT_MTU;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1124  
6494f39ec1f4be Veerasenareddy Burru 2022-11-29  1125  	err = octep_ctrl_net_get_mac_addr(octep_dev, OCTEP_CTRL_NET_INVALID_VFID,
6494f39ec1f4be Veerasenareddy Burru 2022-11-29  1126  					  octep_dev->mac_addr);
848ffce2f0c93f Ziyang Xuan          2022-11-11  1127  	if (err) {
848ffce2f0c93f Ziyang Xuan          2022-11-11  1128  		dev_err(&pdev->dev, "Failed to get mac address\n");
848ffce2f0c93f Ziyang Xuan          2022-11-11  1129  		goto register_dev_err;
848ffce2f0c93f Ziyang Xuan          2022-11-11  1130  	}
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1131  	eth_hw_addr_set(netdev, octep_dev->mac_addr);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1132  
0a03f3c511f57d Yang Yingliang       2022-04-15  1133  	err = register_netdev(netdev);
0a03f3c511f57d Yang Yingliang       2022-04-15  1134  	if (err) {
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1135  		dev_err(&pdev->dev, "Failed to register netdev\n");
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1136  		goto register_dev_err;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1137  	}
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1138  	dev_info(&pdev->dev, "Device probe successful\n");
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1139  	return 0;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1140  
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1141  register_dev_err:
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1142  	octep_device_cleanup(octep_dev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1143  err_octep_config:
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1144  	free_netdev(netdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1145  err_alloc_netdev:
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1146  	pci_disable_pcie_error_reporting(pdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1147  	pci_release_mem_regions(pdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1148  err_pci_regions:
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1149  err_dma_mask:
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1150  	pci_disable_device(pdev);
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1151  	return err;
862cd659a6fbac Veerasenareddy Burru 2022-04-12  1152  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

