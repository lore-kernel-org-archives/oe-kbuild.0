Content-Type: multipart/mixed; boundary="===============2642328200568330587=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/radeon/radeon_atombios.c:2816:4: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 02 Jan 2022 23:09:53 +0800
Message-ID: <202201022245.dCg0sgVX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2642328200568330587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20211229 (https://download.01.org/0day-ci/arc=
hive/20220102/202201022245.dCg0sgVX-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b=
7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D337015573718b161891a3473d25f59273f2e626b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 337015573718b161891a3473d25f59273f2e626b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
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
   drivers/char/hw_random/ixp4xx-rng.c:44:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
   drivers/char/hw_random/ixp4xx-rng.c:44:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D &pdev->dev;
                          ^~~   ~~~~~~~~~~
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
   9 warnings generated.
   drivers/gpu/drm/radeon/radeon_drv.c:467:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D radeon_resume_kms(drm_dev, false, false);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:467:2: note: Value stored to 'ret' i=
s never read
           ret =3D radeon_resume_kms(drm_dev, false, false);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
>> drivers/gpu/drm/radeon/radeon_atombios.c:2816:4: warning: Dereference of=
 null pointer [clang-analyzer-core.NullDereference]
                           rdev->pm.power_state[rdev->pm.default_power_stat=
e_index].clock_info[0].voltage.voltage;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2765:6: note: Assuming the cond=
ition is true
           if (atom_parse_data_header(mode_info->atom_context, index, NULL,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2765:2: note: Taking true branch
           if (atom_parse_data_header(mode_info->atom_context, index, NULL,
           ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2767:3: note: Control jumps to =
'case 5:'  at line 2774
                   switch (frev) {
                   ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2776:4: note:  Execution contin=
ues on line 2785
                           break;
                           ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2785:6: note: 'state_index' is =
equal to 0
           if (state_index =3D=3D 0) {
               ^~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2785:2: note: Taking true branch
           if (state_index =3D=3D 0) {
           ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2786:26: note: Calling 'kzalloc'
                   rdev->pm.power_state =3D kzalloc(sizeof(struct radeon_po=
wer_state), GFP_KERNEL);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2786:26: note: Returning from '=
kzalloc'
                   rdev->pm.power_state =3D kzalloc(sizeof(struct radeon_po=
wer_state), GFP_KERNEL);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2786:3: note: Value assigned to=
 field 'power_state'
                   rdev->pm.power_state =3D kzalloc(sizeof(struct radeon_po=
wer_state), GFP_KERNEL);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2787:7: note: Assuming field 'p=
ower_state' is null
                   if (rdev->pm.power_state) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2787:3: note: Taking false bran=
ch
                   if (rdev->pm.power_state) {
                   ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2814:6: note: Assuming field 'd=
efault_power_state_index' is >=3D 0
           if (rdev->pm.default_power_state_index >=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:2814:2: note: Taking true branch
           if (rdev->pm.default_power_state_index >=3D 0)
           ^
   drivers/gpu/drm/radeon/radeon_atombios.c:2816:4: note: Dereference of nu=
ll pointer
                           rdev->pm.power_state[rdev->pm.default_power_stat=
e_index].clock_info[0].voltage.voltage;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
   Suppressed 57 warnings (8 in non-user code, 49 with check filters).
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
   6 warnings generated.
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/tty/serial/fsl_lpuart.c:1230:33: warning: The result of the left=
 shift is undefined because the right operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^
   drivers/tty/serial/fsl_lpuart.c:2803:6: note: Assuming field 'suspended'=
 is 0
           if (sport->port.suspended && !irq_wake)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2803:28: note: Left side of '&&' is false
           if (sport->port.suspended && !irq_wake)
                                     ^
   drivers/tty/serial/fsl_lpuart.c:2806:2: note: Taking true branch
           if (lpuart_is_32(sport))
           ^
   drivers/tty/serial/fsl_lpuart.c:2811:6: note: Assuming field 'lpuart_dma=
_rx_use' is true
           if (sport->lpuart_dma_rx_use) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2811:2: note: Taking true branch
           if (sport->lpuart_dma_rx_use) {
           ^
   drivers/tty/serial/fsl_lpuart.c:2812:7: note: Assuming 'irq_wake' is true
                   if (irq_wake) {

vim +2816 drivers/gpu/drm/radeon/radeon_atombios.c

b0e664140a1703 Alex Deucher     2010-11-22  2754  =

560154e9a27f2f Alex Deucher     2010-11-22  2755  void radeon_atombios_get_=
power_modes(struct radeon_device *rdev)
560154e9a27f2f Alex Deucher     2010-11-22  2756  {
560154e9a27f2f Alex Deucher     2010-11-22  2757  	struct radeon_mode_info =
*mode_info =3D &rdev->mode_info;
560154e9a27f2f Alex Deucher     2010-11-22  2758  	int index =3D GetIndexIn=
toMasterTable(DATA, PowerPlayInfo);
560154e9a27f2f Alex Deucher     2010-11-22  2759  	u16 data_offset;
560154e9a27f2f Alex Deucher     2010-11-22  2760  	u8 frev, crev;
560154e9a27f2f Alex Deucher     2010-11-22  2761  	int state_index =3D 0;
560154e9a27f2f Alex Deucher     2010-11-22  2762  =

560154e9a27f2f Alex Deucher     2010-11-22  2763  	rdev->pm.default_power_s=
tate_index =3D -1;
560154e9a27f2f Alex Deucher     2010-11-22  2764  =

560154e9a27f2f Alex Deucher     2010-11-22  2765  	if (atom_parse_data_head=
er(mode_info->atom_context, index, NULL,
560154e9a27f2f Alex Deucher     2010-11-22  2766  				   &frev, &crev, &dat=
a_offset)) {
560154e9a27f2f Alex Deucher     2010-11-22  2767  		switch (frev) {
560154e9a27f2f Alex Deucher     2010-11-22  2768  		case 1:
560154e9a27f2f Alex Deucher     2010-11-22  2769  		case 2:
560154e9a27f2f Alex Deucher     2010-11-22  2770  		case 3:
560154e9a27f2f Alex Deucher     2010-11-22  2771  			state_index =3D radeon=
_atombios_parse_power_table_1_3(rdev);
560154e9a27f2f Alex Deucher     2010-11-22  2772  			break;
560154e9a27f2f Alex Deucher     2010-11-22  2773  		case 4:
560154e9a27f2f Alex Deucher     2010-11-22  2774  		case 5:
560154e9a27f2f Alex Deucher     2010-11-22  2775  			state_index =3D radeon=
_atombios_parse_power_table_4_5(rdev);
560154e9a27f2f Alex Deucher     2010-11-22  2776  			break;
b0e664140a1703 Alex Deucher     2010-11-22  2777  		case 6:
b0e664140a1703 Alex Deucher     2010-11-22  2778  			state_index =3D radeon=
_atombios_parse_power_table_6(rdev);
b0e664140a1703 Alex Deucher     2010-11-22  2779  			break;
560154e9a27f2f Alex Deucher     2010-11-22  2780  		default:
560154e9a27f2f Alex Deucher     2010-11-22  2781  			break;
56278a8edacee9 Alex Deucher     2009-12-28  2782  		}
f8e6bfc2ce1628 Alex Deucher     2013-04-25  2783  	}
f8e6bfc2ce1628 Alex Deucher     2013-04-25  2784  =

f8e6bfc2ce1628 Alex Deucher     2013-04-25  2785  	if (state_index =3D=3D 0=
) {
0975b16274bad1 Alex Deucher     2011-02-02  2786  		rdev->pm.power_state =
=3D kzalloc(sizeof(struct radeon_power_state), GFP_KERNEL);
0975b16274bad1 Alex Deucher     2011-02-02  2787  		if (rdev->pm.power_stat=
e) {
8f3f1c9a22a642 Alex Deucher     2011-11-04  2788  			rdev->pm.power_state[0=
].clock_info =3D
6396bb221514d2 Kees Cook        2018-06-12  2789  				kcalloc(1,
6396bb221514d2 Kees Cook        2018-06-12  2790  				        sizeof(struct=
 radeon_pm_clock_info),
6396bb221514d2 Kees Cook        2018-06-12  2791  				        GFP_KERNEL);
8f3f1c9a22a642 Alex Deucher     2011-11-04  2792  			if (rdev->pm.power_sta=
te[0].clock_info) {
56278a8edacee9 Alex Deucher     2009-12-28  2793  				/* add the default mo=
de */
0ec0e74f784ca0 Alex Deucher     2009-12-23  2794  				rdev->pm.power_state[=
state_index].type =3D
0ec0e74f784ca0 Alex Deucher     2009-12-23  2795  					POWER_STATE_TYPE_DEF=
AULT;
56278a8edacee9 Alex Deucher     2009-12-28  2796  				rdev->pm.power_state[=
state_index].num_clock_modes =3D 1;
56278a8edacee9 Alex Deucher     2009-12-28  2797  				rdev->pm.power_state[=
state_index].clock_info[0].mclk =3D rdev->clock.default_mclk;
56278a8edacee9 Alex Deucher     2009-12-28  2798  				rdev->pm.power_state[=
state_index].clock_info[0].sclk =3D rdev->clock.default_sclk;
56278a8edacee9 Alex Deucher     2009-12-28  2799  				rdev->pm.power_state[=
state_index].default_clock_mode =3D
56278a8edacee9 Alex Deucher     2009-12-28  2800  					&rdev->pm.power_stat=
e[state_index].clock_info[0];
56278a8edacee9 Alex Deucher     2009-12-28  2801  				rdev->pm.power_state[=
state_index].clock_info[0].voltage.type =3D VOLTAGE_NONE;
79daedc942813c Alex Deucher     2010-04-22  2802  				rdev->pm.power_state[=
state_index].pcie_lanes =3D 16;
a48b9b4edb8bb8 Alex Deucher     2010-04-22  2803  				rdev->pm.default_powe=
r_state_index =3D state_index;
a48b9b4edb8bb8 Alex Deucher     2010-04-22  2804  				rdev->pm.power_state[=
state_index].flags =3D 0;
56278a8edacee9 Alex Deucher     2009-12-28  2805  				state_index++;
56278a8edacee9 Alex Deucher     2009-12-28  2806  			}
0975b16274bad1 Alex Deucher     2011-02-02  2807  		}
8f3f1c9a22a642 Alex Deucher     2011-11-04  2808  	}
02b17cc05372ab Alex Deucher     2010-04-22  2809  =

56278a8edacee9 Alex Deucher     2009-12-28  2810  	rdev->pm.num_power_state=
s =3D state_index;
771fe6b912fca5 Jerome Glisse    2009-06-05  2811  =

a48b9b4edb8bb8 Alex Deucher     2010-04-22  2812  	rdev->pm.current_power_s=
tate_index =3D rdev->pm.default_power_state_index;
a48b9b4edb8bb8 Alex Deucher     2010-04-22  2813  	rdev->pm.current_clock_m=
ode_index =3D 0;
4376eee92e5a83 Alexander M=C3=BCller 2011-12-30  2814  	if (rdev->pm.defaul=
t_power_state_index >=3D 0)
4376eee92e5a83 Alexander M=C3=BCller 2011-12-30  2815  		rdev->pm.current_v=
ddc =3D
4376eee92e5a83 Alexander M=C3=BCller 2011-12-30 @2816  			rdev->pm.power_st=
ate[rdev->pm.default_power_state_index].clock_info[0].voltage.voltage;
4376eee92e5a83 Alexander M=C3=BCller 2011-12-30  2817  	else
4376eee92e5a83 Alexander M=C3=BCller 2011-12-30  2818  		rdev->pm.current_v=
ddc =3D 0;
56278a8edacee9 Alex Deucher     2009-12-28  2819  }
56278a8edacee9 Alex Deucher     2009-12-28  2820  =


:::::: The code at line 2816 was first introduced by commit
:::::: 4376eee92e5a8332b470040e672ea99cd44c826a drm/radeon/kms/atom: fix po=
ssible segfault in pm setup

:::::: TO: Alexander M=C3=BCller <serveralex@gmail.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2642328200568330587==--

