Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3808210F
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Feb 2023 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676818301; x=1708354301;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wbhRnEokNKh5IJpxskayBvdOU81qs4oAF3/NB+sigUQ=;
  b=P+KuLE+ZBjeA2e2HpVHMVG+zUCUjygkEwGBtv7EDXr6ZdkPCfW+k7TEL
   NExrhu+iqGUYmY12a0ZkJyOUMVSg0gb5uGfl8DsO7ovQkE8h9newttX5P
   v/9sBcJnULo3AhfEfvtfQV3uanj1jZTB1h1+0Qlt2wdFjd77RVRAdYIJD
   X67/jORKNFezpAmB9gO8Jp1dRbH9zpZTLvEL1iYKzg7si0xmWsj8JD4HZ
   6A/GdI9zmYgi4TbfdcyLajdMYZtVWA7+wnlVBCjTUdJ5nolK2H9b3eRW8
   Bjzo/X0Lx7iVlqdeDycDPHl+EpILGRHLrwpw+kdEnhPLWhTIscX8bGFrE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="396936604"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="396936604"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 06:51:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="759921058"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="759921058"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Feb 2023 06:51:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTl2P-000DLB-2g;
	Sun, 19 Feb 2023 14:51:37 +0000
Date: Sun, 19 Feb 2023 22:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/mtd/nand/onenand/onenand_base.c:3083:8: warning: Assigned
 value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Message-ID: <202302192211.86RkGtL6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mtd/nand/onenand/onenand_base.c:3083:8: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Michał Kępień" <kernel@kempniu.pl>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 745df17906029cc683b8b5ac8bcb08f82860baff mtd: always initialize 'stats' in struct mtd_oob_ops
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20230217 (https://download.01.org/0day-ci/archive/20230219/202302192211.86RkGtL6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=745df17906029cc683b8b5ac8bcb08f82860baff
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 745df17906029cc683b8b5ac8bcb08f82860baff
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302192211.86RkGtL6-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   drivers/mtd/devices/slram.c:122:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(priv->start + to, buf, len);
           ^~~~~~
   drivers/mtd/devices/slram.c:122:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(priv->start + to, buf, len);
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/mtd/nand/onenand/onenand_base.c:779:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, bufferram + offset, count);
           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:779:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, bufferram + offset, count);
           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:817:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, bufferram + offset, count);
           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:817:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, bufferram + offset, count);
           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:860:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(bufferram + offset, buffer, count);
           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:860:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(bufferram + offset, buffer, count);
           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1730:4: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(this->page_buf, 0xff, mtd->writesize);
                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1730:4: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                           memset(this->page_buf, 0xff, mtd->writesize);
                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1731:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(this->page_buf + column, buf, thislen);
                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1731:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(this->page_buf + column, buf, thislen);
                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1836:5: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(this->page_buf, 0xff, mtd->writesize);
                                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1836:5: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                                   memset(this->page_buf, 0xff, mtd->writesize);
                                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1837:5: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(this->page_buf + column, buf, thislen);
                                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1837:5: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(this->page_buf + column, buf, thislen);
                                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1848:5: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(oobbuf, 0xff, mtd->oobsize);
                                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1848:5: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                                   memset(oobbuf, 0xff, mtd->oobsize);
                                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1852:6: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memcpy(oobbuf + oobcolumn, oob, thisooblen);
                                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1852:6: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                                           memcpy(oobbuf + oobcolumn, oob, thisooblen);
                                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2019:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(oobbuf, 0xff, mtd->oobsize);
                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2019:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(oobbuf, 0xff, mtd->oobsize);
                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2023:4: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(oobbuf + column, buf, thislen);
                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2023:4: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(oobbuf + column, buf, thislen);
                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2028:4: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(this->page_buf, 0xff, mtd->writesize);
                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2028:4: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                           memset(this->page_buf, 0xff, mtd->writesize);
                           ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2820:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(oobbuf + column, buf, thislen);
                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2820:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(oobbuf + column, buf, thislen);
                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2942:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(this->page_buf, buf, len);
                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2942:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(this->page_buf, buf, len);
                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2943:3: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(this->page_buf + len, 0xff, mtd->writesize - len);
                   ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2943:3: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
                   memset(this->page_buf + len, 0xff, mtd->writesize - len);
                   ^~~~~~
