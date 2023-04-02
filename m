Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32165524D
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Apr 2023 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680452592; x=1711988592;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oJqMxmngTd/ZrWsA1p44pL28hxs3iK+EaJcWKq/qLEE=;
  b=PoxXiKUkTODN2UIeaTSvO8kHbVlmmPa8bHk8O609s1KbcH7oHQLWsUeT
   26BZlhKMNpblzmWdUrw48jiVJHBiV8VUUivOREnHgJl+hWAYByVjiWyn+
   kZNiuUXITc4f/a3B8Op5+DptOVWgDsmgV3DaDT6HbR26YmoFt24LXXd+O
   QTKDeRlk0Ez646QPYjAED836tTyVNS2ncBJZI3i11T8z5Bvax1zNJ8GD+
   yg+HbdnkFMCDl0fIbTd5pSdJaiWGAAT69O7oT3zwWGWQ6seDN30XjbdHx
   f5vYuG+6PpB+o0RoRte7XjNl/AKyPdLYSQrPATyPpdXWdeAd7O6OKQoED
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="406795439"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="406795439"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 09:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="716033214"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="716033214"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Apr 2023 09:23:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj0U1-000NWj-0n;
	Sun, 02 Apr 2023 16:23:09 +0000
Date: Mon, 3 Apr 2023 00:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/magnetometer/yamaha-yas530.c:189:8: warning: Excessive
 padding in 'struct yas5xx_chip_info' (8 padding bytes, where 0 is optimal).
