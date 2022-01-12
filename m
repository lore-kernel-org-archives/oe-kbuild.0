Content-Type: multipart/mixed; boundary="===============6925572591880599349=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/smartpqi/smartpqi_init.c:1160:4: warning: Potential leak of memory pointed to by 'rpl_header' [clang-analyzer-unix.Malloc]
Date: Wed, 12 Jan 2022 08:45:38 +0800
Message-ID: <202201120811.CbLBhV0g-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6925572591880599349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mike McGowen <Mike.McGowen@microchip.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Scott Benesh <scott.benesh@microchip.com>
CC: Scott Teel <scott.teel@microchip.com>
CC: Don Brace <don.brace@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fe8152b38d3a994c4c6fdbc0cd6551d569a5715a
commit: 28ca6d876c5a375094847606046e0bf5d044d9b4 scsi: smartpqi: Add extend=
ed report physical LUNs
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220111 (https://download.01.org/0day-ci/arc=
hive/20220112/202201120811.CbLBhV0g-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D28ca6d876c5a375094847606046e0bf5d044d9b4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 28ca6d876c5a375094847606046e0bf5d044d9b4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   fs/fat/dir.c:1333:2: note: '?' condition is false
           if (free_slots) {
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
   fs/fat/dir.c:1333:2: note: Taking false branch
           if (free_slots) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fat/dir.c:1368:2: note: Assuming 'nr_slots' is 0
           if (nr_slots) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/fat/dir.c:1368:2: note: '?' condition is false
           if (nr_slots) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/fat/dir.c:1368:6: note: 'nr_slots' is 0
           if (nr_slots) {
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
   fs/fat/dir.c:1368:2: note: '?' condition is false
           if (nr_slots) {
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
   fs/fat/dir.c:1368:2: note: Taking false branch
           if (nr_slots) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/fat/dir.c:1396:12: note: Assigned value is garbage or undefined
           sinfo->de =3D de;
                     ^ ~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/scsi/smartpqi/smartpqi_init.c:1160:4: warning: Potential leak of=
 memory pointed to by 'rpl_header' [clang-analyzer-unix.Malloc]
                           dev_err(&ctrl_info->pci_dev->dev,
                           ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
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
   include/linux/printk.h:392:47: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                                 ^
   drivers/scsi/smartpqi/smartpqi_init.c:2329:7: note: Calling 'pqi_get_dev=
ice_lists'
           rc =3D pqi_get_device_lists(ctrl_info, &physdev_list, &logdev_li=
st);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1215:7: note: Calling 'pqi_report_=
phys_luns'
           rc =3D pqi_report_phys_luns(ctrl_info, (void **)physdev_list);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1149:7: note: Calling 'pqi_report_=
phys_logical_luns'
           rc =3D pqi_report_phys_logical_luns(ctrl_info, CISS_REPORT_PHYS,=
 &rpl_list);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1086:6: note: Assuming 'report_lun=
_header' is non-null
           if (!report_lun_header) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1086:2: note: '?' condition is fal=
se
           if (!report_lun_header) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/smartpqi/smartpqi_init.c:1086:7: note: 'report_lun_header' =
is non-null
           if (!report_lun_header) {
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
   drivers/scsi/smartpqi/smartpqi_init.c:1086:2: note: '?' condition is fal=
se
           if (!report_lun_header) {
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
   drivers/scsi/smartpqi/smartpqi_init.c:1086:2: note: Taking false branch
           if (!report_lun_header) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/smartpqi/smartpqi_init.c:1092:2: note: Assuming 'rc' is 0
           if (rc)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1092:2: note: '?' condition is fal=
se
           if (rc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/smartpqi/smartpqi_init.c:1092:6: note: 'rc' is 0
           if (rc)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
--
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/smartpqi/smartpqi_init.c:1156:7: note: 'rpl_response_format=
' is not equal to 4
                   if (rpl_response_format =3D=3D CISS_REPORT_PHYS_FLAG_EXT=
ENDED_FORMAT_4) {
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
   drivers/scsi/smartpqi/smartpqi_init.c:1156:3: note: '?' condition is fal=
se
                   if (rpl_response_format =3D=3D CISS_REPORT_PHYS_FLAG_EXT=
ENDED_FORMAT_4) {
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
   drivers/scsi/smartpqi/smartpqi_init.c:1156:3: note: Taking false branch
                   if (rpl_response_format =3D=3D CISS_REPORT_PHYS_FLAG_EXT=
ENDED_FORMAT_4) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/smartpqi/smartpqi_init.c:1159:14: note: Assuming 'rpl_respo=
nse_format' is not equal to 2
                   } else if (rpl_response_format !=3D CISS_REPORT_PHYS_FLA=
G_EXTENDED_FORMAT_2) {
                              ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1159:10: note: '?' condition is fa=
lse
                   } else if (rpl_response_format !=3D CISS_REPORT_PHYS_FLA=
G_EXTENDED_FORMAT_2) {
                          ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/smartpqi/smartpqi_init.c:1159:14: note: 'rpl_response_forma=
t' is not equal to 2
                   } else if (rpl_response_format !=3D CISS_REPORT_PHYS_FLA=
G_EXTENDED_FORMAT_2) {
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
   drivers/scsi/smartpqi/smartpqi_init.c:1159:10: note: '?' condition is tr=
ue
                   } else if (rpl_response_format !=3D CISS_REPORT_PHYS_FLA=
G_EXTENDED_FORMAT_2) {
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
   drivers/scsi/smartpqi/smartpqi_init.c:1159:10: note: Taking true branch
                   } else if (rpl_response_format !=3D CISS_REPORT_PHYS_FLA=
G_EXTENDED_FORMAT_2) {
                          ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/smartpqi/smartpqi_init.c:1160:4: note: Potential leak of me=
mory pointed to by 'rpl_header'
                           dev_err(&ctrl_info->pci_dev->dev,
                           ^
   include/linux/dev_printk.h:144:2: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##_=
_VA_ARGS__)
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
   include/linux/printk.h:392:47: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                                 ^
>> drivers/scsi/smartpqi/smartpqi_init.c:1176:11: warning: Potential leak o=
f memory pointed to by 'rpl_8byte_wwid_list' [clang-analyzer-unix.Malloc]
                   return -ENOMEM;
                           ^
   include/uapi/asm-generic/errno-base.h:16:17: note: expanded from macro '=
ENOMEM'
   #define ENOMEM          12      /* Out of memory */
                           ^
   drivers/scsi/smartpqi/smartpqi_init.c:2329:7: note: Calling 'pqi_get_dev=
ice_lists'
           rc =3D pqi_get_device_lists(ctrl_info, &physdev_list, &logdev_li=
st);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1215:7: note: Calling 'pqi_report_=
phys_luns'
           rc =3D pqi_report_phys_luns(ctrl_info, (void **)physdev_list);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1149:7: note: Calling 'pqi_report_=
phys_logical_luns'
           rc =3D pqi_report_phys_logical_luns(ctrl_info, CISS_REPORT_PHYS,=
 &rpl_list);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1086:6: note: Assuming 'report_lun=
_header' is non-null
           if (!report_lun_header) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1086:2: note: '?' condition is fal=
se
           if (!report_lun_header) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/smartpqi/smartpqi_init.c:1086:7: note: 'report_lun_header' =
is non-null
           if (!report_lun_header) {
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
   drivers/scsi/smartpqi/smartpqi_init.c:1086:2: note: '?' condition is fal=
se
           if (!report_lun_header) {
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
   drivers/scsi/smartpqi/smartpqi_init.c:1086:2: note: Taking false branch
           if (!report_lun_header) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/scsi/smartpqi/smartpqi_init.c:1092:2: note: Assuming 'rc' is 0
           if (rc)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/scsi/smartpqi/smartpqi_init.c:1092:2: note: '?' condition is fal=
se
           if (rc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/scsi/smartpqi/smartpqi_init.c:1092:6: note: 'rc' is 0
           if (rc)
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
   drivers/scsi/smartpqi/smartpqi_init.c:1092:2: note: '?' condition is fal=
se
           if (rc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +/rpl_header +1160 drivers/scsi/smartpqi/smartpqi_init.c

6c223761eb5482 Kevin Barnett 2016-06-27  1136  =

583891c9e50925 Kevin Barnett 2021-03-11  1137  static inline int pqi_report=
_phys_luns(struct pqi_ctrl_info *ctrl_info, void **buffer)
6c223761eb5482 Kevin Barnett 2016-06-27  1138  {
28ca6d876c5a37 Mike McGowen  2021-09-28  1139  	int rc;
28ca6d876c5a37 Mike McGowen  2021-09-28  1140  	unsigned int i;
28ca6d876c5a37 Mike McGowen  2021-09-28  1141  	u8 rpl_response_format;
28ca6d876c5a37 Mike McGowen  2021-09-28  1142  	u32 num_physicals;
28ca6d876c5a37 Mike McGowen  2021-09-28  1143  	size_t rpl_16byte_wwid_list=
_length;
28ca6d876c5a37 Mike McGowen  2021-09-28  1144  	void *rpl_list;
28ca6d876c5a37 Mike McGowen  2021-09-28  1145  	struct report_lun_header *r=
pl_header;
28ca6d876c5a37 Mike McGowen  2021-09-28  1146  	struct report_phys_lun_8byt=
e_wwid_list *rpl_8byte_wwid_list;
28ca6d876c5a37 Mike McGowen  2021-09-28  1147  	struct report_phys_lun_16by=
te_wwid_list *rpl_16byte_wwid_list;
28ca6d876c5a37 Mike McGowen  2021-09-28  1148  =

28ca6d876c5a37 Mike McGowen  2021-09-28  1149  	rc =3D pqi_report_phys_logi=
cal_luns(ctrl_info, CISS_REPORT_PHYS, &rpl_list);
28ca6d876c5a37 Mike McGowen  2021-09-28  1150  	if (rc)
28ca6d876c5a37 Mike McGowen  2021-09-28  1151  		return rc;
28ca6d876c5a37 Mike McGowen  2021-09-28  1152  =

28ca6d876c5a37 Mike McGowen  2021-09-28  1153  	if (ctrl_info->rpl_extended=
_format_4_5_supported) {
28ca6d876c5a37 Mike McGowen  2021-09-28  1154  		rpl_header =3D rpl_list;
28ca6d876c5a37 Mike McGowen  2021-09-28  1155  		rpl_response_format =3D rp=
l_header->flags & CISS_REPORT_PHYS_FLAG_EXTENDED_FORMAT_MASK;
28ca6d876c5a37 Mike McGowen  2021-09-28  1156  		if (rpl_response_format =
=3D=3D CISS_REPORT_PHYS_FLAG_EXTENDED_FORMAT_4) {
28ca6d876c5a37 Mike McGowen  2021-09-28  1157  			*buffer =3D rpl_list;
28ca6d876c5a37 Mike McGowen  2021-09-28  1158  			return 0;
28ca6d876c5a37 Mike McGowen  2021-09-28  1159  		} else if (rpl_response_fo=
rmat !=3D CISS_REPORT_PHYS_FLAG_EXTENDED_FORMAT_2) {
28ca6d876c5a37 Mike McGowen  2021-09-28 @1160  			dev_err(&ctrl_info->pci_d=
ev->dev,
28ca6d876c5a37 Mike McGowen  2021-09-28  1161  				"RPL returned unsupporte=
d data format %u\n",
28ca6d876c5a37 Mike McGowen  2021-09-28  1162  				rpl_response_format);
28ca6d876c5a37 Mike McGowen  2021-09-28  1163  			return -EINVAL;
28ca6d876c5a37 Mike McGowen  2021-09-28  1164  		} else {
28ca6d876c5a37 Mike McGowen  2021-09-28  1165  			dev_warn(&ctrl_info->pci_=
dev->dev,
28ca6d876c5a37 Mike McGowen  2021-09-28  1166  				"RPL returned extended f=
ormat 2 instead of 4\n");
28ca6d876c5a37 Mike McGowen  2021-09-28  1167  		}
28ca6d876c5a37 Mike McGowen  2021-09-28  1168  	}
28ca6d876c5a37 Mike McGowen  2021-09-28  1169  =

28ca6d876c5a37 Mike McGowen  2021-09-28  1170  	rpl_8byte_wwid_list =3D rpl=
_list;
28ca6d876c5a37 Mike McGowen  2021-09-28  1171  	num_physicals =3D get_unali=
gned_be32(&rpl_8byte_wwid_list->header.list_length) / sizeof(rpl_8byte_wwid=
_list->lun_entries[0]);
28ca6d876c5a37 Mike McGowen  2021-09-28  1172  	rpl_16byte_wwid_list_length=
 =3D sizeof(struct report_lun_header) + (num_physicals * sizeof(struct repo=
rt_phys_lun_16byte_wwid));
28ca6d876c5a37 Mike McGowen  2021-09-28  1173  =

28ca6d876c5a37 Mike McGowen  2021-09-28  1174  	rpl_16byte_wwid_list =3D km=
alloc(rpl_16byte_wwid_list_length, GFP_KERNEL);
28ca6d876c5a37 Mike McGowen  2021-09-28  1175  	if (!rpl_16byte_wwid_list)
28ca6d876c5a37 Mike McGowen  2021-09-28 @1176  		return -ENOMEM;
28ca6d876c5a37 Mike McGowen  2021-09-28  1177  =

28ca6d876c5a37 Mike McGowen  2021-09-28  1178  	put_unaligned_be32(num_phys=
icals * sizeof(struct report_phys_lun_16byte_wwid),
28ca6d876c5a37 Mike McGowen  2021-09-28  1179  		&rpl_16byte_wwid_list->hea=
der.list_length);
28ca6d876c5a37 Mike McGowen  2021-09-28  1180  	rpl_16byte_wwid_list->heade=
r.flags =3D rpl_8byte_wwid_list->header.flags;
28ca6d876c5a37 Mike McGowen  2021-09-28  1181  =

28ca6d876c5a37 Mike McGowen  2021-09-28  1182  	for (i =3D 0; i < num_physi=
cals; i++) {
28ca6d876c5a37 Mike McGowen  2021-09-28  1183  		memcpy(&rpl_16byte_wwid_li=
st->lun_entries[i].lunid, &rpl_8byte_wwid_list->lun_entries[i].lunid, sizeo=
f(rpl_8byte_wwid_list->lun_entries[i].lunid));
28ca6d876c5a37 Mike McGowen  2021-09-28  1184  		memset(&rpl_16byte_wwid_li=
st->lun_entries[i].wwid, 0, 8);
28ca6d876c5a37 Mike McGowen  2021-09-28  1185  		memcpy(&rpl_16byte_wwid_li=
st->lun_entries[i].wwid[8], &rpl_8byte_wwid_list->lun_entries[i].wwid, size=
of(rpl_8byte_wwid_list->lun_entries[i].wwid));
28ca6d876c5a37 Mike McGowen  2021-09-28  1186  		rpl_16byte_wwid_list->lun_=
entries[i].device_type =3D rpl_8byte_wwid_list->lun_entries[i].device_type;
28ca6d876c5a37 Mike McGowen  2021-09-28  1187  		rpl_16byte_wwid_list->lun_=
entries[i].device_flags =3D rpl_8byte_wwid_list->lun_entries[i].device_flag=
s;
28ca6d876c5a37 Mike McGowen  2021-09-28  1188  		rpl_16byte_wwid_list->lun_=
entries[i].lun_count =3D rpl_8byte_wwid_list->lun_entries[i].lun_count;
28ca6d876c5a37 Mike McGowen  2021-09-28  1189  		rpl_16byte_wwid_list->lun_=
entries[i].redundant_paths =3D rpl_8byte_wwid_list->lun_entries[i].redundan=
t_paths;
28ca6d876c5a37 Mike McGowen  2021-09-28  1190  		rpl_16byte_wwid_list->lun_=
entries[i].aio_handle =3D rpl_8byte_wwid_list->lun_entries[i].aio_handle;
28ca6d876c5a37 Mike McGowen  2021-09-28  1191  	}
28ca6d876c5a37 Mike McGowen  2021-09-28  1192  =

28ca6d876c5a37 Mike McGowen  2021-09-28  1193  	kfree(rpl_8byte_wwid_list);
28ca6d876c5a37 Mike McGowen  2021-09-28  1194  	*buffer =3D rpl_16byte_wwid=
_list;
28ca6d876c5a37 Mike McGowen  2021-09-28  1195  =

28ca6d876c5a37 Mike McGowen  2021-09-28  1196  	return 0;
6c223761eb5482 Kevin Barnett 2016-06-27  1197  }
6c223761eb5482 Kevin Barnett 2016-06-27  1198  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6925572591880599349==--

