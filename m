Content-Type: multipart/mixed; boundary="===============7987707334430728500=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jic23-iio:testing 17/20] drivers/iio/adc/ad_sigma_delta.c:493:23: warning: Array subscript is undefined [clang-analyzer-core.uninitialized.ArraySubscript]
Date: Mon, 28 Mar 2022 04:50:06 +0800
Message-ID: <202203280455.lR0TXLEl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7987707334430728500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Alexandru Tachici <alexandru.tachici@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   58058b684d135495bf99d460e5c37fb36bc33684
commit: 60e0ee74d11157dbbfedfc91e56f97a12735d6d3 [17/20] iio: adc: ad_sigma=
_delta: Add sequencer support
:::::: branch date: 5 hours ago
:::::: commit date: 6 hours ago
config: riscv-randconfig-c006-20220327 (https://download.01.org/0day-ci/arc=
hive/20220328/202203280455.lR0TXLEl-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/com=
mit/?id=3D60e0ee74d11157dbbfedfc91e56f97a12735d6d3
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kerne=
l/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout 60e0ee74d11157dbbfedfc91e56f97a12735d6d3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/printk.h:639:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/hid.h:1036:3: note: Loop condition is false.  Exiting loop
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:656:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:640:3: note: expanded from macro 'printk_ratelimi=
ted'
                   printk(fmt, ##__VA_ARGS__);                             \
                   ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   include/linux/hid.h:1037:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:656:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:640:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_w=
rap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   include/linux/dcache.h:516:9: warning: Access to field 'd_inode' results=
 in a dereference of a null pointer (loaded from variable 'dentry') [clang-=
analyzer-core.NullDereference]
           return dentry->d_inode;
                  ^
   fs/overlayfs/inode.c:1102:28: note: Assuming 'upperdentry' is null
           struct inode *realinode =3D upperdentry ? d_inode(upperdentry) :=
 NULL;
                                     ^~~~~~~~~~~
   fs/overlayfs/inode.c:1102:28: note: '?' condition is false
   fs/overlayfs/inode.c:1104:31: note: Assuming 'lowerpath' is null
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
                                        ^~~~~~~~~
   fs/overlayfs/inode.c:1104:31: note: '?' condition is false
   fs/overlayfs/inode.c:1104:2: note: 'lowerdentry' initialized to a null p=
ointer value
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/inode.c:1107:13: note: 'bylower' is false
           int fsid =3D bylower ? lowerpath->layer->fsid : 0;
                      ^~~~~~~
   fs/overlayfs/inode.c:1107:13: note: '?' condition is false
   fs/overlayfs/inode.c:1110:12: note: Assuming field 'newinode' is null
           int err =3D oip->newinode ? -EEXIST : -ENOMEM;
                     ^~~~~~~~~~~~~
   fs/overlayfs/inode.c:1110:12: note: '?' condition is false
   fs/overlayfs/inode.c:1112:7: note: 'realinode' is null
           if (!realinode)
                ^~~~~~~~~
   fs/overlayfs/inode.c:1112:2: note: Taking true branch
           if (!realinode)
           ^
   fs/overlayfs/inode.c:1113:23: note: Passing null pointer value via 1st p=
arameter 'dentry'
                   realinode =3D d_inode(lowerdentry);
                                       ^~~~~~~~~~~
   fs/overlayfs/inode.c:1113:15: note: Calling 'd_inode'
                   realinode =3D d_inode(lowerdentry);
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:516:9: note: Access to field 'd_inode' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_inode;
                  ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/iio/adc/ad_sigma_delta.c:493:23: warning: Array subscript is und=
efined [clang-analyzer-core.uninitialized.ArraySubscript]
                   converted_channel =3D data[status_pos] & sigma_delta->in=
fo->status_ch_mask;
                                       ^    ~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:441:2: note: 'status_pos' declared with=
out an initial value
           unsigned int status_pos;
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:449:6: note: Assuming field 'data_reg' =
is equal to 0
           if (sigma_delta->info->data_reg !=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:449:2: note: Taking false branch
           if (sigma_delta->info->data_reg !=3D 0)
           ^
   drivers/iio/adc/ad_sigma_delta.c:455:6: note: Assuming field 'status_app=
ended' is true
           if (sigma_delta->status_appended)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:455:2: note: Taking true branch
           if (sigma_delta->status_appended)
           ^
   drivers/iio/adc/ad_sigma_delta.c:460:2: note: 'Default' branch taken. Ex=
ecution continues on line 485
           switch (reg_size) {
           ^
   drivers/iio/adc/ad_sigma_delta.c:485:6: note: Assuming field 'active_slo=
ts' is not equal to 1
           if (sigma_delta->active_slots =3D=3D 1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad_sigma_delta.c:485:2: note: Taking false branch
           if (sigma_delta->active_slots =3D=3D 1) {
           ^
   drivers/iio/adc/ad_sigma_delta.c:490:19: note: Field 'status_appended' i=
s true
           if (sigma_delta->status_appended) {
                            ^
   drivers/iio/adc/ad_sigma_delta.c:490:2: note: Taking true branch
           if (sigma_delta->status_appended) {
           ^
   drivers/iio/adc/ad_sigma_delta.c:493:23: note: Array subscript is undefi=
ned
                   converted_channel =3D data[status_pos] & sigma_delta->in=
fo->status_ch_mask;
                                       ^    ~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/iio/adc/ad7124.c:165:8: warning: Excessive padding in 'struct ad=
7124_state' (76 padding bytes, where 12 is optimal). =

   Optimal fields order: =

   sd, =

   chip_info, =

   channels, =

   mclk, =

   adc_control, =

   num_channels, =

   cfg_slots_status, =

   vref, =

   live_cfgs_fifo, =

   cfgs_lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad7124_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/adc/ad7124.c:165:8: note: Excessive padding in 'struct ad712=
4_state' (76 padding bytes, where 12 is optimal). Optimal fields order: sd,=
 chip_info, channels, mclk, adc_control, num_channels, cfg_slots_status, vr=
ef, live_cfgs_fifo, cfgs_lock, consider reordering the fields or adding exp=
licit padding members
   struct ad7124_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/net/can/spi/mcp251xfd/mcp251xfd-regmap.c:372:4: warning: Value s=
tored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   drivers/net/can/spi/mcp251xfd/mcp251xfd-regmap.c:372:4: note: Value stor=
ed to 'err' is never read
                           err =3D 0;
                           ^     ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/crypto/sa2ul.c:155:8: warning: Excessive padding in 'struct sa_a=
lg_tmpl' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   alg, =

   type, =

   registered, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct sa_alg_tmpl {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/crypto/sa2ul.c:155:8: note: Excessive padding in 'struct sa_alg_=
tmpl' (11 padding bytes, where 3 is optimal). Optimal fields order: alg, ty=
pe, registered, consider reordering the fields or adding explicit padding m=
embers
   struct sa_alg_tmpl {
   ~~~~~~~^~~~~~~~~~~~~
   drivers/crypto/sa2ul.c:558:10: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
                   *out =3D cpu_to_be32(*((u32 *)iv));
                          ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^

vim +493 drivers/iio/adc/ad_sigma_delta.c

af3008485ea037 Lars-Peter Clausen 2012-08-10  431  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  432  static irqreturn_t ad_sd=
_trigger_handler(int irq, void *p)
af3008485ea037 Lars-Peter Clausen 2012-08-10  433  {
af3008485ea037 Lars-Peter Clausen 2012-08-10  434  	struct iio_poll_func *p=
f =3D p;
af3008485ea037 Lars-Peter Clausen 2012-08-10  435  	struct iio_dev *indio_d=
ev =3D pf->indio_dev;
af3008485ea037 Lars-Peter Clausen 2012-08-10  436  	struct ad_sigma_delta *=
sigma_delta =3D iio_device_get_drvdata(indio_dev);
0fb6ee8d0b5e90 Lars-Peter Clausen 2020-11-24  437  	uint8_t *data =3D sigma=
_delta->rx_buf;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  438  	unsigned int transfer_s=
ize;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  439  	unsigned int sample_siz=
e;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  440  	unsigned int sample_pos;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  441  	unsigned int status_pos;
af3008485ea037 Lars-Peter Clausen 2012-08-10  442  	unsigned int reg_size;
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  443  	unsigned int data_reg;
af3008485ea037 Lars-Peter Clausen 2012-08-10  444  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  445  	reg_size =3D indio_dev-=
>channels[0].scan_type.realbits +
af3008485ea037 Lars-Peter Clausen 2012-08-10  446  			indio_dev->channels[0=
].scan_type.shift;
af3008485ea037 Lars-Peter Clausen 2012-08-10  447  	reg_size =3D DIV_ROUND_=
UP(reg_size, 8);
af3008485ea037 Lars-Peter Clausen 2012-08-10  448  =

f0aef2d0186431 Lars-Peter Clausen 2018-11-13  449  	if (sigma_delta->info->=
data_reg !=3D 0)
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  450  		data_reg =3D sigma_del=
ta->info->data_reg;
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  451  	else
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  452  		data_reg =3D AD_SD_REG=
_DATA;
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  453  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  454  	/* Status word will be =
appended to the sample during transfer */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  455  	if (sigma_delta->status=
_appended)
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  456  		transfer_size =3D reg_=
size + 1;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  457  	else
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  458  		transfer_size =3D reg_=
size;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  459  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  460  	switch (reg_size) {
af3008485ea037 Lars-Peter Clausen 2012-08-10  461  	case 4:
af3008485ea037 Lars-Peter Clausen 2012-08-10  462  	case 2:
af3008485ea037 Lars-Peter Clausen 2012-08-10  463  	case 1:
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  464  		status_pos =3D reg_siz=
e;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  465  		ad_sd_read_reg_raw(sig=
ma_delta, data_reg, transfer_size, &data[0]);
af3008485ea037 Lars-Peter Clausen 2012-08-10  466  		break;
af3008485ea037 Lars-Peter Clausen 2012-08-10  467  	case 3:
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  468  		/*
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  469  		 * Data array after tr=
ansfer will look like (if status is appended):
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  470  		 * data[] =3D { [0][sa=
mple][sample][sample][status] }
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  471  		 * Keeping the first b=
yte 0 shifts the status postion by 1 byte to the right.
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  472  		 */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  473  		status_pos =3D reg_siz=
e + 1;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  474  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  475  		/* We store 24 bit sam=
ples in a 32 bit word. Keep the upper
af3008485ea037 Lars-Peter Clausen 2012-08-10  476  		 * byte set to zero. */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  477  		ad_sd_read_reg_raw(sig=
ma_delta, data_reg, transfer_size, &data[1]);
af3008485ea037 Lars-Peter Clausen 2012-08-10  478  		break;
af3008485ea037 Lars-Peter Clausen 2012-08-10  479  	}
af3008485ea037 Lars-Peter Clausen 2012-08-10  480  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  481  	/*
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  482  	 * For devices sampling=
 only one channel at
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  483  	 * once, there is no ne=
ed for sample number tracking.
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  484  	 */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  485  	if (sigma_delta->active=
_slots =3D=3D 1) {
a1be505f49cacb Lars-Peter Clausen 2013-09-19  486  		iio_push_to_buffers_wi=
th_timestamp(indio_dev, data, pf->timestamp);
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  487  		goto irq_handled;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  488  	}
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  489  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  490  	if (sigma_delta->status=
_appended) {
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  491  		u8 converted_channel;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  492  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22 @493  		converted_channel =3D =
data[status_pos] & sigma_delta->info->status_ch_mask;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  494  		if (converted_channel =
!=3D sigma_delta->slots[sigma_delta->current_slot]) {
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  495  			/*
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  496  			 * Desync occurred du=
ring continuous sampling of multiple channels.
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  497  			 * Drop this incomple=
te sample and start from first channel again.
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  498  			 */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  499  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  500  			sigma_delta->current_=
slot =3D 0;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  501  			goto irq_handled;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  502  		}
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  503  	}
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  504  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  505  	sample_size =3D indio_d=
ev->channels[0].scan_type.storagebits / 8;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  506  	sample_pos =3D sample_s=
ize * sigma_delta->current_slot;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  507  	memcpy(&sigma_delta->sa=
mples_buf[sample_pos], data, sample_size);
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  508  	sigma_delta->current_sl=
ot++;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  509  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  510  	if (sigma_delta->curren=
t_slot =3D=3D sigma_delta->active_slots) {
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  511  		sigma_delta->current_s=
lot =3D 0;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  512  		iio_push_to_buffers_wi=
th_timestamp(indio_dev, sigma_delta->samples_buf,
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  513  						   pf->timestamp);
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  514  	}
af3008485ea037 Lars-Peter Clausen 2012-08-10  515  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  516  irq_handled:
af3008485ea037 Lars-Peter Clausen 2012-08-10  517  	iio_trigger_notify_done=
(indio_dev->trig);
af3008485ea037 Lars-Peter Clausen 2012-08-10  518  	sigma_delta->irq_dis =
=3D false;
af3008485ea037 Lars-Peter Clausen 2012-08-10  519  	enable_irq(sigma_delta-=
>spi->irq);
af3008485ea037 Lars-Peter Clausen 2012-08-10  520  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  521  	return IRQ_HANDLED;
af3008485ea037 Lars-Peter Clausen 2012-08-10  522  }
af3008485ea037 Lars-Peter Clausen 2012-08-10  523  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7987707334430728500==--

