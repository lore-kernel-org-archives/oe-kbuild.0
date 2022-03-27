Content-Type: multipart/mixed; boundary="===============1811501834816144978=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 106/1029] drivers/fpga/zynqmp-fpga.c:149:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 27 Mar 2022 19:40:42 +0800
Message-ID: <202203271923.FG5G9xhd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1811501834816144978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Nava kishore Manne <nava.manne@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: 33504b3c89260e1ca21a73c8d71c5da814f62db8 [106/1029] firmware: xilin=
x: Update the zynqmp_pm_fpga_load() API
:::::: branch date: 3 days ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220327/202203271923.FG5G9xhd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/33504b3c89260e1ca21a7=
3c8d71c5da814f62db8
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 33504b3c89260e1ca21a73c8d71c5da814f62db8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/can/skb.h:64:2: note: Calling 'skb_reserve'
           skb_reserve(skb, sizeof(struct can_skb_priv));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2414:1: note: Returning without writing to 'skb->=
end'
   }
   ^
   include/linux/can/skb.h:64:2: note: Returning from 'skb_reserve'
           skb_reserve(skb, sizeof(struct can_skb_priv));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/can/skb.h:65:1: note: Returning without writing to 'skb->e=
nd'
   }
   ^
   net/can/raw.c:812:2: note: Returning from 'can_skb_reserve'
           can_skb_reserve(skb);
           ^~~~~~~~~~~~~~~~~~~~
   net/can/raw.c:813:2: note: Calling 'can_skb_prv'
           can_skb_prv(skb)->ifindex =3D dev->ifindex;
           ^~~~~~~~~~~~~~~~
   include/linux/can/skb.h:59:2: note: Returning without writing to 'skb->e=
nd'
           return (struct can_skb_priv *)(skb->head);
           ^
   net/can/raw.c:813:2: note: Returning from 'can_skb_prv'
           can_skb_prv(skb)->ifindex =3D dev->ifindex;
           ^~~~~~~~~~~~~~~~
   net/can/raw.c:814:2: note: Calling 'can_skb_prv'
           can_skb_prv(skb)->skbcnt =3D 0;
           ^~~~~~~~~~~~~~~~
   include/linux/can/skb.h:59:2: note: Returning without writing to 'skb->e=
