Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4486A938
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 19:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678996484; x=1710532484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YAkNkLYoyt5Ido7q9ojfpzyNZ5LXIQdGvsFtssH6smc=;
  b=ScV2/Gze3kZV26F4hr8Ulg2PEEbaP0FUeK1TMxQsu5tdWWROpK7T3vxD
   ZoxPLQQLtbeCpK3xqsrxUN6JRkahq0n+muKIDIhEchEp+9MQi/RDn4X1x
   DZHNB4o2lYRoWPCDr2NLKfkt8E0k1t1cwYJijkWu0ZquhtYfBUwdwiq5d
   IFb5ijELuZJb15zDJgyn6zX6mfAaJfagIiEJc/pG3LDOidOzDsyWJSgR/
   PQqHR70Tm5CQePBivfHKt2+6GFfk0vecPFcrfoWjGK5Ce5/z/0NOtcvac
   dY/N4k8CrG+8Qo0JIikmhvL7SE+ou/LOwkIcTcd0miGkuWmd37XKGsqnU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338115100"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="338115100"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 12:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712486989"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="712486989"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Mar 2023 12:54:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pctgP-0008mM-2K;
	Thu, 16 Mar 2023 19:54:41 +0000
Date: Fri, 17 Mar 2023 03:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2398/3406] crypto/kpp.c:138:27: warning: Value
 stored to 'istat' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303170323.AqCy8nuC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/kpp.c:138:27: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: 095e590696f03ae9f458ace4ad32b6cbaea16d00 [2398/3406] crypto: kpp - Count error stats differently
:::::: branch date: 18 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170323.AqCy8nuC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=095e590696f03ae9f458ace4ad32b6cbaea16d00
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 095e590696f03ae9f458ace4ad32b6cbaea16d00
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303170323.AqCy8nuC-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   lib/assoc_array.c:97:3: warning: Value stored to 'cursor' is never read [clang-analyzer-deadcode.DeadStores]
                   cursor = parent;
                   ^        ~~~~~~
   lib/assoc_array.c:97:3: note: Value stored to 'cursor' is never read
                   cursor = parent;
                   ^        ~~~~~~
   lib/assoc_array.c:409:3: warning: Value stored to 'cursor' is never read [clang-analyzer-deadcode.DeadStores]
                   cursor = parent;
                   ^        ~~~~~~
   lib/assoc_array.c:409:3: note: Value stored to 'cursor' is never read
                   cursor = parent;
                   ^        ~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (3 in non-user code, 2 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   20 warnings generated.
   crypto/ahash.c:311:26: warning: Value stored to 'alg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
                                   ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ahash.c:311:26: note: Value stored to 'alg' during its initialization is never read
           struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
                                   ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ahash.c:323:26: warning: Value stored to 'alg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
                                   ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ahash.c:323:26: note: Value stored to 'alg' during its initialization is never read
           struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
                                   ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   crypto/shash.c:573:28: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_hash *istat = hash_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   crypto/shash.c:573:28: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_hash *istat = hash_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   crypto/akcipher.c:135:32: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   crypto/akcipher.c:135:32: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
>> crypto/kpp.c:138:27: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_kpp *istat = kpp_get_stat(alg);
                                    ^~~~~   ~~~~~~~~~~~~~~~~~
   crypto/kpp.c:138:27: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_kpp *istat = kpp_get_stat(alg);
                                    ^~~~~   ~~~~~~~~~~~~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   Suppressed 19 warnings (18 in non-user code, 1 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   19 warnings generated.
   arch/arm/mach-omap2/omap-wakeupgen.c:99:14: warning: Although the value stored to 'irq' is used in the enclosing expression, the value is never actually read from 'irq' [clang-analyzer-deadcode.DeadStores]
           *bit_posn = irq %= 32;
                       ^      ~~
   arch/arm/mach-omap2/omap-wakeupgen.c:99:14: note: Although the value stored to 'irq' is used in the enclosing expression, the value is never actually read from 'irq'
           *bit_posn = irq %= 32;
                       ^      ~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   4 warnings generated.
   crypto/asymmetric_keys/verify_pefile.c:113:14: warning: Although the value stored to 'secs' is used in the enclosing expression, the value is never actually read from 'secs' [clang-analyzer-deadcode.DeadStores]
           ctx->secs = secs = pebuf + cursor;
                       ^      ~~~~~~~~~~~~~~
   crypto/asymmetric_keys/verify_pefile.c:113:14: note: Although the value stored to 'secs' is used in the enclosing expression, the value is never actually read from 'secs'
           ctx->secs = secs = pebuf + cursor;
                       ^      ~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

vim +/istat +138 crypto/kpp.c

9e2f284e149124 Hannes Reinecke     2022-06-27  135  
4e5f2c400765e3 Salvatore Benedetto 2016-06-22  136  static void kpp_prepare_alg(struct kpp_alg *alg)
4e5f2c400765e3 Salvatore Benedetto 2016-06-22  137  {
095e590696f03a Herbert Xu          2023-02-16 @138  	struct crypto_istat_kpp *istat = kpp_get_stat(alg);
4e5f2c400765e3 Salvatore Benedetto 2016-06-22  139  	struct crypto_alg *base = &alg->base;
4e5f2c400765e3 Salvatore Benedetto 2016-06-22  140  
4e5f2c400765e3 Salvatore Benedetto 2016-06-22  141  	base->cra_type = &crypto_kpp_type;
4e5f2c400765e3 Salvatore Benedetto 2016-06-22  142  	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
4e5f2c400765e3 Salvatore Benedetto 2016-06-22  143  	base->cra_flags |= CRYPTO_ALG_TYPE_KPP;
095e590696f03a Herbert Xu          2023-02-16  144  
095e590696f03a Herbert Xu          2023-02-16  145  	if (IS_ENABLED(CONFIG_CRYPTO_STATS))
095e590696f03a Herbert Xu          2023-02-16  146  		memset(istat, 0, sizeof(*istat));
4e5f2c400765e3 Salvatore Benedetto 2016-06-22  147  }
4e5f2c400765e3 Salvatore Benedetto 2016-06-22  148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
