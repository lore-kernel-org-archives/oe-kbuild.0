Content-Type: multipart/mixed; boundary="===============2365727540564051932=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: rawnand: Fix return value check of wait_for_completion_timeout
Date: Sun, 17 Apr 2022 10:49:59 +0800
Message-ID: <202204171027.PZ0Cy8gG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2365727540564051932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220412020834.7161-1-linmq006@gmail.com>
References: <20220412020834.7161-1-linmq006@gmail.com>
TO: Miaoqian Lin <linmq006@gmail.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Pratyush Yadav <p.yadav@ti.com>
TO: Miaoqian Lin <linmq006@gmail.com>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Paul Cercueil <paul@crapouillou.net>
TO: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
TO: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
TO: Bastian Hecht <hechtb@googlemail.com>
TO: linux-mtd(a)lists.infradead.org
TO: linux-kernel(a)vger.kernel.org

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master linux/master v5.18-rc2 next-202204=
14]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Miaoqian-Lin/mtd-raw=
nand-Fix-return-value-check-of-wait_for_completion_timeout/20220412-101006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/=
next
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-c002-20220417 (https://download.01.org/0day-ci/archi=
ve/20220417/202204171027.PZ0Cy8gG-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/3de25b46a3f73a3e003=
1e5186eb4e2afa9098b46
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Miaoqian-Lin/mtd-rawnand-Fix-retur=
n-value-check-of-wait_for_completion_timeout/20220412-101006
        git checkout 3de25b46a3f73a3e0031e5186eb4e2afa9098b46
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           memset(state->msg, 0, 2 * sizeof(struct i2c_msg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib0070.c:80:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(state->msg, 0, 2 * sizeof(struct i2c_msg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib0070.c:113:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(state->msg, 0, sizeof(struct i2c_msg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib0070.c:113:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(state->msg, 0, sizeof(struct i2c_msg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib0070.c:755:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&fe->ops.tuner_ops, &dib0070_ops, sizeof(struct dvb_tuner=
_ops));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/dib0070.c:755:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&fe->ops.tuner_ops, &dib0070_ops, sizeof(struct dvb_tuner=
_ops));
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 49 warnings (48 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   drivers/mtd/nand/raw/sh_flctl.c:192:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cfg, 0, sizeof(cfg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:192:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(&cfg, 0, sizeof(cfg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> drivers/mtd/nand/raw/sh_flctl.c:447:2: warning: Undefined or garbage val=
ue returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   drivers/mtd/nand/raw/sh_flctl.c:750:6: note: Assuming 'command' is not e=
qual to NAND_CMD_PAGEPROG
           if (command !=3D NAND_CMD_PAGEPROG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:750:2: note: Taking true branch
           if (command !=3D NAND_CMD_PAGEPROG)
           ^
   drivers/mtd/nand/raw/sh_flctl.c:753:2: note: Control jumps to 'case 1:' =
 at line 754
           switch (command) {
           ^
   drivers/mtd/nand/raw/sh_flctl.c:756:7: note: Assuming field 'hwecc' is 0
                   if (flctl->hwecc) {
                       ^~~~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:756:3: note: Taking false branch
                   if (flctl->hwecc) {
                   ^
   drivers/mtd/nand/raw/sh_flctl.c:761:7: note: Assuming field 'page_size' =
is 0
                   if (flctl->page_size)
                       ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:761:3: note: Taking false branch
                   if (flctl->page_size)
                   ^
   drivers/mtd/nand/raw/sh_flctl.c:770:7: note: Assuming the condition is f=
alse
                   if (flctl->chip.options & NAND_BUSWIDTH_16)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:770:3: note: Taking false branch
                   if (flctl->chip.options & NAND_BUSWIDTH_16)
                   ^
   drivers/mtd/nand/raw/sh_flctl.c:773:3: note: Control jumps to line 907
                   goto read_normal_exit;
                   ^
   drivers/mtd/nand/raw/sh_flctl.c:910:2: note: Calling 'read_fiforeg'
           read_fiforeg(flctl, flctl->read_bytes, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:469:6: note: Assuming field 'chan_fifo0_=
rx' is non-null
           if (flctl->chan_fifo0_rx && rlen >=3D 32 &&
               ^~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:469:6: note: Left side of '&&' is true
   drivers/mtd/nand/raw/sh_flctl.c:469:30: note: Assuming 'rlen' is >=3D 32
           if (flctl->chan_fifo0_rx && rlen >=3D 32 &&
                                       ^~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:469:6: note: Left side of '&&' is true
           if (flctl->chan_fifo0_rx && rlen >=3D 32 &&
               ^
   drivers/mtd/nand/raw/sh_flctl.c:470:3: note: Calling 'flctl_dma_fifo0_tr=
ansfer'
                   flctl_dma_fifo0_transfer(flctl, buf, rlen, DMA_FROM_DEVI=
CE) > 0)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/mtd/nand/raw/sh_flctl.c:387:2: note: 'ret' declared without an i=
nitial value
           int ret;
           ^~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:390:6: note: 'dir' is equal to DMA_FROM_=
DEVICE
           if (dir =3D=3D DMA_FROM_DEVICE) {
               ^~~
   drivers/mtd/nand/raw/sh_flctl.c:390:2: note: Taking true branch
           if (dir =3D=3D DMA_FROM_DEVICE) {
           ^
   drivers/mtd/nand/raw/sh_flctl.c:400:2: note: Taking true branch
           if (!dma_mapping_error(chan->device->dev, dma_addr))
           ^
   drivers/mtd/nand/raw/sh_flctl.c:404:6: note: Assuming 'desc' is non-null
           if (desc) {
               ^~~~
   drivers/mtd/nand/raw/sh_flctl.c:404:2: note: Taking true branch
           if (desc) {
           ^
   drivers/mtd/nand/raw/sh_flctl.c:412:3: note: Taking false branch
                   if (dma_submit_error(cookie)) {
                   ^
   drivers/mtd/nand/raw/sh_flctl.c:433:6: note: Assuming 'time_left' is not=
 equal to 0
           if (time_left =3D=3D 0) {
               ^~~~~~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:433:2: note: Taking false branch
           if (time_left =3D=3D 0) {
           ^
   drivers/mtd/nand/raw/sh_flctl.c:447:2: note: Undefined or garbage value =
returned to caller
           return ret;
           ^      ~~~
   drivers/mtd/nand/raw/sh_flctl.c:965:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&flctl->done_buff[flctl->index], buf, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/sh_flctl.c:965:2: note: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&flctl->done_buff[flctl->index], buf, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~

vim +447 drivers/mtd/nand/raw/sh_flctl.c

6028aa01f759a1 drivers/mtd/nand/sh_flctl.c     Yoshihiro Shimoda 2008-10-14=
  377  =

83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  378  static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned=
 long *buf,
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  379  					int len, enum dma_data_direction dir)
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  380  {
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  381  	struct dma_async_tx_descriptor *desc =3D NULL;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  382  	struct dma_chan *chan;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  383  	enum dma_transfer_direction tr_dir;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  384  	dma_addr_t dma_addr;
3fe4f900bf3061 drivers/mtd/nand/sh_flctl.c     Brian Norris      2016-05-05=
  385  	dma_cookie_t cookie;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  386  	uint32_t reg;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  387  	int ret;
3de25b46a3f73a drivers/mtd/nand/raw/sh_flctl.c Miaoqian Lin      2022-04-12=
  388  	unsigned long time_left;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  389  =

83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  390  	if (dir =3D=3D DMA_FROM_DEVICE) {
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  391  		chan =3D flctl->chan_fifo0_rx;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  392  		tr_dir =3D DMA_DEV_TO_MEM;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  393  	} else {
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  394  		chan =3D flctl->chan_fifo0_tx;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  395  		tr_dir =3D DMA_MEM_TO_DEV;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  396  	}
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  397  =

83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  398  	dma_addr =3D dma_map_single(chan->device->dev, buf, len, dir);
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  399  =

dbf5f6424ed921 drivers/mtd/nand/sh_flctl.c     Pan Bian          2017-08-08=
  400  	if (!dma_mapping_error(chan->device->dev, dma_addr))
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  401  		desc =3D dmaengine_prep_slave_single(chan, dma_addr, len,
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  402  			tr_dir, DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  403  =

83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  404  	if (desc) {
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  405  		reg =3D readl(FLINTDMACR(flctl));
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  406  		reg |=3D DREQ0EN;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  407  		writel(reg, FLINTDMACR(flctl));
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  408  =

83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  409  		desc->callback =3D flctl_dma_complete;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  410  		desc->callback_param =3D flctl;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  411  		cookie =3D dmaengine_submit(desc);
3fe4f900bf3061 drivers/mtd/nand/sh_flctl.c     Brian Norris      2016-05-05=
  412  		if (dma_submit_error(cookie)) {
3fe4f900bf3061 drivers/mtd/nand/sh_flctl.c     Brian Norris      2016-05-05=
  413  			ret =3D dma_submit_error(cookie);
3fe4f900bf3061 drivers/mtd/nand/sh_flctl.c     Brian Norris      2016-05-05=
  414  			dev_warn(&flctl->pdev->dev,
3fe4f900bf3061 drivers/mtd/nand/sh_flctl.c     Brian Norris      2016-05-05=
  415  				 "DMA submit failed, falling back to PIO\n");
3fe4f900bf3061 drivers/mtd/nand/sh_flctl.c     Brian Norris      2016-05-05=
  416  			goto out;
3fe4f900bf3061 drivers/mtd/nand/sh_flctl.c     Brian Norris      2016-05-05=
  417  		}
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  418  =

83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  419  		dma_async_issue_pending(chan);
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  420  	} else {
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  421  		/* DMA failed, fall back to PIO */
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  422  		flctl_release_dma(flctl);
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  423  		dev_warn(&flctl->pdev->dev,
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  424  			 "DMA failed, falling back to PIO\n");
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  425  		ret =3D -EIO;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  426  		goto out;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  427  	}
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  428  =

3de25b46a3f73a drivers/mtd/nand/raw/sh_flctl.c Miaoqian Lin      2022-04-12=
  429  	time_left =3D
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  430  	wait_for_completion_timeout(&flctl->dma_complete,
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  431  				msecs_to_jiffies(3000));
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  432  =

3de25b46a3f73a drivers/mtd/nand/raw/sh_flctl.c Miaoqian Lin      2022-04-12=
  433  	if (time_left =3D=3D 0) {
0e497c36deef92 drivers/mtd/nand/sh_flctl.c     Vinod Koul        2014-10-11=
  434  		dmaengine_terminate_all(chan);
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  435  		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
3de25b46a3f73a drivers/mtd/nand/raw/sh_flctl.c Miaoqian Lin      2022-04-12=
  436  		ret =3D -ETIMEDOUT;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  437  	}
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  438  =

83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  439  out:
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  440  	reg =3D readl(FLINTDMACR(flctl));
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  441  	reg &=3D ~DREQ0EN;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  442  	writel(reg, FLINTDMACR(flctl));
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  443  =

83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  444  	dma_unmap_single(chan->device->dev, dma_addr, len, dir);
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  445  =

83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  446  	/* ret > 0 is success */
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
 @447  	return ret;
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  448  }
83738d87e3a0a4 drivers/mtd/nand/sh_flctl.c     Bastian Hecht     2012-10-19=
  449  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2365727540564051932==--

