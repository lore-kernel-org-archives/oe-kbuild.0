Content-Type: multipart/mixed; boundary="===============4262716691903501904=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/container_of.h:18:15: warning: use of uninitialized value '((struct nilfs_recovery_block *)((char *)__mptr + 8))[134217727].list.next' [CWE-457]
Date: Fri, 09 Sep 2022 13:11:03 +0800
Message-ID: <202209091339.Q96p8anU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4262716691903501904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/container_of.h:18:15: warning: use of uninitialized value '((struct ni=
lfs_recovery_block *)((char *)__mptr + 8))[134217727].list.next' [CWE-457] =
[-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   506357871c18e06565840d71c2ef9f818e19f460
commit: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out contai=
ner_of() and typeof_member() macros
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220904 (https://download.01.org/0day-ci/archi=
ve/20220909/202209091339.Q96p8anU-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd2a8ebbf8192b84b11f1b204c4f7c602df32aeac
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d2a8ebbf8192b84b11f1b204c4f7c602df32aeac
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
              |      |                    |
              |      |                    (31) following 'false' branch...
              |......
              |  623 |                 switch (state) {
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (32) ...to here
              |      |                 (33) following 'case 0:' branch...
              |  624 |                 case RF_INIT_ST:
              |      |                 ~~~~
              |      |                 |
              |      |                 (34) ...to here
              |  625 |                         if (!(flags & NILFS_SS_LOGBG=
N) ||
              |      |                            ~
              |      |                            |
              |      |                            (35) following 'false' br=
anch...
              |......
              |  630 |                 case RF_DSYNC_ST:
              |      |                 ~~~~
              |      |                 |
              |      |                 (36) ...to here
              |  631 |                         if (!(flags & NILFS_SS_SYNDT=
))
              |      |                            ~
              |      |                            |
              |      |                            (37) following 'false' br=
anch...
              |......
              |  634 |                         err =3D nilfs_scan_dsync_log=
(nilfs, pseg_start, sum,
              |      |                               ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
              |      |                               |
              |      |                               (38) ...to here
              |      |                               (39) calling 'nilfs_sc=
an_dsync_log' from 'nilfs_do_roll_forward'
              |  635 |                                                    &=
dsync_blocks);
              |      |                                                    ~=
~~~~~~~~~~~~~
              |
              +--> 'nilfs_scan_dsync_log': events 40-41
                     |
                     |  304 | static int nilfs_scan_dsync_log(struct the_ni=
lfs *nilfs, sector_t start_blocknr,
                     |      |            ^~~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (40) entry to 'nilfs_scan_dsync_lo=
g'
                     |......
                     |  316 |         if (!nfinfo)
                     |      |            ~
                     |      |            |
                     |      |            (41) following 'true' branch (when=
 'nfinfo =3D=3D 0')...
                     |
                   'nilfs_scan_dsync_log': event 42
                     |
                     |cc1:
                     | (42): ...to here
                     |
              <------+
              |
            'nilfs_do_roll_forward': events 43-48
              |
              |  634 |                         err =3D nilfs_scan_dsync_log=
(nilfs, pseg_start, sum,
              |      |                               ^~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
              |      |                               |
              |      |                               (43) returning to 'nil=
fs_do_roll_forward' from 'nilfs_scan_dsync_log'
              |  635 |                                                    &=
dsync_blocks);
              |      |                                                    ~=
~~~~~~~~~~~~~
              |  636 |                         if (unlikely(err))
              |      |                            ~   =

              |      |                            |
              |      |                            (44) following 'false' br=
anch...
              |  637 |                                 goto failed;
              |  638 |                         if (flags & NILFS_SS_LOGEND)=
 {
              |      |                            ~   =

              |      |                            |
              |      |                            (45) ...to here
              |      |                            (46) following 'true' bra=
nch...
              |  639 |                                 err =3D nilfs_recove=
r_dsync_blocks(
              |      |                                       ~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
              |      |                                       |
              |      |                                       (47) ...to here
              |      |                                       (48) calling '=
nilfs_recover_dsync_blocks' from 'nilfs_do_roll_forward'
              |  640 |                                         nilfs, sb, r=
oot, &dsync_blocks,
              |      |                                         ~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
              |  641 |                                         &nsalvaged_b=
locks);
              |      |                                         ~~~~~~~~~~~~=
~~~~~~
              |
              +--> 'nilfs_recover_dsync_blocks': events 49-50
                     |
                     |  491 | static int nilfs_recover_dsync_blocks(struct =
the_nilfs *nilfs,
                     |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (49) entry to 'nilfs_recover_dsync=
_blocks'
                     |......
                     |  500 |         struct page *page;
                     |      |                      ~~~~
                     |      |                      |
                     |      |                      (50) use of uninitialize=
d value '<unknown>' here
                     |
   In file included from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/buffer_head.h:12,
                    from fs/nilfs2/recovery.c:10:
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct nilfs_recovery_block *)((char *)__mptr + 8))[134217727].list.next=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
     716 |                 n =3D list_next_entry(pos, member);             =
          \
         |                     ^~~~~~~~~~~~~~~
   fs/nilfs2/recovery.c:504:9: note: in expansion of macro 'list_for_each_e=
ntry_safe'
     504 |         list_for_each_entry_safe(rb, n, head, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'nilfs_salvage_orphan_logs': events 1-6
       |
       |  729 | int nilfs_salvage_orphan_logs(struct the_nilfs *nilfs,
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'nilfs_salvage_orphan_logs'
       |......
       |  736 |         if (ri->ri_lsegs_start =3D=3D 0 || ri->ri_lsegs_end=
 =3D=3D 0)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  739 |         err =3D nilfs_attach_checkpoint(sb, ri->ri_cno, tru=
e, &root);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |               |
       |      |               (3) ...to here
       |  740 |         if (unlikely(err)) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       |  745 |         err =3D nilfs_do_roll_forward(nilfs, sb, root, ri);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (5) ...to here
       |      |               (6) calling 'nilfs_do_roll_forward' from 'nil=
fs_salvage_orphan_logs'
       |
       +--> 'nilfs_do_roll_forward': event 7
              |
              |  567 | static int nilfs_do_roll_forward(struct the_nilfs *n=
ilfs,
              |      |            ^~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'nilfs_do_roll_forward'
              |
            'nilfs_do_roll_forward': event 8
              |
              |  582 |         LIST_HEAD(dsync_blocks);  /* list of data bl=
ocks to be recovered */
              |      |                   ^~~~~~~~~~~~
              |      |                   |
              |      |                   (8) region created on stack here
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
              |   24 |         struct list_head name =3D LIST_HEAD_INIT(nam=
e)
              |      |                          ^~~~
              |
            'nilfs_do_roll_forward': event 9
              |
              |fs/nilfs2/recovery.c:594:40:
              |  594 |         while (segnum !=3D ri->ri_segnum || pseg_sta=
rt <=3D ri->ri_pseg_start) {
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
              |      |                                        |
              |      |                                        (9) following=
 'true' branch...
              |
            'nilfs_do_roll_forward': events 10-11
              |
              |include/linux/buffer_head.h:290:12:
              |  290 |         if (bh)
              |      |            ^
              |      |            |
              |      |            (10) ...to here
              |      |            (11) following 'false' branch (when 'bh_s=
um' is NULL)...
              |
            'nilfs_do_roll_forward': events 12-13
              |
              |fs/nilfs2/recovery.c:596:26:
              |  596 |                 bh_sum =3D nilfs_read_log_header(nil=
fs, pseg_start, &sum);
              |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (12) ...to here
              |      |                          (13) calling 'nilfs_read_lo=
g_header' from 'nilfs_do_roll_forward'
              |
              +--> 'nilfs_read_log_header': events 14-16
                     |
                     |  181 | nilfs_read_log_header(struct the_nilfs *nilfs=
, sector_t start_blocknr,
                     |      | ^~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (14) entry to 'nilfs_read_log_header'
                     |......
                     |  187 |         if (bh_sum)
                     |      |            ~
                     |      |            |
                     |      |            (15) following 'true' branch...
                     |  188 |                 *sum =3D (struct nilfs_segmen=
t_summary *)bh_sum->b_data;
                     |      |                                              =
          ~~~~~~~~~~~~~~
                     |      |                                              =
                |
                     |      |                                              =
                (16) ...to here
                     |

vim +18 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko 2021-11-08   9  =

d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  11   * container_of - cast a mem=
ber of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  12   * @ptr:	the pointer to the =
member.
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  13   * @type:	the type of the co=
ntainer struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  14   * @member:	the name of the =
member within the struct.
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  15   *
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  16   */
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  17  #define container_of(ptr, ty=
pe, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08 @18  	void *__mptr =3D (void *)(p=
tr);					\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  19  	BUILD_BUG_ON_MSG(!__same_ty=
pe(*(ptr), ((type *)0)->member) &&	\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  20  			 !__same_type(*(ptr), voi=
d),			\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  21  			 "pointer type mismatch i=
n container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  22  	((type *)(__mptr - offsetof=
(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko 2021-11-08  23  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4262716691903501904==--

