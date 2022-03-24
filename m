Content-Type: multipart/mixed; boundary="===============4833448426152994930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [device-mapper-dm:dm-5.19 126/130] drivers/md/dm.c:1471:2: warning: Value stored to 'num_bios' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 25 Mar 2022 00:04:56 +0800
Message-ID: <202203242338.J9k787ls-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4833448426152994930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: dm-devel(a)redhat.com
CC: linux-kernel(a)vger.kernel.org
TO: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux=
-dm.git dm-5.19
head:   d245a9c2bd77a40dab2f3393c4a413820dd6004d
commit: eb4cbc43473c35198e18c9b7b82e7a26fa6e5401 [126/130] dm: optimize is_=
abnormal_io for normal rw IO
:::::: branch date: 20 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
324/202203242338.J9k787ls-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/lin=
ux-dm.git/commit/?id=3Deb4cbc43473c35198e18c9b7b82e7a26fa6e5401
        git remote add device-mapper-dm https://git.kernel.org/pub/scm/linu=
x/kernel/git/device-mapper/linux-dm.git
        git fetch --no-tags device-mapper-dm dm-5.19
        git checkout eb4cbc43473c35198e18c9b7b82e7a26fa6e5401
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/firewire/core.h:206:2: note: '?' condition is true
           if (refcount_dec_and_test(&node->ref_count))
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
   drivers/firewire/core.h:206:2: note: Taking true branch
           if (refcount_dec_and_test(&node->ref_count))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/firewire/core.h:207:3: note: Memory is released
                   kfree(node);
                   ^~~~~~~~~~~
   drivers/firewire/core-topology.c:351:2: note: Returning; memory was rele=
ased
           fw_node_put(node);
           ^~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:340:3: note: Returning; memory was rele=
ased
                   callback(card, node, parent);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firewire/core-topology.c:325:2: note: Use of memory after it is =
