Content-Type: multipart/mixed; boundary="===============7704281708296776139=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2211/10704] drivers/net/ethernet/dlink/dl2k.c:974:18: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Wed, 05 Jan 2022 03:58:47 +0800
Message-ID: <202201050355.AEmjnqrl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7704281708296776139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6b8d4927540e416878113f0f7e273ddc939291f3
commit: 03f61041c17914355dde7261be9ccdc821ddd454 [2211/10704] skbuff: Switc=
h structure bounds to struct_group()
:::::: branch date: 9 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c007-20220102 (https://download.01.org/0day-ci/ar=
chive/20220105/202201050355.AEmjnqrl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c05440=
2170cd8466683a20385befc0523aba3359)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D03f61041c17914355dde7261be9ccdc821ddd454
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 03f61041c17914355dde7261be9ccdc821ddd454
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/gem/i915_gem_object.h:210:13: note: Left side of '&=
&' is false
           WARN_ON(ww && !ww->intr);
                      ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:210:2: note: Taking false bra=
nch
           WARN_ON(ww && !ww->intr);
           ^
   drivers/gpu/drm/i915/i915_utils.h:49:20: note: expanded from macro 'WARN=
_ON'
   #define WARN_ON(x) WARN((x), "%s", "WARN_ON(" __stringify(x) ")")
                      ^
   include/asm-generic/bug.h:131:2: note: expanded from macro 'WARN'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:211:37: note: Passing null po=
inter value via 2nd parameter 'ww'
           return __i915_gem_object_lock(obj, ww, true);
                                              ^~
   drivers/gpu/drm/i915/gem/i915_gem_object.h:211:9: note: Calling '__i915_=
gem_object_lock'
           return __i915_gem_object_lock(obj, ww, true);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_object.h:181:6: note: 'intr' is true
           if (intr)
               ^~~~
   drivers/gpu/drm/i915/gem/i915_gem_object.h:181:2: note: Taking true bran=
ch
           if (intr)
           ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:182:53: note: 'ww' is null
                   ret =3D dma_resv_lock_interruptible(obj->base.resv, ww ?=
 &ww->ctx : NULL);
                                                                     ^~
   drivers/gpu/drm/i915/gem/i915_gem_object.h:182:53: note: '?' condition i=
s false
   drivers/gpu/drm/i915/gem/i915_gem_object.h:186:6: note: Assuming 'ret' i=
