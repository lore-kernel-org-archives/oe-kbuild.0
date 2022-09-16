Content-Type: multipart/mixed; boundary="===============4220529419453019112=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/container_of.h:18:15: warning: use of uninitialized value '((struct dlm_reco_node_data *)((char *)__mptr + 8))[268435455].list.next' [CWE-457]
Date: Fri, 16 Sep 2022 19:36:53 +0800
Message-ID: <202209161909.qxkymTkn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4220529419453019112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/container_of.h:18:15: warning: use of uninitialized value '((struct dl=
m_reco_node_data *)((char *)__mptr + 8))[268435455].list.next' [CWE-457] [-=
Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
commit: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out contai=
ner_of() and typeof_member() macros
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220915 (https://download.01.org/0day-ci/archi=
ve/20220916/202209161909.qxkymTkn-lkp(a)intel.com/config)
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
   In file included from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from fs/ocfs2/dlm/dlmrecovery.c:11:
   fs/ocfs2/dlm/dlmrecovery.c: In function 'dlm_destroy_recovery_area':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct dlm_reco_node_data *)((char *)__mptr + 8))[268435455].list.next' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
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
   fs/ocfs2/dlm/dlmrecovery.c:773:9: note: in expansion of macro 'list_for_=
each_entry_safe'
     773 |         list_for_each_entry_safe(ndata, next, &tmplist, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'dlm_destroy_recovery_area': event 1
       |
       |  767 |         LIST_HEAD(tmplist);
       |      |                   ^~~~~~~
       |      |                   |
       |      |                   (1) region created on stack here
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
       |   24 |         struct list_head name =3D LIST_HEAD_INIT(name)
       |      |                          ^~~~
       |
     'dlm_destroy_recovery_area': event 2
       |
       |  481 |         if (!list_empty(list)) {
       |      |            ^
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'dlm_destroy_recovery_area': event 3
       |
       |include/linux/spinlock.h:287:41:
       |  287 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lo=
ck)
       |      |                                         ^~~~~~~~~~~~~~~~~~~=
~~~
       |      |                                         |
       |      |                                         (3) ...to here
   include/linux/spinlock.h:402:9: note: in expansion of macro 'raw_spin_un=
lock'
       |  402 |         raw_spin_unlock(&lock->rlock);
       |      |         ^~~~~~~~~~~~~~~
       |
     'dlm_destroy_recovery_area': event 4
       |
       |include/linux/container_of.h:18:15:
       |   18 |         void *__mptr =3D (void *)(ptr);                    =
               \
       |      |               ^~~~~~
       |      |               |
       |      |               (4) use of uninitialized value '((struct dlm_=
reco_node_data *)((char *)__mptr + 8))[268435455].list.next' here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
       |  511 |         container_of(ptr, type, member)
       |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
       |  555 |         list_entry((pos)->member.next, typeof(*(pos)), memb=
er)
       |      |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
       |  716 |                 n =3D list_next_entry(pos, member);        =
               \
       |      |                     ^~~~~~~~~~~~~~~
   fs/ocfs2/dlm/dlmrecovery.c:773:9: note: in expansion of macro 'list_for_=
each_entry_safe'
       |  773 |         list_for_each_entry_safe(ndata, next, &tmplist, lis=
t) {
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
       |
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct dlm_reco_node_data *)((char *)__mptr + 8))[268435455].list.next' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
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
   fs/ocfs2/dlm/dlmrecovery.c:773:9: note: in expansion of macro 'list_for_=
each_entry_safe'
     773 |         list_for_each_entry_safe(ndata, next, &tmplist, list) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'dlm_init_recovery_area': events 1-2
       |
       |  730 | static int dlm_init_recovery_area(struct dlm_ctxt *dlm, u8 =
dead_node)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'dlm_init_recovery_area'
       |......
       |  743 |                 if (num >=3D O2NM_MAX_NODES) {
       |      |                    ~
       |      |                    |
       |      |                    (2) following 'false' branch (when 'num =
<=3D 254')...
       |
     'dlm_init_recovery_area': event 3
       |
       |include/linux/compiler.h:78:42:
       |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |      |                                          ^~~~~
       |      |                                          |
       |      |                                          (3) ...to here
   include/asm-generic/bug.h:65:36: note: in expansion of macro 'unlikely'
       |   65 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG=
(); } while (0)
       |      |                                    ^~~~~~~~
   fs/ocfs2/dlm/dlmrecovery.c:746:17: note: in expansion of macro 'BUG_ON'
       |  746 |                 BUG_ON(num =3D=3D dead_node);
       |      |                 ^~~~~~
       |
     'dlm_init_recovery_area': event 4
       |
       |include/asm-generic/bug.h:65:35:
       |   65 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG=
(); } while (0)
       |      |                                   ^
       |      |                                   |
       |      |                                   (4) following 'false' bra=
nch...
   fs/ocfs2/dlm/dlmrecovery.c:746:17: note: in expansion of macro 'BUG_ON'
       |  746 |                 BUG_ON(num =3D=3D dead_node);
       |      |                 ^~~~~~
       |
     'dlm_init_recovery_area': event 5
       |
       |include/linux/slab.h:595:16:
       |  595 |         return __kmalloc(size, flags);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (5) ...to here
       |
     'dlm_init_recovery_area': event 6
       |
       |fs/ocfs2/dlm/dlmrecovery.c:750:25:
       |  750 |                         dlm_destroy_recovery_area(dlm);
       |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (6) calling 'dlm_destroy_recovery_a=
rea' from 'dlm_init_recovery_area'
       |
       +--> 'dlm_destroy_recovery_area': event 7
              |
              |  764 | static void dlm_destroy_recovery_area(struct dlm_ctx=
t *dlm)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'dlm_destroy_recovery_area'
              |
            'dlm_destroy_recovery_area': event 8
              |
              |  767 |         LIST_HEAD(tmplist);
              |      |                   ^~~~~~~
              |      |                   |
              |      |                   (8) region created on stack here
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
              |   24 |         struct list_head name =3D LIST_HEAD_INIT(nam=
e)
              |      |                          ^~~~
              |
            'dlm_destroy_recovery_area': event 9
              |
              |  481 |         if (!list_empty(list)) {
              |      |            ^
              |      |            |
              |      |            (9) following 'false' branch...
              |
            'dlm_destroy_recovery_area': event 10
              |
              |include/linux/spinlock.h:287:41:
              |  287 | #define raw_spin_unlock(lock)           _raw_spin_un=
lock(lock)
              |      |                                         ^~~~~~~~~~~~=
~~~~~~~~~~
              |      |                                         |
              |      |                                         (10) ...to h=
ere
   include/linux/spinlock.h:402:9: note: in expansion of macro 'raw_spin_un=
lock'
              |  402 |         raw_spin_unlock(&lock->rlock);

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
--===============4220529419453019112==--

