Content-Type: multipart/mixed; boundary="===============5235102419330907096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/hub.c:229:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 27 Nov 2021 15:29:21 +0800
Message-ID: <202111271520.erOdduBs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5235102419330907096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Shawn Guo <shawnguo@kernel.org>

Hi Arnd,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 097530bf8cd469ef7b3d52ef00cafb64b33bacb1 ARM: imx: fix imx8m depend=
encies
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20211012 (https://download.01.org/0day-ci/archi=
ve/20211127/202111271520.erOdduBs-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3dcf3=
9554dbea780d6cb7e12239451ba47a2668)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D097530bf8cd469ef7b3d52ef00cafb64b33bacb1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 097530bf8cd469ef7b3d52ef00cafb64b33bacb1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   kernel/bpf/btf.c:710:3: note: Null pointer value stored to 'btf'
                   btf =3D btf->base_btf;
                   ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:709:19: note: Access to field 'start_id' results in a d=
ereference of a null pointer (loaded from variable 'btf')
           while (type_id < btf->start_id)
                            ^~~
   kernel/bpf/btf.c:790:3: warning: Value stored to 'id' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   id =3D t->type;
                   ^    ~~~~~~~
   kernel/bpf/btf.c:790:3: note: Value stored to 'id' is never read
                   id =3D t->type;
                   ^    ~~~~~~~
   kernel/bpf/btf.c:817:25: warning: Value stored to 't' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           const struct btf_type *t =3D show->state.type;
                                  ^   ~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:817:25: note: Value stored to 't' during its initializa=
tion is never read
           const struct btf_type *t =3D show->state.type;
                                  ^   ~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:386:2: warning: 4th function cal=
l argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           rcar_du_plane_write(rgrp, index, PnDSA0R, dma[0]);
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:624:6: note: Assuming field 'vis=
ible' is true
           if (!plane->state->visible)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:624:2: note: Taking false branch
           if (!plane->state->visible)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:627:2: note: Calling 'rcar_du_pl=
ane_setup'
           rcar_du_plane_setup(rplane);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.h:83:9: note: Calling '__rcar_du_p=
lane_setup'
           return __rcar_du_plane_setup(plane->group, state);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:548:21: note: Field 'planes' is =
not equal to 2
           if (state->format->planes =3D=3D 2)
                              ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:548:2: note: Taking false branch
           if (state->format->planes =3D=3D 2)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:552:18: note: Field 'gen' is < 3
           if (rcdu->info->gen < 3)
                           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:552:2: note: Taking true branch
           if (rcdu->info->gen < 3)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:553:3: note: Calling 'rcar_du_pl=
ane_setup_scanout'
                   rcar_du_plane_setup_scanout(rgrp, state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:341:13: note: Field 'source' is =
equal to RCAR_DU_PLANE_MEMORY
           if (state->source =3D=3D RCAR_DU_PLANE_MEMORY) {
                      ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:341:2: note: Taking true branch
           if (state->source =3D=3D RCAR_DU_PLANE_MEMORY) {
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:346:22: note: Field 'planes' is =
not equal to 2
                   if (state->format->planes =3D=3D 2)
                                      ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:346:3: note: Taking false branch
                   if (state->format->planes =3D=3D 2)
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:351:15: note: Assuming 'i' is >=
=3D field 'planes'
                   for (i =3D 0; i < state->format->planes; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:351:3: note: Loop condition is f=
alse. Execution continues on line 365
                   for (i =3D 0; i < state->format->planes; ++i) {
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:366:9: note: Assuming 'interlace=
d' is false
                               (interlaced && state->format->bpp =3D=3D 32)=
 ?
                                ^~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:366:20: note: Left side of '&&' =
is false
                               (interlaced && state->format->bpp =3D=3D 32)=
 ?
                                           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:384:10: note: 'interlaced' is fa=
lse
                               (!interlaced && state->format->bpp =3D=3D 32=
 ? 2 : 1));
                                 ^~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:384:9: note: Left side of '&&' i=
s true
                               (!interlaced && state->format->bpp =3D=3D 32=
 ? 2 : 1));
                                ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:384:24: note: Assuming field 'bp=
p' is not equal to 32
                               (!interlaced && state->format->bpp =3D=3D 32=
 ? 2 : 1));
                                               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:384:9: note: '?' condition is fa=
lse
                               (!interlaced && state->format->bpp =3D=3D 32=
 ? 2 : 1));
                                ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:386:2: note: 4th function call a=
rgument is an uninitialized value
           rcar_du_plane_write(rgrp, index, PnDSA0R, dma[0]);
           ^                                         ~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:569:21: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct drm_device *dev =3D plane->dev;
                              ^~~   ~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:569:21: note: Value stored to 'd=
ev' during its initialization is never read
           struct drm_device *dev =3D plane->dev;
                              ^~~   ~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/gpu/drm/tegra/hub.c:229:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:229:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:299:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:299:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:313:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:313:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:318:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:318:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:693:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:693:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   lib/string_helpers.c:111:12: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   lib/string_helpers.c:59:6: note: Assuming 'blk_size' is not equal to 0
           if (blk_size =3D=3D 0)
               ^~~~~~~~~~~~~
   lib/string_helpers.c:59:2: note: Taking false branch
           if (blk_size =3D=3D 0)
           ^
   lib/string_helpers.c:61:6: note: Assuming 'size' is not equal to 0
           if (size =3D=3D 0)
               ^~~~~~~~~
   lib/string_helpers.c:61:2: note: Taking false branch
           if (size =3D=3D 0)
           ^
   lib/string_helpers.c:75:2: note: Loop condition is false. Execution cont=
inues on line 80
           while (blk_size >> 32) {
           ^
   lib/string_helpers.c:80:2: note: Loop condition is false. Execution cont=
inues on line 87
           while (size >> 32) {
           ^
   lib/string_helpers.c:90:2: note: Loop condition is false. Execution cont=
inues on line 97
           while (size >=3D divisor[units]) {
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:14: note: Assuming the condition is true
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is true.  Entering loop =
body
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:98:32: note: The value 3 is assigned to 'j'
           for (j =3D 0; sf_cap*10 < 1000; j++)
                                         ^~~
   lib/string_helpers.c:98:14: note: Assuming the condition is false
           for (j =3D 0; sf_cap*10 < 1000; j++)
                       ^~~~~~~~~~~~~~~~
   lib/string_helpers.c:98:2: note: Loop condition is false. Execution cont=
inues on line 101
           for (j =3D 0; sf_cap*10 < 1000; j++)
           ^
   lib/string_helpers.c:101:6: note: Assuming 'units' is not equal to STRIN=
G_UNITS_2
           if (units =3D=3D STRING_UNITS_2) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/string_helpers.c:101:2: note: Taking false branch
           if (units =3D=3D STRING_UNITS_2) {
           ^
   lib/string_helpers.c:111:12: note: Assigned value is garbage or undefined
           remainder +=3D rounding[j];
                     ^  ~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
--
   kernel/bpf/cgroup.c:476:20: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
                                         prog ? : link->link.prog, cgrp))
                                                  ^~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:446:8: note: Assuming the condition is false
           if (((flags & BPF_F_ALLOW_OVERRIDE) && (flags & BPF_F_ALLOW_MULT=
I)) ||
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:446:38: note: Left side of '&&' is false
           if (((flags & BPF_F_ALLOW_OVERRIDE) && (flags & BPF_F_ALLOW_MULT=
I)) ||
                                               ^
   kernel/bpf/cgroup.c:447:8: note: Assuming the condition is false
               ((flags & BPF_F_REPLACE) && !(flags & BPF_F_ALLOW_MULTI)))
                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:447:31: note: Left side of '&&' is false
               ((flags & BPF_F_REPLACE) && !(flags & BPF_F_ALLOW_MULTI)))
                                        ^
   kernel/bpf/cgroup.c:450:6: note: Assuming 'link' is null
           if (link && (prog || replace_prog))
               ^~~~
   kernel/bpf/cgroup.c:450:11: note: Left side of '&&' is false
           if (link && (prog || replace_prog))
                    ^
   kernel/bpf/cgroup.c:453:7: note: Assuming 'replace_prog' is null
           if (!!replace_prog !=3D !!(flags & BPF_F_REPLACE))
                ^~~~~~~~~~~~~
   kernel/bpf/cgroup.c:453:2: note: Taking false branch
           if (!!replace_prog !=3D !!(flags & BPF_F_REPLACE))
           ^
   kernel/bpf/cgroup.c:457:6: note: Assuming the condition is false
           if (!hierarchy_allows_attach(cgrp, type))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:457:2: note: Taking false branch
           if (!hierarchy_allows_attach(cgrp, type))
           ^
   kernel/bpf/cgroup.c:460:6: note: Assuming the condition is false
           if (!list_empty(progs) && cgrp->bpf.flags[type] !=3D saved_flags)
               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:460:25: note: Left side of '&&' is false
           if (!list_empty(progs) && cgrp->bpf.flags[type] !=3D saved_flags)
                                  ^
   kernel/bpf/cgroup.c:467:6: note: Assuming the condition is false
           if (prog_list_length(progs) >=3D BPF_CGROUP_MAX_PROGS)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/cgroup.c:467:2: note: Taking false branch
           if (prog_list_length(progs) >=3D BPF_CGROUP_MAX_PROGS)
           ^
   kernel/bpf/cgroup.c:472:6: note: Calling 'IS_ERR'
           if (IS_ERR(pl))
               ^~~~~~~~~~
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
   kernel/bpf/cgroup.c:472:6: note: Returning from 'IS_ERR'
           if (IS_ERR(pl))
               ^~~~~~~~~~
   kernel/bpf/cgroup.c:472:2: note: Taking false branch
           if (IS_ERR(pl))
           ^
   kernel/bpf/cgroup.c:476:11: note: '?' condition is false
                                         prog ? : link->link.prog, cgrp))
                                         ^
   kernel/bpf/cgroup.c:476:20: note: Dereference of null pointer
                                         prog ? : link->link.prog, cgrp))
                                                  ^~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   fs/autofs/root.c:560:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(cp, symname);
           ^~~~~~
   fs/autofs/root.c:560:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(cp, symname);
           ^~~~~~
   2 warnings generated.
   fs/autofs/dev-ioctl.c:519:34: warning: Although the value stored to 'dev=
id' is used in the enclosing expression, the value is never actually read f=
rom 'devid' [clang-analyzer-deadcode.DeadStores]
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
   fs/autofs/dev-ioctl.c:519:34: note: Although the value stored to 'devid'=
 is used in the enclosing expression, the value is never actually read from=
 'devid'
           param->ismountpoint.out.devid =3D devid =3D 0;
                                           ^       ~
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
   3 warnings generated.
>> drivers/usb/phy/phy-mxs-usb.c:392:6: warning: Value stored to 'phyctrl' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 phyctrl =3D readl(base + HW_USBPHY_CTRL);
               ^~~~~~~
   drivers/usb/phy/phy-mxs-usb.c:392:6: note: Value stored to 'phyctrl' dur=
