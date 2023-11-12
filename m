Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377E615D1
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Nov 2023 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHhQ6o/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699796423; x=1731332423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWcHa1m5hd6olpyQVFMjBVwaZI2cFClygT4rRXsaSAU=;
  b=DHhQ6o/hmVIDUVgATeGzPKHRnUzib6r6fi2j4nLmQNI3QgqtFeD0trPa
   8xZxUuf5nOXMBr8wb3GeUNrCveWDaJch+zEKvOpQ11ntQFmgj0CupABFV
   4m5Zh8qwBidzETuuglaWLZUbimOdxp8AFWr8io/a2EbB57rXPM3fgQitS
   cT3+csJ9/A2ACjkY7MBy1CLt+8k3qH56qWRV0wTa3Nb++Mm7e+OR3OwW3
   l1aGMzENUiqZO3IacyvH/zDQ/uYvOQAZkudHsR14aelif3QquHEoLHqg1
   vVDx5mvrOmo37if/LhWa6Z7mLFSy93FvAElCGOvS6QUCzj9J5yfHAf2dX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="476555135"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="476555135"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 05:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="767689997"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="767689997"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Nov 2023 05:40:20 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2AhG-000BBS-2k;
	Sun, 12 Nov 2023 13:40:18 +0000
Date: Sun, 12 Nov 2023 21:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linyunsheng:devmem 2/6] drivers/bluetooth/btmtkuart.c:944
 btmtkuart_probe() warn: 'bdev->osc' from clk_prepare_enable() not released
 on lines: 944.
Message-ID: <202311122143.T9TCPCAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jakub Kicinski <kuba@kernel.org>
CC: Yunsheng Lin <linyunsheng@huawei.com>
CC: Mina Almasry <almasrymina@google.com>

