Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6952CAD49
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Mar 2023 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678206557; x=1709742557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t06iY591rUsPWWlljo480RzzUjREtNAJfVl7V61XPGY=;
  b=aX3EpyVTe4qdlRwh/XNSQXp16Zs1HFHJsIR3eYzjdOlDwXULsQtuVkIm
   yzDGyTjisq2HPW5SIU78omidyO5+e8HvuOV9OOd0Q9CuH2A+WSLpOQLY/
   G/kQRg2QQMDJNsQvRZLk23fcopM4R376N2SXMKhddlKtiYad/+Eg6o6Sl
   503th2U4ydGONGiHtoOLHytgRbyVdjv4QmBFmlojLG/4T7SMFr24nqlE5
   CnP7olVxKNmlHeiYP6d7Yqo3SegPR5LHTHLE+TI86+IawaMYg+0MgG1c2
   0l+5BQf5U0QpuP9+X1f4MLH3kZYcXKpRgOT0DqJFBfI7eWDlvRMNis6Hp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398476774"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="398476774"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 08:29:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="786754611"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="786754611"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2023 08:29:14 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZaBd-0001Ta-1h;
	Tue, 07 Mar 2023 16:29:13 +0000
Date: Wed, 8 Mar 2023 00:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/gyro/mpu3050-core.c:223:55: warning: Operator '|' with
 one operand equal to zero is redundant. [badBitmaskCheck]
Message-ID: <202303080006.513kh00b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/gyro/mpu3050-core.c:223:55: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ca09d5fa3549d142c2080a72a4c70ce389163cd
commit: feb0bd2bcab6a3970422c3baf0bdc77713e547f9 iio: gyro: mpu3050: Use pm_ptr() and DEFINE_RUNTIME_DEV_PM_OPS()
date:   9 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 months ago
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout feb0bd2bcab6a3970422c3baf0bdc77713e547f9
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303080006.513kh00b-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/gyro/mpu3050-core.c:223:55: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
         MPU3050_EXT_SYNC_NONE << MPU3050_EXT_SYNC_SHIFT |
                                                         ^

vim +223 drivers/iio/gyro/mpu3050-core.c

