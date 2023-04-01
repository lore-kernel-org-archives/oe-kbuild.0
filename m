Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE817259B
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680340883; x=1711876883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2yNtOhRajU2Vhq/X1BsV0PmRcSibcPpX24vOM2N4zk=;
  b=WnWKSNj1EtKOakQCAivJc+484nwldAZyQWAjJzJxkGzjtFLmPzCd++s7
   Oaw/rfUxNse0eV5oD0h7SoMVhO+s4ZWZPFo2ChCV3ZWufV97dJwajgm89
   6FXzgDhiUJtG/pETNIGpayDjyM7n71jojSqbENXTJao4GRr8PnMbySp0R
   5lNFz3hhYwOF20AvRksiA62LQBpyIj+3wuvQ+l83ABy+LPtsHXE4bC4/z
   bouvD/VYsremdz2iYEk3vfqwx+8YTY6GtJm0IPHESr3kgexux3A6pXpUN
   jcX1D03FO3b0krkguHiP+W51eaVcxwWV9QGkl3Q/CAl5gXG9TeiMmc3vE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339129047"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="339129047"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 02:21:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="754649760"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="754649760"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2023 02:21:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piXQH-000Mer-0V;
	Sat, 01 Apr 2023 09:21:21 +0000
Date: Sat, 1 Apr 2023 17:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/adc/qcom-spmi-rradc.c:754:8: warning: Assigned value is
 garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Message-ID: <202304011710.b9xz79HB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/qcom-spmi-rradc.c:754:8: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Caleb Connolly <caleb.connolly@linaro.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b50567bdcad8925ca1e075feb7171c12015afd1
