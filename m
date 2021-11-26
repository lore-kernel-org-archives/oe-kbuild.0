Content-Type: multipart/mixed; boundary="===============0712863048736290452=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value stored to 'gen' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 26 Nov 2021 09:07:22 +0800
Message-ID: <202111260853.hscNWcks-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0712863048736290452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Robert Foss <robert.foss@linaro.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: 2fa698e3da84edc6b7a2d670f8bd5035891a744e media: camss: vfe: Decreas=
e priority of of VFE HW version to 'dbg'
date:   8 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20211122 (https://download.01.org/0day-ci/archi=
ve/20211126/202111260853.hscNWcks-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c133fb=
321f7ca6083ce15b6aa5bf89de6600e649)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2fa698e3da84edc6b7a2d670f8bd5035891a744e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2fa698e3da84edc6b7a2d670f8bd5035891a744e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/dma/nbpfaxi.c:1339:3: note: Taking false branch
                   if (!irq_res)
                   ^
   drivers/dma/nbpfaxi.c:1342:30: note: Assuming 'irq' is <=3D field 'end'
                   for (irq =3D irq_res->start; irq <=3D irq_res->end;
                                              ^~~~~~~~~~~~~~~~~~~
   drivers/dma/nbpfaxi.c:1342:3: note: Loop condition is true.  Entering lo=
op body
                   for (irq =3D irq_res->start; irq <=3D irq_res->end;
                   ^
   drivers/dma/nbpfaxi.c:1342:30: note: Assuming 'irq' is <=3D field 'end'
                   for (irq =3D irq_res->start; irq <=3D irq_res->end;
                                              ^~~~~~~~~~~~~~~~~~~
   drivers/dma/nbpfaxi.c:1342:3: note: Loop condition is true.  Entering lo=
op body
                   for (irq =3D irq_res->start; irq <=3D irq_res->end;
                   ^
   drivers/dma/nbpfaxi.c:1342:30: note: Assuming 'irq' is > field 'end'
                   for (irq =3D irq_res->start; irq <=3D irq_res->end;
                                              ^~~~~~~~~~~~~~~~~~~
   drivers/dma/nbpfaxi.c:1342:3: note: Loop condition is false. Execution c=
ontinues on line 1337
                   for (irq =3D irq_res->start; irq <=3D irq_res->end;
                   ^
   drivers/dma/nbpfaxi.c:1337:2: note: Loop condition is true.  Entering lo=
op body
           for (i =3D 0; irqs < ARRAY_SIZE(irqbuf); i++) {
           ^
   drivers/dma/nbpfaxi.c:1339:7: note: Assuming 'irq_res' is null
                   if (!irq_res)
                       ^~~~~~~~
   drivers/dma/nbpfaxi.c:1339:3: note: Taking true branch
                   if (!irq_res)
                   ^
   drivers/dma/nbpfaxi.c:1340:4: note:  Execution continues on line 1353
                           break;
                           ^
   drivers/dma/nbpfaxi.c:1353:6: note: 'irqs' is not equal to 1
           if (irqs !=3D 1 && irqs !=3D 2 && irqs !=3D num_channels + 1)
               ^~~~
   drivers/dma/nbpfaxi.c:1353:6: note: Left side of '&&' is true
   drivers/dma/nbpfaxi.c:1353:19: note: 'irqs' is equal to 2
           if (irqs !=3D 1 && irqs !=3D 2 && irqs !=3D num_channels + 1)
                            ^~~~
   drivers/dma/nbpfaxi.c:1353:29: note: Left side of '&&' is false
           if (irqs !=3D 1 && irqs !=3D 2 && irqs !=3D num_channels + 1)
                                      ^
   drivers/dma/nbpfaxi.c:1356:6: note: 'irqs' is not equal to 1
           if (irqs =3D=3D 1) {
               ^~~~
   drivers/dma/nbpfaxi.c:1356:2: note: Taking false branch
           if (irqs =3D=3D 1) {
           ^
   drivers/dma/nbpfaxi.c:1363:7: note: Assuming 'eirq' is >=3D 0
                   if (eirq < 0)
                       ^~~~~~~~
   drivers/dma/nbpfaxi.c:1363:3: note: Taking false branch
                   if (eirq < 0)
                   ^
   drivers/dma/nbpfaxi.c:1366:7: note: Assuming the condition is true
                   if (irqs =3D=3D num_channels + 1) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/nbpfaxi.c:1366:3: note: Taking true branch
                   if (irqs =3D=3D num_channels + 1) {
                   ^
   drivers/dma/nbpfaxi.c:1369:4: note: Loop condition is true.  Entering lo=
op body
                           for (i =3D 0, chan =3D nbpf->chan; i <=3D num_ch=
annels;
                           ^
   drivers/dma/nbpfaxi.c:1372:9: note: Assuming the condition is false
                                   if (irqbuf[i] =3D=3D eirq)
                                       ^~~~~~~~~~~~~~~~~
   drivers/dma/nbpfaxi.c:1372:5: note: Taking false branch
                                   if (irqbuf[i] =3D=3D eirq)
                                   ^
   drivers/dma/nbpfaxi.c:1369:4: note: Loop condition is true.  Entering lo=
op body
                           for (i =3D 0, chan =3D nbpf->chan; i <=3D num_ch=
annels;
                           ^
   drivers/dma/nbpfaxi.c:1372:9: note: Assuming the condition is true
                                   if (irqbuf[i] =3D=3D eirq)
                                       ^~~~~~~~~~~~~~~~~
   drivers/dma/nbpfaxi.c:1372:5: note: Taking true branch
                                   if (irqbuf[i] =3D=3D eirq)
                                   ^
   drivers/dma/nbpfaxi.c:1373:6: note: The value 2 is assigned to 'i'
                                           i++;
                                           ^~~
   drivers/dma/nbpfaxi.c:1374:15: note: Assigned value is garbage or undefi=
ned
                                   chan->irq =3D irqbuf[i];
                                             ^ ~~~~~~~~~
   1 warning generated.
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:65:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:65:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   1 warning generated.
   drivers/gpu/drm/panel/panel-innolux-p079zca.c:459:3: warning: Value stor=
ed to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D PTR_ERR(innolux->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-innolux-p079zca.c:459:3: note: Value stored =
to 'err' is never read
                   err =3D PTR_ERR(innolux->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value =
stored to 'gen' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: note: Value sto=
red to 'gen' during its initialization is never read
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: warning: Value =
stored to 'rev' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: note: Value sto=
red to 'rev' during its initialization is never read
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: warning: Value =
stored to 'step' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: note: Value sto=
red to 'step' during its initialization is never read
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: warning: Value =
stored to 'violation' during its initialization is never read [clang-analyz=
er-deadcode.DeadStores]
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: note: Value sto=
red to 'violation' during its initialization is never read
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   include/media/v4l2-subdev.h:1000:10: warning: Access to field 'pads' res=
ults in a dereference of a null pointer (loaded from variable 'state') [cla=
ng-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:14: note: Assuming 'i=
' is < field 'line_num'
           for (i =3D 0; i < vfe->line_num; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:2: note: Loop conditi=
on is true.  Entering loop body
           for (i =3D 0; i < vfe->line_num; i++) {
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:7: note: 'i' is not e=
qual to VFE_LINE_PIX
                   if (i =3D=3D VFE_LINE_PIX)
                       ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:3: note: Taking false=
 branch
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1550:9: note: Calling 'vfe=
_init_formats'
                   ret =3D vfe_init_formats(sd, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: 'fh' is null
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: 'fh' is null
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: Passing nul=
l pointer value via 2nd parameter 'sd_state'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:9: note: Calling 'vfe=
_set_format'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:6: note: 'format' is =
not equal to NULL
           if (format =3D=3D NULL)
               ^~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:2: note: Taking false=
 branch
           if (format =3D=3D NULL)
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1080:6: note: Assuming fie=
ld 'pad' is equal to MSM_VFE_PAD_SINK
           if (fmt->pad =3D=3D MSM_VFE_PAD_SINK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1080:2: note: Taking true =
branch
           if (fmt->pad =3D=3D MSM_VFE_PAD_SINK) {
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1085:35: note: Passing nul=
l pointer value via 2nd parameter 'sd_state'
                   format =3D __vfe_get_format(line, sd_state, MSM_VFE_PAD_=
SRC,
                                                   ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1085:12: note: Calling '__=
vfe_get_format'
                   format =3D __vfe_get_format(line, sd_state, MSM_VFE_PAD_=
SRC,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/media/platform/qcom/camss/camss-vfe.c:768:6: note: Assuming 'whi=
ch' is equal to V4L2_SUBDEV_FORMAT_TRY
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:768:2: note: Taking true b=
ranch
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:769:52: note: Passing null=
 pointer value via 2nd parameter 'state'
                   return v4l2_subdev_get_try_format(&line->subdev, sd_stat=
e,
                                                                    ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:769:10: note: Calling 'v4l=
2_subdev_get_try_format'
                   return v4l2_subdev_get_try_format(&line->subdev, sd_stat=
e,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
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
   1 warning generated.
   drivers/regulator/bcm590xx-regulator.c:140:8: warning: Excessive padding=
 in 'struct bcm590xx_info' (6 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   name, =

   vin_name, =

   volt_table, =

   linear_ranges, =

--
           ^
   fs/overlayfs/export.c:813:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/overlayfs/export.c:813:2: note: Taking false branch
           if (err)
           ^
   fs/overlayfs/export.c:817:12: note: Assuming the condition is false
           dentry =3D (flags & OVL_FH_FLAG_PATH_UPPER) ?
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:817:11: note: '?' condition is false
           dentry =3D (flags & OVL_FH_FLAG_PATH_UPPER) ?
                    ^
   fs/overlayfs/export.c:819:4: note: Calling 'ovl_lower_fh_to_d'
                    ovl_lower_fh_to_d(sb, fh);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:708:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/overlayfs/export.c:708:2: note: Taking false branch
           if (err)
           ^
   fs/overlayfs/export.c:711:6: note: Left side of '||' is false
           if (!d_is_dir(origin.dentry) ||
               ^
   fs/overlayfs/export.c:712:6: note: Assuming the condition is false
               !(origin.dentry->d_flags & DCACHE_DISCONNECTED)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:711:2: note: Taking false branch
           if (!d_is_dir(origin.dentry) ||
           ^
   fs/overlayfs/export.c:726:6: note: Assuming field 'indexdir' is null
           if (ofs->indexdir) {
               ^~~~~~~~~~~~~
   fs/overlayfs/export.c:726:2: note: Taking false branch
           if (ofs->indexdir) {
           ^
   fs/overlayfs/export.c:736:6: note: 'index' is null
           if (index && d_is_dir(index)) {
               ^~~~~
   fs/overlayfs/export.c:736:12: note: Left side of '&&' is false
           if (index && d_is_dir(index)) {
                     ^
   fs/overlayfs/export.c:749:2: note: Taking true branch
           if (d_is_dir(origin.dentry)) {
           ^
   fs/overlayfs/export.c:753:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   fs/overlayfs/export.c:753:3: note: Taking false branch
                   if (err)
                   ^
   fs/overlayfs/export.c:756:6: note: 'index' is null
           if (index) {
               ^~~~~
   fs/overlayfs/export.c:756:2: note: Taking false branch
           if (index) {
           ^
   fs/overlayfs/export.c:763:11: note: Calling 'ovl_get_dentry'
           dentry =3D ovl_get_dentry(sb, NULL, &origin, index);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:654:34: note: 'upper' is null
           const struct ovl_layer *layer =3D upper ? &ofs->layers[0] : lowe=
rpath->layer;
                                           ^~~~~
   fs/overlayfs/export.c:654:34: note: '?' condition is false
   fs/overlayfs/export.c:655:24: note: '?' condition is false
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                 ^
   fs/overlayfs/export.c:655:34: note: '?' condition is false
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                           ^
   fs/overlayfs/export.c:655:2: note: 'real' initialized to a null pointer =
value
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
           ^~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:661:16: note: Passing null pointer value via 1st p=
arameter 'dentry'
           if (!d_is_dir(real))
                         ^~~~
   fs/overlayfs/export.c:661:7: note: Calling 'd_is_dir'
           if (!d_is_dir(real))
                ^~~~~~~~~~~~~~
   include/linux/dcache.h:420:22: note: Passing null pointer value via 1st =
parameter 'dentry'
           return d_can_lookup(dentry) || d_is_autodir(dentry);
                               ^~~~~~
   include/linux/dcache.h:420:9: note: Calling 'd_can_lookup'
           return d_can_lookup(dentry) || d_is_autodir(dentry);
                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:410:24: note: Passing null pointer value via 1st =
parameter 'dentry'
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                                 ^~~~~~
   include/linux/dcache.h:410:9: note: Calling '__d_entry_type'
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:395:9: note: Access to field 'd_flags' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_flags & DCACHE_ENTRY_TYPE;
                  ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 with check filters).
   5 warnings generated.
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: warning: Value =
stored to 'gen' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:184:6: note: Value sto=
red to 'gen' during its initialization is never read
           u32 gen =3D (hw_version >> 28) & 0xF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: warning: Value =
stored to 'rev' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:185:6: note: Value sto=
red to 'rev' during its initialization is never read
           u32 rev =3D (hw_version >> 16) & 0xFFF;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: warning: Value =
stored to 'step' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:186:6: note: Value sto=
red to 'step' during its initialization is never read
           u32 step =3D hw_version & 0xFFFF;
               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: warning: Value =
stored to 'violation' during its initialization is never read [clang-analyz=
er-deadcode.DeadStores]
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe-170.c:336:6: note: Value sto=
red to 'violation' during its initialization is never read
           u32 violation =3D readl_relaxed(vfe->base + VFE_VIOLATION_STATUS=
);
               ^~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   include/media/v4l2-subdev.h:1000:10: warning: Access to field 'pads' res=
ults in a dereference of a null pointer (loaded from variable 'state') [cla=
ng-analyzer-core.NullDereference]
           return &state->pads[pad].try_fmt;
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:14: note: Assuming 'i=
' is < field 'line_num'
           for (i =3D 0; i < vfe->line_num; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1531:2: note: Loop conditi=
on is true.  Entering loop body
           for (i =3D 0; i < vfe->line_num; i++) {
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:7: note: 'i' is not e=
qual to VFE_LINE_PIX
                   if (i =3D=3D VFE_LINE_PIX)
                       ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1541:3: note: Taking false=
 branch
                   if (i =3D=3D VFE_LINE_PIX)
                   ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1550:9: note: Calling 'vfe=
_init_formats'
                   ret =3D vfe_init_formats(sd, NULL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: 'fh' is null
                   .which =3D fh ? V4L2_SUBDEV_FORMAT_TRY :
                            ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1256:12: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: 'fh' is null
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: '?' conditi=
on is false
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:28: note: Passing nul=
l pointer value via 2nd parameter 'sd_state'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                                     ^~
   drivers/media/platform/qcom/camss/camss-vfe.c:1265:9: note: Calling 'vfe=
_set_format'
           return vfe_set_format(sd, fh ? fh->state : NULL, &format);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:6: note: 'format' is =
not equal to NULL
           if (format =3D=3D NULL)
               ^~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1074:2: note: Taking false=
 branch
           if (format =3D=3D NULL)
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1080:6: note: Assuming fie=
ld 'pad' is equal to MSM_VFE_PAD_SINK
           if (fmt->pad =3D=3D MSM_VFE_PAD_SINK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1080:2: note: Taking true =
branch
           if (fmt->pad =3D=3D MSM_VFE_PAD_SINK) {
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:1085:35: note: Passing nul=
l pointer value via 2nd parameter 'sd_state'
                   format =3D __vfe_get_format(line, sd_state, MSM_VFE_PAD_=
SRC,
                                                   ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:1085:12: note: Calling '__=
vfe_get_format'
                   format =3D __vfe_get_format(line, sd_state, MSM_VFE_PAD_=
SRC,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/media/platform/qcom/camss/camss-vfe.c:768:6: note: Assuming 'whi=
ch' is equal to V4L2_SUBDEV_FORMAT_TRY
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:768:2: note: Taking true b=
ranch
           if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
           ^
   drivers/media/platform/qcom/camss/camss-vfe.c:769:52: note: Passing null=
 pointer value via 2nd parameter 'state'
                   return v4l2_subdev_get_try_format(&line->subdev, sd_stat=
e,
                                                                    ^~~~~~~~
   drivers/media/platform/qcom/camss/camss-vfe.c:769:10: note: Calling 'v4l=
2_subdev_get_try_format'
                   return v4l2_subdev_get_try_format(&line->subdev, sd_stat=
e,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
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
   3 warnings generated.
   drivers/media/dvb-core/dvb_frontend.c:253:8: warning: Access to field 'e=
ventw' results in a dereference of a null pointer (loaded from variable 'ev=
ents') [clang-analyzer-core.NullDereference]
           wp =3D (events->eventw + 1) % MAX_EVENT;
                 ^
   drivers/media/dvb-core/dvb_frontend.c:660:2: note: Taking false branch
           dev_dbg(fe->dvb->device, "%s:\n", __func__);
           ^

vim +/gen +184 drivers/media/platform/qcom/camss/camss-vfe-170.c

7319cdf189bb643 Robert Foss 2021-03-16  179  =

7319cdf189bb643 Robert Foss 2021-03-16  180  static void vfe_hw_version_rea=
d(struct vfe_device *vfe, struct device *dev)
7319cdf189bb643 Robert Foss 2021-03-16  181  {
7319cdf189bb643 Robert Foss 2021-03-16  182  	u32 hw_version =3D readl_rela=
xed(vfe->base + VFE_HW_VERSION);
7319cdf189bb643 Robert Foss 2021-03-16  183  =

7319cdf189bb643 Robert Foss 2021-03-16 @184  	u32 gen =3D (hw_version >> 28=
) & 0xF;
7319cdf189bb643 Robert Foss 2021-03-16 @185  	u32 rev =3D (hw_version >> 16=
) & 0xFFF;
7319cdf189bb643 Robert Foss 2021-03-16 @186  	u32 step =3D hw_version & 0xF=
FFF;
7319cdf189bb643 Robert Foss 2021-03-16  187  =

2fa698e3da84edc Robert Foss 2021-07-26  188  	dev_dbg(dev, "VFE HW Version =
=3D %u.%u.%u\n", gen, rev, step);
7319cdf189bb643 Robert Foss 2021-03-16  189  }
7319cdf189bb643 Robert Foss 2021-03-16  190  =


:::::: The code at line 184 was first introduced by commit
:::::: 7319cdf189bb643c6d56e5898ef89ad7c3ef6c31 media: camss: Add support f=
or VFE hardware version Titan 170

:::::: TO: Robert Foss <robert.foss@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0712863048736290452==--

