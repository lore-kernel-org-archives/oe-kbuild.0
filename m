Content-Type: multipart/mixed; boundary="===============7721933971112626848=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ptp/ptp_ocp.c:773:2: warning: Value stored to 'ctrl' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 19 Dec 2021 08:54:00 +0800
Message-ID: <202112190822.6HmzS0fV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7721933971112626848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Lemon <jonathan.lemon@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3f667b5d4053ad54aee13dab5c94f04ff75ddfdf
commit: 1acffc6e09ede525ecf733b1a700fdad8db9a203 ptp: ocp: Add timestamp wi=
ndow adjustment
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-c001-20211215 (https://download.01.org/0day-ci/arch=
ive/20211219/202112190822.6HmzS0fV-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1acffc6e09ede525ecf733b1a700fdad8db9a203
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1acffc6e09ede525ecf733b1a700fdad8db9a203
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/i915/display/i9xx_plane.c:1009:3: warning: Value stored =
to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
                   offset =3D intel_de_read(dev_priv, DSPOFFSET(i9xx_plane)=
);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1009:3: note: Value stored to =
'offset' is never read
                   offset =3D intel_de_read(dev_priv, DSPOFFSET(i9xx_plane)=
);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1013:4: warning: Value stored =
to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
                           offset =3D intel_de_read(dev_priv,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1013:4: note: Value stored to =
'offset' is never read
                           offset =3D intel_de_read(dev_priv,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1016:4: warning: Value stored =
to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
                           offset =3D intel_de_read(dev_priv,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1016:4: note: Value stored to =
'offset' is never read
                           offset =3D intel_de_read(dev_priv,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/i915/display/skl_universal_plane.c:2308:2: warning: Valu=
e stored to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
           offset =3D intel_de_read(dev_priv, PLANE_OFFSET(pipe, plane_id));
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/skl_universal_plane.c:2308:2: note: Value s=
tored to 'offset' is never read
           offset =3D intel_de_read(dev_priv, PLANE_OFFSET(pipe, plane_id));
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/net/ethernet/intel/igc/igc_mac.c:367:3: warning: Value stored to=
 'ret_val' is never read [clang-analyzer-deadcode.DeadStores]
                   ret_val =3D 0;
                   ^         ~
   drivers/net/ethernet/intel/igc/igc_mac.c:367:3: note: Value stored to 'r=
et_val' is never read
                   ret_val =3D 0;
                   ^         ~
   drivers/net/ethernet/intel/igc/igc_mac.c:393:3: warning: Value stored to=
 'ret_val' is never read [clang-analyzer-deadcode.DeadStores]
                   ret_val =3D -IGC_ERR_CONFIG;
                   ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_mac.c:393:3: note: Value stored to 'r=
et_val' is never read
                   ret_val =3D -IGC_ERR_CONFIG;
                   ^         ~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/net/ethernet/intel/igc/igc_base.c:231:2: warning: Value stored t=
o 'ret_val' is never read [clang-analyzer-deadcode.DeadStores]
           ret_val =3D igc_init_nvm_params_base(hw);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_base.c:231:2: note: Value stored to '=
ret_val' is never read
           ret_val =3D igc_init_nvm_params_base(hw);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_base.c:234:3: warning: Value stored t=
o 'ret_val' is never read [clang-analyzer-deadcode.DeadStores]
                   ret_val =3D igc_init_nvm_params_i225(hw);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_base.c:234:3: note: Value stored to '=
ret_val' is never read
                   ret_val =3D igc_init_nvm_params_i225(hw);
                   ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/net/ethernet/intel/igc/igc_phy.c:190:2: warning: Value stored to=
 'phpm' is never read [clang-analyzer-deadcode.DeadStores]
           phpm =3D rd32(IGC_I225_PHPM);
           ^
   drivers/net/ethernet/intel/igc/igc_phy.c:190:2: note: Value stored to 'p=
hpm' is never read
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
>> drivers/ptp/ptp_ocp.c:773:2: warning: Value stored to 'ctrl' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ctrl =3D ioread32(&bp->reg->ctrl);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:773:2: note: Value stored to 'ctrl' is never read
           ctrl =3D ioread32(&bp->reg->ctrl);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:780:2: warning: Value stored to 'ctrl' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ctrl =3D ioread32(&bp->reg->ctrl);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:780:2: note: Value stored to 'ctrl' is never read
           ctrl =3D ioread32(&bp->reg->ctrl);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:1993:2: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ans, def);
           ^~~~~~
   drivers/ptp/ptp_ocp.c:1993:2: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
           strcpy(ans, def);
           ^~~~~~
   drivers/ptp/ptp_ocp.c:1997:3: warning: Value stored to 'ans' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   ans +=3D sprintf(ans, "%s ", sec);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:1997:3: note: Value stored to 'ans' is never read
                   ans +=3D sprintf(ans, "%s ", sec);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_ocp.c:2143:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buf, "unknown");
                   ^~~~~~
   drivers/ptp/ptp_ocp.c:2143:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(buf, "unknown");
                   ^~~~~~
   Suppressed 17 warnings (15 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/siox/siox-core.c:240:4: warning: Value stored to 'status' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   drivers/siox/siox-core.c:240:4: note: Value stored to 'status' is never =
read
                           status &=3D ~SIOX_STATUS_WDG;
                           ^         ~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gnss/sirf.c:191:17: warning: Value stored to 'dev' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &data->serdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/gnss/sirf.c:191:17: note: Value stored to 'dev' during its initi=
alization is never read
           struct device *dev =3D &data->serdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/dvb-frontends/tda10086.c:220:28: warning: The result of th=
e left shift is undefined because the left operand is negative [clang-analy=
zer-core.UndefinedBinaryOperatorResult]
                                           | ((cmd->msg_len - 1) << 4));
                                              ~~~~~~~~~~~~~~~~~~ ^
   drivers/media/dvb-frontends/tda10086.c:207:2: note: Assuming 'debug' is 0
           dprintk ("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/tda10086.c:36:7: note: expanded from macro '=
dprintk'
                   if (debug) printk(KERN_DEBUG "tda10086: " args); \
                       ^~~~~
   drivers/media/dvb-frontends/tda10086.c:207:2: note: Taking false branch
           dprintk ("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/tda10086.c:36:3: note: expanded from macro '=
dprintk'
                   if (debug) printk(KERN_DEBUG "tda10086: " args); \
                   ^
   drivers/media/dvb-frontends/tda10086.c:207:2: note: Loop condition is fa=
lse.  Exiting loop
           dprintk ("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/tda10086.c:35:2: note: expanded from macro '=
dprintk'
           do { \

vim +/ctrl +773 drivers/ptp/ptp_ocp.c

773bda96492153 Jonathan Lemon 2021-08-03  765  =

1acffc6e09ede5 Jonathan Lemon 2021-09-14  766  static void
1acffc6e09ede5 Jonathan Lemon 2021-09-14  767  ptp_ocp_estimate_pci_timing(=
struct ptp_ocp *bp)
1acffc6e09ede5 Jonathan Lemon 2021-09-14  768  {
1acffc6e09ede5 Jonathan Lemon 2021-09-14  769  	ktime_t start, end;
1acffc6e09ede5 Jonathan Lemon 2021-09-14  770  	ktime_t delay;
1acffc6e09ede5 Jonathan Lemon 2021-09-14  771  	u32 ctrl;
1acffc6e09ede5 Jonathan Lemon 2021-09-14  772  =

1acffc6e09ede5 Jonathan Lemon 2021-09-14 @773  	ctrl =3D ioread32(&bp->reg-=
>ctrl);
1acffc6e09ede5 Jonathan Lemon 2021-09-14  774  	ctrl =3D OCP_CTRL_READ_TIME=
_REQ | OCP_CTRL_ENABLE;
1acffc6e09ede5 Jonathan Lemon 2021-09-14  775  =

1acffc6e09ede5 Jonathan Lemon 2021-09-14  776  	iowrite32(ctrl, &bp->reg->c=
trl);
1acffc6e09ede5 Jonathan Lemon 2021-09-14  777  =

1acffc6e09ede5 Jonathan Lemon 2021-09-14  778  	start =3D ktime_get_ns();
1acffc6e09ede5 Jonathan Lemon 2021-09-14  779  =

1acffc6e09ede5 Jonathan Lemon 2021-09-14  780  	ctrl =3D ioread32(&bp->reg-=
>ctrl);
1acffc6e09ede5 Jonathan Lemon 2021-09-14  781  =

1acffc6e09ede5 Jonathan Lemon 2021-09-14  782  	end =3D ktime_get_ns();
1acffc6e09ede5 Jonathan Lemon 2021-09-14  783  =

1acffc6e09ede5 Jonathan Lemon 2021-09-14  784  	delay =3D end - start;
1acffc6e09ede5 Jonathan Lemon 2021-09-14  785  	bp->ts_window_adjust =3D (d=
elay >> 5) * 3;
1acffc6e09ede5 Jonathan Lemon 2021-09-14  786  }
1acffc6e09ede5 Jonathan Lemon 2021-09-14  787  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7721933971112626848==--

