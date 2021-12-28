Content-Type: multipart/mixed; boundary="===============6493820968223996878=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/8] phy: qcom-qmp: Register typec mux and orientation switch
Date: Wed, 29 Dec 2021 07:59:44 +0800
Message-ID: <202112290722.EHAx7G1v-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6493820968223996878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211228052116.1748443-3-bjorn.andersson@linaro.org>
References: <20211228052116.1748443-3-bjorn.andersson@linaro.org>
TO: Bjorn Andersson <bjorn.andersson@linaro.org>

Hi Bjorn,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next driver-core/driver-core-testing l=
inus/master v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bjorn-Andersson/typec-mux-=
Introduce-support-for-multiple-TypeC-muxes/20211228-132045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-randconfig-c006-20211228 (https://download.01.org/0day-ci/arc=
hive/20211229/202112290722.EHAx7G1v-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af=
744543433ac75b232eb7dfdaef7efd4d7a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/db0b002b5b2e1055b2df7b430=
438335a75dc1557
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bjorn-Andersson/typec-mux-Introduc=
e-support-for-multiple-TypeC-muxes/20211228-132045
        git checkout db0b002b5b2e1055b2df7b430438335a75dc1557
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                   ^~~~~~~~=
~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5986:2: note: Loop condition is fals=
e. Execution continues on line 5991
           for_each_available_child_of_node(dev->of_node, child) {
           ^
   include/linux/of.h:1305:2: note: expanded from macro 'for_each_available=
_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5991:6: note: Assuming 'num' is <=3D=
 'expected_phys'
           if (num > expected_phys)
               ^~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5991:2: note: Taking false branch
           if (num > expected_phys)
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5994:14: note: Calling 'devm_kcalloc'
           qmp->phys =3D devm_kcalloc(dev, num, sizeof(*qmp->phys), GFP_KER=
NEL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/device.h:223:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:215:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/device.h:218:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc(dev, bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:223:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5994:14: note: Returning from 'devm_=
kcalloc'
           qmp->phys =3D devm_kcalloc(dev, num, sizeof(*qmp->phys), GFP_KER=
NEL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5995:6: note: Assuming field 'phys' =
is non-null
           if (!qmp->phys)
               ^~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5995:2: note: Taking false branch
           if (!qmp->phys)
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:6007:49: note: Assuming 'child' is n=
ot equal to null
           for_each_available_child_of_node(dev->of_node, child) {
                                                          ^
   include/linux/of.h:1305:58: note: expanded from macro 'for_each_availabl=
e_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
                                                                   ^~~~~~~~=
~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:6007:2: note: Loop condition is true=
.  Entering loop body
           for_each_available_child_of_node(dev->of_node, child) {
           ^
   include/linux/of.h:1305:2: note: expanded from macro 'for_each_available=
_child_of_node'
           for (child =3D of_get_next_available_child(parent, NULL); child =
!=3D NULL; \
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:6008:7: note: Assuming the condition=
 is true
                   if (of_node_name_eq(child, "dp-phy")) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:6008:3: note: Taking true branch
                   if (of_node_name_eq(child, "dp-phy")) {
                   ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:6009:4: note: Null pointer value sto=
red to 'cfg'
                           cfg =3D dp_cfg;
                           ^~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:6016:7: note: Assuming the condition=
 is false
                   if (of_node_name_eq(child, "port"))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:6016:3: note: Taking false branch
                   if (of_node_name_eq(child, "port"))
                   ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:6020:53: note: Passing null pointer =
value via 5th parameter 'cfg'
                   ret =3D qcom_qmp_phy_create(dev, child, id, serdes, cfg);
                                                                     ^~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:6020:9: note: Calling 'qcom_qmp_phy_=
create'
                   ret =3D qcom_qmp_phy_create(dev, child, id, serdes, cfg);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5534:6: note: Assuming 'qphy' is non=
-null
           if (!qphy)
               ^~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5534:2: note: Taking false branch
           if (!qphy)
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5546:6: note: Assuming field 'tx' is=
 non-null
           if (!qphy->tx)
               ^~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5546:2: note: Taking false branch
           if (!qphy->tx)
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5550:6: note: Assuming field 'rx' is=
 non-null
           if (!qphy->rx)
               ^~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5550:2: note: Taking false branch
           if (!qphy->rx)
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5554:6: note: Assuming field 'pcs' i=
s non-null
           if (!qphy->pcs)
               ^~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5554:2: note: Taking false branch
           if (!qphy->pcs)
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5563:6: note: Access to field 'is_du=
al_lane_phy' results in a dereference of a null pointer (loaded from variab=
le 'cfg')
           if (cfg->is_dual_lane_phy) {
               ^~~
>> drivers/phy/qualcomm/phy-qcom-qmp.c:5833:6: warning: Branch condition ev=
aluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (dp_mode)
               ^~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5804:2: note: 'dp_mode' declared wit=
hout an initial value
           bool dp_mode;
           ^~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5807:2: note: 'Default' branch taken=
. Execution continues on line 5831
           switch (state->mode) {
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5833:6: note: Branch condition evalu=
ates to a garbage value
           if (dp_mode)
               ^~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:6031:7: warning: Access to field 'ty=
pe' results in a dereference of a null pointer (loaded from variable 'cfg')=
 [clang-analyzer-core.NullDereference]
                   if (cfg->type =3D=3D PHY_TYPE_USB3 || cfg->type =3D=3D P=
HY_TYPE_PCIE) {
                       ^~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5911:2: note: 'dp_cfg' initialized t=
o a null pointer value
           const struct qmp_phy_cfg *dp_cfg =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5916:6: note: Assuming 'qmp' is non-=
null
           if (!qmp)
               ^~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5916:2: note: Taking false branch
           if (!qmp)
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5920:2: note: Calling 'dev_set_drvda=
ta'
           dev_set_drvdata(dev, qmp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:692:1: note: Returning without writing to 'data->=
phys', which participates in a condition later
   }
   ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5920:2: note: Returning from 'dev_se=
t_drvdata'
           dev_set_drvdata(dev, qmp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5924:6: note: Assuming 'cfg' is non-=
null
           if (!cfg) {
               ^~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5924:2: note: Taking false branch
           if (!cfg) {
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5941:6: note: Calling 'IS_ERR'
           if (IS_ERR(serdes))
               ^~~~~~~~~~~~~~
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
   drivers/phy/qualcomm/phy-qcom-qmp.c:5941:6: note: Returning from 'IS_ERR'
           if (IS_ERR(serdes))
               ^~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5941:2: note: Taking false branch
           if (IS_ERR(serdes))
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5945:6: note: 'combo_cfg' is null
           if (combo_cfg || cfg->has_phy_dp_com_ctrl) {
               ^~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5945:6: note: Left side of '||' is f=
alse
   drivers/phy/qualcomm/phy-qcom-qmp.c:5945:19: note: Assuming field 'has_p=
hy_dp_com_ctrl' is true
           if (combo_cfg || cfg->has_phy_dp_com_ctrl) {
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5945:2: note: Taking true branch
           if (combo_cfg || cfg->has_phy_dp_com_ctrl) {
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5947:7: note: Calling 'IS_ERR'
                   if (IS_ERR(qmp->dp_com))
                       ^~~~~~~~~~~~~~~~~~~
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
   drivers/phy/qualcomm/phy-qcom-qmp.c:5947:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(qmp->dp_com))
                       ^~~~~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5947:3: note: Taking false branch
                   if (IS_ERR(qmp->dp_com))
                   ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5951:6: note: 'combo_cfg' is null
           if (combo_cfg) {
               ^~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp.c:5951:2: note: Taking false branch
           if (combo_cfg) {
           ^
   drivers/phy/qualcomm/phy-qcom-qmp.c:5963:2: note: Loop condition is fals=
e.  Exiting loop
           mutex_init(&qmp->phy_mutex);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'

vim +5833 drivers/phy/qualcomm/phy-qcom-qmp.c

db0b002b5b2e10 Bjorn Andersson 2021-12-27  5798  =

db0b002b5b2e10 Bjorn Andersson 2021-12-27  5799  static int qcom_qmp_phy_ty=
pec_mux_set(struct typec_mux *mux,
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5800  				      struct typec_mux=
_state *state)
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5801  {
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5802  	struct qcom_qmp *qmp =3D =
typec_mux_get_drvdata(mux);
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5803  	void __iomem *dp_com =3D =
qmp->dp_com;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5804  	bool dp_mode;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5805  	bool usb_mode;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5806  =

db0b002b5b2e10 Bjorn Andersson 2021-12-27  5807  	switch (state->mode) {
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5808  	case TYPEC_STATE_SAFE:
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5809  	case TYPEC_STATE_USB:
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5810  		/*
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5811  		 * TODO: Figure out if w=
e should clear DP_MODE when we enter a
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5812  		 * USB-only state.
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5813  		 */
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5814  		dp_mode =3D true;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5815  		usb_mode =3D true;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5816  		break;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5817  	case TYPEC_DP_STATE_A:
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5818  	case TYPEC_DP_STATE_C:
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5819  	case TYPEC_DP_STATE_E:
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5820  		dp_mode =3D true;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5821  		usb_mode =3D false;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5822  		break;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5823  	case TYPEC_DP_STATE_B:
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5824  	case TYPEC_DP_STATE_D:
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5825  	case TYPEC_DP_STATE_F:
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5826  		dp_mode =3D true;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5827  		usb_mode =3D true;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5828  		break;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5829  	}
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5830  =

db0b002b5b2e10 Bjorn Andersson 2021-12-27  5831  	qphy_setbits(dp_com, QPHY=
_V3_DP_COM_RESET_OVRD_CTRL,
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5832  		     SW_DPPHY_RESET_MUX =
| SW_USB3PHY_RESET_MUX);
db0b002b5b2e10 Bjorn Andersson 2021-12-27 @5833  	if (dp_mode)
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5834  		qphy_setbits(dp_com, QPH=
Y_V3_DP_COM_PHY_MODE_CTRL, DP_MODE);
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5835  	else
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5836  		qphy_clrbits(dp_com, QPH=
Y_V3_DP_COM_PHY_MODE_CTRL, DP_MODE);
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5837  =

db0b002b5b2e10 Bjorn Andersson 2021-12-27  5838  	if (usb_mode)
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5839  		qphy_setbits(dp_com, QPH=
Y_V3_DP_COM_PHY_MODE_CTRL, USB3_MODE);
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5840  	else
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5841  		qphy_clrbits(dp_com, QPH=
Y_V3_DP_COM_PHY_MODE_CTRL, USB3_MODE);
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5842  =

db0b002b5b2e10 Bjorn Andersson 2021-12-27  5843  	qphy_setbits(dp_com, QPHY=
_V3_DP_COM_SW_RESET, SW_RESET);
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5844  	qphy_clrbits(dp_com, QPHY=
_V3_DP_COM_SWI_CTRL, 0x03);
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5845  	qphy_clrbits(dp_com, QPHY=
_V3_DP_COM_SW_RESET, SW_RESET);
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5846  =

db0b002b5b2e10 Bjorn Andersson 2021-12-27  5847  	return 0;
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5848  }
db0b002b5b2e10 Bjorn Andersson 2021-12-27  5849  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6493820968223996878==--

