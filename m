Content-Type: multipart/mixed; boundary="===============5548876061174455729=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1471/4996] drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1701:19: warning: Value stored to 'qmp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 23 Jun 2022 08:25:51 +0800
Message-ID: <202206230822.REdWhiJx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5548876061174455729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/p=
hy/qualcomm/phy-qcom-qmp-combo.c:1701:19: warning: Value stored to 'qmp' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ac0ba5454ca85162c08dc429fef1999e077ca976
commit: 6066bac15bc61ccebb00194e507bbcf6991d2eb1 [1471/4996] phy: qcom-qmp-=
combo: cleanup the driver
:::::: branch date: 17 hours ago
:::::: commit date: 13 days ago
config: riscv-randconfig-c006-20220617 (https://download.01.org/0day-ci/arc=
hive/20220623/202206230822.REdWhiJx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6066bac15bc61ccebb00194e507bbcf6991d2eb1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6066bac15bc61ccebb00194e507bbcf6991d2eb1
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   drivers/media/dvb-frontends/bcm3510.c:226:2: note: Taking false branch
           deb_hab("\n");
           ^
   drivers/media/dvb-frontends/bcm3510.c:78:27: note: expanded from macro '=
deb_hab'
   #define deb_hab(args...)  dprintk(0x04,args)
                             ^
   drivers/media/dvb-frontends/bcm3510.c:70:29: note: expanded from macro '=
dprintk'
   #define dprintk(level,x...) if (level & debug) printk(x)
                               ^
   drivers/media/dvb-frontends/bcm3510.c:228:6: note: Assuming the conditio=
n is true
           if (mutex_lock_interruptible(&st->hab_mutex) < 0)
               ^
   include/linux/mutex.h:188:40: note: expanded from macro 'mutex_lock_inte=
rruptible'
   #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(l=
ock, 0)
                                          ^
   drivers/media/dvb-frontends/bcm3510.c:228:2: note: Taking true branch
           if (mutex_lock_interruptible(&st->hab_mutex) < 0)
           ^
   drivers/media/dvb-frontends/bcm3510.c:664:2: note: Returning from 'bcm35=
10_do_hab_cmd'
           bcm3510_do_hab_cmd(st,CMD_GET_VERSION_INFO,MSGID_GET_VERSION_INF=
O,NULL,0,(u8*)&ver,sizeof(ver));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/bcm3510.c:666:2: note: Assuming the conditio=
n is false
           deb_info("Version information: 0x%02x 0x%02x 0x%02x 0x%02x\n",
           ^
   drivers/media/dvb-frontends/bcm3510.c:76:35: note: expanded from macro '=
deb_info'
   #define deb_info(args...) dprintk(0x01,args)
                             ~~~~~~~~^~~~~~~~~~
   drivers/media/dvb-frontends/bcm3510.c:70:33: note: expanded from macro '=
dprintk'
   #define dprintk(level,x...) if (level & debug) printk(x)
                                   ^~~~~~~~~~~~~
   drivers/media/dvb-frontends/bcm3510.c:666:2: note: Taking false branch
           deb_info("Version information: 0x%02x 0x%02x 0x%02x 0x%02x\n",
           ^
   drivers/media/dvb-frontends/bcm3510.c:76:27: note: expanded from macro '=
deb_info'
   #define deb_info(args...) dprintk(0x01,args)
                             ^
   drivers/media/dvb-frontends/bcm3510.c:70:29: note: expanded from macro '=
dprintk'
   #define dprintk(level,x...) if (level & debug) printk(x)
                               ^
   drivers/media/dvb-frontends/bcm3510.c:669:25: note: The left operand of =
'=3D=3D' is a garbage value
           if (ver.script_version =3D=3D BCM3510_DEF_SCRIPT_VERSION &&
               ~~~~~~~~~~~~~~~~~~ ^
   drivers/media/dvb-frontends/bcm3510.c:785:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&c,0,1);
           ^~~~~~
   drivers/media/dvb-frontends/bcm3510.c:785:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&c,0,1);
           ^~~~~~
   drivers/media/dvb-frontends/bcm3510.c:813:2: warning: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&state->frontend.ops, &bcm3510_ops, sizeof(struct dvb_fro=
ntend_ops));
           ^~~~~~
   drivers/media/dvb-frontends/bcm3510.c:813:2: note: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&state->frontend.ops, &bcm3510_ops, sizeof(struct dvb_fro=
ntend_ops));
           ^~~~~~
   drivers/media/dvb-frontends/bcm3510.c:818:7: warning: Although the value=
 stored to 'ret' is used in the enclosing expression, the value is never ac=
tually read from 'ret' [clang-analyzer-deadcode.DeadStores]
           if ((ret =3D bcm3510_readB(state,0xe0,&v)) < 0)
                ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/bcm3510.c:818:7: note: Although the value st=