Message-ID: <202304030009.LwHwQEAk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/magnetometer/yamaha-yas530.c:189:8: warning: Excessive padding in 'struct yas5xx_chip_info' (8 padding bytes, where 0 is optimal). "
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jakob Hauser <jahau@rocketmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: 65f79b501030678393eae0ae03d60a8151fbef55 iio: magnetometer: yas530: Add YAS537 variant
date:   8 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20230327 (https://download.01.org/0day-ci/archive/20230403/202304030009.LwHwQEAk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=65f79b501030678393eae0ae03d60a8151fbef55
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 65f79b501030678393eae0ae03d60a8151fbef55
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304030009.LwHwQEAk-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/once_lite.h:30:3: note: expanded from macro 'DO_ONCE_LITE_IF'
                   if (__ONCE_LITE_IF(__ret_do_once))                      \
                   ^
   net/core/failover.c:58:17: note: Value assigned to 'fops'
           failover_dev = failover_get_bymac(slave_dev->perm_addr, &fops);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/failover.c:59:6: note: Assuming 'failover_dev' is non-null
           if (!failover_dev)
               ^~~~~~~~~~~~~
   net/core/failover.c:59:2: note: Taking false branch
           if (!failover_dev)
           ^
   net/core/failover.c:62:6: note: Assuming 'fops' is null
           if (fops && fops->slave_pre_register &&
               ^~~~
   net/core/failover.c:62:11: note: Left side of '&&' is false
           if (fops && fops->slave_pre_register &&
                    ^
   net/core/failover.c:66:46: note: Access to field 'slave_handle_frame' results in a dereference of a null pointer (loaded from variable 'fops')
           err = netdev_rx_handler_register(slave_dev, fops->slave_handle_frame,
                                                       ^~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:118:11: warning: Value stored to 'period' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           uint32_t period = ts->period;
                    ^~~~~~   ~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:118:11: note: Value stored to 'period' during its initialization is never read
           uint32_t period = ts->period;
                    ^~~~~~   ~~~~~~~~~~
   include/linux/math64.h:28:24: warning: Division by zero [clang-analyzer-core.DivideZero]
           *remainder = dividend % divisor;
                                 ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:122:6: note: Assuming 'fifo_nb' is not equal to 0
           if (fifo_nb == 0)
               ^~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:122:2: note: Taking false branch
           if (fifo_nb == 0)
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:130:6: note: Assuming field 'lo' is not equal to 0
           if (it->lo != 0) {
               ^~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:130:2: note: Taking true branch
           if (it->lo != 0) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:133:11: note: Calling 'inv_compute_chip_period'
                   valid = inv_compute_chip_period(ts, fifo_mult, period);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:101:2: note: Taking false branch
           if (!inv_validate_period(period, mult))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:106:2: note: Calling 'inv_update_acc'
           inv_update_acc(&ts->chip_period, new_chip_period);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:6: note: Assuming the condition is false
           if (acc->idx >= ARRAY_SIZE(acc->values))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:2: note: Taking false branch
           if (acc->idx >= ARRAY_SIZE(acc->values))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:7: note: The value 0 is assigned to 'i'
           for (i = 0; i < ARRAY_SIZE(acc->values); ++i) {
                ^~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < ARRAY_SIZE(acc->values); ++i) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:7: note: Assuming the condition is true
                   if (acc->values[i] == 0)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:3: note: Taking true branch
                   if (acc->values[i] == 0)
                   ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:36:4: note:  Execution continues on line 40
                           break;
                           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:40:26: note: Passing the value 0 via 2nd parameter 'divisor'
           acc->val = div_u64(sum, i);
                                   ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:40:13: note: Calling 'div_u64'
           acc->val = div_u64(sum, i);
                      ^~~~~~~~~~~~~~~
   include/linux/math64.h:128:31: note: Passing the value 0 via 2nd parameter 'divisor'
           return div_u64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:128:9: note: Calling 'div_u64_rem'
           return div_u64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:28:24: note: Division by zero
           *remainder = dividend % divisor;
                        ~~~~~~~~~^~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/iio/magnetometer/yamaha-yas530.c:189:8: warning: Excessive padding in 'struct yas5xx_chip_info' (8 padding bytes, where 0 is optimal). 
   Optimal fields order: 
   product_name, 
   volatile_reg, 
   get_measure, 
   get_calibration_data, 
   dump_calibration, 
   measure_offsets, 
   power_on, 
   version_names, 
   devid, 
   volatile_reg_qty, 
   scaling_val2, 
   t_ref, 
   min_temp_x10, 
   consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct yas5xx_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/iio/magnetometer/yamaha-yas530.c:189:8: note: Excessive padding in 'struct yas5xx_chip_info' (8 padding bytes, where 0 is optimal). Optimal fields order: product_name, volatile_reg, get_measure, get_calibration_data, dump_calibration, measure_offsets, power_on, version_names, devid, volatile_reg_qty, scaling_val2, t_ref, min_temp_x10, consider reordering the fields or adding explicit padding members
   struct yas5xx_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/unix/af_unix.c:1123:2: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(addr->name->sun_path + 1, "%05x", ordernum);
           ^~~~~~~
   net/unix/af_unix.c:1123:2: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(addr->name->sun_path + 1, "%05x", ordernum);
           ^~~~~~~
   net/unix/af_unix.c:1704:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = 0;
                   ^     ~
   net/unix/af_unix.c:1704:3: note: Value stored to 'err' is never read
                   err = 0;
                   ^     ~
   net/unix/af_unix.c:2700:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   net/unix/af_unix.c:2700:3: note: Value stored to 'err' is never read
                   err = -EOPNOTSUPP;
                   ^     ~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/unix/sysctl_net_unix.c:47:3: warning: Argument to kfree() is the address of the global variable 'unix_table', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
                   kfree(table);
                   ^     ~~~~~
   net/unix/sysctl_net_unix.c:29:6: note: Assuming the condition is true
           if (net_eq(net, &init_net)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   net/unix/sysctl_net_unix.c:29:2: note: Taking true branch
           if (net_eq(net, &init_net)) {

vim +189 drivers/iio/magnetometer/yamaha-yas530.c

a70f60e5b6b37e Jakob Hauser 2022-08-12  166  
a70f60e5b6b37e Jakob Hauser 2022-08-12  167  /**
a70f60e5b6b37e Jakob Hauser 2022-08-12  168   * struct yas5xx_chip_info - device-specific data and function pointers
a70f60e5b6b37e Jakob Hauser 2022-08-12  169   * @devid: device ID number
a70f60e5b6b37e Jakob Hauser 2022-08-12  170   * @product_name: product name of the YAS variant
a70f60e5b6b37e Jakob Hauser 2022-08-12  171   * @version_names: version letters or namings
dd9bd44f877d89 Jakob Hauser 2022-08-12  172   * @volatile_reg: device-specific volatile registers
dd9bd44f877d89 Jakob Hauser 2022-08-12  173   * @volatile_reg_qty: quantity of device-specific volatile registers
913fd409668b7f Jakob Hauser 2022-08-13  174   * @scaling_val2: scaling value for IIO_CHAN_INFO_SCALE
2d6676ecbe6a39 Jakob Hauser 2022-08-13  175   * @t_ref: number of counts at reference temperature 20 °C
2d6676ecbe6a39 Jakob Hauser 2022-08-13  176   * @min_temp_x10: starting point of temperature counting in 1/10:s degrees Celsius
059ff0f9a10508 Jakob Hauser 2022-08-13  177   * @get_measure: function pointer to get a measurement
059ff0f9a10508 Jakob Hauser 2022-08-13  178   * @get_calibration_data: function pointer to get calibration data
059ff0f9a10508 Jakob Hauser 2022-08-13  179   * @dump_calibration: function pointer to dump calibration for debugging
059ff0f9a10508 Jakob Hauser 2022-08-13  180   * @measure_offsets: function pointer to measure the offsets
059ff0f9a10508 Jakob Hauser 2022-08-13  181   * @power_on: function pointer to power-on procedure
2d6676ecbe6a39 Jakob Hauser 2022-08-13  182   *
2d6676ecbe6a39 Jakob Hauser 2022-08-13  183   * The "t_ref" value for YAS532/533 is known from the Android driver.
65f79b50103067 Jakob Hauser 2022-08-13  184   * For YAS530 and YAS537 it was approximately measured.
2d6676ecbe6a39 Jakob Hauser 2022-08-13  185   *
2d6676ecbe6a39 Jakob Hauser 2022-08-13  186   * The temperatures "min_temp_x10" are derived from the temperature resolutions
2d6676ecbe6a39 Jakob Hauser 2022-08-13  187   * given in the data sheets.
a70f60e5b6b37e Jakob Hauser 2022-08-12  188   */
a70f60e5b6b37e Jakob Hauser 2022-08-12 @189  struct yas5xx_chip_info {
a70f60e5b6b37e Jakob Hauser 2022-08-12  190  	unsigned int devid;
a70f60e5b6b37e Jakob Hauser 2022-08-12  191  	char *product_name;
a70f60e5b6b37e Jakob Hauser 2022-08-12  192  	char *version_names[2];
dd9bd44f877d89 Jakob Hauser 2022-08-12  193  	const int *volatile_reg;
dd9bd44f877d89 Jakob Hauser 2022-08-12  194  	int volatile_reg_qty;
913fd409668b7f Jakob Hauser 2022-08-13  195  	u32 scaling_val2;
2d6676ecbe6a39 Jakob Hauser 2022-08-13  196  	u16 t_ref;
2d6676ecbe6a39 Jakob Hauser 2022-08-13  197  	s16 min_temp_x10;
059ff0f9a10508 Jakob Hauser 2022-08-13  198  	int (*get_measure)(struct yas5xx *yas5xx, s32 *to, s32 *xo, s32 *yo, s32 *zo);
059ff0f9a10508 Jakob Hauser 2022-08-13  199  	int (*get_calibration_data)(struct yas5xx *yas5xx);
059ff0f9a10508 Jakob Hauser 2022-08-13  200  	void (*dump_calibration)(struct yas5xx *yas5xx);
059ff0f9a10508 Jakob Hauser 2022-08-13  201  	int (*measure_offsets)(struct yas5xx *yas5xx);
059ff0f9a10508 Jakob Hauser 2022-08-13  202  	int (*power_on)(struct yas5xx *yas5xx);
a70f60e5b6b37e Jakob Hauser 2022-08-12  203  };
a70f60e5b6b37e Jakob Hauser 2022-08-12  204  

:::::: The code at line 189 was first introduced by commit
:::::: a70f60e5b6b37e8b9f0967235bf89aebd2d9fbb9 iio: magnetometer: yas530: Introduce "chip_info" structure

:::::: TO: Jakob Hauser <jahau@rocketmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