3904b28efb2c78 Linus Walleij 2016-10-25  192  
3904b28efb2c78 Linus Walleij 2016-10-25  193  static int mpu3050_start_sampling(struct mpu3050 *mpu3050)
3904b28efb2c78 Linus Walleij 2016-10-25  194  {
3904b28efb2c78 Linus Walleij 2016-10-25  195  	__be16 raw_val[3];
3904b28efb2c78 Linus Walleij 2016-10-25  196  	int ret;
3904b28efb2c78 Linus Walleij 2016-10-25  197  	int i;
3904b28efb2c78 Linus Walleij 2016-10-25  198  
3904b28efb2c78 Linus Walleij 2016-10-25  199  	/* Reset */
3904b28efb2c78 Linus Walleij 2016-10-25  200  	ret = regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
3904b28efb2c78 Linus Walleij 2016-10-25  201  				 MPU3050_PWR_MGM_RESET, MPU3050_PWR_MGM_RESET);
3904b28efb2c78 Linus Walleij 2016-10-25  202  	if (ret)
3904b28efb2c78 Linus Walleij 2016-10-25  203  		return ret;
3904b28efb2c78 Linus Walleij 2016-10-25  204  
3904b28efb2c78 Linus Walleij 2016-10-25  205  	/* Turn on the Z-axis PLL */
3904b28efb2c78 Linus Walleij 2016-10-25  206  	ret = regmap_update_bits(mpu3050->map, MPU3050_PWR_MGM,
3904b28efb2c78 Linus Walleij 2016-10-25  207  				 MPU3050_PWR_MGM_CLKSEL_MASK,
3904b28efb2c78 Linus Walleij 2016-10-25  208  				 MPU3050_PWR_MGM_PLL_Z);
3904b28efb2c78 Linus Walleij 2016-10-25  209  	if (ret)
3904b28efb2c78 Linus Walleij 2016-10-25  210  		return ret;
3904b28efb2c78 Linus Walleij 2016-10-25  211  
3904b28efb2c78 Linus Walleij 2016-10-25  212  	/* Write calibration offset registers */
3904b28efb2c78 Linus Walleij 2016-10-25  213  	for (i = 0; i < 3; i++)
3904b28efb2c78 Linus Walleij 2016-10-25  214  		raw_val[i] = cpu_to_be16(mpu3050->calibration[i]);
3904b28efb2c78 Linus Walleij 2016-10-25  215  
3904b28efb2c78 Linus Walleij 2016-10-25  216  	ret = regmap_bulk_write(mpu3050->map, MPU3050_X_OFFS_USR_H, raw_val,
3904b28efb2c78 Linus Walleij 2016-10-25  217  				sizeof(raw_val));
3904b28efb2c78 Linus Walleij 2016-10-25  218  	if (ret)
3904b28efb2c78 Linus Walleij 2016-10-25  219  		return ret;
3904b28efb2c78 Linus Walleij 2016-10-25  220  
3904b28efb2c78 Linus Walleij 2016-10-25  221  	/* Set low pass filter (sample rate), sync and full scale */
3904b28efb2c78 Linus Walleij 2016-10-25  222  	ret = regmap_write(mpu3050->map, MPU3050_DLPF_FS_SYNC,
3904b28efb2c78 Linus Walleij 2016-10-25 @223  			   MPU3050_EXT_SYNC_NONE << MPU3050_EXT_SYNC_SHIFT |
3904b28efb2c78 Linus Walleij 2016-10-25  224  			   mpu3050->fullscale << MPU3050_FS_SHIFT |
3904b28efb2c78 Linus Walleij 2016-10-25  225  			   mpu3050->lpf << MPU3050_DLPF_CFG_SHIFT);
3904b28efb2c78 Linus Walleij 2016-10-25  226  	if (ret)
3904b28efb2c78 Linus Walleij 2016-10-25  227  		return ret;
3904b28efb2c78 Linus Walleij 2016-10-25  228  
3904b28efb2c78 Linus Walleij 2016-10-25  229  	/* Set up sampling frequency */
3904b28efb2c78 Linus Walleij 2016-10-25  230  	ret = regmap_write(mpu3050->map, MPU3050_SMPLRT_DIV, mpu3050->divisor);
3904b28efb2c78 Linus Walleij 2016-10-25  231  	if (ret)
3904b28efb2c78 Linus Walleij 2016-10-25  232  		return ret;
3904b28efb2c78 Linus Walleij 2016-10-25  233  
3904b28efb2c78 Linus Walleij 2016-10-25  234  	/*
3904b28efb2c78 Linus Walleij 2016-10-25  235  	 * Max 50 ms start-up time after setting DLPF_FS_SYNC
3904b28efb2c78 Linus Walleij 2016-10-25  236  	 * according to the data sheet, then wait for the next sample
3904b28efb2c78 Linus Walleij 2016-10-25  237  	 * at this frequency T = 1000/f ms.
3904b28efb2c78 Linus Walleij 2016-10-25  238  	 */
3904b28efb2c78 Linus Walleij 2016-10-25  239  	msleep(50 + 1000 / mpu3050_get_freq(mpu3050));
3904b28efb2c78 Linus Walleij 2016-10-25  240  
3904b28efb2c78 Linus Walleij 2016-10-25  241  	return 0;
3904b28efb2c78 Linus Walleij 2016-10-25  242  }
3904b28efb2c78 Linus Walleij 2016-10-25  243  

:::::: The code at line 223 was first introduced by commit
:::::: 3904b28efb2c780c23dcddfb87e07fe0230661e5 iio: gyro: Add driver for the MPU-3050 gyroscope

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
