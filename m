Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EC480054
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727848559; cv=none; b=JPNx6fMA5sAnhZpz4Lk8iCPP13y5VLcoQAffYpON0oMHmuEUm8fCl5x3ox+0C2CfTUS+3pcBI8GTo/s5UU6qWNCMnb1AJOFU84KZXQSKUe48AbJTShES3m78U5eQgkTHatTrCrPVhlvJwwQdaWOPQRImDdR6fHqRWxrH4r+fOOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727848559; c=relaxed/simple;
	bh=898bvzlNd9nwHH33VHs6tFk1db143knrb+lwfuj+btc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XX5MJlv1AAeITS6PtBAhi0h7/ee/PbhcEnY0HabpLJROIFqk9XmvJQrdT6OFFZlWW1kgQMQEowbKu4xczHW5M5AhIZmx4wrREJH60fovbwwgge9XWfw9S8NIeVLlsn4nei35cqsiPrZZ1YGEQaLuWR/TGluqW18w1I4aDCGMydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AP+xPwBD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AP+xPwBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727848557; x=1759384557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=898bvzlNd9nwHH33VHs6tFk1db143knrb+lwfuj+btc=;
  b=AP+xPwBD8m422EwjEmZakFYuPkG4u2jEhcRQGCN9cXZvnad92V/bLsZu
   Nti83E93CMft1tgLRo1iP6plsJS3RTSPjTQ9EjcBP/EullF4UQXc+Yknl
   pMLtu++2YvCX2+Vb+AVG3e0Byqw3GmGW4s1r/Dy0VzLn2rvv+V2zyIyYp
   HEjKAFTdUnndSqetwhi/biRjltjwjNavCcG9IVTbSm+QaFT2VtmsASCoP
   b2bFVkRviAWJcsRNUZVpOP8Q0IDcLcfG4hlc376MTBefsD4+pph2tZb8x
   D7o2j3Y27aeTicFjypdw8eMk+A9Ordtz+BK6ROuQ+cfEoeFhOQRuOj5T5
   w==;
X-CSE-ConnectionGUID: DwxMEigVSXiFdWqsd1CX/g==
X-CSE-MsgGUID: 2Z4oDuzARNCtNAkYh2rZ8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27098422"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="27098422"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 22:55:54 -0700
X-CSE-ConnectionGUID: ciNxzoVkQ/q87RdTCQA6rg==
X-CSE-MsgGUID: 6ZoqnPuySF2EWOMS848YPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="73926527"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Oct 2024 22:55:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svsKz-000Rbh-32;
	Wed, 02 Oct 2024 05:55:49 +0000
Date: Wed, 2 Oct 2024 13:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [asahilinux:bits/240-isp 22/52]
 drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function
 "for_each_child_of_node" should have of_node_put() before goto around lines
 197.
Message-ID: <202410021337.EQ74x7c7-lkp@intel.com>
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
TO: Asahi Lina <lina@asahilina.net>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   2eb812826ec58e3b803055a8aa0fd857f1675f14
commit: b4d2b4922ce8a77666206a64314192e08c1aca0a [22/52] media: apple: isp: Working t602x and multiple formats and more fixes
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arc-randconfig-r062-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021337.EQ74x7c7-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410021337.EQ74x7c7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 197.
   drivers/media/platform/apple/isp/isp-drv.c:183:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before goto around lines 201.

vim +/for_each_child_of_node +183 drivers/media/platform/apple/isp/isp-drv.c

b4d2b4922ce8a7 Asahi Lina 2023-09-24  154  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  155  static int apple_isp_init_presets(struct apple_isp *isp)
b4d2b4922ce8a7 Asahi Lina 2023-09-24  156  {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  157  	struct device *dev = isp->dev;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  158  	struct device_node *np, *child;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  159  	struct isp_preset *preset;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  160  	int err = 0;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  161  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  162  	np = of_get_child_by_name(dev->of_node, "sensor-presets");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  163  	if (!np) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  164  		dev_err(dev, "failed to get DT node 'presets'\n");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  165  		return -EINVAL;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  166  	}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  167  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  168  	isp->num_presets = of_get_child_count(np);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  169  	if (!isp->num_presets) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  170  		dev_err(dev, "no sensor presets found\n");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  171  		err = -EINVAL;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  172  		goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  173  	}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  174  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  175  	isp->presets = devm_kzalloc(
b4d2b4922ce8a7 Asahi Lina 2023-09-24  176  		dev, sizeof(*isp->presets) * isp->num_presets, GFP_KERNEL);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  177  	if (!isp->presets) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  178  		err = -ENOMEM;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  179  		goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  180  	}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  181  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  182  	preset = isp->presets;
b4d2b4922ce8a7 Asahi Lina 2023-09-24 @183  	for_each_child_of_node(np, child) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  184  		u32 xywh[4];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  185  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  186  		err = of_property_read_u32(child, "apple,config-index",
b4d2b4922ce8a7 Asahi Lina 2023-09-24  187  					   &preset->index);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  188  		if (err) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  189  			dev_err(dev, "no apple,config-index property\n");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  190  			of_node_put(child);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  191  			goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  192  		}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  193  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  194  		err = isp_of_read_coord(dev, child, "apple,input-size",
b4d2b4922ce8a7 Asahi Lina 2023-09-24  195  					&preset->input_dim);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  196  		if (err)
b4d2b4922ce8a7 Asahi Lina 2023-09-24  197  			goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  198  		err = isp_of_read_coord(dev, child, "apple,output-size",
b4d2b4922ce8a7 Asahi Lina 2023-09-24  199  					&preset->output_dim);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  200  		if (err)
b4d2b4922ce8a7 Asahi Lina 2023-09-24  201  			goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  202  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  203  		err = of_property_read_u32_array(child, "apple,crop", xywh, 4);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  204  		if (err) {
b4d2b4922ce8a7 Asahi Lina 2023-09-24  205  			dev_err(dev, "failed to read 'apple,crop' property\n");
b4d2b4922ce8a7 Asahi Lina 2023-09-24  206  			of_node_put(child);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  207  			goto err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  208  		}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  209  		preset->crop_offset.x = xywh[0];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  210  		preset->crop_offset.y = xywh[1];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  211  		preset->crop_size.x = xywh[2];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  212  		preset->crop_size.y = xywh[3];
b4d2b4922ce8a7 Asahi Lina 2023-09-24  213  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  214  		preset++;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  215  	}
b4d2b4922ce8a7 Asahi Lina 2023-09-24  216  
b4d2b4922ce8a7 Asahi Lina 2023-09-24  217  err:
b4d2b4922ce8a7 Asahi Lina 2023-09-24  218  	of_node_put(np);
b4d2b4922ce8a7 Asahi Lina 2023-09-24  219  	return err;
b4d2b4922ce8a7 Asahi Lina 2023-09-24  220  }
b4d2b4922ce8a7 Asahi Lina 2023-09-24  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
