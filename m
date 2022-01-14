Content-Type: multipart/mixed; boundary="===============8472271645008100294=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7777/12279] sound/soc/codecs/tlv320adc3xxx.c:416:8: warning: Excessive padding in 'struct adc3xxx_rate_divs' (4 padding bytes, where 0 is optimal).
Date: Fri, 14 Jan 2022 18:44:50 +0800
Message-ID: <202201141842.uUtbYUDQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8472271645008100294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ricard Wanderlof <ricardw@axis.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   468c1d50222ce9439c9835e00ab55ae9ced389fb
commit: e9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50 [7777/12279] ASoC: codec: =
tlv320adc3xxx: New codec driver
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220111 (https://download.01.org/0day-ci/archi=
ve/20220114/202201141842.uUtbYUDQ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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
   drivers/md/dm-rq.c:268:6: note: Assuming the condition is false
           if (rq->rq_flags & RQF_FAILED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-rq.c:268:2: note: Taking false branch
           if (rq->rq_flags & RQF_FAILED)
           ^
   drivers/md/dm-rq.c:271:2: note: Calling 'dm_done'
           dm_done(clone, tio->error, mapped);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-rq.c:209:6: note: Assuming field 'ti' is null
           if (tio->ti) {
               ^~~~~~~
   drivers/md/dm-rq.c:209:2: note: Taking false branch
           if (tio->ti) {
           ^
   drivers/md/dm-rq.c:216:15: note: Assuming 'error' is not equal to 5
           if (unlikely(error =3D=3D BLK_STS_TARGET)) {
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/md/dm-rq.c:216:15: note: 'error' is not equal to 5
           if (unlikely(error =3D=3D BLK_STS_TARGET)) {
                        ^
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   drivers/md/dm-rq.c:216:2: note: Taking false branch
           if (unlikely(error =3D=3D BLK_STS_TARGET)) {
           ^
   drivers/md/dm-rq.c:228:2: note: Control jumps to 'case 0:'  at line 229
           switch (r) {
           ^
   drivers/md/dm-rq.c:231:3: note: Calling 'dm_end_request'
                   dm_end_request(clone, error);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-rq.c:163:2: note: Access to field 'type' results in a dere=
ference of a null pointer (loaded from field 'ti')
           tio->ti->type->release_clone_rq(clone, NULL);
           ^    ~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> sound/soc/codecs/tlv320adc3xxx.c:416:8: warning: Excessive padding in 's=
truct adc3xxx_rate_divs' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   mclk, =

   rate, =

   pll_d, =

   pll_p, =

   pll_r, =

   pll_j, =

   nadc, =

   madc, =

   aosr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adc3xxx_rate_divs {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tlv320adc3xxx.c:416:8: note: Excessive padding in 'stru=
ct adc3xxx_rate_divs' (4 padding bytes, where 0 is optimal). Optimal fields=
 order: mclk, rate, pll_d, pll_p, pll_r, pll_j, nadc, madc, aosr, consider =
reordering the fields or adding explicit padding members
   struct adc3xxx_rate_divs {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/soc/fsl/fsl_asrc.c:959:17: warning: Value stored to 'dev' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &asrc->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_asrc.c:959:17: note: Value stored to 'dev' during its =
initialization is never read
           struct device *dev =3D &asrc->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   drivers/target/target_core_rd.c:95:2: warning: Value stored to 'page_cou=
nt' is never read [clang-analyzer-deadcode.DeadStores]
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_table_arr=
ay,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_rd.c:95:2: note: Value stored to 'page_count'=
 is never read
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_table_arr=
ay,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_rd.c:221:2: warning: Value stored to 'page_co=
unt' is never read [clang-analyzer-deadcode.DeadStores]
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_prot_arra=
y,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_rd.c:221:2: note: Value stored to 'page_count=
' is never read
           page_count =3D rd_release_sgl_table(rd_dev, rd_dev->sg_prot_arra=
y,
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/target/target_core_stat.c:226:5: warning: Null pointer passed as=
 1st argument to string length function [clang-analyzer-unix.cstring.NullAr=
g]
                           (strlen(dev->t10_wwn.unit_serial)) ?
                            ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_stat.c:226:5: note: Null pointer passed as 1s=
t argument to string length function
                           (strlen(dev->t10_wwn.unit_serial)) ?
                            ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/ata/libata-core.c:92:8: warning: Excessive padding in 'struct at=
a_force_param' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   xfer_mask, =

   horkage_on, =

   horkage_off, =

   lflags, =

   cbl, =

   spd_limit, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ata_force_param {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:92:8: note: Excessive padding in 'struct ata_f=
orce_param' (4 padding bytes, where 0 is optimal). Optimal fields order: na=
me, xfer_mask, horkage_on, horkage_off, lflags, cbl, spd_limit, consider re=
ordering the fields or adding explicit padding members
   struct ata_force_param {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:5570:18: warning: Access to field 'pio_mask' r=
esults in a dereference of a null pointer (loaded from variable 'pi') [clan=
g-analyzer-core.NullDereference]
                   ap->pio_mask =3D pi->pio_mask;
                                  ^~
   drivers/ata/libata-core.c:5561:6: note: Assuming 'host' is non-null
           if (!host)
               ^~~~~
   drivers/ata/libata-core.c:5561:2: note: Taking false branch
           if (!host)
           ^
   drivers/ata/libata-core.c:5564:21: note: Null pointer value stored to 'p=
i'
           for (i =3D 0, j =3D 0, pi =3D NULL; i < host->n_ports; i++) {
                              ^~~~~~~~~
   drivers/ata/libata-core.c:5564:32: note: Assuming 'i' is < field 'n_port=
s'
           for (i =3D 0, j =3D 0, pi =3D NULL; i < host->n_ports; i++) {
                                         ^~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:5564:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0, j =3D 0, pi =3D NULL; i < host->n_ports; i++) {
           ^
--
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   drivers/media/v4l2-core/v4l2-async.c:447:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D
                          ^~~
   drivers/media/v4l2-core/v4l2-async.c:447:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D
                          ^~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   sound/soc/codecs/tas2562.c:69:23: warning: Value stored to 'tas2562' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tas2562_data *tas2562 =3D
                                ^~~~~~~
   sound/soc/codecs/tas2562.c:69:23: note: Value stored to 'tas2562' during=
 its initialization is never read
           struct tas2562_data *tas2562 =3D
                                ^~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> sound/soc/codecs/tlv320adc3xxx.c:416:8: warning: Excessive padding in 's=
truct adc3xxx_rate_divs' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   mclk, =

   rate, =

   pll_d, =

   pll_p, =

   pll_r, =

   pll_j, =

   nadc, =

   madc, =

   aosr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adc3xxx_rate_divs {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tlv320adc3xxx.c:416:8: note: Excessive padding in 'stru=
ct adc3xxx_rate_divs' (4 padding bytes, where 0 is optimal). Optimal fields=
 order: mclk, rate, pll_d, pll_p, pll_r, pll_j, nadc, madc, aosr, consider =
reordering the fields or adding explicit padding members
   struct adc3xxx_rate_divs {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/ata/pdc_adma.c:356:2: warning: Value stored to 'i' is never read=
 [clang-analyzer-deadcode.DeadStores]
           i =3D adma_fill_sg(qc);
           ^   ~~~~~~~~~~~~~~~~
   drivers/ata/pdc_adma.c:356:2: note: Value stored to 'i' is never read
           i =3D adma_fill_sg(qc);
           ^   ~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/ata/sata_sx4.c:1326:8: warning: Although the value stored to 'sp=
eed' is used in the enclosing expression, the value is never actually read =
from 'speed' [clang-analyzer-deadcode.DeadStores]
           if (!(speed =3D pdc20621_detect_dimm(host))) {
                 ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/sata_sx4.c:1326:8: note: Although the value stored to 'speed=
' is used in the enclosing expression, the value is never actually read fro=
m 'speed'
           if (!(speed =3D pdc20621_detect_dimm(host))) {
                 ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mmc/host/via-sdmmc.c:334:16: warning: Value stored to 'addrbase'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           void __iomem *addrbase =3D host->sdhc_mmiobase;
                         ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/via-sdmmc.c:334:16: note: Value stored to 'addrbase' du=
ring its initialization is never read
           void __iomem *addrbase =3D host->sdhc_mmiobase;
                         ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/via-sdmmc.c:353:16: warning: Value stored to 'addrbase'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           void __iomem *addrbase =3D host->pcictrl_mmiobase;
                         ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/via-sdmmc.c:353:16: note: Value stored to 'addrbase' du=
ring its initialization is never read
           void __iomem *addrbase =3D host->pcictrl_mmiobase;
                         ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/ext4/super.c:4974:4: warning: Value stored to 'descr' is never read [=
clang-analyzer-deadcode.DeadStores]
                           descr =3D " journalled data mode";
                           ^       ~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/super.c:4974:4: note: Value stored to 'descr' is never read
                           descr =3D " journalled data mode";
                           ^       ~~~~~~~~~~~~~~~~~~~~~~~

vim +416 sound/soc/codecs/tlv320adc3xxx.c

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  415  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15 @416  struct adc3xxx_rate_divs {
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  417  	u32 mclk;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  418  	u32 rate;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  419  	u8 pll_p;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  420  	u8 pll_r;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  421  	u8 pll_j;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  422  	u16 pll_d;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  423  	u8 nadc;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  424  	u8 madc;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  425  	u8 aosr;
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  426  };
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  427  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8472271645008100294==--

