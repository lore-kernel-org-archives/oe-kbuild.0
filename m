Content-Type: multipart/mixed; boundary="===============8294662230792813589=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/gma500/cdv_intel_dp.c:863:2: warning: Null pointer passed as 2nd argument to string copy function [clang-analyzer-unix.cstring.NullArg]
Date: Mon, 27 Dec 2021 14:54:36 +0800
Message-ID: <202112271409.Cjq8ceMY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8294662230792813589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2
commit: 26499e0518a77de29e7db2c53fb0d0e9e15be8fb drm/gma500: Drop DRM_GMA36=
00 config option
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-c001-20211226 (https://download.01.org/0day-ci/arch=
ive/20211227/202112271409.Cjq8ceMY-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1=
ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D26499e0518a77de29e7db2c53fb0d0e9e15be8fb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 26499e0518a77de29e7db2c53fb0d0e9e15be8fb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/phy/cadence/phy-cadence-torrent.c:907:6: note: Assuming field 's=
et_lanes' is not equal to 0
           if (opts->dp.set_lanes) {
               ^~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:907:2: note: Taking true branch
           if (opts->dp.set_lanes) {
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:908:9: note: Calling 'cdns_tor=
rent_dp_set_lanes'
                   ret =3D cdns_torrent_dp_set_lanes(cdns_phy, &opts->dp);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:778:25: note: The result of th=
e left shift is undefined because the left operand is negative
           value |=3D ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
                     ~~~~~~~~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/gma500/cdv_intel_display.c:761:2: warning: Value stored =
to 'dpll' is never read [clang-analyzer-deadcode.DeadStores]
           dpll |=3D DPLL_VCO_ENABLE;
           ^
   drivers/gpu/drm/gma500/cdv_intel_display.c:761:2: note: Value stored to =
'dpll' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/gpu/drm/gma500/cdv_intel_dp.c:863:2: warning: Null pointer passe=
d as 2nd argument to string copy function [clang-analyzer-unix.cstring.Null=
Arg]
           strncpy (intel_dp->adapter.name, name, sizeof(intel_dp->adapter.=
name) - 1);
           ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1960:2: note: 'name' initialized t=
o a null pointer value
           const char *name =3D NULL;
           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1963:16: note: Calling 'kzalloc'
           gma_encoder =3D kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:540:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:557:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1963:16: note: Returning from 'kza=
lloc'
           gma_encoder =3D kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1964:6: note: Assuming 'gma_encode=
r' is non-null
           if (!gma_encoder)
               ^~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1964:2: note: Taking false branch
           if (!gma_encoder)
           ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1966:25: note: Calling 'kzalloc'
           gma_connector =3D kzalloc(sizeof(struct gma_connector), GFP_KERN=
EL);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:540:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:557:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1966:25: note: Returning from 'kza=
lloc'
           gma_connector =3D kzalloc(sizeof(struct gma_connector), GFP_KERN=
EL);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1967:13: note: Assuming 'gma_conne=
ctor' is non-null
           if (!gma_connector)
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1967:9: note: Taking false branch
           if (!gma_connector)
           ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1969:13: note: Calling 'kzalloc'
           intel_dp =3D kzalloc(sizeof(struct cdv_intel_dp), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:540:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:557:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1969:13: note: Returning from 'kza=
lloc'
           intel_dp =3D kzalloc(sizeof(struct cdv_intel_dp), GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1970:6: note: Assuming 'intel_dp' =
is non-null
           if (!intel_dp)
               ^~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1970:2: note: Taking false branch
           if (!intel_dp)
           ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1973:7: note: Assuming 'output_reg=
' is not equal to DP_C
           if ((output_reg =3D=3D DP_C) && cdv_intel_dpc_is_edp(dev))
                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1973:27: note: Left side of '&&' i=
s false
           if ((output_reg =3D=3D DP_C) && cdv_intel_dpc_is_edp(dev))
                                    ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1984:6: note: 'type' is equal to D=
RM_MODE_CONNECTOR_DisplayPort
           if (type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
               ^~~~
   drivers/gpu/drm/gma500/cdv_intel_dp.c:1984:2: note: Taking true branch
           if (type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
           ^
   drivers/gpu/drm/gma500/cdv_intel_dp.c:2004:2: note: 'Default' branch tak=
en. Execution continues on line 2015
           switch (output_reg) {

vim +863 drivers/gpu/drm/gma500/cdv_intel_dp.c

8695b612943561 Alan Cox         2012-08-08  846  =

8695b612943561 Alan Cox         2012-08-08  847  static int
367e44080e20f7 Patrik Jakobsson 2013-07-22  848  cdv_intel_dp_i2c_init(stru=
ct gma_connector *connector,
367e44080e20f7 Patrik Jakobsson 2013-07-22  849  		      struct gma_encoder=
 *encoder, const char *name)
8695b612943561 Alan Cox         2012-08-08  850  {
37e7b184da18a9 Alan Cox         2012-08-08  851  	struct cdv_intel_dp *inte=
l_dp =3D encoder->dev_priv;
d112a8163f8375 Zhao Yakui       2012-08-08  852  	int ret;
d112a8163f8375 Zhao Yakui       2012-08-08  853  =

8695b612943561 Alan Cox         2012-08-08  854  	DRM_DEBUG_KMS("i2c_init %=
s\n", name);
d112a8163f8375 Zhao Yakui       2012-08-08  855  =

8695b612943561 Alan Cox         2012-08-08  856  	intel_dp->algo.running =
=3D false;
8695b612943561 Alan Cox         2012-08-08  857  	intel_dp->algo.address =
=3D 0;
37e7b184da18a9 Alan Cox         2012-08-08  858  	intel_dp->algo.aux_ch =3D=
 cdv_intel_dp_i2c_aux_ch;
8695b612943561 Alan Cox         2012-08-08  859  =

8695b612943561 Alan Cox         2012-08-08  860  	memset(&intel_dp->adapter=
, '\0', sizeof (intel_dp->adapter));
8695b612943561 Alan Cox         2012-08-08  861  	intel_dp->adapter.owner =
=3D THIS_MODULE;
8695b612943561 Alan Cox         2012-08-08  862  	intel_dp->adapter.class =
=3D I2C_CLASS_DDC;
8695b612943561 Alan Cox         2012-08-08 @863  	strncpy (intel_dp->adapte=
r.name, name, sizeof(intel_dp->adapter.name) - 1);
8695b612943561 Alan Cox         2012-08-08  864  	intel_dp->adapter.name[si=
zeof(intel_dp->adapter.name) - 1] =3D '\0';
8695b612943561 Alan Cox         2012-08-08  865  	intel_dp->adapter.algo_da=
ta =3D &intel_dp->algo;
5bdebb183c9702 Dave Airlie      2013-10-11  866  	intel_dp->adapter.dev.par=
ent =3D connector->base.kdev;
8695b612943561 Alan Cox         2012-08-08  867  =

d112a8163f8375 Zhao Yakui       2012-08-08  868  	if (is_edp(encoder))
d112a8163f8375 Zhao Yakui       2012-08-08  869  		cdv_intel_edp_panel_vdd_=
on(encoder);
d112a8163f8375 Zhao Yakui       2012-08-08  870  	ret =3D i2c_dp_aux_add_bu=
s(&intel_dp->adapter);
d112a8163f8375 Zhao Yakui       2012-08-08  871  	if (is_edp(encoder))
d112a8163f8375 Zhao Yakui       2012-08-08  872  		cdv_intel_edp_panel_vdd_=
off(encoder);
d112a8163f8375 Zhao Yakui       2012-08-08  873  	=

d112a8163f8375 Zhao Yakui       2012-08-08  874  	return ret;
d112a8163f8375 Zhao Yakui       2012-08-08  875  }
d112a8163f8375 Zhao Yakui       2012-08-08  876  =


:::::: The code at line 863 was first introduced by commit
:::::: 8695b612943561478fd22f28f45e5692e5d078db gma500: Add the support of =
display port on CDV

:::::: TO: Alan Cox <alan@linux.intel.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8294662230792813589==--

