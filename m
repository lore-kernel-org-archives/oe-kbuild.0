Content-Type: multipart/mixed; boundary="===============4950449366395953098=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/block/null_blk/zoned.c:16:21: warning: shift by negative count ('-1')
Date: Sat, 09 Jul 2022 22:22:03 +0800
Message-ID: <202207092200.0OKuJw14-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4950449366395953098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/block/null_blk/zoned.c:16:21: warning: shift by negative count ('-=
1') [-Wanalyzer-shift-count-negative]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e5524c2a1fc4002a52e16236659e779767617a4f
commit: f334f5668bedf7307f6df1d98b14f55902931926 ilog2: force inlining of _=
_ilog2_u32() and __ilog2_u64()
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220707 (https://download.01.org/0day-ci/archi=
ve/20220709/202207092200.0OKuJw14-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df334f5668bedf7307f6df1d98b14f55902931926
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f334f5668bedf7307f6df1d98b14f55902931926
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   include/linux/log2.h: In function 'null_zone_no':
>> drivers/block/null_blk/zoned.c:16:21: warning: shift by negative count (=
'-1') [-Wanalyzer-shift-count-negative]
      16 |         return sect >> ilog2(dev->zone_size_sects);
     'null_process_zoned_cmd': events 1-4
       |
       |  653 | blk_status_t null_process_zoned_cmd(struct nullb_cmd *cmd, =
enum req_opf op,
       |      |              ^~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (1) entry to 'null_process_zoned_cmd'
       |......
       |  660 |         switch (op) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 10 ... 12:' branch...
       |......
       |  665 |         case REQ_OP_ZONE_RESET:
       |      |         ~~~~  =

       |      |         |
       |      |         (3) ...to here
       |......
       |  670 |                 return null_zone_mgmt(cmd, op, sector);
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (4) calling 'null_zone_mgmt' from 'n=
ull_process_zoned_cmd'
       |
       +--> 'null_zone_mgmt': event 5
              |
              |  600 | static blk_status_t null_zone_mgmt(struct nullb_cmd =
*cmd, enum req_opf op,
              |      |                     ^~~~~~~~~~~~~~
              |      |                     |
              |      |                     (5) entry to 'null_zone_mgmt'
              |
            'null_zone_mgmt': event 6
              |
              |include/linux/compiler.h:58:30:
              |   58 | #define __trace_if_var(cond) (__builtin_constant_p(c=
ond) ? (cond) : __trace_if_value(cond))
              |      |                              ^
              |      |                              |
              |      |                              (6) following 'false' b=
ranch...
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
              |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond ,=
 ## __VA_ARGS__) ) )
              |      |                            ^~~~~~~~~~~~~~
   drivers/block/null_blk/zoned.c:609:9: note: in expansion of macro 'if'
              |  609 |         if (op =3D=3D REQ_OP_ZONE_RESET_ALL) {
              |      |         ^~
              |
            'null_zone_mgmt': events 7-8
              |
              |  622 |         zone_no =3D null_zone_no(dev, sector);
              |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (7) ...to here
              |      |                   (8) calling 'null_zone_no' from 'n=
ull_zone_mgmt'
              |
              +--> 'null_zone_no': event 9
                     |
                     |   14 | static inline unsigned int null_zone_no(struc=
t nullb_device *dev, sector_t sect)
                     |      |                            ^~~~~~~~~~~~
                     |      |                            |
                     |      |                            (9) entry to 'null=
_zone_no'
                     |
                   'null_zone_no': event 10
                     |
                     |include/linux/log2.h:160:35:
                     |  157 | ( \
                     |      | ~~~                                =

                     |  158 |         __builtin_constant_p(n) ?       \
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |  159 |         ((n) < 2 ? 0 :                  \
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |  160 |          63 - __builtin_clzll(n)) :     \
                     |      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
                     |      |                                   |
                     |      |                                   (10) follow=
ing 'false' branch...
                     |  161 |         (sizeof(n) <=3D 4) ?              \
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |  162 |         __ilog2_u32(n) :                \
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |  163 |         __ilog2_u64(n)                  \
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |  164 |  )
                     |      |  ~                                 =

   drivers/block/null_blk/zoned.c:16:24: note: in expansion of macro 'ilog2'
                     |   16 |         return sect >> ilog2(dev->zone_size_s=
ects);
                     |      |                        ^~~~~
                     |
                   'null_zone_no': event 11
                     |
                     |include/asm-generic/bitops/fls64.h:21:21:
                     |   21 |         __u32 h =3D x >> 32;
                     |      |                   ~~^~~~~
                     |      |                     |
                     |      |                     (11) ...to here
                     |
                   'null_zone_no': event 12
                     |
                     |include/linux/compiler.h:58:30:
                     |   58 | #define __trace_if_var(cond) (__builtin_const=
ant_p(cond) ? (cond) : __trace_if_value(cond))
                     |      |                              ^
                     |      |                              |
                     |      |                              (12) following '=
false' branch...
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
--
   In file included from include/linux/kernel.h:26,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/blkdev.h:5,
                    from drivers/nvme/host/zns.c:6:
   include/linux/log2.h: In function 'nvme_zns_alloc_report_buffer':
>> drivers/nvme/host/zns.c:132:49: warning: shift by negative count ('-1') =
[-Wanalyzer-shift-count-negative]
     132 |                          get_capacity(ns->disk) >> ilog2(ns->zsz=
e));
   include/linux/minmax.h:32:39: note: in definition of macro '__cmp_once'
      32 |                 typeof(y) unique_y =3D (y);               \
         |                                       ^
   include/linux/minmax.h:104:33: note: in expansion of macro '__careful_cm=
p'
     104 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(=
y), <)
         |                                 ^~~~~~~~~~~~~
   drivers/nvme/host/zns.c:131:20: note: in expansion of macro 'min_t'
     131 |         nr_zones =3D min_t(unsigned int, nr_zones,
         |                    ^~~~~
     'nvme_ns_report_zones': event 1
       |
       |  177 | int nvme_ns_report_zones(struct nvme_ns *ns, sector_t secto=
r,
       |      |     ^~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'nvme_ns_report_zones'
       |
     'nvme_ns_report_zones': event 2
       |
       |include/linux/compiler.h:58:30:
       |   58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? =
(cond) : __trace_if_value(cond))
       |      |                              ^
       |      |                              |
       |      |                              (2) following 'false' branch...
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __V=
A_ARGS__) ) )
       |      |                            ^~~~~~~~~~~~~~
   drivers/nvme/host/zns.c:186:9: note: in expansion of macro 'if'
       |  186 |         if (ns->head->ids.csi !=3D NVME_CSI_ZNS)
       |      |         ^~
       |
     'nvme_ns_report_zones': events 3-4
       |
       |  189 |         report =3D nvme_zns_alloc_report_buffer(ns, nr_zone=
s, &buflen);
       |      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                  |
       |      |                  (3) ...to here
       |      |                  (4) calling 'nvme_zns_alloc_report_buffer'=
 from 'nvme_ns_report_zones'
       |
       +--> 'nvme_zns_alloc_report_buffer': event 5
              |
              |  121 | static void *nvme_zns_alloc_report_buffer(struct nvm=
e_ns *ns,
              |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |              |
              |      |              (5) entry to 'nvme_zns_alloc_report_buf=
fer'
              |
            'nvme_zns_alloc_report_buffer': event 6
              |
              |include/linux/log2.h:160:35:
              |  157 | ( \
              |      | ~~~                                =

              |  158 |         __builtin_constant_p(n) ?       \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  159 |         ((n) < 2 ? 0 :                  \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  160 |          63 - __builtin_clzll(n)) :     \
              |      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
              |      |                                   |
              |      |                                   (6) following 'fal=
se' branch...
              |  161 |         (sizeof(n) <=3D 4) ?              \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  162 |         __ilog2_u32(n) :                \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  163 |         __ilog2_u64(n)                  \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  164 |  )
              |      |  ~                                 =

   include/linux/minmax.h:32:39: note: in definition of macro '__cmp_once'
              |   32 |                 typeof(y) unique_y =3D (y);         =
      \
              |      |                                       ^
   include/linux/minmax.h:104:33: note: in expansion of macro '__careful_cm=
p'
              |  104 | #define min_t(type, x, y)       __careful_cmp((type)=
(x), (type)(y), <)
              |      |                                 ^~~~~~~~~~~~~
   drivers/nvme/host/zns.c:131:20: note: in expansion of macro 'min_t'
              |  131 |         nr_zones =3D min_t(unsigned int, nr_zones,
              |      |                    ^~~~~
   drivers/nvme/host/zns.c:132:52: note: in expansion of macro 'ilog2'
              |  132 |                          get_capacity(ns->disk) >> i=
log2(ns->zsze));
              |      |                                                    ^=
