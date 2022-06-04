Content-Type: multipart/mixed; boundary="===============7586070933028716926=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:jiri_devel_lc_dev 9/10] drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:323:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 04 Jun 2022 18:50:12 +0800
Message-ID: <202206041857.HAQJUsJK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7586070933028716926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/ethernet/mellanox/mlxsw/core_linecards.c:323:3: warning: Value stored to=
 'err' is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_lc_dev
head:   e2de0017d7e8979fd196f786987bbb81a0ed3e9d
commit: 76d11dbddaefa6db02028619cf665afb8d70650b [9/10] mlxsw: core_linecar=
ds: Expose device PSID over device info
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
604/202206041857.HAQJUsJK-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/76d11dbddaefa6db0202=
8619cf665afb8d70650b
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_lc_dev
        git checkout 76d11dbddaefa6db02028619cf665afb8d70650b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                 ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:128:7: note: 'err' =
is 0
                   if (err)
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
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:128:3: note: '?' co=
ndition is false
                   if (err)
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
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:128:3: note: Taking=
 false branch
                   if (err)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:136:7: note: Assumi=
ng 'data_valid' is true
                   if (!data_valid)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:136:3: note: '?' co=
ndition is false
                   if (!data_valid)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:136:8: note: 'data_=
valid' is true
                   if (!data_valid)
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
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:136:3: note: '?' co=
ndition is false
                   if (!data_valid)
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
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:136:3: note: Taking=
 false branch
                   if (!data_valid)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:138:3: note: 1st fu=
nction call argument is an uninitialized value
                   if (!flash_owner) /* We care only about flashable ones. =
*/
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^                    ~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:310:2: warning: Cal=
l to function 'sprintf' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           sprintf(buf, "%d", linecard->hw_revision);
           ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:310:2: note: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           sprintf(buf, "%d", linecard->hw_revision);
           ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:315:2: warning: Cal=
l to function 'sprintf' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           sprintf(buf, "%d", linecard->ini_version);
           ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:315:2: note: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           sprintf(buf, "%d", linecard->ini_version);
           ^~~~~~~
