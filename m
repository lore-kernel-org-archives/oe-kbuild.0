Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B60747A
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678919294; x=1710455294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhsFmgZWW+ztrOBYVr6fnvCwVjD3IxN6CbhICvIl74w=;
  b=NASzEghhz+V1313I7V11i6w9zvqQToj+k2kSr142YpAMpadCpkCZ8uA+
   kxWRD4iTqiYHfsalk61PSE58fx4hcIvqwT1UTHySbz1qfEFbAzy5u2KV+
   33yQ1HFIEPlk/b1t6bR+6V8XVj4DWBM4vuPzi5hcQj9JABwjZNpO7U9sg
   ZIfUZlc/slTmEukhkkNoIDalaZzdRiD5c2HYQnMmWRVOrt5VjN+V6xivR
   /oqKdVXtdIBLN2rZ5S/xyPiQyMzSUvsNsL3fP3/Q980BIrN0JZ/VMD2Os
   qZz9XT9jfk1GEnV1Pyjc9I+OBkyHVS/ScwByqVZ80YJnl256KO37GvBft
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321675473"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="321675473"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 15:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="712103179"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="712103179"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Mar 2023 15:28:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcZbO-00085A-03;
	Wed, 15 Mar 2023 22:28:10 +0000
Date: Thu, 16 Mar 2023 06:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2396/3406] crypto/ahash.c:311:26: warning: Value
 stored to 'alg' during its initialization is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303160606.kTRUyGGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/ahash.c:311:26: warning: Value stored to 'alg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   225b6b81afe63b3850b7cee0a3590f51144f2a75