tree:   https://github.com/gestionlin/linux.git devmem
head:   7a7ba800a9e8fb07001a3e478b385f86011a5fdc
commit: 1f7327b09abea7e8a7ef2f95b584ad4d48f785dc [2/6] net: page_pool: create hooks for custom page providers
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20231112 (https://download.01.org/0day-ci/archive/20231112/202311122143.T9TCPCAh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311122143.T9TCPCAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311122143.T9TCPCAh-lkp@intel.com/

smatch warnings:
drivers/bluetooth/btmtkuart.c:944 btmtkuart_probe() warn: 'bdev->osc' from clk_prepare_enable() not released on lines: 944.
net/core/page_pool.c:302 page_pool_page_in_pref_node() warn: inconsistent indenting

vim +944 drivers/bluetooth/btmtkuart.c

22eaf6c9946ae2 Sean Wang    2019-03-03  830  
7237c4c9ec92e1 Sean Wang    2018-08-08  831  static int btmtkuart_probe(struct serdev_device *serdev)
7237c4c9ec92e1 Sean Wang    2018-08-08  832  {
7237c4c9ec92e1 Sean Wang    2018-08-08  833  	struct btmtkuart_dev *bdev;
7237c4c9ec92e1 Sean Wang    2018-08-08  834  	struct hci_dev *hdev;
22eaf6c9946ae2 Sean Wang    2019-03-03  835  	int err;
7237c4c9ec92e1 Sean Wang    2018-08-08  836  
7237c4c9ec92e1 Sean Wang    2018-08-08  837  	bdev = devm_kzalloc(&serdev->dev, sizeof(*bdev), GFP_KERNEL);
7237c4c9ec92e1 Sean Wang    2018-08-08  838  	if (!bdev)
7237c4c9ec92e1 Sean Wang    2018-08-08  839  		return -ENOMEM;
7237c4c9ec92e1 Sean Wang    2018-08-08  840  
22eaf6c9946ae2 Sean Wang    2019-03-03  841  	bdev->data = of_device_get_match_data(&serdev->dev);
22eaf6c9946ae2 Sean Wang    2019-03-03  842  	if (!bdev->data)
22eaf6c9946ae2 Sean Wang    2019-03-03  843  		return -ENODEV;
7237c4c9ec92e1 Sean Wang    2018-08-08  844  
7237c4c9ec92e1 Sean Wang    2018-08-08  845  	bdev->serdev = serdev;
7237c4c9ec92e1 Sean Wang    2018-08-08  846  	serdev_device_set_drvdata(serdev, bdev);
7237c4c9ec92e1 Sean Wang    2018-08-08  847  
7237c4c9ec92e1 Sean Wang    2018-08-08  848  	serdev_device_set_client_ops(serdev, &btmtkuart_client_ops);
7237c4c9ec92e1 Sean Wang    2018-08-08  849  
22eaf6c9946ae2 Sean Wang    2019-03-03  850  	err = btmtkuart_parse_dt(serdev);
22eaf6c9946ae2 Sean Wang    2019-03-03  851  	if (err < 0)
22eaf6c9946ae2 Sean Wang    2019-03-03  852  		return err;
22eaf6c9946ae2 Sean Wang    2019-03-03  853  
7237c4c9ec92e1 Sean Wang    2018-08-08  854  	INIT_WORK(&bdev->tx_work, btmtkuart_tx_work);
7237c4c9ec92e1 Sean Wang    2018-08-08  855  	skb_queue_head_init(&bdev->txq);
7237c4c9ec92e1 Sean Wang    2018-08-08  856  
7237c4c9ec92e1 Sean Wang    2018-08-08  857  	/* Initialize and register HCI device */
7237c4c9ec92e1 Sean Wang    2018-08-08  858  	hdev = hci_alloc_dev();
7237c4c9ec92e1 Sean Wang    2018-08-08  859  	if (!hdev) {
7237c4c9ec92e1 Sean Wang    2018-08-08  860  		dev_err(&serdev->dev, "Can't allocate HCI device\n");
7237c4c9ec92e1 Sean Wang    2018-08-08  861  		return -ENOMEM;
7237c4c9ec92e1 Sean Wang    2018-08-08  862  	}
7237c4c9ec92e1 Sean Wang    2018-08-08  863  
7237c4c9ec92e1 Sean Wang    2018-08-08  864  	bdev->hdev = hdev;
7237c4c9ec92e1 Sean Wang    2018-08-08  865  
7237c4c9ec92e1 Sean Wang    2018-08-08  866  	hdev->bus = HCI_UART;
7237c4c9ec92e1 Sean Wang    2018-08-08  867  	hci_set_drvdata(hdev, bdev);
7237c4c9ec92e1 Sean Wang    2018-08-08  868  
7237c4c9ec92e1 Sean Wang    2018-08-08  869  	hdev->open     = btmtkuart_open;
7237c4c9ec92e1 Sean Wang    2018-08-08  870  	hdev->close    = btmtkuart_close;
7237c4c9ec92e1 Sean Wang    2018-08-08  871  	hdev->flush    = btmtkuart_flush;
7237c4c9ec92e1 Sean Wang    2018-08-08  872  	hdev->setup    = btmtkuart_setup;
7237c4c9ec92e1 Sean Wang    2018-08-08  873  	hdev->shutdown = btmtkuart_shutdown;
7237c4c9ec92e1 Sean Wang    2018-08-08  874  	hdev->send     = btmtkuart_send_frame;
3640e7f4cb3535 Sean Wang    2022-03-09  875  	hdev->set_bdaddr = btmtk_set_bdaddr;
7237c4c9ec92e1 Sean Wang    2018-08-08  876  	SET_HCIDEV_DEV(hdev, &serdev->dev);
7237c4c9ec92e1 Sean Wang    2018-08-08  877  
7237c4c9ec92e1 Sean Wang    2018-08-08  878  	hdev->manufacturer = 70;
7237c4c9ec92e1 Sean Wang    2018-08-08  879  	set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
7237c4c9ec92e1 Sean Wang    2018-08-08  880  
22eaf6c9946ae2 Sean Wang    2019-03-03  881  	if (btmtkuart_is_standalone(bdev)) {
055825614c6b4d Sean Wang    2019-06-02  882  		err = clk_prepare_enable(bdev->osc);
055825614c6b4d Sean Wang    2019-06-02  883  		if (err < 0)
4803c54ca24923 Chuhong Yuan 2020-05-29  884  			goto err_hci_free_dev;
055825614c6b4d Sean Wang    2019-06-02  885  
a3cb6d602a7a94 Sean Wang    2019-06-02  886  		if (bdev->boot) {
a3cb6d602a7a94 Sean Wang    2019-06-02  887  			gpiod_set_value_cansleep(bdev->boot, 1);
a3cb6d602a7a94 Sean Wang    2019-06-02  888  		} else {
a3cb6d602a7a94 Sean Wang    2019-06-02  889  			/* Switch to the specific pin state for the booting
a3cb6d602a7a94 Sean Wang    2019-06-02  890  			 * requires.
a3cb6d602a7a94 Sean Wang    2019-06-02  891  			 */
22eaf6c9946ae2 Sean Wang    2019-03-03  892  			pinctrl_select_state(bdev->pinctrl, bdev->pins_boot);
a3cb6d602a7a94 Sean Wang    2019-06-02  893  		}
22eaf6c9946ae2 Sean Wang    2019-03-03  894  
22eaf6c9946ae2 Sean Wang    2019-03-03  895  		/* Power on */
22eaf6c9946ae2 Sean Wang    2019-03-03  896  		err = regulator_enable(bdev->vcc);
4803c54ca24923 Chuhong Yuan 2020-05-29  897  		if (err < 0)
4803c54ca24923 Chuhong Yuan 2020-05-29  898  			goto err_clk_disable_unprepare;
22eaf6c9946ae2 Sean Wang    2019-03-03  899  
22eaf6c9946ae2 Sean Wang    2019-03-03  900  		/* Reset if the reset-gpios is available otherwise the board
22eaf6c9946ae2 Sean Wang    2019-03-03  901  		 * -level design should be guaranteed.
22eaf6c9946ae2 Sean Wang    2019-03-03  902  		 */
22eaf6c9946ae2 Sean Wang    2019-03-03  903  		if (bdev->reset) {
22eaf6c9946ae2 Sean Wang    2019-03-03  904  			gpiod_set_value_cansleep(bdev->reset, 1);
22eaf6c9946ae2 Sean Wang    2019-03-03  905  			usleep_range(1000, 2000);
22eaf6c9946ae2 Sean Wang    2019-03-03  906  			gpiod_set_value_cansleep(bdev->reset, 0);
22eaf6c9946ae2 Sean Wang    2019-03-03  907  		}
22eaf6c9946ae2 Sean Wang    2019-03-03  908  
22eaf6c9946ae2 Sean Wang    2019-03-03  909  		/* Wait some time until device got ready and switch to the pin
22eaf6c9946ae2 Sean Wang    2019-03-03  910  		 * mode the device requires for UART transfers.
22eaf6c9946ae2 Sean Wang    2019-03-03  911  		 */
22eaf6c9946ae2 Sean Wang    2019-03-03  912  		msleep(50);
a3cb6d602a7a94 Sean Wang    2019-06-02  913  
a3cb6d602a7a94 Sean Wang    2019-06-02  914  		if (bdev->boot)
a3cb6d602a7a94 Sean Wang    2019-06-02  915  			devm_gpiod_put(&serdev->dev, bdev->boot);
a3cb6d602a7a94 Sean Wang    2019-06-02  916  
22eaf6c9946ae2 Sean Wang    2019-03-03  917  		pinctrl_select_state(bdev->pinctrl, bdev->pins_runtime);
22eaf6c9946ae2 Sean Wang    2019-03-03  918  
22eaf6c9946ae2 Sean Wang    2019-03-03  919  		/* A standalone device doesn't depends on power domain on SoC,
22eaf6c9946ae2 Sean Wang    2019-03-03  920  		 * so mark it as no callbacks.
22eaf6c9946ae2 Sean Wang    2019-03-03  921  		 */
22eaf6c9946ae2 Sean Wang    2019-03-03  922  		pm_runtime_no_callbacks(&serdev->dev);
22eaf6c9946ae2 Sean Wang    2019-03-03  923  
22eaf6c9946ae2 Sean Wang    2019-03-03  924  		set_bit(BTMTKUART_REQUIRED_WAKEUP, &bdev->tx_state);
22eaf6c9946ae2 Sean Wang    2019-03-03  925  	}
22eaf6c9946ae2 Sean Wang    2019-03-03  926  
22eaf6c9946ae2 Sean Wang    2019-03-03  927  	err = hci_register_dev(hdev);
22eaf6c9946ae2 Sean Wang    2019-03-03  928  	if (err < 0) {
7237c4c9ec92e1 Sean Wang    2018-08-08  929  		dev_err(&serdev->dev, "Can't register HCI device\n");
22eaf6c9946ae2 Sean Wang    2019-03-03  930  		goto err_regulator_disable;
7237c4c9ec92e1 Sean Wang    2018-08-08  931  	}
7237c4c9ec92e1 Sean Wang    2018-08-08  932  
7237c4c9ec92e1 Sean Wang    2018-08-08  933  	return 0;
22eaf6c9946ae2 Sean Wang    2019-03-03  934  
22eaf6c9946ae2 Sean Wang    2019-03-03  935  err_regulator_disable:
a3cb6d602a7a94 Sean Wang    2019-06-02  936  	if (btmtkuart_is_standalone(bdev))
22eaf6c9946ae2 Sean Wang    2019-03-03  937  		regulator_disable(bdev->vcc);
4803c54ca24923 Chuhong Yuan 2020-05-29  938  err_clk_disable_unprepare:
4803c54ca24923 Chuhong Yuan 2020-05-29  939  	if (btmtkuart_is_standalone(bdev))
4803c54ca24923 Chuhong Yuan 2020-05-29  940  		clk_disable_unprepare(bdev->osc);
4803c54ca24923 Chuhong Yuan 2020-05-29  941  err_hci_free_dev:
4803c54ca24923 Chuhong Yuan 2020-05-29  942  	hci_free_dev(hdev);
22eaf6c9946ae2 Sean Wang    2019-03-03  943  
22eaf6c9946ae2 Sean Wang    2019-03-03 @944  	return err;
7237c4c9ec92e1 Sean Wang    2018-08-08  945  }
7237c4c9ec92e1 Sean Wang    2018-08-08  946  

:::::: The code at line 944 was first introduced by commit
:::::: 22eaf6c9946ae269061d95bb9ceee02524166474 Bluetooth: mediatek: add support for MediaTek MT7663U and MT7668U UART devices

:::::: TO: Sean Wang <sean.wang@mediatek.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
