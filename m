Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DE43D8F
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Feb 2023 23:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677279621; x=1708815621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o0sG5g3/0/q/lnMcghVAxvXF177eA4RpdSOrDP8YF1M=;
  b=dTnyqx2dCL386TD3AVCtXoLVm3lpOLlvVCNTSwSrFYi3FJlzJUVu3cCR
   e/7HADJBXBkFINXLzDJ11t7q0+1l/Jtb7iTPbEBb80bq/aP35M8ianhGZ
   hj+dnQMWPrhk1jIKs9axozGdFRVDbGMXX3MlF5/QQON2N1aUbu18siODQ
   tSi8q7W0+QyVZXKyRbJ9dGz2SSMQu7M/IuPOv9zX3WBDRUU4fahdJF7n3
   V9pwVl9tgwatmgsGp/Z+1P6urHRW0ng0JvzcPKR262wYJv+LrEXaEZAcD
   8OTS5lZMbsytErsrftHaGz5Srol2K8i39FR6Swtm4keitPuG7qek1q3Of
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313987544"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="313987544"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 15:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705435729"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="705435729"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2023 15:00:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVh2v-0002mh-2q;
	Fri, 24 Feb 2023 23:00:09 +0000
Date: Sat, 25 Feb 2023 07:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwmon/emc2305.c:386:23: warning: Value stored to 'data'
 during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202302250637.OIfs3zDQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/emc2305.c:386:23: warning: Value stored to 'data' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michael Shych <michaelsh@nvidia.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2980d8d826554fa6981d621e569a453787472f8
