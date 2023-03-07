Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489C63C00
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Mar 2023 12:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678190585; x=1709726585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KOxoi8cFyc2wSyVPgbISotnqGuZVIBHA/h7aDgE2ZBo=;
  b=XgXfOq+Zf4NW49JP0+3hG/eOEmarSjVqnPwZ2sjSRbjLzWUmEISjEqKf
   iFgh6B8wb7ucxmHgtXGYpZWZ0Mh6iFazDiAdbzJQ5RjXS0LjqTSHoenVD
   +ExEk+ioheaetvgoUeqH6PxoPMiTyqHhUqbi7cMllC/mGhZCgH22xAxm0
   ISvwX489xABZ/Ty9HmldhOKGKnKrYQma4sGBpIzzWKq8+EhN2MK6fbOWV
   5QqGhDZARw7osdXayXgOU3x5Q4Y1VTZLdWwCt2KC4Zn8bykiZK1NyOK5f
   iwAqwAWeqKf5mXGVHwTkWHW/XLjHOePdxYzM6hF8Wlb4aBGdOeUaNm849
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315487114"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="315487114"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 04:03:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745438502"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="745438502"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2023 04:03:03 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZW22-0001HF-2v;
	Tue, 07 Mar 2023 12:03:02 +0000
Date: Tue, 7 Mar 2023 20:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/tls/tls_sw.c:160:23: warning: Branch condition evaluates to a
 garbage value [clang-analyzer-core.uninitialized.Branch]