~~~~
              |
            'nvme_zns_alloc_report_buffer': event 7
              |
              |include/asm-generic/bitops/fls64.h:21:21:
              |   21 |         __u32 h =3D x >> 32;
              |      |                   ~~^~~~~
              |      |                     |
              |      |                     (7) ...to here
              |
            'nvme_zns_alloc_report_buffer': event 8
              |
              |include/linux/compiler.h:58:30:
              |   58 | #define __trace_if_var(cond) (__builtin_constant_p(c=
ond) ? (cond) : __trace_if_value(cond))
              |      |                              ^
              |      |                              |
              |      |                              (8) following 'false' b=
ranch...
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
              |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond ,=
 ## __VA_ARGS__) ) )
              |      |                            ^~~~~~~~~~~~~~
   include/asm-generic/bitops/fls64.h:22:9: note: in expansion of macro 'if'
              |   22 |         if (h)
--
   In file included from block/blk-zoned.c:15:
   include/linux/log2.h: In function 'blk_queue_zone_no.part.0':
   include/linux/blkdev.h:522:23: warning: shift by negative count ('-1') [=
-Wanalyzer-shift-count-negative]
     522 |         return sector >> ilog2(q->limits.chunk_sectors);
     'blk_queue_zone_no.part.0': event 1
       |
       |include/linux/log2.h:160:35:
       |  157 | ( \
       |      | ~~~                                =

       |  158 |         __builtin_constant_p(n) ?       \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  159 |         ((n) < 2 ? 0 :                  \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  160 |          63 - __builtin_clzll(n)) :     \
       |      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
       |      |                                   |
       |      |                                   (1) following 'false' bra=
nch...
       |  161 |         (sizeof(n) <=3D 4) ?              \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  162 |         __ilog2_u32(n) :                \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  163 |         __ilog2_u64(n)                  \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  164 |  )
       |      |  ~                                 =

   include/linux/blkdev.h:522:26: note: in expansion of macro 'ilog2'
       |  522 |         return sector >> ilog2(q->limits.chunk_sectors);
       |      |                          ^~~~~
       |
     'blk_queue_zone_no.part.0': events 2-3
       |
       |include/asm-generic/bitops/builtin-fls.h:14:53:
       |   14 |         return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
       |      |                                                     |
       |      |                                                     (2) ...=
