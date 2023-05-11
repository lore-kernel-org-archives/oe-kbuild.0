Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED52C3FDF
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683822397; x=1715358397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BHFSdwPdKLef1ZSMSVhtCmc0UIk9MqfOEhPp04GcaKw=;
  b=gCB99tSHFMBm9C2IRF3GvyECWSLoOJk94uk3luxY/lvPmUPHVsPI0VDW
   hKz+2eAtUVyj2rdAKKTjijHz0GE0FoPAL410QIUX5fcB/BVPyn3+wn6ci
   cREh1atUlI8UX2O/hknbyJJ2Kry9za8hCfvMwQHOP0PMLmq5G/0pkazDD
   KE8bSd5cj3wb5UlCsr9g4JINRqS70k0RFiDb/YpH7hcCOvqN3unwTKVQU
   8ttDejLEmM/UX5DT+T2m1mAZVizepZYuFE7+nZ7VXn4Z+M4ASJQbagXqM
   oNS9dDlh6nBy1geUJPZWEOy4nS3502O/Um/4li1C2ojKG20J56LI9b3rQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416170273"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="416170273"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 09:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="730433770"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="730433770"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 May 2023 09:26:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px97j-00046x-1B;
	Thu, 11 May 2023 16:26:35 +0000
Date: Fri, 12 May 2023 00:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/chrome/cros_ec_proto_test.c:147
 cros_ec_proto_test_init() warn: other places set '(struct
 cros_ec_device)->dout_size' to 'byte' instead of 'array_size'
Message-ID: <202305120056.V0DNGOLb-lkp@intel.com>
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
TO: "Tzung-Bi Shih" <tzungbi@kernel.org>
CC: Guenter Roeck <groeck@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80e62bc8487b049696e67ad133c503bf7f6806f7
commit: db681eaf7145158fb49eddbdb548692e8bfe7fab platform/chrome: cros_ec_proto: add Kunit tests for cros_ec_prepare_tx()
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: parisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230512/202305120056.V0DNGOLb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305120056.V0DNGOLb-lkp@intel.com/

smatch warnings:
drivers/platform/chrome/cros_ec_proto_test.c:147 cros_ec_proto_test_init() warn: other places set '(struct cros_ec_device)->dout_size' to 'byte' instead of 'array_size'

vim +147 drivers/platform/chrome/cros_ec_proto_test.c

db681eaf7145158 Tzung-Bi Shih 2022-05-18  134  
db681eaf7145158 Tzung-Bi Shih 2022-05-18  135  static int cros_ec_proto_test_init(struct kunit *test)
db681eaf7145158 Tzung-Bi Shih 2022-05-18  136  {
db681eaf7145158 Tzung-Bi Shih 2022-05-18  137  	struct cros_ec_proto_test_priv *priv;
db681eaf7145158 Tzung-Bi Shih 2022-05-18  138  	struct cros_ec_device *ec_dev;
db681eaf7145158 Tzung-Bi Shih 2022-05-18  139  
db681eaf7145158 Tzung-Bi Shih 2022-05-18  140  	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
db681eaf7145158 Tzung-Bi Shih 2022-05-18  141  	if (!priv)
db681eaf7145158 Tzung-Bi Shih 2022-05-18  142  		return -ENOMEM;
db681eaf7145158 Tzung-Bi Shih 2022-05-18  143  	test->priv = priv;
db681eaf7145158 Tzung-Bi Shih 2022-05-18  144  
db681eaf7145158 Tzung-Bi Shih 2022-05-18  145  	ec_dev = &priv->ec_dev;
db681eaf7145158 Tzung-Bi Shih 2022-05-18  146  	ec_dev->dout = (u8 *)priv->dout;
db681eaf7145158 Tzung-Bi Shih 2022-05-18 @147  	ec_dev->dout_size = ARRAY_SIZE(priv->dout);
db681eaf7145158 Tzung-Bi Shih 2022-05-18  148  	ec_dev->din = (u8 *)priv->din;
db681eaf7145158 Tzung-Bi Shih 2022-05-18  149  	ec_dev->din_size = ARRAY_SIZE(priv->din);
db681eaf7145158 Tzung-Bi Shih 2022-05-18  150  	ec_dev->proto_version = EC_HOST_REQUEST_VERSION;
db681eaf7145158 Tzung-Bi Shih 2022-05-18  151  
db681eaf7145158 Tzung-Bi Shih 2022-05-18  152  	priv->msg = (struct cros_ec_command *)priv->_msg;
db681eaf7145158 Tzung-Bi Shih 2022-05-18  153  
db681eaf7145158 Tzung-Bi Shih 2022-05-18  154  	return 0;
db681eaf7145158 Tzung-Bi Shih 2022-05-18  155  }
db681eaf7145158 Tzung-Bi Shih 2022-05-18  156  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
