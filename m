Content-Type: multipart/mixed; boundary="===============6605549381374893186=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: warning: Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 01 May 2022 09:27:20 +0800
Message-ID: <202205010925.AOu36ijx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6605549381374893186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Marek <jonathan@marek.ca>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Robert Foss <robert.foss@linaro.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   57ae8a492116910bad2b3497ffe555b3a4b4180f
commit: dd89115a7c1cf31223cbeab2430d03bf202c8b22 media: camss: csiphy-3ph: =
don't print HW version as an error
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220427 (https://download.01.org/0day-ci/archi=
ve/20220501/202205010925.AOu36ijx-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddd89115a7c1cf31223cbeab2430d03bf202c8b22
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dd89115a7c1cf31223cbeab2430d03bf202c8b22
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2096:5: note: Value stored to 'ret=
' is never read
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/target/target_core_configfs.c:2218:17: warning: Value stored to =
'hba' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2218:17: note: Value stored to 'hb=
a' during its initialization is never read
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2258:17: warning: Value stored to =
'hba' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2258:17: note: Value stored to 'hb=
a' during its initialization is never read
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2340:17: warning: Value stored to =
'hba' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2340:17: note: Value stored to 'hb=
a' during its initialization is never read
           struct se_hba *hba =3D dev->se_hba;
                          ^~~   ~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2395:3: warning: Value stored to '=
move' is never read [clang-analyzer-deadcode.DeadStores]
                   move =3D 1;
                   ^      ~
   drivers/target/target_core_configfs.c:2395:3: note: Value stored to 'mov=
e' is never read
                   move =3D 1;
                   ^      ~
   drivers/target/target_core_configfs.c:2636:23: warning: Value stored to =
'alua_lu_gp_cg' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct config_group *alua_lu_gp_cg =3D &lu_gp->lu_gp_group;
                                ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2636:23: note: Value stored to 'al=
ua_lu_gp_cg' during its initialization is never read
           struct config_group *alua_lu_gp_cg =3D &lu_gp->lu_gp_group;
                                ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2740:2: warning: Value stored to '=
alua_lu_gp_ci' is never read [clang-analyzer-deadcode.DeadStores]
           alua_lu_gp_ci =3D &alua_lu_gp_cg->cg_item;
           ^               ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2740:2: note: Value stored to 'alu=
a_lu_gp_ci' is never read
           alua_lu_gp_ci =3D &alua_lu_gp_cg->cg_item;
           ^               ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:2757:25: warning: Value stored to =
'lu_gp' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct t10_alua_lu_gp *lu_gp =3D container_of(to_config_group(it=
em),
                                  ^~~~~
   drivers/target/target_core_configfs.c:2757:25: note: Value stored to 'lu=
_gp' during its initialization is never read
           struct t10_alua_lu_gp *lu_gp =3D container_of(to_config_group(it=
em),
                                  ^~~~~
   drivers/target/target_core_configfs.c:3035:23: warning: Value stored to =
'alua_tg_pt_gp_cg' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           struct config_group *alua_tg_pt_gp_cg =3D &tg_pt_gp->tg_pt_gp_gr=
oup;
                                ^~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:3035:23: note: Value stored to 'al=
ua_tg_pt_gp_cg' during its initialization is never read
           struct config_group *alua_tg_pt_gp_cg =3D &tg_pt_gp->tg_pt_gp_gr=
oup;
                                ^~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:3172:2: warning: Value stored to '=
alua_tg_pt_gp_ci' is never read [clang-analyzer-deadcode.DeadStores]
           alua_tg_pt_gp_ci =3D &alua_tg_pt_gp_cg->cg_item;
           ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:3172:2: note: Value stored to 'alu=
a_tg_pt_gp_ci' is never read
           alua_tg_pt_gp_ci =3D &alua_tg_pt_gp_cg->cg_item;
           ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_configfs.c:3188:28: warning: Value stored to =
'tg_pt_gp' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct t10_alua_tg_pt_gp *tg_pt_gp =3D container_of(to_config_gr=
oup(item),
                                     ^~~~~~~~
   drivers/target/target_core_configfs.c:3188:28: note: Value stored to 'tg=
_pt_gp' during its initialization is never read
           struct t10_alua_tg_pt_gp *tg_pt_gp =3D container_of(to_config_gr=
oup(item),
                                     ^~~~~~~~
   5 warnings generated.
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: warning: Value=
 stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-170.c:398:3: note: Value st=
ored to 'val' is never read
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: warning: Value=
 stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:478:2: note: Value st=
ored to 'hw_gen' is never read
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: warning: Value=
 stored to 'hw_rev' is never read [clang-analyzer-deadcode.DeadStores]
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:479:2: note: Value st=
ored to 'hw_rev' is never read
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: warning: Value=
 stored to 'hw_step' is never read [clang-analyzer-deadcode.DeadStores]
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-170.c:480:2: note: Value st=
ored to 'hw_step' is never read
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: warning: =
Value stored to 'hw_version' during its initialization is never read [clang=
-analyzer-deadcode.DeadStores]
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c:32:5: note: Val=
ue stored to 'hw_version' during its initialization is never read
           u8 hw_version =3D readl_relaxed(csiphy->base +
              ^~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: warning:=
 Value stored to 'hw_version' is never read [clang-analyzer-deadcode.DeadSt=
ores]
           hw_version |=3D readl_relaxed(csiphy->base +
           ^
   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:163:2: note: Va=
lue stored to 'hw_version' is never read
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   include/media/v4l2-subdev.h:1000:10: warning: Access to field 'pads' res=
ults in a dereference of a null pointer (loaded from variable 'state') [cla=
ng-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:781:8: note: Calling 'c=
siphy_init_formats'
           ret =3D csiphy_init_formats(sd, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:545:12: note: 'fh' is n=
ull
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:545:12: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:554:31: note: 'fh' is n=
ull
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:554:31: note: '?' condi=
tion is false
   drivers/media/platform/qcom/camss/camss-csiphy.c:554:31: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                                        ^~
   drivers/media/platform/qcom/camss/camss-csiphy.c:554:9: note: Calling 'c=
siphy_set_format'
           return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:509:6: note: 'format' i=
s not equal to NULL
           if (format =3D=3D NULL)
               ^~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:509:2: note: Taking fal=
se branch
           if (format =3D=3D NULL)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:517:6: note: Assuming f=
ield 'pad' is equal to MSM_CSIPHY_PAD_SINK
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:517:2: note: Taking tru=
e branch
           if (fmt->pad =3D=3D MSM_CSIPHY_PAD_SINK) {
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:518:40: note: Passing n=
ull pointer value via 2nd parameter 'sd_state'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                                                        ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:518:12: note: Calling '=
__csiphy_get_format'
                   format =3D __csiphy_get_format(csiphy, sd_state,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:345:6: note: Assuming '=
which' is equal to V4L2_SUBDEV_FORMAT_TRY
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:345:2: note: Taking tru=
e branch
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
           ^
   drivers/media/platform/qcom/camss/camss-csiphy.c:346:54: note: Passing n=
ull pointer value via 2nd parameter 'state'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                                                                      ^~~~~=
~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:346:10: note: Calling '=
v4l2_subdev_get_try_format'
                   return v4l2_subdev_get_try_format(&csiphy->subdev, sd_st=
ate,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/media/v4l2-subdev.h:998:14: note: Assuming 'pad' is < field 'num=
_pads'
           if (WARN_ON(pad >=3D sd->entity.num_pads))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   include/media/v4l2-subdev.h:998:6: note: Taking false branch
           if (WARN_ON(pad >=3D sd->entity.num_pads))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   include/media/v4l2-subdev.h:998:2: note: Taking false branch
           if (WARN_ON(pad >=3D sd->entity.num_pads))
           ^
   include/media/v4l2-subdev.h:1000:10: note: Access to field 'pads' result=
s in a dereference of a null pointer (loaded from variable 'state')
           return &state->pads[pad].try_fmt;
                   ^~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/tty/vt/vt.c:586:21: warning: Value stored to 'uniscr' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct uni_screen *uniscr =3D get_vc_uniscr(vc);
                              ^~~~~~
   drivers/tty/vt/vt.c:586:21: note: Value stored to 'uniscr' during its in=
itialization is never read
           struct uni_screen *uniscr =3D get_vc_uniscr(vc);
                              ^~~~~~
   17 warnings generated.
   drivers/tty/serial/serial_core.c:160:17: warning: Access to field 'rs485=
_config' results in a dereference of a null pointer (loaded from variable '=
uport') [clang-analyzer-core.NullDereference]
           int rs485_on =3D uport->rs485_config &&
                          ^
   drivers/tty/serial/serial_core.c:2232:2: note: Value assigned to field '=
uart_port'
           mutex_lock(&port->mutex);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2235:6: note: Assuming field 'suspended=
' is not equal to 0
           if (!uport->suspended && device_may_wakeup(tty_dev)) {
               ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2235:24: note: Left side of '&&' is fal=
se
           if (!uport->suspended && device_may_wakeup(tty_dev)) {
                                 ^
   drivers/tty/serial/serial_core.c:2248:6: note: Assuming field 'cons' is =
null
           if (uart_console(uport)) {
               ^
   include/linux/serial_core.h:24:3: note: expanded from macro 'uart_consol=
e'
           ((port)->cons && (port)->cons->index =3D=3D (port)->line)
            ^~~~~~~~~~~~

vim +/hw_version +163 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-=
0.c

2f8b67195e4839 Robert Foss    2021-03-16  148  =

4138a88b6093e1 Todor Tomov    2018-07-25  149  static void csiphy_hw_versio=
n_read(struct csiphy_device *csiphy,
4138a88b6093e1 Todor Tomov    2018-07-25  150  				   struct device *dev)
4138a88b6093e1 Todor Tomov    2018-07-25  151  {
4138a88b6093e1 Todor Tomov    2018-07-25  152  	u32 hw_version;
4138a88b6093e1 Todor Tomov    2018-07-25  153  =

4138a88b6093e1 Todor Tomov    2018-07-25  154  	writel(CSIPHY_3PH_CMN_CSI_C=
OMMON_CTRL6_SHOW_REV_ID,
4138a88b6093e1 Todor Tomov    2018-07-25  155  	       csiphy->base + CSIPH=
Y_3PH_CMN_CSI_COMMON_CTRLn(6));
4138a88b6093e1 Todor Tomov    2018-07-25  156  =

4138a88b6093e1 Todor Tomov    2018-07-25  157  	hw_version =3D readl_relaxe=
d(csiphy->base +
4138a88b6093e1 Todor Tomov    2018-07-25  158  				   CSIPHY_3PH_CMN_CSI_CO=
MMON_STATUSn(12));
4138a88b6093e1 Todor Tomov    2018-07-25  159  	hw_version |=3D readl_relax=
ed(csiphy->base +
4138a88b6093e1 Todor Tomov    2018-07-25  160  				   CSIPHY_3PH_CMN_CSI_CO=
MMON_STATUSn(13)) << 8;
4138a88b6093e1 Todor Tomov    2018-07-25  161  	hw_version |=3D readl_relax=
ed(csiphy->base +
4138a88b6093e1 Todor Tomov    2018-07-25  162  				   CSIPHY_3PH_CMN_CSI_CO=
MMON_STATUSn(14)) << 16;
4138a88b6093e1 Todor Tomov    2018-07-25 @163  	hw_version |=3D readl_relax=
ed(csiphy->base +
4138a88b6093e1 Todor Tomov    2018-07-25  164  				   CSIPHY_3PH_CMN_CSI_CO=
MMON_STATUSn(15)) << 24;
4138a88b6093e1 Todor Tomov    2018-07-25  165  =

dd89115a7c1cf3 Jonathan Marek 2021-12-22  166  	dev_dbg(dev, "CSIPHY 3PH HW=
 Version =3D 0x%08x\n", hw_version);
4138a88b6093e1 Todor Tomov    2018-07-25  167  }
4138a88b6093e1 Todor Tomov    2018-07-25  168  =


:::::: The code@line 163 was first introduced by commit
:::::: 4138a88b6093e1f8bf1b8a95c653bec6c854f119 media: camss: csiphy: Add s=
upport for 8x96

:::::: TO: Todor Tomov <todor.tomov@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6605549381374893186==--

