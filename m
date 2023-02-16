Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4C517D7
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 03:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676516775; x=1708052775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCt+lg66nKrHivRC6Q4nPf2lRcBQyJkqFPqzRBDvnCU=;
  b=SBSx1SAlTp4rDanpRYj0N0AuYhDjCtcOwCcAV7ZN7J3T9XB4yYIzB0cd
   vuso7C/KWzo8fcjAN2H2WzCw1svTkmNOz75goqiXHu/70wqIxaEg6NXRD
   kXi95Y1g2+eKdgX4jQBFQhArE96SQLxB3XIEcxL1PHY3AtmvimRFTzK1l
   jKbTdhpKt2sYA+4HRwJtrLIfbIBKY+JNveoJAzFc/eo8vFHNRxNej6zkF
   s4FsBidnlNL3V7cHOrwaRktbLuWx+3c2FHCYwIwyx77T/X6Wz3vzYjGQs
   4DQXp4A6S6daDh5ywNkSjHXeEyKFkj8eBY1Z9sAz5Qn/ZYE14eqnVIYaq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311978631"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="311978631"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 19:06:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="779191970"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="779191970"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2023 19:06:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSUb7-0009yO-2k;
	Thu, 16 Feb 2023 03:06:13 +0000
Date: Thu, 16 Feb 2023 11:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwmon/emc2305.c:248:27: warning: Either the condition
 'ret<=0' is redundant or there is division by zero at line 248.
 [zerodivcond]
Message-ID: <202302161009.cTUrz4Ed-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/emc2305.c:248:27: warning: Either the condition 'ret<=0' is redundant or there is division by zero at line 248. [zerodivcond]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michael Shych <michaelsh@nvidia.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   033c40a89f55525139fd5b6342281b09b97d05bf
commit: 0d8400c5a2ce1595f31b2f99e3139cf5bc5f35fd hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0d8400c5a2ce1595f31b2f99e3139cf5bc5f35fd
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302161009.cTUrz4Ed-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/hwmon/emc2305.c:248:27: warning: Either the condition 'ret<=0' is redundant or there is division by zero at line 248. [zerodivcond]
    ret = EMC2305_RPM_FACTOR / ret;
                             ^
   drivers/hwmon/emc2305.c:244:10: note: Assuming that condition 'ret<=0' is not redundant
    if (ret <= 0)
            ^
   drivers/hwmon/emc2305.c:247:12: note: Assignment 'ret=ret>>3', assigned value is 0
    ret = ret >> EMC2305_TACH_REGS_UNUSE_BITS;
              ^
   drivers/hwmon/emc2305.c:248:27: note: Division by zero
    ret = EMC2305_RPM_FACTOR / ret;
                             ^

vim +248 drivers/hwmon/emc2305.c

0d8400c5a2ce15 Michael Shych 2022-08-10  236  
0d8400c5a2ce15 Michael Shych 2022-08-10  237  static int emc2305_show_fan(struct device *dev, int channel)
0d8400c5a2ce15 Michael Shych 2022-08-10  238  {
0d8400c5a2ce15 Michael Shych 2022-08-10  239  	struct emc2305_data *data = dev_get_drvdata(dev);
0d8400c5a2ce15 Michael Shych 2022-08-10  240  	struct i2c_client *client = data->client;
0d8400c5a2ce15 Michael Shych 2022-08-10  241  	int ret;
0d8400c5a2ce15 Michael Shych 2022-08-10  242  
0d8400c5a2ce15 Michael Shych 2022-08-10  243  	ret = i2c_smbus_read_word_swapped(client, EMC2305_REG_FAN_TACH(channel));
0d8400c5a2ce15 Michael Shych 2022-08-10  244  	if (ret <= 0)
0d8400c5a2ce15 Michael Shych 2022-08-10  245  		return ret;
0d8400c5a2ce15 Michael Shych 2022-08-10  246  
0d8400c5a2ce15 Michael Shych 2022-08-10  247  	ret = ret >> EMC2305_TACH_REGS_UNUSE_BITS;
0d8400c5a2ce15 Michael Shych 2022-08-10 @248  	ret = EMC2305_RPM_FACTOR / ret;
0d8400c5a2ce15 Michael Shych 2022-08-10  249  	if (ret <= EMC2305_TACH_RANGE_MIN)
0d8400c5a2ce15 Michael Shych 2022-08-10  250  		return 0;
0d8400c5a2ce15 Michael Shych 2022-08-10  251  
0d8400c5a2ce15 Michael Shych 2022-08-10  252  	return ret * EMC2305_TACH_CNT_MULTIPLIER;
0d8400c5a2ce15 Michael Shych 2022-08-10  253  }
0d8400c5a2ce15 Michael Shych 2022-08-10  254  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
