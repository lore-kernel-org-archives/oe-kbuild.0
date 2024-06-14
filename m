Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C411991B3
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jun 2024 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718370846; cv=none; b=rNgIwDSqc38sltSZQpJ/Qr3lzRLPI/UhRsZpjgvgDREG70MuwzdkHkV6vCW1M0KANn2h5NJffWoNXm7HKUGMg0wlpZrrMdcBLdH9Wjt0V5h+IMXSo2pWJuzq1OTLP4/yzjNpFh6voCujmvoHJ4rggsw26Eas1KyvgEigoSA1hAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718370846; c=relaxed/simple;
	bh=fSdIbC+4VpRuOgQJ46CVyd1h7mCNgq0FO1jNl+71OBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c+rA32b8I1z9VnzSLWT2SO6l+zHs4B2/WkAssR/BC+P4t8PAtYRdbD93PUPHey8SRH/h301DP2tAlciyzsTVyfJPdxN7bLZiaz3Jb+mjG+QQVw767DldXWhHarZ3Sa/KQMTmI0R+QF6jzzU6nV3x0HDgP6DF0au34lUPxyjNTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeEBo/83; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeEBo/83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718370845; x=1749906845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSdIbC+4VpRuOgQJ46CVyd1h7mCNgq0FO1jNl+71OBw=;
  b=FeEBo/83icHIQsrnRJ5DI2CJuNly5JyiEXMRhLVrtlvL0LLCfMCLkSRc
   31ifpFEal1HFX3dtIgbrM4Lwzf/+UM5IUI+W+RpIL7fRSCpQfUMjQxVFR
   LkTJrUQ5P5K70ICPixeP4f/BlNOf3eXxRfmrjp7j3NAzj+2DfxYNNgsmb
   aZInvM5JJnax5wVl+4gCasq/6nbNYaMCMPqwTX0KD9o3nSIjg02ss9hqo
   LpQHggUv5u6GoTdG20gZRmaNoTMLg12DT0Fu99tSDLV1ZRM1v90iI4BF/
   HzoZAXYVM29yXWubkuENFULqCsCTlD8CaBBAhSQmoC/enJjZPrVw2VuDA
   Q==;
X-CSE-ConnectionGUID: 481OXBoVRyyooNhI9icGRg==
X-CSE-MsgGUID: ED0OQAg6RRWq2H+jQS4P+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19105354"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="19105354"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:14:03 -0700
X-CSE-ConnectionGUID: LgAFLI2YQuqWj7TCGsk8UQ==
X-CSE-MsgGUID: j/Sdecs3SOSxnYqKbdvo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40631902"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2024 06:14:02 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI6kh-0001L7-34;
	Fri, 14 Jun 2024 13:13:59 +0000
Date: Fri, 14 Jun 2024 21:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/2] iio:proximity:hx9023s: Add TYHX HX9023S sensor
 driver
Message-ID: <202406142001.swm6CU40-lkp@intel.com>
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
In-Reply-To: <SN7PR12MB81017291E79E6B61A8DEC9A5A4FB2@SN7PR12MB8101.namprd12.prod.outlook.com>
References: <SN7PR12MB81017291E79E6B61A8DEC9A5A4FB2@SN7PR12MB8101.namprd12.prod.outlook.com>
TO: Yasin Lee <yasin.lee.x@outlook.com>
TO: jic23@kernel.org
CC: andy.shevchenko@gmail.com
CC: lars@metafoo.de
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: nuno.a@analog.com
CC: swboyd@chromium.org
CC: u.kleine-koenig@pengutronix.de
CC: yasin.lee.x@gmail.com
CC: yasin.lee.x@outlook.com

