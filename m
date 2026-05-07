Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F298137F00F
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165653; cv=none; b=scHLFsQ+aa8O8dYN9iahDbBIXp/xTfqSfN6mbmuMf3Rte+X7hanrgq/bf0R6f5WDuk88jnTBBp6piAHiDTQDWa+RhDH2WmJttoGv98fc52X2SH4YpzdStMN1D8aHdxuxDDs9W/1HrAL/2l9NyngFzqfp3+5FjVvS9jp6AkhDD/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165653; c=relaxed/simple;
	bh=7NPh1ycI5rgu+w0/vwA79FAL1Dv3U1CYNvZP+ztAFMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X5zprxYE6Il5JY9g/ZE65lQBpoom7/1rA0bqaSiz74LSB+C10qmV176JGcIPfgKaUBs9/IFntKPGCX/RXf8Gjf4XW+tIT42nwLVCSAF4spC4MFRooEsOr25XiQtheBg71IFGmNXEzCnQfkabxbTTaQGkDU7YwTdbasdhx7IMoUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5hrBlPB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5hrBlPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778165652; x=1809701652;
  h=date:from:to:cc:subject:message-id;
  bh=7NPh1ycI5rgu+w0/vwA79FAL1Dv3U1CYNvZP+ztAFMc=;
  b=V5hrBlPBS/KCQJcjHdfW9SlSlUWptYh8Dc52Wo6ugRwRBcBH/TGTDu2/
   2nXRAK+WPhrGOg4xqj6PRDGss2BKzIuV/ifHcUjJ/79N+LFoEj+C69ILb
   bJ+2YXW2OlW9Q2YkfzqdfuaU0UsXN3NRmOdVY1d3QrYdrBZUs50pvypO7
   VDOGrSFd9lNg3oXl/MF0xB0qytp7PAWt2Q9uwym8dR0TgrZ1H4cVlGN93
   ApvqF6m//VRvn4+sBeZTbSEMEPypVI7WfTeurhAl2N8tVlUTg9pRyBK0u
   QV73C29smPwJ66YAhDC/OxbZ4G+9xCgtiXKWHOk13ganvHNZ9sh1txTJB
   w==;
X-CSE-ConnectionGUID: eLlYzgbnRAqfn5ZuwaK1eQ==
X-CSE-MsgGUID: WLLYknnwQwCth6FQkuWVuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82737676"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82737676"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:54:12 -0700
X-CSE-ConnectionGUID: JyLhvQJoTKCNhw/d9mBODA==
X-CSE-MsgGUID: MgX4fvQFTsWyLkxaMh5M1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233817608"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2026 07:54:10 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL076-000000000BR-1JXR;
	Thu, 07 May 2026 14:54:08 +0000
Date: Thu, 07 May 2026 22:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: samples/rpmsg/rpmsg_client_sample.c:65:31: warning: format
 '%ld' expects argument of type 'long int', but argument 3 has type 'ssize_t'
 {aka 'int'}
