Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D6E17F1
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674991209; x=1706527209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PPpVawtvj9aEiU26I1IBb1oOKhEf6bidNxMmZGecJz8=;
  b=gwN1/gCv5Q/v9TO2Kf9/7yJALIWtGDFhVazjmAQjUlRwsUUqZEE2NHk2
   higjt+hgY6a5+anV267wmKLD+oAUZ4PdvO0cFl1XzmGzQFI/2DPFR6g1y
   p0IJx4czr9xBxYOWzKwqfontAhCHYSZEfXulA7cCBQODyboCpGK66Ru92
   Ml9/0LlMfViqAqHsACPpwqKhObd2dkQaCVfaOuoEn65XpGqUOiZCxC95F
   8YPx8BZc3wcw8Co98Td3Dxvx1jEsujYOPWRwp7KEfAKNVBKTD+x688kTd
   MA6jhtDduF38OuypuwG302niNJHxi1TUSQ0jUicNV5rM4XeKmO5bJ5QUj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="327403765"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="327403765"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 03:20:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="837671887"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="837671887"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jan 2023 03:20:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM5jA-0002kg-2K;
	Sun, 29 Jan 2023 11:20:04 +0000
Date: Sun, 29 Jan 2023 19:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/spi/spi-omap-uwire.c:396:3: warning: Value stored to 'rate'
 is never read [clang-analyzer-deadcode.DeadStores]
Message-ID: <202301291959.cBwchN7P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/spi/spi-omap-uwire.c:396:3: warning: Value stored to 'rate' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c96618275234ad03d44eafe9f8844305bb44fda4
commit: 58d37dc1dfd8900892d73da1f26ac1cefca52e6e ARM: omap1: move perseus spi pinconf to board file
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20230128 (https://download.01.org/0day-ci/archive/20230129/202301291959.cBwchN7P-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=58d37dc1dfd8900892d73da1f26ac1cefca52e6e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 58d37dc1dfd8900892d73da1f26ac1cefca52e6e
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:800:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&msg, 0, sizeof(msg));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:800:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(&msg, 0, sizeof(msg));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__underlying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:801:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg.id.id, &sl->reg_num, sizeof(msg.id));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:801:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(msg.id.id, &sl->reg_num, sizeof(msg.id));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:901:5: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&rn, &sl->reg_num, sizeof(rn));
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:901:5: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(&rn, &sl->reg_num, sizeof(rn));
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:997:2: warning: Value stored to 'search_bit' is never read [clang-analyzer-deadcode.DeadStores]
           search_bit = 0;
           ^            ~
   drivers/w1/w1.c:997:2: note: Value stored to 'search_bit' is never read
           search_bit = 0;
           ^            ~
   drivers/w1/w1.c:999:2: warning: Value stored to 'last_rn' is never read [clang-analyzer-deadcode.DeadStores]
           last_rn = 0;
           ^         ~
   drivers/w1/w1.c:999:2: note: Value stored to 'last_rn' is never read
           last_rn = 0;
           ^         ~
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/spi/spi-omap-uwire.c:121:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val ^= 0x03;
                   ^      ~~~~
   drivers/spi/spi-omap-uwire.c:121:3: note: Value stored to 'val' is never read
                   val ^= 0x03;
                   ^      ~~~~
>> drivers/spi/spi-omap-uwire.c:396:3: warning: Value stored to 'rate' is never read [clang-analyzer-deadcode.DeadStores]
                   rate /= 2;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:396:3: note: Value stored to 'rate' is never read
                   rate /= 2;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:401:3: warning: Value stored to 'rate' is never read [clang-analyzer-deadcode.DeadStores]
                   rate /= 4;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:401:3: note: Value stored to 'rate' is never read
                   rate /= 4;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:408:3: warning: Value stored to 'rate' is never read [clang-analyzer-deadcode.DeadStores]
                   rate /= 8;
                   ^       ~
   drivers/spi/spi-omap-uwire.c:408:3: note: Value stored to 'rate' is never read
                   rate /= 8;
                   ^       ~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   56 warnings generated.
   drivers/media/dvb-frontends/cx24120.c:236:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&msg.buf[1], values, msg.len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:236:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&msg.buf[1], values, msg.len);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:297:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &cx24120_ops,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:297:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &cx24120_ops,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:584:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cmd.arg[6], &d->msg, d->msg_len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:584:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&cmd.arg[6], &d->msg, d->msg_len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__fortify_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__underlying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1225:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret = cx24120_writereg(state, CX24120_REG_CLKDIV, state->dcur.clkdiv);

vim +/rate +396 drivers/spi/spi-omap-uwire.c

fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  305  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  306  static int uwire_setup_transfer(struct spi_device *spi, struct spi_transfer *t)
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  307  {
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  308  	struct uwire_state	*ust = spi->controller_state;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  309  	struct uwire_spi	*uwire;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  310  	unsigned		flags = 0;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  311  	unsigned		hz;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  312  	unsigned long		rate;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  313  	int			div1_idx;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  314  	int			div1;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  315  	int			div2;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  316  	int			status;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  317  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  318  	uwire = spi_master_get_devdata(spi->master);
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  319  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  320  	/* mode 0..3, clock inverted separately;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  321  	 * standard nCS signaling;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  322  	 * don't treat DI=high as "not ready"
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  323  	 */
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  324  	if (spi->mode & SPI_CS_HIGH)
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  325  		flags |= UWIRE_CS_ACTIVE_HIGH;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  326  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  327  	if (spi->mode & SPI_CPOL)
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  328  		flags |= UWIRE_CLK_INVERTED;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  329  
fdb217a38808e0 drivers/spi/spi-omap-uwire.c Andy Shevchenko 2021-05-10  330  	switch (spi->mode & SPI_MODE_X_MASK) {
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  331  	case SPI_MODE_0:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  332  	case SPI_MODE_3:
e5f1b194a9afa3 drivers/spi/omap_uwire.c     Imre Deak       2007-05-23  333  		flags |= UWIRE_WRITE_FALLING_EDGE | UWIRE_READ_RISING_EDGE;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  334  		break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  335  	case SPI_MODE_1:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  336  	case SPI_MODE_2:
e5f1b194a9afa3 drivers/spi/omap_uwire.c     Imre Deak       2007-05-23  337  		flags |= UWIRE_WRITE_RISING_EDGE | UWIRE_READ_FALLING_EDGE;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  338  		break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  339  	}
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  340  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  341  	/* assume it's already enabled */
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  342  	rate = clk_get_rate(uwire->ck);
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  343  
160f8d0691659b drivers/spi/spi-omap-uwire.c Jarkko Nikula   2015-09-15  344  	if (t != NULL)
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  345  		hz = t->speed_hz;
160f8d0691659b drivers/spi/spi-omap-uwire.c Jarkko Nikula   2015-09-15  346  	else
160f8d0691659b drivers/spi/spi-omap-uwire.c Jarkko Nikula   2015-09-15  347  		hz = spi->max_speed_hz;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  348  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  349  	if (!hz) {
6c7377ab6814c2 drivers/spi/omap_uwire.c     Kay Sievers     2009-03-24  350  		pr_debug("%s: zero speed?\n", dev_name(&spi->dev));
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  351  		status = -EINVAL;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  352  		goto done;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  353  	}
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  354  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  355  	/* F_INT = mpu_xor_clk / DIV1 */
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  356  	for (div1_idx = 0; div1_idx < 4; div1_idx++) {
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  357  		switch (div1_idx) {
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  358  		case 0:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  359  			div1 = 2;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  360  			break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  361  		case 1:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  362  			div1 = 4;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  363  			break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  364  		case 2:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  365  			div1 = 7;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  366  			break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  367  		default:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  368  		case 3:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  369  			div1 = 10;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  370  			break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  371  		}
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  372  		div2 = (rate / div1 + hz - 1) / hz;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  373  		if (div2 <= 8)
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  374  			break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  375  	}
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  376  	if (div1_idx == 4) {
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  377  		pr_debug("%s: lowest clock %ld, need %d\n",
6c7377ab6814c2 drivers/spi/omap_uwire.c     Kay Sievers     2009-03-24  378  			dev_name(&spi->dev), rate / 10 / 8, hz);
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  379  		status = -EDOM;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  380  		goto done;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  381  	}
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  382  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  383  	/* we have to cache this and reset in uwire_chipselect as this is a
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  384  	 * global parameter and another uwire device can change it under
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  385  	 * us */
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  386  	ust->div1_idx = div1_idx;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  387  	uwire_set_clk1_div(div1_idx);
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  388  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  389  	rate /= div1;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  390  
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  391  	switch (div2) {
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  392  	case 0:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  393  	case 1:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  394  	case 2:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  395  		flags |= UWIRE_FREQ_DIV_2;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12 @396  		rate /= 2;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  397  		break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  398  	case 3:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  399  	case 4:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  400  		flags |= UWIRE_FREQ_DIV_4;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  401  		rate /= 4;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  402  		break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  403  	case 5:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  404  	case 6:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  405  	case 7:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  406  	case 8:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  407  		flags |= UWIRE_FREQ_DIV_8;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  408  		rate /= 8;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  409  		break;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  410  	}
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  411  	omap_uwire_configure_mode(spi->chip_select, flags);
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  412  	pr_debug("%s: uwire flags %02x, armxor %lu KHz, SCK %lu KHz\n",
b687d2a8f8d469 drivers/spi/omap_uwire.c     Harvey Harrison 2008-04-28  413  			__func__, flags,
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  414  			clk_get_rate(uwire->ck) / 1000,
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  415  			rate / 1000);
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  416  	status = 0;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  417  done:
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  418  	return status;
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  419  }
fdb3c18d639311 drivers/spi/omap_uwire.c     David Brownell  2007-02-12  420  

:::::: The code at line 396 was first introduced by commit
:::::: fdb3c18d639311287dc4675abe743847a1aa62a8 [PATCH] SPI controller driver for OMAP Microwire

:::::: TO: David Brownell <david-b@pacbell.net>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