s not equal to 0
           if (!ret && ww) {
               ^~~~
   drivers/gpu/drm/i915/gem/i915_gem_object.h:186:11: note: Left side of '&=
&' is false
           if (!ret && ww) {
                    ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:190:6: note: Assuming the con=
dition is false
           if (ret =3D=3D -EALREADY)
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_object.h:190:2: note: Taking false bra=
nch
           if (ret =3D=3D -EALREADY)
           ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:193:6: note: Assuming the con=
dition is true
           if (ret =3D=3D -EDEADLK) {
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_object.h:193:2: note: Taking true bran=
ch
           if (ret =3D=3D -EDEADLK) {
           ^
   drivers/gpu/drm/i915/gem/i915_gem_object.h:195:17: note: Access to field=
 'contended' results in a dereference of a null pointer (loaded from variab=
le 'ww')
                   ww->contended =3D obj;
                   ~~            ^
   drivers/gpu/drm/i915/gem/i915_gem_userptr.c:294:11: warning: Although th=
e value stored to 'ret' is used in the enclosing expression, the value is n=
ever actually read from 'ret' [clang-analyzer-deadcode.DeadStores]
           pinned =3D ret =3D 0;
                    ^     ~
   drivers/gpu/drm/i915/gem/i915_gem_userptr.c:294:11: note: Although the v=
alue stored to 'ret' is used in the enclosing expression, the value is neve=
r actually read from 'ret'
           pinned =3D ret =3D 0;
                    ^     ~
   drivers/gpu/drm/i915/gem/i915_gem_userptr.c:304:2: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/gpu/drm/i915/gem/i915_gem_userptr.c:304:2: note: Value stored to=
 'ret' is never read
           ret =3D 0;
           ^     ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   block/blk-map.c:264:4: warning: Value stored to 'ret' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                           ret =3D -EINVAL;
                           ^     ~~~~~~~
   block/blk-map.c:264:4: note: Value stored to 'ret' is never read
                           ret =3D -EINVAL;
                           ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/net/ethernet/dec/tulip/pnic.c:24:6: warning: Value stored to 'ne=
w_csr6' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           u32 new_csr6 =3D tp->csr6 & ~0x40C40200;
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/dec/tulip/pnic.c:24:6: note: Value stored to 'new_c=
sr6' during its initialization is never read
           u32 new_csr6 =3D tp->csr6 & ~0x40C40200;
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/net/ethernet/dlink/dl2k.c:974:18: warning: Dereference of null p=
ointer [clang-analyzer-core.NullDereference]
                           skb->protocol =3D eth_type_trans (skb, dev);
                                         ^
   drivers/net/ethernet/dlink/dl2k.c:782:2: note: Loop condition is true.  =
Entering loop body
           while (1) {
           ^
   drivers/net/ethernet/dlink/dl2k.c:786:7: note: Assuming 'int_status' is =
not equal to 0
                   if (int_status =3D=3D 0 || --cnt < 0)
                       ^~~~~~~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:786:7: note: Left side of '||' is false
   drivers/net/ethernet/dlink/dl2k.c:786:3: note: Taking false branch
                   if (int_status =3D=3D 0 || --cnt < 0)
                   ^
   drivers/net/ethernet/dlink/dl2k.c:790:7: note: Assuming the condition is=
 true
                   if (int_status & RxDMAComplete)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:790:3: note: Taking true branch
                   if (int_status & RxDMAComplete)
                   ^
   drivers/net/ethernet/dlink/dl2k.c:791:4: note: Calling 'receive_packet'
                           receive_packet (dev);
                           ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:923:2: note: Loop condition is true.  =
Entering loop body
           while (1) {
           ^
   drivers/net/ethernet/dlink/dl2k.c:928:7: note: Assuming the condition is=
 false
                   if (!(desc->status & cpu_to_le64(RFDDone)) ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:928:7: note: Left side of '||' is false
   drivers/net/ethernet/dlink/dl2k.c:929:7: note: Assuming the condition is=
 false
                       !(desc->status & cpu_to_le64(FrameStart)) ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:928:7: note: Left side of '||' is false
                   if (!(desc->status & cpu_to_le64(RFDDone)) ||
                       ^
   drivers/net/ethernet/dlink/dl2k.c:930:7: note: Assuming the condition is=
 false
                       !(desc->status & cpu_to_le64(FrameEnd)))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:928:3: note: Taking false branch
                   if (!(desc->status & cpu_to_le64(RFDDone)) ||
                   ^
   drivers/net/ethernet/dlink/dl2k.c:936:3: note: Taking false branch
                   if (--cnt < 0)
                   ^
   drivers/net/ethernet/dlink/dl2k.c:939:7: note: Assuming the condition is=
 false
                   if (frame_status & RFS_Errors) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:939:3: note: Taking false branch
                   if (frame_status & RFS_Errors) {
                   ^
   drivers/net/ethernet/dlink/dl2k.c:953:8: note: Assuming 'pkt_len' is <=
=3D 'copy_thresh'
                           if (pkt_len > copy_thresh) {
                               ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:953:4: note: Taking false branch
                           if (pkt_len > copy_thresh) {
                           ^
   drivers/net/ethernet/dlink/dl2k.c:960:22: note: Calling 'netdev_alloc_sk=
b_ip_align'
                           } else if ((skb =3D netdev_alloc_skb_ip_align(de=
v, pkt_len))) {
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   include/linux/skbuff.h:2945:9: note: Calling '__netdev_alloc_skb_ip_alig=
n'
           return __netdev_alloc_skb_ip_align(dev, length, GFP_ATOMIC);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2935:2: note: 'skb' initialized here
           struct sk_buff *skb =3D __netdev_alloc_skb(dev, length + NET_IP_=
ALIGN, gfp);
           ^~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2937:19: note: Left side of '&&' is false
           if (NET_IP_ALIGN && skb)
                            ^
   include/linux/skbuff.h:2939:2: note: Returning pointer (loaded from 'skb=
')
           return skb;
           ^~~~~~~~~~
   include/linux/skbuff.h:2945:9: note: Returning from '__netdev_alloc_skb_=
ip_align'
           return __netdev_alloc_skb_ip_align(dev, length, GFP_ATOMIC);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2945:2: note: Returning pointer
           return __netdev_alloc_skb_ip_align(dev, length, GFP_ATOMIC);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:960:22: note: Returning from 'netdev_a=
lloc_skb_ip_align'
                           } else if ((skb =3D netdev_alloc_skb_ip_align(de=
v, pkt_len))) {
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:960:16: note: Value assigned to 'skb'
                           } else if ((skb =3D netdev_alloc_skb_ip_align(de=
v, pkt_len))) {
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:960:16: note: Assuming 'skb' is null
                           } else if ((skb =3D netdev_alloc_skb_ip_align(de=
v, pkt_len))) {
                                       ^~~
   drivers/net/ethernet/dlink/dl2k.c:960:16: note: Assuming pointer value i=
s null
                           } else if ((skb =3D netdev_alloc_skb_ip_align(de=
v, pkt_len))) {
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/net/ethernet/dlink/dl2k.c:960:11: note: Taking false branch
                           } else if ((skb =3D netdev_alloc_skb_ip_align(de=
v, pkt_len))) {
                                  ^
   drivers/net/ethernet/dlink/dl2k.c:974:18: note: Dereference of null poin=
ter
                           skb->protocol =3D eth_type_trans (skb, dev);
                           ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.

vim +974 drivers/net/ethernet/dlink/dl2k.c

^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   914  =

^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   915  static int
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   916  receive_packet (struct net_device *dev)
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   917  {
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   918  	struct netdev_private *np =3D netdev_priv(dev);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   919  	int entry =3D np->cur_rx % RX_RING_SIZE;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   920  	int cnt =3D 30;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   921  =

^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   922  	/* If RFDDone, FrameStart and FrameEnd set, there is a new pack=
et in. */
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   923  	while (1) {
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   924  		struct netdev_desc *desc =3D &np->rx_ring[entry];
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   925  		int pkt_len;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   926  		u64 frame_status;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   927  =

78ce8d3d1c75c2 drivers/net/dl2k.c                Al Viro            2007-12=
-22   928  		if (!(desc->status & cpu_to_le64(RFDDone)) ||
78ce8d3d1c75c2 drivers/net/dl2k.c                Al Viro            2007-12=
-22   929  		    !(desc->status & cpu_to_le64(FrameStart)) ||
78ce8d3d1c75c2 drivers/net/dl2k.c                Al Viro            2007-12=
-22   930  		    !(desc->status & cpu_to_le64(FrameEnd)))
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   931  			break;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   932  =

^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   933  		/* Chip omits the CRC. */
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   934  		frame_status =3D le64_to_cpu(desc->status);
78ce8d3d1c75c2 drivers/net/dl2k.c                Al Viro            2007-12=
-22   935  		pkt_len =3D frame_status & 0xffff;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   936  		if (--cnt < 0)
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   937  			break;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   938  		/* Update rx error statistics, drop packet. */
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   939  		if (frame_status & RFS_Errors) {
a548779bb7da7d drivers/net/ethernet/dlink/dl2k.c Tobias Klauser     2017-04=
-07   940  			dev->stats.rx_errors++;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   941  			if (frame_status & (RxRuntFrame | RxLengthError))
a548779bb7da7d drivers/net/ethernet/dlink/dl2k.c Tobias Klauser     2017-04=
-07   942  				dev->stats.rx_length_errors++;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   943  			if (frame_status & RxFCSError)
a548779bb7da7d drivers/net/ethernet/dlink/dl2k.c Tobias Klauser     2017-04=
-07   944  				dev->stats.rx_crc_errors++;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   945  			if (frame_status & RxAlignmentError && np->speed !=3D 1000)
a548779bb7da7d drivers/net/ethernet/dlink/dl2k.c Tobias Klauser     2017-04=
-07   946  				dev->stats.rx_frame_errors++;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   947  			if (frame_status & RxFIFOOverrun)
a548779bb7da7d drivers/net/ethernet/dlink/dl2k.c Tobias Klauser     2017-04=
-07   948  				dev->stats.rx_fifo_errors++;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   949  		} else {
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   950  			struct sk_buff *skb;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   951  =

^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   952  			/* Small skbuffs for short packets */
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   953  			if (pkt_len > copy_thresh) {
b49db89e9697dd drivers/net/ethernet/dlink/dl2k.c Christophe JAILLET 2020-09=
-13   954  				dma_unmap_single(&np->pdev->dev,
78ce8d3d1c75c2 drivers/net/dl2k.c                Al Viro            2007-12=
-22   955  						 desc_to_dma(desc),
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   956  						 np->rx_buf_sz,
b49db89e9697dd drivers/net/ethernet/dlink/dl2k.c Christophe JAILLET 2020-09=
-13   957  						 DMA_FROM_DEVICE);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   958  				skb_put (skb =3D np->rx_skbuff[entry], pkt_len);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   959  				np->rx_skbuff[entry] =3D NULL;
89d71a66c40d62 drivers/net/dl2k.c                Eric Dumazet       2009-10=
-13   960  			} else if ((skb =3D netdev_alloc_skb_ip_align(dev, pkt_len)))=
 {
b49db89e9697dd drivers/net/ethernet/dlink/dl2k.c Christophe JAILLET 2020-09=
-13   961  				dma_sync_single_for_cpu(&np->pdev->dev,
78ce8d3d1c75c2 drivers/net/dl2k.c                Al Viro            2007-12=
-22   962  							desc_to_dma(desc),
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   963  							np->rx_buf_sz,
b49db89e9697dd drivers/net/ethernet/dlink/dl2k.c Christophe JAILLET 2020-09=
-13   964  							DMA_FROM_DEVICE);
8c7b7faaa630fe drivers/net/dl2k.c                David S. Miller    2007-07=
-10   965  				skb_copy_to_linear_data (skb,
689be43945e9ca drivers/net/dl2k.c                David S. Miller    2005-06=
-28   966  						  np->rx_skbuff[entry]->data,
8c7b7faaa630fe drivers/net/dl2k.c                David S. Miller    2007-07=
-10   967  						  pkt_len);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   968  				skb_put (skb, pkt_len);
b49db89e9697dd drivers/net/ethernet/dlink/dl2k.c Christophe JAILLET 2020-09=
-13   969  				dma_sync_single_for_device(&np->pdev->dev,
78ce8d3d1c75c2 drivers/net/dl2k.c                Al Viro            2007-12=
-22   970  							   desc_to_dma(desc),
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   971  							   np->rx_buf_sz,
b49db89e9697dd drivers/net/ethernet/dlink/dl2k.c Christophe JAILLET 2020-09=
-13   972  							   DMA_FROM_DEVICE);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   973  			}
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  @974  			skb->protocol =3D eth_type_trans (skb, dev);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   975  #if 0
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   976  			/* Checksum done by hw, but csum value unavailable. */
44c10138fd4bbc drivers/net/dl2k.c                Auke Kok           2007-06=
-08   977  			if (np->pdev->pci_rev_id >=3D 0x0c &&
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   978  				!(frame_status & (TCPError | UDPError | IPError))) {
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   979  				skb->ip_summed =3D CHECKSUM_UNNECESSARY;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   980  			}
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   981  #endif
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   982  			netif_rx (skb);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   983  		}
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   984  		entry =3D (entry + 1) % RX_RING_SIZE;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   985  	}
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   986  	spin_lock(&np->rx_lock);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   987  	np->cur_rx =3D entry;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   988  	/* Re-allocate skbuffs to fill the descriptor ring */
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   989  	entry =3D np->old_rx;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   990  	while (entry !=3D np->cur_rx) {
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   991  		struct sk_buff *skb;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   992  		/* Dropped packets don't need to re-allocate */
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   993  		if (np->rx_skbuff[entry] =3D=3D NULL) {
89d71a66c40d62 drivers/net/dl2k.c                Eric Dumazet       2009-10=
-13   994  			skb =3D netdev_alloc_skb_ip_align(dev, np->rx_buf_sz);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   995  			if (skb =3D=3D NULL) {
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   996  				np->rx_ring[entry].fraginfo =3D 0;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   997  				printk (KERN_INFO
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   998  					"%s: receive_packet: "
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16   999  					"Unable to re-allocate Rx skbuff.#%d\n",
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1000  					dev->name, entry);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1001  				break;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1002  			}
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1003  			np->rx_skbuff[entry] =3D skb;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1004  			np->rx_ring[entry].fraginfo =3D
b49db89e9697dd drivers/net/ethernet/dlink/dl2k.c Christophe JAILLET 2020-09=
-13  1005  			    cpu_to_le64(dma_map_single(&np->pdev->dev, skb->data,
b49db89e9697dd drivers/net/ethernet/dlink/dl2k.c Christophe JAILLET 2020-09=
-13  1006  						       np->rx_buf_sz, DMA_FROM_DEVICE));
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1007  		}
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1008  		np->rx_ring[entry].fraginfo |=3D
78ce8d3d1c75c2 drivers/net/dl2k.c                Al Viro            2007-12=
-22  1009  		    cpu_to_le64((u64)np->rx_buf_sz << 48);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1010  		np->rx_ring[entry].status =3D 0;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1011  		entry =3D (entry + 1) % RX_RING_SIZE;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1012  	}
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1013  	np->old_rx =3D entry;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1014  	spin_unlock(&np->rx_lock);
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1015  	return 0;
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1016  }
^1da177e4c3f41 drivers/net/dl2k.c                Linus Torvalds     2005-04=
-16  1017  =


:::::: The code at line 974 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7704281708296776139==--

