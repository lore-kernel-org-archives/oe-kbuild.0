Content-Type: multipart/mixed; boundary="===============6701215285903194875=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/container_of.h:18:15: warning: use of uninitialized value '((struct usb_dmac_desc *)((char *)__mptr + 60))[41297761].node.next' [CWE-457]
Date: Tue, 20 Sep 2022 19:09:27 +0800
Message-ID: <202209201801.eZop3et0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6701215285903194875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/container_of.h:18:15: warning: use of uninitialized value '((struct us=
b_dmac_desc *)((char *)__mptr + 60))[41297761].node.next' [CWE-457] [-Wanal=
yzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out contai=
ner_of() and typeof_member() macros
date:   11 months ago
:::::: branch date: 2 days ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220916 (https://download.01.org/0day-ci/archi=
ve/20220920/202209201801.eZop3et0-lkp(a)intel.com/config)
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
                    from include/linux/delay.h:22,
                    from drivers/dma/sh/usb-dmac.c:12:
   drivers/dma/sh/usb-dmac.c: In function 'usb_dmac_desc_free':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct usb_dmac_desc *)((char *)__mptr + 60))[41297761].node.next' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]
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
   drivers/dma/sh/usb-dmac.c:291:9: note: in expansion of macro 'list_for_e=
ach_entry_safe'
     291 |         list_for_each_entry_safe(desc, _desc, &list, node) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'usb_dmac_desc_free': event 1
       |
       |  286 |         LIST_HEAD(list);
       |      |                   ^~~~
       |      |                   |
       |      |                   (1) region created on stack here
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
       |   24 |         struct list_head name =3D LIST_HEAD_INIT(name)
       |      |                          ^~~~
       |
     'usb_dmac_desc_free': event 2
       |
       |  481 |         if (!list_empty(list)) {
       |      |            ^
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'usb_dmac_desc_free': event 3
       |
       |drivers/dma/sh/usb-dmac.c:289:9:
       |  289 |         list_splice_init(&chan->desc_got, &list);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |
     'usb_dmac_desc_free': event 4
       |
       |include/linux/list.h:481:12:
       |  481 |         if (!list_empty(list)) {
       |      |            ^
       |      |            |
       |      |            (4) following 'false' branch...
       |
     'usb_dmac_desc_free': event 5
       |
       |include/linux/container_of.h:18:15:
       |   18 |         void *__mptr =3D (void *)(ptr);                    =
               \
       |      |               ^~~~~~
       |      |               |
       |      |               (5) ...to here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
       |  511 |         container_of(ptr, type, member)
       |      |         ^~~~~~~~~~~~
   include/linux/list.h:522:9: note: in expansion of macro 'list_entry'
       |  522 |         list_entry((ptr)->next, type, member)
       |      |         ^~~~~~~~~~
   include/linux/list.h:715:20: note: in expansion of macro 'list_first_ent=
ry'
       |  715 |         for (pos =3D list_first_entry(head, typeof(*pos), m=
ember),        \
       |      |                    ^~~~~~~~~~~~~~~~
   drivers/dma/sh/usb-dmac.c:291:9: note: in expansion of macro 'list_for_e=
ach_entry_safe'
       |  291 |         list_for_each_entry_safe(desc, _desc, &list, node) {
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
       |
     'usb_dmac_desc_free': event 6
       |
       |include/linux/container_of.h:18:15:
       |   18 |         void *__mptr =3D (void *)(ptr);                    =
               \
       |      |               ^~~~~~
       |      |               |
       |      |               (6) use of uninitialized value '((struct usb_=
dmac_desc *)((char *)__mptr + 60))[41297761].node.next' here
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
   drivers/dma/sh/usb-dmac.c:291:9: note: in expansion of macro 'list_for_e=
ach_entry_safe'
       |  291 |         list_for_each_entry_safe(desc, _desc, &list, node) {
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
       |
--
   In file included from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/cgroup.h:12,
                    from kernel/cgroup/cgroup-internal.h:5,
                    from kernel/cgroup/cgroup.c:31:
   kernel/cgroup/cgroup.c: In function 'free_cgrp_cset_links':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct cgrp_cset_link *)((char *)__mptr + 8))[178956970].cset_link.next'=
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
   kernel/cgroup/cgroup.c:1128:9: note: in expansion of macro 'list_for_eac=
h_entry_safe'
    1128 |         list_for_each_entry_safe(link, tmp_link, links_to_free, =
cset_link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'cgroup_init': event 1
       |
       | 5774 | int __init cgroup_init(void)
       |      |            ^~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'cgroup_init'
       |
     'cgroup_init': event 2
       |
       |include/asm-generic/bug.h:65:35:
       |   65 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG=
(); } while (0)
       |      |                                   ^
       |      |                                   |
       |      |                                   (2) following 'false' bra=
nch...
   kernel/cgroup/cgroup.c:5780:9: note: in expansion of macro 'BUG_ON'
       | 5780 |         BUG_ON(cgroup_init_cftypes(NULL, cgroup_base_files)=
);
       |      |         ^~~~~~
       |
     'cgroup_init': event 3
       |
       | 5781 |         BUG_ON(cgroup_init_cftypes(NULL, cgroup1_base_files=
));
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
       |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |      |                                             ^
   kernel/cgroup/cgroup.c:5781:9: note: in expansion of macro 'BUG_ON'
       | 5781 |         BUG_ON(cgroup_init_cftypes(NULL, cgroup1_base_files=
));
       |      |         ^~~~~~
       |
     'cgroup_init': event 4
       |
       |include/asm-generic/bug.h:65:35:
       |   65 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG=
(); } while (0)
       |      |                                   ^
       |      |                                   |
       |      |                                   (4) following 'false' bra=
