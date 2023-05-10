Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96283174D9
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683744948; x=1715280948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z9iswWZdg47d3DVdDQ+CNt6xisy5JWRKz7KyxxpRfDk=;
  b=goQbBVPjU6DRkxxrmvqbdaiPobuAaBFu7YBkBprtcpRh9DSJgqFx9+n3
   W2lwVleqX/BRRDufgpjrSK0PkMKP5rLJXcQToVfqn09NwUHXBQ6x3cfka
   Yp14AvULNtQON5wYxnAu0bQWBUgzG9GoNU0iD5Ct5ODr9Lx+JZkTg7lxv
   8o3Qs2Cul2UQ49lAdlRlKUGuvSZK6pJvMCGgqYlNFlknfe72pv1LjSMYP
   7V+pJCz7EANxT/znNMdsrMo+17PKk/fkZWkGa+b8uRipiQfaQRi2Y7pSX
   z9aWDvc1e9a2DqR4+dIcSa/1IHaE/9GCOaMqj6KSTib6ljWlAvkHDqBI/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347756404"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="347756404"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 11:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="693497350"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="693497350"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 May 2023 11:55:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwoyV-0003W4-1d;
	Wed, 10 May 2023 18:55:43 +0000
Date: Thu, 11 May 2023 02:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/accel/kionix-kx022a.c:1053 kx022a_probe_internal() warn:
 passing zero to 'dev_err_probe'
Message-ID: <202305110245.MFxC9bUj-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ad2fd53a7870a395b8564697bef6c329d017c6c9
commit: 7c1d1677b3227c6b18ac999f2b84778baa280b8f iio: accel: Support Kionix/ROHM KX022A accelerometer
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: openrisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110245.MFxC9bUj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305110245.MFxC9bUj-lkp@intel.com/

smatch warnings:
drivers/iio/accel/kionix-kx022a.c:1053 kx022a_probe_internal() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1053 drivers/iio/accel/kionix-kx022a.c

