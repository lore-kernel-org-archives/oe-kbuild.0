Content-Type: multipart/mixed; boundary="===============1441537819671256491=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/surface/aggregator/ssh_request_layer.c:158:18: warning: Value stored to 'rtl' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 03 Jan 2022 06:04:14 +0800
Message-ID: <202201030633.dXWY5byG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1441537819671256491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maximilian Luz <luzmaximilian@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: c167b9c7e3d6131b4a4865c112a3dbc86d2e997d platform/surface: Add Surf=
ace Aggregator subsystem
date:   12 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-c007-20211213 (https://download.01.org/0day-ci/ar=
chive/20220103/202201030633.dXWY5byG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2dd=
b6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc167b9c7e3d6131b4a4865c112a3dbc86d2e997d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c167b9c7e3d6131b4a4865c112a3dbc86d2e997d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/w1/masters/ds1wm.c:567:2: warning: Value stored to 'inten' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           inten =3D ds1wm_read_register(ds1wm_data, DS1WM_INT_EN);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/ds1wm.c:567:2: note: Value stored to 'inten' is never=
 read
           inten =3D ds1wm_read_register(ds1wm_data, DS1WM_INT_EN);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/w1/slaves/w1_therm.c:159:8: warning: Excessive padding in 'struc=
t w1_therm_family_converter' (12 padding bytes, where 4 is optimal). =

   Optimal fields order: =

   f, =

   convert, =

   get_conversion_time, =

   set_resolution, =

   get_resolution, =

   write_data, =

   reserved, =

   broken, =

   bulk_read, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct w1_therm_family_converter {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:159:8: note: Excessive padding in 'struct w=
1_therm_family_converter' (12 padding bytes, where 4 is optimal). Optimal f=
ields order: f, convert, get_conversion_time, set_resolution, get_resolutio=
n, write_data, reserved, broken, bulk_read, consider reordering the fields =
or adding explicit padding members
   struct w1_therm_family_converter {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:1257:5: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1257:5: note: Value stored to 'ret' is neve=
r read
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1804:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:1804:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:2092:3: warning: Value stored to 'rv' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   rv =3D w1_read_block(sl->master, (u8 *)&rn, 8);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2092:3: note: Value stored to 'rv' is never=
 read
                   rv =3D w1_read_block(sl->master, (u8 *)&rn, 8);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2096:22: warning: The right operand of '=3D=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2073:6: note: Assuming the condition is fal=
se
           if (w1_reset_bus(sl->master))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2073:2: note: Taking false branch
           if (w1_reset_bus(sl->master))
           ^
   drivers/w1/slaves/w1_therm.c:2083:6: note: Assuming 'ack' is equal to W1=
_42_SUCCESS_CONFIRM_BYTE
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2083:2: note: Taking false branch
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
           ^
   drivers/w1/slaves/w1_therm.c:2087:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i <=3D 64; i++) {
           ^
   drivers/w1/slaves/w1_therm.c:2088:7: note: Assuming the condition is fal=
se
                   if (w1_reset_bus(sl->master))
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2088:3: note: Taking false branch
                   if (w1_reset_bus(sl->master))
                   ^
   drivers/w1/slaves/w1_therm.c:2094:7: note: Assuming field 'family' is no=
t equal to W1_42_FINISHED_BYTE
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2094:3: note: Taking false branch
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                   ^
   drivers/w1/slaves/w1_therm.c:2096:22: note: The right operand of '=3D=3D=
' is a garbage value
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/platform/surface/aggregator/ssh_request_layer.c:158:18: warning:=
 Value stored to 'rtl' during its initialization is never read [clang-analy=
zer-deadcode.DeadStores]
           struct ssh_rtl *rtl =3D ssh_request_rtl(rqst);
                           ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/surface/aggregator/ssh_request_layer.c:158:18: note: Va=
lue stored to 'rtl' during its initialization is never read
           struct ssh_rtl *rtl =3D ssh_request_rtl(rqst);
                           ^~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/extcon/extcon-rt8973a.c:25:8: warning: Excessive padding in 'str=
uct muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-rt8973a.c:25:8: note: Excessive padding in 'struct=
 muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: nam=
e, irq, virq, consider reordering the fields or adding explicit padding mem=
bers
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/cs35l35.c:1556:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs35l35->regmap, CS35L35_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l35.c:1556:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs35l35->regmap, CS35L35_DEVID_AB, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l35.c:1559:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs35l35->regmap, CS35L35_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l35.c:1559:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs35l35->regmap, CS35L35_DEVID_CD, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l35.c:1561:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs35l35->regmap, CS35L35_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l35.c:1561:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs35l35->regmap, CS35L35_DEVID_E, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/iio/gyro/adis16130.c:41:8: warning: Excessive padding in 'struct=
 adis16130_state' (100 padding bytes, where 36 is optimal). =

   Optimal fields order: =

   buf, =

   us, =

   buf_lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adis16130_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/iio/gyro/adis16130.c:41:8: note: Excessive padding in 'struct ad=
is16130_state' (100 padding bytes, where 36 is optimal). Optimal fields ord=
er: buf, us, buf_lock, consider reordering the fields or adding explicit pa=
dding members
   struct adis16130_state {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   net/9p/trans_virtio.c:416:33: warning: The right operand of '+' is a gar=
bage value [clang-analyzer-core.UndefinedBinaryOperatorResult]

vim +/rtl +158 drivers/platform/surface/aggregator/ssh_request_layer.c

c167b9c7e3d613 Maximilian Luz 2020-12-21  153  =

c167b9c7e3d613 Maximilian Luz 2020-12-21  154  static void ssh_rtl_complete=
_with_rsp(struct ssh_request *rqst,
c167b9c7e3d613 Maximilian Luz 2020-12-21  155  				      const struct ssh_c=
ommand *cmd,
c167b9c7e3d613 Maximilian Luz 2020-12-21  156  				      const struct ssam_=
span *data)
c167b9c7e3d613 Maximilian Luz 2020-12-21  157  {
c167b9c7e3d613 Maximilian Luz 2020-12-21 @158  	struct ssh_rtl *rtl =3D ssh=
_request_rtl(rqst);
c167b9c7e3d613 Maximilian Luz 2020-12-21  159  =

c167b9c7e3d613 Maximilian Luz 2020-12-21  160  	rtl_dbg(rtl, "rtl: completi=
ng request with response (rqid: %#06x)\n",
c167b9c7e3d613 Maximilian Luz 2020-12-21  161  		ssh_request_get_rqid(rqst)=
);
c167b9c7e3d613 Maximilian Luz 2020-12-21  162  =

c167b9c7e3d613 Maximilian Luz 2020-12-21  163  	rqst->ops->complete(rqst, c=
md, data, 0);
c167b9c7e3d613 Maximilian Luz 2020-12-21  164  }
c167b9c7e3d613 Maximilian Luz 2020-12-21  165  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1441537819671256491==--

