Content-Type: multipart/mixed; boundary="===============8452568659751920335=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/dp: Factor out a function to probe a DPCD address
Date: Sun, 10 Apr 2022 05:06:33 +0800
Message-ID: <202204100402.TVr7v9X5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8452568659751920335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220408172154.807900-1-imre.deak@intel.com>
References: <20220408172154.807900-1-imre.deak@intel.com>
TO: Imre Deak <imre.deak@intel.com>
TO: intel-gfx(a)lists.freedesktop.org
CC: dri-devel(a)lists.freedesktop.org

Hi Imre,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm/drm-next drm-tip/drm-tip v5.18-rc1 next-202=
20408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-dp-Fac=
tor-out-a-function-to-probe-a-DPCD-address/20220409-012327
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: riscv-randconfig-c006-20220408 (https://download.01.org/0day-ci/arc=
hive/20220410/202204100402.TVr7v9X5-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 893e1c=
18b98d8bbc7b8d7d22cc2c348f65c72ad9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/61ca1af66effd951fb5=
8fc8974c3520dd1f987f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Imre-Deak/drm-dp-Factor-out-a-func=
tion-to-probe-a-DPCD-address/20220409-012327
        git checkout 61ca1af66effd951fb58fc8974c3520dd1f987f2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mfd/as3711.c:129:3: note: Taking false branch
                   if (!pdata)
                   ^
   drivers/mfd/as3711.c:139:6: note: Assuming 'as3711' is non-null
           if (!as3711)
               ^~~~~~~
   drivers/mfd/as3711.c:139:2: note: Taking false branch
           if (!as3711)
           ^
   drivers/mfd/as3711.c:145:6: note: Assuming field 'irq' is 0
           if (client->irq)
               ^~~~~~~~~~~
   drivers/mfd/as3711.c:145:2: note: Taking false branch
           if (client->irq)
           ^
   drivers/mfd/as3711.c:149:2: note: Taking false branch
           if (IS_ERR(as3711->regmap)) {
           ^
   drivers/mfd/as3711.c:157:6: note: Assuming 'ret' is not equal to 0
           if (!ret)
               ^~~~
   drivers/mfd/as3711.c:157:2: note: Taking false branch
           if (!ret)
           ^
   drivers/mfd/as3711.c:159:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/mfd/as3711.c:159:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/mfd/as3711.c:163:6: note: Assuming 'id1' is equal to 139
           if (id1 !=3D 0x8b)
               ^~~~~~~~~~~
   drivers/mfd/as3711.c:163:2: note: Taking false branch
           if (id1 !=3D 0x8b)
           ^
   drivers/mfd/as3711.c:165:2: note: Loop condition is false.  Exiting loop
           dev_info(as3711->dev, "AS3711 detected: %x:%x\n", id1, id2);
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/mfd/as3711.c:165:2: note: 4th function call argument is an unini=
tialized value
           dev_info(as3711->dev, "AS3711 detected: %x:%x\n", id1, id2);
           ^
   include/linux/dev_printk.h:150:24: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
                                 ^                                         =
 ~~~~~~~~~~~
   include/linux/dev_printk.h:110:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                   ^                   ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/gpu/drm/dp/drm_dp.c:3686:4: warning: Undefined or garbage value =
returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                           return buf[0];
                           ^
   drivers/gpu/drm/dp/drm_dp.c:3822:6: note: Assuming 'panel' is non-null
           if (!panel || !panel->dev || !aux)
               ^~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3822:6: note: Left side of '||' is false
   drivers/gpu/drm/dp/drm_dp.c:3822:16: note: Assuming field 'dev' is non-n=
ull
           if (!panel || !panel->dev || !aux)
                         ^~~~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3822:6: note: Left side of '||' is false
           if (!panel || !panel->dev || !aux)
               ^
   drivers/gpu/drm/dp/drm_dp.c:3822:31: note: Assuming 'aux' is non-null
           if (!panel || !panel->dev || !aux)
                                        ^~~~
   drivers/gpu/drm/dp/drm_dp.c:3822:2: note: Taking false branch
           if (!panel || !panel->dev || !aux)
           ^
   drivers/gpu/drm/dp/drm_dp.c:3827:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3827:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/dp/drm_dp.c:3830:2: note: Taking false branch
           if (!drm_edp_backlight_supported(edp_dpcd)) {
           ^
   drivers/gpu/drm/dp/drm_dp.c:3836:6: note: Assuming 'bl' is non-null
           if (!bl)
               ^~~
   drivers/gpu/drm/dp/drm_dp.c:3836:2: note: Taking false branch
           if (!bl)
           ^
   drivers/gpu/drm/dp/drm_dp.c:3841:8: note: Calling 'drm_edp_backlight_ini=
t'
           ret =3D drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3721:6: note: Assuming the condition is false
           if (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3721:2: note: Taking false branch
           if (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
           ^
   drivers/gpu/drm/dp/drm_dp.c:3723:6: note: Assuming the condition is false
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3723:2: note: Taking false branch
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)
           ^
   drivers/gpu/drm/dp/drm_dp.c:3725:6: note: Assuming the condition is false
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3725:2: note: Taking false branch
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
           ^
   drivers/gpu/drm/dp/drm_dp.c:3729:6: note: Assuming field 'aux_set' is tr=
ue
           if (!bl->aux_set && !(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_=
PWM_PIN_CAP)) {
               ^~~~~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3729:19: note: Left side of '&&' is false
           if (!bl->aux_set && !(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_=
PWM_PIN_CAP)) {
                            ^
   drivers/gpu/drm/dp/drm_dp.c:3736:8: note: Calling 'drm_edp_backlight_pro=
be_max'
           ret =3D drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz,=
 edp_dpcd);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3567:11: note: Field 'aux_set' is true
           if (!bl->aux_set)
                    ^
   drivers/gpu/drm/dp/drm_dp.c:3567:2: note: Taking false branch
           if (!bl->aux_set)
           ^
   drivers/gpu/drm/dp/drm_dp.c:3571:6: note: Assuming 'ret' is equal to 1
           if (ret !=3D 1) {
               ^~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3571:2: note: Taking false branch
           if (ret !=3D 1) {
           ^
   drivers/gpu/drm/dp/drm_dp.c:3579:7: note: 'driver_pwm_freq_hz' is 0
           if (!driver_pwm_freq_hz)
                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3579:2: note: Taking true branch
           if (!driver_pwm_freq_hz)
           ^
   drivers/gpu/drm/dp/drm_dp.c:3580:3: note: Returning without writing to '=
bl->aux_set', which participates in a condition later
                   return 0;
                   ^
   drivers/gpu/drm/dp/drm_dp.c:3580:3: note: Returning without writing to '=
bl->lsb_reg_used', which participates in a condition later
   drivers/gpu/drm/dp/drm_dp.c:3736:8: note: Returning from 'drm_edp_backli=
ght_probe_max'
           ret =3D drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz,=
 edp_dpcd);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3737:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/gpu/drm/dp/drm_dp.c:3737:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/dp/drm_dp.c:3740:8: note: Calling 'drm_edp_backlight_pro=
be_state'
           ret =3D drm_edp_backlight_probe_state(aux, bl, current_mode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/dp/drm_dp.c:3663:6: note: Assuming 'ret' is equal to 1
           if (ret !=3D 1) {
               ^~~~~~~~

vim +3686 drivers/gpu/drm/dp/drm_dp.c

867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3653  =

867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3654 =
 static inline int
f58a4353116723 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3655 =
 drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backl=
ight_info *bl,
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3656 =
 			      u8 *current_mode)
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3657 =
 {
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3658 =
 	int ret;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3659 =
 	u8 buf[2];
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3660 =
 	u8 mode_reg;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3661  =

867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3662 =
 	ret =3D drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode_=
reg);
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3663 =
 	if (ret !=3D 1) {
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3664 =
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3665 =
 			    aux->name, ret);
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3666 =
 		return ret < 0 ? ret : -EIO;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3667 =
 	}
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3668  =

867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3669 =
 	*current_mode =3D (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
f58a4353116723 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3670 =
 	if (!bl->aux_set)
f58a4353116723 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3671 =
 		return 0;
f58a4353116723 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3672  =

867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3673 =
 	if (*current_mode =3D=3D DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3674 =
 		int size =3D 1 + bl->lsb_reg_used;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3675  =

867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3676 =
 		ret =3D drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, size=
);
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3677 =
 		if (ret !=3D size) {
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3678 =
 			drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight level: %d\n",
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3679 =
 				    aux->name, ret);
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3680 =
 			return ret < 0 ? ret : -EIO;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3681 =
 		}
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3682  =

867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3683 =
 		if (bl->lsb_reg_used)
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3684 =
 			return (buf[0] << 8) | buf[1];
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3685 =
 		else
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14 @3686 =
 			return buf[0];
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3687 =
 	}
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3688  =

867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3689 =
 	/*
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3690 =
 	 * If we're not in DPCD control mode yet, the programmed brightness value=
 is meaningless and
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3691 =
 	 * the driver should assume max brightness
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3692 =
 	 */
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3693 =
 	return bl->max;
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3694 =
 }
867cf9cd73c3d3 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3695  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8452568659751920335==--

