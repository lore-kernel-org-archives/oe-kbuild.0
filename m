Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D2011C80
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 10:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+6u/PnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699958456; x=1731494456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3xFi8EAS55JyoAR5rOxPno3GGXSEZ8rPrHfGwQJyfBU=;
  b=c+6u/PnIi7GdNYIyKL5S4FxiCPD+SctIUk/wxQxpeeDyj5hiOKtug1qE
   GgF4p6FwYEg5LPMbtsak1XKHrUaDuvpbYROs85TjuZDLYZJrqU8ezyjmb
   RKZP3a5mSTbn1Zyt+QoYnCR9JiJ0lt+ysX5Pw7xai+7xCZ05Dezy6Of9M
   KX3cqrR3rX0BtD+Djq7gWvUIf42PIc/wQKOoQBKwxlYcAUd+NnQ4Qq/O6
   c6d+nTtmiHOrKEaBc14fPcG6UkbQaoN7GRphOTIlCmFM7snxMBf8DvNfz
   hKjTf6HmAU3ZQsuJQHR3hRnoJjzLr+0gM2gZMfXXdH3IgaezGO8hScOHI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476840553"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="476840553"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 02:40:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908322822"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="908322822"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2023 02:40:54 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2qqh-0000CJ-25;
	Tue, 14 Nov 2023 10:40:51 +0000
Date: Tue, 14 Nov 2023 18:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <202311141830.g6TK9OTS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "fbc bf32999b1541d795110480a5f3d440b141a59001 and parent 6b861c580cdcb69bd4cfe72d325e92c7ee572003 have different kconfig"
:::::: Manual check reason: "has kconfig file changed"
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231114050525.471854-5-pavitrakumarm@vayavyalabs.com>
References: <20231114050525.471854-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
CC: manjunath.hadli@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
CC: shwetar <shwetar@vayavyalabs.com>
CC: Ruud Derwig <Ruud.Derwig@synopsys.com>