Message-ID: <202303071938.W6OBMY82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/tls/tls_sw.c:160:23: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ca09d5fa3549d142c2080a72a4c70ce389163cd
commit: dd47ed3620e693636b4d912db4810fe0c092eb2c tls: rx: factor SW handling out of tls_rx_one_record()
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20230302 (https://download.01.org/0day-ci/archive/20230307/202303071938.W6OBMY82-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dd47ed3620e693636b4d912db4810fe0c092eb2c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dd47ed3620e693636b4d912db4810fe0c092eb2c
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303071938.W6OBMY82-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   drivers/nfc/st21nfca/dep.c:163:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(atr_res->nfcid3, atr_req->nfcid3, 6);
           ^~~~~~
   drivers/nfc/st21nfca/dep.c:163:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(atr_res->nfcid3, atr_req->nfcid3, 6);
           ^~~~~~
   drivers/nfc/st21nfca/dep.c:173:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(atr_res->gbi, atr_req->gbi, gb_len);
                   ^~~~~~
   drivers/nfc/st21nfca/dep.c:173:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(atr_res->gbi, atr_req->gbi, gb_len);
                   ^~~~~~
   drivers/nfc/st21nfca/dep.c:516:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(atr_req, 0, sizeof(struct st21nfca_atr_req));
           ^~~~~~
   drivers/nfc/st21nfca/dep.c:516:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(atr_req, 0, sizeof(struct st21nfca_atr_req));
           ^~~~~~
   drivers/nfc/st21nfca/dep.c:520:2: warning: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(atr_req->nfcid3, 0, NFC_NFCID3_MAXSIZE);
           ^~~~~~
   drivers/nfc/st21nfca/dep.c:520:2: note: Call to function 'memset' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memset_s' in case of C11
           memset(atr_req->nfcid3, 0, NFC_NFCID3_MAXSIZE);
           ^~~~~~
   drivers/nfc/st21nfca/dep.c:524:3: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(atr_req->nfcid3, target->sensf_res,
                   ^~~~~~
   drivers/nfc/st21nfca/dep.c:524:3: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(atr_req->nfcid3, target->sensf_res,
                   ^~~~~~
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/media/tuners/mc44s803.c:342:2: warning: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &mc44s803_tuner_ops,
           ^~~~~~
   drivers/media/tuners/mc44s803.c:342:2: note: Call to function 'memcpy' is insecure as it does not provide security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &mc44s803_tuner_ops,
           ^~~~~~
   Suppressed 44 warnings (43 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/media/tuners/msi001.c:59:21: warning: Value stored to 'spi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:59:21: note: Value stored to 'spi' during its initialization is never read
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:85:21: warning: Value stored to 'spi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:85:21: note: Value stored to 'spi' during its initialization is never read
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:228:2: warning: Value stored to 'uitmp' is never read [clang-analyzer-deadcode.DeadStores]
           uitmp /= div_lo;
           ^        ~~~~~~
   drivers/media/tuners/msi001.c:228:2: note: Value stored to 'uitmp' is never read
           uitmp /= div_lo;
           ^        ~~~~~~
   drivers/media/tuners/msi001.c:295:21: warning: Value stored to 'spi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:295:21: note: Value stored to 'spi' during its initialization is never read
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:311:21: warning: Value stored to 'spi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:311:21: note: Value stored to 'spi' during its initialization is never read
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:320:21: warning: Value stored to 'spi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:320:21: note: Value stored to 'spi' during its initialization is never read
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:331:21: warning: Value stored to 'spi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:331:21: note: Value stored to 'spi' during its initialization is never read
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:351:21: warning: Value stored to 'spi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:351:21: note: Value stored to 'spi' during its initialization is never read
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:382:21: warning: Value stored to 'spi' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   drivers/media/tuners/msi001.c:382:21: note: Value stored to 'spi' during its initialization is never read
           struct spi_device *spi = dev->spi;
                              ^~~   ~~~~~~~~
   Suppressed 45 warnings (44 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   119 warnings generated.
>> net/tls/tls_sw.c:160:23: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   char content_type = darg->zc ? darg->tail : 0;
                                       ^
   net/tls/tls_sw.c:2114:6: note: 'timeo' is >= 0
           if (timeo < 0)
               ^~~~~
   net/tls/tls_sw.c:2114:2: note: Taking false branch
           if (timeo < 0)
           ^
   net/tls/tls_sw.c:2117:6: note: Assuming the condition is false
           if (!skb_queue_empty(&ctx->rx_list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:2117:2: note: Taking false branch
           if (!skb_queue_empty(&ctx->rx_list)) {
           ^
   net/tls/tls_sw.c:2124:7: note: 'err' is > 0
                   if (err <= 0)
                       ^~~
   net/tls/tls_sw.c:2124:3: note: Taking false branch
                   if (err <= 0)
                   ^
   net/tls/tls_sw.c:2129:9: note: Calling 'tls_rx_one_record'
                   err = tls_rx_one_record(sk, NULL, &darg);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:1671:8: note: Calling 'tls_decrypt_device'
           err = tls_decrypt_device(sk, tls_ctx, darg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:1642:6: note: Assuming field 'rx_conf' is equal to TLS_HW
           if (tls_ctx->rx_conf != TLS_HW)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:1642:2: note: Taking false branch
           if (tls_ctx->rx_conf != TLS_HW)
           ^
   net/tls/tls_sw.c:1646:6: note: Assuming 'err' is > 0
           if (err <= 0)
               ^~~~~~~~
   net/tls/tls_sw.c:1646:2: note: Taking false branch
           if (err <= 0)
           ^
   net/tls/tls_sw.c:1649:8: note: Calling 'tls_padding_length'
           pad = tls_padding_length(prot, tls_strp_msg(ctx), darg);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:158:6: note: Assuming the condition is true
           if (prot->version == TLS_1_3_VERSION) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:158:2: note: Taking true branch
           if (prot->version == TLS_1_3_VERSION) {
           ^
   net/tls/tls_sw.c:160:23: note: Branch condition evaluates to a garbage value
                   char content_type = darg->zc ? darg->tail : 0;
                                       ^~~~~~~~
   net/tls/tls_sw.c:391:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(rec, tmp, &ctx->tx_list, list) {
           ^
   include/linux/list.h:762:7: note: expanded from macro 'list_for_each_entry_safe'
                   n = list_next_entry(pos, member);                       \
                       ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container_of'
           void *__mptr = (void *)(ptr);                                   \
                                  ^
   net/tls/tls_sw.c:2391:15: note: Assuming 'tls_ctx' is non-null
           if (unlikely(!tls_ctx))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/tls/tls_sw.c:2391:2: note: Taking false branch
           if (unlikely(!tls_ctx))
           ^
   net/tls/tls_sw.c:2395:6: note: Assuming the condition is false
           if (test_bit(BIT_TX_CLOSING, &ctx->tx_bitmask))
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macro 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/tls/tls_sw.c:2395:2: note: Taking false branch
           if (test_bit(BIT_TX_CLOSING, &ctx->tx_bitmask))
           ^
   net/tls/tls_sw.c:2398:7: note: '?' condition is true
           if (!test_and_clear_bit(BIT_TX_SCHEDULED, &ctx->tx_bitmask))
                ^
   arch/arm/include/asm/bitops.h:193:34: note: expanded from macro 'test_and_clear_bit'
   #define test_and_clear_bit(nr,p)        ATOMIC_BITOP(test_and_clear_bit,nr,p)
                                           ^
   arch/arm/include/asm/bitops.h:181:3: note: expanded from macro 'ATOMIC_BITOP'
           (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _##name(nr,p))
            ^
   net/tls/tls_sw.c:2398:2: note: Taking false branch
           if (!test_and_clear_bit(BIT_TX_SCHEDULED, &ctx->tx_bitmask))
           ^
   net/tls/tls_sw.c:2402:2: note: Calling 'tls_tx_records'
           tls_tx_records(sk, -1);
           ^~~~~~~~~~~~~~~~~~~~~~
   net/tls/tls_sw.c:369:2: note: Taking true branch
           if (tls_is_partially_sent_record(tls_ctx)) {

vim +160 net/tls/tls_sw.c

0927f71dbcfb59 Doron Roberts-Kedes 2018-08-28  149  
ce61327ce989b6 Jakub Kicinski      2022-07-05  150  static int tls_padding_length(struct tls_prot_info *prot, struct sk_buff *skb,
ce61327ce989b6 Jakub Kicinski      2022-07-05  151  			      struct tls_decrypt_arg *darg)
130b392c6cd6b2 Dave Watson         2019-01-30  152  {
130b392c6cd6b2 Dave Watson         2019-01-30  153  	struct strp_msg *rxm = strp_msg(skb);
c3f6bb74137c68 Jakub Kicinski      2022-04-07  154  	struct tls_msg *tlm = tls_msg(skb);
130b392c6cd6b2 Dave Watson         2019-01-30  155  	int sub = 0;
130b392c6cd6b2 Dave Watson         2019-01-30  156  
130b392c6cd6b2 Dave Watson         2019-01-30  157  	/* Determine zero-padding length */
b53f4976fb1f73 Jakub Kicinski      2019-05-09  158  	if (prot->version == TLS_1_3_VERSION) {
5deee41b19b325 Jakub Kicinski      2022-04-07  159  		int offset = rxm->full_len - TLS_TAG_SIZE - 1;
ce61327ce989b6 Jakub Kicinski      2022-07-05 @160  		char content_type = darg->zc ? darg->tail : 0;
130b392c6cd6b2 Dave Watson         2019-01-30  161  		int err;
130b392c6cd6b2 Dave Watson         2019-01-30  162  
130b392c6cd6b2 Dave Watson         2019-01-30  163  		while (content_type == 0) {
5deee41b19b325 Jakub Kicinski      2022-04-07  164  			if (offset < prot->prepend_size)
130b392c6cd6b2 Dave Watson         2019-01-30  165  				return -EBADMSG;
5deee41b19b325 Jakub Kicinski      2022-04-07  166  			err = skb_copy_bits(skb, rxm->offset + offset,
130b392c6cd6b2 Dave Watson         2019-01-30  167  					    &content_type, 1);
b53f4976fb1f73 Jakub Kicinski      2019-05-09  168  			if (err)
b53f4976fb1f73 Jakub Kicinski      2019-05-09  169  				return err;
130b392c6cd6b2 Dave Watson         2019-01-30  170  			if (content_type)
130b392c6cd6b2 Dave Watson         2019-01-30  171  				break;
130b392c6cd6b2 Dave Watson         2019-01-30  172  			sub++;
5deee41b19b325 Jakub Kicinski      2022-04-07  173  			offset--;
130b392c6cd6b2 Dave Watson         2019-01-30  174  		}
c3f6bb74137c68 Jakub Kicinski      2022-04-07  175  		tlm->control = content_type;
130b392c6cd6b2 Dave Watson         2019-01-30  176  	}
130b392c6cd6b2 Dave Watson         2019-01-30  177  	return sub;
130b392c6cd6b2 Dave Watson         2019-01-30  178  }
130b392c6cd6b2 Dave Watson         2019-01-30  179  

:::::: The code at line 160 was first introduced by commit
:::::: ce61327ce989b63c0bd1cc7afee00e218ee696ac tls: rx: support optimistic decrypt to user buffer with TLS 1.3

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
