Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D823205
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674056294; x=1705592294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WLmJ6eqifE6a4px9q429zFxv/rUeTmny2g1QQG+WfPQ=;
  b=KMtQgYObScsulHAI7usS501K55NqbSlr+JtDP+zw8UmiB5DkvouhZRsY
   i5ZY/zteW3v//rCKDLJGFDgwLQDYuo2oHuclAEDQ6PfXHkFaKCrfTp/W8
   YePFIwiC03CC/iH/A7oesu6d7MelKY4fG/c3Mme0IKyDAhXo3In7Xc85v
   fKvXMpWqUhUrIfJOXthxEnvWgsStArfk/WR3qJ0AExKtplGuDOQmt/dqT
   02ENWWUUNWXMp0MCpxYG/x+Dp8F6n1gdMP371+v0Y0gQyGuQbYU91XiJ0
   bBSnpZiq4zveWCR/Br/zT+Z0hEOBp9J6+p1dUEMl8rSYq/R3NYgFovHsP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322698898"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="322698898"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:37:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661756668"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661756668"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 07:37:53 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIAVd-0000T2-08;
	Wed, 18 Jan 2023 15:37:53 +0000
Date: Wed, 18 Jan 2023 23:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pinchartl:next/imx290 14/18] drivers/media/i2c/imx290.c:1093:12:
 warning: 'imx290_runtime_suspend' defined but not used
Message-ID: <202301182313.we5e6lPx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git next/imx290
head:   401820f21a4eb4ae086deb41fae64e7e8defe76a
commit: 390384271c0b9551e67dac81eec10e6023afd40d [14/18] media: i2c: imx290: Initialize runtime PM before subdev
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230118/202301182313.we5e6lPx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?id=390384271c0b9551e67dac81eec10e6023afd40d
        git remote add pinchartl https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git
        git fetch --no-tags pinchartl next/imx290
        git checkout 390384271c0b9551e67dac81eec10e6023afd40d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/i2c/ lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/media/i2c/imx290.c:1357:34: warning: 'imx290_of_match' defined but not used [-Wunused-const-variable=]
    1357 | static const struct of_device_id imx290_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~
>> drivers/media/i2c/imx290.c:1093:12: warning: 'imx290_runtime_suspend' defined but not used [-Wunused-function]
    1093 | static int imx290_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/imx290.c:1085:12: warning: 'imx290_runtime_resume' defined but not used [-Wunused-function]
    1085 | static int imx290_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/imx290_runtime_suspend +1093 drivers/media/i2c/imx290.c

390384271c0b95 Laurent Pinchart      2022-11-28  1084  
390384271c0b95 Laurent Pinchart      2022-11-28 @1085  static int imx290_runtime_resume(struct device *dev)
390384271c0b95 Laurent Pinchart      2022-11-28  1086  {
390384271c0b95 Laurent Pinchart      2022-11-28  1087  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
390384271c0b95 Laurent Pinchart      2022-11-28  1088  	struct imx290 *imx290 = to_imx290(sd);
390384271c0b95 Laurent Pinchart      2022-11-28  1089  
390384271c0b95 Laurent Pinchart      2022-11-28  1090  	return imx290_power_on(imx290);
390384271c0b95 Laurent Pinchart      2022-11-28  1091  }
390384271c0b95 Laurent Pinchart      2022-11-28  1092  
390384271c0b95 Laurent Pinchart      2022-11-28 @1093  static int imx290_runtime_suspend(struct device *dev)
390384271c0b95 Laurent Pinchart      2022-11-28  1094  {
390384271c0b95 Laurent Pinchart      2022-11-28  1095  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
390384271c0b95 Laurent Pinchart      2022-11-28  1096  	struct imx290 *imx290 = to_imx290(sd);
390384271c0b95 Laurent Pinchart      2022-11-28  1097  
390384271c0b95 Laurent Pinchart      2022-11-28  1098  	imx290_power_off(imx290);
828dbc29927806 Manivannan Sadhasivam 2019-10-04  1099  
828dbc29927806 Manivannan Sadhasivam 2019-10-04  1100  	return 0;
828dbc29927806 Manivannan Sadhasivam 2019-10-04  1101  }
828dbc29927806 Manivannan Sadhasivam 2019-10-04  1102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
