Content-Type: multipart/mixed; boundary="===============1080931206087131247=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [daniel-thompson:clang-analyzer/initial_review 7/7] drivers/hwmon/lineage-pem.c:207:10: warning: Array access (from variable 'data') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Sat, 07 May 2022 19:39:21 +0800
Message-ID: <202205071925.pCYWAVMs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1080931206087131247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Thompson <daniel.thompson@linaro.org>

tree:   https://git.linaro.org/people/daniel.thompson/linux.git clang-analy=
zer/initial_review
head:   ad6525bf355a301ca52b1dc3639fa340409c79b9
commit: ad6525bf355a301ca52b1dc3639fa340409c79b9 [7/7] [RFC] linux/err.h: R=
efactor IS_ERR_VALUE(x) to improve clang reasoning
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20220505 (https://download.01.org/0day-ci/arc=
hive/20220507/202205071925.pCYWAVMs-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add daniel-thompson https://git.linaro.org/people/daniel=
.thompson/linux.git
        git fetch --no-tags daniel-thompson clang-analyzer/initial_review
        git checkout ad6525bf355a301ca52b1dc3639fa340409c79b9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


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
   kernel/workqueue.c:4010:4: note: Taking true branch
                           if (!ctx->pwq_tbl[node])
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/workqueue.c:4011:5: note: Control jumps to line 4028
                                   goto out_free;
                                   ^
   kernel/workqueue.c:4030:2: note: Calling 'apply_wqattrs_cleanup'
           apply_wqattrs_cleanup(ctx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/workqueue.c:3950:6: note: 'ctx' is non-null
           if (ctx) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   kernel/workqueue.c:3950:2: note: '?' condition is false
           if (ctx) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   kernel/workqueue.c:3950:6: note: 'ctx' is non-null
           if (ctx) {
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
   kernel/workqueue.c:3950:2: note: '?' condition is true
           if (ctx) {
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
   kernel/workqueue.c:3950:2: note: Taking true branch
           if (ctx) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   kernel/workqueue.c:3953:3: note: Loop condition is true.  Entering loop =
body
                   for_each_node(node)
                   ^
   include/linux/nodemask.h:514:32: note: expanded from macro 'for_each_nod=
e'
   #define for_each_node(node)        for_each_node_state(node, N_POSSIBLE)
                                      ^
   include/linux/nodemask.h:484:2: note: expanded from macro 'for_each_node=
_state'
           for ( (node) =3D 0; (node) =3D=3D 0; (node) =3D 1)
           ^
   kernel/workqueue.c:3953:3: note: Loop condition is false. Execution cont=
inues on line 3955
                   for_each_node(node)
                   ^
   include/linux/nodemask.h:514:32: note: expanded from macro 'for_each_nod=
e'
   #define for_each_node(node)        for_each_node_state(node, N_POSSIBLE)
                                      ^
   include/linux/nodemask.h:484:2: note: expanded from macro 'for_each_node=
_state'
           for ( (node) =3D 0; (node) =3D=3D 0; (node) =3D 1)
           ^
   kernel/workqueue.c:3957:3: note: 1st function call argument is an uninit=
ialized value
                   free_workqueue_attrs(ctx->attrs);
                   ^                    ~~~~~~~~~~
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/hwmon/ina238.c:346:2: warning: Value stored to 'regval' is never=
 read [clang-analyzer-deadcode.DeadStores]
           regval =3D clamp_val(val, 0, LONG_MAX);
           ^
   drivers/hwmon/ina238.c:346:2: note: Value stored to 'regval' is never re=
ad
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/hwmon/lineage-pem.c:207:10: warning: Array access (from variable=
 'data') results in a null pointer dereference [clang-analyzer-core.NullDer=
eference]
                   val =3D (data[index] + (data[index+1] << 8)) * 5 / 2;
                          ^
   drivers/hwmon/lineage-pem.c:293:2: note: '?' condition is false
           if (IS_ERR(data))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/hwmon/lineage-pem.c:293:2: note: '?' condition is false
           if (IS_ERR(data))
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
   drivers/hwmon/lineage-pem.c:293:2: note: Taking false branch
           if (IS_ERR(data))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/hwmon/lineage-pem.c:296:23: note: Passing null pointer value via=
 1st parameter 'data'
           value =3D pem_get_data(data->data_string, sizeof(data->data_stri=
ng),
                                ^~~~~~~~~~~~~~~~~
   drivers/hwmon/lineage-pem.c:296:10: note: Calling 'pem_get_data'
           value =3D pem_get_data(data->data_string, sizeof(data->data_stri=
ng),
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/hwmon/lineage-pem.c:205:2: note: Control jumps to 'case 4:'  at =
line 206
           switch (index) {
           ^
   drivers/hwmon/lineage-pem.c:207:10: note: Array access (from variable 'd=
ata') results in a null pointer dereference
                   val =3D (data[index] + (data[index+1] << 8)) * 5 / 2;
                          ^~~~
   drivers/hwmon/lineage-pem.c:210:9: warning: Array access (from variable =
'data') results in a null pointer dereference [clang-analyzer-core.NullDere=
ference]
                   val =3D data[index] * 200;
                         ^
   drivers/hwmon/lineage-pem.c:293:2: note: '?' condition is false
           if (IS_ERR(data))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/hwmon/lineage-pem.c:293:2: note: '?' condition is false
           if (IS_ERR(data))
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
   drivers/hwmon/lineage-pem.c:293:2: note: Taking false branch
           if (IS_ERR(data))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/hwmon/lineage-pem.c:296:23: note: Passing null pointer value via=
 1st parameter 'data'
           value =3D pem_get_data(data->data_string, sizeof(data->data_stri=
ng),
                                ^~~~~~~~~~~~~~~~~
   drivers/hwmon/lineage-pem.c:296:10: note: Calling 'pem_get_data'
           value =3D pem_get_data(data->data_string, sizeof(data->data_stri=
ng),
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/hwmon/lineage-pem.c:205:2: note: Control jumps to 'case 6:'  at =
line 209
           switch (index) {
           ^
   drivers/hwmon/lineage-pem.c:210:9: note: Array access (from variable 'da=
ta') results in a null pointer dereference
                   val =3D data[index] * 200;
                         ^~~~
   drivers/hwmon/lineage-pem.c:213:9: warning: Array access (from variable =
'data') results in a null pointer dereference [clang-analyzer-core.NullDere=
ference]
                   val =3D data[index] * 1000;
                         ^
   drivers/hwmon/lineage-pem.c:293:2: note: '?' condition is false
           if (IS_ERR(data))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/hwmon/lineage-pem.c:293:2: note: '?' condition is false
           if (IS_ERR(data))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (10 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
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
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/of/device.c:59:29: warning: Value stored to 'of_node' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   drivers/of/device.c:59:29: note: Value stored to 'of_node' during its in=
itialization is never read
           struct device_node *node, *of_node =3D dev->of_node;
                                      ^~~~~~~   ~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/of/property.c:920:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:920:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:920:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/of/property.c:926:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:926:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> include/uapi/linux/swab.h:176:9: warning: Dereference of null pointer (l=
oaded from variable 'p') [clang-analyzer-core.NullDereference]
           return __swab16(*p);
                  ^
   include/uapi/linux/swab.h:105:31: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
                                        ^
   drivers/of/property.c:886:35: note: Assuming the condition is true
           const struct device_node *node =3D to_of_node(fwnode);
                                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/property.c:886:35: note: '?' condition is true
           const struct device_node *node =3D to_of_node(fwnode);
                                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:888:6: note: Assuming 'val' is non-null
           if (!val)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/of/property.c:888:2: note: '?' condition is false
           if (!val)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/of/property.c:888:7: note: 'val' is non-null
           if (!val)
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
   drivers/of/property.c:888:2: note: '?' condition is false
           if (!val)
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
   drivers/of/property.c:888:2: note: Taking false branch
           if (!val)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/of/property.c:892:2: note: Control jumps to 'case 2:'  at line 8=
95
           switch (elem_size) {
           ^
   drivers/of/property.c:896:10: note: Calling 'of_property_read_u16_array'
                   return of_property_read_u16_array(node, propname, val, n=
val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/of.h:1237:12: note: Calling 'of_property_read_variable_u16=
_array'
           int ret =3D of_property_read_variable_u16_array(np, propname, ou=
t_values,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/of/property.c:277:2: note: '?' condition is false
           if (IS_ERR(val))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/of/property.c:277:2: note: '?' condition is false
           if (IS_ERR(val))
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
   drivers/of/property.c:277:2: note: Taking false branch
           if (IS_ERR(val))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                                 ^
   net/ipv4/igmp.c:2104:7: note: 'err' is 0
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
   net/ipv4/igmp.c:2104:3: note: '?' condition is false
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
   net/ipv4/igmp.c:2104:3: note: Taking false branch
                   if (err)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv4/igmp.c:2102:14: note: Assuming 'i' is < 'sfcount'
           for (i =3D 0; i < sfcount; i++) {
                       ^~~~~~~~~~~
   net/ipv4/igmp.c:2102:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < sfcount; i++) {
           ^
   net/ipv4/igmp.c:2103:9: note: Calling 'ip_mc_add1_src'
                   err =3D ip_mc_add1_src(pmc, sfmode, &psfsrc[i]);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/igmp.c:1973:2: note: Loop condition is true.  Entering loop body
           for (psf =3D pmc->sources; psf; psf =3D psf->sf_next) {
           ^
   net/ipv4/igmp.c:1974:7: note: Assuming the condition is false
                   if (psf->sf_inaddr =3D=3D *psfsrc)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/ipv4/igmp.c:1974:3: note: '?' condition is false
                   if (psf->sf_inaddr =3D=3D *psfsrc)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/ipv4/igmp.c:1974:3: note: '?' condition is false
                   if (psf->sf_inaddr =3D=3D *psfsrc)
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
   net/ipv4/igmp.c:1974:3: note: Taking false branch
                   if (psf->sf_inaddr =3D=3D *psfsrc)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/ipv4/igmp.c:1973:36: note: Assigned value is garbage or undefined
           for (psf =3D pmc->sources; psf; psf =3D psf->sf_next) {
                                             ^ ~~~~~~~~~~~~
   Suppressed 10 warnings (2 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> net/openvswitch/flow_netlink.c:2366:2: warning: Null pointer passed as 1=
st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(acts->actions, (*sfa)->actions, (*sfa)->actions_len);
           ^
   net/openvswitch/flow_netlink.c:2447:2: note: Loop condition is true.  En=
tering loop body
           nla_for_each_nested(a, attr, rem) {
           ^
   include/net/netlink.h:1932:2: note: expanded from macro 'nla_for_each_ne=
sted'
           nla_for_each_attr(pos, nla_data(nla), nla_len(nla), rem)
           ^
   include/net/netlink.h:1921:2: note: expanded from macro 'nla_for_each_at=
tr'
           for (pos =3D head, rem =3D len; \
           ^
   net/openvswitch/flow_netlink.c:2449:7: note: Assuming 'type' is not equa=
l to 0
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/openvswitch/flow_netlink.c:2449:7: note: Left side of '||' is false
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
                       ^
   net/openvswitch/flow_netlink.c:2449:16: note: Assuming the condition is =
false
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
                                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/openvswitch/flow_netlink.c:2449:7: note: Left side of '||' is false
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
                       ^
   net/openvswitch/flow_netlink.c:2449:3: note: '?' condition is false
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/openvswitch/flow_netlink.c:2449:8: note: 'type' is not equal to 0
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
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
   net/openvswitch/flow_netlink.c:2449:7: note: Left side of '||' is false
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
                       ^
   net/openvswitch/flow_netlink.c:2449:7: note: Left side of '||' is false
   net/openvswitch/flow_netlink.c:2449:3: note: Assuming the condition is f=
alse
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
                   ^
   include/linux/compiler.h:56:44: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   net/openvswitch/flow_netlink.c:2449:3: note: '?' condition is false
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
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
   net/openvswitch/flow_netlink.c:2449:3: note: Taking false branch
                   if (!type || type > OVS_SAMPLE_ATTR_MAX || attrs[type])
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/openvswitch/flow_netlink.c:2447:2: note: Loop condition is false. Ex=
ecution continues on line 2453
           nla_for_each_nested(a, attr, rem) {
           ^
   include/net/netlink.h:1932:2: note: expanded from macro 'nla_for_each_ne=
sted'
           nla_for_each_attr(pos, nla_data(nla), nla_len(nla), rem)
           ^
   include/net/netlink.h:1921:2: note: expanded from macro 'nla_for_each_at=
tr'
           for (pos =3D head, rem =3D len; \
           ^
   net/openvswitch/flow_netlink.c:2453:2: note: Assuming 'rem' is 0

vim +/data +207 drivers/hwmon/lineage-pem.c

502b5a01992090 Guenter Roeck 2010-09-29  200  =

502b5a01992090 Guenter Roeck 2010-09-29  201  static long pem_get_data(u8 *=
data, int len, int index)
502b5a01992090 Guenter Roeck 2010-09-29  202  {
502b5a01992090 Guenter Roeck 2010-09-29  203  	long val;
502b5a01992090 Guenter Roeck 2010-09-29  204  =

502b5a01992090 Guenter Roeck 2010-09-29  205  	switch (index) {
502b5a01992090 Guenter Roeck 2010-09-29  206  	case PEM_DATA_VOUT_LSB:
502b5a01992090 Guenter Roeck 2010-09-29 @207  		val =3D (data[index] + (dat=
a[index+1] << 8)) * 5 / 2;
502b5a01992090 Guenter Roeck 2010-09-29  208  		break;
502b5a01992090 Guenter Roeck 2010-09-29  209  	case PEM_DATA_CURRENT:
502b5a01992090 Guenter Roeck 2010-09-29  210  		val =3D data[index] * 200;
502b5a01992090 Guenter Roeck 2010-09-29  211  		break;
502b5a01992090 Guenter Roeck 2010-09-29  212  	case PEM_DATA_TEMP:
502b5a01992090 Guenter Roeck 2010-09-29  213  		val =3D data[index] * 1000;
502b5a01992090 Guenter Roeck 2010-09-29  214  		break;
502b5a01992090 Guenter Roeck 2010-09-29  215  	case PEM_DATA_TEMP_MAX:
502b5a01992090 Guenter Roeck 2010-09-29  216  		val =3D 97 * 1000;	/* 97 de=
grees C per datasheet */
502b5a01992090 Guenter Roeck 2010-09-29  217  		break;
502b5a01992090 Guenter Roeck 2010-09-29  218  	case PEM_DATA_TEMP_CRIT:
502b5a01992090 Guenter Roeck 2010-09-29  219  		val =3D 107 * 1000;	/* 107 =
degrees C per datasheet */
502b5a01992090 Guenter Roeck 2010-09-29  220  		break;
502b5a01992090 Guenter Roeck 2010-09-29  221  	default:
502b5a01992090 Guenter Roeck 2010-09-29  222  		WARN_ON_ONCE(1);
502b5a01992090 Guenter Roeck 2010-09-29  223  		val =3D 0;
502b5a01992090 Guenter Roeck 2010-09-29  224  	}
502b5a01992090 Guenter Roeck 2010-09-29  225  	return val;
502b5a01992090 Guenter Roeck 2010-09-29  226  }
502b5a01992090 Guenter Roeck 2010-09-29  227  =


:::::: The code@line 207 was first introduced by commit
:::::: 502b5a0199209001b34b623132ea313790acbd5d hwmon: Add support for Line=
age Compact Power Line PEM devices

:::::: TO: Guenter Roeck <guenter.roeck@ericsson.com>
:::::: CC: Guenter Roeck <guenter.roeck@ericsson.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1080931206087131247==--

