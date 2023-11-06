Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB63228DBB
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 15:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k275aNy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699283152; x=1730819152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brWD7CuQlM1ImEEMItgpAPmB203SJTsKyXuUHkMFAqY=;
  b=k275aNy8GeR7ADS7BkUlbHGhUD5p7NRPA87UdjN/8dWH8xMbVKpT/c3M
   unYdrLvXV0XmOBsO/91wvXdHQRl78HU7rcmR/fHQdYbTZfDfhMtW8c4nd
   /YWyCvqHxuZ/vm8O50nlpEvSFlvuewAMfhRzt3FcCUpE91yoxUXFw9RWG
   ZxVCt5C/s2Cakr+WGN64EO7maBFuy1k4sUOqrD5ik1VzA/ArCyOaQOIDX
   1MSbDcWhwvJaW+L3acNKr+Go8yoi+PLP3coVBQ6oATPJlKpN9gD2b3Xxx
   YAjirIjEQ+KAsdhv65nP/UCXwiMHdxPMk70yzR0KlRz3SmCaB67NUSXGf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="7923730"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="7923730"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 07:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="3468175"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Nov 2023 07:05:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r01Ah-0006Ue-2P;
	Mon, 06 Nov 2023 15:05:47 +0000
Date: Mon, 6 Nov 2023 23:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/light/rohm-bu27008.c:646
 bu27008_try_find_new_time_gain() error: uninitialized symbol 'new_time_sel'.
Message-ID: <202311062303.3scVBcKu-lkp@intel.com>
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
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 41ff93d14f784695b5019bc1451dfd4eb2b30d9d iio: light: ROHM BU27008 color sensor
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311062303.3scVBcKu-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062303.3scVBcKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311062303.3scVBcKu-lkp@intel.com/

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