>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:323:3: warning: Val=
ue stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D devlink_info_version_fixed_put(req,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:323:3: note: Value =
stored to 'err' is never read
                   err =3D devlink_info_version_fixed_put(req,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:327:3: warning: Cal=
l to function 'sprintf' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
                   sprintf(buf, "%u.%u.%u", info->fw_major, info->fw_minor,
                   ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:327:3: note: Call t=
o function 'sprintf' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
                   sprintf(buf, "%u.%u.%u", info->fw_major, info->fw_minor,
                   ^~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:901:2: warning: Cal=
l to function 'memcpy' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'memcpy_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(event->mddq_pl, mddq_pl, sizeof(event->mddq_pl));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:901:2: note: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11
           memcpy(event->mddq_pl, mddq_pl, sizeof(event->mddq_pl));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:934:2: warning: Cal=
l to function 'memcpy' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'memcpy_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(event->mbct_pl, mbct_pl, sizeof(event->mbct_pl));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:934:2: note: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11
           memcpy(event->mbct_pl, mbct_pl, sizeof(event->mbct_pl));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1121:8: warning: Ca=
ll to function 'snprintf' is insecure as it does not provide security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'snprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           err =3D snprintf(filename, sizeof(filename),
                 ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1121:8: note: Call =
to function 'snprintf' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'snprintf_s' in case=
 of C11
           err =3D snprintf(filename, sizeof(filename),
                 ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1148:2: warning: Ca=
ll to function 'memcpy' is insecure as it does not provide security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'memcpy_s' in case =
of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandlin=
g]
           memcpy(types_info->data, firmware->data, types_info->data_size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1148:2: note: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11
           memcpy(types_info->data, firmware->data, types_info->data_size);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 224 warnings (223 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   74 warnings generated.
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   99 warnings generated.
   net/ethtool/ioctl.c:201:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, netdev_features_strings,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:201:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(data, netdev_features_strings,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:204:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, rss_hash_func_strings,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:204:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(data, rss_hash_func_strings,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:207:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, tunable_strings, sizeof(tunable_strings));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:207:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(data, tunable_strings, sizeof(tunable_strings));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:209:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, phy_tunable_strings, sizeof(phy_tunable_str=
ings));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)

vim +/err +323 drivers/net/ethernet/mellanox/mlxsw/core_linecards.c

de28976d2650d3 Jiri Pirko 2022-04-19  296  =

61245ead6e2b9f Jiri Pirko 2022-06-02  297  int mlxsw_linecard_devlink_info_=
get(struct mlxsw_linecard *linecard,
61245ead6e2b9f Jiri Pirko 2022-06-02  298  				    struct devlink_info_req =
*req,
61245ead6e2b9f Jiri Pirko 2022-06-02  299  				    struct netlink_ext_ack *=
extack)
61245ead6e2b9f Jiri Pirko 2022-06-02  300  {
61245ead6e2b9f Jiri Pirko 2022-06-02  301  	char buf[32];
61245ead6e2b9f Jiri Pirko 2022-06-02  302  	int err;
61245ead6e2b9f Jiri Pirko 2022-06-02  303  =

61245ead6e2b9f Jiri Pirko 2022-06-02  304  	mutex_lock(&linecard->lock);
61245ead6e2b9f Jiri Pirko 2022-06-02  305  	if (WARN_ON(!linecard->provisio=
ned)) {
61245ead6e2b9f Jiri Pirko 2022-06-02  306  		err =3D 0;
61245ead6e2b9f Jiri Pirko 2022-06-02  307  		goto unlock;
61245ead6e2b9f Jiri Pirko 2022-06-02  308  	}
61245ead6e2b9f Jiri Pirko 2022-06-02  309  =

61245ead6e2b9f Jiri Pirko 2022-06-02  310  	sprintf(buf, "%d", linecard->hw=
_revision);
61245ead6e2b9f Jiri Pirko 2022-06-02  311  	err =3D devlink_info_version_fi=
xed_put(req, "hw.revision", buf);
61245ead6e2b9f Jiri Pirko 2022-06-02  312  	if (err)
61245ead6e2b9f Jiri Pirko 2022-06-02  313  		goto unlock;
61245ead6e2b9f Jiri Pirko 2022-06-02  314  =

61245ead6e2b9f Jiri Pirko 2022-06-02  315  	sprintf(buf, "%d", linecard->in=
i_version);
61245ead6e2b9f Jiri Pirko 2022-06-02  316  	err =3D devlink_info_version_ru=
nning_put(req, "ini.version", buf);
61245ead6e2b9f Jiri Pirko 2022-06-02  317  	if (err)
61245ead6e2b9f Jiri Pirko 2022-06-02  318  		goto unlock;
61245ead6e2b9f Jiri Pirko 2022-06-02  319  =

a07ffbd025d76f Jiri Pirko 2022-04-25  320  	if (linecard->ready) {
a07ffbd025d76f Jiri Pirko 2022-04-25  321  		struct mlxsw_linecard_device_i=
nfo *info =3D &linecard->device.info;
a07ffbd025d76f Jiri Pirko 2022-04-25  322  =

76d11dbddaefa6 Jiri Pirko 2022-06-03 @323  		err =3D devlink_info_version_f=
ixed_put(req,
76d11dbddaefa6 Jiri Pirko 2022-06-03  324  						     DEVLINK_INFO_VERSION_=
GENERIC_FW_PSID,
76d11dbddaefa6 Jiri Pirko 2022-06-03  325  						     info->psid);
76d11dbddaefa6 Jiri Pirko 2022-06-03  326  =

a07ffbd025d76f Jiri Pirko 2022-04-25  327  		sprintf(buf, "%u.%u.%u", info-=
>fw_major, info->fw_minor,
a07ffbd025d76f Jiri Pirko 2022-04-25  328  			info->fw_sub_minor);
a07ffbd025d76f Jiri Pirko 2022-04-25  329  		err =3D devlink_info_version_r=
unning_put(req,
a07ffbd025d76f Jiri Pirko 2022-04-25  330  						       DEVLINK_INFO_VERSIO=
N_GENERIC_FW,
a07ffbd025d76f Jiri Pirko 2022-04-25  331  						       buf);
a07ffbd025d76f Jiri Pirko 2022-04-25  332  		if (err)
a07ffbd025d76f Jiri Pirko 2022-04-25  333  			goto unlock;
a07ffbd025d76f Jiri Pirko 2022-04-25  334  	}
a07ffbd025d76f Jiri Pirko 2022-04-25  335  =

61245ead6e2b9f Jiri Pirko 2022-06-02  336  unlock:
61245ead6e2b9f Jiri Pirko 2022-06-02  337  	mutex_unlock(&linecard->lock);
61245ead6e2b9f Jiri Pirko 2022-06-02  338  	return err;
61245ead6e2b9f Jiri Pirko 2022-06-02  339  }
61245ead6e2b9f Jiri Pirko 2022-06-02  340  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7586070933028716926==--