nch...
   kernel/cgroup/cgroup.c:5781:9: note: in expansion of macro 'BUG_ON'
       | 5781 |         BUG_ON(cgroup_init_cftypes(NULL, cgroup1_base_files=
));
       |      |         ^~~~~~
       |
     'cgroup_init': event 5
       |
       | 5783 |         cgroup_rstat_boot();
       |      |         ^~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (5) ...to here
       |
     'cgroup_init': event 6
       |
       |kernel/cgroup/cgroup-internal.h:165:55:
       |  165 |         for ((ssid) =3D 0; (ssid) < CGROUP_SUBSYS_COUNT && =
               \
       |      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~=
~~~~~~~~~~~~~~
       |      |                                                       |
       |      |                                                       (6) f=
ollowing 'true' branch (when 'i !=3D 5')...
       |  166 |              (((ss) =3D cgroup_subsys[ssid]) || true); (ssi=
d)++)
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    =

   kernel/cgroup/cgroup.c:947:9: note: in expansion of macro 'for_each_subs=
ys'
       |  947 |         for_each_subsys(ss, i)
       |      |         ^~~~~~~~~~~~~~~
       |
     'cgroup_init': event 7
       |
       |  948 |                 key +=3D (unsigned long)css[i];
       |      |                                          ^
       |      |                                          |
       |      |                                          (7) ...to here
       |
     'cgroup_init': event 8
       |
       | 5802 |         BUG_ON(cgroup_setup_root(&cgrp_dfl_root, 0));
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
       |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |      |                                             ^
   kernel/cgroup/cgroup.c:5802:9: note: in expansion of macro 'BUG_ON'
       | 5802 |         BUG_ON(cgroup_setup_root(&cgrp_dfl_root, 0));
       |      |         ^~~~~~
       |
       +--> 'cgroup_setup_root': event 9
              |
              | 1962 | int cgroup_setup_root(struct cgroup_root *root, u16 =
ss_mask)
              |      |     ^~~~~~~~~~~~~~~~~
              |      |     |
              |      |     (9) entry to 'cgroup_setup_root'
              |
            'cgroup_setup_root': event 10
              |
              | 1964 |         LIST_HEAD(tmp_links);

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
--===============6701215285903194875==--

