Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01E2EA6
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 05:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676872746; x=1708408746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oui29XYuu6NpUe1ni3jxvLxDPXUPu4sH8jCfDoqfQz4=;
  b=CniEtoiN4bgL8riz0+f0SJZ4eNPyLDX+AP6rc2y6kVZzJCvJl9QNCuHo
   fqhvhJkbE6qRLa+Uy1gnCWLf1jItM3HYOoaiH29jV/caL0WvU+9Mvys6A
   lhmp6jx6kbcgs3IINnHK1oyvK7o7sNYRnR4WAK5gNZo+FIKd8Cg03zPi+
   o1+9kkA3up7aANGgRI0uOx/boLyDd+mbHYTQ4WkJhYz6ij9WFuCGe87Sg
   seXh3MgX6mVKebbSEGgsxHF66jnERTsuv4IhZpT8RKbdLBZMobrhhPYpE
   0qqrw7qPg+QfdMTivyaYvwomUV/j1uX7qVhGOS9iX8QuyRUEkPhS3pods
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="330994287"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="330994287"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 21:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="701561816"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="701561816"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Feb 2023 21:59:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTzCa-000DiZ-00;
	Mon, 20 Feb 2023 05:59:04 +0000
Date: Mon, 20 Feb 2023 13:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13057/13499] drivers/virtio/virtio_ring.c:1571:6:
 warning: Branch condition evaluates to a garbage value
 [clang-analyzer-core.uninitialized.Branch]
