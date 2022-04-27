Content-Type: multipart/mixed; boundary="===============6932026511211563475=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5938/6873] drivers/gpu/drm/display/drm_dp_helper.c:3677:4: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Wed, 27 Apr 2022 10:03:45 +0800
Message-ID: <202204270924.0Un8Y1L1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6932026511211563475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   088fb7eff3496e0f61fdf68bda89b81a4d0a4434
commit: 1e0f66420b13fdd45754be0f15220a9185d59aa4 [5938/6873] drm/display: I=
ntroduce a DRM display-helper module
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001-20220425 (https://download.01.org/0day-ci/arch=
ive/20220427/202204270924.0Un8Y1L1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D1e0f66420b13fdd45754be0f15220a9185d59aa4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1e0f66420b13fdd45754be0f15220a9185d59aa4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~
   drivers/input/touchscreen/wacom_w8001.c:614:2: note: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(w8001->phys, sizeof(w8001->phys), "%s/input0", serio->p=
hys);
           ^~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:123:2: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, &offset, 1);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:123:2: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, &offset, 1);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:124:2: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data + 1, buffer, size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:124:2: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data + 1, buffer, size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   drivers/gpu/drm/display/drm_dp_helper.c:480:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:480:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:693:2: warning: Call to function=
 'memmove' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memmove_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(&link_status[DP_SINK_STATUS - DP_LANE0_1_STATUS + 1],
           ^~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:693:2: note: Call to function 'm=
emmove' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memmove_s' in case of C11
           memmove(&link_status[DP_SINK_STATUS - DP_LANE0_1_STATUS + 1],
           ^~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:872:2: warning: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:872:2: note: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:931:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:931:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:1370:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(id, 0, sizeof(id));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:1370:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(id, 0, sizeof(id));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:1813:2: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:1813:2: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/display/drm_dp_helper.c:3677:4: warning: Undefined or ga=
rbage value returned to caller [clang-analyzer-core.uninitialized.UndefRetu=
rn]
                           return buf[0];
                           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3813:6: note: Assuming 'panel' i=
s non-null
           if (!panel || !panel->dev || !aux)
               ^~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3813:6: note: Left side of '||' =
is false
   drivers/gpu/drm/display/drm_dp_helper.c:3813:16: note: Assuming field 'd=
ev' is non-null
           if (!panel || !panel->dev || !aux)
                         ^~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3813:6: note: Left side of '||' =
is false
           if (!panel || !panel->dev || !aux)
               ^
   drivers/gpu/drm/display/drm_dp_helper.c:3813:31: note: Assuming 'aux' is=
 non-null
           if (!panel || !panel->dev || !aux)
                                        ^~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3813:2: note: Taking false branch
           if (!panel || !panel->dev || !aux)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3818:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/gpu/drm/display/drm_dp_helper.c:3818:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3821:2: note: Taking false branch
           if (!drm_edp_backlight_supported(edp_dpcd)) {
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3827:6: note: Assuming 'bl' is n=
on-null
           if (!bl)
               ^~~
   drivers/gpu/drm/display/drm_dp_helper.c:3827:2: note: Taking false branch
           if (!bl)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3832:8: note: Calling 'drm_edp_b=
acklight_init'
           ret =3D drm_edp_backlight_init(aux, &bl->info, 0, edp_dpcd,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3712:6: note: Assuming the condi=
tion is false
           if (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3712:2: note: Taking false branch
           if (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3714:6: note: Assuming the condi=
tion is true
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3714:2: note: Taking true branch
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3716:6: note: Assuming the condi=
tion is false
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3716:2: note: Taking false branch
           if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3720:11: note: Field 'aux_set' i=
s true
           if (!bl->aux_set && !(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_=
PWM_PIN_CAP)) {
                    ^
   drivers/gpu/drm/display/drm_dp_helper.c:3720:19: note: Left side of '&&'=
 is false
           if (!bl->aux_set && !(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_=
PWM_PIN_CAP)) {
                            ^
   drivers/gpu/drm/display/drm_dp_helper.c:3727:8: note: Calling 'drm_edp_b=
acklight_probe_max'
           ret =3D drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz,=
 edp_dpcd);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3558:11: note: Field 'aux_set' i=
s true
           if (!bl->aux_set)
                    ^
   drivers/gpu/drm/display/drm_dp_helper.c:3558:2: note: Taking false branch
           if (!bl->aux_set)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3562:6: note: Assuming 'ret' is =
equal to 1
           if (ret !=3D 1) {
               ^~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3562:2: note: Taking false branch
           if (ret !=3D 1) {
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3570:7: note: 'driver_pwm_freq_h=
z' is 0
           if (!driver_pwm_freq_hz)
                ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3570:2: note: Taking true branch
           if (!driver_pwm_freq_hz)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3571:3: note: Returning without =
writing to 'bl->aux_set', which participates in a condition later
                   return 0;
                   ^
   drivers/gpu/drm/display/drm_dp_helper.c:3571:3: note: Returning without =
writing to 'bl->lsb_reg_used', which participates in a condition later
   drivers/gpu/drm/display/drm_dp_helper.c:3727:8: note: Returning from 'dr=
m_edp_backlight_probe_max'
           ret =3D drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz,=
 edp_dpcd);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3728:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/gpu/drm/display/drm_dp_helper.c:3728:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/display/drm_dp_helper.c:3731:8: note: Calling 'drm_edp_b=
acklight_probe_state'
           ret =3D drm_edp_backlight_probe_state(aux, bl, current_mode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/display/drm_dp_helper.c:3654:6: note: Assuming 'ret' is =
equal to 1
           if (ret !=3D 1) {
               ^~~~~~~~

vim +3677 drivers/gpu/drm/display/drm_dp_helper.c

867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3644=
  =

867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3645=
  static inline int
f58a43531167230 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3646=
  drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_back=
light_info *bl,
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3647=
  			      u8 *current_mode)
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3648=
  {
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3649=
  	int ret;
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3650=
  	u8 buf[2];
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3651=
  	u8 mode_reg;
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3652=
  =

867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3653=
  	ret =3D drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &mode=
_reg);
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3654=
  	if (ret !=3D 1) {
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3655=
  		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3656=
  			    aux->name, ret);
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3657=
  		return ret < 0 ? ret : -EIO;
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3658=
  	}
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3659=
  =

867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3660=
  	*current_mode =3D (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
f58a43531167230 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3661=
  	if (!bl->aux_set)
f58a43531167230 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3662=
  		return 0;
f58a43531167230 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-11-05  3663=
  =

867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3664=
  	if (*current_mode =3D=3D DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3665=
  		int size =3D 1 + bl->lsb_reg_used;
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3666=
  =

867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3667=
  		ret =3D drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, siz=
e);
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3668=
  		if (ret !=3D size) {
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3669=
  			drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight level: %d\n",
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3670=
  				    aux->name, ret);
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3671=
  			return ret < 0 ? ret : -EIO;
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3672=
  		}
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3673=
  =

867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3674=
  		if (bl->lsb_reg_used)
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3675=
  			return (buf[0] << 8) | buf[1];
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3676=
  		else
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14 @3677=
  			return buf[0];
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3678=
  	}
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3679=
  =

867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3680=
  	/*
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3681=
  	 * If we're not in DPCD control mode yet, the programmed brightness valu=
e is meaningless and
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3682=
  	 * the driver should assume max brightness
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3683=
  	 */
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3684=
  	return bl->max;
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3685=
  }
867cf9cd73c3d31 drivers/gpu/drm/drm_dp_helper.c Lyude Paul 2021-05-14  3686=
  =


:::::: The code at line 3677 was first introduced by commit
:::::: 867cf9cd73c3d31666e4b480aa4f52828d25ac94 drm/dp: Extract i915's eDP =
backlight code into DRM helpers

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Lyude Paul <lyude@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6932026511211563475==--

