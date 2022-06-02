Content-Type: multipart/mixed; boundary="===============7112426384460754726=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/dc.c:2238:2: warning: Value stored to 'old_state' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 02 Jun 2022 08:28:47 +0800
Message-ID: <202206020858.AE35zuy5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7112426384460754726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/tegra/dc.c:2238:2: warning: Value stored to 'old_state' is never rea=
d [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8171acb8bc9b33f3ed827f0615b24f7a06495cd0
commit: 04d5d5df9df79f9045e76404775fc8a084aac23d drm/tegra: dc: Support mem=
ory bandwidth management
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archi=
ve/20220602/202206020858.AE35zuy5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D04d5d5df9df79f9045e76404775fc8a084aac23d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 04d5d5df9df79f9045e76404775fc8a084aac23d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/hfi_venus.c:959:17: note: Value stored=
 to 'dev' during its initialization is never read
           struct device *dev =3D hdev->core->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/hfi_venus.c:966:34: warning: Value sto=
red to 'pkt' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
                           struct hfi_msg_sys_debug_pkt *pkt =3D packet;
                                                         ^~~   ~~~~~~
   drivers/media/platform/qcom/venus/hfi_venus.c:966:34: note: Value stored=
 to 'pkt' during its initialization is never read
                           struct hfi_msg_sys_debug_pkt *pkt =3D packet;
                                                         ^~~   ~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   block/bfq-wf2q.c:263:7: warning: Access to field 'my_sched_data' results=
 in a dereference of a null pointer (loaded from variable 'entity') [clang-=
analyzer-core.NullDereference]
           if (!entity->my_sched_data)
                ^
   block/bfq-wf2q.c:1508:2: note: 'entity' initialized to a null pointer va=
lue
           struct bfq_entity *entity =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:1512:6: note: Assuming the condition is false
           if (bfq_tot_busy_queues(bfqd) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:1512:2: note: Taking false branch
           if (bfq_tot_busy_queues(bfqd) =3D=3D 0)
           ^
   block/bfq-wf2q.c:1521:2: note: Loop condition is false. Execution contin=
ues on line 1582
           for (; sd ; sd =3D entity->my_sched_data) {
           ^
   block/bfq-wf2q.c:1582:28: note: Passing null pointer value via 1st param=
eter 'entity'
           bfqq =3D bfq_entity_to_bfqq(entity);
                                     ^~~~~~
   block/bfq-wf2q.c:1582:9: note: Calling 'bfq_entity_to_bfqq'
           bfqq =3D bfq_entity_to_bfqq(entity);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:263:7: note: Access to field 'my_sched_data' results in=
 a dereference of a null pointer (loaded from variable 'entity')
           if (!entity->my_sched_data)
                ^~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/dvb-frontends/tda10048.c:493:3: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   drivers/media/dvb-frontends/tda10048.c:493:3: note: Value stored to 'ret=
' is never read
                   ret =3D 0;
                   ^     ~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/tegra/dc.c:1856:2: warning: Value stored to 'old_dc_stat=
e' is never read [clang-analyzer-deadcode.DeadStores]
           old_dc_state =3D to_const_dc_state(old_crtc_state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1856:2: note: Value stored to 'old_dc_state' =
is never read
           old_dc_state =3D to_const_dc_state(old_crtc_state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1857:2: warning: Value stored to 'new_dc_stat=
e' is never read [clang-analyzer-deadcode.DeadStores]
           new_dc_state =3D to_const_dc_state(crtc->state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1857:2: note: Value stored to 'new_dc_state' =
is never read
           new_dc_state =3D to_const_dc_state(crtc->state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2145:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2145:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2149:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2149:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/tegra/dc.c:2238:2: warning: Value stored to 'old_state' =
is never read [clang-analyzer-deadcode.DeadStores]
           old_state =3D drm_atomic_get_old_crtc_state(state, crtc);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2238:2: note: Value stored to 'old_state' is =
never read
           old_state =3D drm_atomic_get_old_crtc_state(state, crtc);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (1 in non-user code, 3 with check filters).
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
   drivers/base/dd.c:684:2: warning: Value stored to 'calltime' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:684:2: note: Value stored to 'calltime' is never read
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:686:2: warning: Value stored to 'rettime' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:686:2: note: Value stored to 'rettime' is never read
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:1080:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D driver_probe_device(drv, dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/dd.c:1080:2: note: Value stored to 'ret' is never read
           ret =3D driver_probe_device(drv, dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/base/platform.c:577:3: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pa->name, name);
                   ^~~~~~
   drivers/base/platform.c:577:3: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                   strcpy(pa->name, name);
                   ^~~~~~
   2 warnings generated.
   drivers/mmc/core/regulator.c:181:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   drivers/mmc/core/regulator.c:181:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D mmc_dev(mmc);
                          ^~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/platform/sti/delta/delta-debug.c:57:20: warning: Value sto=
red to 'delta' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-debug.c:57:20: note: Value stored=
 to 'delta' during its initialization is never read
           struct delta_dev *delta =3D ctx->dev;
                             ^~~~~   ~~~~~~~~
   drivers/media/platform/sti/delta/delta-debug.c:58:27: warning: Value sto=
red to 's' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct delta_streaminfo *s =3D &ctx->streaminfo;
                                    ^   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/delta/delta-debug.c:58:27: note: Value stored=
 to 's' during its initialization is never read
           struct delta_streaminfo *s =3D &ctx->streaminfo;
                                    ^   ~~~~~~~~~~~~~~~~
   drivers/media/platform/sti/delta/delta-debug.c:59:16: warning: Value sto=
red to 'str' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           unsigned char str[100] =3D "";
                         ^~~        ~~
   drivers/media/platform/sti/delta/delta-debug.c:59:16: note: Value stored=
 to 'str' during its initialization is never read
           unsigned char str[100] =3D "";
                         ^~~        ~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
--
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
   2 warnings generated.
   sound/soc/codecs/ak4613.c:402:2: warning: Value stored to 'fmt_ctrl' is =
never read [clang-analyzer-deadcode.DeadStores]
           fmt_ctrl =3D NO_FMT;
           ^
   sound/soc/codecs/ak4613.c:402:2: note: Value stored to 'fmt_ctrl' is nev=
er read
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
   sound/soc/codecs/adau7118.c:127:24: warning: Value stored to 'st' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct adau7118_data *st =3D
                                 ^~
   sound/soc/codecs/adau7118.c:127:24: note: Value stored to 'st' during it=
s initialization is never read
           struct adau7118_data *st =3D
                                 ^~
   sound/soc/codecs/adau7118.c:210:24: warning: Value stored to 'st' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct adau7118_data *st =3D
                                 ^~
   sound/soc/codecs/adau7118.c:210:24: note: Value stored to 'st' during it=
s initialization is never read
           struct adau7118_data *st =3D
                                 ^~
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
   drivers/mtd/nand/onenand/onenand_bbt.c:72:12: warning: Although the valu=
e stored to 'ooblen' is used in the enclosing expression, the value is neve=
r actually read from 'ooblen' [clang-analyzer-deadcode.DeadStores]
           scanlen =3D ooblen =3D 0;
                     ^        ~
   drivers/mtd/nand/onenand/onenand_bbt.c:72:12: note: Although the value s=
tored to 'ooblen' is used in the enclosing expression, the value is never a=
ctually read from 'ooblen'
           scanlen =3D ooblen =3D 0;
                     ^        ~
   1 warning generated.
   drivers/mtd/nand/onenand/generic.c:66:2: warning: Value stored to 'err' =
is never read [clang-analyzer-deadcode.DeadStores]
           err =3D mtd_device_register(&info->mtd, pdata ? pdata->parts : N=
ULL,
           ^
   drivers/mtd/nand/onenand/generic.c:66:2: note: Value stored to 'err' is =
never read
   9 warnings generated.
   drivers/gpu/drm/tegra/dc.c:1856:2: warning: Value stored to 'old_dc_stat=
e' is never read [clang-analyzer-deadcode.DeadStores]
           old_dc_state =3D to_const_dc_state(old_crtc_state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1856:2: note: Value stored to 'old_dc_state' =
is never read
           old_dc_state =3D to_const_dc_state(old_crtc_state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1857:2: warning: Value stored to 'new_dc_stat=
e' is never read [clang-analyzer-deadcode.DeadStores]
           new_dc_state =3D to_const_dc_state(crtc->state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1857:2: note: Value stored to 'new_dc_state' =
is never read
           new_dc_state =3D to_const_dc_state(crtc->state);
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2145:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2145:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2149:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2149:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/tegra/dc.c:2238:2: warning: Value stored to 'old_state' =
is never read [clang-analyzer-deadcode.DeadStores]
           old_state =3D drm_atomic_get_old_crtc_state(state, crtc);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:2238:2: note: Value stored to 'old_state' is =
never read
           old_state =3D drm_atomic_get_old_crtc_state(state, crtc);
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (1 in non-user code, 3 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/w1/w1.c:589:3: warning: Value stored to 'event_owner' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   event_owner =3D "master";
                   ^             ~~~~~~~~
   drivers/w1/w1.c:589:3: note: Value stored to 'event_owner' is never read
                   event_owner =3D "master";
                   ^             ~~~~~~~~
   drivers/w1/w1.c:590:3: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   name =3D md->name;
                   ^      ~~~~~~~~
   drivers/w1/w1.c:590:3: note: Value stored to 'name' is never read
                   name =3D md->name;
                   ^      ~~~~~~~~
   drivers/w1/w1.c:593:3: warning: Value stored to 'event_owner' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   event_owner =3D "slave";
                   ^             ~~~~~~~
   drivers/w1/w1.c:593:3: note: Value stored to 'event_owner' is never read
                   event_owner =3D "slave";
                   ^             ~~~~~~~
   drivers/w1/w1.c:594:3: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   name =3D sl->name;
                   ^      ~~~~~~~~

vim +/old_state +2238 drivers/gpu/drm/tegra/dc.c

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2213  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2214  static int tegra_crtc_calc=
ulate_memory_bandwidth(struct drm_crtc *crtc,
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2215  						 struct drm_atomic_s=
tate *state)
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2216  {
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2217  	ulong overlap_mask[TEGRA_=
DC_LEGACY_PLANES_NUM] =3D {}, mask;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2218  	u32 plane_peak_bw[TEGRA_D=
C_LEGACY_PLANES_NUM] =3D {};
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2219  	bool all_planes_overlap_s=
imultaneously =3D true;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2220  	const struct tegra_plane_=
state *tegra_state;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2221  	const struct drm_plane_st=
ate *plane_state;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2222  	struct tegra_dc *dc =3D t=
o_tegra_dc(crtc);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2223  	const struct drm_crtc_sta=
te *old_state;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2224  	struct drm_crtc_state *ne=
w_state;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2225  	struct tegra_plane *tegra;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2226  	struct drm_plane *plane;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2227  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2228  	/*
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2229  	 * The nv-display uses sh=
ared planes.  The algorithm below assumes
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2230  	 * maximum 3 planes per-C=
RTC, this assumption isn't applicable to
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2231  	 * the nv-display.  Note =
that T124 support has additional windows,
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2232  	 * but currently they are=
n't supported by the driver.
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2233  	 */
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2234  	if (dc->soc->has_nvdispla=
y)
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2235  		return 0;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2236  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2237  	new_state =3D drm_atomic_=
get_new_crtc_state(state, crtc);
04d5d5df9df79f Dmitry Osipenko 2021-06-01 @2238  	old_state =3D drm_atomic_=
get_old_crtc_state(state, crtc);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2239  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2240  	/*
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2241  	 * For overlapping planes=
 pixel's data is fetched for each plane at
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2242  	 * the same time, hence b=
andwidths are accumulated in this case.
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2243  	 * This needs to be taken=
 into account for calculating total bandwidth
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2244  	 * consumed by all planes.
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2245  	 *
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2246  	 * Here we get the overla=
pping state of each plane, which is a
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2247  	 * bitmask of plane indic=
es telling with what planes there is an
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2248  	 * overlap. Note that bit=
mask[plane] includes BIT(plane) in order
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2249  	 * to make further code n=
icer and simpler.
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2250  	 */
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2251  	drm_atomic_crtc_state_for=
_each_plane_state(plane, plane_state, new_state) {
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2252  		tegra_state =3D to_const=
_tegra_plane_state(plane_state);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2253  		tegra =3D to_tegra_plane=
(plane);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2254  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2255  		if (WARN_ON_ONCE(tegra->=
index >=3D TEGRA_DC_LEGACY_PLANES_NUM))
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2256  			return -EINVAL;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2257  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2258  		plane_peak_bw[tegra->ind=
ex] =3D tegra_state->peak_memory_bandwidth;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2259  		mask =3D tegra_plane_ove=
rlap_mask(new_state, plane_state);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2260  		overlap_mask[tegra->inde=
x] =3D mask;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2261  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2262  		if (hweight_long(mask) !=
=3D 3)
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2263  			all_planes_overlap_simu=
ltaneously =3D false;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2264  	}
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2265  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2266  	/*
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2267  	 * Then we calculate maxi=
mum bandwidth of each plane state.
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2268  	 * The bandwidth includes=
 the plane BW + BW of the "simultaneously"
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2269  	 * overlapping planes, wh=
ere "simultaneously" means areas where DC
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2270  	 * fetches from the plane=
s simultaneously during of scan-out process.
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2271  	 *
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2272  	 * For example, if plane =
A overlaps with planes B and C, but B and C
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2273  	 * don't overlap, then th=
e peak bandwidth will be either in area where
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2274  	 * A-and-B or A-and-C pla=
nes overlap.
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2275  	 *
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2276  	 * The plane_peak_bw[] co=
ntains peak memory bandwidth values of
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2277  	 * each plane, this infor=
mation is needed by interconnect provider
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2278  	 * in order to set up lat=
ency allowance based on the peak BW, see
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2279  	 * tegra_crtc_update_memo=
ry_bandwidth().
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2280  	 */
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2281  	drm_atomic_crtc_state_for=
_each_plane_state(plane, plane_state, new_state) {
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2282  		u32 i, old_peak_bw, new_=
peak_bw, overlap_bw =3D 0;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2283  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2284  		/*
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2285  		 * Note that plane's ato=
mic check doesn't touch the
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2286  		 * total_peak_memory_ban=
dwidth of enabled plane, hence the
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2287  		 * current state contain=
s the old bandwidth state from the
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2288  		 * previous CRTC commit.
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2289  		 */
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2290  		tegra_state =3D to_const=
_tegra_plane_state(plane_state);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2291  		tegra =3D to_tegra_plane=
(plane);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2292  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2293  		for_each_set_bit(i, &ove=
rlap_mask[tegra->index], 3) {
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2294  			if (i =3D=3D tegra->ind=
ex)
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2295  				continue;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2296  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2297  			if (all_planes_overlap_=
simultaneously)
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2298  				overlap_bw +=3D plane_=
peak_bw[i];
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2299  			else
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2300  				overlap_bw =3D max(ove=
rlap_bw, plane_peak_bw[i]);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2301  		}
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2302  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2303  		new_peak_bw =3D plane_pe=
ak_bw[tegra->index] + overlap_bw;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2304  		old_peak_bw =3D tegra_st=
ate->total_peak_memory_bandwidth;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2305  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2306  		/*
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2307  		 * If plane's peak bandw=
idth changed (for example plane isn't
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2308  		 * overlapped anymore) a=
nd plane isn't in the atomic state,
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2309  		 * then add plane to the=
 state in order to have the bandwidth
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2310  		 * updated.
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2311  		 */
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2312  		if (old_peak_bw !=3D new=
_peak_bw) {
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2313  			struct tegra_plane_stat=
e *new_tegra_state;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2314  			struct drm_plane_state =
*new_plane_state;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2315  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2316  			new_plane_state =3D drm=
_atomic_get_plane_state(state, plane);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2317  			if (IS_ERR(new_plane_st=
ate))
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2318  				return PTR_ERR(new_pla=
ne_state);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2319  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2320  			new_tegra_state =3D to_=
tegra_plane_state(new_plane_state);
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2321  			new_tegra_state->total_=
peak_memory_bandwidth =3D new_peak_bw;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2322  		}
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2323  	}
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2324  =

04d5d5df9df79f Dmitry Osipenko 2021-06-01  2325  	return 0;
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2326  }
04d5d5df9df79f Dmitry Osipenko 2021-06-01  2327  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7112426384460754726==--