ored to 'ret' is used in the enclosing expression, the value is never actua=
lly read from 'ret'
           if ((ret =3D bcm3510_readB(state,0xe0,&v)) < 0)
                ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1563:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
           ^~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1563:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&qphy->dp_opts, dp_opts, sizeof(*dp_opts));
           ^~~~~~
>> drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1701:19: warning: Value stored=
 to 'qmp' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1701:19: note: Value stored to=
 'qmp' during its initialization is never read
           struct qcom_qmp *qmp =3D qphy->qmp;
                            ^~~   ~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2259:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2259:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2267:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->de=
v));
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2267:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->de=
v));
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2375:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qmp-combo.c:2375:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
           ^~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/of/dynamic.c:240:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:240:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:293:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:293:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(&rd, 0, sizeof(rd));
           ^~~~~~
   drivers/of/dynamic.c:508:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rce, ce, sizeof(*rce));
           ^~~~~~
   drivers/of/dynamic.c:508:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(rce, ce, sizeof(*rce));
           ^~~~~~
   drivers/of/dynamic.c:550:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&rd, 0, sizeof(rd));
                   ^~~~~~
   drivers/of/dynamic.c:550:3: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                   memset(&rd, 0, sizeof(rd));
                   ^~~~~~
   drivers/of/dynamic.c:679:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ocs, 0, sizeof(*ocs));
           ^~~~~~
   drivers/of/dynamic.c:679:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(ocs, 0, sizeof(*ocs));
           ^~~~~~
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/of/fdt.c:198:4: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pp->value, ps, len - 1);
                           ^~~~~~
   drivers/of/fdt.c:198:4: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                           memcpy(pp->value, ps, len - 1);
                           ^~~~~~
   drivers/of/fdt.c:232:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(fn, pathp, len);
                   ^~~~~~
   drivers/of/fdt.c:232:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(fn, pathp, len);
                   ^~~~~~
   drivers/of/fdt.c:257:10: warning: Access to field 'child' results in a d=
ereference of a null pointer (loaded from variable 'parent') [clang-analyze=
r-core.NullDereference]
           child =3D parent->child;
                   ^
   drivers/of/fdt.c:295:16: note: Assuming 'base' is non-null
           bool dryrun =3D !base;
                         ^~~~~
   drivers/of/fdt.c:298:6: note: Assuming 'nodepp' is null
           if (nodepp)
               ^~~~~~
   drivers/of/fdt.c:298:2: note: Taking false branch
           if (nodepp)
           ^
   drivers/of/fdt.c:308:6: note: Assuming 'dad' is null
           if (dad)
               ^~~
   drivers/of/fdt.c:308:2: note: Taking false branch
           if (dad)
           ^
   drivers/of/fdt.c:315:7: note: 'offset' is >=3D 0
                offset >=3D 0 && depth >=3D initial_depth;
                ^~~~~~
   drivers/of/fdt.c:315:7: note: Left side of '&&' is true
   drivers/of/fdt.c:314:2: note: Loop condition is true.  Entering loop body
           for (offset =3D 0;
           ^
   drivers/of/fdt.c:317:7: note: Taking false branch
                   if (WARN_ON_ONCE(depth >=3D FDT_MAX_DEPTH))
                       ^
   include/asm-generic/bug.h:111:2: note: expanded from macro 'WARN_ON_ONCE'

vim +/qmp +1701 drivers/phy/qualcomm/phy-qcom-qmp-combo.c

94a407cc17a445d Dmitry Baryshkov 2022-06-08  1697  =

033f3a16fb92832 Dmitry Baryshkov 2022-06-08  1698  static int qcom_qmp_phy_=
combo_init(struct phy *phy)
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1699  {
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1700  	struct qmp_phy *qphy =
=3D phy_get_drvdata(phy);
94a407cc17a445d Dmitry Baryshkov 2022-06-08 @1701  	struct qcom_qmp *qmp =
=3D qphy->qmp;
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1702  	const struct qmp_phy_cf=
g *cfg =3D qphy->cfg;
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1703  	int ret;
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1704  	dev_vdbg(qmp->dev, "Ini=
tializing QMP phy\n");
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1705  =

033f3a16fb92832 Dmitry Baryshkov 2022-06-08  1706  	ret =3D qcom_qmp_phy_co=
mbo_com_init(qphy);
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1707  	if (ret)
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1708  		return ret;
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1709  =

94a407cc17a445d Dmitry Baryshkov 2022-06-08  1710  	if (cfg->type =3D=3D PH=
Y_TYPE_DP)
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1711  		cfg->dp_aux_init(qphy);
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1712  =

94a407cc17a445d Dmitry Baryshkov 2022-06-08  1713  	return 0;
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1714  }
94a407cc17a445d Dmitry Baryshkov 2022-06-08  1715  =


:::::: The code at line 1701 was first introduced by commit
:::::: 94a407cc17a445ddb3f7315cee0b0916d35d177c phy: qcom-qmp: create copie=
s of QMP PHY driver

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5548876061174455729==--

