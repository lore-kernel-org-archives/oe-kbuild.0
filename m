Content-Type: multipart/mixed; boundary="===============0968720665077013076=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5855/14285] include/linux/container_of.h:18:15: warning: use of uninitialized value '((struct dlm_reco_node_data *)((char *)__mptr + 8))[268435455].list.next' [CWE-457]
Date: Wed, 03 Aug 2022 22:13:53 +0800
Message-ID: <202208032237.p5bB8NzG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0968720665077013076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/container_of.h:18:15: warning: use of uninitialized value '(=
(struct dlm_reco_node_data *)((char *)__mptr + 8))[268435455].list.next' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   42d670bda02fdba0f3944c92f545984501e5788d
commit: b03fc1173c0c2bb8fad61902a862985cecdc4b1b [5855/14285] bitops: let o=
ptimize out non-atomic bitops on compile-time constants
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220803/202208032237.p5bB8NzG-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db03fc1173c0c2bb8fad61902a862985cecdc4b1b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b03fc1173c0c2bb8fad61902a862985cecdc4b1b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from fs/ocfs2/dlm/dlmrecovery.c:11:
   fs/ocfs2/dlm/dlmrecovery.c: In function 'dlm_destroy_recovery_area':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct dlm_reco_node_data *)((char *)__mptr + 8))[268435455].list.next' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:762:21: note: in expansion of macro 'list_next_entr=
y'
     762 |                 n =3D list_next_entry(pos, member);             =
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
   include/linux/list.h:26:26: note: in definition of macro 'LIST_HEAD'
       |   26 |         struct list_head name =3D LIST_HEAD_INIT(name)
       |      |                          ^~~~
       |
     'dlm_destroy_recovery_area': event 2
       |
       |  490 |         if (!list_empty(list)) {
       |      |            ^
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'dlm_destroy_recovery_area': event 3
       |
       |fs/ocfs2/dlm/dlmrecovery.c:771:9:
       |  771 |         spin_unlock(&dlm_reco_state_lock);
       |      |         ^~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
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
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
       |  520 |         container_of(ptr, type, member)
       |      |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
       |  564 |         list_entry((pos)->member.next, typeof(*(pos)), memb=
er)
       |      |         ^~~~~~~~~~
   include/linux/list.h:762:21: note: in expansion of macro 'list_next_entr=
y'
       |  762 |                 n =3D list_next_entry(pos, member);        =
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
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:762:21: note: in expansion of macro 'list_next_entr=
y'
     762 |                 n =3D list_next_entry(pos, member);             =
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
       |include/asm-generic/bug.h:71:27:
       |   71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG=
(); } while (0)
       |      |                           ^~
       |      |                           |
       |      |                           (3) ...to here
   fs/ocfs2/dlm/dlmrecovery.c:746:17: note: in expansion of macro 'BUG_ON'
       |  746 |                 BUG_ON(num =3D=3D dead_node);
       |      |                 ^~~~~~
       |
     'dlm_init_recovery_area': event 4
       |
       |include/asm-generic/bug.h:71:35:
       |   71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG=
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
       |include/linux/compiler-gcc.h:63:12:
       |   63 |         do {                                    \
       |      |            ^
       |      |            |
       |      |            (5) ...to here
   arch/arm/include/asm/bug.h:54:9: note: in expansion of macro 'unreachabl=
e'
       |   54 |         unreachable();                                     =
     \
       |      |         ^~~~~~~~~~~
   arch/arm/include/asm/bug.h:24:33: note: in expansion of macro '__BUG'
       |   24 | #define _BUG(file, line, value) __BUG(file, line, value)
       |      |                                 ^~~~~
   arch/arm/include/asm/bug.h:23:15: note: in expansion of macro '_BUG'
       |   23 | #define BUG() _BUG(__FILE__, __LINE__, BUG_INSTR_VALUE)
       |      |               ^~~~
   include/asm-generic/bug.h:71:57: note: in expansion of macro 'BUG'
       |   71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG=
(); } while (0)
       |      |                                                         ^~~
   fs/ocfs2/dlm/dlmrecovery.c:746:17: note: in expansion of macro 'BUG_ON'
       |  746 |                 BUG_ON(num =3D=3D dead_node);
       |      |                 ^~~~~~
       |
     'dlm_init_recovery_area': event 6
       |
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
   include/linux/list.h:26:26: note: in definition of macro 'LIST_HEAD'
              |   26 |         struct list_head name =3D LIST_HEAD_INIT(nam=
e)
              |      |                          ^~~~
              |
            'dlm_destroy_recovery_area': event 9
              |
              |  490 |         if (!list_empty(list)) {
              |      |            ^
              |      |            |

vim +18 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  =

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a me=
mber of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the=
 member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the c=
ontainer struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the=
 member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  16   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17  #define container_of(ptr, t=
ype, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08 @18  	void *__mptr =3D (void *)(=
ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  19  	static_assert(__same_type(=
*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  20  		      __same_type(*(ptr),=
 void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  21  		      "pointer type misma=
tch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  22  	((type *)(__mptr - offseto=
f(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  =


:::::: The code at line 18 was first introduced by commit
:::::: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out contain=
er_of() and typeof_member() macros

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0968720665077013076==--