freed
           list_for_each_entry(node, &list, link) {
           ^
   include/linux/list.h:640:13: note: expanded from macro 'list_for_each_en=
try'
                pos =3D list_next_entry(pos, member))
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   3 warnings generated.
   drivers/md/dm.c:1423:2: warning: Address of stack memory associated with=
 local variable 'flush_bio' is still referred to by the stack variable 'ci'=
 upon returning to the caller.  This will be a dangling reference [clang-an=
alyzer-core.StackAddressEscape]
           bio_uninit(ci->bio);
           ^
   drivers/md/dm.c:1605:2: note: Assuming the condition is false
           if (bio->bi_opf & REQ_PREFLUSH) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm.c:1605:2: note: '?' condition is false
           if (bio->bi_opf & REQ_PREFLUSH) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm.c:1605:2: note: '?' condition is true
           if (bio->bi_opf & REQ_PREFLUSH) {
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
   drivers/md/dm.c:1605:2: note: Taking true branch
           if (bio->bi_opf & REQ_PREFLUSH) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm.c:1606:3: note: Calling '__send_empty_flush'
                   __send_empty_flush(&ci);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm.c:1420:2: note: Loop condition is false. Execution continu=
es on line 1423
           while ((ti =3D dm_table_get_target(ci->map, target_nr++)))
           ^
   drivers/md/dm.c:1423:2: note: Address of stack memory associated with lo=
cal variable 'flush_bio' is still referred to by the stack variable 'ci' up=
on returning to the caller.  This will be a dangling reference
           bio_uninit(ci->bio);
           ^
>> drivers/md/dm.c:1471:2: warning: Value stored to 'num_bios' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           num_bios =3D 0;
           ^          ~
   drivers/md/dm.c:1471:2: note: Value stored to 'num_bios' is never read
           num_bios =3D 0;
           ^          ~
   drivers/md/dm.c:1718:20: warning: Access to field 'data' results in a de=
reference of a null pointer [clang-analyzer-core.NullDereference]
           bio->bi_private =3D hlist_entry(tmp.first, struct dm_io, node)->=
data;
                             ^
   include/linux/list.h:982:40: note: expanded from macro 'hlist_entry'
   #define hlist_entry(ptr, type, member) container_of(ptr,type,member)
                                          ^
   include/linux/container_of.h:17:41: note: expanded from macro 'container=
_of'
   #define container_of(ptr, type, member) ({                              \
                                           ^
   drivers/md/dm.c:1702:6: note: Assuming the condition is false
           if (!(bio->bi_opf & REQ_DM_POLL_LIST))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm.c:1702:2: note: '?' condition is false
           if (!(bio->bi_opf & REQ_DM_POLL_LIST))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm.c:1702:2: note: '?' condition is false
           if (!(bio->bi_opf & REQ_DM_POLL_LIST))
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
   drivers/md/dm.c:1702:2: note: Taking false branch
           if (!(bio->bi_opf & REQ_DM_POLL_LIST))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm.c:1705:2: note: '?' condition is false
           WARN_ON_ONCE(hlist_empty(head));
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm.c:1705:2: note: '?' condition is true
           WARN_ON_ONCE(hlist_empty(head));
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
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
   drivers/md/dm.c:1705:2: note: Taking true branch
           WARN_ON_ONCE(hlist_empty(head));
           ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm.c:1705:2: note: Loop condition is false.  Exiting loop
           WARN_ON_ONCE(hlist_empty(head));
           ^
   include/asm-generic/bug.h:106:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/x86/include/asm/bug.h:78:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_begin();                                \
           ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   drivers/md/dm.c:1705:2: note: Loop condition is false.  Exiting loop
           WARN_ON_ONCE(hlist_empty(head));

vim +/num_bios +1471 drivers/md/dm.c

568c73a355e0b8 Mike Snitzer 2019-01-18  1462  =

0519c71e8d461a Mike Snitzer 2018-03-26  1463  static bool __process_abnorma=
l_io(struct clone_info *ci, struct dm_target *ti,
0519c71e8d461a Mike Snitzer 2018-03-26  1464  				  int *result)
0519c71e8d461a Mike Snitzer 2018-03-26  1465  {
eb4cbc43473c35 Mike Snitzer 2022-03-22  1466  	unsigned num_bios;
eb4cbc43473c35 Mike Snitzer 2022-03-22  1467  =

eb4cbc43473c35 Mike Snitzer 2022-03-22  1468  	if (!is_abnormal_io(ci->bio))
eb4cbc43473c35 Mike Snitzer 2022-03-22  1469  		return false;
0519c71e8d461a Mike Snitzer 2018-03-26  1470  =

eb4cbc43473c35 Mike Snitzer 2022-03-22 @1471  	num_bios =3D 0;
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1472  	switch (bio_op(ci->bio)) {
9679b5a7ec400f Mike Snitzer 2020-09-15  1473  	case REQ_OP_DISCARD:
9679b5a7ec400f Mike Snitzer 2020-09-15  1474  		num_bios =3D ti->num_discar=
d_bios;
9679b5a7ec400f Mike Snitzer 2020-09-15  1475  		break;
9679b5a7ec400f Mike Snitzer 2020-09-15  1476  	case REQ_OP_SECURE_ERASE:
9679b5a7ec400f Mike Snitzer 2020-09-15  1477  		num_bios =3D ti->num_secure=
_erase_bios;
9679b5a7ec400f Mike Snitzer 2020-09-15  1478  		break;
9679b5a7ec400f Mike Snitzer 2020-09-15  1479  	case REQ_OP_WRITE_SAME:
9679b5a7ec400f Mike Snitzer 2020-09-15  1480  		num_bios =3D ti->num_write_=
same_bios;
9679b5a7ec400f Mike Snitzer 2020-09-15  1481  		break;
9679b5a7ec400f Mike Snitzer 2020-09-15  1482  	case REQ_OP_WRITE_ZEROES:
9679b5a7ec400f Mike Snitzer 2020-09-15  1483  		num_bios =3D ti->num_write_=
zeroes_bios;
9679b5a7ec400f Mike Snitzer 2020-09-15  1484  		break;
9679b5a7ec400f Mike Snitzer 2020-09-15  1485  	default:
0519c71e8d461a Mike Snitzer 2018-03-26  1486  		return false;
9679b5a7ec400f Mike Snitzer 2020-09-15  1487  	}
0519c71e8d461a Mike Snitzer 2018-03-26  1488  =

e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1489  	/*
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1490  	 * Even though the device ad=
vertised support for this type of
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1491  	 * request, that does not me=
an every target supports it, and
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1492  	 * reconfiguration might als=
o have changed that since the
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1493  	 * check was performed.
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1494  	 */
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1495  	if (!num_bios)
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1496  		*result =3D -EOPNOTSUPP;
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1497  	else {
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1498  		__send_changing_extent_only=
(ci, ti, num_bios);
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1499  		*result =3D 0;
e6fc9f62ce6e41 Mike Snitzer 2022-02-17  1500  	}
0519c71e8d461a Mike Snitzer 2018-03-26  1501  	return true;
0519c71e8d461a Mike Snitzer 2018-03-26  1502  }
0519c71e8d461a Mike Snitzer 2018-03-26  1503  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4833448426152994930==--

