Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0AC2FAE
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 12:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678968332; x=1710504332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLZpXsnGIHTnIzVUzniX8qY1RDnFOTo18DduG4pCBhY=;
  b=IgUYwd7NeP54EAhoF3GXT4Lcn6CBGHR11+BpSIHYZPYAnkYVT7hFkJpx
   HMEIJ5QL453lUIHkRLbVEwAmnV3D4EdeoVVXPZ116CmXbdS92dYmbrKZ4
   NWfHaGvvpDQr2QXpovHwUsDyUrtP0JGk8nNieZdebnfUWVl2BXsEgY1dB
   S39VMiMWtllvQauUV+qikqAHYGqPz775PqFBia/bspZKpwKURz5Yhkv5K
   8e4bzyPWV2ojQXo/bCh52ciBX5dGJA7algpNYK/LXn8Te/LW+/SUbX1pZ
   Rt1SvZb4fiolyrO/rjPsgyPOd9B5dHiklyDJSn4QtLwEmjIIjQev7EcQt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424239325"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="424239325"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 05:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="673132641"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="673132641"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Mar 2023 05:05:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcmML-0008VK-04;
	Thu, 16 Mar 2023 12:05:29 +0000
Date: Thu, 16 Mar 2023 20:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2397/3406] crypto/acompress.c:191:32: warning:
 Value stored to 'istat' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303162020.UMXPsl3a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/acompress.c:191:32: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: c35f081e4ed448174242d1d37dc4c6525b395942 [2397/3406] crypto: acomp - Count error stats differently
