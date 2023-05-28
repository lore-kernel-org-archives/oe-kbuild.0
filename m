Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810EC366
	for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 04:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685249517; x=1716785517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BVupsgyP6qGtS9hjBxcH8t00s+UPSDfRyfPbkrEbjag=;
  b=bB+tzR5q/FawzK7xk5jf+bFhhdkO6TPYJbAW1oLfKH57r5B2uA7Xjy2/
   6fgDtJHLhDWW90BBJQK5Gj87NjBl75Gy+72g2+Z0nG0CUh2KB915F0EgF
   ry/JG8gr30YP1BLsOeCILtwrSOl8MzyzNiy/mQ/w7/G0I/qvksjxfv9ob
   pdQUund8iB2MDmoYxHcTVW9JmrgNdG/RR6Lo7bB1kr6DUDM2K442u5LXt
   CFxaaG3IJjRt+YzW0W6Xrbylr8xU0WXUb+hdXRwcmc9/UtmqPue3pdowb
   BczHnxsRXY+KfdRKzADxoPBqmzzSPbW/lyFo0kiTopXTHUg6LhP76I71h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="339074547"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="339074547"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 21:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="818007505"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="818007505"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2023 21:51:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q38Nm-000KRQ-1z;
	Sun, 28 May 2023 04:51:54 +0000
Date: Sun, 28 May 2023 12:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 4/5] gnss: ubx: add support for the reset gpio
Message-ID: <202305281234.zR27yeIA-lkp@intel.com>
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
In-Reply-To: <20230523064310.3005-5-wsa+renesas@sang-engineering.com>
References: <20230523064310.3005-5-wsa+renesas@sang-engineering.com>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

Hi Wolfram,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on linus/master v6.4-rc3 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/WIP-gnss-merge-MTK-driver-into-UBX-driver/20230523-144613
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20230523064310.3005-5-wsa%2Brenesas%40sang-engineering.com
patch subject: [RFC PATCH 4/5] gnss: ubx: add support for the reset gpio
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-m021-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281234.zR27yeIA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305281234.zR27yeIA-lkp@intel.com/

smatch warnings:
drivers/gnss/ubx.c:128 ubx_probe() warn: missing unwind goto?

vim +128 drivers/gnss/ubx.c

7b5f4730e4af68 Wolfram Sang 2023-05-23   89  
1ad69f10e3a58d Johan Hovold 2018-06-01   90  static int ubx_probe(struct serdev_device *serdev)
1ad69f10e3a58d Johan Hovold 2018-06-01   91  {
7b5f4730e4af68 Wolfram Sang 2023-05-23   92  	const struct ubx_info *info = of_device_get_match_data(&serdev->dev);
1ad69f10e3a58d Johan Hovold 2018-06-01   93  	struct gnss_serial *gserial;
1ad69f10e3a58d Johan Hovold 2018-06-01   94  	struct ubx_data *data;
1ad69f10e3a58d Johan Hovold 2018-06-01   95  	int ret;
1ad69f10e3a58d Johan Hovold 2018-06-01   96  
7b5f4730e4af68 Wolfram Sang 2023-05-23   97  	if (!info)
7b5f4730e4af68 Wolfram Sang 2023-05-23   98  		return -ENOENT;
7b5f4730e4af68 Wolfram Sang 2023-05-23   99  
1ad69f10e3a58d Johan Hovold 2018-06-01  100  	gserial = gnss_serial_allocate(serdev, sizeof(*data));
1ad69f10e3a58d Johan Hovold 2018-06-01  101  	if (IS_ERR(gserial)) {
1ad69f10e3a58d Johan Hovold 2018-06-01  102  		ret = PTR_ERR(gserial);
1ad69f10e3a58d Johan Hovold 2018-06-01  103  		return ret;
1ad69f10e3a58d Johan Hovold 2018-06-01  104  	}
1ad69f10e3a58d Johan Hovold 2018-06-01  105  
1ad69f10e3a58d Johan Hovold 2018-06-01  106  	gserial->ops = &ubx_gserial_ops;
1ad69f10e3a58d Johan Hovold 2018-06-01  107  
7b5f4730e4af68 Wolfram Sang 2023-05-23  108  	gserial->gdev->type = info->type;
10f146639fee5f Johan Hovold 2018-06-01  109  
1ad69f10e3a58d Johan Hovold 2018-06-01  110  	data = gnss_serial_get_drvdata(gserial);
1ad69f10e3a58d Johan Hovold 2018-06-01  111  
23c5c7e33b0fc6 Wolfram Sang 2023-05-23  112  	data->vcc = devm_regulator_get_optional(&serdev->dev, "vcc");
1ad69f10e3a58d Johan Hovold 2018-06-01  113  	if (IS_ERR(data->vcc)) {
1ad69f10e3a58d Johan Hovold 2018-06-01  114  		ret = PTR_ERR(data->vcc);
23c5c7e33b0fc6 Wolfram Sang 2023-05-23  115  		if (ret == -ENODEV)
23c5c7e33b0fc6 Wolfram Sang 2023-05-23  116  			data->vcc = NULL;
23c5c7e33b0fc6 Wolfram Sang 2023-05-23  117  		else
1ad69f10e3a58d Johan Hovold 2018-06-01  118  			goto err_free_gserial;
1ad69f10e3a58d Johan Hovold 2018-06-01  119  	}
1ad69f10e3a58d Johan Hovold 2018-06-01  120  
58f289a9dc7461 Wolfram Sang 2023-05-23  121  	ret = devm_regulator_get_enable_optional(&serdev->dev, info->v_bckp_name);
58f289a9dc7461 Wolfram Sang 2023-05-23  122  	if (ret < 0 && ret != -ENODEV)
1ad69f10e3a58d Johan Hovold 2018-06-01  123  		goto err_free_gserial;
1ad69f10e3a58d Johan Hovold 2018-06-01  124  
32522a4fa4ae01 Wolfram Sang 2023-05-23  125  	/* Start with reset asserted (GPIO must be active low!) */
32522a4fa4ae01 Wolfram Sang 2023-05-23  126  	data->reset_gpio = devm_gpiod_get_optional(&serdev->dev, "reset", GPIOD_OUT_HIGH);
32522a4fa4ae01 Wolfram Sang 2023-05-23  127  	if (IS_ERR(data->reset_gpio))
32522a4fa4ae01 Wolfram Sang 2023-05-23 @128  		return PTR_ERR(data->reset_gpio);
32522a4fa4ae01 Wolfram Sang 2023-05-23  129  
1ad69f10e3a58d Johan Hovold 2018-06-01  130  	ret = gnss_serial_register(gserial);
1ad69f10e3a58d Johan Hovold 2018-06-01  131  	if (ret)
58f289a9dc7461 Wolfram Sang 2023-05-23  132  		goto err_free_gserial;
1ad69f10e3a58d Johan Hovold 2018-06-01  133  
1ad69f10e3a58d Johan Hovold 2018-06-01  134  	return 0;
1ad69f10e3a58d Johan Hovold 2018-06-01  135  
1ad69f10e3a58d Johan Hovold 2018-06-01  136  err_free_gserial:
1ad69f10e3a58d Johan Hovold 2018-06-01  137  	gnss_serial_free(gserial);
1ad69f10e3a58d Johan Hovold 2018-06-01  138  
1ad69f10e3a58d Johan Hovold 2018-06-01  139  	return ret;
1ad69f10e3a58d Johan Hovold 2018-06-01  140  }
1ad69f10e3a58d Johan Hovold 2018-06-01  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