Hi Pavitrakumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.7-rc1]
[cannot apply to xilinx-xlnx/master next-20231114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPACC-driver-to-Linux-kernel/20231114-143618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20231114050525.471854-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: csky-randconfig-001-20231114 (https://download.01.org/0day-ci/archive/20231114/202311141830.g6TK9OTS-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311141830.g6TK9OTS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311141830.g6TK9OTS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/crypto/dwc-spacc/spacc_skcipher.c:87:5: warning: no previous prototype for 'spacc_skcipher_fallback' [-Wmissing-prototypes]
      87 | int spacc_skcipher_fallback(unsigned char *name, struct skcipher_request *req,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_skcipher.c: In function 'spacc_cipher_cb':
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:131:18: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
     131 |         int err, rc;
         |                  ^~
   drivers/crypto/dwc-spacc/spacc_skcipher.c: At top level:
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:155:5: warning: no previous prototype for 'spacc_cipher_init_dma' [-Wmissing-prototypes]
     155 | int spacc_cipher_init_dma(struct device *dev, struct skcipher_request *req)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:179:5: warning: no previous prototype for 'spacc_cipher_cra_init' [-Wmissing-prototypes]
     179 | int spacc_cipher_cra_init(struct crypto_tfm *tfm)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:210:5: warning: no previous prototype for 'spacc_cipher_setkey' [-Wmissing-prototypes]
     210 | int spacc_cipher_setkey(struct crypto_skcipher *tfm, const u8 *key,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:283:5: warning: no previous prototype for 'spacc_cipher_process' [-Wmissing-prototypes]
     283 | int spacc_cipher_process(struct skcipher_request *req, int enc_dec)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_skcipher.c: In function 'spacc_cipher_process':
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:293:13: warning: variable 'ivsize' set but not used [-Wunused-but-set-variable]
     293 |         int ivsize;
         |             ^~~~~~
   drivers/crypto/dwc-spacc/spacc_skcipher.c: At top level:
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:473:5: warning: no previous prototype for 'spacc_cipher_encrypt' [-Wmissing-prototypes]
     473 | int spacc_cipher_encrypt(struct skcipher_request *req)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:487:5: warning: no previous prototype for 'spacc_cipher_decrypt' [-Wmissing-prototypes]
     487 | int spacc_cipher_decrypt(struct skcipher_request *req)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_skcipher.c: In function 'probe_ciphers':
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:533:59: warning: '%s' directive output may be truncated writing up to 5299 bytes into a region of size 128 [-Wformat-truncation=]
     533 |         snprintf(calg->cra_name, sizeof(calg->cra_name), "%s", mode->name);
         |                                                           ^~
   In function 'spacc_init_calg',
       inlined from 'spacc_register_cipher' at drivers/crypto/dwc-spacc/spacc_skcipher.c:549:2,
       inlined from 'probe_ciphers' at drivers/crypto/dwc-spacc/spacc_skcipher.c:596:11:
   drivers/crypto/dwc-spacc/spacc_skcipher.c:533:9: note: 'snprintf' output between 1 and 5300 bytes into a destination of size 128
     533 |         snprintf(calg->cra_name, sizeof(calg->cra_name), "%s", mode->name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_skcipher.c: In function 'probe_ciphers':
   drivers/crypto/dwc-spacc/spacc_skcipher.c:535:25: warning: '%s' directive output may be truncated writing up to 5299 bytes into a region of size 122 [-Wformat-truncation=]
     535 |                  "spacc-%s", mode->name);
         |                         ^~
   In function 'spacc_init_calg',
       inlined from 'spacc_register_cipher' at drivers/crypto/dwc-spacc/spacc_skcipher.c:549:2,
       inlined from 'probe_ciphers' at drivers/crypto/dwc-spacc/spacc_skcipher.c:596:11:
   drivers/crypto/dwc-spacc/spacc_skcipher.c:534:9: note: 'snprintf' output between 7 and 5306 bytes into a destination of size 128
     534 |         snprintf(calg->cra_driver_name, sizeof(calg->cra_driver_name),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     535 |                  "spacc-%s", mode->name);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/crypto/dwc-spacc/spacc_core.c:1113:5: warning: no previous prototype for 'spacc_sgs_to_ddt' [-Wmissing-prototypes]
    1113 | int spacc_sgs_to_ddt(struct device *dev,
         |     ^~~~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_core.c:1179:5: warning: no previous prototype for 'modify_scatterlist' [-Wmissing-prototypes]
    1179 | int modify_scatterlist(struct scatterlist *src, struct scatterlist *dst,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_core.c:1215:5: warning: no previous prototype for 'spacc_sg_to_ddt' [-Wmissing-prototypes]
    1215 | int spacc_sg_to_ddt(struct device *dev, struct scatterlist *sg,
         |     ^~~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_core.c:2991:12: warning: 'spacc_load_skp' defined but not used [-Wunused-function]
    2991 | static int spacc_load_skp(struct spacc_device *spacc, uint32_t *key, int keysz,
         |            ^~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_core.c:2849:13: warning: 'spacc_set_secure_mode' defined but not used [-Wunused-function]
    2849 | static void spacc_set_secure_mode(struct spacc_device *spacc, int src, int dst,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_core.c:974:26: warning: 'names' defined but not used [-Wunused-const-variable=]
     974 | static const char *const names[] = {
         |                          ^~~~~
   In file included from <command-line>:
   In function 'spacc_sg_chain',
       inlined from 'fixup_sg' at drivers/crypto/dwc-spacc/spacc_core.c:1105:4,
       inlined from 'spacc_sgs_to_ddt' at drivers/crypto/dwc-spacc/spacc_core.c:1132:16:
>> include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_235' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_DEBUG_SG)
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:1072:9: note: in expansion of macro 'BUILD_BUG_ON'
    1072 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_DEBUG_SG));
         |         ^~~~~~~~~~~~
   In function 'spacc_sg_chain',
       inlined from 'fixup_sg' at drivers/crypto/dwc-spacc/spacc_core.c:1105:4,
       inlined from 'spacc_sg_to_ddt' at drivers/crypto/dwc-spacc/spacc_core.c:1222:15:
>> include/linux/compiler_types.h:425:45: error: call to '__compiletime_assert_235' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_DEBUG_SG)
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:406:25: note: in definition of macro '__compiletime_assert'
     406 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:425:9: note: in expansion of macro '_compiletime_assert'
     425 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_core.c:1072:9: note: in expansion of macro 'BUILD_BUG_ON'
    1072 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_DEBUG_SG));
         |         ^~~~~~~~~~~~
--
>> drivers/crypto/dwc-spacc/spacc_ahash.c:499:5: warning: no previous prototype for 'do_shash' [-Wmissing-prototypes]
     499 | int do_shash(unsigned char *name, unsigned char *result,
         |     ^~~~~~~~
   drivers/crypto/dwc-spacc/spacc_ahash.c: In function 'spacc_hash_final':
>> drivers/crypto/dwc-spacc/spacc_ahash.c:1007:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1007 |         int err;
         |             ^~~
   drivers/crypto/dwc-spacc/spacc_ahash.c: In function 'probe_hashes':
>> drivers/crypto/dwc-spacc/spacc_ahash.c:177:59: warning: '%s' directive output may be truncated writing up to 8479 bytes into a region of size 128 [-Wformat-truncation=]
     177 |         snprintf(calg->cra_name, sizeof(calg->cra_name), "%s", mode->name);
         |                                                           ^~
   In function 'spacc_init_calg',
       inlined from 'spacc_register_hash' at drivers/crypto/dwc-spacc/spacc_ahash.c:1164:2,
       inlined from 'probe_hashes' at drivers/crypto/dwc-spacc/spacc_ahash.c:1211:9:
   drivers/crypto/dwc-spacc/spacc_ahash.c:177:9: note: 'snprintf' output between 1 and 8480 bytes into a destination of size 128
     177 |         snprintf(calg->cra_name, sizeof(calg->cra_name), "%s", mode->name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/dwc-spacc/spacc_ahash.c: In function 'probe_hashes':
   drivers/crypto/dwc-spacc/spacc_ahash.c:179:25: warning: '%s' directive output may be truncated writing up to 8479 bytes into a region of size 122 [-Wformat-truncation=]
     179 |                  "spacc-%s", mode->name);
         |                         ^~
   In function 'spacc_init_calg',
       inlined from 'spacc_register_hash' at drivers/crypto/dwc-spacc/spacc_ahash.c:1164:2,
       inlined from 'probe_hashes' at drivers/crypto/dwc-spacc/spacc_ahash.c:1211:9:
   drivers/crypto/dwc-spacc/spacc_ahash.c:178:9: note: 'snprintf' output between 7 and 8486 bytes into a destination of size 128
     178 |         snprintf(calg->cra_driver_name, sizeof(calg->cra_driver_name),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     179 |                  "spacc-%s", mode->name);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/crypto/dwc-spacc/spacc_interrupt.c:188:6: warning: no previous prototype for 'spacc_disable_int' [-Wmissing-prototypes]
     188 | void spacc_disable_int (struct spacc_device *spacc)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/crypto/dwc-spacc/spacc_interrupt.c:194:13: warning: no previous prototype for 'spacc_irq_handler' [-Wmissing-prototypes]
     194 | irqreturn_t spacc_irq_handler(int irq, void *dev)
         |             ^~~~~~~~~~~~~~~~~
--
   drivers/crypto/dwc-spacc/spacc_hal.c: In function 'pdu_get_version':
>> drivers/crypto/dwc-spacc/spacc_hal.c:19:28: warning: variable 'ver' set but not used [-Wunused-but-set-variable]
      19 |         unsigned long tmp, ver;
         |                            ^~~
   drivers/crypto/dwc-spacc/spacc_hal.c: At top level:
>> drivers/crypto/dwc-spacc/spacc_hal.c:374:5: warning: no previous prototype for 'pdu_sg_to_ddt' [-Wmissing-prototypes]
     374 | int pdu_sg_to_ddt(struct scatterlist *sg, int sg_count, struct pdu_ddt *ddt)
         |     ^~~~~~~~~~~~~
--
   drivers/crypto/dwc-spacc/spacc_aead.c: In function 'spacc_aead_init_dma':
>> drivers/crypto/dwc-spacc/spacc_aead.c:256:31: warning: variable 'buf' set but not used [-Wunused-but-set-variable]
     256 |                         char *buf = sg_virt(req->src);
         |                               ^~~


vim +/__compiletime_assert_235 +425 include/linux/compiler_types.h

eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  411  
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  412  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  413  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  414  
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  415  /**
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  416   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  417   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  418   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  419   *
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  420   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  421   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  422   * compiler has support to do so.
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  423   */
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  424  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21 @425  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d5 Will Deacon 2020-07-21  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