nd'
           return (struct can_skb_priv *)(skb->head);
           ^
   net/can/raw.c:814:2: note: Returning from 'can_skb_prv'
           can_skb_prv(skb)->skbcnt =3D 0;
           ^~~~~~~~~~~~~~~~
   net/can/raw.c:816:24: note: Value assigned to field 'end'
           err =3D memcpy_from_msg(skb_put(skb, size), msg, size);
                                 ^~~~~~~~~~~~~~~~~~
   net/can/raw.c:817:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   net/can/raw.c:817:2: note: Taking false branch
           if (err < 0)
           ^
   net/can/raw.c:820:2: note: Calling 'skb_setup_tx_timestamp'
           skb_setup_tx_timestamp(skb, sk->sk_tsflags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2607:39: note: Passing value via 3rd parameter 'tx_fl=
ags'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2607:2: note: Calling '_sock_tx_timestamp'
           _sock_tx_timestamp(skb->sk, tsflags, &skb_shinfo(skb)->tx_flags,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2589:6: note: Assuming 'tsflags' is not equal to 0
           if (unlikely(tsflags)) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/net/sock.h:2589:2: note: Taking true branch
           if (unlikely(tsflags)) {
           ^
   include/net/sock.h:2591:7: note: Assuming the condition is true
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2591:7: note: Left side of '&&' is true
   include/net/sock.h:2591:44: note: Assuming 'tskey' is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                            ^~~~~
   include/net/sock.h:2591:7: note: Assuming pointer value is null
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/sock.h:2591:50: note: Left side of '&&' is false
                   if (tsflags & SOF_TIMESTAMPING_OPT_ID && tskey &&
                                                                  ^
   include/net/sock.h:2595:6: note: Assuming the condition is false
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/net/sock.h:2595:2: note: Taking true branch
           if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
           ^
   include/net/sock.h:2596:13: note: Dereference of null pointer (loaded fr=
om variable 'tx_flags')
                   *tx_flags |=3D SKBTX_WIFI_STATUS;
                    ~~~~~~~~ ^
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
   5 warnings generated.
>> drivers/fpga/zynqmp-fpga.c:149:6: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (status)
               ^~~~~~
   drivers/fpga/zynqmp-fpga.c:105:2: note: 'status' declared without an ini=
tial value
           u32 status;
           ^~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:112:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:112:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
           ^
   drivers/fpga/zynqmp-fpga.c:117:9: note: Calling 'dma_alloc_coherent'
           kbuf =3D dma_alloc_coherent(priv->dev, dma_size, &dma_addr, GFP_=
KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/dma-mapping.h:419:4: note: '?' condition is false
                           (gfp & __GFP_NOWARN) ? DMA_ATTR_NO_WARN : 0);
                           ^
   include/linux/dma-mapping.h:418:2: note: Returning pointer, which partic=
ipates in a condition later
           return dma_alloc_attrs(dev, size, dma_handle, gfp,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:117:9: note: Returning from 'dma_alloc_cohere=
nt'
           kbuf =3D dma_alloc_coherent(priv->dev, dma_size, &dma_addr, GFP_=
KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/fpga/zynqmp-fpga.c:118:6: note: Assuming 'kbuf' is non-null
           if (!kbuf)
               ^~~~~
   drivers/fpga/zynqmp-fpga.c:118:2: note: Taking false branch
           if (!kbuf)
           ^
   drivers/fpga/zynqmp-fpga.c:123:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM) {
           ^
   drivers/fpga/zynqmp-fpga.c:126:13: note: Assuming the condition is false
           } else if (priv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:126:9: note: Taking false branch
           } else if (priv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM) {
                  ^
   drivers/fpga/zynqmp-fpga.c:132:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:132:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
           ^
   drivers/fpga/zynqmp-fpga.c:134:11: note: Assuming the condition is false
           else if (priv->flags & FPGA_MGR_SECURE_MEM_AUTH_BITSTREAM)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:134:7: note: Taking false branch
           else if (priv->flags & FPGA_MGR_SECURE_MEM_AUTH_BITSTREAM)
                ^
   drivers/fpga/zynqmp-fpga.c:137:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_PARTIAL_RECONFIG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:137:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_PARTIAL_RECONFIG)
           ^
   drivers/fpga/zynqmp-fpga.c:140:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
           ^
   drivers/fpga/zynqmp-fpga.c:144:9: note: Calling 'zynqmp_pm_fpga_load'
                   ret =3D zynqmp_pm_fpga_load(dma_addr, size,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:825:2: note: Returning without writ=
ing to '*status'
           return -ENODEV;
           ^
   drivers/fpga/zynqmp-fpga.c:144:9: note: Returning from 'zynqmp_pm_fpga_l=
oad'
                   ret =3D zynqmp_pm_fpga_load(dma_addr, size,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:149:6: note: Branch condition evaluates to a =
garbage value
           if (status)
               ^~~~~~
   drivers/fpga/zynqmp-fpga.c:213:6: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (status)
               ^~~~~~
   drivers/fpga/zynqmp-fpga.c:179:2: note: 'status' declared without an ini=
tial value
           u32 status;
           ^~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:188:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_PARTIAL_RECONFIG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:188:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_PARTIAL_RECONFIG)
           ^
   drivers/fpga/zynqmp-fpga.c:190:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:190:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
           ^
   drivers/fpga/zynqmp-fpga.c:192:11: note: Assuming the condition is false
           else if (priv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:192:7: note: Taking false branch
           else if (priv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM)
                ^
   drivers/fpga/zynqmp-fpga.c:194:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:194:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
--
                                    ^
   drivers/hwtracing/coresight/coresight-etb10.c:309:6: note: Assuming the =
condition is false
           if ((readl_relaxed(drvdata->base + ETB_STATUS_REG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etb10.c:309:2: note: Taking false =
branch
           if ((readl_relaxed(drvdata->base + ETB_STATUS_REG)
           ^
   drivers/hwtracing/coresight/coresight-etb10.c:319:14: note: Assuming 'i'=
 is >=3D 'depth'
           for (i =3D 0; i < depth; i++) {
                       ^~~~~~~~~
   drivers/hwtracing/coresight/coresight-etb10.c:319:2: note: Loop conditio=
n is false. Execution continues on line 326
           for (i =3D 0; i < depth; i++) {
           ^
   drivers/hwtracing/coresight/coresight-etb10.c:326:6: note: 'lost' is true
           if (lost)
               ^~~~
   drivers/hwtracing/coresight/coresight-etb10.c:326:2: note: Taking true b=
ranch
           if (lost)
           ^
   drivers/hwtracing/coresight/coresight-etb10.c:329:6: note: 'frame_off' i=
s not equal to 0
           if (frame_off) {
               ^~~~~~~~~
   drivers/hwtracing/coresight/coresight-etb10.c:329:2: note: Taking true b=
ranch
           if (frame_off) {
           ^
   drivers/hwtracing/coresight/coresight-etb10.c:331:15: note: Assuming 'i'=
 is < 'frame_endoff'
                   for (i =3D 0; i < frame_endoff; i++) {
                               ^~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etb10.c:331:3: note: Loop conditio=
n is true.  Entering loop body
                   for (i =3D 0; i < frame_endoff; i++) {
                   ^
   drivers/hwtracing/coresight/coresight-etb10.c:332:5: note: Null pointer =
value stored to 'buf_ptr'
                           *buf_ptr++ =3D 0x0;
                            ^~~~~~~~~
   drivers/hwtracing/coresight/coresight-etb10.c:332:15: note: Dereference =
of null pointer
                           *buf_ptr++ =3D 0x0;
                           ~~~~~~~~~~~^~~~~
   drivers/hwtracing/coresight/coresight-etb10.c:543:3: warning: Value stor=
ed to 'buf_ptr' is never read [clang-analyzer-deadcode.DeadStores]
                   buf_ptr +=3D 4;
                   ^          ~
   drivers/hwtracing/coresight/coresight-etb10.c:543:3: note: Value stored =
to 'buf_ptr' is never read
                   buf_ptr +=3D 4;
                   ^          ~
   drivers/hwtracing/coresight/coresight-etb10.c:620:17: warning: Value sto=
red to 'dev' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           struct device *dev =3D &drvdata->csdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-etb10.c:620:17: note: Value stored=
 to 'dev' during its initialization is never read
           struct device *dev =3D &drvdata->csdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   5 warnings generated.
>> drivers/fpga/zynqmp-fpga.c:149:6: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (status)
               ^~~~~~
   drivers/fpga/zynqmp-fpga.c:105:2: note: 'status' declared without an ini=
tial value
           u32 status;
           ^~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:112:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:112:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
           ^
   drivers/fpga/zynqmp-fpga.c:117:9: note: Calling 'dma_alloc_coherent'
           kbuf =3D dma_alloc_coherent(priv->dev, dma_size, &dma_addr, GFP_=
KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/dma-mapping.h:419:4: note: '?' condition is false
                           (gfp & __GFP_NOWARN) ? DMA_ATTR_NO_WARN : 0);
                           ^
   include/linux/dma-mapping.h:418:2: note: Returning pointer, which partic=
ipates in a condition later
           return dma_alloc_attrs(dev, size, dma_handle, gfp,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:117:9: note: Returning from 'dma_alloc_cohere=
nt'
           kbuf =3D dma_alloc_coherent(priv->dev, dma_size, &dma_addr, GFP_=
KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/fpga/zynqmp-fpga.c:118:6: note: Assuming 'kbuf' is non-null
           if (!kbuf)
               ^~~~~
   drivers/fpga/zynqmp-fpga.c:118:2: note: Taking false branch
           if (!kbuf)
           ^
   drivers/fpga/zynqmp-fpga.c:123:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM) {
           ^
   drivers/fpga/zynqmp-fpga.c:126:13: note: Assuming the condition is false
           } else if (priv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:126:9: note: Taking false branch
           } else if (priv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM) {
                  ^
   drivers/fpga/zynqmp-fpga.c:132:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:132:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
           ^
   drivers/fpga/zynqmp-fpga.c:134:11: note: Assuming the condition is false
           else if (priv->flags & FPGA_MGR_SECURE_MEM_AUTH_BITSTREAM)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:134:7: note: Taking false branch
           else if (priv->flags & FPGA_MGR_SECURE_MEM_AUTH_BITSTREAM)
                ^
   drivers/fpga/zynqmp-fpga.c:137:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_PARTIAL_RECONFIG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:137:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_PARTIAL_RECONFIG)
           ^
   drivers/fpga/zynqmp-fpga.c:140:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
           ^
   drivers/fpga/zynqmp-fpga.c:144:9: note: Calling 'zynqmp_pm_fpga_load'
                   ret =3D zynqmp_pm_fpga_load(dma_addr, size,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/xlnx-zynqmp.h:825:2: note: Returning without writ=
ing to '*status'
           return -ENODEV;
           ^
   drivers/fpga/zynqmp-fpga.c:144:9: note: Returning from 'zynqmp_pm_fpga_l=
oad'
                   ret =3D zynqmp_pm_fpga_load(dma_addr, size,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:149:6: note: Branch condition evaluates to a =
garbage value
           if (status)
               ^~~~~~
   drivers/fpga/zynqmp-fpga.c:213:6: warning: Branch condition evaluates to=
 a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (status)
               ^~~~~~
   drivers/fpga/zynqmp-fpga.c:179:2: note: 'status' declared without an ini=
tial value
           u32 status;
           ^~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:188:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_PARTIAL_RECONFIG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:188:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_PARTIAL_RECONFIG)
           ^
   drivers/fpga/zynqmp-fpga.c:190:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:190:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
           ^
   drivers/fpga/zynqmp-fpga.c:192:11: note: Assuming the condition is false
           else if (priv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:192:7: note: Taking false branch
           else if (priv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM)
                ^
   drivers/fpga/zynqmp-fpga.c:194:6: note: Assuming the condition is false
           if (priv->flags & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/fpga/zynqmp-fpga.c:194:2: note: Taking false branch
           if (priv->flags & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)

vim +149 drivers/fpga/zynqmp-fpga.c

c09f7471127e9d Nava kishore Manne           2019-04-15   97  =

c09f7471127e9d Nava kishore Manne           2019-04-15   98  static int zyn=
qmp_fpga_ops_write(struct fpga_manager *mgr,
c09f7471127e9d Nava kishore Manne           2019-04-15   99  				 const cha=
r *buf, size_t size)
c09f7471127e9d Nava kishore Manne           2019-04-15  100  {
c09f7471127e9d Nava kishore Manne           2019-04-15  101  	struct zynqmp=
_fpga_priv *priv;
17d80e71b14654 Nava kishore Manne           2020-09-29  102  	dma_addr_t dm=
a_addr =3D 0;
c09f7471127e9d Nava kishore Manne           2019-04-15  103  	u32 eemi_flag=
s =3D 0;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  104  	size_t dma_si=
ze;
33504b3c89260e Nava kishore Manne           2022-01-13  105  	u32 status;
c09f7471127e9d Nava kishore Manne           2019-04-15  106  	char *kbuf;
c09f7471127e9d Nava kishore Manne           2019-04-15  107  	int ret;
c09f7471127e9d Nava kishore Manne           2019-04-15  108  =

c09f7471127e9d Nava kishore Manne           2019-04-15  109  	priv =3D mgr-=
>priv;
c56dc0db37a37e Appana Durga Kedareswara rao 2019-12-31  110  	priv->size =
=3D size;
c09f7471127e9d Nava kishore Manne           2019-04-15  111  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  112  	if (priv->fla=
gs & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
c9c4634e0ae452 Nava kishore Manne           2019-12-31  113  		dma_size =3D=
 size + ENCRYPTED_KEY_LEN;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  114  	else
c9c4634e0ae452 Nava kishore Manne           2019-12-31  115  		dma_size =3D=
 size;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  116  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  117  	kbuf =3D dma_=
alloc_coherent(priv->dev, dma_size, &dma_addr, GFP_KERNEL);
c09f7471127e9d Nava kishore Manne           2019-04-15  118  	if (!kbuf)
c09f7471127e9d Nava kishore Manne           2019-04-15  119  		return -ENOM=
EM;
c09f7471127e9d Nava kishore Manne           2019-04-15  120  =

c09f7471127e9d Nava kishore Manne           2019-04-15  121  	memcpy(kbuf, =
buf, size);
c09f7471127e9d Nava kishore Manne           2019-04-15  122  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  123  	if (priv->fla=
gs & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM) {
c9c4634e0ae452 Nava kishore Manne           2019-12-31  124  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_ENCRYPTION_USERKEY;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  125  		memcpy(kbuf =
+ size, mgr->key, ENCRYPTED_KEY_LEN);
c9c4634e0ae452 Nava kishore Manne           2019-12-31  126  	} else if (pr=
iv->flags & FPGA_MGR_ENCRYPTED_BITSTREAM) {
c9c4634e0ae452 Nava kishore Manne           2019-12-31  127  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_ENCRYPTION_DEVKEY;
c9c4634e0ae452 Nava kishore Manne           2019-12-31  128  	}
c9c4634e0ae452 Nava kishore Manne           2019-12-31  129  =

c09f7471127e9d Nava kishore Manne           2019-04-15  130  	wmb(); /* ens=
ure all writes are done before initiate FW call */
c09f7471127e9d Nava kishore Manne           2019-04-15  131  =

0a59c37a459937 Nava kishore Manne           2019-12-31  132  	if (priv->fla=
gs & FPGA_MGR_DDR_MEM_AUTH_BITSTREAM)
0a59c37a459937 Nava kishore Manne           2019-12-31  133  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_AUTHENTICATION_DDR;
0a59c37a459937 Nava kishore Manne           2019-12-31  134  	else if (priv=
->flags & FPGA_MGR_SECURE_MEM_AUTH_BITSTREAM)
0a59c37a459937 Nava kishore Manne           2019-12-31  135  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_AUTHENTICATION_OCM;
0a59c37a459937 Nava kishore Manne           2019-12-31  136  =

c09f7471127e9d Nava kishore Manne           2019-04-15  137  	if (priv->fla=
gs & FPGA_MGR_PARTIAL_RECONFIG)
c09f7471127e9d Nava kishore Manne           2019-04-15  138  		eemi_flags |=
=3D XILINX_ZYNQMP_PM_FPGA_PARTIAL;
c09f7471127e9d Nava kishore Manne           2019-04-15  139  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  140  	if (priv->fla=
gs & FPGA_MGR_USERKEY_ENCRYPTED_BITSTREAM)
c9c4634e0ae452 Nava kishore Manne           2019-12-31  141  		ret =3D zynq=
mp_pm_fpga_load(dma_addr, dma_addr + size,
33504b3c89260e Nava kishore Manne           2022-01-13  142  					  eemi_fl=
ags, &status);
c9c4634e0ae452 Nava kishore Manne           2019-12-31  143  	else
33504b3c89260e Nava kishore Manne           2022-01-13  144  		ret =3D zynq=
mp_pm_fpga_load(dma_addr, size,
33504b3c89260e Nava kishore Manne           2022-01-13  145  					  eemi_fl=
ags, &status);
c09f7471127e9d Nava kishore Manne           2019-04-15  146  =

c9c4634e0ae452 Nava kishore Manne           2019-12-31  147  	dma_free_cohe=
rent(priv->dev, dma_size, kbuf, dma_addr);
c09f7471127e9d Nava kishore Manne           2019-04-15  148  =

33504b3c89260e Nava kishore Manne           2022-01-13 @149  	if (status)
33504b3c89260e Nava kishore Manne           2022-01-13  150  		return statu=
s;
33504b3c89260e Nava kishore Manne           2022-01-13  151  =

c09f7471127e9d Nava kishore Manne           2019-04-15  152  	return ret;
c09f7471127e9d Nava kishore Manne           2019-04-15  153  }
c09f7471127e9d Nava kishore Manne           2019-04-15  154  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1811501834816144978==--

