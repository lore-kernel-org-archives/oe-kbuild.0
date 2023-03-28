Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A07E6
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Mar 2023 01:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679966027; x=1711502027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UEsZJOHtkBbwtcpQI3+4xHqqQAlZ9rgjIi2Z2QjpyoM=;
  b=XlFs+b/yL586eflsgVg9VfM59BGxDv3o4V4jOto9WPJrJqKsAL0OPHVN
   ajOni0yUeK48mkIbLE/44l8kWzrqEGDrCzpkG+DzIjKsc7kcLitj4aO+y
   qjGxZDUrk1KxUqx4/xKlEm4ps92GT+/QXesjc81oFM4HU3NXlqTi6920T
   HizP1NhFmcnFdKrpfnsTVIct8vQS3qzvmM/UAU8vbuLs6lqLBPErSzXpc
   I76X1IvJDEgQ2TADTgUW2rL3yOa9T33aD+X1SgtYjemOg7vqL21UNFNrv
   ic3aaUulH8mWWcjy0a3/pal7QO5t4p0YwIVRjmzQ+3BvrikKtth0ljh3Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324322630"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="324322630"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 18:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="752927638"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="752927638"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Mar 2023 18:13:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgxu7-000I8j-2y;
	Tue, 28 Mar 2023 01:13:39 +0000
Date: Tue, 28 Mar 2023 09:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5258/7305] drivers/virtio/virtio_ring.c:2784:3:
 warning: Value stored to 'err' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <202303280916.WwCImqoA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/virtio/virtio_ring.c:2784:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   011eb7443621f49ca1e8cdf9c74c215f25019118