to here
       |      |                                                     (3) fol=
lowing 'false' branch...
       |
     'blk_queue_zone_no.part.0': event 4
       |
       |include/linux/log2.h:24:23:
       |   24 |         return fls(n) - 1;
       |      |                ~~~~~~~^~~
       |      |                       |
       |      |                       (4) ...to here
       |
     'blk_queue_zone_no.part.0': event 5
       |
       |include/linux/blkdev.h:522:23:
       |  522 |         return sector >> ilog2(q->limits.chunk_sectors);
       |
   include/linux/log2.h: In function 'blk_revalidate_zone_cb':
>> block/blk-zoned.c:500:61: warning: shift by negative count ('-1') [-Wana=
lyzer-shift-count-negative]
     500 |                 args->nr_zones =3D (capacity + zone->len - 1) >>=
 ilog2(zone->len);
     'blk_revalidate_zone_cb': event 1
       |
       |include/linux/compiler.h:70:46:
       |   69 |         (cond) ?                                        \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |   70 |                 (__if_trace.miss_hit[1]++,1) :          \
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
       |      |                                              |
       |      |                                              (1) following =
'true' branch...
       |   71 |                 (__if_trace.miss_hit[0]++,0);           \
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~  =

   include/linux/compiler.h:58:69: note: in expansion of macro '__trace_if_=
value'
       |   58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? =
(cond) : __trace_if_value(cond))
       |      |                                                            =
         ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __V=