Message-ID: <202605072248.tcMNvXQa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Tanmay-Shah/rpmsg-virtio_rpmsg_bus-allow-different-size-of-tx-and-rx-bufs/20260507-142615, commit: 3e451c450d540c8d733336d136eed8f559eb9038"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tanmay Shah <tanmay.shah@amd.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tanmay-Shah/rpmsg-virtio_rpmsg_bus-allow-different-size-of-tx-and-rx-bufs/20260507-142615
head:   2496f9ad32bd2e27c5c7006f3c2c5e7f170db4d5
commit: 3e451c450d540c8d733336d136eed8f559eb9038 samples: rpmsg: add mtu size info
date:   5 hours ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-buildonly-randconfig-002-20260507 (https://download.01.org/0day-ci/archive/20260507/202605072248.tcMNvXQa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072248.tcMNvXQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605072248.tcMNvXQa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/rpmsg.h:14,
                    from samples/rpmsg/rpmsg_client_sample.c:14:
   samples/rpmsg/rpmsg_client_sample.c: In function 'rpmsg_sample_probe':
>> samples/rpmsg/rpmsg_client_sample.c:65:31: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'ssize_t' {aka 'int'} [-Wformat=]
      65 |         dev_info(&rpdev->dev, "rpmsg mtu size = %ld\n",
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:65:9: note: in expansion of macro 'dev_info'
      65 |         dev_info(&rpdev->dev, "rpmsg mtu size = %ld\n",
         |         ^~~~~~~~
   samples/rpmsg/rpmsg_client_sample.c:65:51: note: format string is defined here
      65 |         dev_info(&rpdev->dev, "rpmsg mtu size = %ld\n",
         |                                                 ~~^
         |                                                   |
         |                                                   long int
         |                                                 %d


vim +65 samples/rpmsg/rpmsg_client_sample.c

779b96d20ca97cf Ohad Ben-Cohen  2011-10-20 @14  #include <linux/rpmsg.h>
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  15  
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  16  #define MSG		"hello world!"
9a703eb72059530 Suman Anna      2019-08-09  17  
9a703eb72059530 Suman Anna      2019-08-09  18  static int count = 100;
9a703eb72059530 Suman Anna      2019-08-09  19  module_param(count, int, 0644);
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  20  
a138c883193a66c Anna, Suman     2016-08-12  21  struct instance_data {
a138c883193a66c Anna, Suman     2016-08-12  22  	int rx_count;
a138c883193a66c Anna, Suman     2016-08-12  23  };
a138c883193a66c Anna, Suman     2016-08-12  24  
4b83c52a21cf5a7 Bjorn Andersson 2016-09-01  25  static int rpmsg_sample_cb(struct rpmsg_device *rpdev, void *data, int len,
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  26  						void *priv, u32 src)
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  27  {
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  28  	int ret;
a138c883193a66c Anna, Suman     2016-08-12  29  	struct instance_data *idata = dev_get_drvdata(&rpdev->dev);
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  30  
a138c883193a66c Anna, Suman     2016-08-12  31  	dev_info(&rpdev->dev, "incoming msg %d (src: 0x%x)\n",
a138c883193a66c Anna, Suman     2016-08-12  32  		 ++idata->rx_count, src);
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  33  
2519fbb39711e5e Suman Anna      2019-08-09  34  	print_hex_dump_debug(__func__, DUMP_PREFIX_NONE, 16, 1, data, len,
2519fbb39711e5e Suman Anna      2019-08-09  35  			     true);
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  36  
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  37  	/* samples should not live forever */
9a703eb72059530 Suman Anna      2019-08-09  38  	if (idata->rx_count >= count) {
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  39  		dev_info(&rpdev->dev, "goodbye!\n");
4b83c52a21cf5a7 Bjorn Andersson 2016-09-01  40  		return 0;
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  41  	}
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  42  
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  43  	/* send a new message now */
2a48d7322dc88f1 Bjorn Andersson 2016-09-01  44  	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  45  	if (ret)
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  46  		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
4b83c52a21cf5a7 Bjorn Andersson 2016-09-01  47  
4b83c52a21cf5a7 Bjorn Andersson 2016-09-01  48  	return 0;
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  49  }
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  50  
92e1de51bf2cb8d Bjorn Andersson 2016-09-01  51  static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  52  {
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  53  	int ret;
a138c883193a66c Anna, Suman     2016-08-12  54  	struct instance_data *idata;
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  55  
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  56  	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  57  					rpdev->src, rpdev->dst);
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  58  
a138c883193a66c Anna, Suman     2016-08-12  59  	idata = devm_kzalloc(&rpdev->dev, sizeof(*idata), GFP_KERNEL);
a138c883193a66c Anna, Suman     2016-08-12  60  	if (!idata)
a138c883193a66c Anna, Suman     2016-08-12  61  		return -ENOMEM;
a138c883193a66c Anna, Suman     2016-08-12  62  
a138c883193a66c Anna, Suman     2016-08-12  63  	dev_set_drvdata(&rpdev->dev, idata);
a138c883193a66c Anna, Suman     2016-08-12  64  
3e451c450d540c8 Tanmay Shah     2026-04-29 @65  	dev_info(&rpdev->dev, "rpmsg mtu size = %ld\n",
3e451c450d540c8 Tanmay Shah     2026-04-29  66  		 rpmsg_get_mtu(rpdev->ept));
3e451c450d540c8 Tanmay Shah     2026-04-29  67  
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  68  	/* send a message to our remote processor */
2a48d7322dc88f1 Bjorn Andersson 2016-09-01  69  	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  70  	if (ret) {
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  71  		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  72  		return ret;
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  73  	}
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  74  
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  75  	return 0;
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  76  }
779b96d20ca97cf Ohad Ben-Cohen  2011-10-20  77  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