7c1d1677b3227c Matti Vaittinen 2022-10-24   999  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1000  int kx022a_probe_internal(struct device *dev)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1001  {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1002  	static const char * const regulator_names[] = {"io-vdd", "vdd"};
7c1d1677b3227c Matti Vaittinen 2022-10-24  1003  	struct iio_trigger *indio_trig;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1004  	struct fwnode_handle *fwnode;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1005  	struct kx022a_data *data;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1006  	struct regmap *regmap;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1007  	unsigned int chip_id;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1008  	struct iio_dev *idev;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1009  	int ret, irq;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1010  	char *name;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1011  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1012  	regmap = dev_get_regmap(dev, NULL);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1013  	if (!regmap) {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1014  		dev_err(dev, "no regmap\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1015  		return -EINVAL;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1016  	}
7c1d1677b3227c Matti Vaittinen 2022-10-24  1017  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1018  	fwnode = dev_fwnode(dev);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1019  	if (!fwnode)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1020  		return -ENODEV;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1021  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1022  	idev = devm_iio_device_alloc(dev, sizeof(*data));
7c1d1677b3227c Matti Vaittinen 2022-10-24  1023  	if (!idev)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1024  		return -ENOMEM;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1025  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1026  	data = iio_priv(idev);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1027  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1028  	/*
7c1d1677b3227c Matti Vaittinen 2022-10-24  1029  	 * VDD is the analog and digital domain voltage supply and
7c1d1677b3227c Matti Vaittinen 2022-10-24  1030  	 * IO_VDD is the digital I/O voltage supply.
7c1d1677b3227c Matti Vaittinen 2022-10-24  1031  	 */
7c1d1677b3227c Matti Vaittinen 2022-10-24  1032  	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(regulator_names),
7c1d1677b3227c Matti Vaittinen 2022-10-24  1033  					     regulator_names);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1034  	if (ret && ret != -ENODEV)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1035  		return dev_err_probe(dev, ret, "failed to enable regulator\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1036  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1037  	ret = regmap_read(regmap, KX022A_REG_WHO, &chip_id);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1038  	if (ret)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1039  		return dev_err_probe(dev, ret, "Failed to access sensor\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1040  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1041  	if (chip_id != KX022A_ID) {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1042  		dev_err(dev, "unsupported device 0x%x\n", chip_id);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1043  		return -EINVAL;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1044  	}
7c1d1677b3227c Matti Vaittinen 2022-10-24  1045  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1046  	irq = fwnode_irq_get_byname(fwnode, "INT1");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1047  	if (irq > 0) {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1048  		data->inc_reg = KX022A_REG_INC1;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1049  		data->ien_reg = KX022A_REG_INC4;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1050  	} else {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1051  		irq = fwnode_irq_get_byname(fwnode, "INT2");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1052  		if (irq <= 0)
7c1d1677b3227c Matti Vaittinen 2022-10-24 @1053  			return dev_err_probe(dev, irq, "No suitable IRQ\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1054  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1055  		data->inc_reg = KX022A_REG_INC5;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1056  		data->ien_reg = KX022A_REG_INC6;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1057  	}
7c1d1677b3227c Matti Vaittinen 2022-10-24  1058  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1059  	data->regmap = regmap;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1060  	data->dev = dev;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1061  	data->irq = irq;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1062  	data->odr_ns = KX022A_DEFAULT_PERIOD_NS;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1063  	mutex_init(&data->mutex);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1064  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1065  	idev->channels = kx022a_channels;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1066  	idev->num_channels = ARRAY_SIZE(kx022a_channels);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1067  	idev->name = "kx022-accel";
7c1d1677b3227c Matti Vaittinen 2022-10-24  1068  	idev->info = &kx022a_info;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1069  	idev->modes = INDIO_DIRECT_MODE | INDIO_BUFFER_SOFTWARE;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1070  	idev->available_scan_masks = kx022a_scan_masks;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1071  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1072  	/* Read the mounting matrix, if present */
7c1d1677b3227c Matti Vaittinen 2022-10-24  1073  	ret = iio_read_mount_matrix(dev, &data->orientation);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1074  	if (ret)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1075  		return ret;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1076  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1077  	/* The sensor must be turned off for configuration */
7c1d1677b3227c Matti Vaittinen 2022-10-24  1078  	ret = kx022a_turn_off_lock(data);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1079  	if (ret)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1080  		return ret;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1081  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1082  	ret = kx022a_chip_init(data);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1083  	if (ret) {
7c1d1677b3227c Matti Vaittinen 2022-10-24  1084  		mutex_unlock(&data->mutex);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1085  		return ret;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1086  	}
7c1d1677b3227c Matti Vaittinen 2022-10-24  1087  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1088  	ret = kx022a_turn_on_unlock(data);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1089  	if (ret)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1090  		return ret;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1091  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1092  	ret = devm_iio_triggered_buffer_setup_ext(dev, idev,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1093  						  &iio_pollfunc_store_time,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1094  						  kx022a_trigger_handler,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1095  						  IIO_BUFFER_DIRECTION_IN,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1096  						  &kx022a_buffer_ops,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1097  						  kx022a_fifo_attributes);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1098  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1099  	if (ret)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1100  		return dev_err_probe(data->dev, ret,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1101  				     "iio_triggered_buffer_setup_ext FAIL\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1102  	indio_trig = devm_iio_trigger_alloc(dev, "%sdata-rdy-dev%d", idev->name,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1103  					    iio_device_id(idev));
7c1d1677b3227c Matti Vaittinen 2022-10-24  1104  	if (!indio_trig)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1105  		return -ENOMEM;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1106  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1107  	data->trig = indio_trig;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1108  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1109  	indio_trig->ops = &kx022a_trigger_ops;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1110  	iio_trigger_set_drvdata(indio_trig, data);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1111  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1112  	/*
7c1d1677b3227c Matti Vaittinen 2022-10-24  1113  	 * No need to check for NULL. request_threaded_irq() defaults to
7c1d1677b3227c Matti Vaittinen 2022-10-24  1114  	 * dev_name() should the alloc fail.
7c1d1677b3227c Matti Vaittinen 2022-10-24  1115  	 */
7c1d1677b3227c Matti Vaittinen 2022-10-24  1116  	name = devm_kasprintf(data->dev, GFP_KERNEL, "%s-kx022a",
7c1d1677b3227c Matti Vaittinen 2022-10-24  1117  			      dev_name(data->dev));
7c1d1677b3227c Matti Vaittinen 2022-10-24  1118  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1119  	ret = devm_request_threaded_irq(data->dev, irq, kx022a_irq_handler,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1120  					&kx022a_irq_thread_handler,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1121  					IRQF_ONESHOT, name, idev);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1122  	if (ret)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1123  		return dev_err_probe(data->dev, ret, "Could not request IRQ\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1124  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1125  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1126  	ret = devm_iio_trigger_register(dev, indio_trig);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1127  	if (ret)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1128  		return dev_err_probe(data->dev, ret,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1129  				     "Trigger registration failed\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1130  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1131  	ret = devm_iio_device_register(data->dev, idev);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1132  	if (ret < 0)
7c1d1677b3227c Matti Vaittinen 2022-10-24  1133  		return dev_err_probe(dev, ret,
7c1d1677b3227c Matti Vaittinen 2022-10-24  1134  				     "Unable to register iio device\n");
7c1d1677b3227c Matti Vaittinen 2022-10-24  1135  
7c1d1677b3227c Matti Vaittinen 2022-10-24  1136  	return ret;
7c1d1677b3227c Matti Vaittinen 2022-10-24  1137  }
7c1d1677b3227c Matti Vaittinen 2022-10-24  1138  EXPORT_SYMBOL_NS_GPL(kx022a_probe_internal, IIO_KX022A);
7c1d1677b3227c Matti Vaittinen 2022-10-24  1139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