A_ARGS__) ) )
       |      |                            ^~~~~~~~~~~~~~
   block/blk-zoned.c:492:9: note: in expansion of macro 'if'
       |  492 |         if (zone->start =3D=3D 0) {
       |      |         ^~
       |
     'blk_revalidate_zone_cb': event 2
       |
       |  493 |                 if (zone->len =3D=3D 0 || !is_power_of_2(zo=
ne->len)) {
       |      |                     ~~~~^~~~~
       |      |                         |
       |      |                         (2) ...to here
   include/linux/compiler.h:58:52: note: in definition of macro '__trace_if=
_var'
       |   58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? =
(cond) : __trace_if_value(cond))
       |      |                                                    ^~~~
   block/blk-zoned.c:493:17: note: in expansion of macro 'if'
       |  493 |                 if (zone->len =3D=3D 0 || !is_power_of_2(zo=
ne->len)) {
       |      |                 ^~
       |
     'blk_revalidate_zone_cb': event 3
       |
       |include/linux/compiler.h:58:30:
       |   58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? =
(cond) : __trace_if_value(cond))
       |      |                              ^
       |      |                              |
       |      |                              (3) following 'false' branch...
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __V=
A_ARGS__) ) )
       |      |                            ^~~~~~~~~~~~~~
   block/blk-zoned.c:493:17: note: in expansion of macro 'if'
       |  493 |                 if (zone->len =3D=3D 0 || !is_power_of_2(zo=
ne->len)) {
       |      |                 ^~
       |
     'blk_revalidate_zone_cb': event 4
       |
       |  493 |                 if (zone->len =3D=3D 0 || !is_power_of_2(zo=
ne->len)) {
       |      |                                        ^~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |                                        |
       |      |                                        (4) ...to here
   include/linux/compiler.h:69:10: note: in definition of macro '__trace_if=
_value'
       |   69 |         (cond) ?                                        \
       |      |          ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __V=
A_ARGS__) ) )
       |      |                            ^~~~~~~~~~~~~~
   block/blk-zoned.c:493:17: note: in expansion of macro 'if'
       |  493 |                 if (zone->len =3D=3D 0 || !is_power_of_2(zo=
ne->len)) {
       |      |                 ^~
       |
     'blk_revalidate_zone_cb': event 5
       |
       |include/linux/compiler.h:56:44:
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __V=
A_ARGS__) ) )
       |      |                                            ^
       |      |                                            |
       |      |                                            (5) following 't=
rue' branch...
   include/linux/compiler.h:69:10: note: in definition of macro '__trace_if=
_value'
       |   69 |         (cond) ?                                        \
       |      |          ^~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __V=
A_ARGS__) ) )
       |      |                            ^~~~~~~~~~~~~~
   block/blk-zoned.c:493:17: note: in expansion of macro 'if'
       |  493 |                 if (zone->len =3D=3D 0 || !is_power_of_2(zo=
ne->len)) {
       |      |                 ^~
       |
     'blk_revalidate_zone_cb': event 6
       |
       |include/linux/compiler.h:71:37:
       |   71 |                 (__if_trace.miss_hit[0]++,0);           \
       |      |                  ~~~~~~~~~~~~~~~~~~~^~~
       |      |                                     |
       |      |                                     (6) ...to here
   include/linux/compiler.h:58:69: note: in expansion of macro '__trace_if_=
value'
       |   58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? =
(cond) : __trace_if_value(cond))
       |      |                                                            =
         ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_=
var'
       |   56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __V=
A_ARGS__) ) )
       |      |                            ^~~~~~~~~~~~~~
   block/blk-zoned.c:493:17: note: in expansion of macro 'if'
       |  493 |                 if (zone->len =3D=3D 0 || !is_power_of_2(zo=
ne->len)) {
       |      |                 ^~
       |
     'blk_revalidate_zone_cb': event 7

vim +16 drivers/block/null_blk/zoned.c

ca4b2a011948fae drivers/block/null_blk_zoned.c Matias Bj=C3=B8rling 2018-07=
-06  13  =

ca4b2a011948fae drivers/block/null_blk_zoned.c Matias Bj=C3=B8rling 2018-07=
-06  14  static inline unsigned int null_zone_no(struct nullb_device *dev, =
sector_t sect)
ca4b2a011948fae drivers/block/null_blk_zoned.c Matias Bj=C3=B8rling 2018-07=
-06  15  {
ca4b2a011948fae drivers/block/null_blk_zoned.c Matias Bj=C3=B8rling 2018-07=
-06 @16  	return sect >> ilog2(dev->zone_size_sects);
ca4b2a011948fae drivers/block/null_blk_zoned.c Matias Bj=C3=B8rling 2018-07=
-06  17  }
ca4b2a011948fae drivers/block/null_blk_zoned.c Matias Bj=C3=B8rling 2018-07=
-06  18  =


:::::: The code at line 16 was first introduced by commit
:::::: ca4b2a011948fae4e4d31490107db4926385a983 null_blk: add zone support

:::::: TO: Matias Bj=C3=B8rling <matias.bjorling@wdc.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4950449366395953098==--