ing its initialization is never read
           u32 phyctrl =3D readl(base + HW_USBPHY_CTRL);
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
   3 warnings generated.
   drivers/usb/dwc3/core.c:56:2: warning: Value stored to 'mode' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           mode =3D dwc->dr_mode;
           ^      ~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:56:2: note: Value stored to 'mode' is never read
           mode =3D dwc->dr_mode;
           ^      ~~~~~~~~~~~~
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
   14 warnings generated.
   crypto/sm3_generic.c:121:2: warning: Value stored to 'a' is never read [=
clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:2: note: Value stored to 'a' is never read
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:6: warning: Although the value stored to 'b' is=
 used in the enclosing expression, the value is never actually read from 'b=
' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:6: note: Although the value stored to 'b' is us=
ed in the enclosing expression, the value is never actually read from 'b'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:10: warning: Although the value stored to 'c' i=
s used in the enclosing expression, the value is never actually read from '=
c' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:10: note: Although the value stored to 'c' is u=
sed in the enclosing expression, the value is never actually read from 'c'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:14: warning: Although the value stored to 'd' i=
s used in the enclosing expression, the value is never actually read from '=
d' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:14: note: Although the value stored to 'd' is u=
sed in the enclosing expression, the value is never actually read from 'd'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:18: warning: Although the value stored to 'e' i=
s used in the enclosing expression, the value is never actually read from '=
e' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:18: note: Although the value stored to 'e' is u=
sed in the enclosing expression, the value is never actually read from 'e'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:22: warning: Although the value stored to 'f' i=
s used in the enclosing expression, the value is never actually read from '=
f' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:22: note: Although the value stored to 'f' is u=
sed in the enclosing expression, the value is never actually read from 'f'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:26: warning: Although the value stored to 'g' i=
s used in the enclosing expression, the value is never actually read from '=
g' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:26: note: Although the value stored to 'g' is u=
sed in the enclosing expression, the value is never actually read from 'g'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:30: warning: Although the value stored to 'h' i=
s used in the enclosing expression, the value is never actually read from '=
h' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:30: note: Although the value stored to 'h' is u=
sed in the enclosing expression, the value is never actually read from 'h'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:34: warning: Although the value stored to 'ss1'=
 is used in the enclosing expression, the value is never actually read from=
 'ss1' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                           ^     ~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:34: note: Although the value stored to 'ss1' is=
 used in the enclosing expression, the value is never actually read from 's=
s1'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                           ^     ~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:40: warning: Although the value stored to 'ss2'=
 is used in the enclosing expression, the value is never actually read from=
 'ss2' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                 ^     ~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:40: note: Although the value stored to 'ss2' is=
 used in the enclosing expression, the value is never actually read from 's=
s2'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                 ^     ~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:46: warning: Although the value stored to 'tt1'=
 is used in the enclosing expression, the value is never actually read from=
 'tt1' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                       ^     ~~~~~~~
   crypto/sm3_generic.c:121:46: note: Although the value stored to 'tt1' is=
 used in the enclosing expression, the value is never actually read from 't=
t1'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                       ^     ~~~~~~~
   crypto/sm3_generic.c:121:52: warning: Although the value stored to 'tt2'=
 is used in the enclosing expression, the value is never actually read from=
 'tt2' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
--
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/thermal/rcar_thermal.c:375:17: warning: Value stored to 'dev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D rcar_priv_to_dev(priv);
                          ^~~
   drivers/thermal/rcar_thermal.c:375:17: note: Value stored to 'dev' durin=
g its initialization is never read
           struct device *dev =3D rcar_priv_to_dev(priv);
                          ^~~
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
   drivers/base/regmap/regmap-mmio.c:52:3: warning: Value stored to 'min_st=
ride' is never read [clang-analyzer-deadcode.DeadStores]
                   min_stride =3D 0;
                   ^            ~
   drivers/base/regmap/regmap-mmio.c:52:3: note: Value stored to 'min_strid=
e' is never read
                   min_stride =3D 0;
                   ^            ~
   Suppressed 1 warnings (1 in non-user code).
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
   drivers/phy/mediatek/phy-mtk-xsphy.c:211:6: warning: Value stored to 'in=
dex' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-xsphy.c:211:6: note: Value stored to 'index=
' during its initialization is never read
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-xsphy.c:230:6: warning: Value stored to 'in=
dex' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   drivers/phy/mediatek/phy-mtk-xsphy.c:230:6: note: Value stored to 'index=
' during its initialization is never read
           u32 index =3D inst->index;
               ^~~~~   ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/phy/motorola/phy-cpcap-usb.c:664:3: warning: Value stored to 'er=
ror' is never read [clang-analyzer-deadcode.DeadStores]
                   error =3D PTR_ERR(generic_phy);
                   ^       ~~~~~~~~~~~~~~~~~~~~
   drivers/phy/motorola/phy-cpcap-usb.c:664:3: note: Value stored to 'error=
' is never read
                   error =3D PTR_ERR(generic_phy);
                   ^       ~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/phy/qualcomm/phy-qcom-qusb2.c:475:17: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct device *dev =3D &qphy->phy->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qusb2.c:475:17: note: Value stored to 'dev=
' during its initialization is never read
           struct device *dev =3D &qphy->phy->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/tegra/dc.c:1950:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1950:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1954:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1954:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/gpu/drm/tegra/hda.c:53:3: warning: Value stored to 'bits' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/hda.c:53:3: note: Value stored to 'bits' is never =
read
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   lib/mpi/mpih-div.c:56:17: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
                           divisor_limb <<=3D normalization_steps;
                                        ^   ~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:37:6: note: Assuming 'dividend_size' is not equal to 0
           if (!dividend_size)
               ^~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:37:2: note: Taking false branch
           if (!dividend_size)
           ^
   lib/mpi/mpih-div.c:48:6: note: Left side of '&&' is true
           if (UDIV_TIME > (2 * UMUL_TIME + 6)
               ^
   lib/mpi/longlong.h:225:19: note: expanded from macro 'UDIV_TIME'
   #define UDIV_TIME 100
                     ^
   lib/mpi/mpih-div.c:49:7: note: Assuming the condition is true
                           && (UDIV_TIME - (2 * UMUL_TIME + 6)) * dividend_=
size > UDIV_TIME) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:48:2: note: Taking true branch
           if (UDIV_TIME > (2 * UMUL_TIME + 6)
           ^
   lib/mpi/mpih-div.c:52:25: note: Calling 'count_leading_zeros'
                   normalization_steps =3D count_leading_zeros(divisor_limb=
);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/count_zeros.h:25:2: note: Taking true branch
           if (sizeof(x) =3D=3D 4)
           ^
   include/linux/count_zeros.h:26:3: note: Returning the value 32, which pa=
rticipates in a condition later
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/count_zeros.h:26:3: note: Returning the value 32
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:52:25: note: Returning from 'count_leading_zeros'
                   normalization_steps =3D count_leading_zeros(divisor_limb=
);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:52:3: note: The value 32 is assigned to 'normalizatio=
n_steps'
                   normalization_steps =3D count_leading_zeros(divisor_limb=
);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:53:7: note: 'normalization_steps' is 32
                   if (normalization_steps) {
                       ^~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:53:3: note: Taking true branch
                   if (normalization_steps) {
                   ^
   lib/mpi/mpih-div.c:56:17: note: Assigned value is garbage or undefined
                           divisor_limb <<=3D normalization_steps;
                                        ^   ~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:127:18: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
                                   divisor_limb <<=3D normalization_steps;
                                                ^   ~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:37:6: note: Assuming 'dividend_size' is not equal to 0
           if (!dividend_size)
               ^~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:37:2: note: Taking false branch
           if (!dividend_size)
           ^
   lib/mpi/mpih-div.c:48:6: note: Left side of '&&' is true
           if (UDIV_TIME > (2 * UMUL_TIME + 6)
               ^
   lib/mpi/longlong.h:225:19: note: expanded from macro 'UDIV_TIME'
   #define UDIV_TIME 100
                     ^
   lib/mpi/mpih-div.c:49:7: note: Assuming the condition is false
                           && (UDIV_TIME - (2 * UMUL_TIME + 6)) * dividend_=
size > UDIV_TIME) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:48:2: note: Taking false branch
           if (UDIV_TIME > (2 * UMUL_TIME + 6)
           ^
   lib/mpi/mpih-div.c:122:3: note: Taking true branch
                   if (UDIV_NEEDS_NORMALIZATION) {
                   ^
   lib/mpi/mpih-div.c:125:26: note: Calling 'count_leading_zeros'
                           normalization_steps =3D count_leading_zeros(divi=
sor_limb);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/count_zeros.h:25:2: note: Taking true branch
--
           if (status =3D=3D DMA_COMPLETE)
               ^~~~~~
   drivers/dma/fsl-edma-common.c:322:2: note: Taking false branch
           if (status =3D=3D DMA_COMPLETE)
           ^
   drivers/dma/fsl-edma-common.c:325:7: note: 'txstate' is non-null
           if (!txstate)
                ^~~~~~~
   drivers/dma/fsl-edma-common.c:325:2: note: Taking false branch
           if (!txstate)
           ^
   drivers/dma/fsl-edma-common.c:328:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/dma/fsl-edma-common.c:328:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/dma/fsl-edma-common.c:329:10: note: Value assigned to field 'ede=
sc'
           vdesc =3D vchan_find_desc(&fsl_chan->vchan, cookie);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/fsl-edma-common.c:330:6: note: Assuming field 'edesc' is null
           if (fsl_chan->edesc && cookie =3D=3D fsl_chan->edesc->vdesc.tx.c=
ookie)
               ^~~~~~~~~~~~~~~
   drivers/dma/fsl-edma-common.c:330:22: note: Left side of '&&' is false
           if (fsl_chan->edesc && cookie =3D=3D fsl_chan->edesc->vdesc.tx.c=
ookie)
                               ^
   drivers/dma/fsl-edma-common.c:333:11: note: Assuming 'vdesc' is non-null
           else if (vdesc)
                    ^~~~~
   drivers/dma/fsl-edma-common.c:333:7: note: Taking true branch
           else if (vdesc)
                ^
   drivers/dma/fsl-edma-common.c:335:4: note: Calling 'fsl_edma_desc_residu=
e'
                           fsl_edma_desc_residue(fsl_chan, vdesc, false);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/fsl-edma-common.c:273:2: note: 'edesc' initialized to a null=
 pointer value
           struct fsl_edma_desc *edesc =3D fsl_chan->edesc;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/fsl-edma-common.c:276:36: note: Access to field 'dirn' resul=
ts in a dereference of a null pointer (loaded from variable 'edesc')
           enum dma_transfer_direction dir =3D edesc->dirn;
                                             ^~~~~
   drivers/dma/fsl-edma-common.c:556:3: warning: Value stored to 'last_sg' =
is never read [clang-analyzer-deadcode.DeadStores]
                   last_sg =3D fsl_desc->tcd[(i + 1) % sg_len].ptcd;
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/fsl-edma-common.c:556:3: note: Value stored to 'last_sg' is =
never read
                   last_sg =3D fsl_desc->tcd[(i + 1) % sg_len].ptcd;
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: warning: The resu=
lt of the left shift is undefined because the left operand is negative [cla=
ng-analyzer-core.UndefinedBinaryOperatorResult]
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:6: note: Assuming fi=
eld 'crtc' is non-null
           if (!p->state->crtc || !p->state->fb)
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:25: note: Assuming f=
ield 'fb' is non-null
           if (!p->state->crtc || !p->state->fb)
                                  ^~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:2: note: Taking fals=
e branch
           if (!p->state->crtc || !p->state->fb)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:6: note: Assuming fi=
eld 'visible' is true
           if (!state->base.visible) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:2: note: Taking fals=
e branch
           if (!state->base.visible) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:753:2: note: Calling 'at=
mel_hlcdc_plane_update_disc_area'
           atmel_hlcdc_plane_update_disc_area(plane, state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Assuming fi=
eld 'disc_pos' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:27: note: Assuming f=
ield 'disc_size' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
                                    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:2: note: Taking fals=
e branch
           if (!layout->disc_pos || !layout->disc_size)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: note: The result =
of the left shift is undefined because the left operand is negative
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                 ~~~~~~~~~ ^
>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:816:39: warning: Value s=
tored to 'desc' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:816:39: note: Value stor=
ed to 'desc' during its initialization is never read
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/i2c/adv7170.c:361:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7170_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:361:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7170_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:362:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7170_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:362:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7170_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   3 warnings generated.
   drivers/i2c/busses/i2c-imx.c:821:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &i2c_imx->adapter.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx.c:821:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &i2c_imx->adapter.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx.c:883:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &i2c_imx->adapter.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx.c:883:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &i2c_imx->adapter.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
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
--
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/misc/cypress_cy7c63.c:173:2: note: Value stored to 'result' =
is never read
           result =3D vendor_command(cyp, CYPRESS_READ_PORT, read_id, 0);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/thermal/rcar_gen3_thermal.c:146:33: warning: The result of the l=
eft shift is undefined because the left operand is negative [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
                        / (ptat[0] - ptat[2])) + FIXPT_INT(TJ_3);
                                                 ^
   drivers/thermal/rcar_gen3_thermal.c:125:29: note: expanded from macro 'F=
IXPT_INT'
   #define FIXPT_INT(_x) ((_x) << FIXPT_SHIFT)
                               ^
   drivers/thermal/rcar_gen3_thermal.c:319:6: note: Assuming 'priv' is non-=
null
           if (!priv)
               ^~~~~
   drivers/thermal/rcar_gen3_thermal.c:319:2: note: Taking false branch
           if (!priv)
           ^
   drivers/thermal/rcar_gen3_thermal.c:323:6: note: Assuming the condition =
is false
           if (soc_device_match(r8a7795es1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/rcar_gen3_thermal.c:323:2: note: Taking false branch
           if (soc_device_match(r8a7795es1))
           ^
   drivers/thermal/rcar_gen3_thermal.c:331:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < TSC_MAX_NUM; i++) {
           ^
   drivers/thermal/rcar_gen3_thermal.c:335:7: note: Assuming 'res' is non-n=
ull
                   if (!res)
                       ^~~~
   drivers/thermal/rcar_gen3_thermal.c:335:3: note: Taking false branch
                   if (!res)
                   ^
   drivers/thermal/rcar_gen3_thermal.c:339:7: note: Assuming 'tsc' is non-n=
ull
                   if (!tsc) {
                       ^~~~
   drivers/thermal/rcar_gen3_thermal.c:339:3: note: Taking false branch
                   if (!tsc) {
                   ^
   drivers/thermal/rcar_gen3_thermal.c:345:3: note: Taking false branch
                   if (IS_ERR(tsc->base)) {
                   ^
   drivers/thermal/rcar_gen3_thermal.c:354:3: note: Calling 'rcar_gen3_ther=
mal_calc_coefs'
                   rcar_gen3_thermal_calc_coefs(tsc, ptat, thcodes[i],
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/rcar_gen3_thermal.c:146:33: note: The result of the left=
 shift is undefined because the left operand is negative
                        / (ptat[0] - ptat[2])) + FIXPT_INT(TJ_3);
                                                 ^
   drivers/thermal/rcar_gen3_thermal.c:125:29: note: expanded from macro 'F=
IXPT_INT'
   #define FIXPT_INT(_x) ((_x) << FIXPT_SHIFT)
                          ~~~~ ^
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
>> drivers/staging/media/omap4iss/iss_csi2.c:606:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:606:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:744:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:744:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   1 warning generated.
>> drivers/staging/media/omap4iss/iss_csiphy.c:197:3: warning: Division by =
zero [clang-analyzer-core.DivideZero]
                   / (2 * csi2->phy->used_data_lanes)
   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Left side of '=
&&' is false
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Taking false b=
ranch
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Loop condition=
 is false.  Exiting loop
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:146:6: note: Assuming field =
'interface' is not equal to ISS_INTERFACE_CSI2A_PHY1
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2A_PHY1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:146:2: note: Taking false br=
anch
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2A_PHY1) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:157:6: note: Assuming field =
'interface' is not equal to ISS_INTERFACE_CSI2B_PHY2
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2B_PHY2) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:157:2: note: Taking false br=
anch
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2B_PHY2) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:171:2: note: The value 0 is =
assigned to field 'used_data_lanes'
           csi2->phy->used_data_lanes =3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:174:14: note: Assuming 'i' i=
s >=3D field 'max_data_lanes'
           for (i =3D 0; i < csi2->phy->max_data_lanes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:174:2: note: Loop condition =
is false. Execution continues on line 189
           for (i =3D 0; i < csi2->phy->max_data_lanes; i++) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:189:6: note: Assuming field =
'pol' is <=3D 1
           if (lanes->clk.pol > 1 ||
               ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:189:6: note: Left side of '|=
|' is false
   drivers/staging/media/omap4iss/iss_csiphy.c:190:6: note: Assuming the co=
ndition is false
               lanes->clk.pos > (csi2->phy->max_data_lanes + 1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:189:2: note: Taking false br=
anch
           if (lanes->clk.pol > 1 ||
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:193:6: note: Assuming field =
'pos' is not equal to 0
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
               ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:193:6: note: Left side of '|=
|' is false
   drivers/staging/media/omap4iss/iss_csiphy.c:193:2: note: Taking false br=
anch
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:197:3: note: Division by zero
                   / (2 * csi2->phy->used_data_lanes)
   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   kernel/rcu/refscale.c:467:4: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcat(buf, "\n");
                           ^~~~~~
   kernel/rcu/refscale.c:467:4: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                           strcat(buf, "\n");
                           ^~~~~~
   kernel/rcu/refscale.c:468:3: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, buf1);
                   ^~~~~~
   kernel/rcu/refscale.c:468:3: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                   strcat(buf, buf1);
                   ^~~~~~
   kernel/rcu/refscale.c:472:2: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, "\n");
           ^~~~~~
   kernel/rcu/refscale.c:472:2: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
           strcat(buf, "\n");
           ^~~~~~
   kernel/rcu/refscale.c:551:3: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "\n");
                   ^~~~~~
   kernel/rcu/refscale.c:551:3: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                   strcat(buf, "\n");
                   ^~~~~~
   kernel/rcu/refscale.c:552:3: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, "Runs\tTime(ns)\n");
                   ^~~~~~
   kernel/rcu/refscale.c:552:3: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                   strcat(buf, "Runs\tTime(ns)\n");
                   ^~~~~~
   kernel/rcu/refscale.c:563:3: warning: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(buf, buf1);
                   ^~~~~~
   kernel/rcu/refscale.c:563:3: note: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119
                   strcat(buf, buf1);
                   ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/bus/fsl-mc/mc-io.c:193:2: warning: Value stored to 'error' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           error =3D -EINVAL;
           ^       ~~~~~~~
   drivers/bus/fsl-mc/mc-io.c:193:2: note: Value stored to 'error' is never=
 read
           error =3D -EINVAL;
           ^       ~~~~~~~
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
   drivers/regulator/core.c:3671:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3671:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
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
>> drivers/staging/media/omap4iss/iss_ipipeif.c:51:21: warning: Value store=
d to 'iss' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct iss_device *iss =3D to_iss_device(ipipeif);
                              ^~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:51:21: note: Value stored t=
o 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(ipipeif);
                              ^~~
>> drivers/staging/media/omap4iss/iss_ipipeif.c:204:2: warning: Value store=
d to 'format' is never read [clang-analyzer-deadcode.DeadStores]
           format =3D &ipipeif->formats[IPIPEIF_PAD_SOURCE_ISIF_SF];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:204:2: note: Value stored t=
o 'format' is never read
           format =3D &ipipeif->formats[IPIPEIF_PAD_SOURCE_ISIF_SF];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_ipipe.c:47:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D to_iss_device(ipipe);
                              ^~~
   drivers/staging/media/omap4iss/iss_ipipe.c:47:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(ipipe);
                              ^~~
>> drivers/staging/media/omap4iss/iss_ipipe.c:115:2: warning: Value stored =
to 'format' is never read [clang-analyzer-deadcode.DeadStores]
           format =3D &ipipe->formats[IPIPE_PAD_SOURCE_VP];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipe.c:115:2: note: Value stored to =
'format' is never read
           format =3D &ipipe->formats[IPIPE_PAD_SOURCE_VP];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_resizer.c:43:21: warning: Value store=
d to 'iss' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:43:21: note: Value stored t=
o 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:288:21: warning: Value stor=
ed to 'iss' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:288:21: note: Value stored =
to 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_video.c:125:13: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           pix->width =3D mbus->width;
                      ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Left side of '&=
&' is true
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:19: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                            ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Taking false br=
anch
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Loop condition =
is false.  Exiting loop
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/staging/media/omap4iss/iss_video.c:863:6: note: Assuming 'type' =
is equal to field 'type'
           if (type !=3D video->type)
               ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:863:2: note: Taking false bra=
nch
           if (type !=3D video->type)
           ^
   drivers/staging/media/omap4iss/iss_video.c:872:9: note: Assuming field '=
pipe' is null
           pipe =3D entity->pipe
                  ^~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:872:9: note: '?' condition is=
 false
   drivers/staging/media/omap4iss/iss_video.c:879:6: note: Assuming 'ret' i=
s 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:879:2: note: Taking false bra=
nch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:883:6: note: Assuming 'ret' i=
s 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:883:2: note: Taking false bra=
nch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:886:6: note: Assuming field '=
set_constraints' is null
           if (video->iss->pdata->set_constraints)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:886:2: note: Taking false bra=
nch
           if (video->iss->pdata->set_constraints)
           ^
   drivers/staging/media/omap4iss/iss_video.c:890:6: note: Assuming 'ret' i=
s >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:890:2: note: Taking false bra=
nch
           if (ret < 0)
           ^
   drivers/staging/media/omap4iss/iss_video.c:894:2: note: Loop condition i=
s false. Execution continues on line 901
           while ((entity =3D media_graph_walk_next(&graph)))
           ^
   drivers/staging/media/omap4iss/iss_video.c:901:8: note: Calling 'iss_vid=
eo_check_format'
           ret =3D iss_video_check_format(video, vfh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:278:8: note: Calling '__iss_v=
ideo_get_format'
           ret =3D __iss_video_get_format(video, &format);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:253:7: note: 'subdev' is non-=
null
           if (!subdev)
                ^~~~~~
   drivers/staging/media/omap4iss/iss_video.c:253:2: note: Taking false bra=
nch
           if (!subdev)
           ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: '__sd' is non-nu=
ll
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1140:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                        ^~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Taking false bra=
nch
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1140:3: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                   ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming field '=
pad' is non-null
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:14: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                              ^~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Left side of '&&=
' is true
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:14: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                              ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming the con=
dition is false
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:12: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Taking false bra=
nch
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                        ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming field '=
pad' is null
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1144:12: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (v4l2_subdev_call_wrappers.o &&                 \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Left side of '&&=
' is false
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1144:40: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (v4l2_subdev_call_wrappers.o &&                 \
                                                        ^
   drivers/staging/media/omap4iss/iss_video.c:264:6: note: Assuming 'ret' i=
s not equal to 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:264:2: note: Taking true bran=
ch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:265:3: note: Returning withou=
t writing to 'format->width'
                   return ret;
                   ^
   drivers/staging/media/omap4iss/iss_video.c:278:8: note: Returning from '=
__iss_video_get_format'
           ret =3D __iss_video_get_format(video, &format);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:279:6: note: Assuming 'ret' i=
s >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:279:2: note: Taking false bra=
nch
           if (ret < 0)
           ^
   drivers/staging/media/omap4iss/iss_video.c:283:8: note: Calling 'iss_vid=
eo_mbus_to_pix'
           ret =3D iss_video_mbus_to_pix(video, &format, &pixfmt);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:125:13: note: Assigned value =
is garbage or undefined
           pix->width =3D mbus->width;
                      ^ ~~~~~~~~~~~
>> drivers/staging/media/omap4iss/iss_video.c:333:20: warning: Value stored=
 to 'video' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct iss_video *video =3D vfh->video;
                             ^~~~~   ~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:333:20: note: Value stored to=
 'video' during its initialization is never read
           struct iss_video *video =3D vfh->video;
                             ^~~~~   ~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   5 warnings generated.
   include/asm-generic/atomic-long.h:523:9: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
           return atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   mm/memcontrol.c:6381:26: note: Passing null pointer value via 2nd parame=
ter 'events'
           __memory_events_show(m, memcg->memory_events_local);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6381:2: note: Calling '__memory_events_show'
           __memory_events_show(m, memcg->memory_events_local);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6361:46: note: Passing null pointer value via 1st parame=
ter 'v'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                                       ^~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:6361:29: note: Calling 'atomic_long_read'
           seq_printf(m, "low %lu\n", atomic_long_read(&events[MEMCG_LOW]));
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/atomic-long.h:523:9: note: Left side of '||' is false
           return atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:288:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/asm-generic/atomic-long.h:523:9: note: Left side of '||' is false
           return atomic_read(v);
--
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/greybus/manifest.c:196:2: note: Loop condition is false.  Exitin=
g loop
           list_for_each_entry(descriptor, &intf->manifest_descs, links) {
           ^
   include/linux/list.h:630:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/greybus/manifest.c:196:2: note: Loop condition is true.  Enterin=
g loop body
           list_for_each_entry(descriptor, &intf->manifest_descs, links) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/greybus/manifest.c:197:7: note: Use of memory after it is freed
                   if (descriptor->type !=3D GREYBUS_TYPE_STRING)
                       ^~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/regulator/qcom_spmi-regulator.c:400:8: warning: Excessive paddin=
g in 'struct spmi_regulator_data' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   supply, =

   ocp, =

   base, =

   force_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:400:8: note: Excessive padding i=
n 'struct spmi_regulator_data' (4 padding bytes, where 0 is optimal). Optim=
al fields order: name, supply, ocp, base, force_type, consider reordering t=
he fields or adding explicit padding members
   struct spmi_regulator_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1154:2: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/qcom_spmi-regulator.c:1154:2: note: Value stored to 'r=
et' is never read
           ret =3D spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_ENABLE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/regulator/pf8x00-regulator.c:233:22: warning: Value stored to 'c=
hip' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct pf8x00_chip *chip =3D config->driver_data;
                               ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/regulator/pf8x00-regulator.c:233:22: note: Value stored to 'chip=
' during its initialization is never read
           struct pf8x00_chip *chip =3D config->driver_data;
                               ^~~~   ~~~~~~~~~~~~~~~~~~~
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
   drivers/regulator/rk808-regulator.c:272:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_write(rdev->regmap, rdev->desc->vsel_reg,=
 val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/regulator/rk808-regulator.c:272:3: note: Value stored to 'ret' i=
s never read
                   ret =3D regmap_write(rdev->regmap, rdev->desc->vsel_reg,=
 val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
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
   1 warning generated.
>> drivers/staging/media/meson/vdec/codec_vp9.c:1422:2: warning: Use of mem=
ory after it is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(tmp, n, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:693:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2088:6: note: Assuming 'vp9=
' is non-null
           if (!vp9)
               ^~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2088:2: note: Taking false =
branch
           if (!vp9)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2092:6: note: Assuming 'dec=
_status' is equal to VP9_HEAD_PARSER_DONE
           if (dec_status !=3D VP9_HEAD_PARSER_DONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2092:2: note: Taking false =
branch
           if (dec_status !=3D VP9_HEAD_PARSER_DONE) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2099:2: note: Taking false =
branch
           pr_debug("ISR: %08X;%08X\n", dec_status, prob_status);
           ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2102:6: note: Assuming the =
condition is false
           if ((prob_status & 0xff) =3D=3D 0xfd && vp9->cur_frame) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2102:35: note: Left side of=
 '&&' is false
           if ((prob_status & 0xff) =3D=3D 0xfd && vp9->cur_frame) {
                                            ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
           for (i =3D 0; i < REFS_PER_FRAME ; ++i)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is false. Execution continues on line 2130
   drivers/staging/media/meson/vdec/codec_vp9.c:2134:2: note: Taking false =
branch
           if (codec_vp9_process_rpm(vp9)) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2151:2: note: Calling 'code=
c_vp9_process_frame'
           codec_vp9_process_frame(sess);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:6: note: Assuming fiel=
d 'show_frame' is 0
           if (!param->p.show_frame)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:2: note: Taking true b=
ranch
           if (!param->p.show_frame)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1267:3: note: Calling 'code=
c_vp9_rm_noshow_frame'
                   codec_vp9_rm_noshow_frame(sess);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Left side of =
'&&' is false
           list_for_each_entry(tmp, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Taking false =
branch
           list_for_each_entry(tmp, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Loop conditio=
n is false.  Exiting loop
--
               ^~~~~~~~~
   drivers/mmc/host/mxcmmc.c:750:2: note: Taking false branch
           if (host->dma)
           ^
   drivers/mmc/host/mxcmmc.c:753:6: note: Assuming field 'data' is non-null
           if (req->data) {
               ^~~~~~~~~
   drivers/mmc/host/mxcmmc.c:753:2: note: Taking true branch
           if (req->data) {
           ^
   drivers/mmc/host/mxcmmc.c:754:11: note: Calling 'mxcmci_setup_data'
                   error =3D mxcmci_setup_data(host, req->data);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:292:2: note: Calling 'mxcmci_writew'
           mxcmci_writew(host, nob, MMC_REG_NOB);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:212:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PPC_MPC512x))
           ^
   drivers/mmc/host/mxcmmc.c:215:3: note: Loop condition is false.  Exiting=
 loop
                   writew(val, host->base + reg);
                   ^
   arch/arm/include/asm/io.h:306:25: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
   }
   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:292:2: note: Returning from 'mxcmci_writew'
           mxcmci_writew(host, nob, MMC_REG_NOB);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:293:2: note: Calling 'mxcmci_writew'
           mxcmci_writew(host, blksz, MMC_REG_BLK_LEN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:212:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PPC_MPC512x))
           ^
   drivers/mmc/host/mxcmmc.c:215:3: note: Loop condition is false.  Exiting=
 loop
                   writew(val, host->base + reg);
                   ^
   arch/arm/include/asm/io.h:306:25: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
   }
   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:293:2: note: Returning from 'mxcmci_writew'
           mxcmci_writew(host, blksz, MMC_REG_BLK_LEN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:7: note: Calling 'mxcmci_use_dma'
           if (!mxcmci_use_dma(host))
                ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
           return host->do_dma;
           ^
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning value, which participat=
es in a condition later
           return host->do_dma;
           ^~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:7: note: Returning from 'mxcmci_use_dma'
           if (!mxcmci_use_dma(host))
                ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:6: note: Assuming the condition is false
           if (!mxcmci_use_dma(host))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:2: note: Taking false branch
           if (!mxcmci_use_dma(host))
           ^
   drivers/mmc/host/mxcmmc.c:299:42: note: Assuming 'i' is >=3D field 'sg_l=
en'
           for_each_sg(data->sg, sg, data->sg_len, i) {
                                                   ^
   include/linux/scatterlist.h:146:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:299:2: note: Loop condition is false. Executio=
n continues on line 306
           for_each_sg(data->sg, sg, data->sg_len, i) {
           ^
   include/linux/scatterlist.h:146:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   drivers/mmc/host/mxcmmc.c:306:6: note: Assuming the condition is true
           if (data->flags & MMC_DATA_READ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:306:2: note: Taking true branch
           if (data->flags & MMC_DATA_READ) {
           ^
   drivers/mmc/host/mxcmmc.c:316:21: note: Access to field 'device' results=
 in a dereference of a null pointer (loaded from field 'dma')
           nents =3D dma_map_sg(host->dma->device->dev, data->sg,
                              ^
   include/linux/dma-mapping.h:385:49: note: expanded from macro 'dma_map_s=
g'
   #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
                                                   ^
>> drivers/mmc/host/mxcmmc.c:361:6: warning: Value stored to 'int_cntr' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 int_cntr =3D host->default_irq_mask;
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:361:6: note: Value stored to 'int_cntr' during=
 its initialization is never read
           u32 int_cntr =3D host->default_irq_mask;
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
   8 warnings generated.
   fs/pipe.c:479:24: warning: Value stored to 'buf' during its initializati=
on is never read [clang-analyzer-deadcode.DeadStores]
                           struct pipe_buffer *buf =3D &pipe->bufs[head & m=
ask];
                                               ^~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/pipe.c:479:24: note: Value stored to 'buf' during its initialization =
is never read
                           struct pipe_buffer *buf =3D &pipe->bufs[head & m=
ask];
                                               ^~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 7 warnings (2 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/namei.c:2439:20: warning: The left operand of '!=3D' is a garbage val=
ue [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (unlikely(type !=3D LAST_NORM)) {
                             ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/namei.c:2433:2: note: 'type' declared without an initial value
           int type;
           ^~~~~~~~
   fs/namei.c:2435:13: note: Calling 'filename_parentat'
           filename =3D filename_parentat(AT_FDCWD, getname_kernel(name), 0=
, path,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/namei.c:2407:2: note: Taking false branch
           if (IS_ERR(name))
           ^
   fs/namei.c:2411:15: note: Assuming the condition is false
           if (unlikely(retval =3D=3D -ECHILD))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/namei.c:2411:2: note: Taking false branch
           if (unlikely(retval =3D=3D -ECHILD))
           ^
   fs/namei.c:2413:15: note: Assuming the condition is false
           if (unlikely(retval =3D=3D -ESTALE))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/namei.c:2413:2: note: Taking false branch
           if (unlikely(retval =3D=3D -ESTALE))
           ^
   fs/namei.c:2415:14: note: 'retval' is not equal to 0
           if (likely(!retval)) {
                       ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/namei.c:2415:2: note: Taking false branch
           if (likely(!retval)) {
           ^
   fs/namei.c:2424:2: note: Returning without writing to '*type'
           return name;
           ^
   fs/namei.c:2435:13: note: Returning from 'filename_parentat'
           filename =3D filename_parentat(AT_FDCWD, getname_kernel(name), 0=
, path,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/namei.c:2437:6: note: Calling 'IS_ERR'
           if (IS_ERR(filename))
               ^~~~~~~~~~~~~~~~
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
   fs/namei.c:2437:6: note: Returning from 'IS_ERR'
           if (IS_ERR(filename))
--
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/namei.c:2407:2: note: Taking false branch
           if (IS_ERR(name))
           ^
   fs/namei.c:2411:15: note: Assuming the condition is false
           if (unlikely(retval =3D=3D -ECHILD))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/namei.c:2411:2: note: Taking false branch
           if (unlikely(retval =3D=3D -ECHILD))
           ^
   fs/namei.c:2413:15: note: Assuming the condition is false
           if (unlikely(retval =3D=3D -ESTALE))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/namei.c:2413:2: note: Taking false branch
           if (unlikely(retval =3D=3D -ESTALE))
           ^
   fs/namei.c:2415:14: note: 'retval' is not equal to 0
           if (likely(!retval)) {
                       ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/namei.c:2415:2: note: Taking false branch
           if (likely(!retval)) {
           ^
   fs/namei.c:2424:2: note: Returning without writing to '*type'
           return name;
           ^
   fs/namei.c:3873:9: note: Returning from 'filename_parentat'
           name =3D filename_parentat(dfd, name, lookup_flags, &path, &last=
, &type);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/namei.c:3874:6: note: Calling 'IS_ERR'
           if (IS_ERR(name))
               ^~~~~~~~~~~~
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
   fs/namei.c:3874:6: note: Returning from 'IS_ERR'
           if (IS_ERR(name))
               ^~~~~~~~~~~~
   fs/namei.c:3874:2: note: Taking false branch
           if (IS_ERR(name))
           ^
   fs/namei.c:3878:11: note: The left operand of '!=3D' is a garbage value
           if (type !=3D LAST_NORM)
               ~~~~ ^
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/staging/media/meson/vdec/vdec.c:720:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D sess->core->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec.c:720:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D sess->core->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/mmc/host/s3cmci.c:624:2: warning: Value stored to 'mci_dcnt' is =
never read [clang-analyzer-deadcode.DeadStores]
           mci_dcnt =3D readl(host->base + S3C2410_SDIDCNT);
           ^
   drivers/mmc/host/s3cmci.c:624:2: note: Value stored to 'mci_dcnt' is nev=
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
   16 warnings generated.
   drivers/mmc/host/sh_mmcif.c:276:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:276:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D sh_mmcif_host_to_dev(host);
                          ^~~
   drivers/mmc/host/sh_mmcif.c:308:3: warning: Value stored to 'cookie' is =
never read [clang-analyzer-deadcode.DeadStores]
                   cookie =3D dmaengine_submit(desc);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:308:3: note: Value stored to 'cookie' is nev=
er read
                   cookie =3D dmaengine_submit(desc);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:358:3: warning: Value stored to 'cookie' is =
never read [clang-analyzer-deadcode.DeadStores]
                   cookie =3D dmaengine_submit(desc);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:358:3: note: Value stored to 'cookie' is nev=
er read
                   cookie =3D dmaengine_submit(desc);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:508:12: warning: The result of the left shif=
t is undefined due to shifting by '32', which is greater or equal to the wi=
dth of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                           div =3D 1 << (i + 1);
                                   ^
   drivers/mmc/host/sh_mmcif.c:1031:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&host->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/mmc/host/sh_mmcif.c:1031:2: note: Loop condition is false.  Exit=
ing loop
           spin_lock_irqsave(&host->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/mmc/host/sh_mmcif.c:1032:6: note: Assuming field 'state' is equa=
l to STATE_IDLE
           if (host->state !=3D STATE_IDLE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:1032:2: note: Taking false branch
           if (host->state !=3D STATE_IDLE) {
           ^
   drivers/mmc/host/sh_mmcif.c:1042:2: note: Control jumps to 'case 2:'  at=
 line 1065
           switch (ios->power_mode) {
           ^
   drivers/mmc/host/sh_mmcif.c:1066:3: note: Calling 'sh_mmcif_clock_contro=
l'
                   sh_mmcif_clock_control(host, ios->clock);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:482:18: note: Assuming 'p' is null
           bool sup_pclk =3D p ? p->sup_pclk : false;
                           ^
   drivers/mmc/host/sh_mmcif.c:482:18: note: '?' condition is false
   drivers/mmc/host/sh_mmcif.c:486:2: note: Calling 'sh_mmcif_bitclr'
           sh_mmcif_bitclr(host, MMCIF_CE_CLK_CTRL, CLK_ENABLE);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sh_mmcif.c:269:2: note: Loop condition is false.  Exiti=
ng loop
           writel(~val & readl(host->addr + reg), host->addr + reg);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/mmc/host/sh_mmcif.c:269:16: note: Loop condition is false.  Exit=
ing loop
           writel(~val & readl(host->addr + reg), host->addr + reg);
                         ^
   arch/arm/include/asm/io.h:303:50: note: expanded from macro 'readl'
   #define readl(c)                ({ u32 __v =3D readl_relaxed(c); __iormb=
(); __v; })
                                                                  ^
   arch/arm/include/asm/io.h:168:20: note: expanded from macro '__iormb'
   #define __iormb()               do { } while (0)
                                   ^
   drivers/mmc/host/sh_mmcif.c:270:1: note: Returning without writing to 'h=
ost->clkdiv_map', which participates in a condition later
   }
   ^
   drivers/mmc/host/sh_mmcif.c:486:2: note: Returning from 'sh_mmcif_bitclr'
           sh_mmcif_bitclr(host, MMCIF_CE_CLK_CTRL, CLK_ENABLE);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/usb/mixer_scarlett_gen2.c:659:6: note: Assuming 'resp_size' is equ=
al to field 'size'
               resp_size !=3D le16_to_cpu(resp->size) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:657:6: note: Left side of '||' is false
           if (resp->cmd !=3D req->cmd ||
               ^
   sound/usb/mixer_scarlett_gen2.c:660:6: note: Assuming field 'error' is 0
               resp->error ||
               ^~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:657:6: note: Left side of '||' is false
           if (resp->cmd !=3D req->cmd ||
               ^
   sound/usb/mixer_scarlett_gen2.c:661:6: note: Assuming field 'pad' is 0
               resp->pad) {
               ^~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:657:2: note: Taking false branch
           if (resp->cmd !=3D req->cmd ||
           ^
   sound/usb/mixer_scarlett_gen2.c:676:6: note: Assuming 'resp_size' is <=
=3D 0
           if (resp_size > 0)
               ^~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:676:2: note: Taking false branch
           if (resp_size > 0)
           ^
   sound/usb/mixer_scarlett_gen2.c:684:2: note: Returning without writing t=
o '*resp_data'
           return err;
           ^
   sound/usb/mixer_scarlett_gen2.c:762:9: note: Returning from 'scarlett2_u=
sb'
           return scarlett2_usb(mixer, SCARLETT2_USB_GET_DATA,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:762:2: note: Returning without writing t=
o '*buf'
           return scarlett2_usb(mixer, SCARLETT2_USB_GET_DATA,
           ^
   sound/usb/mixer_scarlett_gen2.c:775:9: note: Returning from 'scarlett2_u=
sb_get'
           return scarlett2_usb_get(mixer, config_item.offset, buf, size);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:775:2: note: Returning without writing t=
o '*buf'
           return scarlett2_usb_get(mixer, config_item.offset, buf, size);
           ^
   sound/usb/mixer_scarlett_gen2.c:1860:9: note: Returning from 'scarlett2_=
usb_get_config'
                   err =3D scarlett2_usb_get_config(
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1865:7: note: Assuming 'err' is >=3D 0
                   if (err < 0)
                       ^~~~~~~
   sound/usb/mixer_scarlett_gen2.c:1865:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/usb/mixer_scarlett_gen2.c:1867:8: note: The value 0 is assigned to=
 'i'
                   for (i =3D 0; i < info->pad_input_count; i++)
                        ^~~~~
   sound/usb/mixer_scarlett_gen2.c:1867:15: note: 'i' is < field 'pad_input=
_count'
                   for (i =3D 0; i < info->pad_input_count; i++)
                               ^
   sound/usb/mixer_scarlett_gen2.c:1867:3: note: Loop condition is true.  E=
ntering loop body
                   for (i =3D 0; i < info->pad_input_count; i++)
                   ^
   sound/usb/mixer_scarlett_gen2.c:1868:27: note: Assigned value is garbage=
 or undefined
                           private->pad_switch[i] =3D pad_switches[i];
                                                  ^ ~~~~~~~~~~~~~~~
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
>> sound/usb/quirks.c:591:3: warning: Value stored to 'config' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   config =3D dev->actconfig;
                   ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:591:3: note: Value stored to 'config' is never read
                   config =3D dev->actconfig;
                   ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:961:2: warning: Value stored to 'config' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           config =3D dev->actconfig;
           ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:961:2: note: Value stored to 'config' is never read
           config =3D dev->actconfig;
           ^        ~~~~~~~~~~~~~~
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
   15 warnings generated.
   drivers/media/tuners/e4000.c:12:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:12:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:80:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:80:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:99:21: warning: Value stored to 'client' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:99:21: note: Value stored to 'client' durin=
g its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:298:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:298:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:313:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:313:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:322:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:322:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:333:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:333:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:347:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:347:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:377:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:377:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:413:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:413:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:445:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:445:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:484:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:484:21: note: Value stored to 'client' duri=
ng its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/tuners/e4000.c:503:21: warning: Value stored to 'client' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
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
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   sound/firewire/dice/dice.c:61:40: warning: The result of the left shift =
is undefined because the left operand is negative [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
           if (device->config_rom[3] !=3D ((vendor << 8) | category) ||
                                                 ^
   sound/firewire/dice/dice.c:201:6: note: Assuming field 'driver_data' is 0
           if (!entry->driver_data && entry->vendor_id !=3D OUI_SSL) {
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:201:6: note: Left side of '&&' is true
   sound/firewire/dice/dice.c:201:29: note: Assuming field 'vendor_id' is n=
ot equal to OUI_SSL
           if (!entry->driver_data && entry->vendor_id !=3D OUI_SSL) {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:201:2: note: Taking true branch
           if (!entry->driver_data && entry->vendor_id !=3D OUI_SSL) {
           ^
   sound/firewire/dice/dice.c:202:9: note: Calling 'check_dice_category'
                   err =3D check_dice_category(unit);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/dice/dice.c:34:16: note: 'vendor' initialized to -1
           int key, val, vendor =3D -1, model =3D -1;
                         ^~~~~~
   sound/firewire/dice/dice.c:44:2: note: Loop condition is false. Executio=
n continues on line 55
           while (fw_csr_iterator_next(&it, &key, &val)) {
           ^
   sound/firewire/dice/dice.c:55:6: note: 'vendor' is not equal to OUI_WEISS
           if (vendor =3D=3D OUI_WEISS)
               ^~~~~~
   sound/firewire/dice/dice.c:55:2: note: Taking false branch
           if (vendor =3D=3D OUI_WEISS)
           ^
   sound/firewire/dice/dice.c:57:11: note: 'vendor' is not equal to OUI_LOUD
           else if (vendor =3D=3D OUI_LOUD)
                    ^~~~~~
   sound/firewire/dice/dice.c:57:7: note: Taking false branch
           else if (vendor =3D=3D OUI_LOUD)
                ^
   sound/firewire/dice/dice.c:61:40: note: The result of the left shift is =
undefined because the left operand is negative
           if (device->config_rom[3] !=3D ((vendor << 8) | category) ||
                                          ~~~~~~ ^
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
>> sound/usb/hiface/pcm.c:232:19: warning: Value stored to 'device' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
                           struct device *device =3D &rt->chip->dev->dev;
                                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:232:19: note: Value stored to 'device' during its=
 initialization is never read
                           struct device *device =3D &rt->chip->dev->dev;
                                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:258:17: warning: Value stored to 'device' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *device =3D &urb->chip->dev->dev;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:258:17: note: Value stored to 'device' during its=
 initialization is never read
           struct device *device =3D &urb->chip->dev->dev;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/usb/line6/driver.c:763:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->id, properties->id);
           ^~~~~~
   sound/usb/line6/driver.c:763:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->id, properties->id);
           ^~~~~~
   sound/usb/line6/driver.c:764:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->driver, driver_name);
           ^~~~~~
   sound/usb/line6/driver.c:764:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->driver, driver_name);
           ^~~~~~
   sound/usb/line6/driver.c:765:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, properties->name);
           ^~~~~~
   sound/usb/line6/driver.c:765:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(card->shortname, properties->name);
           ^~~~~~
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
   sound/firewire/bebob/bebob.c:117:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bebob->card->shortname, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:117:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(bebob->card->shortname, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:118:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(bebob->card->mixername, model);
           ^~~~~~
   sound/firewire/bebob/bebob.c:118:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(bebob->card->mixername, model);
           ^~~~~~
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/fuse/cuse.c:359:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:359:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/firewire/fireface/ff.c:31:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ff->card->shortname, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:31:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(ff->card->shortname, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:32:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
--
           ^       ~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1162:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1162:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1181:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1181:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1214:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1214:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   drivers/siox/siox-core.c:240:4: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   drivers/siox/siox-core.c:240:4: note: Value stored to 'status' is never =
read
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
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
>> drivers/staging/media/tegra-video/vi.c:1685:19: warning: Value stored to=
 'vi' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct tegra_vi *vi =3D host1x_client_to_vi(client);
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:1685:19: note: Value stored to 'v=
i' during its initialization is never read
           struct tegra_vi *vi =3D host1x_client_to_vi(client);
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   sound/usb/line6/toneport.c:202:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   sound/usb/line6/toneport.c:202:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name,
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/staging/media/imx/imx-media-csc-scaler.c:202:3: warning: Value s=
tored to 'field' is never read [clang-analyzer-deadcode.DeadStores]
                   field =3D V4L2_FIELD_NONE;
                   ^       ~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-csc-scaler.c:202:3: note: Value stor=
ed to 'field' is never read
                   field =3D V4L2_FIELD_NONE;
                   ^       ~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx-media-csc-scaler.c:801:30: warning: Value =
stored to 'priv' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct ipu_csc_scaler_priv *priv =3D video_drvdata(file);
                                       ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-csc-scaler.c:801:30: note: Value sto=
red to 'priv' during its initialization is never read
           struct ipu_csc_scaler_priv *priv =3D video_drvdata(file);
                                       ^~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/staging/media/imx/imx-media-dev-common.c:27:24: warning: Value s=
tored to 'imxmd' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct imx_media_dev *imxmd =3D notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:27:24: note: Value stor=
ed to 'imxmd' during its initialization is never read
           struct imx_media_dev *imxmd =3D notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/v4l2-core/v4l2-dev.c:1050:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D video_register_media_controller(vdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-dev.c:1050:2: note: Value stored to 'ret' i=
s never read
           ret =3D video_register_media_controller(vdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/v4l2-core/v4l2-ioctl.c:3331:3: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EFAULT;
                   ^     ~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3331:3: note: Value stored to 'err'=
 is never read
                   err =3D -EFAULT;
                   ^     ~~~~~~~
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
   drivers/staging/media/meson/vdec/vdec_helpers.c:186:6: warning: Value st=
ored to 'reg_cur' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           u32 reg_cur =3D reg_base[0];
               ^~~~~~~   ~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_helpers.c:186:6: note: Value store=
d to 'reg_cur' during its initialization is never read
           u32 reg_cur =3D reg_base[0];
               ^~~~~~~   ~~~~~~~~~~~
>> drivers/staging/media/meson/vdec/vdec_helpers.c:274:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D sess->core->dev_dec;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_helpers.c:274:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D sess->core->dev_dec;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/firewire/oxfw/oxfw-pcm.c:443:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, oxfw->card->shortname);
           ^~~~~~
   sound/firewire/oxfw/oxfw-pcm.c:443:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(pcm->name, oxfw->card->shortname);
           ^~~~~~
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
   sound/firewire/oxfw/oxfw-hwdep.c:182:2: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   sound/firewire/oxfw/oxfw-hwdep.c:182:2: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/usb/core/message.c:1703:2: warning: Value stored to 'retval' is =
never read [clang-analyzer-deadcode.DeadStores]
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:1703:2: note: Value stored to 'retval' is nev=
er read
           retval =3D 0;
           ^        ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/usb/core/driver.c:1679:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put_sync_autosuspend(&udev->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1679:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put_sync_autosuspend(&udev->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1741:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put_sync(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1741:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put_sync(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1769:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1769:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/usb/core/file.c:160:6: warning: Value stored to 'minor_base' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/file.c:160:6: note: Value stored to 'minor_base' during=
 its initialization is never read
           int minor_base =3D class_driver->minor_base;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/tuners/tuner-xc2028.c:1037:3: warning: Value stored to 'rc=
' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D send_seq(priv, {0x00, 0x00});
                   ^
   drivers/media/tuners/tuner-xc2028.c:1037:3: note: Value stored to 'rc' i=
s never read
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
   7 warnings generated.
   drivers/media/tuners/mt20xx.c:253:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:253:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
--
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:166:6: note: Assuming field 'error'=
 is not equal to 0
           if (ctx->error)
               ^~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:166:2: note: Taking true branch
           if (ctx->error)
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:2033:2: note: Returning from 'sii86=
20_read_buf'
           sii8620_read_buf(ctx, REG_FAST_INTR_STAT, stats, ARRAY_SIZE(stat=
s));
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:2034:2: note: Loop condition is tru=
e.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(irq_vec); ++i)
           ^
   drivers/gpu/drm/bridge/sil-sii8620.c:2035:7: note: Calling 'sii8620_test=
_bit'
                   if (sii8620_test_bit(irq_vec[i].bit, stats))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:2007:39: note: The left operand of =
'>>' is a garbage value
           return 1 & (addr[nr / BITS_PER_BYTE] >> (nr % BITS_PER_BYTE));
                       ~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/bridge/sil-sii8620.c:2217:18: warning: Value stored to '=
ctx' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct sii8620 *ctx =3D bridge_to_sii8620(bridge);
                           ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/sil-sii8620.c:2217:18: note: Value stored to 'ctx=
' during its initialization is never read
           struct sii8620 *ctx =3D bridge_to_sii8620(bridge);
                           ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   8 warnings generated.
   arch/arm/kernel/signal.c:207:2: warning: Value stored to 'aux' is never =
read [clang-analyzer-deadcode.DeadStores]
           aux =3D (char __user *) sf->uc.uc_regspace;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/signal.c:207:2: note: Value stored to 'aux' is never read
           aux =3D (char __user *) sf->uc.uc_regspace;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (2 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/dma/uniphier-xdmac.c:208:2: warning: Value stored to 'val' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           val &=3D ~XDMAC_TSS_REQ;
           ^      ~~~~~~~~~~~~~~
   drivers/dma/uniphier-xdmac.c:208:2: note: Value stored to 'val' is never=
 read
           val &=3D ~XDMAC_TSS_REQ;
           ^      ~~~~~~~~~~~~~~
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
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:72:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/soc/aspeed/aspeed-lpc-ctrl.c:72:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D file->private_data;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   6 warnings generated.
>> drivers/gpu/drm/tegra/hub.c:229:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:229:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D dc->dev;
                          ^~~   ~~~~~~~
   drivers/gpu/drm/tegra/hub.c:299:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:299:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:313:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:313:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_PRECOMP_WGRP_PIPE=
_METER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/tegra/hub.c:318:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:318:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_plane_readl(plane, DC_WIN_CORE_IHUB_WGRP_POOL_CO=
NFIG);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:693:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/hub.c:693:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_DISP_IHUB_COMMON_DISPLAY_FETCH_M=
ETER);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
--
           ^
   drivers/iio/proximity/sx9310.c:630:17: note: The left operand of '>>' is=
 a garbage value
           *val =3D pthresh >> (5 - regval);
                  ~~~~~~~ ^
   drivers/iio/proximity/sx9310.c:743:26: warning: The left operand of '>>'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           else if (val =3D=3D pthresh >> 2)
                                   ^
   drivers/iio/proximity/sx9310.c:803:6: note: Assuming field 'type' is equ=
al to IIO_PROXIMITY
           if (chan->type !=3D IIO_PROXIMITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:803:2: note: Taking false branch
           if (chan->type !=3D IIO_PROXIMITY)
           ^
   drivers/iio/proximity/sx9310.c:806:2: note: Control jumps to 'case IIO_E=
V_INFO_HYSTERESIS:'  at line 818
           switch (info) {
           ^
   drivers/iio/proximity/sx9310.c:819:10: note: Calling 'sx9310_write_hyste=
resis'
                   return sx9310_write_hysteresis(data, chan, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:735:11: note: 'pthresh' declared without =
an initial value
           int ret, pthresh;
                    ^~~~~~~
   drivers/iio/proximity/sx9310.c:737:8: note: Calling 'sx9310_read_thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:596:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/iio/proximity/sx9310.c:596:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9310.c:600:6: note: Assuming 'ret' is not equal =
to 0
           if (ret)
               ^~~
   drivers/iio/proximity/sx9310.c:600:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/proximity/sx9310.c:601:3: note: Returning without writing to=
 '*val'
                   return ret;
                   ^
   drivers/iio/proximity/sx9310.c:737:8: note: Returning from 'sx9310_read_=
thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:738:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/proximity/sx9310.c:738:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9310.c:741:6: note: Assuming 'val' is not equal =
to 0
           if (val =3D=3D 0)
               ^~~~~~~~
   drivers/iio/proximity/sx9310.c:741:2: note: Taking false branch
           if (val =3D=3D 0)
           ^
   drivers/iio/proximity/sx9310.c:743:26: note: The left operand of '>>' is=
 a garbage value
           else if (val =3D=3D pthresh >> 2)
                           ~~~~~~~ ^
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/core/fbmem.c:809:3: warning: Value stored to 'dst' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:809:3: note: Value stored to 'dst' is n=
ever read
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:887:3: warning: Value stored to 'src' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   src +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:887:3: note: Value stored to 'src' is n=
ever read
                   src +=3D c;
                   ^      ~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
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
   3 warnings generated.
>> drivers/usb/phy/phy-mxs-usb.c:392:6: warning: Value stored to 'phyctrl' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 phyctrl =3D readl(base + HW_USBPHY_CTRL);
               ^~~~~~~
   drivers/usb/phy/phy-mxs-usb.c:392:6: note: Value stored to 'phyctrl' dur=
ing its initialization is never read
           u32 phyctrl =3D readl(base + HW_USBPHY_CTRL);
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
   10 warnings generated.
   drivers/usb/core/hub.c:459:19: warning: Value stored to 'port_dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct usb_port *port_dev =3D hub->ports[port1 - 1];
                            ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/hub.c:459:19: note: Value stored to 'port_dev' during i=
ts initialization is never read
           struct usb_port *port_dev =3D hub->ports[port1 - 1];
                            ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/hub.c:462:2: warning: Value stored to 'status' is never=
 read [clang-analyzer-deadcode.DeadStores]
           status =3D set_port_feature(hub->hdev, (selector << 8) | port1,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/hub.c:462:2: note: Value stored to 'status' is never re=
ad
           status =3D set_port_feature(hub->hdev, (selector << 8) | port1,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/hub.c:531:10: warning: Division by zero [clang-analyzer=
-core.DivideZero]
                   cursor %=3D hdev->maxchild;
                   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/usb/core/hub.c:473:3: note: Left side of '&&' is false
                   container_of(work, struct usb_hub, leds.work);
                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/core/hub.c:473:3: note: Taking false branch
                   container_of(work, struct usb_hub, leds.work);
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/usb/core/hub.c:473:3: note: Loop condition is false.  Exiting lo=
op
                   container_of(work, struct usb_hub, leds.work);
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/usb/core/hub.c:479:6: note: Assuming field 'state' is equal to U=
SB_STATE_CONFIGURED
           if (hdev->state !=3D USB_STATE_CONFIGURED || hub->quiescing)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/hub.c:479:6: note: Left side of '||' is false
   drivers/usb/core/hub.c:479:45: note: Assuming field 'quiescing' is 0
           if (hdev->state !=3D USB_STATE_CONFIGURED || hub->quiescing)
                                                      ^~~~~~~~~~~~~~
   drivers/usb/core/hub.c:479:2: note: Taking false branch
           if (hdev->state !=3D USB_STATE_CONFIGURED || hub->quiescing)
           ^
   drivers/usb/core/hub.c:482:14: note: Assuming 'i' is >=3D field 'maxchil=
d'
           for (i =3D 0; i < hdev->maxchild; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/usb/core/hub.c:482:2: note: Loop condition is false. Execution c=
ontinues on line 529
           for (i =3D 0; i < hdev->maxchild; i++) {
           ^
   drivers/usb/core/hub.c:529:7: note: 'changed' is 0
           if (!changed && blinkenlights) {
                ^~~~~~~
   drivers/usb/core/hub.c:529:6: note: Left side of '&&' is true
           if (!changed && blinkenlights) {
               ^
   drivers/usb/core/hub.c:529:18: note: Assuming 'blinkenlights' is true
           if (!changed && blinkenlights) {
                           ^~~~~~~~~~~~~
   drivers/usb/core/hub.c:529:2: note: Taking true branch
--
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/drm_syncobj.c:447:32: note: Taking false branch
           struct drm_syncobj *syncobj =3D container_of(kref,
                                         ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/drm_syncobj.c:447:32: note: Loop condition is false.  Ex=
iting loop
           struct drm_syncobj *syncobj =3D container_of(kref,
                                         ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/drm_syncobj.c:451:2: note: Memory is released
           kfree(syncobj);
           ^~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Returning; memory was released
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:518:3: note: Returning; memory was release=
d via 1st parameter
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:537:8: note: Returning; memory was release=
d via 2nd parameter
           ret =3D drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:538:2: note: Use of memory after it is fre=
ed
           drm_syncobj_put(syncobj);
           ^               ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: warning: The resu=
lt of the left shift is undefined because the left operand is negative [cla=
ng-analyzer-core.UndefinedBinaryOperatorResult]
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:6: note: Assuming fi=
eld 'crtc' is non-null
           if (!p->state->crtc || !p->state->fb)
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:25: note: Assuming f=
ield 'fb' is non-null
           if (!p->state->crtc || !p->state->fb)
                                  ^~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:740:2: note: Taking fals=
e branch
           if (!p->state->crtc || !p->state->fb)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:6: note: Assuming fi=
eld 'visible' is true
           if (!state->base.visible) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:743:2: note: Taking fals=
e branch
           if (!state->base.visible) {
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:753:2: note: Calling 'at=
mel_hlcdc_plane_update_disc_area'
           atmel_hlcdc_plane_update_disc_area(plane, state);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Assuming fi=
eld 'disc_pos' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:6: note: Left side o=
f '||' is false
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:27: note: Assuming f=
ield 'disc_size' is not equal to 0
           if (!layout->disc_pos || !layout->disc_size)
                                    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:583:2: note: Taking fals=
e branch
           if (!layout->disc_pos || !layout->disc_size)
           ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:591:5: note: The result =
of the left shift is undefined because the left operand is negative
                                   ATMEL_HLCDC_LAYER_DISC_SIZE(state->disc_=
w,
                                   ^
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h:115:67: note: expanded from=
 macro 'ATMEL_HLCDC_LAYER_DISC_SIZE'
   #define ATMEL_HLCDC_LAYER_DISC_SIZE(w, h)       (((w) - 1) | (((h) - 1) =
<< 16))
                                                                 ~~~~~~~~~ ^
>> drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:816:39: warning: Value s=
tored to 'desc' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:816:39: note: Value stor=
ed to 'desc' during its initialization is never read
           const struct atmel_hlcdc_layer_desc *desc =3D plane->layer.desc;
                                                ^~~~   ~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   drivers/media/i2c/adv7170.c:361:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7170_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:361:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7170_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:362:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7170_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:362:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7170_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/power/supply/power_supply_core.c:944:8: warning: Access to field=
 'devdata' results in a dereference of a null pointer (loaded from variable=
 'tzd') [clang-analyzer-core.NullDereference]
           psy =3D tzd->devdata;
                 ^~~
   drivers/power/supply/power_supply_core.c:943:10: note: Assuming 'tzd' is=
 equal to null
           WARN_ON(tzd =3D=3D NULL);
                   ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/power/supply/power_supply_core.c:944:8: note: Access to field 'd=
evdata' results in a dereference of a null pointer (loaded from variable 't=
zd')
           psy =3D tzd->devdata;
                 ^~~
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   5 warnings generated.
   include/linux/list.h:821:2: warning: Undefined or garbage value returned=
 to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return !READ_ONCE(h->pprev);
           ^
   kernel/rcu/rcutorture.c:1472:2: note: Assuming 'verbose' is 0
           VERBOSE_TOROUT_STRING("rcu_torture_reader task started");
           ^
   include/linux/torture.h:35:11: note: expanded from macro 'VERBOSE_TOROUT=
_STRING'
           do { if (verbose) pr_alert("%s" TORTURE_FLAG " %s\n", torture_ty=
pe, s); } while (0)
                    ^~~~~~~
   kernel/rcu/rcutorture.c:1472:2: note: Taking false branch
           VERBOSE_TOROUT_STRING("rcu_torture_reader task started");
--
           ^
   include/linux/count_zeros.h:26:3: note: Returning the value 32, which pa=
rticipates in a condition later
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/count_zeros.h:26:3: note: Returning the value 32
                   return BITS_PER_LONG - fls(x);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:473:26: note: Returning from 'count_leading_zeros'
                           normalization_steps =3D count_leading_zeros(divi=
sor_limb);
                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/mpi/mpih-div.c:473:4: note: The value 32 is assigned to 'normalizati=
on_steps'
                           normalization_steps =3D count_leading_zeros(divi=
sor_limb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   lib/mpi/mpih-div.c:474:8: note: 'normalization_steps' is 32
                           if (normalization_steps) {
                               ^~~~~~~~~~~~~~~~~~~
   lib/mpi/mpih-div.c:474:4: note: Taking true branch
                           if (normalization_steps) {
                           ^
   lib/mpi/mpih-div.c:475:18: note: Assigned value is garbage or undefined
                                   divisor_limb <<=3D normalization_steps;
                                                ^   ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/iio/chemical/bme680_core.c:741:2: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/bme680_core.c:741:2: note: Value stored to 'ret' is=
 never read
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   drivers/phy/socionext/phy-uniphier-usb3ss.c:90:2: warning: Value stored =
to 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val &=3D ~FIELD_PREP(TESTI_DAT_MASK, field_mask);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/socionext/phy-uniphier-usb3ss.c:90:2: note: Value stored to =
'val' is never read
           val &=3D ~FIELD_PREP(TESTI_DAT_MASK, field_mask);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/phy/socionext/phy-uniphier-pcie.c:83:2: warning: Value stored to=
 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val &=3D ~FIELD_PREP(TESTI_DAT_MASK, mask);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/socionext/phy-uniphier-pcie.c:83:2: note: Value stored to 'v=
al' is never read
           val &=3D ~FIELD_PREP(TESTI_DAT_MASK, mask);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/tegra/dc.c:1950:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1950:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1954:2: warning: Value stored to 'value' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1954:2: note: Value stored to 'value' is neve=
r read
           value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/gpu/drm/tegra/hda.c:53:3: warning: Value stored to 'bits' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/hda.c:53:3: note: Value stored to 'bits' is never =
read
                   bits =3D (format & AC_FMT_BITS_MASK) >> AC_FMT_BITS_SHIF=
T;
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   arch/arm/kernel/traps.c:185:4: warning: Value stored to 'p' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:185:4: note: Value stored to 'p' is never read
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (1 in non-user code, 12 with check filters).
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
   3 warnings generated.
   drivers/regulator/core.c:3671:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3671:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
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
   4 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/media/cec/core/cec-api.c:637:29: note: Left side of '&&' is false
           struct cec_adapter *adap =3D to_cec_adapter(devnode);
                                      ^
   drivers/media/cec/core/cec-priv.h:21:30: note: expanded from macro 'to_c=
ec_adapter'
   #define to_cec_adapter(node) container_of(node, struct cec_adapter, devn=
ode)
                                ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/cec/core/cec-api.c:637:29: note: Taking false branch
           struct cec_adapter *adap =3D to_cec_adapter(devnode);
                                      ^
   drivers/media/cec/core/cec-priv.h:21:30: note: expanded from macro 'to_c=
ec_adapter'
   #define to_cec_adapter(node) container_of(node, struct cec_adapter, devn=
ode)
                                ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
--
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:892:3: warning: Value stored to 'csr' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   csr =3D musb_readw(hw_ep->regs, MUSB_RXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:892:3: note: Value stored to 'csr' is never=
 read
                   csr =3D musb_readw(hw_ep->regs, MUSB_RXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:2336:3: warning: Value stored to 'csr' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   csr =3D musb_h_flush_rxfifo(ep, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:2336:3: note: Value stored to 'csr' is neve=
r read
                   csr =3D musb_h_flush_rxfifo(ep, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:2354:3: warning: Value stored to 'csr' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   csr =3D musb_readw(epio, MUSB_TXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/musb/musb_host.c:2354:3: note: Value stored to 'csr' is neve=
r read
                   csr =3D musb_readw(epio, MUSB_TXCSR);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/mfd/tps65010.c:650:5: warning: Value stored to 'status' is never=
 read [clang-analyzer-deadcode.DeadStores]
                                   status =3D 0;
                                   ^        ~
   drivers/mfd/tps65010.c:650:5: note: Value stored to 'status' is never re=
ad
                                   status =3D 0;
                                   ^        ~
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
>> drivers/staging/media/omap4iss/iss_csi2.c:606:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:606:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:744:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csi2.c:744:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D csi2->iss;
                              ^~~   ~~~~~~~~~
   1 warning generated.
>> drivers/staging/media/omap4iss/iss_csiphy.c:197:3: warning: Division by =
zero [clang-analyzer-core.DivideZero]
                   / (2 * csi2->phy->used_data_lanes)
   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Left side of '=
&&' is false
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Taking false b=
ranch
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/omap4iss/iss_csiphy.c:119:30: note: Loop condition=
 is false.  Exiting loop
           struct iss_pipeline *pipe =3D to_iss_pipeline(&csi2_subdev->enti=
ty);
                                       ^
   drivers/staging/media/omap4iss/iss_video.h:95:2: note: expanded from mac=
ro 'to_iss_pipeline'
           container_of((__e)->pipe, struct iss_pipeline, pipe)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:146:6: note: Assuming field =
'interface' is not equal to ISS_INTERFACE_CSI2A_PHY1
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2A_PHY1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:146:2: note: Taking false br=
anch
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2A_PHY1) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:157:6: note: Assuming field =
'interface' is not equal to ISS_INTERFACE_CSI2B_PHY2
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2B_PHY2) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:157:2: note: Taking false br=
anch
           if (subdevs->interface =3D=3D ISS_INTERFACE_CSI2B_PHY2) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:171:2: note: The value 0 is =
assigned to field 'used_data_lanes'
           csi2->phy->used_data_lanes =3D 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:174:14: note: Assuming 'i' i=
s >=3D field 'max_data_lanes'
           for (i =3D 0; i < csi2->phy->max_data_lanes; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:174:2: note: Loop condition =
is false. Execution continues on line 189
           for (i =3D 0; i < csi2->phy->max_data_lanes; i++) {
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:189:6: note: Assuming field =
'pol' is <=3D 1
           if (lanes->clk.pol > 1 ||
               ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:189:6: note: Left side of '|=
|' is false
   drivers/staging/media/omap4iss/iss_csiphy.c:190:6: note: Assuming the co=
ndition is false
               lanes->clk.pos > (csi2->phy->max_data_lanes + 1))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:189:2: note: Taking false br=
anch
           if (lanes->clk.pol > 1 ||
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:193:6: note: Assuming field =
'pos' is not equal to 0
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
               ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_csiphy.c:193:6: note: Left side of '|=
|' is false
   drivers/staging/media/omap4iss/iss_csiphy.c:193:2: note: Taking false br=
anch
           if (lanes->clk.pos =3D=3D 0 || used_lanes & (1 << lanes->clk.pos=
))
           ^
   drivers/staging/media/omap4iss/iss_csiphy.c:197:3: note: Division by zero
                   / (2 * csi2->phy->used_data_lanes)
   ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
--
           ^
   drivers/iio/light/adux1020.c:374:3: note: Control jumps to 'case IIO_PRO=
XIMITY:'  at line 375
                   switch (chan->type) {
                   ^
   drivers/iio/light/adux1020.c:377:8: note: 'ret' is >=3D 0
                           if (ret < 0)
                               ^~~
   drivers/iio/light/adux1020.c:377:4: note: Taking false branch
                           if (ret < 0)
                           ^
   drivers/iio/light/adux1020.c:380:10: note: Calling 'adux1020_measure'
                           ret =3D adux1020_measure(data, ADUX1020_MODE_PRO=
X_I, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/light/adux1020.c:320:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:320:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:327:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:327:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:330:2: note: Loop condition is true.  Enter=
ing loop body
           while (tries--) {
           ^
   drivers/iio/light/adux1020.c:333:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0)
                       ^~~~~~~
   drivers/iio/light/adux1020.c:333:3: note: Taking false branch
                   if (ret < 0)
                   ^
   drivers/iio/light/adux1020.c:337:7: note: Assuming 'status' is >=3D fiel=
d 'bytes'
                   if (status >=3D adux1020_modes[mode].bytes)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:337:3: note: Taking true branch
                   if (status >=3D adux1020_modes[mode].bytes)
                   ^
   drivers/iio/light/adux1020.c:338:4: note:  Execution continues on line 3=
42
                           break;
                           ^
   drivers/iio/light/adux1020.c:342:6: note: 'tries' is >=3D 0
           if (tries < 0)
               ^~~~~
   drivers/iio/light/adux1020.c:342:2: note: Taking false branch
           if (tries < 0)
           ^
   drivers/iio/light/adux1020.c:345:8: note: Calling 'adux1020_read_fifo'
           ret =3D adux1020_read_fifo(data, val, adux1020_modes[mode].buf_l=
en);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:260:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:260:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:263:14: note: Assuming 'i' is >=3D 'buf_len'
           for (i =3D 0; i < buf_len; i++) {
                       ^~~~~~~~~~~
   drivers/iio/light/adux1020.c:263:2: note: Loop condition is false. Execu=
tion continues on line 273
           for (i =3D 0; i < buf_len; i++) {
           ^
   drivers/iio/light/adux1020.c:273:2: note: Returning without writing to '=
*buf'
           return regmap_write(data->regmap, ADUX1020_REG_TEST_MODES_3,
           ^
   drivers/iio/light/adux1020.c:345:8: note: Returning from 'adux1020_read_=
fifo'
           ret =3D adux1020_read_fifo(data, val, adux1020_modes[mode].buf_l=
en);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/light/adux1020.c:346:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:346:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:352:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/light/adux1020.c:352:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/light/adux1020.c:356:2: note: Returning without writing to '=
*val'
           return regmap_update_bits(data->regmap, ADUX1020_REG_INT_MASK,
           ^
   drivers/iio/light/adux1020.c:380:10: note: Returning from 'adux1020_meas=
ure'
                           ret =3D adux1020_measure(data, ADUX1020_MODE_PRO=
X_I, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/iio/light/adux1020.c:381:8: note: Assuming 'ret' is >=3D 0
                           if (ret < 0)
                               ^~~~~~~
   drivers/iio/light/adux1020.c:381:4: note: Taking false branch
                           if (ret < 0)
                           ^
   drivers/iio/light/adux1020.c:384:9: note: Assigned value is garbage or u=
ndefined
                           *val =3D buf[0];
                                ^ ~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_ipipeif.c:51:21: warning: Value store=
d to 'iss' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct iss_device *iss =3D to_iss_device(ipipeif);
                              ^~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:51:21: note: Value stored t=
o 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(ipipeif);
                              ^~~
>> drivers/staging/media/omap4iss/iss_ipipeif.c:204:2: warning: Value store=
d to 'format' is never read [clang-analyzer-deadcode.DeadStores]
           format =3D &ipipeif->formats[IPIPEIF_PAD_SOURCE_ISIF_SF];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipeif.c:204:2: note: Value stored t=
o 'format' is never read
           format =3D &ipipeif->formats[IPIPEIF_PAD_SOURCE_ISIF_SF];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_ipipe.c:47:21: warning: Value stored =
to 'iss' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct iss_device *iss =3D to_iss_device(ipipe);
                              ^~~
   drivers/staging/media/omap4iss/iss_ipipe.c:47:21: note: Value stored to =
'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(ipipe);
                              ^~~
>> drivers/staging/media/omap4iss/iss_ipipe.c:115:2: warning: Value stored =
to 'format' is never read [clang-analyzer-deadcode.DeadStores]
           format =3D &ipipe->formats[IPIPE_PAD_SOURCE_VP];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_ipipe.c:115:2: note: Value stored to =
'format' is never read
           format =3D &ipipe->formats[IPIPE_PAD_SOURCE_VP];
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_resizer.c:43:21: warning: Value store=
d to 'iss' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:43:21: note: Value stored t=
o 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:288:21: warning: Value stor=
ed to 'iss' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   drivers/staging/media/omap4iss/iss_resizer.c:288:21: note: Value stored =
to 'iss' during its initialization is never read
           struct iss_device *iss =3D to_iss_device(resizer);
                              ^~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/omap4iss/iss_video.c:125:13: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           pix->width =3D mbus->width;
                      ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Left side of '&=
&' is true
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:19: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                            ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Taking false br=
anch
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/omap4iss/iss_video.c:853:29: note: Loop condition =
is false.  Exiting loop
           struct iss_video_fh *vfh =3D to_iss_video_fh(fh);
                                      ^
   drivers/staging/media/omap4iss/iss_video.h:181:29: note: expanded from m=
acro 'to_iss_video_fh'
   #define to_iss_video_fh(fh)     container_of(fh, struct iss_video_fh, vf=
h)
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/staging/media/omap4iss/iss_video.c:863:6: note: Assuming 'type' =
is equal to field 'type'
           if (type !=3D video->type)
               ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:863:2: note: Taking false bra=
nch
           if (type !=3D video->type)
           ^
   drivers/staging/media/omap4iss/iss_video.c:872:9: note: Assuming field '=
pipe' is null
           pipe =3D entity->pipe
                  ^~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:872:9: note: '?' condition is=
 false
   drivers/staging/media/omap4iss/iss_video.c:879:6: note: Assuming 'ret' i=
s 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:879:2: note: Taking false bra=
nch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:883:6: note: Assuming 'ret' i=
s 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:883:2: note: Taking false bra=
nch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:886:6: note: Assuming field '=
set_constraints' is null
           if (video->iss->pdata->set_constraints)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:886:2: note: Taking false bra=
nch
           if (video->iss->pdata->set_constraints)
           ^
   drivers/staging/media/omap4iss/iss_video.c:890:6: note: Assuming 'ret' i=
s >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:890:2: note: Taking false bra=
nch
           if (ret < 0)
           ^
   drivers/staging/media/omap4iss/iss_video.c:894:2: note: Loop condition i=
s false. Execution continues on line 901
           while ((entity =3D media_graph_walk_next(&graph)))
           ^
   drivers/staging/media/omap4iss/iss_video.c:901:8: note: Calling 'iss_vid=
eo_check_format'
           ret =3D iss_video_check_format(video, vfh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:278:8: note: Calling '__iss_v=
ideo_get_format'
           ret =3D __iss_video_get_format(video, &format);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:253:7: note: 'subdev' is non-=
null
           if (!subdev)
                ^~~~~~
   drivers/staging/media/omap4iss/iss_video.c:253:2: note: Taking false bra=
nch
           if (!subdev)
           ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: '__sd' is non-nu=
ll
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1140:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                        ^~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Taking false bra=
nch
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1140:3: note: expanded from macro 'v4l2_subd=
ev_call'
                   if (!__sd)                                              \
                   ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming field '=
pad' is non-null
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:14: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                              ^~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Left side of '&&=
' is true
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:14: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                              ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming the con=
dition is false
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:12: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Taking false bra=
nch
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1142:8: note: expanded from macro 'v4l2_subd=
ev_call'
                   else if (!(__sd->ops->o && __sd->ops->o->f))            \
                        ^
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Assuming field '=
pad' is null
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1144:12: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (v4l2_subdev_call_wrappers.o &&                 \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:261:8: note: Left side of '&&=
' is false
           ret =3D v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
                 ^
   include/media/v4l2-subdev.h:1144:40: note: expanded from macro 'v4l2_sub=
dev_call'
                   else if (v4l2_subdev_call_wrappers.o &&                 \
                                                        ^
   drivers/staging/media/omap4iss/iss_video.c:264:6: note: Assuming 'ret' i=
s not equal to 0
           if (ret)
               ^~~
   drivers/staging/media/omap4iss/iss_video.c:264:2: note: Taking true bran=
ch
           if (ret)
           ^
   drivers/staging/media/omap4iss/iss_video.c:265:3: note: Returning withou=
t writing to 'format->width'
                   return ret;
                   ^
   drivers/staging/media/omap4iss/iss_video.c:278:8: note: Returning from '=
__iss_video_get_format'
           ret =3D __iss_video_get_format(video, &format);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:279:6: note: Assuming 'ret' i=
s >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:279:2: note: Taking false bra=
nch
           if (ret < 0)
           ^
   drivers/staging/media/omap4iss/iss_video.c:283:8: note: Calling 'iss_vid=
eo_mbus_to_pix'
           ret =3D iss_video_mbus_to_pix(video, &format, &pixfmt);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:125:13: note: Assigned value =
is garbage or undefined
           pix->width =3D mbus->width;
                      ^ ~~~~~~~~~~~
>> drivers/staging/media/omap4iss/iss_video.c:333:20: warning: Value stored=
 to 'video' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           struct iss_video *video =3D vfh->video;
                             ^~~~~   ~~~~~~~~~~
   drivers/staging/media/omap4iss/iss_video.c:333:20: note: Value stored to=
 'video' during its initialization is never read
           struct iss_video *video =3D vfh->video;
                             ^~~~~   ~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/regulator/rk808-regulator.c:272:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_write(rdev->regmap, rdev->desc->vsel_reg,=
 val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/regulator/rk808-regulator.c:272:3: note: Value stored to 'ret' i=
s never read
                   ret =3D regmap_write(rdev->regmap, rdev->desc->vsel_reg,=
 val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/iio/adc/bcm_iproc_adc.c:120:17: warning: Value stored to 'dev' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &indio_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/iio/adc/bcm_iproc_adc.c:120:17: note: Value stored to 'dev' duri=
ng its initialization is never read
           struct device *dev =3D &indio_dev->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   drivers/iio/adc/hx711.c:536:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D of_property_read_u32(np, "clock-frequency",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/hx711.c:536:2: note: Value stored to 'ret' is never read
           ret =3D of_property_read_u32(np, "clock-frequency",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/platform/chrome/cros_ec_i2c.c:91:2: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cros_ec_prepare_tx(ec_dev, msg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/chrome/cros_ec_i2c.c:91:2: note: Value stored to 'ret' =
is never read
           ret =3D cros_ec_prepare_tx(ec_dev, msg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/mailbox/imx-mailbox.c:209:19: warning: The left operand of '>' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (msg.hdr.size > sizeof(msg) / 4) {
               ~~~~~~~~~~~~ ^
   drivers/mailbox/imx-mailbox.c:209:19: note: The left operand of '>' is a=
 garbage value
           if (msg.hdr.size > sizeof(msg) / 4) {
               ~~~~~~~~~~~~ ^
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
--
                           if (freefirst =3D=3D NULL) {
                           ^
   sound/core/seq/seq_prioq.c:285:2: note: Loop condition is true.  Enterin=
g loop body
           while (cell) {
           ^
   sound/core/seq/seq_prioq.c:287:7: note: Assuming the condition is true
                   if (prioq_match(cell, client, timestamp)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:287:3: note: Taking true branch
                   if (prioq_match(cell, client, timestamp)) {
                   ^
   sound/core/seq/seq_prioq.c:289:8: note: 'cell' is equal to field 'head'
                           if (cell =3D=3D f->head) {
                               ^~~~
   sound/core/seq/seq_prioq.c:289:4: note: Taking true branch
                           if (cell =3D=3D f->head) {
                           ^
   sound/core/seq/seq_prioq.c:294:8: note: Assuming 'cell' is not equal to =
field 'tail'
                           if (cell =3D=3D f->tail)
                               ^~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:294:4: note: Taking false branch
                           if (cell =3D=3D f->tail)
                           ^
   sound/core/seq/seq_prioq.c:299:8: note: 'freefirst' is not equal to NULL
                           if (freefirst =3D=3D NULL) {
                               ^~~~~~~~~
   sound/core/seq/seq_prioq.c:299:4: note: Taking false branch
                           if (freefirst =3D=3D NULL) {
                           ^
   sound/core/seq/seq_prioq.c:285:2: note: Loop condition is true.  Enterin=
g loop body
           while (cell) {
           ^
   sound/core/seq/seq_prioq.c:287:7: note: Assuming the condition is true
                   if (prioq_match(cell, client, timestamp)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:287:3: note: Taking true branch
                   if (prioq_match(cell, client, timestamp)) {
                   ^
   sound/core/seq/seq_prioq.c:289:8: note: Assuming 'cell' is not equal to =
field 'head'
                           if (cell =3D=3D f->head) {
                               ^~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:289:4: note: Taking false branch
                           if (cell =3D=3D f->head) {
                           ^
   sound/core/seq/seq_prioq.c:292:16: note: Access to field 'next' results =
in a dereference of a null pointer (loaded from variable 'prev')
                                   prev->next =3D cell->next;
                                   ~~~~       ^
   2 warnings generated.
   drivers/of/property.c:901:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:901:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:901:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:907:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:907:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:907:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
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
   drivers/staging/media/imx/imx-media-csc-scaler.c:202:3: warning: Value s=
tored to 'field' is never read [clang-analyzer-deadcode.DeadStores]
                   field =3D V4L2_FIELD_NONE;
                   ^       ~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-csc-scaler.c:202:3: note: Value stor=
ed to 'field' is never read
                   field =3D V4L2_FIELD_NONE;
                   ^       ~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx-media-csc-scaler.c:801:30: warning: Value =
stored to 'priv' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct ipu_csc_scaler_priv *priv =3D video_drvdata(file);
                                       ^~~~   ~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-csc-scaler.c:801:30: note: Value sto=
red to 'priv' during its initialization is never read
           struct ipu_csc_scaler_priv *priv =3D video_drvdata(file);
                                       ^~~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/tuners/tda18250.c:445:11: warning: The result of the left =
shift is undefined due to shifting by '4294967295', which is greater or equ=
al to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorR=
esult]
           lopd =3D 1 << (exp - 1);
                    ^  ~~~~~~~~~
   drivers/media/tuners/tda18250.c:439:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/tuners/tda18250.c:439:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/tuners/tda18250.c:443:6: note: Assuming 'exp' is > 5
           if (exp > 5)
               ^~~~~~~
   drivers/media/tuners/tda18250.c:443:2: note: Taking true branch
           if (exp > 5)
           ^
   drivers/media/tuners/tda18250.c:445:11: note: The result of the left shi=
ft is undefined due to shifting by '4294967295', which is greater or equal =
to the width of type 'int'
           lopd =3D 1 << (exp - 1);
                    ^  ~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/tda18250.c:695:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D regmap_write_bits(dev->regmap, R46_CPUMP, 0x07, buf[2]);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   sound/firewire/dice/dice-pcm.c:444:3: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pcm->name, dice->card->shortname);
                   ^~~~~~
   sound/firewire/dice/dice-pcm.c:444:3: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
                   strcpy(pcm->name, dice->card->shortname);
                   ^~~~~~
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
   4 warnings generated.
   fs/fuse/control.c:132:23: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
                           fc->max_background =3D val;
                                              ^ ~~~
   fs/fuse/control.c:123:2: note: 'val' declared without an initial value
           unsigned val;
           ^~~~~~~~~~~~
   fs/fuse/control.c:126:8: note: Calling 'fuse_conn_limit_write'
           ret =3D fuse_conn_limit_write(file, buf, count, ppos, &val,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:84:6: note: Assuming the condition is false
           if (*ppos)
               ^~~~~
   fs/fuse/control.c:84:2: note: Taking false branch
           if (*ppos)
           ^
   fs/fuse/control.c:88:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   fs/fuse/control.c:88:2: note: Taking true branch
           if (err)
           ^
   fs/fuse/control.c:89:3: note: Returning without writing to '*val'
                   return err;
                   ^
   fs/fuse/control.c:126:8: note: Returning from 'fuse_conn_limit_write'
           ret =3D fuse_conn_limit_write(file, buf, count, ppos, &val,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:128:6: note: Assuming 'ret' is > 0
           if (ret > 0) {
               ^~~~~~~
   fs/fuse/control.c:128:2: note: Taking true branch
           if (ret > 0) {
           ^
   fs/fuse/control.c:129:26: note: Calling 'fuse_ctl_file_conn_get'
                   struct fuse_conn *fc =3D fuse_ctl_file_conn_get(file);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/control.c:28:6: note: Assuming 'fc' is non-null
           if (fc)
               ^~
   fs/fuse/control.c:28:2: note: Taking true branch
           if (fc)
           ^
   fs/fuse/control.c:31:2: note: Returning pointer (loaded from 'fc'), whic=
h participates in a condition later
           return fc;
           ^~~~~~~~~
   fs/fuse/control.c:129:26: note: Returning from 'fuse_ctl_file_conn_get'
                   struct fuse_conn *fc =3D fuse_ctl_file_conn_get(file);
--
   drivers/media/common/videobuf2/videobuf2-core.c:2859:3: note: Taking fal=
se branch
                   if (prequeue) {
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:2863:4: note: Assuming f=
ield 'wait_finish' is null
                           call_void_qop(q, wait_finish, q);
                           ^
   drivers/media/common/videobuf2/videobuf2-core.c:162:7: note: expanded fr=
om macro 'call_void_qop'
                   if ((q)->ops->op)                                       \
                       ^~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:2863:4: note: Taking fal=
se branch
                           call_void_qop(q, wait_finish, q);
                           ^
   drivers/media/common/videobuf2/videobuf2-core.c:162:3: note: expanded fr=
om macro 'call_void_qop'
                   if ((q)->ops->op)                                       \
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:2863:4: note: Loop condi=
tion is false.  Exiting loop
                           call_void_qop(q, wait_finish, q);
                           ^
   drivers/media/common/videobuf2/videobuf2-core.c:161:2: note: expanded fr=
om macro 'call_void_qop'
           do {                                                            \
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:2864:8: note: Assuming f=
ield 'stop' is false
                           if (!threadio->stop)
                               ^~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:2864:4: note: Taking tru=
e branch
                           if (!threadio->stop)
                           ^
   drivers/media/common/videobuf2/videobuf2-core.c:2865:11: note: Calling '=
vb2_core_dqbuf'
                                   ret =3D vb2_core_dqbuf(q, &index, NULL, =
0);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1867:2: note: 'vb' initi=
alized to a null pointer value
           struct vb2_buffer *vb =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1870:8: note: Calling '_=
_vb2_get_done_vb'
           ret =3D __vb2_get_done_vb(q, &vb, pb, nonblocking);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1812:6: note: Assuming '=
ret' is not equal to 0
           if (ret)
               ^~~
   drivers/media/common/videobuf2/videobuf2-core.c:1812:2: note: Taking tru=
e branch
           if (ret)
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:1813:3: note: Returning =
without writing to '*vb'
                   return ret;
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:1870:8: note: Returning =
from '__vb2_get_done_vb'
           ret =3D __vb2_get_done_vb(q, &vb, pb, nonblocking);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1871:6: note: Assuming '=
ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:1871:2: note: Taking fal=
se branch
           if (ret < 0)
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:1874:10: note: Access to=
 field 'state' results in a dereference of a null pointer (loaded from vari=
able 'vb')
           switch (vb->state) {
                   ^~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/usb/caiaq/audio.c:123:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:123:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:144:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:144:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:156:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:156:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:191:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:191:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:274:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:274:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:874:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:874:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> sound/usb/hiface/pcm.c:232:19: warning: Value stored to 'device' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
                           struct device *device =3D &rt->chip->dev->dev;
                                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:232:19: note: Value stored to 'device' during its=
 initialization is never read
                           struct device *device =3D &rt->chip->dev->dev;
                                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:258:17: warning: Value stored to 'device' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *device =3D &urb->chip->dev->dev;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   sound/usb/hiface/pcm.c:258:17: note: Value stored to 'device' during its=
 initialization is never read
           struct device *device =3D &urb->chip->dev->dev;
                          ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
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
   sound/firewire/amdtp-stream.c:1138:41: warning: Division by zero [clang-=
analyzer-core.DivideZero]
                                   sched_irq =3D !((s->packet_index + 1) %
                                                                       ^
   sound/firewire/amdtp-stream.c:1402:2: note: Left side of '&&' is false
           list_for_each_entry(s, &d->streams, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/firewire/amdtp-stream.c:1402:2: note: Taking false branch
           list_for_each_entry(s, &d->streams, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/firewire/amdtp-stream.c:1402:2: note: Loop condition is false.  Ex=
iting loop
           list_for_each_entry(s, &d->streams, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/firewire/amdtp-stream.c:1402:2: note: Loop condition is false. Exe=
cution continues on line 1406
           list_for_each_entry(s, &d->streams, list) {
--
                   ^
   sound/firewire/bebob/bebob_stream.c:676:10: note: 2nd function call argu=
ment is an uninitialized value
                           err =3D bebob->spec->rate->set(bebob, curr_rate);
                                 ^                             ~~~~~~~~~
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
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   drivers/phy/qualcomm/phy-qcom-qusb2.c:475:17: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct device *dev =3D &qphy->phy->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qusb2.c:475:17: note: Value stored to 'dev=
' during its initialization is never read
           struct device *dev =3D &qphy->phy->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:624:16: warning: Value sto=
red to 'tmdsclock' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:624:16: note: Value stored=
 to 'tmdsclock' during its initialization is never read
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:742:3: warning: Value stor=
ed to 'no_c' is never read [clang-analyzer-deadcode.DeadStores]
                   no_c =3D 1 << no_c;
                   ^      ~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:742:3: note: Value stored =
to 'no_c' is never read
                   no_c =3D 1 << no_c;
                   ^      ~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:778:16: warning: Value sto=
red to 'tmdsclock' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:778:16: note: Value stored=
 to 'tmdsclock' during its initialization is never read
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/staging/media/meson/vdec/codec_vp9.c:1422:2: warning: Use of mem=
ory after it is freed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(tmp, n, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:693:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2088:6: note: Assuming 'vp9=
' is non-null
           if (!vp9)
               ^~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2088:2: note: Taking false =
branch
           if (!vp9)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2092:6: note: Assuming 'dec=
_status' is equal to VP9_HEAD_PARSER_DONE
           if (dec_status !=3D VP9_HEAD_PARSER_DONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2092:2: note: Taking false =
branch
           if (dec_status !=3D VP9_HEAD_PARSER_DONE) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2099:2: note: Taking false =
branch
           pr_debug("ISR: %08X;%08X\n", dec_status, prob_status);
           ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2102:6: note: Assuming the =
condition is false
           if ((prob_status & 0xff) =3D=3D 0xfd && vp9->cur_frame) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:2102:35: note: Left side of=
 '&&' is false
           if ((prob_status & 0xff) =3D=3D 0xfd && vp9->cur_frame) {
                                            ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
           for (i =3D 0; i < REFS_PER_FRAME ; ++i)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is true.  Entering loop body
   drivers/staging/media/meson/vdec/codec_vp9.c:2127:2: note: Loop conditio=
n is false. Execution continues on line 2130
   drivers/staging/media/meson/vdec/codec_vp9.c:2134:2: note: Taking false =
branch
           if (codec_vp9_process_rpm(vp9)) {
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:2151:2: note: Calling 'code=
c_vp9_process_frame'
           codec_vp9_process_frame(sess);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:6: note: Assuming fiel=
d 'show_frame' is 0
           if (!param->p.show_frame)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1266:2: note: Taking true b=
ranch
           if (!param->p.show_frame)
           ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1267:3: note: Calling 'code=
c_vp9_rm_noshow_frame'
                   codec_vp9_rm_noshow_frame(sess);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Left side of =
'&&' is false
           list_for_each_entry(tmp, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Taking false =
branch
           list_for_each_entry(tmp, &vp9->ref_frames_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/media/meson/vdec/codec_vp9.c:1246:2: note: Loop conditio=
n is false.  Exiting loop
--
               ^~~~~~~~~
   drivers/mmc/host/mxcmmc.c:750:2: note: Taking false branch
           if (host->dma)
           ^
   drivers/mmc/host/mxcmmc.c:753:6: note: Assuming field 'data' is non-null
           if (req->data) {
               ^~~~~~~~~
   drivers/mmc/host/mxcmmc.c:753:2: note: Taking true branch
           if (req->data) {
           ^
   drivers/mmc/host/mxcmmc.c:754:11: note: Calling 'mxcmci_setup_data'
                   error =3D mxcmci_setup_data(host, req->data);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:292:2: note: Calling 'mxcmci_writew'
           mxcmci_writew(host, nob, MMC_REG_NOB);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:212:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PPC_MPC512x))
           ^
   drivers/mmc/host/mxcmmc.c:215:3: note: Loop condition is false.  Exiting=
 loop
                   writew(val, host->base + reg);
                   ^
   arch/arm/include/asm/io.h:306:25: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
   }
   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:292:2: note: Returning from 'mxcmci_writew'
           mxcmci_writew(host, nob, MMC_REG_NOB);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:293:2: note: Calling 'mxcmci_writew'
           mxcmci_writew(host, blksz, MMC_REG_BLK_LEN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:212:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_PPC_MPC512x))
           ^
   drivers/mmc/host/mxcmmc.c:215:3: note: Loop condition is false.  Exiting=
 loop
                   writew(val, host->base + reg);
                   ^
   arch/arm/include/asm/io.h:306:25: note: expanded from macro 'writew'
   #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:169:20: note: expanded from macro '__iowmb'
   #define __iowmb()               do { } while (0)
                                   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
   }
   ^
   drivers/mmc/host/mxcmmc.c:216:1: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:293:2: note: Returning from 'mxcmci_writew'
           mxcmci_writew(host, blksz, MMC_REG_BLK_LEN);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:7: note: Calling 'mxcmci_use_dma'
           if (!mxcmci_use_dma(host))
                ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning without writing to 'hos=
t->do_dma', which participates in a condition later
           return host->do_dma;
           ^
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning without writing to 'hos=
t->dma'
   drivers/mmc/host/mxcmmc.c:237:2: note: Returning value, which participat=
es in a condition later
           return host->do_dma;
           ^~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:7: note: Returning from 'mxcmci_use_dma'
           if (!mxcmci_use_dma(host))
                ^~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:6: note: Assuming the condition is false
           if (!mxcmci_use_dma(host))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:296:2: note: Taking false branch
           if (!mxcmci_use_dma(host))
           ^
   drivers/mmc/host/mxcmmc.c:299:42: note: Assuming 'i' is >=3D field 'sg_l=
en'
           for_each_sg(data->sg, sg, data->sg_len, i) {
                                                   ^
   include/linux/scatterlist.h:146:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:299:2: note: Loop condition is false. Executio=
n continues on line 306
           for_each_sg(data->sg, sg, data->sg_len, i) {
           ^
   include/linux/scatterlist.h:146:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   drivers/mmc/host/mxcmmc.c:306:6: note: Assuming the condition is true
           if (data->flags & MMC_DATA_READ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:306:2: note: Taking true branch
           if (data->flags & MMC_DATA_READ) {
           ^
   drivers/mmc/host/mxcmmc.c:316:21: note: Access to field 'device' results=
 in a dereference of a null pointer (loaded from field 'dma')
           nents =3D dma_map_sg(host->dma->device->dev, data->sg,
                              ^
   include/linux/dma-mapping.h:385:49: note: expanded from macro 'dma_map_s=
g'
   #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
                                                   ^
>> drivers/mmc/host/mxcmmc.c:361:6: warning: Value stored to 'int_cntr' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 int_cntr =3D host->default_irq_mask;
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/mxcmmc.c:361:6: note: Value stored to 'int_cntr' during=
 its initialization is never read
           u32 int_cntr =3D host->default_irq_mask;
               ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/i2c/busses/i2c-imx.c:821:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &i2c_imx->adapter.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx.c:821:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &i2c_imx->adapter.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx.c:883:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &i2c_imx->adapter.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx.c:883:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D &i2c_imx->adapter.dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~
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
   drivers/media/tuners/tuner-xc2028.c:1037:3: warning: Value stored to 'rc=
' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D send_seq(priv, {0x00, 0x00});
                   ^
   drivers/media/tuners/tuner-xc2028.c:1037:3: note: Value stored to 'rc' i=
s never read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/asm-generic/bitops/non-atomic.h:106:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/perf/arm_pmu.c:761:24: note: Assuming '____ptr' is null
           struct arm_pmu *pmu =3D hlist_entry_safe(node, struct arm_pmu, n=
ode);
                                 ^
   include/linux/list.h:983:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   drivers/perf/arm_pmu.c:761:24: note: '?' condition is false
           struct arm_pmu *pmu =3D hlist_entry_safe(node, struct arm_pmu, n=
ode);
                                 ^
   include/linux/list.h:983:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   drivers/perf/arm_pmu.c:764:7: note: Calling 'cpumask_test_cpu'
           if (!cpumask_test_cpu(cpu, &pmu->supported_cpus))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:373:38: note: Passing null pointer value via 2nd=
 parameter 'addr'
           return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
                                               ^
   include/linux/cpumask.h:26:29: note: expanded from macro 'cpumask_bits'
   #define cpumask_bits(maskp) ((maskp)->bits)
                               ^~~~~~~~~~~~~~~
   include/linux/cpumask.h:373:9: note: Calling 'test_bit'
           return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:106:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
--
   drivers/usb/isp1760/isp1760-hcd.c:1616:19: note: 'urb' is equal to field=
 'urb'
                   if (qtd->urb !=3D urb)
                                   ^~~
   drivers/usb/isp1760/isp1760-hcd.c:1616:3: note: Taking false branch
                   if (qtd->urb !=3D urb)
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1619:7: note: Assuming field 'status' =
is >=3D QTD_XFER_STARTED
                   if (qtd->status >=3D QTD_XFER_STARTED)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1619:3: note: Taking true branch
                   if (qtd->status >=3D QTD_XFER_STARTED)
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1621:7: note: Calling 'last_qtd_of_urb'
                   if (last_qtd_of_urb(qtd, qh) &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:517:6: note: Assuming the condition is=
 true
           if (list_is_last(&qtd->qtd_list, &qh->qtd_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:517:2: note: Taking true branch
           if (list_is_last(&qtd->qtd_list, &qh->qtd_list))
           ^
   drivers/usb/isp1760/isp1760-hcd.c:518:3: note: Returning without writing=
 to 'qh->slot'
                   return 1;
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1621:7: note: Returning from 'last_qtd=
_of_urb'
                   if (last_qtd_of_urb(qtd, qh) &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1621:7: note: Left side of '&&' is true
   drivers/usb/isp1760/isp1760-hcd.c:1622:7: note: Assuming field 'status' =
is < QTD_XFER_COMPLETE
                                           (qtd->status >=3D QTD_XFER_COMPL=
ETE))
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1621:3: note: Taking false branch
                   if (last_qtd_of_urb(qtd, qh) &&
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1625:12: note: Field 'status' is equal=
 to QTD_XFER_STARTED
                   if (qtd->status =3D=3D QTD_XFER_STARTED)
                            ^
   drivers/usb/isp1760/isp1760-hcd.c:1625:3: note: Taking true branch
                   if (qtd->status =3D=3D QTD_XFER_STARTED)
                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1626:4: note: Calling 'kill_transfer'
                           kill_transfer(hcd, urb, qh);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1582:10: note: Assuming the condition =
is true
           WARN_ON(qh->slot =3D=3D -1);
                   ^
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:1586:6: note: Assuming the condition i=
s false
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
               ^
   include/linux/usb.h:1942:32: note: expanded from macro 'usb_pipecontrol'
   #define usb_pipecontrol(pipe)   (usb_pipetype((pipe)) =3D=3D PIPE_CONTRO=
L)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:1939:28: note: expanded from macro 'usb_pipetype'
   #define usb_pipetype(pipe)      (((pipe) >> 30) & 3)
                                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1586:6: note: Left side of '||' is fal=
se
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
               ^
   include/linux/usb.h:1942:31: note: expanded from macro 'usb_pipecontrol'
   #define usb_pipecontrol(pipe)   (usb_pipetype((pipe)) =3D=3D PIPE_CONTRO=
L)
                                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1586:36: note: Assuming the condition =
is false
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
                                             ^
   include/linux/usb.h:1943:29: note: expanded from macro 'usb_pipebulk'
   #define usb_pipebulk(pipe)      (usb_pipetype((pipe)) =3D=3D PIPE_BULK)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb.h:1939:28: note: expanded from macro 'usb_pipetype'
   #define usb_pipetype(pipe)      (((pipe) >> 30) & 3)
                                   ^
   drivers/usb/isp1760/isp1760-hcd.c:1586:2: note: Taking false branch
           if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
           ^
   drivers/usb/isp1760/isp1760-hcd.c:1594:18: note: The result of the left =
shift is undefined because the right operand is negative
                   skip_map |=3D (1 << qh->slot);
                                  ^  ~~~~~~~~
   drivers/usb/isp1760/isp1760-hcd.c:2096:42: warning: Although the value s=
tored to 'temp' is used in the enclosing expression, the value is never act=
ually read from 'temp' [clang-analyzer-deadcode.DeadStores]
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   drivers/usb/isp1760/isp1760-hcd.c:2096:42: note: Although the value stor=
ed to 'temp' is used in the enclosing expression, the value is never actual=
ly read from 'temp'
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   drivers/usb/isp1760/isp1760-hcd.c:2108:42: warning: Although the value s=
tored to 'temp' is used in the enclosing expression, the value is never act=
ually read from 'temp' [clang-analyzer-deadcode.DeadStores]
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   drivers/usb/isp1760/isp1760-hcd.c:2108:42: note: Although the value stor=
ed to 'temp' is used in the enclosing expression, the value is never actual=
ly read from 'temp'
           reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INT=
R_EN);
                                                   ^       ~~~~~~~~~~~~~~~~=
~~
   Suppressed 1 warnings (1 in non-user code).
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
>> sound/usb/quirks.c:591:3: warning: Value stored to 'config' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   config =3D dev->actconfig;
                   ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:591:3: note: Value stored to 'config' is never read
                   config =3D dev->actconfig;
                   ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:961:2: warning: Value stored to 'config' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           config =3D dev->actconfig;
           ^        ~~~~~~~~~~~~~~
   sound/usb/quirks.c:961:2: note: Value stored to 'config' is never read
           config =3D dev->actconfig;
           ^        ~~~~~~~~~~~~~~
   4 warnings generated.
   sound/usb/midi.c:1296:4: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           err =3D -ENOMEM;
                           ^     ~~~~~~~
   sound/usb/midi.c:1296:4: note: Value stored to 'err' is never read
                           err =3D -ENOMEM;
                           ^     ~~~~~~~
   sound/usb/midi.c:1309:4: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           err =3D -ENOMEM;
                           ^     ~~~~~~~
   sound/usb/midi.c:1309:4: note: Value stored to 'err' is never read
                           err =3D -ENOMEM;
                           ^     ~~~~~~~
   sound/usb/midi.c:2268:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rmidi->name, umidi->card->shortname);
           ^~~~~~
   sound/usb/midi.c:2268:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(rmidi->name, umidi->card->shortname);
           ^~~~~~
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
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (2 in non-user code, 9 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/media/i2c/adv7842.c:1566:32: warning: The result of the left shi=
ft is undefined because the left operand is negative [clang-analyzer-core.U=
ndefinedBinaryOperatorResult]
                   freq =3D ((hdmi_read(sd, 0x51) << 1) + (hdmi_read(sd, 0x=
52) >> 7)) * 1000000;
                                                ^
   drivers/media/i2c/adv7842.c:2708:36: note: Assuming the condition is fal=
se
           v4l2_info(sd, "Chip power: %s\n", no_power(sd) ? "off" : "on");
                                             ^
   include/media/v4l2-common.h:67:39: note: expanded from macro 'v4l2_info'
           v4l2_printk(KERN_INFO, dev, fmt , ## arg)
                                                ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_print=
k'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                                                     ^~~
   drivers/media/i2c/adv7842.c:2708:36: note: '?' condition is false
           v4l2_info(sd, "Chip power: %s\n", no_power(sd) ? "off" : "on");
                                             ^
   drivers/media/i2c/adv7842.c:2710:4: note: Assuming field 'hdmi_port_a' i=
s false
                           state->hdmi_port_a ? "A" : "B");
                           ^
   include/media/v4l2-common.h:67:39: note: expanded from macro 'v4l2_info'
           v4l2_printk(KERN_INFO, dev, fmt , ## arg)
                                                ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_print=
k'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                                                     ^~~
   drivers/media/i2c/adv7842.c:2710:4: note: '?' condition is false
                           state->hdmi_port_a ? "A" : "B");
                           ^
   drivers/media/i2c/adv7842.c:2712:7: note: Assuming the condition is false
                     ((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)) ?
                       ^
   include/media/v4l2-common.h:67:39: note: expanded from macro 'v4l2_info'
           v4l2_printk(KERN_INFO, dev, fmt , ## arg)
                                                ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_print=
k'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                                                     ^~~
   drivers/media/i2c/adv7842.c:2712:28: note: Left side of '&&' is false
                     ((reg_rep_0x7d & 0x04) && (reg_rep_0x77 & 0x04)) ?
                                            ^
   drivers/media/i2c/adv7842.c:2714:7: note: Assuming the condition is false
                     ((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)) ?
                       ^
   include/media/v4l2-common.h:67:39: note: expanded from macro 'v4l2_info'
           v4l2_printk(KERN_INFO, dev, fmt , ## arg)
                                                ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_print=
k'
           printk(level "%s: " fmt, (dev)->name , ## arg)
                                                     ^~~
   drivers/media/i2c/adv7842.c:2714:28: note: Left side of '&&' is false
                     ((reg_rep_0x7d & 0x08) && (reg_rep_0x77 & 0x08)) ?
                                            ^
   drivers/media/i2c/adv7842.c:2717:5: note: Assuming the condition is false
--
           ^       ~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1162:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1162:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1181:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1181:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1214:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1214:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
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
   4 warnings generated.
   sound/firewire/oxfw/oxfw.c:104:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->driver, d);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:104:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->driver, d);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:105:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->mixername, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:105:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->mixername, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:106:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(oxfw->card->shortname, m);
           ^~~~~~
   sound/firewire/oxfw/oxfw.c:106:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(oxfw->card->shortname, m);
           ^~~~~~
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
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/staging/media/meson/vdec/vdec.c:720:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D sess->core->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec.c:720:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D sess->core->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/staging/media/meson/vdec/vdec_helpers.c:186:6: warning: Value st=
ored to 'reg_cur' during its initialization is never read [clang-analyzer-d=
eadcode.DeadStores]
           u32 reg_cur =3D reg_base[0];
               ^~~~~~~   ~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_helpers.c:186:6: note: Value store=
d to 'reg_cur' during its initialization is never read
           u32 reg_cur =3D reg_base[0];
               ^~~~~~~   ~~~~~~~~~~~
>> drivers/staging/media/meson/vdec/vdec_helpers.c:274:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D sess->core->dev_dec;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/meson/vdec/vdec_helpers.c:274:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D sess->core->dev_dec;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
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
   Suppressed 2 warnings (2 in non-user code).
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
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/staging/media/tegra-video/vi.c:1685:19: warning: Value stored to=
 'vi' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct tegra_vi *vi =3D host1x_client_to_vi(client);
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/tegra-video/vi.c:1685:19: note: Value stored to 'v=
i' during its initialization is never read
           struct tegra_vi *vi =3D host1x_client_to_vi(client);
                            ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/iio/dac/ad5064.c:105:8: warning: Excessive padding in 'struct ad=
5064_state' (47 padding bytes, where 15 is optimal). =

   Optimal fields order: =

   data, =

   dev, =

   chip_info, =

   write, =

   dac_cache, =

   lock, =

   vref_reg, =

   use_internal_vref, =

   pwr_down, =

   pwr_down_mode, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5064.c:105:8: note: Excessive padding in 'struct ad506=
4_state' (47 padding bytes, where 15 is optimal). Optimal fields order: dat=
a, dev, chip_info, write, dac_cache, lock, vref_reg, use_internal_vref, pwr=
_down, pwr_down_mode, consider reordering the fields or adding explicit pad=
ding members
   struct ad5064_state {
   ~~~~~~~^~~~~~~~~~~~~~
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
   sound/firewire/fireface/ff.c:31:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ff->card->shortname, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:31:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(ff->card->shortname, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:32:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ff->card->mixername, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:32:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(ff->card->mixername, name);
           ^~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   drivers/staging/vc04_services/bcm2835-camera/controls.c:888:3: warning: =
Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/staging/vc04_services/bcm2835-camera/controls.c:888:3: note: Val=
ue stored to 'ret' is never read
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1748:3: warning: V=
alue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D disable_component(instance, component);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:1748:3: note: Valu=
e stored to 'ret' is never read
                   ret =3D disable_component(instance, component);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
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
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/fuse/cuse.c:359:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:359:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: warning: Value stored to 'rc' is never read [clang=
-analyzer-deadcode.DeadStores]
           rc =3D -ENOMEM;
           ^    ~~~~~~~
   fs/fuse/cuse.c:386:2: note: Value stored to 'rc' is never read
           rc =3D -ENOMEM;
           ^    ~~~~~~~
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
   drivers/media/mc/mc-request.c:190:23: warning: Value stored to 'mdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:190:23: note: Value stored to 'mdev' durin=
g its initialization is never read
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/v4l2-core/v4l2-dev.c:1050:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D video_register_media_controller(vdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-dev.c:1050:2: note: Value stored to 'ret' i=
s never read
           ret =3D video_register_media_controller(vdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/v4l2-core/v4l2-ioctl.c:3331:3: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EFAULT;
                   ^     ~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3331:3: note: Value stored to 'err'=
 is never read
                   err =3D -EFAULT;
                   ^     ~~~~~~~
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
>> drivers/staging/media/imx/imx-media-dev-common.c:27:24: warning: Value s=
tored to 'imxmd' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct imx_media_dev *imxmd =3D notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx-media-dev-common.c:27:24: note: Value stor=
ed to 'imxmd' during its initialization is never read
           struct imx_media_dev *imxmd =3D notifier2dev(notifier);
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~
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
   7 warnings generated.
   drivers/media/tuners/mt20xx.c:253:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:253:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mfd/rohm-bd70528.c:282:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(bd70528->chip.regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/rohm-bd70528.c:282:2: note: Value stored to 'ret' is never r=
ead
           ret =3D regmap_update_bits(bd70528->chip.regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   sound/firewire/oxfw/oxfw-pcm.c:443:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, oxfw->card->shortname);
           ^~~~~~
   sound/firewire/oxfw/oxfw-pcm.c:443:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(pcm->name, oxfw->card->shortname);
           ^~~~~~
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
   sound/firewire/oxfw/oxfw-hwdep.c:182:2: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   sound/firewire/oxfw/oxfw-hwdep.c:182:2: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
           strcpy(hwdep->name, oxfw->card->driver);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/dev +229 drivers/gpu/drm/tegra/hub.c

c4755fb9064f64 Thierry Reding 2017-11-13  225  =

c4755fb9064f64 Thierry Reding 2017-11-13  226  static bool tegra_dc_owns_sh=
ared_plane(struct tegra_dc *dc,
1087fac18b8e3e Thierry Reding 2017-12-14  227  				       struct tegra_plan=
e *plane)
c4755fb9064f64 Thierry Reding 2017-11-13  228  {
c4755fb9064f64 Thierry Reding 2017-11-13 @229  	struct device *dev =3D dc->=
dev;
c4755fb9064f64 Thierry Reding 2017-11-13  230  =

c4755fb9064f64 Thierry Reding 2017-11-13  231  	if (tegra_shared_plane_get_=
owner(plane, dc) =3D=3D dc->pipe) {
c4755fb9064f64 Thierry Reding 2017-11-13  232  		if (plane->dc =3D=3D dc)
c4755fb9064f64 Thierry Reding 2017-11-13  233  			return true;
c4755fb9064f64 Thierry Reding 2017-11-13  234  =

c4755fb9064f64 Thierry Reding 2017-11-13  235  		dev_WARN(dev, "head %u own=
s window %u but is not attached\n",
1087fac18b8e3e Thierry Reding 2017-12-14  236  			 dc->pipe, plane->index);
c4755fb9064f64 Thierry Reding 2017-11-13  237  	}
c4755fb9064f64 Thierry Reding 2017-11-13  238  =

c4755fb9064f64 Thierry Reding 2017-11-13  239  	return false;
c4755fb9064f64 Thierry Reding 2017-11-13  240  }
c4755fb9064f64 Thierry Reding 2017-11-13  241  =


:::::: The code at line 229 was first introduced by commit
:::::: c4755fb9064f64083fe559e92a46df817fc5e07b drm/tegra: Add Tegra186 dis=
play hub support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5235102419330907096==--

