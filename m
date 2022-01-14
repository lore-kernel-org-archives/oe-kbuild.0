Content-Type: multipart/mixed; boundary="===============5822653426913988375=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:jiri_devel_linecards 55/57] drivers/net/ethernet/mellanox/mlxsw/core_thermal.c:984:3: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 14 Jan 2022 19:15:30 +0800
Message-ID: <202201141905.bLha4kdv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5822653426913988375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vadim Pasternak <vadimp@nvidia.com>
CC: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_linecards
head:   2f768899ec7db92c6c3bf9528b87a8e997159a6f
commit: d8568c67d454465d37e13b0400c487138db6d8db [55/57] mlxsw: core_therma=
l: Add interfaces for line card initialization and de-initialization
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
114/202201141905.bLha4kdv-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/d8568c67d454465d37e1=
3b0400c487138db6d8db
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw jiri_devel_linecards
        git checkout d8568c67d454465d37e13b0400c487138db6d8db
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   lib/ts_fsm.c:155:32: note: expanded from macro 'end_of_data'
   #define end_of_data() unlikely(block_idx >=3D block_len && !GET_NEXT_BLO=
CK())
                                  ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
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
   lib/ts_fsm.c:219:8: note: Left side of '&&' is false
                           if (end_of_data())
                               ^
   lib/ts_fsm.c:155:55: note: expanded from macro 'end_of_data'
   #define end_of_data() unlikely(block_idx >=3D block_len && !GET_NEXT_BLO=
CK())
                                                         ^
   lib/ts_fsm.c:219:8: note: 'block_idx' is < 'block_len'
                           if (end_of_data())
                               ^
   lib/ts_fsm.c:155:32: note: expanded from macro 'end_of_data'
   #define end_of_data() unlikely(block_idx >=3D block_len && !GET_NEXT_BLO=
CK())
                                  ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
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
   lib/ts_fsm.c:219:8: note: Left side of '&&' is false
                           if (end_of_data())
                               ^
   lib/ts_fsm.c:155:55: note: expanded from macro 'end_of_data'
   #define end_of_data() unlikely(block_idx >=3D block_len && !GET_NEXT_BLO=
