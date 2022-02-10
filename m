Content-Type: multipart/mixed; boundary="===============5114760172365315326=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_ddi.c:1746:2: warning: Value stored to 'port_mask' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 11 Feb 2022 03:25:36 +0800
Message-ID: <202202110347.CLYseEuf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5114760172365315326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e3c85076d7a6f986445b9008be7e7f83d1b0780a
commit: 87bd8498690b4adc916ef35dd3b4d72ec83e5fa6 drm/i915: Use .disable_clo=
ck() for pll sanitation
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001-20220207 (https://download.01.org/0day-ci/arch=
ive/20220211/202202110347.CLYseEuf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850=
ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D87bd8498690b4adc916ef35dd3b4d72ec83e5fa6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 87bd8498690b4adc916ef35dd3b4d72ec83e5fa6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwmon/f71882fg.c:1792:16: note: Taking false branch
           int val, nr =3D to_sensor_dev_attr_2(devattr)->index;
                         ^
   include/linux/hwmon-sysfs.h:51:2: note: expanded from macro 'to_sensor_d=
ev_attr_2'
           container_of(_dev_attr, struct sensor_device_attribute_2, dev_at=
tr)
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
   drivers/hwmon/f71882fg.c:1792:16: note: Loop condition is false.  Exitin=
g loop
           int val, nr =3D to_sensor_dev_attr_2(devattr)->index;
                         ^
   include/linux/hwmon-sysfs.h:51:2: note: expanded from macro 'to_sensor_d=
ev_attr_2'
           container_of(_dev_attr, struct sensor_device_attribute_2, dev_at=
tr)
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
   drivers/hwmon/f71882fg.c:1794:6: note: Assuming the condition is false
           if (data->pwm_enable & (1 << (2 * nr)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1794:2: note: Taking false branch
           if (data->pwm_enable & (1 << (2 * nr)))
           ^
   drivers/hwmon/f71882fg.c:1800:6: note: Calling 'fan_from_reg'
                           / fan_from_reg(data->fan_full_speed[nr]);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1147:9: note: Assuming 'reg' is 0
           return reg ? (1500000 / reg) : 0;
                  ^~~
   drivers/hwmon/f71882fg.c:1147:9: note: '?' condition is false
   drivers/hwmon/f71882fg.c:1147:2: note: Returning zero
           return reg ? (1500000 / reg) : 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1800:6: note: Returning from 'fan_from_reg'
                           / fan_from_reg(data->fan_full_speed[nr]);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/f71882fg.c:1800:4: note: Division by zero
                           / fan_from_reg(data->fan_full_speed[nr]);
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (22 in non-user code).
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
   5 warnings generated.
>> drivers/gpu/drm/i915/display/intel_ddi.c:1746:2: warning: Value stored t=
o 'port_mask' is never read [clang-analyzer-deadcode.DeadStores]
           port_mask =3D BIT(encoder->port);
           ^
   drivers/gpu/drm/i915/display/intel_ddi.c:1746:2: note: Value stored to '=
port_mask' is never read
   drivers/gpu/drm/i915/display/intel_ddi.c:2099:2: warning: Value stored t=
o 'intel_dp' is never read [clang-analyzer-deadcode.DeadStores]
           intel_dp =3D enc_to_intel_dp(encoder);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:2099:2: note: Value stored to '=
intel_dp' is never read
           intel_dp =3D enc_to_intel_dp(encoder);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:2115:2: warning: Value stored t=
o 'intel_dp' is never read [clang-analyzer-deadcode.DeadStores]
           intel_dp =3D enc_to_intel_dp(encoder);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_ddi.c:2115:2: note: Value stored to '=
intel_dp' is never read
           intel_dp =3D enc_to_intel_dp(encoder);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~
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
   fs/xfs/xfs_fsmap.c:352:26: warning: Access to field 'bc_mp' results in a=
 dereference of a null pointer (loaded from variable 'cur') [clang-analyzer=
-core.NullDereference]
           struct xfs_mount                *mp =3D cur->bc_mp;
                                                 ^
   fs/xfs/xfs_fsmap.c:707:9: note: Calling '__xfs_getfsmap_datadev'
           return __xfs_getfsmap_datadev(tp, keys, info,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_fsmap.c:584:6: note: Assuming 'eofs' is > field 'fmr_physical'
           if (keys[0].fmr_physical >=3D eofs)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_fsmap.c:584:2: note: Taking false branch
           if (keys[0].fmr_physical >=3D eofs)
           ^
   fs/xfs/xfs_fsmap.c:586:6: note: Assuming 'eofs' is > field 'fmr_physical'
           if (keys[1].fmr_physical >=3D eofs)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_fsmap.c:586:2: note: Taking false branch
           if (keys[1].fmr_physical >=3D eofs)
           ^
   fs/xfs/xfs_fsmap.c:599:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/xfs_fsmap.c:599:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/xfs_fsmap.c:614:30: note: Assuming 'end_ag' is < field 'agno'
           for (info->agno =3D start_ag; info->agno <=3D end_ag; info->agno=
++) {
                                       ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_fsmap.c:614:2: note: Loop condition is false. Execution conti=
nues on line 663
           for (info->agno =3D start_ag; info->agno <=3D end_ag; info->agno=
++) {
           ^
   fs/xfs/xfs_fsmap.c:664:10: note: Calling 'xfs_getfsmap_datadev_rmapbt_qu=
ery'
           error =3D query_fn(tp, info, &bt_cur, priv);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_fsmap.c:689:12: note: Field 'last' is true
           if (info->last)
                     ^
   fs/xfs/xfs_fsmap.c:689:2: note: Taking true branch
           if (info->last)
           ^
   fs/xfs/xfs_fsmap.c:690:38: note: Passing null pointer value via 1st para=
meter 'cur'
                   return xfs_getfsmap_datadev_helper(*curpp, &info->high, =
info);
                                                      ^~~~~~
   fs/xfs/xfs_fsmap.c:690:10: note: Calling 'xfs_getfsmap_datadev_helper'
                   return xfs_getfsmap_datadev_helper(*curpp, &info->high, =
info);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/xfs/xfs_fsmap.c:352:26: note: Access to field 'bc_mp' results in a de=
reference of a null pointer (loaded from variable 'cur')
           struct xfs_mount                *mp =3D cur->bc_mp;
                                                 ^~~
   fs/xfs/xfs_fsmap.c:370:26: warning: Access to field 'bc_mp' results in a=
 dereference of a null pointer (loaded from variable 'cur') [clang-analyzer=
-core.NullDereference]
           struct xfs_mount                *mp =3D cur->bc_mp;
                                                 ^
   fs/xfs/xfs_fsmap.c:744:9: note: Calling '__xfs_getfsmap_datadev'
           return __xfs_getfsmap_datadev(tp, keys, info,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_fsmap.c:584:6: note: Assuming 'eofs' is > field 'fmr_physical'
           if (keys[0].fmr_physical >=3D eofs)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_fsmap.c:584:2: note: Taking false branch
           if (keys[0].fmr_physical >=3D eofs)
           ^
   fs/xfs/xfs_fsmap.c:586:6: note: Assuming 'eofs' is > field 'fmr_physical'
           if (keys[1].fmr_physical >=3D eofs)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_fsmap.c:586:2: note: Taking false branch
           if (keys[1].fmr_physical >=3D eofs)
           ^
   fs/xfs/xfs_fsmap.c:599:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/xfs_fsmap.c:599:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/xfs_fsmap.c:614:30: note: Assuming 'end_ag' is < field 'agno'

vim +/port_mask +1746 drivers/gpu/drm/i915/display/intel_ddi.c

c27e917e2bda74 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni     20=
18-04-27  1719  =

70332ac539c5c5 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-01  1720  void icl_sanitize_encoder_pll_mapping(struct intel_encoder =
*encoder)
70332ac539c5c5 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-01  1721  {
70332ac539c5c5 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-01  1722  	struct drm_i915_private *dev_priv =3D to_i915(encoder->bas=
e.dev);
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1723  	u32 port_mask;
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1724  	bool ddi_clk_needed;
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1725  =

30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1726  	/*
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1727  	 * In case of DP MST, we sanitize the primary encoder only=
, not the
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1728  	 * virtual ones.
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1729  	 */
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1730  	if (encoder->type =3D=3D INTEL_OUTPUT_DP_MST)
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1731  		return;
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1732  =

30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1733  	if (!encoder->base.crtc && intel_encoder_is_dp(encoder)) {
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1734  		u8 pipe_mask;
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1735  		bool is_mst;
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1736  =

30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1737  		intel_ddi_get_encoder_pipes(encoder, &pipe_mask, &is_mst);
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1738  		/*
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1739  		 * In the unlikely case that BIOS enables DP in MST mode,=
 just
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1740  		 * warn since our MST HW readout is incomplete.
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1741  		 */
1de143cc5b6021 drivers/gpu/drm/i915/display/intel_ddi.c Pankaj Bharadiya 20=
20-02-20  1742  		if (drm_WARN_ON(&dev_priv->drm, is_mst))
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1743  			return;
30f5ccfa8c8a0f drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-07  1744  	}
70332ac539c5c5 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-01  1745  =

1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29 @1746  	port_mask =3D BIT(encoder->port);
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1747  	ddi_clk_needed =3D encoder->base.crtc;
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1748  =

1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1749  	if (encoder->type =3D=3D INTEL_OUTPUT_DSI) {
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1750  		struct intel_encoder *other_encoder;
70332ac539c5c5 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-01  1751  =

1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1752  		port_mask =3D intel_dsi_encoder_ports(encoder);
70332ac539c5c5 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-01  1753  		/*
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1754  		 * Sanity check that we haven't incorrectly registered an=
other
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1755  		 * encoder using any of the ports of this DSI encoder.
70332ac539c5c5 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-01  1756  		 */
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1757  		for_each_intel_encoder(&dev_priv->drm, other_encoder) {
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1758  			if (other_encoder =3D=3D encoder)
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1759  				continue;
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1760  =

1de143cc5b6021 drivers/gpu/drm/i915/display/intel_ddi.c Pankaj Bharadiya 20=
20-02-20  1761  			if (drm_WARN_ON(&dev_priv->drm,
1de143cc5b6021 drivers/gpu/drm/i915/display/intel_ddi.c Pankaj Bharadiya 20=
20-02-20  1762  					port_mask & BIT(other_encoder->port)))
70332ac539c5c5 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-01  1763  				return;
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1764  		}
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1765  		/*
942d1cf48eae3f drivers/gpu/drm/i915/intel_ddi.c         Vandita Kulkarni 20=
19-03-25  1766  		 * For DSI we keep the ddi clocks gated
942d1cf48eae3f drivers/gpu/drm/i915/intel_ddi.c         Vandita Kulkarni 20=
19-03-25  1767  		 * except during enable/disable sequence.
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1768  		 */
942d1cf48eae3f drivers/gpu/drm/i915/intel_ddi.c         Vandita Kulkarni 20=
19-03-25  1769  		ddi_clk_needed =3D false;
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1770  	}
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1771  =

87bd8498690b4a drivers/gpu/drm/i915/display/intel_ddi.c Ville Syrj=C3=A4l=
=C3=A4    2021-02-05  1772  	if (!ddi_clk_needed && encoder->disable_clock)
87bd8498690b4a drivers/gpu/drm/i915/display/intel_ddi.c Ville Syrj=C3=A4l=
=C3=A4    2021-02-05  1773  		encoder->disable_clock(encoder);
1dd07e56a3f1b3 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-29  1774  }
70332ac539c5c5 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak        20=
18-11-01  1775  =


:::::: The code at line 1746 was first introduced by commit
:::::: 1dd07e56a3f1b38a68f3dbd263a4badc53ae274a drm/i915/icl: Sanitize DDI =
port clock gating for DSI ports

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5114760172365315326==--