Hi Yasin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yasin-Lee/iio-proximity-hx9023s-Add-TYHX-HX9023S-sensor-driver/20240607-194446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/SN7PR12MB81017291E79E6B61A8DEC9A5A4FB2%40SN7PR12MB8101.namprd12.prod.outlook.com
patch subject: [PATCH v4 2/2] iio:proximity:hx9023s: Add TYHX HX9023S sensor driver
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: um-randconfig-r071-20240614 (https://download.01.org/0day-ci/archive/20240614/202406142001.swm6CU40-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406142001.swm6CU40-lkp@intel.com/

New smatch warnings:
drivers/iio/proximity/hx9023s.c:666 hx9023s_property_get() error: uninitialized symbol 'i'.
drivers/iio/proximity/hx9023s.c:976 hx9023s_trigger_handler() error: uninitialized symbol 'i'.
drivers/iio/proximity/hx9023s.c:996 hx9023s_buffer_preenable() error: uninitialized symbol 'channels'.

Old smatch warnings:
drivers/iio/proximity/hx9023s.c:667 hx9023s_property_get() error: uninitialized symbol 'i'.

vim +/i +666 drivers/iio/proximity/hx9023s.c

6133aa711518da Yasin Lee 2024-06-07  649  
6133aa711518da Yasin Lee 2024-06-07  650  static int hx9023s_property_get(struct hx9023s_data *data)
6133aa711518da Yasin Lee 2024-06-07  651  {
6133aa711518da Yasin Lee 2024-06-07  652  	int ret, i;
6133aa711518da Yasin Lee 2024-06-07  653  	u32 temp;
6133aa711518da Yasin Lee 2024-06-07  654  	struct fwnode_handle *child;
6133aa711518da Yasin Lee 2024-06-07  655  	struct device *dev = regmap_get_device(data->regmap);
6133aa711518da Yasin Lee 2024-06-07  656  
6133aa711518da Yasin Lee 2024-06-07  657  	ret = device_property_read_u32(dev, "channel-in-use", &temp);
6133aa711518da Yasin Lee 2024-06-07  658  	if (ret)
6133aa711518da Yasin Lee 2024-06-07  659  		return dev_err_probe(dev, ret, "Failed to read channel-in-use property\n");
6133aa711518da Yasin Lee 2024-06-07  660  	data->chan_in_use = temp;
6133aa711518da Yasin Lee 2024-06-07  661  
6133aa711518da Yasin Lee 2024-06-07  662  	device_for_each_child_node(dev, child) {
6133aa711518da Yasin Lee 2024-06-07  663  		ret = fwnode_property_read_u32(child, "channel-positive", &temp);
6133aa711518da Yasin Lee 2024-06-07  664  		if (ret)
6133aa711518da Yasin Lee 2024-06-07  665  			return dev_err_probe(dev, ret,
6133aa711518da Yasin Lee 2024-06-07 @666  					"Failed to read channel-positive for channel %d\n", i);
6133aa711518da Yasin Lee 2024-06-07  667  		data->ch_data[i].channel_positive = temp;
6133aa711518da Yasin Lee 2024-06-07  668  
6133aa711518da Yasin Lee 2024-06-07  669  		ret = fwnode_property_read_u32(child, "channel-negative", &temp);
6133aa711518da Yasin Lee 2024-06-07  670  		if (ret)
6133aa711518da Yasin Lee 2024-06-07  671  			return dev_err_probe(dev, ret,
6133aa711518da Yasin Lee 2024-06-07  672  					"Failed to read channel-negative for channel %d\n", i);
6133aa711518da Yasin Lee 2024-06-07  673  		data->ch_data[i].channel_negative = temp;
6133aa711518da Yasin Lee 2024-06-07  674  
6133aa711518da Yasin Lee 2024-06-07  675  		i++;
6133aa711518da Yasin Lee 2024-06-07  676  	}
6133aa711518da Yasin Lee 2024-06-07  677  
6133aa711518da Yasin Lee 2024-06-07  678  	return 0;
6133aa711518da Yasin Lee 2024-06-07  679  }
6133aa711518da Yasin Lee 2024-06-07  680  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
