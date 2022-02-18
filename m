Content-Type: multipart/mixed; boundary="===============1195545619790207017=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/nvidia/forcedeth.c:2966:21: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Fri, 18 Feb 2022 11:59:01 +0800
Message-ID: <202202181130.x0sJMGD5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1195545619790207017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8b97cae315cafd7debf3601f88621e2aa8956ef3
commit: 03f61041c17914355dde7261be9ccdc821ddd454 skbuff: Switch structure b=
ounds to struct_group()
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007-20220214 (https://download.01.org/0day-ci/ar=
chive/20220218/202202181130.x0sJMGD5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea0718=
84b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D03f61041c17914355dde7261be9ccdc821ddd454
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 03f61041c17914355dde7261be9ccdc821ddd454
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^
   drivers/net/ethernet/nvidia/forcedeth.c:2901:4: note: Assuming 'rx_work'=
 is < 'limit'
                   (rx_work < limit)) {
                    ^~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:2: note: Loop condition is =
true.  Entering loop body
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2912:3: note: Null pointer value=
 stored to field 'skb'
                   np->get_rx_ctx->skb =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2915:11: note: Field 'desc_ver' =
is not equal to DESC_VER_1
                   if (np->desc_ver =3D=3D DESC_VER_1) {
                           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2915:3: note: Taking false branch
                   if (np->desc_ver =3D=3D DESC_VER_1) {
                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2943:8: note: Assuming the condi=
tion is true
                           if (likely(flags & NV_RX2_DESCRIPTORVALID)) {
                               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2943:4: note: Taking false branch
                           if (likely(flags & NV_RX2_DESCRIPTORVALID)) {
                           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2969:5: note: Control jumps to l=
ine 2981
                                   goto next_pkt;
                                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2981:7: note: Assuming the condi=
tion is false
                   if (unlikely(np->get_rx.orig++ =3D=3D np->last_rx.orig))
                       ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2981:3: note: Taking false branch
                   if (unlikely(np->get_rx.orig++ =3D=3D np->last_rx.orig))
                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2983:16: note: Assuming the cond=
ition is true
                   if (unlikely(np->get_rx_ctx++ =3D=3D np->last_rx_ctx))
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/nvidia/forcedeth.c:2983:3: note: Taking true branch
                   if (unlikely(np->get_rx_ctx++ =3D=3D np->last_rx_ctx))
                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2899:10: note: Assuming 'np->get=
_rx.orig' is not equal to 'np->put_rx.orig'
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:9: note: Left side of '&&' =
is true
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
                  ^
   drivers/net/ethernet/nvidia/forcedeth.c:2900:8: note: Assuming the condi=
tion is true
                 !((flags =3D le32_to_cpu(np->get_rx.orig->flaglen)) & NV_R=
X_AVAIL) &&
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:9: note: Left side of '&&' =
is true
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
                  ^
   drivers/net/ethernet/nvidia/forcedeth.c:2901:4: note: Assuming 'rx_work'=
 is < 'limit'
                   (rx_work < limit)) {
                    ^~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:2: note: Loop condition is =
true.  Entering loop body
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2911:3: note: Null pointer value=
 stored to 'skb'
                   skb =3D np->get_rx_ctx->skb;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2915:11: note: Field 'desc_ver' =
is not equal to DESC_VER_1
                   if (np->desc_ver =3D=3D DESC_VER_1) {
                           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2915:3: note: Taking false branch
                   if (np->desc_ver =3D=3D DESC_VER_1) {
                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2943:8: note: Assuming the condi=
tion is false
                           if (likely(flags & NV_RX2_DESCRIPTORVALID)) {
                               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2943:4: note: Taking true branch
                           if (likely(flags & NV_RX2_DESCRIPTORVALID)) {
                           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2945:9: note: Assuming the condi=
tion is false
                                   if (unlikely(flags & NV_RX2_ERROR)) {
                                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2945:5: note: Taking true branch
                                   if (unlikely(flags & NV_RX2_ERROR)) {
                                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2946:10: note: Assuming the cond=
ition is true
                                           if ((flags & NV_RX2_ERROR_MASK) =
=3D=3D NV_RX2_ERROR4) {
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2946:6: note: Taking true branch
                                           if ((flags & NV_RX2_ERROR_MASK) =
=3D=3D NV_RX2_ERROR4) {
                                           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2947:28: note: Access to field '=
data' results in a dereference of a null pointer (loaded from variable 'skb=
')
                                                   len =3D nv_getlen(dev, s=
kb->data, len);
                                                                        ^~~
>> drivers/net/ethernet/nvidia/forcedeth.c:2966:21: warning: Dereference of=
 null pointer [clang-analyzer-core.NullDereference]
                                           skb->ip_summed =3D CHECKSUM_UNNE=
CESSARY;
                                           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~=
~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:10: note: Assuming 'np->get=
_rx.orig' is not equal to 'np->put_rx.orig'
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:9: note: Left side of '&&' =
is true
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
                  ^
   drivers/net/ethernet/nvidia/forcedeth.c:2900:8: note: Assuming the condi=
tion is true
                 !((flags =3D le32_to_cpu(np->get_rx.orig->flaglen)) & NV_R=
X_AVAIL) &&
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:9: note: Left side of '&&' =
is true
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
                  ^
   drivers/net/ethernet/nvidia/forcedeth.c:2901:4: note: Assuming 'rx_work'=
 is < 'limit'
                   (rx_work < limit)) {
                    ^~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:2: note: Loop condition is =
true.  Entering loop body
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2915:7: note: Assuming field 'de=
sc_ver' is not equal to DESC_VER_1
                   if (np->desc_ver =3D=3D DESC_VER_1) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2915:3: note: Taking false branch
                   if (np->desc_ver =3D=3D DESC_VER_1) {
                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2943:8: note: Assuming the condi=
tion is false
                           if (likely(flags & NV_RX2_DESCRIPTORVALID)) {
                               ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2943:4: note: Taking true branch
                           if (likely(flags & NV_RX2_DESCRIPTORVALID)) {
                           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2945:9: note: Assuming the condi=
tion is false
                                   if (unlikely(flags & NV_RX2_ERROR)) {
                                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2945:5: note: Taking true branch
                                   if (unlikely(flags & NV_RX2_ERROR)) {
                                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2946:10: note: Assuming the cond=
ition is false
                                           if ((flags & NV_RX2_ERROR_MASK) =
=3D=3D NV_RX2_ERROR4) {
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2946:6: note: Taking false branch
                                           if ((flags & NV_RX2_ERROR_MASK) =
=3D=3D NV_RX2_ERROR4) {
                                           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2954:15: note: Assuming the cond=
ition is false
                                           else if ((flags & NV_RX2_ERROR_M=
ASK) =3D=3D NV_RX2_FRAMINGERR) {
                                                    ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2954:11: note: Taking false bran=
ch
                                           else if ((flags & NV_RX2_ERROR_M=
ASK) =3D=3D NV_RX2_FRAMINGERR) {
                                                ^
   drivers/net/ethernet/nvidia/forcedeth.c:2961:7: note: Control jumps to l=
ine 2981
                                                   goto next_pkt;
                                                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2981:16: note: Assuming the cond=
ition is false
                   if (unlikely(np->get_rx.orig++ =3D=3D np->last_rx.orig))
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/nvidia/forcedeth.c:2981:3: note: Taking false branch
                   if (unlikely(np->get_rx.orig++ =3D=3D np->last_rx.orig))
                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2983:16: note: Assuming the cond=
ition is true
                   if (unlikely(np->get_rx_ctx++ =3D=3D np->last_rx_ctx))
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/nvidia/forcedeth.c:2983:3: note: Taking true branch
                   if (unlikely(np->get_rx_ctx++ =3D=3D np->last_rx_ctx))
                   ^
   drivers/net/ethernet/nvidia/forcedeth.c:2899:10: note: Assuming 'np->get=
_rx.orig' is not equal to 'np->put_rx.orig'
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:9: note: Left side of '&&' =
is true
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
                  ^
   drivers/net/ethernet/nvidia/forcedeth.c:2900:8: note: Assuming the condi=
tion is true
                 !((flags =3D le32_to_cpu(np->get_rx.orig->flaglen)) & NV_R=
X_AVAIL) &&
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:9: note: Left side of '&&' =
is true
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
                  ^
   drivers/net/ethernet/nvidia/forcedeth.c:2901:4: note: Assuming 'rx_work'=
 is < 'limit'
                   (rx_work < limit)) {
                    ^~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2899:2: note: Loop condition is =
true.  Entering loop body
           while ((np->get_rx.orig !=3D np->put_rx.orig) &&
           ^
   drivers/net/ethernet/nvidia/forcedeth.c:2912:3: note: Null pointer value=
 stored to field 'skb'
                   np->get_rx_ctx->skb =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/nvidia/forcedeth.c:2915:11: note: Field 'desc_ver' =
is not equal to DESC_VER_1
                   if (np->desc_ver =3D=3D DESC_VER_1) {

vim +2966 drivers/net/ethernet/nvidia/forcedeth.c

f4b633b911fd3b drivers/net/ethernet/nvidia/forcedeth.c Zhu Yanjun        20=
19-09-05  2890  =

e27cdba53b8ad5 drivers/net/forcedeth.c                 Stephen Hemminger 20=
06-07-31  2891  static int nv_rx_process(struct net_device *dev, int limit)
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2892  {
ac9c18974f7d08 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
05-10-26  2893  	struct fe_priv *np =3D netdev_priv(dev);
f82a9352f6b955 drivers/net/forcedeth.c                 Stephen Hemminger 20=
06-07-27  2894  	u32 flags;
bcb5febb248f7c drivers/net/forcedeth.c                 Ingo Molnar       20=
07-10-16  2895  	int rx_work =3D 0;
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2896  	struct sk_buff *skb;
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2897  	int len;
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2898  =

b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2899  	while ((np->get_rx.orig !=3D np->put_rx.orig) &&
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2900  	      !((flags =3D le32_to_cpu(np->get_rx.orig->flaglen)) =
& NV_RX_AVAIL) &&
bcb5febb248f7c drivers/net/forcedeth.c                 Ingo Molnar       20=
07-10-16  2901  		(rx_work < limit)) {
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2902  =

^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2903  		/*
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2904  		 * the packet is for us - immediately tear down the pci m=
apping.
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2905  		 * TODO: check if a prefetch of the first cacheline impro=
ves
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2906  		 * the performance.
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2907  		 */
7598b3498bfdad drivers/net/ethernet/nvidia/forcedeth.c Zhu Yanjun        20=
17-09-14  2908  		dma_unmap_single(&np->pci_dev->dev, np->get_rx_ctx->dma,
761fcd9e3e0aa2 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09  2909  				 np->get_rx_ctx->dma_len,
7598b3498bfdad drivers/net/ethernet/nvidia/forcedeth.c Zhu Yanjun        20=
17-09-14  2910  				 DMA_FROM_DEVICE);
0d63fb32b2b8c3 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09  2911  		skb =3D np->get_rx_ctx->skb;
0d63fb32b2b8c3 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09  2912  		np->get_rx_ctx->skb =3D NULL;
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2913  =

^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2914  		/* look at what we actually got: */
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2915  		if (np->desc_ver =3D=3D DESC_VER_1) {
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2916  			if (likely(flags & NV_RX_DESCRIPTORVALID)) {
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2917  				len =3D flags & LEN_MASK_V1;
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2918  				if (unlikely(flags & NV_RX_ERROR)) {
1ef6841b4c4d9c drivers/net/forcedeth.c                 Ayaz Abdulla      20=
08-08-06  2919  					if ((flags & NV_RX_ERROR_MASK) =3D=3D NV_RX_ERROR4) {
0d63fb32b2b8c3 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09  2920  						len =3D nv_getlen(dev, skb->data, len);
22c6d143f33f10 drivers/net/forcedeth.c                 Manfred Spraul    20=
05-04-19  2921  						if (len < 0) {
0d63fb32b2b8c3 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09  2922  							dev_kfree_skb(skb);
22c6d143f33f10 drivers/net/forcedeth.c                 Manfred Spraul    20=
05-04-19  2923  							goto next_pkt;
22c6d143f33f10 drivers/net/forcedeth.c                 Manfred Spraul    20=
05-04-19  2924  						}
22c6d143f33f10 drivers/net/forcedeth.c                 Manfred Spraul    20=
05-04-19  2925  					}
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2926  					/* framing errors are soft errors */
1ef6841b4c4d9c drivers/net/forcedeth.c                 Ayaz Abdulla      20=
08-08-06  2927  					else if ((flags & NV_RX_ERROR_MASK) =3D=3D NV_RX_FRAMI=
NGERR) {
cef33c815a80bf drivers/net/ethernet/nvidia/forcedeth.c Antonio Ospite    20=
14-06-04  2928  						if (flags & NV_RX_SUBTRACT1)
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2929  							len--;
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2930  					}
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2931  					/* the rest are hard errors */
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2932  					else {
f4b633b911fd3b drivers/net/ethernet/nvidia/forcedeth.c Zhu Yanjun        20=
19-09-05  2933  						rx_missing_handler(flags, np);
0d63fb32b2b8c3 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09  2934  						dev_kfree_skb(skb);
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2935  						goto next_pkt;
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2936  					}
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2937  				}
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2938  			} else {
0d63fb32b2b8c3 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09  2939  				dev_kfree_skb(skb);
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2940  				goto next_pkt;
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2941  			}
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2942  		} else {
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2943  			if (likely(flags & NV_RX2_DESCRIPTORVALID)) {
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2944  				len =3D flags & LEN_MASK_V2;
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2945  				if (unlikely(flags & NV_RX2_ERROR)) {
1ef6841b4c4d9c drivers/net/forcedeth.c                 Ayaz Abdulla      20=
08-08-06  2946  					if ((flags & NV_RX2_ERROR_MASK) =3D=3D NV_RX2_ERROR4) {
0d63fb32b2b8c3 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09  2947  						len =3D nv_getlen(dev, skb->data, len);
22c6d143f33f10 drivers/net/forcedeth.c                 Manfred Spraul    20=
05-04-19  2948  						if (len < 0) {
0d63fb32b2b8c3 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09  2949  							dev_kfree_skb(skb);
22c6d143f33f10 drivers/net/forcedeth.c                 Manfred Spraul    20=
05-04-19  2950  							goto next_pkt;
22c6d143f33f10 drivers/net/forcedeth.c                 Manfred Spraul    20=
05-04-19  2951  						}
22c6d143f33f10 drivers/net/forcedeth.c                 Manfred Spraul    20=
05-04-19  2952  					}
22c6d143f33f10 drivers/net/forcedeth.c                 Manfred Spraul    20=
05-04-19  2953  					/* framing errors are soft errors */
1ef6841b4c4d9c drivers/net/forcedeth.c                 Ayaz Abdulla      20=
08-08-06  2954  					else if ((flags & NV_RX2_ERROR_MASK) =3D=3D NV_RX2_FRA=
MINGERR) {
cef33c815a80bf drivers/net/ethernet/nvidia/forcedeth.c Antonio Ospite    20=
14-06-04  2955  						if (flags & NV_RX2_SUBTRACT1)
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2956  							len--;
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2957  					}
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2958  					/* the rest are hard errors */
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2959  					else {
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2960  						dev_kfree_skb(skb);
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2961  						goto next_pkt;
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2962  					}
a971c32488569b drivers/net/forcedeth.c                 Ayaz Abdulla      20=
05-11-11  2963  				}
bfaffe8fae0273 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
08-01-13  2964  				if (((flags & NV_RX2_CHECKSUMMASK) =3D=3D NV_RX2_CHECKS=
UM_IP_TCP) || /*ip and tcp */
bfaffe8fae0273 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
08-01-13  2965  				    ((flags & NV_RX2_CHECKSUMMASK) =3D=3D NV_RX2_CHECKS=
UM_IP_UDP))   /*ip and udp */
0d63fb32b2b8c3 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-09 @2966  					skb->ip_summed =3D CHECKSUM_UNNECESSARY;
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2967  			} else {
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2968  				dev_kfree_skb(skb);
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2969  				goto next_pkt;
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2970  			}
5ed2616f621b41 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
06-06-10  2971  		}
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2972  		/* got a valid packet - forward it to the network core */
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2973  		skb_put(skb, len);
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2974  		skb->protocol =3D eth_type_trans(skb, dev);
53f224cc5f8f65 drivers/net/forcedeth.c                 Tom Herbert       20=
10-05-03  2975  		napi_gro_receive(&np->napi, skb);
f5d827aece3630 drivers/net/ethernet/nvidia/forcedeth.c david decotigny   20=
11-11-16  2976  		u64_stats_update_begin(&np->swstats_rx_syncp);
f4b633b911fd3b drivers/net/ethernet/nvidia/forcedeth.c Zhu Yanjun        20=
19-09-05  2977  		nv_txrx_stats_inc(stat_rx_packets);
f4b633b911fd3b drivers/net/ethernet/nvidia/forcedeth.c Zhu Yanjun        20=
19-09-05  2978  		nv_txrx_stats_add(stat_rx_bytes, len);
f5d827aece3630 drivers/net/ethernet/nvidia/forcedeth.c david decotigny   20=
11-11-16  2979  		u64_stats_update_end(&np->swstats_rx_syncp);
^1da177e4c3f41 drivers/net/forcedeth.c                 Linus Torvalds    20=
05-04-16  2980  next_pkt:
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2981  		if (unlikely(np->get_rx.orig++ =3D=3D np->last_rx.orig))
64f26abb17ca2e drivers/net/ethernet/nvidia/forcedeth.c Zhu Yanjun        20=
18-01-04  2982  			np->get_rx.orig =3D np->rx_ring.orig;
b01867cbd18539 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2983  		if (unlikely(np->get_rx_ctx++ =3D=3D np->last_rx_ctx))
a9124ec443babc drivers/net/ethernet/nvidia/forcedeth.c Zhu Yanjun        20=
18-01-23  2984  			np->get_rx_ctx =3D np->rx_skb;
bcb5febb248f7c drivers/net/forcedeth.c                 Ingo Molnar       20=
07-10-16  2985  =

bcb5febb248f7c drivers/net/forcedeth.c                 Ingo Molnar       20=
07-10-16  2986  		rx_work++;
86b22b0dfbf462 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2987  	}
86b22b0dfbf462 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2988  =

bcb5febb248f7c drivers/net/forcedeth.c                 Ingo Molnar       20=
07-10-16  2989  	return rx_work;
86b22b0dfbf462 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2990  }
86b22b0dfbf462 drivers/net/forcedeth.c                 Ayaz Abdulla      20=
07-01-21  2991  =


:::::: The code at line 2966 was first introduced by commit
:::::: 0d63fb32b2b8c3464d9c1afc3ce3fd3ceec025b6 forcedeth: rx skb recycle

:::::: TO: Ayaz Abdulla <aabdulla@nvidia.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1195545619790207017==--