commit: 22fd569675a4158b3d5a6e1f872aa87ae3ecd06b [5258/7305] virtio_ring: separate the logic of reset/enable from virtqueue_resize
:::::: branch date: 24 hours ago
:::::: commit date: 6 days ago
config: riscv-randconfig-c006-20230326 (https://download.01.org/0day-ci/archive/20230328/202303280916.WwCImqoA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=22fd569675a4158b3d5a6e1f872aa87ae3ecd06b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 22fd569675a4158b3d5a6e1f872aa87ae3ecd06b
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303280916.WwCImqoA-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/virtio/virtio_ring.c:1460:2: note: Taking false branch
           if (unlikely(vq->broken)) {
           ^
   drivers/virtio/virtio_ring.c:1467:9: note: Assuming 'total_sg' is not equal to 0
           BUG_ON(total_sg == 0);
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/virtio/virtio_ring.c:1467:2: note: Taking false branch
           BUG_ON(total_sg == 0);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   drivers/virtio/virtio_ring.c:1467:2: note: Loop condition is false.  Exiting loop
           BUG_ON(total_sg == 0);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   drivers/virtio/virtio_ring.c:1469:2: note: Taking false branch
           if (virtqueue_use_indirect(vq, total_sg)) {
           ^
   drivers/virtio/virtio_ring.c:1482:15: note: Assuming 'total_sg' is <= field 'num'
           WARN_ON_ONCE(total_sg > vq->packed.vring.num && !vq->indirect);
                        ^
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   drivers/virtio/virtio_ring.c:1482:47: note: Left side of '&&' is false
           WARN_ON_ONCE(total_sg > vq->packed.vring.num && !vq->indirect);
                                                        ^
   drivers/virtio/virtio_ring.c:1482:2: note: Taking false branch
           WARN_ON_ONCE(total_sg > vq->packed.vring.num && !vq->indirect);
           ^
   include/asm-generic/bug.h:111:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   drivers/virtio/virtio_ring.c:1488:15: note: Assuming 'descs_used' is <= field 'num_free'
           if (unlikely(vq->vq.num_free < descs_used)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/virtio/virtio_ring.c:1488:2: note: Taking false branch
           if (unlikely(vq->vq.num_free < descs_used)) {
           ^
   drivers/virtio/virtio_ring.c:1496:9: note: Assuming 'id' is not equal to field 'num'
           BUG_ON(id == vq->packed.vring.num);
                  ^
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/virtio/virtio_ring.c:1496:2: note: Taking false branch
           BUG_ON(id == vq->packed.vring.num);
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   drivers/virtio/virtio_ring.c:1496:2: note: Loop condition is false.  Exiting loop
           BUG_ON(id == vq->packed.vring.num);
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   drivers/virtio/virtio_ring.c:1498:14: note: Assuming field 'dma_address' is not equal to 0
           map_inter = !sgs[0]->dma_address;
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1499:6: note: 'map_inter' is false
           if (map_inter && virtqueue_map_sgs(vq, sgs, total_sg, out_sgs, in_sgs))
               ^~~~~~~~~
   drivers/virtio/virtio_ring.c:1499:16: note: Left side of '&&' is false
           if (map_inter && virtqueue_map_sgs(vq, sgs, total_sg, out_sgs, in_sgs))
                         ^
   drivers/virtio/virtio_ring.c:1504:14: note: Assuming the condition is false
           for (n = 0; n < out_sgs + in_sgs; n++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1504:2: note: Loop condition is false. Execution continues on line 1536
           for (n = 0; n < out_sgs + in_sgs; n++) {
           ^
   drivers/virtio/virtio_ring.c:1536:6: note: 'i' is >= 'head'
           if (i < head)
               ^
   drivers/virtio/virtio_ring.c:1536:2: note: Taking false branch
           if (i < head)
           ^
   drivers/virtio/virtio_ring.c:1559:36: note: Assigned value is garbage or undefined
           vq->packed.vring.desc[head].flags = head_flags;
                                             ^ ~~~~~~~~~~
>> drivers/virtio/virtio_ring.c:2784:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = virtqueue_resize_packed(_vq, num);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:2784:3: note: Value stored to 'err' is never read
                   err = virtqueue_resize_packed(_vq, num);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:2786:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err = virtqueue_resize_split(_vq, num);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:2786:3: note: Value stored to 'err' is never read
                   err = virtqueue_resize_split(_vq, num);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   lib/zstd/compress/../common/bitstream.h:190:34: warning: The right operand of '&' is a garbage value due to array index out of bounds [clang-analyzer-core.UndefinedBinaryOperatorResult]
       bitC->bitContainer |= (value & BIT_mask[nbBits]) << bitC->bitPos;
                                    ^
   lib/zstd/compress/zstd_compress_sequences.c:437:12: note: Calling 'ZSTD_encodeSequences_default'
       return ZSTD_encodeSequences_default(dst, dstCapacity,
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_sequences.c:392:12: note: Calling 'ZSTD_encodeSequences_body'
       return ZSTD_encodeSequences_body(dst, dstCapacity,
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_sequences.c:303:5: note: Taking false branch
       RETURN_ERROR_IF(
       ^
   lib/zstd/compress/../common/error_private.h:102:3: note: expanded from macro 'RETURN_ERROR_IF'
     if (cond) { \
     ^
   lib/zstd/compress/zstd_compress_sequences.c:315:5: note: Taking false branch
       if (MEM_32bits()) BIT_flushBits(&blockStream);
       ^
   lib/zstd/compress/zstd_compress_sequences.c:317:5: note: Taking false branch
       if (MEM_32bits()) BIT_flushBits(&blockStream);
       ^
   lib/zstd/compress/zstd_compress_sequences.c:318:9: note: Assuming 'longOffsets' is not equal to 0
       if (longOffsets) {
           ^~~~~~~~~~~
   lib/zstd/compress/zstd_compress_sequences.c:318:5: note: Taking true branch
       if (longOffsets) {
       ^
   lib/zstd/compress/zstd_compress_sequences.c:320:57: note: '?' condition is false
           unsigned const extraBits = ofBits - MIN(ofBits, STREAM_ACCUMULATOR_MIN-1);
                                                           ^
   lib/zstd/compress/../common/bitstream.h:38:42: note: expanded from macro 'STREAM_ACCUMULATOR_MIN'
   #define STREAM_ACCUMULATOR_MIN    ((U32)(MEM_32bits() ? STREAM_ACCUMULATOR_MIN_32 : STREAM_ACCUMULATOR_MIN_64))
                                            ^
   lib/zstd/compress/zstd_compress_sequences.c:320:45: note: Assuming the condition is false
           unsigned const extraBits = ofBits - MIN(ofBits, STREAM_ACCUMULATOR_MIN-1);
                                               ^
   lib/zstd/compress/../common/zstd_internal.h:49:19: note: expanded from macro 'MIN'
   #define MIN(a,b) ((a)<(b) ? (a) : (b))
                     ^~~~~~~
   lib/zstd/compress/zstd_compress_sequences.c:320:45: note: '?' condition is false
           unsigned const extraBits = ofBits - MIN(ofBits, STREAM_ACCUMULATOR_MIN-1);
                                               ^
   lib/zstd/compress/../common/zstd_internal.h:49:19: note: expanded from macro 'MIN'
   #define MIN(a,b) ((a)<(b) ? (a) : (b))
                     ^
   lib/zstd/compress/zstd_compress_sequences.c:320:57: note: '?' condition is false
           unsigned const extraBits = ofBits - MIN(ofBits, STREAM_ACCUMULATOR_MIN-1);
                                                           ^
   lib/zstd/compress/../common/bitstream.h:38:42: note: expanded from macro 'STREAM_ACCUMULATOR_MIN'
   #define STREAM_ACCUMULATOR_MIN    ((U32)(MEM_32bits() ? STREAM_ACCUMULATOR_MIN_32 : STREAM_ACCUMULATOR_MIN_64))
                                            ^
   lib/zstd/compress/zstd_compress_sequences.c:321:13: note: Assuming 'extraBits' is 0
           if (extraBits) {
               ^~~~~~~~~
   lib/zstd/compress/zstd_compress_sequences.c:321:9: note: Taking false branch
           if (extraBits) {
           ^
   lib/zstd/compress/zstd_compress_sequences.c:326:21: note: Passing the value 56 via 3rd parameter 'nbBits'
                       ofBits - extraBits);
                       ^~~~~~~~~~~~~~~~~~
   lib/zstd/compress/zstd_compress_sequences.c:325:9: note: Calling 'BIT_addBits'
           BIT_addBits(&blockStream, sequences[nbSeq-1].offBase >> extraBits,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/zstd/compress/../common/bitstream.h:190:34: note: The right operand of '&' is a garbage value due to array index out of bounds
       bitC->bitContainer |= (value & BIT_mask[nbBits]) << bitC->bitPos;
                                    ^ ~~~~~~~~~~~~~~~~
   10 warnings generated.
   fs/btrfs/extent-tree.c:2033:5: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret = 0;
                                   ^     ~
   fs/btrfs/extent-tree.c:2033:5: note: Value stored to 'ret' is never read
                                   ret = 0;

vim +/err +2784 drivers/virtio/virtio_ring.c

2713ea3c7d930a Jason Wang 2023-01-19  2739  
c790e8e1817f1a Xuan Zhuo  2022-08-01  2740  /**
c790e8e1817f1a Xuan Zhuo  2022-08-01  2741   * virtqueue_resize - resize the vring of vq
c790e8e1817f1a Xuan Zhuo  2022-08-01  2742   * @_vq: the struct virtqueue we're talking about.
c790e8e1817f1a Xuan Zhuo  2022-08-01  2743   * @num: new ring num
0f7a1c4e5d1f59 Xuan Zhuo  2023-03-21  2744   * @recycle: callback to recycle unused buffers
c790e8e1817f1a Xuan Zhuo  2022-08-01  2745   *
c790e8e1817f1a Xuan Zhuo  2022-08-01  2746   * When it is really necessary to create a new vring, it will set the current vq
c790e8e1817f1a Xuan Zhuo  2022-08-01  2747   * into the reset state. Then call the passed callback to recycle the buffer
c790e8e1817f1a Xuan Zhuo  2022-08-01  2748   * that is no longer used. Only after the new vring is successfully created, the
c790e8e1817f1a Xuan Zhuo  2022-08-01  2749   * old vring will be released.
c790e8e1817f1a Xuan Zhuo  2022-08-01  2750   *
c790e8e1817f1a Xuan Zhuo  2022-08-01  2751   * Caller must ensure we don't call this with other virtqueue operations
c790e8e1817f1a Xuan Zhuo  2022-08-01  2752   * at the same time (except where noted).
c790e8e1817f1a Xuan Zhuo  2022-08-01  2753   *
c790e8e1817f1a Xuan Zhuo  2022-08-01  2754   * Returns zero or a negative error.
c790e8e1817f1a Xuan Zhuo  2022-08-01  2755   * 0: success.
c790e8e1817f1a Xuan Zhuo  2022-08-01  2756   * -ENOMEM: Failed to allocate a new ring, fall back to the original ring size.
c790e8e1817f1a Xuan Zhuo  2022-08-01  2757   *  vq can still work normally
c790e8e1817f1a Xuan Zhuo  2022-08-01  2758   * -EBUSY: Failed to sync with device, vq may not work properly
c790e8e1817f1a Xuan Zhuo  2022-08-01  2759   * -ENOENT: Transport or device not supported
c790e8e1817f1a Xuan Zhuo  2022-08-01  2760   * -E2BIG/-EINVAL: num error
c790e8e1817f1a Xuan Zhuo  2022-08-01  2761   * -EPERM: Operation not permitted
c790e8e1817f1a Xuan Zhuo  2022-08-01  2762   *
c790e8e1817f1a Xuan Zhuo  2022-08-01  2763   */
c790e8e1817f1a Xuan Zhuo  2022-08-01  2764  int virtqueue_resize(struct virtqueue *_vq, u32 num,
c790e8e1817f1a Xuan Zhuo  2022-08-01  2765  		     void (*recycle)(struct virtqueue *vq, void *buf))
c790e8e1817f1a Xuan Zhuo  2022-08-01  2766  {
c790e8e1817f1a Xuan Zhuo  2022-08-01  2767  	struct vring_virtqueue *vq = to_vvq(_vq);
c790e8e1817f1a Xuan Zhuo  2022-08-01  2768  	int err;
c790e8e1817f1a Xuan Zhuo  2022-08-01  2769  
c790e8e1817f1a Xuan Zhuo  2022-08-01  2770  	if (num > vq->vq.num_max)
c790e8e1817f1a Xuan Zhuo  2022-08-01  2771  		return -E2BIG;
c790e8e1817f1a Xuan Zhuo  2022-08-01  2772  
c790e8e1817f1a Xuan Zhuo  2022-08-01  2773  	if (!num)
c790e8e1817f1a Xuan Zhuo  2022-08-01  2774  		return -EINVAL;
c790e8e1817f1a Xuan Zhuo  2022-08-01  2775  
c790e8e1817f1a Xuan Zhuo  2022-08-01  2776  	if ((vq->packed_ring ? vq->packed.vring.num : vq->split.vring.num) == num)
c790e8e1817f1a Xuan Zhuo  2022-08-01  2777  		return 0;
c790e8e1817f1a Xuan Zhuo  2022-08-01  2778  
22fd569675a415 Xuan Zhuo  2023-03-21  2779  	err = virtqueue_disable_and_recycle(_vq, recycle);
c790e8e1817f1a Xuan Zhuo  2022-08-01  2780  	if (err)
c790e8e1817f1a Xuan Zhuo  2022-08-01  2781  		return err;
c790e8e1817f1a Xuan Zhuo  2022-08-01  2782  
c790e8e1817f1a Xuan Zhuo  2022-08-01  2783  	if (vq->packed_ring)
c790e8e1817f1a Xuan Zhuo  2022-08-01 @2784  		err = virtqueue_resize_packed(_vq, num);
c790e8e1817f1a Xuan Zhuo  2022-08-01  2785  	else
c790e8e1817f1a Xuan Zhuo  2022-08-01  2786  		err = virtqueue_resize_split(_vq, num);
c790e8e1817f1a Xuan Zhuo  2022-08-01  2787  
22fd569675a415 Xuan Zhuo  2023-03-21  2788  	return virtqueue_enable_after_reset(_vq);
c790e8e1817f1a Xuan Zhuo  2022-08-01  2789  }
c790e8e1817f1a Xuan Zhuo  2022-08-01  2790  EXPORT_SYMBOL_GPL(virtqueue_resize);
c790e8e1817f1a Xuan Zhuo  2022-08-01  2791  

:::::: The code at line 2784 was first introduced by commit
:::::: c790e8e1817f1a17c05e64f1c4f16f231b8529d5 virtio_ring: introduce virtqueue_resize()

:::::: TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