:::::: branch date: 11 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230316/202303162020.UMXPsl3a-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c35f081e4ed448174242d1d37dc4c6525b395942
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c35f081e4ed448174242d1d37dc4c6525b395942
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303162020.UMXPsl3a-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           if (*(ptr++) != ',' ||
           ^
   kernel/debug/gdbstub.c:904:6: note: Assuming the condition is true
           if (remcom_in_buffer[0] == 'Z' && *bpt_type == '0')
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/debug/gdbstub.c:904:6: note: Left side of '&&' is true
   kernel/debug/gdbstub.c:904:36: note: Assuming the condition is false
           if (remcom_in_buffer[0] == 'Z' && *bpt_type == '0')
                                             ^~~~~~~~~~~~~~~~
   kernel/debug/gdbstub.c:904:2: note: Taking false branch
           if (remcom_in_buffer[0] == 'Z' && *bpt_type == '0')
           ^
   kernel/debug/gdbstub.c:906:38: note: Left side of '&&' is false
           else if (remcom_in_buffer[0] == 'z' && *bpt_type == '0')
                                               ^
   kernel/debug/gdbstub.c:908:7: note: Taking true branch
           else if (remcom_in_buffer[0] == 'Z')
                ^
   kernel/debug/gdbstub.c:909:11: note: Called function pointer is null (null dereference)
                   error = arch_kgdb_ops.set_hw_breakpoint(addr,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/debug/gdbstub.c:973:17: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   ptr += strlen(strcpy(ptr, "thread:"));
                                 ^
   include/linux/fortify-string.h:231:56: note: expanded from macro 'strlen'
           __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
                                                                 ^
   include/linux/const.h:12:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   kernel/debug/gdbstub.c:973:17: note: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
                   ptr += strlen(strcpy(ptr, "thread:"));
                                 ^
   include/linux/fortify-string.h:231:56: note: expanded from macro 'strlen'
           __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
                                                                 ^
   include/linux/const.h:12:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
   kernel/debug/gdbstub.c:981:3: warning: Value stored to 'error' is never read [clang-analyzer-deadcode.DeadStores]
                   error = 0;
                   ^       ~
   kernel/debug/gdbstub.c:981:3: note: Value stored to 'error' is never read
                   error = 0;
                   ^       ~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   arch/arm/kernel/devtree.c:230:6: warning: Access to field 'dt_fixup' results in a dereference of a null pointer (loaded from variable 'mdesc') [clang-analyzer-core.NullDereference]
           if (mdesc->dt_fixup)
               ^~~~~
   arch/arm/kernel/devtree.c:204:6: note: Assuming 'dt_virt' is non-null
           if (!dt_virt || !early_init_dt_verify(dt_virt))
               ^~~~~~~~
   arch/arm/kernel/devtree.c:204:6: note: Left side of '||' is false
   arch/arm/kernel/devtree.c:204:18: note: Assuming the condition is false
           if (!dt_virt || !early_init_dt_verify(dt_virt))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:204:2: note: Taking false branch
           if (!dt_virt || !early_init_dt_verify(dt_virt))
           ^
   arch/arm/kernel/devtree.c:207:2: note: Value assigned to 'mdesc'
           mdesc = of_flat_dt_match_machine(mdesc_best, arch_get_next_mach);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:209:6: note: Assuming 'mdesc' is null
           if (!mdesc) {
               ^~~~~~
   arch/arm/kernel/devtree.c:209:2: note: Taking true branch
           if (!mdesc) {
           ^
   arch/arm/kernel/devtree.c:219:10: note: Assuming 'size' is <= 0
                   while (size > 0) {
                          ^~~~~~~~
   arch/arm/kernel/devtree.c:219:3: note: Loop condition is false. Execution continues on line 224
                   while (size > 0) {
                   ^
   arch/arm/kernel/devtree.c:230:6: note: Access to field 'dt_fixup' results in a dereference of a null pointer (loaded from variable 'mdesc')
           if (mdesc->dt_fixup)
               ^~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/rapidio/rio-scan.c:565:10: warning: Although the value stored to 'tmp' is used in the enclosing expression, the value is never actually read from 'tmp' [clang-analyzer-deadcode.DeadStores]
           while ((tmp = rio_get_host_deviceid_lock(port, hopcount))
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio-scan.c:565:10: note: Although the value stored to 'tmp' is used in the enclosing expression, the value is never actually read from 'tmp'
           while ((tmp = rio_get_host_deviceid_lock(port, hopcount))
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
>> crypto/acompress.c:191:32: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_compress *istat = comp_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~
   crypto/acompress.c:191:32: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_compress *istat = comp_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 19 warnings (18 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   crypto/testmgr.c:297:8: warning: Excessive padding in 'struct testvec_config' (5 padding bytes, where 1 is optimal). Optimal fields order: name, inplace_mode, req_flags, iv_offset, key_offset, finalization_type, src_divs, dst_divs, iv_offset_relative_to_alignmask, key_offset_relative_to_alignmask, nosimd, consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]
   struct testvec_config {
   ~~~~~~~^~~~~~~~~~~~~~~~
   crypto/testmgr.c:297:8: note: Excessive padding in 'struct testvec_config' (5 padding bytes, where 1 is optimal). Optimal fields order: name, inplace_mode, req_flags, iv_offset, key_offset, finalization_type, src_divs, dst_divs, iv_offset_relative_to_alignmask, key_offset_relative_to_alignmask, nosimd, consider reordering the fields or adding explicit padding members
   struct testvec_config {
   ~~~~~~~^~~~~~~~~~~~~~~~
   crypto/testmgr.c:625:25: warning: Access to field 'offset' results in a dereference of an undefined pointer value (loaded from field 'div') [clang-analyzer-core.NullDereference]
                   unsigned int offset = partitions[i].div->offset;
                                         ^
   crypto/testmgr.c:2756:19: note: Assuming 'enc' is 0
           const char *op = enc ? "encryption" : "decryption";
                            ^~~
   crypto/testmgr.c:2756:19: note: '?' condition is false
   crypto/testmgr.c:2761:5: note: Assuming field 'iv_offset_relative_to_alignmask' is false
                    (cfg->iv_offset_relative_to_alignmask ? alignmask : 0);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:2761:5: note: '?' condition is false
   crypto/testmgr.c:2766:6: note: Assuming field 'wk' is 0
           if (vec->wk)
               ^~~~~~~
   crypto/testmgr.c:2766:2: note: Taking false branch
           if (vec->wk)
           ^
   crypto/testmgr.c:2771:8: note: 'err' is equal to 0
           err = do_setkey(crypto_skcipher_setkey, tfm, vec->key, vec->klen,
                 ^
   crypto/testmgr.c:854:6: note: expanded from macro 'do_setkey'
           if (err == 0) {                                                 \
               ^~~
   crypto/testmgr.c:2771:8: note: Taking true branch
           err = do_setkey(crypto_skcipher_setkey, tfm, vec->key, vec->klen,
                 ^
   crypto/testmgr.c:854:2: note: expanded from macro 'do_setkey'
           if (err == 0) {                                                 \
           ^
   crypto/testmgr.c:2773:6: note: Assuming 'err' is 0
           if (err) {
               ^~~
   crypto/testmgr.c:2773:2: note: Taking false branch
           if (err) {
           ^
   crypto/testmgr.c:2781:6: note: Assuming field 'setkey_error' is 0
           if (vec->setkey_error) {
               ^~~~~~~~~~~~~~~~~
   crypto/testmgr.c:2781:2: note: Taking false branch
           if (vec->setkey_error) {
           ^
   crypto/testmgr.c:2788:6: note: Assuming 'ivsize' is 0
           if (ivsize) {
               ^~~~~~
   crypto/testmgr.c:2788:2: note: Taking false branch
           if (ivsize) {
           ^
   crypto/testmgr.c:2798:7: note: Assuming field 'generates_iv' is false
                   if (vec->generates_iv) {
                       ^~~~~~~~~~~~~~~~~
   crypto/testmgr.c:2798:3: note: Taking false branch
                   if (vec->generates_iv) {
                   ^
   crypto/testmgr.c:2807:19: note: 'enc' is 0
           input.iov_base = enc ? (void *)vec->ptext : (void *)vec->ctext;
                            ^~~
   crypto/testmgr.c:2807:19: note: '?' condition is false
   crypto/testmgr.c:2809:8: note: Calling 'build_cipher_test_sglists'
           err = build_cipher_test_sglists(tsgls, cfg, alignmask,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:779:5: note: Assuming field 'inplace_mode' is equal to OUT_OF_PLACE
                                   cfg->inplace_mode != OUT_OF_PLACE ?
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:779:5: note: '?' condition is false
   crypto/testmgr.c:778:8: note: Calling 'build_test_sglist'
           err = build_test_sglist(&tsgls->src, cfg->src_divs, alignmask,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/testmgr.c:596:2: note: Taking false branch
           BUILD_BUG_ON(ARRAY_SIZE(partitions) != ARRAY_SIZE(tsgl->sgl));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'

vim +/istat +191 crypto/acompress.c

1ab53a77b772bf Giovanni Cabiddu 2016-10-21  188  
c35f081e4ed448 Herbert Xu       2023-02-16  189  void comp_prepare_alg(struct comp_alg_common *alg)
2ebda74fd6c9d3 Giovanni Cabiddu 2016-10-21  190  {
c35f081e4ed448 Herbert Xu       2023-02-16 @191  	struct crypto_istat_compress *istat = comp_get_stat(alg);
2ebda74fd6c9d3 Giovanni Cabiddu 2016-10-21  192  	struct crypto_alg *base = &alg->base;
2ebda74fd6c9d3 Giovanni Cabiddu 2016-10-21  193  
2ebda74fd6c9d3 Giovanni Cabiddu 2016-10-21  194  	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
c35f081e4ed448 Herbert Xu       2023-02-16  195  
c35f081e4ed448 Herbert Xu       2023-02-16  196  	if (IS_ENABLED(CONFIG_CRYPTO_STATS))
c35f081e4ed448 Herbert Xu       2023-02-16  197  		memset(istat, 0, sizeof(*istat));
c35f081e4ed448 Herbert Xu       2023-02-16  198  }
c35f081e4ed448 Herbert Xu       2023-02-16  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