>> drivers/mtd/nand/onenand/onenand_base.c:3083:8: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                           buf += tmp_retlen;
                               ^
   drivers/mtd/nand/onenand/onenand_base.c:3156:9: note: Calling 'onenand_otp_walk'
           return onenand_otp_walk(mtd, from, len, retlen, buf, do_otp_read, MTD_OTP_USER);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3038:6: note: Assuming 'density' is >= ONENAND_DEVICE_DENSITY_512Mb
           if (density < ONENAND_DEVICE_DENSITY_512Mb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3038:2: note: Taking false branch
           if (density < ONENAND_DEVICE_DENSITY_512Mb)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3043:6: note: 'mode' is not equal to MTD_OTP_FACTORY
           if (mode == MTD_OTP_FACTORY) {
               ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:3043:2: note: Taking false branch
           if (mode == MTD_OTP_FACTORY) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3049:6: note: 'mode' is equal to MTD_OTP_USER
           if (mode == MTD_OTP_USER) {
               ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:3049:2: note: Taking true branch
           if (mode == MTD_OTP_USER) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3050:7: note: Assuming the condition is false
                   if (mtd->writesize * otp_pages < from + len)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3050:3: note: Taking false branch
                   if (mtd->writesize * otp_pages < from + len)
                   ^
   drivers/mtd/nand/onenand/onenand_base.c:3058:9: note: Assuming 'len' is > 0
           while (len > 0 && otp_pages > 0) {
                  ^~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3058:9: note: Left side of '&&' is true
   drivers/mtd/nand/onenand/onenand_base.c:3058:2: note: Loop condition is true.  Entering loop body
           while (len > 0 && otp_pages > 0) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3059:8: note: 'action' is non-null
                   if (!action) {  /* OTP Info functions */
                        ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3059:3: note: Taking false branch
                   if (!action) {  /* OTP Info functions */
                   ^
   drivers/mtd/nand/onenand/onenand_base.c:3077:4: note: 'tmp_retlen' declared without an initial value
                           size_t tmp_retlen;
                           ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3079:10: note: Calling 'do_otp_read'
                           ret = action(mtd, from, len, &tmp_retlen, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2911:28: note: Assuming the condition is true
           ret = ONENAND_IS_4KB_PAGE(this) ?
                                     ^
   include/linux/mtd/onenand.h:206:3: note: expanded from macro 'ONENAND_IS_4KB_PAGE'
           (this->options & ONENAND_HAS_4KB_PAGE)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2911:8: note: '?' condition is true
           ret = ONENAND_IS_4KB_PAGE(this) ?
                 ^
   include/linux/mtd/onenand.h:206:2: note: expanded from macro 'ONENAND_IS_4KB_PAGE'
           (this->options & ONENAND_HAS_4KB_PAGE)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:2912:3: note: Calling 'onenand_mlc_read_ops_nolock'
                   onenand_mlc_read_ops_nolock(mtd, from, &ops) :
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1128:2: note: Taking false branch
           pr_debug("%s: from = 0x%08x, len = %i\n", __func__, (unsigned int)from,
           ^
   include/linux/printk.h:594:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/mtd/nand/onenand/onenand_base.c:1135:6: note: Assuming the condition is false
           if (from + len > mtd->size) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1135:2: note: Taking false branch
           if (from + len > mtd->size) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:1145:9: note: 'read' is < 'len'
           while (read < len) {
                  ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:1145:2: note: Loop condition is true.  Entering loop body
           while (read < len) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:1148:13: note: Assuming '__UNIQUE_ID___x182' is >= '__UNIQUE_ID___y183'
                   thislen = min_t(int, writesize, len - read);
                             ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1148:13: note: '?' condition is false

vim +3083 drivers/mtd/nand/onenand/onenand_base.c

493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2921  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2922  /**
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2923   * do_otp_write - [DEFAULT] Write OTP block area
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2924   * @mtd:		MTD device structure
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2925   * @to:		The offset to write
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2926   * @len:		number of bytes to write
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2927   * @retlen:	pointer to variable to store the number of write bytes
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2928   * @buf:		the databuffer to put/get data
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2929   *
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2930   * Write OTP block area.
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2931   */
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  2932  static int do_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2933  		size_t *retlen, u_char *buf)
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2934  {
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2935  	struct onenand_chip *this = mtd->priv;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2936  	unsigned char *pbuf = buf;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2937  	int ret;
745df17906029c drivers/mtd/nand/onenand/onenand_base.c Michał Kępień         2022-06-29  2938  	struct mtd_oob_ops ops = { };
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2939  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2940  	/* Force buffer page aligned */
28318776a80bc3 drivers/mtd/onenand/onenand_base.c      Joern Engel           2006-05-22  2941  	if (len < mtd->writesize) {
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12 @2942  		memcpy(this->page_buf, buf, len);
28318776a80bc3 drivers/mtd/onenand/onenand_base.c      Joern Engel           2006-05-22  2943  		memset(this->page_buf + len, 0xff, mtd->writesize - len);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2944  		pbuf = this->page_buf;
28318776a80bc3 drivers/mtd/onenand/onenand_base.c      Joern Engel           2006-05-22  2945  		len = mtd->writesize;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2946  	}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2947  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2948  	/* Enter OTP access mode */
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2949  	this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2950  	this->wait(mtd, FL_OTPING);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2951  
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  2952  	ops.len = len;
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  2953  	ops.ooblen = 0;
1437085c3780f0 drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2007-10-10  2954  	ops.datbuf = pbuf;
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  2955  	ops.oobbuf = NULL;
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  2956  	ret = onenand_write_ops_nolock(mtd, to, &ops);
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  2957  	*retlen = ops.retlen;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2958  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2959  	/* Exit OTP access mode */
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2960  	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
44f45994f438b4 drivers/mtd/nand/onenand/onenand_base.c Amir Mahdi Ghorbanian 2020-01-02  2961  	this->wait(mtd, FL_RESETTING);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2962  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2963  	return ret;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2964  }
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2965  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2966  /**
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2967   * do_otp_lock - [DEFAULT] Lock OTP block area
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2968   * @mtd:		MTD device structure
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2969   * @from:		The offset to lock
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2970   * @len:		number of bytes to lock
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2971   * @retlen:	pointer to variable to store the number of lock bytes
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  2972   * @buf:		the databuffer to put/get data
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2973   *
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2974   * Lock OTP block area.
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2975   */
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2976  static int do_otp_lock(struct mtd_info *mtd, loff_t from, size_t len,
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2977  		size_t *retlen, u_char *buf)
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2978  {
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2979  	struct onenand_chip *this = mtd->priv;
745df17906029c drivers/mtd/nand/onenand/onenand_base.c Michał Kępień         2022-06-29  2980  	struct mtd_oob_ops ops = { };
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2981  	int ret;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2982  
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  2983  	if (FLEXONENAND(this)) {
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  2984  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2985  		/* Enter OTP access mode */
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2986  		this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  2987  		this->wait(mtd, FL_OTPING);
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2988  		/*
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2989  		 * For Flex-OneNAND, we write lock mark to 1st word of sector 4 of
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2990  		 * main area of page 49.
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2991  		 */
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2992  		ops.len = mtd->writesize;
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2993  		ops.ooblen = 0;
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2994  		ops.datbuf = buf;
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2995  		ops.oobbuf = NULL;
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2996  		ret = onenand_write_ops_nolock(mtd, mtd->writesize * 49, &ops);
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  2997  		*retlen = ops.retlen;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  2998  
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  2999  		/* Exit OTP access mode */
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3000  		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
44f45994f438b4 drivers/mtd/nand/onenand/onenand_base.c Amir Mahdi Ghorbanian 2020-01-02  3001  		this->wait(mtd, FL_RESETTING);
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  3002  	} else {
0612b9ddc2eeda drivers/mtd/onenand/onenand_base.c      Brian Norris          2011-08-30  3003  		ops.mode = MTD_OPS_PLACE_OOB;
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  3004  		ops.ooblen = len;
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  3005  		ops.oobbuf = buf;
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  3006  		ops.ooboffs = 0;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3007  		ret = onenand_otp_write_oob_nolock(mtd, from, &ops);
12f77c9eed0d2a drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2007-08-30  3008  		*retlen = ops.oobretlen;
5988af2319781b drivers/mtd/onenand/onenand_base.c      Rohit Hagargundgi     2009-05-12  3009  	}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3010  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3011  	return ret;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3012  }
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3013  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3014  /**
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3015   * onenand_otp_walk - [DEFAULT] Handle OTP operation
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  3016   * @mtd:		MTD device structure
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  3017   * @from:		The offset to read/write
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  3018   * @len:		number of bytes to read/write
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  3019   * @retlen:	pointer to variable to store the number of read bytes
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  3020   * @buf:		the databuffer to put/get data
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  3021   * @action:	do given action
720ae74ddf0aa4 drivers/mtd/nand/onenand/onenand_base.c Lee Jones             2020-11-09  3022   * @mode:		specify user and factory
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3023   *
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3024   * Handle OTP operation.
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3025   */
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3026  static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3027  			size_t *retlen, u_char *buf,
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3028  			otp_op_t action, int mode)
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3029  {
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3030  	struct onenand_chip *this = mtd->priv;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3031  	int otp_pages;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3032  	int density;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3033  	int ret = 0;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3034  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3035  	*retlen = 0;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3036  
e71f04fc9234b1 drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2007-12-11  3037  	density = onenand_get_density(this->device_id);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3038  	if (density < ONENAND_DEVICE_DENSITY_512Mb)
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3039  		otp_pages = 20;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3040  	else
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3041  		otp_pages = 50;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3042  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3043  	if (mode == MTD_OTP_FACTORY) {
28318776a80bc3 drivers/mtd/onenand/onenand_base.c      Joern Engel           2006-05-22  3044  		from += mtd->writesize * otp_pages;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3045  		otp_pages = ONENAND_PAGES_PER_BLOCK - otp_pages;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3046  	}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3047  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3048  	/* Check User/Factory boundary */
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3049  	if (mode == MTD_OTP_USER) {
0a032a4df6dc4a drivers/mtd/onenand/onenand_base.c      Roel Kluin            2009-12-16  3050  		if (mtd->writesize * otp_pages < from + len)
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3051  			return 0;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3052  	} else {
0a032a4df6dc4a drivers/mtd/onenand/onenand_base.c      Roel Kluin            2009-12-16  3053  		if (mtd->writesize * otp_pages <  len)
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3054  			return 0;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3055  	}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3056  
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  3057  	onenand_get_device(mtd, FL_OTPING);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3058  	while (len > 0 && otp_pages > 0) {
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3059  		if (!action) {	/* OTP Info functions */
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3060  			struct otp_info *otpinfo;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3061  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3062  			len -= sizeof(struct otp_info);
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  3063  			if (len <= 0) {
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  3064  				ret = -ENOSPC;
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  3065  				break;
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  3066  			}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3067  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3068  			otpinfo = (struct otp_info *) buf;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3069  			otpinfo->start = from;
28318776a80bc3 drivers/mtd/onenand/onenand_base.c      Joern Engel           2006-05-22  3070  			otpinfo->length = mtd->writesize;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3071  			otpinfo->locked = 0;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3072  
28318776a80bc3 drivers/mtd/onenand/onenand_base.c      Joern Engel           2006-05-22  3073  			from += mtd->writesize;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3074  			buf += sizeof(struct otp_info);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3075  			*retlen += sizeof(struct otp_info);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3076  		} else {
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3077  			size_t tmp_retlen;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3078  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3079  			ret = action(mtd, from, len, &tmp_retlen, buf);
c3cb77f8980db9 drivers/mtd/onenand/onenand_base.c      Dan Carpenter         2016-04-13  3080  			if (ret)
c3cb77f8980db9 drivers/mtd/onenand/onenand_base.c      Dan Carpenter         2016-04-13  3081  				break;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3082  
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21 @3083  			buf += tmp_retlen;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3084  			len -= tmp_retlen;
3cf602532c535e drivers/mtd/onenand/onenand_base.c      Amul Kumar Saha       2009-10-21  3085  			*retlen += tmp_retlen;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3086  
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3087  		}
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3088  		otp_pages--;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3089  	}
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  3090  	onenand_release_device(mtd);
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3091  
49dc08eeda707f drivers/mtd/onenand/onenand_base.c      Artem Bityutskiy      2007-09-21  3092  	return ret;
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3093  }
493c646077ef0b drivers/mtd/onenand/onenand_base.c      Kyungmin Park         2006-05-12  3094  

:::::: The code at line 3083 was first introduced by commit
:::::: 3cf602532c535ec655725e9833378e04c9fd7783 mtd: OneNAND OTP support rework

:::::: TO: Amul Kumar Saha <amul.saha@samsung.com>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
