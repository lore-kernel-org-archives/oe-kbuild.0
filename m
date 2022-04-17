Content-Type: multipart/mixed; boundary="===============6169476962662618501=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jgunthorpe:iommufd 3/13] drivers/iommu/iommufd/main.c:142:7: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 17 Apr 2022 09:38:46 +0800
Message-ID: <202204170931.vGKRbm7l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6169476962662618501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Yi Liu <yi.l.liu@intel.com>

tree:   https://github.com/jgunthorpe/linux iommufd
head:   fc388f906088fe5f5f2db6a36931e00124f52042
commit: 80866de54d68bbcdb9a65b74f93d4eba596a6f3d [3/13] iommufd: File descr=
iptor, context, kconfig and makefiles
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
417/202204170931.vGKRbm7l-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/80866de54d68bbcdb9a65b=
74f93d4eba596a6f3d
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd
        git checkout 80866de54d68bbcdb9a65b74f93d4eba596a6f3d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/i2c/i2c-core-base.c:1007:2: note: '?' condition is true
           if (ACPI_COMPANION(&client->dev))
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
   drivers/i2c/i2c-core-base.c:1007:2: note: Taking true branch
           if (ACPI_COMPANION(&client->dev))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/i2c/i2c-core-base.c:1008:32: note: Assuming the condition is fal=
se
                   acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev=
));
                                                ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:421:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1008:32: note: '?' condition is false
                   acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev=
));
                                                ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^
   include/acpi/acpi_bus.h:421:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^
   drivers/i2c/i2c-core-base.c:1008:32: note: Passing null pointer value vi=
a 1st parameter 'adev'
                   acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev=
));
                                                ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:418:2: note: expanded from macro 'to_acpi_device=
_node'
           ({                                                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:1008:3: note: Calling 'acpi_device_clear_enu=
merated'
                   acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev=
));
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/acpi.h:704:22: note: Dereference of null pointer
           adev->flags.visited =3D false;
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/char/tpm/eventlog/tpm1.c:276:2: warning: Value stored to 'len' i=
s never read [clang-analyzer-deadcode.DeadStores]
           len +=3D get_event_name(eventname, event, event_entry);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/eventlog/tpm1.c:276:2: note: Value stored to 'len' is n=
ever read
           len +=3D get_event_name(eventname, event, event_entry);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/char/tpm/tpm_tis_core.c:423:2: warning: Value stored to 'rc' is =
never read [clang-analyzer-deadcode.DeadStores]
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/char/tpm/tpm_tis_core.c:423:2: note: Value stored to 'rc' is nev=
er read
           rc =3D tpm_tis_write32(priv, TPM_INT_ENABLE(priv->locality), int=
mask);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/iommu/iommufd/main.c:142:7: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]
           if (!iommufd_object_destroy_user(ucmd->ictx, obj))
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
   drivers/iommu/iommufd/main.c:138:8: note: Calling 'iommufd_get_object'
           obj =3D iommufd_get_object(ucmd->ictx, cmd->id, IOMMUFD_OBJ_ANY);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/main.c:95:6: note: Assuming 'obj' is non-null
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iommu/iommufd/main.c:95:6: note: Left side of '||' is false
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
               ^
   drivers/iommu/iommufd/main.c:95:15: note: 'type' is equal to IOMMUFD_OBJ=
_ANY
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/iommu/iommufd/main.c:95:39: note: Left side of '&&' is false
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
                                                ^
   drivers/iommu/iommufd/main.c:95:2: note: '?' condition is false
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/iommu/iommufd/main.c:95:7: note: 'obj' is non-null
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
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
   drivers/iommu/iommufd/main.c:95:6: note: Left side of '||' is false
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
               ^
   drivers/iommu/iommufd/main.c:95:15: note: 'type' is equal to IOMMUFD_OBJ=
_ANY
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
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
   drivers/iommu/iommufd/main.c:95:39: note: Left side of '&&' is false
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
                                                ^
   drivers/iommu/iommufd/main.c:96:6: note: Assuming the condition is false
               !iommufd_lock_obj(obj))
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
   drivers/iommu/iommufd/main.c:95:2: note: '?' condition is false
           if (!obj || (type !=3D IOMMUFD_OBJ_ANY && obj->type !=3D type) ||
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

vim +142 drivers/iommu/iommufd/main.c

80866de54d68bb Jason Gunthorpe 2021-11-11  132  =

80866de54d68bb Jason Gunthorpe 2021-11-11  133  static int iommufd_destroy(=
struct iommufd_ucmd *ucmd)
80866de54d68bb Jason Gunthorpe 2021-11-11  134  {
80866de54d68bb Jason Gunthorpe 2021-11-11  135  	struct iommu_destroy *cmd =
=3D ucmd->cmd;
80866de54d68bb Jason Gunthorpe 2021-11-11  136  	struct iommufd_object *obj;
80866de54d68bb Jason Gunthorpe 2021-11-11  137  =

80866de54d68bb Jason Gunthorpe 2021-11-11  138  	obj =3D iommufd_get_object=
(ucmd->ictx, cmd->id, IOMMUFD_OBJ_ANY);
80866de54d68bb Jason Gunthorpe 2021-11-11  139  	if (IS_ERR(obj))
80866de54d68bb Jason Gunthorpe 2021-11-11  140  		return PTR_ERR(obj);
80866de54d68bb Jason Gunthorpe 2021-11-11  141  	iommufd_put_object_keep_us=
er(obj);
80866de54d68bb Jason Gunthorpe 2021-11-11 @142  	if (!iommufd_object_destro=
y_user(ucmd->ictx, obj))
80866de54d68bb Jason Gunthorpe 2021-11-11  143  		return -EBUSY;
80866de54d68bb Jason Gunthorpe 2021-11-11  144  	return 0;
80866de54d68bb Jason Gunthorpe 2021-11-11  145  }
80866de54d68bb Jason Gunthorpe 2021-11-11  146  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6169476962662618501==--

