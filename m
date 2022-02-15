Content-Type: multipart/mixed; boundary="===============4321023334646762286=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/radeon/radeon_atombios.c:1661:28: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 15 Feb 2022 23:29:35 +0800
Message-ID: <202202152346.vXZSmDDI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4321023334646762286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d567f5db412ed52de0b3b3efca4a451263de6108
commit: c69f27137a38d24301a6b659454a91ad85dff4aa drm/radeon: Avoid power ta=
ble parsing memory leaks
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220214 (https://download.01.org/0day-ci/archi=
ve/20220215/202202152346.vXZSmDDI-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea0718=
84b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc69f27137a38d24301a6b659454a91ad85dff4aa
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c69f27137a38d24301a6b659454a91ad85dff4aa
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:146:2: note: Taking true branch
           if (ret)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:147:3: note: Returning without writin=
g to 'step->vco_frequency'
                   return ret;
                   ^
   drivers/gpu/drm/radeon/rv6xx_dpm.c:249:2: note: Returning from 'rv6xx_co=
nvert_clock_to_stepping'
           rv6xx_convert_clock_to_stepping(rdev, high, &target);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/rv6xx_dpm.c:253:41: note: The left operand of '>=
=3D' is a garbage value
           increasing_vco =3D (target.vco_frequency >=3D cur.vco_frequency);
                             ~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   include/asm-generic/bitops/non-atomic.h:106:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/perf/arm_pmu.c:756:24: note: Assuming '____ptr' is null
           struct arm_pmu *pmu =3D hlist_entry_safe(node, struct arm_pmu, n=
ode);
                                 ^
   include/linux/list.h:983:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   drivers/perf/arm_pmu.c:756:24: note: '?' condition is false
           struct arm_pmu *pmu =3D hlist_entry_safe(node, struct arm_pmu, n=
ode);
                                 ^
   include/linux/list.h:983:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   drivers/perf/arm_pmu.c:759:7: note: Calling 'cpumask_test_cpu'
           if (!cpumask_test_cpu(cpu, &pmu->supported_cpus))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/amd/amdgpu/cz_ih.c:394:3: warning: Value stored to 'tmp'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(mmSRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/amd/amdgpu/cz_ih.c:394:3: note: Value stored to 'tmp' is=
 never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   block/partitions/atari.c:143:5: warning: Value stored to 'part_fmt' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   part_fmt =3D 2;
                                   ^          ~
   block/partitions/atari.c:143:5: note: Value stored to 'part_fmt' is neve=
r read
                                   part_fmt =3D 2;
                                   ^          ~
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
   60 warnings generated.
>> drivers/gpu/drm/radeon/radeon_atombios.c:1661:28: warning: The left expr=
ession of the compound assignment is an uninitialized value. The computed v=
alue will also be garbage [clang-analyzer-core.uninitialized.Assign]
                           lvds->native_mode.flags |=3D DRM_MODE_FLAG_NVSYN=
C;
                           ~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/radeon/radeon_atombios.c:1627:2: note: Assuming the cond=
ition is false
           if (atom_parse_data_header(mode_info->atom_context, index, NULL,
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:1627:2: note: '?' condition is =
false
           if (atom_parse_data_header(mode_info->atom_context, index, NULL,
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/radeon/radeon_atombios.c:1627:2: note: Assuming the cond=
ition is false
           if (atom_parse_data_header(mode_info->atom_context, index, NULL,
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:1627:2: note: '?' condition is =
true
           if (atom_parse_data_header(mode_info->atom_context, index, NULL,
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/gpu/drm/radeon/radeon_atombios.c:1627:2: note: Taking true branch
           if (atom_parse_data_header(mode_info->atom_context, index, NULL,
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/gpu/drm/radeon/radeon_atombios.c:1632:7: note: Calling 'kzalloc'
                       kzalloc(sizeof(struct radeon_encoder_atom_dig), GFP_=
KERNEL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/slab.h:684:9: note: Uninitialized value stored to field 'f=
lags'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:1632:7: note: Returning from 'k=
zalloc'
                       kzalloc(sizeof(struct radeon_encoder_atom_dig), GFP_=
KERNEL);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:1634:7: note: Assuming 'lvds' i=
s non-null
                   if (!lvds)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:1634:3: note: '?' condition is =
false
                   if (!lvds)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/gpu/drm/radeon/radeon_atombios.c:1634:8: note: 'lvds' is non-null
                   if (!lvds)
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/gpu/drm/radeon/radeon_atombios.c:1634:3: note: '?' condition is =
false
                   if (!lvds)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \

vim +1661 drivers/gpu/drm/radeon/radeon_atombios.c

771fe6b912fca5 Jerome Glisse 2009-06-05  1612  =

771fe6b912fca5 Jerome Glisse 2009-06-05  1613  struct radeon_encoder_atom_d=
ig *radeon_atombios_get_lvds_info(struct
771fe6b912fca5 Jerome Glisse 2009-06-05  1614  							      radeon_encoder
771fe6b912fca5 Jerome Glisse 2009-06-05  1615  							      *encoder)
771fe6b912fca5 Jerome Glisse 2009-06-05  1616  {
771fe6b912fca5 Jerome Glisse 2009-06-05  1617  	struct drm_device *dev =3D =
encoder->base.dev;
771fe6b912fca5 Jerome Glisse 2009-06-05  1618  	struct radeon_device *rdev =
=3D dev->dev_private;
771fe6b912fca5 Jerome Glisse 2009-06-05  1619  	struct radeon_mode_info *mo=
de_info =3D &rdev->mode_info;
771fe6b912fca5 Jerome Glisse 2009-06-05  1620  	int index =3D GetIndexIntoM=
asterTable(DATA, LVDS_Info);
7dde8a19656dde Alex Deucher  2009-11-30  1621  	uint16_t data_offset, misc;
771fe6b912fca5 Jerome Glisse 2009-06-05  1622  	union lvds_info *lvds_info;
771fe6b912fca5 Jerome Glisse 2009-06-05  1623  	uint8_t frev, crev;
771fe6b912fca5 Jerome Glisse 2009-06-05  1624  	struct radeon_encoder_atom_=
dig *lvds =3D NULL;
5137ee940c3e59 Alex Deucher  2010-08-12  1625  	int encoder_enum =3D (encod=
er->encoder_enum & ENUM_ID_MASK) >> ENUM_ID_SHIFT;
771fe6b912fca5 Jerome Glisse 2009-06-05  1626  =

a084e6ee6e64a7 Alex Deucher  2010-03-18  1627  	if (atom_parse_data_header(=
mode_info->atom_context, index, NULL,
a084e6ee6e64a7 Alex Deucher  2010-03-18  1628  				   &frev, &crev, &data_o=
ffset)) {
771fe6b912fca5 Jerome Glisse 2009-06-05  1629  		lvds_info =3D
771fe6b912fca5 Jerome Glisse 2009-06-05  1630  			(union lvds_info *)(mode_=
info->atom_context->bios + data_offset);
771fe6b912fca5 Jerome Glisse 2009-06-05  1631  		lvds =3D
771fe6b912fca5 Jerome Glisse 2009-06-05  1632  		    kzalloc(sizeof(struct =
radeon_encoder_atom_dig), GFP_KERNEL);
771fe6b912fca5 Jerome Glisse 2009-06-05  1633  =

771fe6b912fca5 Jerome Glisse 2009-06-05  1634  		if (!lvds)
771fe6b912fca5 Jerome Glisse 2009-06-05  1635  			return NULL;
771fe6b912fca5 Jerome Glisse 2009-06-05  1636  =

de2103e452ec7f Alex Deucher  2009-10-09  1637  		lvds->native_mode.clock =
=3D
771fe6b912fca5 Jerome Glisse 2009-06-05  1638  		    le16_to_cpu(lvds_info-=
>info.sLCDTiming.usPixClk) * 10;
de2103e452ec7f Alex Deucher  2009-10-09  1639  		lvds->native_mode.hdisplay=
 =3D
771fe6b912fca5 Jerome Glisse 2009-06-05  1640  		    le16_to_cpu(lvds_info-=
>info.sLCDTiming.usHActive);
de2103e452ec7f Alex Deucher  2009-10-09  1641  		lvds->native_mode.vdisplay=
 =3D
771fe6b912fca5 Jerome Glisse 2009-06-05  1642  		    le16_to_cpu(lvds_info-=
>info.sLCDTiming.usVActive);
de2103e452ec7f Alex Deucher  2009-10-09  1643  		lvds->native_mode.htotal =
=3D lvds->native_mode.hdisplay +
771fe6b912fca5 Jerome Glisse 2009-06-05  1644  			le16_to_cpu(lvds_info->in=
fo.sLCDTiming.usHBlanking_Time);
de2103e452ec7f Alex Deucher  2009-10-09  1645  		lvds->native_mode.hsync_st=
art =3D lvds->native_mode.hdisplay +
771fe6b912fca5 Jerome Glisse 2009-06-05  1646  			le16_to_cpu(lvds_info->in=
fo.sLCDTiming.usHSyncOffset);
de2103e452ec7f Alex Deucher  2009-10-09  1647  		lvds->native_mode.hsync_en=
d =3D lvds->native_mode.hsync_start +
771fe6b912fca5 Jerome Glisse 2009-06-05  1648  			le16_to_cpu(lvds_info->in=
fo.sLCDTiming.usHSyncWidth);
de2103e452ec7f Alex Deucher  2009-10-09  1649  		lvds->native_mode.vtotal =
=3D lvds->native_mode.vdisplay +
771fe6b912fca5 Jerome Glisse 2009-06-05  1650  			le16_to_cpu(lvds_info->in=
fo.sLCDTiming.usVBlanking_Time);
de2103e452ec7f Alex Deucher  2009-10-09  1651  		lvds->native_mode.vsync_st=
art =3D lvds->native_mode.vdisplay +
1ff26a3604d029 Alex Deucher  2010-05-18  1652  			le16_to_cpu(lvds_info->in=
fo.sLCDTiming.usVSyncOffset);
de2103e452ec7f Alex Deucher  2009-10-09  1653  		lvds->native_mode.vsync_en=
d =3D lvds->native_mode.vsync_start +
771fe6b912fca5 Jerome Glisse 2009-06-05  1654  			le16_to_cpu(lvds_info->in=
fo.sLCDTiming.usVSyncWidth);
771fe6b912fca5 Jerome Glisse 2009-06-05  1655  		lvds->panel_pwr_delay =3D
771fe6b912fca5 Jerome Glisse 2009-06-05  1656  		    le16_to_cpu(lvds_info-=
>info.usOffDelayInMs);
ba032a58d1f320 Alex Deucher  2010-10-04  1657  		lvds->lcd_misc =3D lvds_in=
fo->info.ucLVDS_Misc;
7dde8a19656dde Alex Deucher  2009-11-30  1658  =

7dde8a19656dde Alex Deucher  2009-11-30  1659  		misc =3D le16_to_cpu(lvds_=
info->info.sLCDTiming.susModeMiscInfo.usAccess);
7dde8a19656dde Alex Deucher  2009-11-30  1660  		if (misc & ATOM_VSYNC_POLA=
RITY)
7dde8a19656dde Alex Deucher  2009-11-30 @1661  			lvds->native_mode.flags |=
=3D DRM_MODE_FLAG_NVSYNC;
7dde8a19656dde Alex Deucher  2009-11-30  1662  		if (misc & ATOM_HSYNC_POLA=
RITY)
7dde8a19656dde Alex Deucher  2009-11-30  1663  			lvds->native_mode.flags |=
=3D DRM_MODE_FLAG_NHSYNC;
7dde8a19656dde Alex Deucher  2009-11-30  1664  		if (misc & ATOM_COMPOSITES=
YNC)
7dde8a19656dde Alex Deucher  2009-11-30  1665  			lvds->native_mode.flags |=
=3D DRM_MODE_FLAG_CSYNC;
7dde8a19656dde Alex Deucher  2009-11-30  1666  		if (misc & ATOM_INTERLACE)
7dde8a19656dde Alex Deucher  2009-11-30  1667  			lvds->native_mode.flags |=
=3D DRM_MODE_FLAG_INTERLACE;
7dde8a19656dde Alex Deucher  2009-11-30  1668  		if (misc & ATOM_DOUBLE_CLO=
CK_MODE)
7dde8a19656dde Alex Deucher  2009-11-30  1669  			lvds->native_mode.flags |=
=3D DRM_MODE_FLAG_DBLSCAN;
7dde8a19656dde Alex Deucher  2009-11-30  1670  =

4589433c57bd34 C=C3=A9dric Cano   2011-02-11  1671  		lvds->native_mode.wid=
th_mm =3D le16_to_cpu(lvds_info->info.sLCDTiming.usImageHSize);
4589433c57bd34 C=C3=A9dric Cano   2011-02-11  1672  		lvds->native_mode.hei=
ght_mm =3D le16_to_cpu(lvds_info->info.sLCDTiming.usImageVSize);
7a868e18a4907d Alex Deucher  2010-12-08  1673  =

de2103e452ec7f Alex Deucher  2009-10-09  1674  		/* set crtc values */
de2103e452ec7f Alex Deucher  2009-10-09  1675  		drm_mode_set_crtcinfo(&lvd=
s->native_mode, CRTC_INTERLACE_HALVE_V);
771fe6b912fca5 Jerome Glisse 2009-06-05  1676  =

ba032a58d1f320 Alex Deucher  2010-10-04  1677  		lvds->lcd_ss_id =3D lvds_i=
nfo->info.ucSS_Id;
ebbe1cb936dfc9 Alex Deucher  2009-10-16  1678  =

771fe6b912fca5 Jerome Glisse 2009-06-05  1679  		encoder->native_mode =3D l=
vds->native_mode;
5137ee940c3e59 Alex Deucher  2010-08-12  1680  =

5137ee940c3e59 Alex Deucher  2010-08-12  1681  		if (encoder_enum =3D=3D 2)
5137ee940c3e59 Alex Deucher  2010-08-12  1682  			lvds->linkb =3D true;
5137ee940c3e59 Alex Deucher  2010-08-12  1683  		else
5137ee940c3e59 Alex Deucher  2010-08-12  1684  			lvds->linkb =3D false;
5137ee940c3e59 Alex Deucher  2010-08-12  1685  =

c324acd5032f51 Alex Deucher  2010-12-08  1686  		/* parse the lcd record ta=
ble */
4589433c57bd34 C=C3=A9dric Cano   2011-02-11  1687  		if (le16_to_cpu(lvds_=
info->info.usModePatchTableOffset)) {
c324acd5032f51 Alex Deucher  2010-12-08  1688  			ATOM_FAKE_EDID_PATCH_RECO=
RD *fake_edid_record;
c324acd5032f51 Alex Deucher  2010-12-08  1689  			ATOM_PANEL_RESOLUTION_PAT=
CH_RECORD *panel_res_record;
c324acd5032f51 Alex Deucher  2010-12-08  1690  			bool bad_record =3D false;
05fa7ea7d23980 Alex Deucher  2011-05-11  1691  			u8 *record;
05fa7ea7d23980 Alex Deucher  2011-05-11  1692  =

05fa7ea7d23980 Alex Deucher  2011-05-11  1693  			if ((frev =3D=3D 1) && (c=
rev < 2))
05fa7ea7d23980 Alex Deucher  2011-05-11  1694  				/* absolute */
05fa7ea7d23980 Alex Deucher  2011-05-11  1695  				record =3D (u8 *)(mode_i=
nfo->atom_context->bios +
05fa7ea7d23980 Alex Deucher  2011-05-11  1696  						le16_to_cpu(lvds_info-=
>info.usModePatchTableOffset));
05fa7ea7d23980 Alex Deucher  2011-05-11  1697  			else
05fa7ea7d23980 Alex Deucher  2011-05-11  1698  				/* relative */
05fa7ea7d23980 Alex Deucher  2011-05-11  1699  				record =3D (u8 *)(mode_i=
nfo->atom_context->bios +
c324acd5032f51 Alex Deucher  2010-12-08  1700  						data_offset +
4589433c57bd34 C=C3=A9dric Cano   2011-02-11  1701  						le16_to_cpu(lvds_=
info->info.usModePatchTableOffset));
c324acd5032f51 Alex Deucher  2010-12-08  1702  			while (*record !=3D ATOM_=
RECORD_END_TYPE) {
c324acd5032f51 Alex Deucher  2010-12-08  1703  				switch (*record) {
c324acd5032f51 Alex Deucher  2010-12-08  1704  				case LCD_MODE_PATCH_RECO=
RD_MODE_TYPE:
c324acd5032f51 Alex Deucher  2010-12-08  1705  					record +=3D sizeof(ATOM=
_PATCH_RECORD_MODE);
c324acd5032f51 Alex Deucher  2010-12-08  1706  					break;
c324acd5032f51 Alex Deucher  2010-12-08  1707  				case LCD_RTS_RECORD_TYPE:
c324acd5032f51 Alex Deucher  2010-12-08  1708  					record +=3D sizeof(ATOM=
_LCD_RTS_RECORD);
c324acd5032f51 Alex Deucher  2010-12-08  1709  					break;
c324acd5032f51 Alex Deucher  2010-12-08  1710  				case LCD_CAP_RECORD_TYPE:
c324acd5032f51 Alex Deucher  2010-12-08  1711  					record +=3D sizeof(ATOM=
_LCD_MODE_CONTROL_CAP);
c324acd5032f51 Alex Deucher  2010-12-08  1712  					break;
c324acd5032f51 Alex Deucher  2010-12-08  1713  				case LCD_FAKE_EDID_PATCH=
_RECORD_TYPE:
c324acd5032f51 Alex Deucher  2010-12-08  1714  					fake_edid_record =3D (A=
TOM_FAKE_EDID_PATCH_RECORD *)record;
c324acd5032f51 Alex Deucher  2010-12-08  1715  					if (fake_edid_record->u=
cFakeEDIDLength) {
c324acd5032f51 Alex Deucher  2010-12-08  1716  						struct edid *edid;
c324acd5032f51 Alex Deucher  2010-12-08  1717  						int edid_size =3D
c324acd5032f51 Alex Deucher  2010-12-08  1718  							max((int)EDID_LENGTH,=
 (int)fake_edid_record->ucFakeEDIDLength);
c324acd5032f51 Alex Deucher  2010-12-08  1719  						edid =3D kmalloc(edid_=
size, GFP_KERNEL);
c324acd5032f51 Alex Deucher  2010-12-08  1720  						if (edid) {
c324acd5032f51 Alex Deucher  2010-12-08  1721  							memcpy((u8 *)edid, (u=
8 *)&fake_edid_record->ucFakeEDIDString[0],
c324acd5032f51 Alex Deucher  2010-12-08  1722  							       fake_edid_reco=
rd->ucFakeEDIDLength);
c324acd5032f51 Alex Deucher  2010-12-08  1723  =

eaa4f5e1d0b816 Dave Airlie   2011-05-01  1724  							if (drm_edid_is_valid=
(edid)) {
c324acd5032f51 Alex Deucher  2010-12-08  1725  								rdev->mode_info.bios=
_hardcoded_edid =3D edid;
eaa4f5e1d0b816 Dave Airlie   2011-05-01  1726  								rdev->mode_info.bios=
_hardcoded_edid_size =3D edid_size;
eaa4f5e1d0b816 Dave Airlie   2011-05-01  1727  							} else
c324acd5032f51 Alex Deucher  2010-12-08  1728  								kfree(edid);
c324acd5032f51 Alex Deucher  2010-12-08  1729  						}
c324acd5032f51 Alex Deucher  2010-12-08  1730  					}
95663948ba22a4 Alex Deucher  2013-08-20  1731  					record +=3D fake_edid_r=
ecord->ucFakeEDIDLength ?
95663948ba22a4 Alex Deucher  2013-08-20  1732  						fake_edid_record->ucFa=
keEDIDLength + 2 :
95663948ba22a4 Alex Deucher  2013-08-20  1733  						sizeof(ATOM_FAKE_EDID_=
PATCH_RECORD);
c324acd5032f51 Alex Deucher  2010-12-08  1734  					break;
c324acd5032f51 Alex Deucher  2010-12-08  1735  				case LCD_PANEL_RESOLUTIO=
N_RECORD_TYPE:
c324acd5032f51 Alex Deucher  2010-12-08  1736  					panel_res_record =3D (A=
TOM_PANEL_RESOLUTION_PATCH_RECORD *)record;
c324acd5032f51 Alex Deucher  2010-12-08  1737  					lvds->native_mode.width=
_mm =3D panel_res_record->usHSize;
c324acd5032f51 Alex Deucher  2010-12-08  1738  					lvds->native_mode.heigh=
t_mm =3D panel_res_record->usVSize;
c324acd5032f51 Alex Deucher  2010-12-08  1739  					record +=3D sizeof(ATOM=
_PANEL_RESOLUTION_PATCH_RECORD);
c324acd5032f51 Alex Deucher  2010-12-08  1740  					break;
c324acd5032f51 Alex Deucher  2010-12-08  1741  				default:
c324acd5032f51 Alex Deucher  2010-12-08  1742  					DRM_ERROR("Bad LCD reco=
rd %d\n", *record);
c324acd5032f51 Alex Deucher  2010-12-08  1743  					bad_record =3D true;
c324acd5032f51 Alex Deucher  2010-12-08  1744  					break;
c324acd5032f51 Alex Deucher  2010-12-08  1745  				}
c324acd5032f51 Alex Deucher  2010-12-08  1746  				if (bad_record)
c324acd5032f51 Alex Deucher  2010-12-08  1747  					break;
c324acd5032f51 Alex Deucher  2010-12-08  1748  			}
c324acd5032f51 Alex Deucher  2010-12-08  1749  		}
771fe6b912fca5 Jerome Glisse 2009-06-05  1750  	}
771fe6b912fca5 Jerome Glisse 2009-06-05  1751  	return lvds;
771fe6b912fca5 Jerome Glisse 2009-06-05  1752  }
771fe6b912fca5 Jerome Glisse 2009-06-05  1753  =


:::::: The code at line 1661 was first introduced by commit
:::::: 7dde8a19656ddec769b609e8b5662aa7243b8b6a drm/radeon/kms/atom: pull m=
isc mode info for lvds from bios tables

:::::: TO: Alex Deucher <alexdeucher@gmail.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4321023334646762286==--