commit: 0d8400c5a2ce1595f31b2f99e3139cf5bc5f35fd hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20230219 (https://download.01.org/0day-ci/archive/20230225/202302250637.OIfs3zDQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0d8400c5a2ce1595f31b2f99e3139cf5bc5f35fd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0d8400c5a2ce1595f31b2f99e3139cf5bc5f35fd
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302250637.OIfs3zDQ-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:205:2: note: Taking true branch
           if (sizeof(l) == 4)
           ^
   include/linux/bitops.h:206:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r = 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal to 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is false
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is false
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is false
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is false
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is false
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loaded from 'r')
           return r;
           ^~~~~~~~
   include/linux/bitops.h:206:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:206:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/hwmon/emc2305.c:386:23: warning: Value stored to 'data' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct emc2305_data *data = dev_get_drvdata(dev);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/emc2305.c:386:23: note: Value stored to 'data' during its initialization is never read
           struct emc2305_data *data = dev_get_drvdata(dev);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/emc2305.c:602:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev = &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/hwmon/emc2305.c:602:17: note: Value stored to 'dev' during its initialization is never read
           struct device *dev = &client->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/media/tuners/mt20xx.c:253:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:253:2: note: Value stored to 'ret' is never read
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: note: Value stored to 'ret' is never read
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: note: Value stored to 'ret' is never read
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: note: Value stored to 'ret' is never read
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: note: Value stored to 'ret' is never read
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: note: Value stored to 'ret' is never read
           ret=tuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (9 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   26 warnings generated.
   drivers/media/tuners/mxl5005s.c:2668:3: warning: Value stored to 'Fmax' is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax = FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2668:3: note: Value stored to 'Fmax' is never read
                   Fmax = FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2669:3: warning: Value stored to 'Fmin' is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin = FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2669:3: note: Value stored to 'Fmin' is never read
                   Fmin = FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2677:3: warning: Value stored to 'Fmax' is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax = FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2677:3: note: Value stored to 'Fmax' is never read
                   Fmax = FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2678:3: warning: Value stored to 'Fmin' is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin = FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2678:3: note: Value stored to 'Fmin' is never read
                   Fmin = FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2686:3: warning: Value stored to 'Fmax' is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax = FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2686:3: note: Value stored to 'Fmax' is never read
                   Fmax = FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2687:3: warning: Value stored to 'Fmin' is never read [clang-analyzer-deadcode.DeadStores]
                   Fmin = FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2687:3: note: Value stored to 'Fmin' is never read
                   Fmin = FminBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2695:3: warning: Value stored to 'Fmax' is never read [clang-analyzer-deadcode.DeadStores]
                   Fmax = FmaxBin ;
                   ^      ~~~~~~~
   drivers/media/tuners/mxl5005s.c:2695:3: note: Value stored to 'Fmax' is never read
                   Fmax = FmaxBin ;

vim +/data +386 drivers/hwmon/emc2305.c

0d8400c5a2ce15 Michael Shych 2022-08-10  382  
0d8400c5a2ce15 Michael Shych 2022-08-10  383  static int
0d8400c5a2ce15 Michael Shych 2022-08-10  384  emc2305_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel, long val)
0d8400c5a2ce15 Michael Shych 2022-08-10  385  {
0d8400c5a2ce15 Michael Shych 2022-08-10 @386  	struct emc2305_data *data = dev_get_drvdata(dev);
0d8400c5a2ce15 Michael Shych 2022-08-10  387  	int cdev_idx;
0d8400c5a2ce15 Michael Shych 2022-08-10  388  
0d8400c5a2ce15 Michael Shych 2022-08-10  389  	switch (type) {
0d8400c5a2ce15 Michael Shych 2022-08-10  390  	case hwmon_pwm:
0d8400c5a2ce15 Michael Shych 2022-08-10  391  		switch (attr) {
0d8400c5a2ce15 Michael Shych 2022-08-10  392  		case hwmon_pwm_input:
0d8400c5a2ce15 Michael Shych 2022-08-10  393  			/* If thermal is configured - handle PWM limit setting. */
0d8400c5a2ce15 Michael Shych 2022-08-10  394  			if (IS_REACHABLE(CONFIG_THERMAL)) {
0d8400c5a2ce15 Michael Shych 2022-08-10  395  				if (data->pwm_separate)
0d8400c5a2ce15 Michael Shych 2022-08-10  396  					cdev_idx = channel;
0d8400c5a2ce15 Michael Shych 2022-08-10  397  				else
0d8400c5a2ce15 Michael Shych 2022-08-10  398  					cdev_idx = 0;
0d8400c5a2ce15 Michael Shych 2022-08-10  399  				data->cdev_data[cdev_idx].last_hwmon_state =
0d8400c5a2ce15 Michael Shych 2022-08-10  400  					EMC2305_PWM_DUTY2STATE(val, data->max_state,
0d8400c5a2ce15 Michael Shych 2022-08-10  401  							       EMC2305_FAN_MAX);
0d8400c5a2ce15 Michael Shych 2022-08-10  402  				/*
0d8400c5a2ce15 Michael Shych 2022-08-10  403  				 * Update PWM only in case requested state is not less than the
0d8400c5a2ce15 Michael Shych 2022-08-10  404  				 * last thermal state.
0d8400c5a2ce15 Michael Shych 2022-08-10  405  				 */
0d8400c5a2ce15 Michael Shych 2022-08-10  406  				if (data->cdev_data[cdev_idx].last_hwmon_state >=
0d8400c5a2ce15 Michael Shych 2022-08-10  407  				    data->cdev_data[cdev_idx].last_thermal_state)
0d8400c5a2ce15 Michael Shych 2022-08-10  408  					return emc2305_set_cur_state(data->cdev_data[cdev_idx].cdev,
0d8400c5a2ce15 Michael Shych 2022-08-10  409  							data->cdev_data[cdev_idx].last_hwmon_state);
0d8400c5a2ce15 Michael Shych 2022-08-10  410  				return 0;
0d8400c5a2ce15 Michael Shych 2022-08-10  411  			}
0d8400c5a2ce15 Michael Shych 2022-08-10  412  			return emc2305_set_pwm(dev, val, channel);
0d8400c5a2ce15 Michael Shych 2022-08-10  413  		default:
0d8400c5a2ce15 Michael Shych 2022-08-10  414  			break;
0d8400c5a2ce15 Michael Shych 2022-08-10  415  		}
0d8400c5a2ce15 Michael Shych 2022-08-10  416  		break;
0d8400c5a2ce15 Michael Shych 2022-08-10  417  	default:
0d8400c5a2ce15 Michael Shych 2022-08-10  418  		break;
0d8400c5a2ce15 Michael Shych 2022-08-10  419  	}
0d8400c5a2ce15 Michael Shych 2022-08-10  420  
0d8400c5a2ce15 Michael Shych 2022-08-10  421  	return -EOPNOTSUPP;
0d8400c5a2ce15 Michael Shych 2022-08-10  422  };
0d8400c5a2ce15 Michael Shych 2022-08-10  423  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