CK())
                                                         ^
   lib/ts_fsm.c:219:4: note: '?' condition is false
                           if (end_of_data())
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
   lib/ts_fsm.c:219:4: note: Taking false branch
                           if (end_of_data())
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   lib/ts_fsm.c:222:24: note: Passing null pointer value via 1st parameter =
't'
                           while (!match_token(next, data[block_idx])) {
                                               ^~~~
   lib/ts_fsm.c:222:12: note: Calling 'match_token'
                           while (!match_token(next, data[block_idx])) {
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/ts_fsm.c:128:2: note: Access to field 'type' results in a dereferenc=
e of a null pointer (loaded from variable 't')
           if (t->type)
           ^
   include/linux/compiler.h:56:46: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                ^~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   1 warning generated.
   arch/x86/kernel/cpu/mce/core.c:315:4: warning: Value stored to 'apei_err=
' is never read [clang-analyzer-deadcode.DeadStores]
                           apei_err =3D apei_write_mce(final);
                           ^          ~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/core.c:315:4: note: Value stored to 'apei_err' i=
s never read
                           apei_err =3D apei_write_mce(final);
                           ^          ~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1126:2: warning: Va=
lue stored to 'linecards' is never read [clang-analyzer-deadcode.DeadStores]
           linecards =3D linecard->linecards;
           ^           ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:1126:2: note: Value=
 stored to 'linecards' is never read
           linecards =3D linecard->linecards;
           ^           ~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> drivers/net/ethernet/mellanox/mlxsw/core_thermal.c:984:3: warning: Value=
 stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -ENOMEM;
                   ^     ~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_thermal.c:984:3: note: Value st=
ored to 'err' is never read
                   err =3D -ENOMEM;
                   ^     ~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   kernel/bpf/syscall.c:4127:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   kernel/bpf/syscall.c:4127:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   kernel/bpf/verifier.c:1739:9: warning: 3rd function call argument is an =
uninitialized value [clang-analyzer-core.CallAndMessage]
           return bsearch(&desc, tab->descs, tab->nr_descs,
                  ^
   kernel/bpf/verifier.c:1848:6: note: Assuming 'tab' is null
           if (!tab) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/bpf/verifier.c:1848:2: note: '?' condition is false
           if (!tab) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/bpf/verifier.c:1848:7: note: 'tab' is null
           if (!tab) {
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
   kernel/bpf/verifier.c:1848:2: note: '?' condition is true
           if (!tab) {
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
   kernel/bpf/verifier.c:1848:2: note: Taking true branch
           if (!tab) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/bpf/verifier.c:1849:7: note: Assuming 'btf_vmlinux' is non-null
                   if (!btf_vmlinux) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/bpf/verifier.c:1849:3: note: '?' condition is false
                   if (!btf_vmlinux) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/bpf/verifier.c:1849:8: note: 'btf_vmlinux' is non-null
                   if (!btf_vmlinux) {
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

vim +/err +984 drivers/net/ethernet/mellanox/mlxsw/core_thermal.c

f14f4e621b1b4a Vadim Pasternak 2019-06-24   952  =

d8568c67d45446 Vadim Pasternak 2021-05-12   953  static void
d8568c67d45446 Vadim Pasternak 2021-05-12   954  mlxsw_thermal_got_active(s=
truct mlxsw_core *mlxsw_core, u8 slot_index,
d8568c67d45446 Vadim Pasternak 2021-05-12   955  			 const struct mlxsw_lin=
ecard *linecard, void *priv)
d8568c67d45446 Vadim Pasternak 2021-05-12   956  {
d8568c67d45446 Vadim Pasternak 2021-05-12   957  	struct mlxsw_env_gearbox_=
sensors_map map;
d8568c67d45446 Vadim Pasternak 2021-05-12   958  	struct mlxsw_thermal *the=
rmal =3D priv;
d8568c67d45446 Vadim Pasternak 2021-05-12   959  	struct mlxsw_thermal_area=
 *lc;
d8568c67d45446 Vadim Pasternak 2021-05-12   960  	int err;
d8568c67d45446 Vadim Pasternak 2021-05-12   961  =

d8568c67d45446 Vadim Pasternak 2021-05-12   962  	lc =3D kzalloc(sizeof(*lc=
), GFP_KERNEL);
d8568c67d45446 Vadim Pasternak 2021-05-12   963  	if (!lc)
d8568c67d45446 Vadim Pasternak 2021-05-12   964  		return;
d8568c67d45446 Vadim Pasternak 2021-05-12   965  =

d8568c67d45446 Vadim Pasternak 2021-05-12   966  	lc->slot_index =3D slot_i=
ndex;
d8568c67d45446 Vadim Pasternak 2021-05-12   967  	lc->parent =3D thermal;
d8568c67d45446 Vadim Pasternak 2021-05-12   968  	thermal->linecards[slot_i=
ndex - 1] =3D lc;
d8568c67d45446 Vadim Pasternak 2021-05-12   969  	err =3D mlxsw_thermal_mod=
ules_init(thermal->bus_info->dev, thermal->core,
d8568c67d45446 Vadim Pasternak 2021-05-12   970  					 thermal, lc);
d8568c67d45446 Vadim Pasternak 2021-05-12   971  	if (err)
d8568c67d45446 Vadim Pasternak 2021-05-12   972  		goto err_thermal_linecar=
d_modules_init;
d8568c67d45446 Vadim Pasternak 2021-05-12   973  =

d8568c67d45446 Vadim Pasternak 2021-05-12   974  	err =3D mlxsw_env_sensor_=
map_create(thermal->core, thermal->bus_info,
d8568c67d45446 Vadim Pasternak 2021-05-12   975  					  linecard->slot_inde=
x, &map);
d8568c67d45446 Vadim Pasternak 2021-05-12   976  	if (err)
d8568c67d45446 Vadim Pasternak 2021-05-12   977  		goto err_thermal_linecar=
d_env_sensor_map_create;
d8568c67d45446 Vadim Pasternak 2021-05-12   978  =

d8568c67d45446 Vadim Pasternak 2021-05-12   979  	lc->gearbox_sensor_map =
=3D map.sensor_bit_map;
d8568c67d45446 Vadim Pasternak 2021-05-12   980  	lc->tz_gearbox_num =3D ma=
p.sensor_count;
d8568c67d45446 Vadim Pasternak 2021-05-12   981  	lc->tz_gearbox_arr =3D kc=
alloc(lc->tz_gearbox_num, sizeof(*lc->tz_gearbox_arr),
d8568c67d45446 Vadim Pasternak 2021-05-12   982  				     GFP_KERNEL);
d8568c67d45446 Vadim Pasternak 2021-05-12   983  	if (!lc->tz_gearbox_arr) {
d8568c67d45446 Vadim Pasternak 2021-05-12  @984  		err =3D -ENOMEM;
d8568c67d45446 Vadim Pasternak 2021-05-12   985  		goto err_tz_gearbox_arr_=
alloc;
d8568c67d45446 Vadim Pasternak 2021-05-12   986  	}
d8568c67d45446 Vadim Pasternak 2021-05-12   987  =

d8568c67d45446 Vadim Pasternak 2021-05-12   988  	err =3D mlxsw_thermal_gea=
rboxes_init(thermal->bus_info->dev, thermal->core,
d8568c67d45446 Vadim Pasternak 2021-05-12   989  					   thermal, lc);
d8568c67d45446 Vadim Pasternak 2021-05-12   990  	if (err)
d8568c67d45446 Vadim Pasternak 2021-05-12   991  		goto err_thermal_linecar=
d_gearboxes_init;
d8568c67d45446 Vadim Pasternak 2021-05-12   992  =

d8568c67d45446 Vadim Pasternak 2021-05-12   993  	return;
d8568c67d45446 Vadim Pasternak 2021-05-12   994  =

d8568c67d45446 Vadim Pasternak 2021-05-12   995  err_thermal_linecard_gearb=
oxes_init:
d8568c67d45446 Vadim Pasternak 2021-05-12   996  	kfree(lc->tz_gearbox_arr);
d8568c67d45446 Vadim Pasternak 2021-05-12   997  err_tz_gearbox_arr_alloc:
d8568c67d45446 Vadim Pasternak 2021-05-12   998  	mlxsw_env_sensor_map_dest=
roy(thermal->bus_info,
d8568c67d45446 Vadim Pasternak 2021-05-12   999  				     lc->gearbox_senso=
r_map);
d8568c67d45446 Vadim Pasternak 2021-05-12  1000  err_thermal_linecard_env_s=
ensor_map_create:
d8568c67d45446 Vadim Pasternak 2021-05-12  1001  	mlxsw_thermal_modules_fin=
i(thermal, lc);
d8568c67d45446 Vadim Pasternak 2021-05-12  1002  err_thermal_linecard_modul=
es_init:
d8568c67d45446 Vadim Pasternak 2021-05-12  1003  	kfree(lc);
d8568c67d45446 Vadim Pasternak 2021-05-12  1004  	thermal->linecards[slot_i=
ndex - 1] =3D NULL;
d8568c67d45446 Vadim Pasternak 2021-05-12  1005  }
d8568c67d45446 Vadim Pasternak 2021-05-12  1006  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5822653426913988375==--

