Content-Type: multipart/mixed; boundary="===============4646530660838984581=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:mdev-lifetime 10/14] drivers/s390/cio/vfio_ccw_ops.c:644:2: warning: Call to function 'strcat' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcat'. CWE-119 ...
Date: Sat, 02 Jul 2022 18:15:06 +0800
Message-ID: <202207021823.U71SLNgH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4646530660838984581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/s=
390/cio/vfio_ccw_ops.c:644:2: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git mdev-lifetime
head:   0c45b1d321d30baa12d452ecd9fe3686687f1635
commit: 17da2121f3418759d03109e8efc5f170152df746 [10/14] vfio/mdev: consoli=
date all the device_api sysfs into the core code
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-c005-20220629 (https://download.01.org/0day-ci/arch=
ive/20220702/202207021823.U71SLNgH-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a91191=
43a2d1f4d0d0bc1fe0d819e5351b4e0deb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add hch-misc git://git.infradead.org/users/hch/misc.git
        git fetch --no-tags hch-misc mdev-lifetime
        git checkout 17da2121f3418759d03109e8efc5f170152df746
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/s390/cio/qdio_debug.h:43:3: note: expanded from macro 'DBF_ERROR'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1082:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   DBF_ERROR("rc:%4x", rc);
                   ^
   drivers/s390/cio/qdio_debug.h:43:3: note: expanded from macro 'DBF_ERROR'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1134:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           DBF_EVENT("qactivate:%4x", schid.sch_no);
           ^
   drivers/s390/cio/qdio_debug.h:31:3: note: expanded from macro 'DBF_EVENT'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1134:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           DBF_EVENT("qactivate:%4x", schid.sch_no);
           ^
   drivers/s390/cio/qdio_debug.h:31:3: note: expanded from macro 'DBF_EVENT'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1141:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   DBF_ERROR("%4x NO AQ", schid.sch_no);
                   ^
   drivers/s390/cio/qdio_debug.h:43:3: note: expanded from macro 'DBF_ERROR'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1141:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   DBF_ERROR("%4x NO AQ", schid.sch_no);
                   ^
   drivers/s390/cio/qdio_debug.h:43:3: note: expanded from macro 'DBF_ERROR'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1163:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   DBF_ERROR("%4x act IO ERR", irq_ptr->schid.sch_no);
                   ^
   drivers/s390/cio/qdio_debug.h:43:3: note: expanded from macro 'DBF_ERROR'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1163:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   DBF_ERROR("%4x act IO ERR", irq_ptr->schid.sch_no);
                   ^
   drivers/s390/cio/qdio_debug.h:43:3: note: expanded from macro 'DBF_ERROR'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1164:3: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   DBF_ERROR("rc:%4x", rc);
                   ^
   drivers/s390/cio/qdio_debug.h:43:3: note: expanded from macro 'DBF_ERROR'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1164:3: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
                   DBF_ERROR("rc:%4x", rc);
                   ^
   drivers/s390/cio/qdio_debug.h:43:3: note: expanded from macro 'DBF_ERROR'
                   snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                   ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1233:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           DBF_DEV_EVENT(DBF_INFO, irq_ptr, "addi b:%02x c:%02x", bufnr, co=
unt);
           ^
   drivers/s390/cio/qdio_debug.h:56:4: note: expanded from macro 'DBF_DEV_E=
VENT'
                           snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                           ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1233:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           DBF_DEV_EVENT(DBF_INFO, irq_ptr, "addi b:%02x c:%02x", bufnr, co=
unt);
           ^
   drivers/s390/cio/qdio_debug.h:56:4: note: expanded from macro 'DBF_DEV_E=
VENT'
                           snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                           ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1304:2: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           DBF_DEV_EVENT(DBF_INFO, irq_ptr, "addo b:%02x c:%02x", bufnr, co=
unt);
           ^
   drivers/s390/cio/qdio_debug.h:56:4: note: expanded from macro 'DBF_DEV_E=
VENT'
                           snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                           ^~~~~~~~
   drivers/s390/cio/qdio_main.c:1304:2: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           DBF_DEV_EVENT(DBF_INFO, irq_ptr, "addo b:%02x c:%02x", bufnr, co=
unt);
           ^
   drivers/s390/cio/qdio_debug.h:56:4: note: expanded from macro 'DBF_DEV_E=
VENT'
                           snprintf(debug_buffer, QDIO_DBF_LEN, text); \
                           ^~~~~~~~
   Suppressed 22 warnings (10 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/s390/cio/vfio_ccw_ops.c:76:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "I/O subchannel (Non-QDIO)\n");
                  ^~~~~~~
   drivers/s390/cio/vfio_ccw_ops.c:76:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "I/O subchannel (Non-QDIO)\n");
                  ^~~~~~~
   drivers/s390/cio/vfio_ccw_ops.c:86:9: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", atomic_read(&private->avail));
                  ^~~~~~~
   drivers/s390/cio/vfio_ccw_ops.c:86:9: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", atomic_read(&private->avail));
                  ^~~~~~~
