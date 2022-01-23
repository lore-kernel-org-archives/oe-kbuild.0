Content-Type: multipart/mixed; boundary="===============8272205137634725865=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/interconnect/qcom/icc-rpm.c:159:24: warning: Value stored to 'qn' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 23 Jan 2022 08:55:27 +0800
Message-ID: <202201230858.lsu9Ei0f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8272205137634725865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Georgi Djakov <djakov@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1c52283265a462a100ae63ddf58b4e5884acde86
commit: 2b6c7d645118cba7719f16f3b0e4d4a555776f48 interconnect: sdm660: merg=
e common code into icc-rpm
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220117 (https://download.01.org/0day-ci/archi=
ve/20220123/202201230858.lsu9Ei0f-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c10cbb=
243cafc0cf42c3e922cb29183279444432)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2b6c7d645118cba7719f16f3b0e4d4a555776f48
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2b6c7d645118cba7719f16f3b0e4d4a555776f48
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/iio/adc/meson_saradc.c:1272:2: note: Taking false branch
           if (IS_ERR(priv->vref)) {
           ^
   drivers/iio/adc/meson_saradc.c:1279:6: note: Assuming field 'temperature=
_trimming_bits' is 0
           if (priv->param->temperature_trimming_bits) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1279:2: note: Taking false branch
           if (priv->param->temperature_trimming_bits) {
           ^
   drivers/iio/adc/meson_saradc.c:1285:6: note: Assuming field 'temperature=
_sensor_calibrated' is false
           if (priv->temperature_sensor_calibrated) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1285:2: note: Taking false branch
           if (priv->temperature_sensor_calibrated) {
           ^
   drivers/iio/adc/meson_saradc.c:1296:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:1296:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:1300:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:1300:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:1303:8: note: Calling 'meson_sar_adc_cali=
b'
           ret =3D meson_sar_adc_calib(indio_dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1027:31: note: 'value0' declared without =
an initial value
           int ret, nominal0, nominal1, value0, value1;
                                        ^~~~~~
   drivers/iio/adc/meson_saradc.c:1035:8: note: Calling 'meson_sar_adc_get_=
sample'
           ret =3D meson_sar_adc_get_sample(indio_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:555:6: note: Assuming field 'type' is equ=
al to IIO_TEMP
           if (chan->type =3D=3D IIO_TEMP && !priv->temperature_sensor_cali=
brated)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:555:6: note: Left side of '&&' is true
   drivers/iio/adc/meson_saradc.c:555:32: note: Assuming field 'temperature=
_sensor_calibrated' is true
           if (chan->type =3D=3D IIO_TEMP && !priv->temperature_sensor_cali=
brated)
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/iio/adc/meson_saradc.c:555:2: note: Taking false branch
           if (chan->type =3D=3D IIO_TEMP && !priv->temperature_sensor_cali=
brated)
           ^
   drivers/iio/adc/meson_saradc.c:559:6: note: Assuming 'ret' is not equal =
to 0
           if (ret)
               ^~~
   drivers/iio/adc/meson_saradc.c:559:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/adc/meson_saradc.c:560:3: note: Returning without writing to=
 '*val'
                   return ret;
                   ^
   drivers/iio/adc/meson_saradc.c:1035:8: note: Returning from 'meson_sar_a=
dc_get_sample'
           ret =3D meson_sar_adc_get_sample(indio_dev,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/meson_saradc.c:1038:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/adc/meson_saradc.c:1038:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/adc/meson_saradc.c:1046:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/iio/adc/meson_saradc.c:1046:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/adc/meson_saradc.c:1049:13: note: The right operand of '<=3D=
' is a garbage value
           if (value1 <=3D value0) {
                      ^  ~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   5 warnings generated.
   drivers/interconnect/qcom/msm8974.c:631:4: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   drivers/interconnect/qcom/msm8974.c:631:4: note: Value stored to 'ret' i=
s never read
                           ret =3D 0;
                           ^     ~
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
   5 warnings generated.
>> drivers/interconnect/qcom/icc-rpm.c:159:24: warning: Value stored to 'qn=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct qcom_icc_node *qn =3D node->data;
                                 ^~   ~~~~~~~~~~
   drivers/interconnect/qcom/icc-rpm.c:159:24: note: Value stored to 'qn' d=
uring its initialization is never read
           struct qcom_icc_node *qn =3D node->data;
                                 ^~   ~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/rapidio/rio.c:1103:3: warning: Value stored to 'far_linkstat' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   far_linkstat =3D regval & RIO_PORT_N_MNT_RSP_LSTAT;
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rapidio/rio.c:1103:3: note: Value stored to 'far_linkstat' is ne=
ver read
                   far_linkstat =3D regval & RIO_PORT_N_MNT_RSP_LSTAT;
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   5 warnings generated.
   drivers/gpu/host1x/cdma.c:604:15: warning: Value stored to 'space' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/cdma.c:604:15: note: Value stored to 'space' during i=
ts initialization is never read
           unsigned int space =3D cdma->slots_free;
                        ^~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/host1x/job.c:213:35: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^
   drivers/gpu/host1x/job.c:639:8: note: Calling 'pin_job'
           err =3D pin_job(host, job);
                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:148:14: note: Assuming 'i' is < field 'num_relo=
cs'
           for (i =3D 0; i < job->num_relocs; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:148:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < job->num_relocs; i++) {
           ^
   drivers/gpu/host1x/job.c:150:14: note: 'phys_addr' declared without an i=
nitial value
                   dma_addr_t phys_addr, *phys;
                              ^~~~~~~~~
   drivers/gpu/host1x/job.c:153:7: note: Assuming field 'bo' is non-null
                   if (!reloc->target.bo) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:153:3: note: Taking false branch
                   if (!reloc->target.bo) {
                   ^
   drivers/gpu/host1x/job.c:170:7: note: Assuming 'domain' is non-null
                   if (!domain || client->group)
                       ^~~~~~~
   drivers/gpu/host1x/job.c:170:7: note: Left side of '||' is false
   drivers/gpu/host1x/job.c:170:18: note: Assuming field 'group' is null
                   if (!domain || client->group)
                                  ^~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:170:3: note: Taking false branch
                   if (!domain || client->group)
                   ^
   drivers/gpu/host1x/job.c:176:7: note: Calling 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:176:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   drivers/gpu/host1x/job.c:176:3: note: Taking false branch
                   if (IS_ERR(sgt)) {
                   ^
   drivers/gpu/host1x/job.c:181:7: note: Assuming 'sgt' is null
                   if (sgt) {
                       ^~~
   drivers/gpu/host1x/job.c:181:3: note: Taking false branch

vim +/qn +159 drivers/interconnect/qcom/icc-rpm.c

2b6c7d645118cb Dmitry Baryshkov 2021-09-04  155  =

2b6c7d645118cb Dmitry Baryshkov 2021-09-04  156  static int qcom_icc_qos_se=
t(struct icc_node *node, u64 sum_bw)
2b6c7d645118cb Dmitry Baryshkov 2021-09-04  157  {
2b6c7d645118cb Dmitry Baryshkov 2021-09-04  158  	struct qcom_icc_provider =
*qp =3D to_qcom_provider(node->provider);
2b6c7d645118cb Dmitry Baryshkov 2021-09-04 @159  	struct qcom_icc_node *qn =
=3D node->data;
2b6c7d645118cb Dmitry Baryshkov 2021-09-04  160  =

2b6c7d645118cb Dmitry Baryshkov 2021-09-04  161  	dev_dbg(node->provider->d=
ev, "Setting QoS for %s\n", qn->name);
2b6c7d645118cb Dmitry Baryshkov 2021-09-04  162  =

2b6c7d645118cb Dmitry Baryshkov 2021-09-04  163  	if (qp->is_bimc_node)
2b6c7d645118cb Dmitry Baryshkov 2021-09-04  164  		return qcom_icc_set_bimc=
_qos(node, sum_bw);
2b6c7d645118cb Dmitry Baryshkov 2021-09-04  165  =

2b6c7d645118cb Dmitry Baryshkov 2021-09-04  166  	return qcom_icc_set_noc_q=
os(node, sum_bw);
2b6c7d645118cb Dmitry Baryshkov 2021-09-04  167  }
2b6c7d645118cb Dmitry Baryshkov 2021-09-04  168  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8272205137634725865==--