Message-ID: <202302201335.YnKrytTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/virtio/virtio_ring.c:1571:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c068f40300a0eaa34f7105d137a5560b86951aa9
commit: efeb783859e8c60f1f6e0283842cc5dc5fe23083 [13057/13499] virtio_ring: packed: refactor virtqueue_add_packed() for premapped
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-c004-20230217 (https://download.01.org/0day-ci/archive/20230220/202302201335.YnKrytTJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=efeb783859e8c60f1f6e0283842cc5dc5fe23083
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout efeb783859e8c60f1f6e0283842cc5dc5fe23083
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302201335.YnKrytTJ-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_ring.c:1518:6: note: 'i' is >= 'head'
           if (i < head)
               ^
   drivers/virtio/virtio_ring.c:1518:2: note: Taking false branch
           if (i < head)
           ^
   drivers/virtio/virtio_ring.c:1530:33: note: Assigned value is garbage or undefined
           vq->packed.desc_state[id].last = prev;
                                          ^ ~~~~
   drivers/virtio/virtio_ring.c:1538:36: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           vq->packed.vring.desc[head].flags = head_flags;
                                             ^
   drivers/virtio/virtio_ring.c:2306:9: note: Calling 'virtqueue_add'
           return virtqueue_add(vq, &sg, num, 0, 1, data, ctx, gfp);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:2201:9: note: Assuming field 'packed_ring' is true
           return vq->packed_ring ? virtqueue_add_packed(_vq, sgs, total_sg,
                  ^~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:2201:9: note: '?' condition is true
   drivers/virtio/virtio_ring.c:2201:27: note: Calling 'virtqueue_add_packed'
           return vq->packed_ring ? virtqueue_add_packed(_vq, sgs, total_sg,
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1562:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/virtio/virtio_ring.c:1562:2: note: Taking false branch
           if (err)
           ^
   drivers/virtio/virtio_ring.c:1566:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/virtio/virtio_ring.c:1566:2: note: Taking false branch
           if (err)
           ^
   drivers/virtio/virtio_ring.c:1571:6: note: 'desc' is null
           if (desc) {
               ^~~~
   drivers/virtio/virtio_ring.c:1571:2: note: Taking false branch
           if (desc) {
           ^
   drivers/virtio/virtio_ring.c:1576:3: note: Calling 'virtqueue_add_packed_vring'
                   virtqueue_add_packed_vring(vq, sgs, total_sg, out_sgs, in_sgs);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1473:9: note: 'head_flags' declared without an initial value
           __le16 head_flags, flags;
                  ^~~~~~~~~~
   drivers/virtio/virtio_ring.c:1482:9: note: Assuming 'id' is not equal to field 'num'
           BUG_ON(id == vq->packed.vring.num);
                  ^
   include/asm-generic/bug.h:162:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   drivers/virtio/virtio_ring.c:1482:9: note: 'id' is not equal to field 'num'
           BUG_ON(id == vq->packed.vring.num);
                  ^
   include/asm-generic/bug.h:162:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1482:2: note: Taking false branch
           BUG_ON(id == vq->packed.vring.num);
           ^
   include/asm-generic/bug.h:162:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   drivers/virtio/virtio_ring.c:1482:2: note: Loop condition is false.  Exiting loop
           BUG_ON(id == vq->packed.vring.num);
           ^
   include/asm-generic/bug.h:162:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   drivers/virtio/virtio_ring.c:1486:2: note: Loop condition is true.  Entering loop body
           for (n = 0; n < out_sgs + in_sgs; n++) {
           ^
   drivers/virtio/virtio_ring.c:1487:3: note: Loop condition is false. Execution continues on line 1486
                   for (sg = sgs[n]; sg; sg = sg_next(sg)) {
                   ^
   drivers/virtio/virtio_ring.c:1486:2: note: Loop condition is false. Execution continues on line 1518
           for (n = 0; n < out_sgs + in_sgs; n++) {
           ^
   drivers/virtio/virtio_ring.c:1518:6: note: 'i' is >= 'head'
           if (i < head)
               ^
   drivers/virtio/virtio_ring.c:1518:2: note: Taking false branch
           if (i < head)
           ^
   drivers/virtio/virtio_ring.c:1538:36: note: Assigned value is garbage or undefined
           vq->packed.vring.desc[head].flags = head_flags;
                                             ^ ~~~~~~~~~~
>> drivers/virtio/virtio_ring.c:1571:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (desc) {
               ^
   drivers/virtio/virtio_ring.c:2306:9: note: Calling 'virtqueue_add'
           return virtqueue_add(vq, &sg, num, 0, 1, data, ctx, gfp);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:2201:9: note: Assuming field 'packed_ring' is true
           return vq->packed_ring ? virtqueue_add_packed(_vq, sgs, total_sg,
                  ^~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:2201:9: note: '?' condition is true
   drivers/virtio/virtio_ring.c:2201:27: note: Calling 'virtqueue_add_packed'
           return vq->packed_ring ? virtqueue_add_packed(_vq, sgs, total_sg,
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1554:2: note: 'desc' declared without an initial value
           struct vring_packed_desc *desc;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1561:8: note: Calling 'virtqueue_add_packed_prepare'
           err = virtqueue_add_packed_prepare(vq, total_sg, data, ctx, &desc, gfp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1421:9: note: Assuming 'data' is not equal to null
           BUG_ON(data == NULL);
                  ^
   include/asm-generic/bug.h:162:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   drivers/virtio/virtio_ring.c:1421:9: note: 'data' is not equal to null
           BUG_ON(data == NULL);
                  ^
   include/asm-generic/bug.h:162:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1421:2: note: Taking false branch
           BUG_ON(data == NULL);
           ^
   include/asm-generic/bug.h:162:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   drivers/virtio/virtio_ring.c:1421:2: note: Loop condition is false.  Exiting loop
           BUG_ON(data == NULL);
           ^
   include/asm-generic/bug.h:162:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   drivers/virtio/virtio_ring.c:1422:9: note: Assuming 'ctx' is null
           BUG_ON(ctx && vq->indirect);
                  ^
   include/asm-generic/bug.h:162:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   drivers/virtio/virtio_ring.c:1422:13: note: Left side of '&&' is false
           BUG_ON(ctx && vq->indirect);
                      ^
   drivers/virtio/virtio_ring.c:1422:9: note: 'ctx' is null
           BUG_ON(ctx && vq->indirect);
                  ^
   include/asm-generic/bug.h:162:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1422:13: note: Left side of '&&' is false
           BUG_ON(ctx && vq->indirect);
                      ^
   drivers/virtio/virtio_ring.c:1422:2: note: Taking false branch
           BUG_ON(ctx && vq->indirect);
           ^
   include/asm-generic/bug.h:162:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                  ^
   drivers/virtio/virtio_ring.c:1422:2: note: Loop condition is false.  Exiting loop
           BUG_ON(ctx && vq->indirect);
           ^
   include/asm-generic/bug.h:162:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                             ^
   drivers/virtio/virtio_ring.c:1424:6: note: Assuming field 'broken' is false
           if (unlikely(vq->broken)) {
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'

vim +1571 drivers/virtio/virtio_ring.c

efeb783859e8c6 Xuan Zhuo  2023-02-14  1463  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1464  static void virtqueue_add_packed_vring(struct vring_virtqueue *vq,
efeb783859e8c6 Xuan Zhuo  2023-02-14  1465  				       struct scatterlist *sgs[],
efeb783859e8c6 Xuan Zhuo  2023-02-14  1466  				       unsigned int total_sg,
efeb783859e8c6 Xuan Zhuo  2023-02-14  1467  				       unsigned int out_sgs,
efeb783859e8c6 Xuan Zhuo  2023-02-14  1468  				       unsigned int in_sgs)
efeb783859e8c6 Xuan Zhuo  2023-02-14  1469  {
efeb783859e8c6 Xuan Zhuo  2023-02-14  1470  	struct vring_packed_desc *desc;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1471  	struct scatterlist *sg;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1472  	unsigned int i, n, c, descs_used;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1473  	__le16 head_flags, flags;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1474  	u16 head, id, prev, curr;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1475  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1476  	desc = vq->packed.vring.desc;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1477  	head = vq->packed.next_avail_idx;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1478  	i = head;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1479  	descs_used = total_sg;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1480  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1481  	id = vq->free_head;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1482  	BUG_ON(id == vq->packed.vring.num);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1483  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1484  	curr = id;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1485  	c = 0;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1486  	for (n = 0; n < out_sgs + in_sgs; n++) {
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1487  		for (sg = sgs[n]; sg; sg = sg_next(sg)) {
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1488  			flags = cpu_to_le16(vq->packed.avail_used_flags |
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1489  				    (++c == total_sg ? 0 : VRING_DESC_F_NEXT) |
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1490  				    (n < out_sgs ? 0 : VRING_DESC_F_WRITE));
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1491  			if (i == head)
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1492  				head_flags = flags;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1493  			else
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1494  				desc[i].flags = flags;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1495  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1496  			desc[i].addr = cpu_to_le64(sg->dma_address);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1497  			desc[i].len = cpu_to_le32(sg->length);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1498  			desc[i].id = cpu_to_le16(id);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1499  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1500  			if (unlikely(vq->use_dma_api)) {
efeb783859e8c6 Xuan Zhuo  2023-02-14  1501  				vq->packed.desc_extra[curr].addr = sg->dma_address;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1502  				vq->packed.desc_extra[curr].len = sg->length;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1503  				vq->packed.desc_extra[curr].flags =
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1504  					le16_to_cpu(flags);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1505  			}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1506  			prev = curr;
aeef9b4733c5c2 Jason Wang 2021-06-04  1507  			curr = vq->packed.desc_extra[curr].next;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1508  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1509  			if ((unlikely(++i >= vq->packed.vring.num))) {
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1510  				i = 0;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1511  				vq->packed.avail_used_flags ^=
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1512  					1 << VRING_PACKED_DESC_F_AVAIL |
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1513  					1 << VRING_PACKED_DESC_F_USED;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1514  			}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1515  		}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1516  	}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1517  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21 @1518  	if (i < head)
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1519  		vq->packed.avail_wrap_counter ^= 1;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1520  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1521  	/* We're using some buffers from the free list. */
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1522  	vq->vq.num_free -= descs_used;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1523  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1524  	/* Update free pointer */
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1525  	vq->packed.next_avail_idx = i;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1526  	vq->free_head = curr;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1527  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1528  	/* Store token. */
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1529  	vq->packed.desc_state[id].num = descs_used;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1530  	vq->packed.desc_state[id].last = prev;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1531  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1532  	/*
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1533  	 * A driver MUST NOT make the first descriptor in the list
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1534  	 * available before all subsequent descriptors comprising
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1535  	 * the list are made available.
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1536  	 */
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1537  	virtio_wmb(vq->weak_barriers);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1538  	vq->packed.vring.desc[head].flags = head_flags;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1539  	vq->num_added += descs_used;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1540  
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1541  	pr_debug("Added buffer head %i to %p\n", head, vq);
efeb783859e8c6 Xuan Zhuo  2023-02-14  1542  }
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1543  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1544  static inline int virtqueue_add_packed(struct virtqueue *_vq,
efeb783859e8c6 Xuan Zhuo  2023-02-14  1545  				       struct scatterlist *sgs[],
efeb783859e8c6 Xuan Zhuo  2023-02-14  1546  				       unsigned int total_sg,
efeb783859e8c6 Xuan Zhuo  2023-02-14  1547  				       unsigned int out_sgs,
efeb783859e8c6 Xuan Zhuo  2023-02-14  1548  				       unsigned int in_sgs,
efeb783859e8c6 Xuan Zhuo  2023-02-14  1549  				       void *data,
efeb783859e8c6 Xuan Zhuo  2023-02-14  1550  				       void *ctx,
efeb783859e8c6 Xuan Zhuo  2023-02-14  1551  				       gfp_t gfp)
efeb783859e8c6 Xuan Zhuo  2023-02-14  1552  {
efeb783859e8c6 Xuan Zhuo  2023-02-14  1553  	struct vring_virtqueue *vq = to_vvq(_vq);
efeb783859e8c6 Xuan Zhuo  2023-02-14  1554  	struct vring_packed_desc *desc;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1555  	u16 id;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1556  	int err;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1557  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1558  	START_USE(vq);
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1559  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1560  	/* check vq state and try to alloc desc for indirect. */
efeb783859e8c6 Xuan Zhuo  2023-02-14  1561  	err = virtqueue_add_packed_prepare(vq, total_sg, data, ctx, &desc, gfp);
efeb783859e8c6 Xuan Zhuo  2023-02-14  1562  	if (err)
efeb783859e8c6 Xuan Zhuo  2023-02-14  1563  		goto end;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1564  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1565  	err = virtqueue_map_sgs(vq, sgs, total_sg, out_sgs, in_sgs);
efeb783859e8c6 Xuan Zhuo  2023-02-14  1566  	if (err)
efeb783859e8c6 Xuan Zhuo  2023-02-14  1567  		goto err;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1568  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1569  	id = vq->free_head;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1570  
efeb783859e8c6 Xuan Zhuo  2023-02-14 @1571  	if (desc) {
efeb783859e8c6 Xuan Zhuo  2023-02-14  1572  		err = virtqueue_add_indirect_packed(vq, sgs, total_sg, out_sgs, in_sgs, desc);
efeb783859e8c6 Xuan Zhuo  2023-02-14  1573  		if (err)
efeb783859e8c6 Xuan Zhuo  2023-02-14  1574  			goto err;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1575  	} else {
efeb783859e8c6 Xuan Zhuo  2023-02-14  1576  		virtqueue_add_packed_vring(vq, sgs, total_sg, out_sgs, in_sgs);
efeb783859e8c6 Xuan Zhuo  2023-02-14  1577  		vq->packed.desc_state[id].indir_desc = ctx;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1578  	}
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1579  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1580  	vq->packed.desc_state[id].data = data;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1581  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1582  	goto end;
efeb783859e8c6 Xuan Zhuo  2023-02-14  1583  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1584  err:
efeb783859e8c6 Xuan Zhuo  2023-02-14  1585  	virtqueue_unmap_sgs(vq, sgs, total_sg, out_sgs, in_sgs);
efeb783859e8c6 Xuan Zhuo  2023-02-14  1586  	kfree(desc);
efeb783859e8c6 Xuan Zhuo  2023-02-14  1587  
efeb783859e8c6 Xuan Zhuo  2023-02-14  1588  end:
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1589  	END_USE(vq);
efeb783859e8c6 Xuan Zhuo  2023-02-14  1590  	return err;
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1591  }
1ce9e6055fa0a9 Tiwei Bie  2018-11-21  1592  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