commit: 0e4e6d7094df9ec839c7d3163911ce1ff06e11b5 [2396/3406] crypto: hash - Count error stats differently
:::::: branch date: 20 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20230310 (https://download.01.org/0day-ci/archive/20230316/202303160606.kTRUyGGE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0e4e6d7094df9ec839c7d3163911ce1ff06e11b5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0e4e6d7094df9ec839c7d3163911ce1ff06e11b5
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303160606.kTRUyGGE-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   fs/fuse/virtio_fs.c:692:2: note:  Execution continues on line 692
           virtio_cread_le(vdev, struct virtio_fs_config, num_request_queues,
           ^
   include/linux/virtio_config.h:472:4: note: expanded from macro 'virtio_cread_le'
                           break;                                          \
                           ^
   fs/fuse/virtio_fs.c:692:2: note: Loop condition is false.  Exiting loop
           virtio_cread_le(vdev, struct virtio_fs_config, num_request_queues,
           ^
   include/linux/virtio_config.h:457:2: note: expanded from macro 'virtio_cread_le'
           do {                                                            \
           ^
   fs/fuse/virtio_fs.c:694:6: note: Assuming field 'num_request_queues' is not equal to 0
           if (fs->num_request_queues == 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/virtio_fs.c:694:2: note: Taking false branch
           if (fs->num_request_queues == 0)
           ^
   fs/fuse/virtio_fs.c:699:6: note: Assuming field 'vqs' is non-null
           if (!fs->vqs)
               ^~~~~~~~
   fs/fuse/virtio_fs.c:699:2: note: Taking false branch
           if (!fs->vqs)
           ^
   fs/fuse/virtio_fs.c:706:6: note: Assuming 'vqs' is non-null
           if (!vqs || !callbacks || !names) {
               ^~~~
   fs/fuse/virtio_fs.c:706:6: note: Left side of '||' is false
   fs/fuse/virtio_fs.c:706:14: note: Assuming 'callbacks' is non-null
           if (!vqs || !callbacks || !names) {
                       ^~~~~~~~~~
   fs/fuse/virtio_fs.c:706:6: note: Left side of '||' is false
           if (!vqs || !callbacks || !names) {
               ^
   fs/fuse/virtio_fs.c:706:28: note: Assuming 'names' is non-null
           if (!vqs || !callbacks || !names) {
                                     ^~~~~~
   fs/fuse/virtio_fs.c:706:2: note: Taking false branch
           if (!vqs || !callbacks || !names) {
           ^
   fs/fuse/virtio_fs.c:717:23: note: Assuming 'i' is >= field 'nvqs'
           for (i = VQ_REQUEST; i < fs->nvqs; i++) {
                                ^~~~~~~~~~~~
   fs/fuse/virtio_fs.c:717:2: note: Loop condition is false. Execution continues on line 726
           for (i = VQ_REQUEST; i < fs->nvqs; i++) {
           ^
   fs/fuse/virtio_fs.c:727:6: note: Assuming 'ret' is >= 0
           if (ret < 0)
               ^~~~~~~
   fs/fuse/virtio_fs.c:727:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/fuse/virtio_fs.c:730:2: note: Loop condition is false. Execution continues on line 733
           for (i = 0; i < fs->nvqs; i++)
           ^
   fs/fuse/virtio_fs.c:738:6: note: Assuming 'ret' is not equal to 0
           if (ret)
               ^~~
   fs/fuse/virtio_fs.c:738:2: note: Taking true branch
           if (ret)
           ^
   fs/fuse/virtio_fs.c:739:3: note: Memory is released
                   kfree(fs->vqs);
                   ^~~~~~~~~~~~~~
   fs/fuse/virtio_fs.c:874:8: note: Returning; memory was released
           ret = virtio_fs_setup_vqs(vdev, fs);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/virtio_fs.c:875:6: note: 'ret' is >= 0
           if (ret < 0)
               ^~~
   fs/fuse/virtio_fs.c:875:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/fuse/virtio_fs.c:881:6: note: 'ret' is >= 0
           if (ret < 0)
               ^~~
   fs/fuse/virtio_fs.c:881:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/fuse/virtio_fs.c:890:6: note: 'ret' is < 0
           if (ret < 0)
               ^~~
   fs/fuse/virtio_fs.c:890:2: note: Taking true branch
           if (ret < 0)
           ^
   fs/fuse/virtio_fs.c:891:3: note: Control jumps to line 896
                   goto out_vqs;
                   ^
   fs/fuse/virtio_fs.c:898:2: note: Attempt to free released memory
           kfree(fs->vqs);
           ^~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   9 warnings generated.
>> crypto/ahash.c:311:26: warning: Value stored to 'alg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
>> crypto/shash.c:573:28: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_hash *istat = hash_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   crypto/shash.c:573:28: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_hash *istat = hash_get_stat(alg);
                                     ^~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   8 warnings generated.
   crypto/akcipher.c:135:32: warning: Value stored to 'istat' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   crypto/akcipher.c:135:32: note: Value stored to 'istat' during its initialization is never read
           struct crypto_istat_akcipher *istat = akcipher_get_stat(alg);
                                         ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   crypto/dh.c:467:6: note: Assuming 'buffer' is null
           if (buffer) {
               ^~~~~~
   crypto/dh.c:467:2: note: Taking false branch
           if (buffer) {
           ^
   crypto/dh.c:480:14: note: Field 'key_size' is 0
           if (!params.key_size) {
                       ^
   crypto/dh.c:480:2: note: Taking true branch
           if (!params.key_size) {
           ^
   crypto/dh.c:481:9: note: Calling 'dh_safe_prime_gen_privkey'
                   key = dh_safe_prime_gen_privkey(inst_ctx->safe_prime,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/dh.c:373:6: note: '?' condition is false
           n = roundup_pow_of_two(2 * safe_prime->max_strength);
               ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_two'
           __builtin_constant_p(n) ? (             \
           ^
   crypto/dh.c:373:6: note: Calling '__roundup_pow_of_two'
           n = roundup_pow_of_two(2 * safe_prime->max_strength);
               ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_two'
           __roundup_pow_of_two(n)                 \
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

vim +/alg +311 crypto/ahash.c

66f6ce5e52f2f2 Herbert Xu     2009-07-15  307  
66f6ce5e52f2f2 Herbert Xu     2009-07-15  308  int crypto_ahash_final(struct ahash_request *req)
66f6ce5e52f2f2 Herbert Xu     2009-07-15  309  {
f7d76e05d058b8 Corentin Labbe 2018-11-29  310  	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
0e4e6d7094df9e Herbert Xu     2023-02-16 @311  	struct hash_alg_common *alg = crypto_hash_alg_common(tfm);
cac5818c25d042 Corentin Labbe 2018-09-19  312  
0e4e6d7094df9e Herbert Xu     2023-02-16  313  	if (IS_ENABLED(CONFIG_CRYPTO_STATS))
0e4e6d7094df9e Herbert Xu     2023-02-16  314  		atomic64_inc(&hash_get_stat(alg)->hash_cnt);
0e4e6d7094df9e Herbert Xu     2023-02-16  315  
0e4e6d7094df9e Herbert Xu     2023-02-16  316  	return crypto_ahash_op(req, tfm->final, true);
66f6ce5e52f2f2 Herbert Xu     2009-07-15  317  }
66f6ce5e52f2f2 Herbert Xu     2009-07-15  318  EXPORT_SYMBOL_GPL(crypto_ahash_final);
66f6ce5e52f2f2 Herbert Xu     2009-07-15  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
