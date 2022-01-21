Content-Type: multipart/mixed; boundary="===============5946874926112399156=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Patch V3] memory: tegra: Add MC error logging on tegra186 onward
Date: Sat, 22 Jan 2022 06:27:03 +0800
Message-ID: <202201220613.9e6ZCZdZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5946874926112399156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <1642763962-32129-1-git-send-email-amhetre@nvidia.com>
References: <1642763962-32129-1-git-send-email-amhetre@nvidia.com>
TO: Ashish Mhetre <amhetre@nvidia.com>
TO: digetx(a)gmail.com
TO: thierry.reding(a)gmail.com
TO: jonathanh(a)nvidia.com
TO: linux-tegra(a)vger.kernel.org
TO: krzysztof.kozlowski(a)canonical.com
TO: linux-kernel(a)vger.kernel.org
CC: Snikam(a)nvidia.com
CC: vdumpa(a)nvidia.com
CC: Ashish Mhetre <amhetre@nvidia.com>

Hi Ashish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on next-20220121]
[cannot apply to v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ashish-Mhetre/memory-tegra=
-Add-MC-error-logging-on-tegra186-onward/20220121-192115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for=
-next
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm-randconfig-c002-20220120 (https://download.01.org/0day-ci/archi=
ve/20220122/202201220613.9e6ZCZdZ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/c76ed3ccfbb800c6a32b27d87=
b2d5464ebdf1918
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ashish-Mhetre/memory-tegra-Add-MC-=
error-logging-on-tegra186-onward/20220121-192115
        git checkout c76ed3ccfbb800c6a32b27d87b2d5464ebdf1918
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ret =3D sdw_slave_set_frequency(slave);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1180:6: note: Assuming field 'class_id' is not e=
qual to 0
           if (!slave->id.class_id)
               ^~~~~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1180:2: note: Taking false branch
           if (!slave->id.class_id)
           ^
   drivers/soundwire/bus.c:1183:6: note: Assuming 'mclk_freq' is not equal =
to 0
           if (!mclk_freq) {
               ^~~~~~~~~~
   drivers/soundwire/bus.c:1183:2: note: Taking false branch
           if (!mclk_freq) {
           ^
   drivers/soundwire/bus.c:1198:6: note: Assuming the condition is true
           if (!(19200000 % mclk_freq)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1198:2: note: Taking true branch
           if (!(19200000 % mclk_freq)) {
           ^
   drivers/soundwire/bus.c:1220:6: note: Assuming the condition is false
           if (mclk_freq % curr_freq) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1220:2: note: Taking false branch
           if (mclk_freq % curr_freq) {
           ^
   drivers/soundwire/bus.c:1233:16: note: '?' condition is false
           scale_index =3D ilog2(scale);
                         ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/soundwire/bus.c:1233:16: note: '?' condition is true
           scale_index =3D ilog2(scale);
                         ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/soundwire/bus.c:1233:16: note: Calling '__ilog2_u32'
           scale_index =3D ilog2(scale);
                         ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1233:16: note: Returning from '__ilog2_u32'
           scale_index =3D ilog2(scale);
                         ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1233:2: note: The value 255 is assigned to 'scal=
e_index'
           scale_index =3D ilog2(scale);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/soundwire/bus.c:1235:6: note: The result of the left shift is un=
defined due to shifting by '255', which is greater or equal to the width of=
 type 'unsigned long'
           if (BIT(scale_index) !=3D scale || scale_index > 6) {
               ^
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   2 warnings generated.
   drivers/media/usb/uvc/uvc_ctrl.c:811:37: warning: The result of the left=
 shift is undefined because the left operand is negative [clang-analyzer-co=
re.UndefinedBinaryOperatorResult]
                   *data =3D (*data & ~mask) | ((value << offset) & mask);
                                               ~~~~~ ^
   drivers/media/usb/uvc/uvc_ctrl.c:803:6: note: Assuming field 'v4l2_type'=
 is equal to V4L2_CTRL_TYPE_BUTTON
           if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_BUTTON)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:803:2: note: Taking true branch
           if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_BUTTON)
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:809:9: note: Assuming 'bits' is > 0
           for (; bits > 0; data++) {
                  ^~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:809:2: note: Loop condition is true.  E=
ntering loop body
           for (; bits > 0; data++) {
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:812:13: note: Assuming 'offset' is 0
                   value >>=3D offset ? offset : 8;
                             ^~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:812:13: note: '?' condition is false
   drivers/media/usb/uvc/uvc_ctrl.c:812:3: note: The value -1 is assigned t=
o 'value'
                   value >>=3D offset ? offset : 8;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:809:9: note: Assuming 'bits' is > 0
           for (; bits > 0; data++) {
                  ^~~~~~~~
   drivers/media/usb/uvc/uvc_ctrl.c:809:2: note: Loop condition is true.  E=
ntering loop body
           for (; bits > 0; data++) {
           ^
   drivers/media/usb/uvc/uvc_ctrl.c:811:37: note: The result of the left sh=
ift is undefined because the left operand is negative
                   *data =3D (*data & ~mask) | ((value << offset) & mask);
                                               ~~~~~ ^
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/memory/tegra/mc.c:564:5: warning: Value stored to 'addr_hi_reg' =
is never read [clang-analyzer-deadcode.DeadStores]
                                   addr_hi_reg =3D MC_ERR_ADR_HI;
                                   ^
   drivers/memory/tegra/mc.c:564:5: note: Value stored to 'addr_hi_reg' is =
never read
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/crypto/gemini/sl3516-ce-core.c:139:28: warning: Dereference of n=
ull pointer [clang-analyzer-core.NullDereference]
           rdd->next_desc.bits.eofie =3D 1;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/crypto/gemini/sl3516-ce-core.c:122:26: note: 'rdd' initialized t=
o a null pointer value
           struct descriptor *dd, *rdd =3D NULL;
                                   ^~~
   drivers/crypto/gemini/sl3516-ce-core.c:131:14: note: Assuming 'i' is >=
=3D field 'nr_sgd'
           for (i =3D 0; i < rctx->nr_sgd; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/crypto/gemini/sl3516-ce-core.c:131:2: note: Loop condition is fa=
lse. Execution continues on line 139
           for (i =3D 0; i < rctx->nr_sgd; i++) {
           ^
   drivers/crypto/gemini/sl3516-ce-core.c:139:28: note: Dereference of null=
 pointer
           rdd->next_desc.bits.eofie =3D 1;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/crypto/gemini/sl3516-ce-cipher.c:26:22: warning: Value stored to=
 'in_sg' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct scatterlist *in_sg =3D areq->src;
                               ^~~~~   ~~~~~~~~~
   drivers/crypto/gemini/sl3516-ce-cipher.c:26:22: note: Value stored to 'i=
n_sg' during its initialization is never read
           struct scatterlist *in_sg =3D areq->src;
                               ^~~~~   ~~~~~~~~~
   drivers/crypto/gemini/sl3516-ce-cipher.c:27:22: warning: Value stored to=
 'out_sg' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct scatterlist *out_sg =3D areq->dst;
                               ^~~~~~   ~~~~~~~~~
   drivers/crypto/gemini/sl3516-ce-cipher.c:27:22: note: Value stored to 'o=
ut_sg' during its initialization is never read
           struct scatterlist *out_sg =3D areq->dst;
                               ^~~~~~   ~~~~~~~~~
   drivers/crypto/gemini/sl3516-ce-cipher.c:364:24: warning: Value stored t=
o 'ce' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct sl3516_ce_dev *ce =3D op->ce;
                                 ^~   ~~~~~~
   drivers/crypto/gemini/sl3516-ce-cipher.c:364:24: note: Value stored to '=
ce' during its initialization is never read
           struct sl3516_ce_dev *ce =3D op->ce;
                                 ^~   ~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/common/tveeprom.c:455:9: warning: Although the value store=
d to 'len' is used in the enclosing expression, the value is never actually=
 read from 'len' [clang-analyzer-deadcode.DeadStores]
           done =3D len =3D beenhere =3D 0;
                  ^     ~~~~~~~~~~~~
   drivers/media/common/tveeprom.c:455:9: note: Although the value stored t=
o 'len' is used in the enclosing expression, the value is never actually re=
ad from 'len'
           done =3D len =3D beenhere =3D 0;
                  ^     ~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/allegro-dvt/allegro-core.c:2107:3: warning: Value=
 stored to 'curr' is never read [clang-analyzer-deadcode.DeadStores]
                   curr +=3D len;
                   ^       ~~~
   drivers/media/platform/allegro-dvt/allegro-core.c:2107:3: note: Value st=
ored to 'curr' is never read
                   curr +=3D len;
                   ^       ~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/staging/fwserial/fwserial.c:275:2: warning: Value stored to 'ava=
il' is never read [clang-analyzer-deadcode.DeadStores]
           avail =3D dma_fifo_avail(&port->tx_fifo);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fwserial/fwserial.c:275:2: note: Value stored to 'avail'=
 is never read
           avail =3D dma_fifo_avail(&port->tx_fifo);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/md/dm-rq.c:163:2: warning: Access to field 'type' results in a d=
ereference of a null pointer (loaded from field 'ti') [clang-analyzer-core.=
NullDereference]
           tio->ti->type->release_clone_rq(clone, NULL);
           ^
   drivers/md/dm-rq.c:259:6: note: Assuming 'clone' is non-null
           if (!clone) {
               ^~~~~~
   drivers/md/dm-rq.c:259:2: note: Taking false branch
           if (!clone) {
           ^

vim +/addr_hi_reg +564 drivers/memory/tegra/mc.c

c76ed3ccfbb800c Ashish Mhetre   2022-01-21  516  =

c76ed3ccfbb800c Ashish Mhetre   2022-01-21  517  irqreturn_t tegra30_mc_han=
dle_irq(int irq, void *data)
891846516317132 Thierry Reding  2014-04-16  518  {
891846516317132 Thierry Reding  2014-04-16  519  	struct tegra_mc *mc =3D d=
ata;
1c74d5c0de0c2cc Dmitry Osipenko 2018-04-09  520  	unsigned long status;
891846516317132 Thierry Reding  2014-04-16  521  	unsigned int bit;
891846516317132 Thierry Reding  2014-04-16  522  =

891846516317132 Thierry Reding  2014-04-16  523  	/* mask all interrupts to=
 avoid flooding */
1c74d5c0de0c2cc Dmitry Osipenko 2018-04-09  524  	status =3D mc_readl(mc, M=
C_INTSTATUS) & mc->soc->intmask;
bf3fbdfbec947cd Dmitry Osipenko 2018-04-09  525  	if (!status)
bf3fbdfbec947cd Dmitry Osipenko 2018-04-09  526  		return IRQ_NONE;
891846516317132 Thierry Reding  2014-04-16  527  =

891846516317132 Thierry Reding  2014-04-16  528  	for_each_set_bit(bit, &st=
atus, 32) {
1079a66bc32ff04 Thierry Reding  2021-06-02  529  		const char *error =3D te=
gra_mc_status_names[bit] ?: "unknown";
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  530  		u32 addr_hi_reg =3D 0, s=
tatus_reg, addr_reg;
891846516317132 Thierry Reding  2014-04-16  531  		const char *client =3D "=
unknown", *desc;
891846516317132 Thierry Reding  2014-04-16  532  		const char *direction, *=
secure;
891846516317132 Thierry Reding  2014-04-16  533  		phys_addr_t addr =3D 0;
891846516317132 Thierry Reding  2014-04-16  534  		unsigned int i;
891846516317132 Thierry Reding  2014-04-16  535  		char perm[7];
891846516317132 Thierry Reding  2014-04-16  536  		u8 id, type;
891846516317132 Thierry Reding  2014-04-16  537  		u32 value;
891846516317132 Thierry Reding  2014-04-16  538  =

c76ed3ccfbb800c Ashish Mhetre   2022-01-21  539  		switch (bit) {
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  540  		case MC_INT_DECERR_VPR:
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  541  			status_reg =3D MC_ERR_V=
PR_STATUS;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  542  			addr_reg =3D MC_ERR_VPR=
_ADR;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  543  			break;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  544  		case MC_INT_SECERR_SEC:
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  545  			status_reg =3D MC_ERR_S=
EC_STATUS;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  546  			addr_reg =3D MC_ERR_SEC=
_ADR;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  547  			break;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  548  		case MC_INT_DECERR_MTS:
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  549  			status_reg =3D MC_ERR_M=
TS_STATUS;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  550  			addr_reg =3D MC_ERR_MTS=
_ADR;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  551  			break;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  552  		case MC_INT_DECERR_GENER=
ALIZED_CARVEOUT:
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  553  			status_reg =3D MC_ERR_G=
ENERALIZED_CARVEOUT_STATUS;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  554  			addr_reg =3D MC_ERR_GEN=
ERALIZED_CARVEOUT_ADR;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  555  			break;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  556  		case MC_INT_DECERR_ROUTE=
_SANITY:
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  557  			status_reg =3D MC_ERR_R=
OUTE_SANITY_STATUS;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  558  			addr_reg =3D MC_ERR_ROU=
TE_SANITY_ADR;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  559  			break;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  560  		default:
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  561  			status_reg =3D MC_ERR_S=
TATUS;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  562  			addr_reg =3D MC_ERR_ADR;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  563  			if (mc->soc->has_addr_h=
i_reg)
c76ed3ccfbb800c Ashish Mhetre   2022-01-21 @564  				addr_hi_reg =3D MC_ERR=
_ADR_HI;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  565  			break;
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  566  		}
c76ed3ccfbb800c Ashish Mhetre   2022-01-21  567  =

c76ed3ccfbb800c Ashish Mhetre   2022-01-21  568  		value =3D mc_readl(mc, s=
tatus_reg);
891846516317132 Thierry Reding  2014-04-16  569  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5946874926112399156==--