commit: 72c7df8505cbb6da8bb23bdd29e70ce5f30add88 iio: adc: qcom-spmi-rradc: introduce round robin adc
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20230329 (https://download.01.org/0day-ci/archive/20230401/202304011710.b9xz79HB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=72c7df8505cbb6da8bb23bdd29e70ce5f30add88
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 72c7df8505cbb6da8bb23bdd29e70ce5f30add88
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304011710.b9xz79HB-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/hwmon/w83795.c:850:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", val);
                  ^~~~~~~
   drivers/hwmon/w83795.c:911:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:911:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:973:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", mode);
                  ^~~~~~~
   drivers/hwmon/w83795.c:973:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", mode);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1015:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (unsigned int)tss_map[tmp][index] + 1);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1015:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (unsigned int)tss_map[tmp][index] + 1);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1083:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1083:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1144:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1144:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1192:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1192:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1252:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", data->sf4_reg[index][SF4_PWM][nr]);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1252:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", data->sf4_reg[index][SF4_PWM][nr]);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1287:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/w83795.c:1287:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/w83795.c:1328:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", temp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1328:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", temp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1365:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1365:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1378:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", temp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1378:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", temp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1390:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%ld\n", temp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1390:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%ld\n", temp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1429:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1429:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", tmp);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1505:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1505:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1565:9: warning: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   drivers/hwmon/w83795.c:1565:9: note: Call to function 'sprintf' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", val);
                  ^~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/iio/adc/qcom-spmi-rradc.c:754:8: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   *val = adc_code;
                        ^ ~~~~~~~~
   drivers/iio/adc/qcom-spmi-rradc.c:736:2: note: 'adc_code' declared without an initial value
           u16 adc_code;
           ^~~~~~~~~~~~
   drivers/iio/adc/qcom-spmi-rradc.c:738:6: note: Assuming field 'address' is < RR_ADC_CHAN_MAX
           if (chan_spec->address >= RR_ADC_CHAN_MAX) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-spmi-rradc.c:738:2: note: Taking false branch
           if (chan_spec->address >= RR_ADC_CHAN_MAX) {
           ^
   drivers/iio/adc/qcom-spmi-rradc.c:744:2: note: Control jumps to 'case IIO_CHAN_INFO_RAW:'  at line 749
           switch (mask) {
           ^
   drivers/iio/adc/qcom-spmi-rradc.c:750:9: note: Calling 'rradc_do_conversion'
                   ret = rradc_do_conversion(chip, chan_spec->address, &adc_code);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/qcom-spmi-rradc.c:523:2: note: Control jumps to 'case RR_ADC_USBIN_V:'  at line 533
           switch (chan_address) {
           ^
   drivers/iio/adc/qcom-spmi-rradc.c:536:7: note: Assuming 'ret' is >= 0
                   if (ret < 0) {
                       ^~~~~~~
   drivers/iio/adc/qcom-spmi-rradc.c:536:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   drivers/iio/adc/qcom-spmi-rradc.c:541:3: note:  Execution continues on line 557
                   break;
                   ^
   drivers/iio/adc/qcom-spmi-rradc.c:558:6: note: Assuming 'ret' is not equal to 0
           if (ret) {
               ^~~
   drivers/iio/adc/qcom-spmi-rradc.c:558:2: note: Taking true branch
           if (ret) {
           ^
   drivers/iio/adc/qcom-spmi-rradc.c:559:3: note: Left side of '&&' is true
                   dev_err(chip->dev, "read data failed\n");
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:442:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:399:7: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                       ^
   drivers/iio/adc/qcom-spmi-rradc.c:559:3: note: Taking true branch
                   dev_err(chip->dev, "read data failed\n");
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:442:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:399:3: note: expanded from macro '__printk_index_emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
                   ^
   drivers/iio/adc/qcom-spmi-rradc.c:559:3: note: '?' condition is true
                   dev_err(chip->dev, "read data failed\n");
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:442:2: note: expanded from macro 'printk_index_subsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:408:12: note: expanded from macro '__printk_index_emit'
                                   .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
                                          ^
   drivers/iio/adc/qcom-spmi-rradc.c:559:3: note: '?' condition is true
                   dev_err(chip->dev, "read data failed\n");
                   ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)

vim +754 drivers/iio/adc/qcom-spmi-rradc.c

72c7df8505cbb6 Caleb Connolly 2022-04-29  728  
72c7df8505cbb6 Caleb Connolly 2022-04-29  729  static int rradc_read_raw(struct iio_dev *indio_dev,
72c7df8505cbb6 Caleb Connolly 2022-04-29  730  			  struct iio_chan_spec const *chan_spec, int *val,
72c7df8505cbb6 Caleb Connolly 2022-04-29  731  			  int *val2, long mask)
72c7df8505cbb6 Caleb Connolly 2022-04-29  732  {
72c7df8505cbb6 Caleb Connolly 2022-04-29  733  	struct rradc_chip *chip = iio_priv(indio_dev);
72c7df8505cbb6 Caleb Connolly 2022-04-29  734  	const struct rradc_channel *chan;
72c7df8505cbb6 Caleb Connolly 2022-04-29  735  	int ret;
72c7df8505cbb6 Caleb Connolly 2022-04-29  736  	u16 adc_code;
72c7df8505cbb6 Caleb Connolly 2022-04-29  737  
72c7df8505cbb6 Caleb Connolly 2022-04-29  738  	if (chan_spec->address >= RR_ADC_CHAN_MAX) {
72c7df8505cbb6 Caleb Connolly 2022-04-29  739  		dev_err(chip->dev, "Invalid channel index:%lu\n",
72c7df8505cbb6 Caleb Connolly 2022-04-29  740  			chan_spec->address);
72c7df8505cbb6 Caleb Connolly 2022-04-29  741  		return -EINVAL;
72c7df8505cbb6 Caleb Connolly 2022-04-29  742  	}
72c7df8505cbb6 Caleb Connolly 2022-04-29  743  
72c7df8505cbb6 Caleb Connolly 2022-04-29  744  	switch (mask) {
72c7df8505cbb6 Caleb Connolly 2022-04-29  745  	case IIO_CHAN_INFO_SCALE:
72c7df8505cbb6 Caleb Connolly 2022-04-29  746  		return rradc_read_scale(chip, chan_spec->address, val, val2);
72c7df8505cbb6 Caleb Connolly 2022-04-29  747  	case IIO_CHAN_INFO_OFFSET:
72c7df8505cbb6 Caleb Connolly 2022-04-29  748  		return rradc_read_offset(chip, chan_spec->address, val);
72c7df8505cbb6 Caleb Connolly 2022-04-29  749  	case IIO_CHAN_INFO_RAW:
72c7df8505cbb6 Caleb Connolly 2022-04-29  750  		ret = rradc_do_conversion(chip, chan_spec->address, &adc_code);
72c7df8505cbb6 Caleb Connolly 2022-04-29  751  		if (ret < 0)
72c7df8505cbb6 Caleb Connolly 2022-04-29  752  			return ret;
72c7df8505cbb6 Caleb Connolly 2022-04-29  753  
72c7df8505cbb6 Caleb Connolly 2022-04-29 @754  		*val = adc_code;
72c7df8505cbb6 Caleb Connolly 2022-04-29  755  		return IIO_VAL_INT;
72c7df8505cbb6 Caleb Connolly 2022-04-29  756  	case IIO_CHAN_INFO_PROCESSED:
72c7df8505cbb6 Caleb Connolly 2022-04-29  757  		chan = &rradc_chans[chan_spec->address];
72c7df8505cbb6 Caleb Connolly 2022-04-29  758  		if (!chan->scale_fn)
72c7df8505cbb6 Caleb Connolly 2022-04-29  759  			return -EINVAL;
72c7df8505cbb6 Caleb Connolly 2022-04-29  760  		ret = rradc_do_conversion(chip, chan_spec->address, &adc_code);
72c7df8505cbb6 Caleb Connolly 2022-04-29  761  		if (ret < 0)
72c7df8505cbb6 Caleb Connolly 2022-04-29  762  			return ret;
72c7df8505cbb6 Caleb Connolly 2022-04-29  763  
72c7df8505cbb6 Caleb Connolly 2022-04-29  764  		*val = chan->scale_fn(chip, adc_code, val);
72c7df8505cbb6 Caleb Connolly 2022-04-29  765  		return IIO_VAL_INT;
72c7df8505cbb6 Caleb Connolly 2022-04-29  766  	default:
72c7df8505cbb6 Caleb Connolly 2022-04-29  767  		return -EINVAL;
72c7df8505cbb6 Caleb Connolly 2022-04-29  768  	}
72c7df8505cbb6 Caleb Connolly 2022-04-29  769  }
72c7df8505cbb6 Caleb Connolly 2022-04-29  770  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
