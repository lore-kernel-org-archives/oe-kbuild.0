Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13215253CA
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jul 2023 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689608763; x=1721144763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TGRQBi1nNEELI5Ibc6l1/QTphmJr6CiMvwOXFImXf5o=;
  b=CnCKRfsd9jgDg5/kTSNNYajj8xWmmftYgnikEgrZgLbLdPIHkVE3qrcL
   BrYsLJIdAcKd696ms7mEhT06/f/jBLFr9HKUmGpkuKo8IRLGtuBTT1UsJ
   YCv5MSAa+emxW0Kzo6bSxNP4WBuGT29tkQT+sW4TSRf8JcGRS3AW4La/0
   DPIVRBx/RVlJM+OotrmIHCNgmpggCTaml7cg7VhlhbFFvUQEknF371ah0
   X71hpfHaNEnGG0LLb4WKI3HPDurAnFzmPMFDjVDYyBMFtQn86eF7wx65s
   Cfa/Bevl7wCZoOkoGuFc6gsoYSgb8poazrmTSLcUs8VLmmjIPBGUrKSss
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432135125"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432135125"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 08:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="836912264"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="836912264"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2023 08:46:00 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLQQC-0009fY-0i;
	Mon, 17 Jul 2023 15:46:00 +0000
Date: Mon, 17 Jul 2023 23:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/light/rohm-bu27008.c:646
 bu27008_try_find_new_time_gain() error: uninitialized symbol 'new_time_sel'.
Message-ID: <202307172333.rYRqanZw-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fdf0eaf11452d72945af31804e2a1048ee1b574c
commit: 41ff93d14f784695b5019bc1451dfd4eb2b30d9d iio: light: ROHM BU27008 color sensor
date:   8 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-m001-20230717 (https://download.01.org/0day-ci/archive/20230717/202307172333.rYRqanZw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307172333.rYRqanZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307172333.rYRqanZw-lkp@intel.com/

smatch warnings:
drivers/iio/light/rohm-bu27008.c:646 bu27008_try_find_new_time_gain() error: uninitialized symbol 'new_time_sel'.

vim +/new_time_sel +646 drivers/iio/light/rohm-bu27008.c

41ff93d14f7846 Matti Vaittinen 2023-05-08  626  
41ff93d14f7846 Matti Vaittinen 2023-05-08  627  /* Called if the new scale could not be supported with existing int-time */
41ff93d14f7846 Matti Vaittinen 2023-05-08  628  static int bu27008_try_find_new_time_gain(struct bu27008_data *data, int val,
41ff93d14f7846 Matti Vaittinen 2023-05-08  629  					  int val2, int *gain_sel)
41ff93d14f7846 Matti Vaittinen 2023-05-08  630  {
41ff93d14f7846 Matti Vaittinen 2023-05-08  631  	int i, ret, new_time_sel;
41ff93d14f7846 Matti Vaittinen 2023-05-08  632  
41ff93d14f7846 Matti Vaittinen 2023-05-08  633  	for (i = 0; i < data->gts.num_itime; i++) {
41ff93d14f7846 Matti Vaittinen 2023-05-08  634  		new_time_sel = data->gts.itime_table[i].sel;
41ff93d14f7846 Matti Vaittinen 2023-05-08  635  		ret = iio_gts_find_gain_sel_for_scale_using_time(&data->gts,
41ff93d14f7846 Matti Vaittinen 2023-05-08  636  					new_time_sel, val, val2 * 1000, gain_sel);
41ff93d14f7846 Matti Vaittinen 2023-05-08  637  		if (!ret)
41ff93d14f7846 Matti Vaittinen 2023-05-08  638  			break;
41ff93d14f7846 Matti Vaittinen 2023-05-08  639  	}
41ff93d14f7846 Matti Vaittinen 2023-05-08  640  	if (i == data->gts.num_itime) {
41ff93d14f7846 Matti Vaittinen 2023-05-08  641  		dev_err(data->dev, "Can't support scale %u %u\n", val, val2);
41ff93d14f7846 Matti Vaittinen 2023-05-08  642  
41ff93d14f7846 Matti Vaittinen 2023-05-08  643  		return -EINVAL;
41ff93d14f7846 Matti Vaittinen 2023-05-08  644  	}
41ff93d14f7846 Matti Vaittinen 2023-05-08  645  
41ff93d14f7846 Matti Vaittinen 2023-05-08 @646  	return bu27008_set_int_time_sel(data, new_time_sel);
41ff93d14f7846 Matti Vaittinen 2023-05-08  647  }
41ff93d14f7846 Matti Vaittinen 2023-05-08  648  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