>> drivers/s390/cio/vfio_ccw_ops.c:644:2: warning: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcat(sch->mdev_type.sysfs_name, "io");
           ^~~~~~
   drivers/s390/cio/vfio_ccw_ops.c:644:2: note: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119
           strcat(sch->mdev_type.sysfs_name, "io");
           ^~~~~~
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   Suppressed 21 warnings (9 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/soundwire/bus_type.c:56:9: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, size, "sdw:m%04Xp%04Xv%02Xc%02X\n",
                  ^~~~~~~~
   drivers/soundwire/bus_type.c:56:9: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, size, "sdw:m%04Xp%04Xv%02Xc%02X\n",
                  ^~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/md/bcache/stats.c:67:2: warning: Call to function 'strcat' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           sysfs_hprint(bypassed,  var(sectors_bypassed) << 9);
           ^
   drivers/md/bcache/sysfs.h:81:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   drivers/md/bcache/stats.c:67:2: note: Call to function 'strcat' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcat'. CWE-119
           sysfs_hprint(bypassed,  var(sectors_bypassed) << 9);
           ^
   drivers/md/bcache/sysfs.h:81:3: note: expanded from macro 'sysfs_hprint'
                   strcat(buf, "\n");                                      \
                   ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/md/bcache/bcache.h:955:3: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
                   set_current_state(TASK_INTERRUPTIBLE);
                   ^
   include/linux/sched.h:208:3: note: expanded from macro 'set_current_stat=
e'
                   debug_normal_state_change((state_value));               \
                   ^
   include/linux/sched.h:136:3: note: expanded from macro 'debug_normal_sta=
te_change'
                   current->task_state_change =3D _THIS_IP_;               =
  \
                   ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   drivers/md/bcache/super.c:1017:9: note: Assuming the condition is false
           while (!kthread_should_stop() && !dc->io_disable) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/super.c:1017:32: note: Left side of '&&' is false
           while (!kthread_should_stop() && !dc->io_disable) {
                                         ^
   drivers/md/bcache/super.c:1039:2: note: Calling 'wait_for_kthread_stop'
           wait_for_kthread_stop();
           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/bcache.h:954:9: note: Assuming the condition is true
           while (!kthread_should_stop()) {

vim +644 drivers/s390/cio/vfio_ccw_ops.c

3bf1311f351ef2 Jason Gunthorpe   2021-10-26  641  =

84cd8fc48478b5 Dong Jia Shi      2017-03-17  642  int vfio_ccw_mdev_reg(str=
uct subchannel *sch)
84cd8fc48478b5 Dong Jia Shi      2017-03-17  643  {
17da2121f34187 Jason Gunthorpe   2022-06-13 @644  	strcat(sch->mdev_type.sy=
sfs_name, "io");
10089f2e602cb6 Christoph Hellwig 2022-06-13  645  	sch->mdev_types[0] =3D &=
sch->mdev_type;
d8ef3844a60f41 Christoph Hellwig 2022-06-28  646  	return mdev_register_par=
ent(&sch->parent, &sch->dev,
10089f2e602cb6 Christoph Hellwig 2022-06-13  647  				    &vfio_ccw_mdev_dr=
iver, sch->mdev_types,
10089f2e602cb6 Christoph Hellwig 2022-06-13  648  				    1);
84cd8fc48478b5 Dong Jia Shi      2017-03-17  649  }
84cd8fc48478b5 Dong Jia Shi      2017-03-17  650  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4646530660838984581==--

