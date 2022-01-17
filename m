Content-Type: multipart/mixed; boundary="===============8453960529841373290=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 10626/20368] drivers/media/v4l2-core/v4l2-mc.c:437:23: warning: Value stored to 'entity' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 17 Jan 2022 08:27:15 +0800
Message-ID: <202201170844.U7ATqWyz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8453960529841373290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Li Wei <wei.l.li@intel.com>
CC: "Pan, Kris" <kris.pan@intel.com>
CC: Chen Meng J <meng.j.chen@intel.com>
CC: Meng Wei <wei.meng@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   1941d4b82f36cc6ecc513f3e496ad62726d00514
commit: 91c71f14b406b0fe0f72f7e75e6a85e344b1927a [10626/20368] media: v4l2-=
mc: fix entity use_count issue for dual sensors
:::::: branch date: 6 days ago
:::::: commit date: 7 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
117/202201170844.U7ATqWyz-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c63a31=
75c2947e8c1a2d3bbe16a8586600705c54)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/91c71f14b406b0fe0=
f72f7e75e6a85e344b1927a
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 91c71f14b406b0fe0f72f7e75e6a85e344b1927a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^
   arch/x86/include/asm/bug.h:90:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_end();                                  \
           ^
   include/linux/instrumentation.h:54:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   fs/f2fs/node.c:2532:2: note: Loop condition is false.  Exiting loop
           f2fs_bug_on(sbi, !i);
           ^
   fs/f2fs/f2fs.h:37:4: note: expanded from macro 'f2fs_bug_on'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:121:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:94:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:85:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   fs/f2fs/node.c:2532:2: note: Loop condition is false.  Exiting loop
           f2fs_bug_on(sbi, !i);
           ^
   fs/f2fs/f2fs.h:35:2: note: expanded from macro 'f2fs_bug_on'
           do {                                                            \
           ^
   fs/f2fs/node.c:2534:7: note: Calling 'f2fs_available_free_memory'
           if (!f2fs_available_free_memory(sbi, FREE_NIDS)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c:60:6: note: 'type' is equal to FREE_NIDS
           if (type =3D=3D FREE_NIDS) {
               ^~~~
   fs/f2fs/node.c:60:2: note: Taking true branch
           if (type =3D=3D FREE_NIDS) {
           ^
   fs/f2fs/node.c:63:9: note: Assuming the condition is true
                   res =3D mem_size < ((avail_ram * nm_i->ram_thresh / 100)=
 >> 2);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/f2fs/node.c:97:2: note: Returning the value 1 (loaded from 'res'), wh=
ich participates in a condition later
           return res;
           ^~~~~~~~~~
   fs/f2fs/node.c:2534:7: note: Returning from 'f2fs_available_free_memory'
           if (!f2fs_available_free_memory(sbi, FREE_NIDS)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c:2534:2: note: Taking false branch
           if (!f2fs_available_free_memory(sbi, FREE_NIDS)) {
           ^
   fs/f2fs/node.c:2538:24: note: Passing null pointer value via 2nd paramet=
er 'i'
                   __move_free_nid(sbi, i, PREALLOC_NID, FREE_NID);
                                        ^
   fs/f2fs/node.c:2538:3: note: Calling '__move_free_nid'
                   __move_free_nid(sbi, i, PREALLOC_NID, FREE_NID);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/node.c:2149:32: note: Access to field 'state' results in a deref=
erence of a null pointer (loaded from variable 'i')
           f2fs_bug_on(sbi, org_state !=3D i->state);
                                         ^
   fs/f2fs/f2fs.h:36:16: note: expanded from macro 'f2fs_bug_on'
                   if (unlikely(condition)) {                              \
                                ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 3 warnings (3 in non-user code).
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   4 warnings generated.
   drivers/media/v4l2-core/v4l2-mc.c:176:4: warning: Value stored to 'if_au=
d' is never read [clang-analyzer-deadcode.DeadStores]
                           if_aud =3D tuner;
                           ^        ~~~~~
   drivers/media/v4l2-core/v4l2-mc.c:176:4: note: Value stored to 'if_aud' =
is never read
                           if_aud =3D tuner;
                           ^        ~~~~~
>> drivers/media/v4l2-core/v4l2-mc.c:437:23: warning: Value stored to 'enti=
ty' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct media_entity *entity =3D pad->entity;
                                ^~~~~~   ~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-mc.c:437:23: note: Value stored to 'entity'=
 during its initialization is never read
           struct media_entity *entity =3D pad->entity;
                                ^~~~~~   ~~~~~~~~~~~
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
   drivers/media/cec/core/cec-adap.c:420:3: warning: Use of memory after it=
 is freed [clang-analyzer-unix.Malloc]
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^
   drivers/media/cec/core/cec-adap.c:1664:6: note: Assuming field 'unregist=
ered' is false
           if (adap->devnode.unregistered)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1664:2: note: Taking false branch
           if (adap->devnode.unregistered)
           ^
   drivers/media/cec/core/cec-adap.c:1667:6: note: Assuming 'log_addrs' is =
null
           if (!log_addrs || log_addrs->num_log_addrs =3D=3D 0) {
               ^~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1667:17: note: Left side of '||' is tr=
ue
           if (!log_addrs || log_addrs->num_log_addrs =3D=3D 0) {
                          ^
   drivers/media/cec/core/cec-adap.c:1668:3: note: Calling 'cec_adap_unconf=
igure'
                   cec_adap_unconfigure(adap);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1326:6: note: Assuming field 'needs_hp=
d' is false
           if (!adap->needs_hpd ||
               ^~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1326:23: note: Left side of '||' is tr=
ue
           if (!adap->needs_hpd ||
                                ^
   drivers/media/cec/core/cec-adap.c:1328:3: note: Assuming the condition i=
s true
                   WARN_ON(adap->ops->adap_log_addr(adap, CEC_LOG_ADDR_INVA=
LID));
                   ^
   include/asm-generic/bug.h:119:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1328:3: note: Taking false branch
                   WARN_ON(adap->ops->adap_log_addr(adap, CEC_LOG_ADDR_INVA=
LID));
                   ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/media/cec/core/cec-adap.c:1332:2: note: Calling 'cec_flush'
           cec_flush(adap);
           ^~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:417:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&adap->transmit_queue)) {
           ^
   drivers/media/cec/core/cec-adap.c:418:10: note: Left side of '&&' is fal=
se
                   data =3D list_first_entry(&adap->transmit_queue,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/media/cec/core/cec-adap.c:418:10: note: Taking false branch
                   data =3D list_first_entry(&adap->transmit_queue,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:853:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/media/cec/core/cec-adap.c:418:10: note: Loop condition is false.=
  Exiting loop

vim +/entity +437 drivers/media/v4l2-core/v4l2-mc.c

0d3c81e82da90f Steve Longerbeam 2020-05-01  406  =

76413791a03f8f Sakari Ailus     2016-02-21  407  /* -----------------------=
------------------------------------------------------
76413791a03f8f Sakari Ailus     2016-02-21  408   * Pipeline power manageme=
nt
76413791a03f8f Sakari Ailus     2016-02-21  409   *
76413791a03f8f Sakari Ailus     2016-02-21  410   * Entities must be powere=
d up when part of a pipeline that contains at least
76413791a03f8f Sakari Ailus     2016-02-21  411   * one open video device n=
ode.
76413791a03f8f Sakari Ailus     2016-02-21  412   *
76413791a03f8f Sakari Ailus     2016-02-21  413   * To achieve this use the=
 entity use_count field to track the number of users.
76413791a03f8f Sakari Ailus     2016-02-21  414   * For entities correspond=
ing to video device nodes the use_count field stores
76413791a03f8f Sakari Ailus     2016-02-21  415   * the users count of the =
node. For entities corresponding to subdevs the
76413791a03f8f Sakari Ailus     2016-02-21  416   * use_count field stores =
the total number of users of all video device nodes
76413791a03f8f Sakari Ailus     2016-02-21  417   * in the pipeline.
76413791a03f8f Sakari Ailus     2016-02-21  418   *
8fd390b89cc8ca Ezequiel Garcia  2020-01-24  419   * The v4l2_pipeline_pm_{g=
et, put}() functions must be called in the open() and
76413791a03f8f Sakari Ailus     2016-02-21  420   * close() handlers of vid=
eo device nodes. It increments or decrements the use
76413791a03f8f Sakari Ailus     2016-02-21  421   * count of all subdev ent=
ities in the pipeline.
76413791a03f8f Sakari Ailus     2016-02-21  422   *
76413791a03f8f Sakari Ailus     2016-02-21  423   * To react to link manage=
ment on powered pipelines, the link setup notification
76413791a03f8f Sakari Ailus     2016-02-21  424   * callback updates the us=
e count of all entities in the source and sink sides
76413791a03f8f Sakari Ailus     2016-02-21  425   * of the link.
76413791a03f8f Sakari Ailus     2016-02-21  426   */
76413791a03f8f Sakari Ailus     2016-02-21  427  =

76413791a03f8f Sakari Ailus     2016-02-21  428  /*
76413791a03f8f Sakari Ailus     2016-02-21  429   * pipeline_pm_use_count -=
 Count the number of users of a pipeline
76413791a03f8f Sakari Ailus     2016-02-21  430   * @entity: The entity
76413791a03f8f Sakari Ailus     2016-02-21  431   *
76413791a03f8f Sakari Ailus     2016-02-21  432   * Return the total number=
 of users of all video device nodes in the pipeline.
76413791a03f8f Sakari Ailus     2016-02-21  433   */
91c71f14b406b0 Li Wei           2018-01-17  434  static int pipeline_pm_use=
_count(struct media_pad *pad,
20b852273642f4 Sakari Ailus     2016-11-21  435  	struct media_graph *graph)
76413791a03f8f Sakari Ailus     2016-02-21  436  {
91c71f14b406b0 Li Wei           2018-01-17 @437  	struct media_entity *enti=
ty =3D pad->entity;
76413791a03f8f Sakari Ailus     2016-02-21  438  	int use =3D 0;
76413791a03f8f Sakari Ailus     2016-02-21  439  =

91c71f14b406b0 Li Wei           2018-01-17  440  	media_graph_walk_start(gr=
aph, pad);
76413791a03f8f Sakari Ailus     2016-02-21  441  =

20b852273642f4 Sakari Ailus     2016-11-21  442  	while ((entity =3D media_=
graph_walk_next(graph))) {
45b46879a78567 Laurent Pinchart 2016-02-29  443  		if (is_media_entity_v4l2=
_video_device(entity))
76413791a03f8f Sakari Ailus     2016-02-21  444  			use +=3D entity->use_co=
unt;
76413791a03f8f Sakari Ailus     2016-02-21  445  	}
76413791a03f8f Sakari Ailus     2016-02-21  446  =

76413791a03f8f Sakari Ailus     2016-02-21  447  	return use;
76413791a03f8f Sakari Ailus     2016-02-21  448  }
76413791a03f8f Sakari Ailus     2016-02-21  449  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8453960529841373290==--

