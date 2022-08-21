Content-Type: multipart/mixed; boundary="===============7154551450065479312=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 1233/2399] include/linux/container_of.h:18:15: warning: use of uninitialized value '((struct page *)__mptr)[119304647].<U1260>.<Ucb48>.lru.next' [CWE-457]
Date: Sun, 21 Aug 2022 10:44:37 +0800
Message-ID: <202208211024.EZN8ye1p-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7154551450065479312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/container_of.h:18:15: warning: use of uninitialized value '((struct pa=
ge *)__mptr)[119304647].<U1260>.<Ucb48>.lru.next' [CWE-457] [-Wanalyzer-use=
-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   d77aed5ba1ddebd8713d61d847de9710c9542036
commit: 070294331b7ee740d41f8f40704693d2ebbf0821 [1233/2399] kernel.h: spli=
t out container_of() and typeof_member() macros
:::::: branch date: 6 days ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220820 (https://download.01.org/0day-ci/archi=
ve/20220821/202208211024.EZN8ye1p-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/070294331b7ee740d=
41f8f40704693d2ebbf0821
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 070294331b7ee740d41f8f40704693d2ebbf0821
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_balloon.c: In function 'tell_host':
   drivers/virtio/virtio_balloon.c:155:22: warning: use of uninitialized va=
lue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     155 |         unsigned int len;
         |                      ^~~
     'virtio_balloon_oom_notify': event 1
       |
       |  853 | static int virtio_balloon_oom_notify(struct notifier_block =
*nb,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'virtio_balloon_oom_notify'
       |
     'virtio_balloon_oom_notify': event 2
       |
       |  860 |         *freed +=3D leak_balloon(vb, VIRTIO_BALLOON_OOM_NR_=
PAGES) /
       |      |                                                            =
     ^
       |      |                                                            =
     |
       |      |                                                            =
     (2) calling 'leak_balloon' from 'virtio_balloon_oom_notify'
       |
       +--> 'leak_balloon': events 3-6
              |
              |  275 | static unsigned leak_balloon(struct virtio_balloon *=
vb, size_t num)
              |      |                 ^~~~~~~~~~~~
              |      |                 |
              |      |                 (3) entry to 'leak_balloon'
              |......
              |  304 |         if (vb->num_pfns !=3D 0)
              |      |            ~     =

              |      |            |
              |      |            (4) following 'true' branch (when 'num_fr=
eed_pages !=3D 0')...
              |  305 |                 tell_host(vb, vb->deflate_vq);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |
              |      |                 (5) ...to here
              |      |                 (6) calling 'tell_host' from 'leak_b=
alloon'
              |
              +--> 'tell_host': events 7-8
                     |
                     |  152 | static void tell_host(struct virtio_balloon *=
vb, struct virtqueue *vq)
                     |      |             ^~~~~~~~~
                     |      |             |
                     |      |             (7) entry to 'tell_host'
                     |......
                     |  155 |         unsigned int len;
                     |      |                      ~~~
                     |      |                      |
                     |      |                      (8) use of uninitialized=
 value '<unknown>' here
                     |
   In file included from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/scatterlist.h:8,
                    from include/linux/virtio.h:7,
                    from drivers/virtio/virtio_balloon.c:9:
   drivers/virtio/virtio_balloon.c: In function 'release_pages_balloon':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct page *)__mptr)[119304647].<U1260>.<Ucb48>.lru.next' [CWE-457] [-W=
analyzer-use-of-uninitialized-value]
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
   drivers/virtio/virtio_balloon.c:266:9: note: in expansion of macro 'list=
_for_each_entry_safe'
     266 |         list_for_each_entry_safe(page, next, pages, lru) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'remove_common': events 1-4
       |
       | 1047 | static void remove_common(struct virtio_balloon *vb)
       |      |             ^~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'remove_common'
       |......
       | 1050 |         while (vb->num_pages)
       |      |                ~~
       |      |                |
       |      |                (2) following 'true' branch...
       | 1051 |                 leak_balloon(vb, vb->num_pages);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |      |                 (4) calling 'leak_balloon' from 'remove_com=
mon'
       |
       +--> 'leak_balloon': event 5
              |
              |  275 | static unsigned leak_balloon(struct virtio_balloon *=
vb, size_t num)
              |      |                 ^~~~~~~~~~~~
              |      |                 |
              |      |                 (5) entry to 'leak_balloon'
              |
            'leak_balloon': event 6
              |
              |  280 |         LIST_HEAD(pages);
              |      |                   ^~~~~
              |      |                   |
              |      |                   (6) region created on stack here
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
              |   24 |         struct list_head name =3D LIST_HEAD_INIT(nam=
e)
              |      |                          ^~~~
              |
            'leak_balloon': events 7-11
              |
              |drivers/virtio/virtio_balloon.c:288:45:
              |  288 |         for (vb->num_pfns =3D 0; vb->num_pfns < num;
              |      |                                ~~~~~~~~~~~~~^~~~~
              |      |                                             |
              |      |                                             (7) foll=
owing 'false' branch...
              |......
              |  298 |         num_freed_pages =3D vb->num_pfns;
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~       =

              |      |                         |
              |      |                         (8) ...to here
              |......
              |  304 |         if (vb->num_pfns !=3D 0)
              |      |            ~                                 =

              |      |            |
              |      |            (9) following 'false' branch (when 'num_f=
reed_pages =3D=3D 0')...
              |  305 |                 tell_host(vb, vb->deflate_vq);
              |  306 |         release_pages_balloon(vb, &pages);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    =

              |      |         |
              |      |         (10) ...to here
              |      |         (11) calling 'release_pages_balloon' from 'l=
eak_balloon'
              |
              +--> 'release_pages_balloon': event 12
                     |
                     |  261 | static void release_pages_balloon(struct virt=
io_balloon *vb,
                     |      |             ^~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (12) entry to 'release_pages_ball=
oon'
                     |
                   'release_pages_balloon': event 13
                     |
                     |include/linux/container_of.h:18:15:
                     |   18 |         void *__mptr =3D (void *)(ptr);      =
                             \
                     |      |               ^~~~~~
                     |      |               |
                     |      |               (13) use of uninitialized value=
 '((struct page *)__mptr)[119304647].<U1260>.<Ucb48>.lru.next' here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
                     |  511 |         container_of(ptr, type, member)
                     |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
                     |  555 |         list_entry((pos)->member.next, typeof=
(*(pos)), member)
                     |      |         ^~~~~~~~~~
   include/linux/list.h:716:21: note: in expansion of macro 'list_next_entr=
y'
                     |  716 |                 n =3D list_next_entry(pos, me=
mber);                       \
                     |      |                     ^~~~~~~~~~~~~~~
   drivers/virtio/virtio_balloon.c:266:9: note: in expansion of macro 'list=
_for_each_entry_safe'
                     |  266 |         list_for_each_entry_safe(page, next, =
pages, lru) {
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
   In file included from include/uapi/linux/virtio_balloon.h:31,

vim +18 include/linux/container_of.h

070294331b7ee74 Andy Shevchenko 2021-11-08   9  =

070294331b7ee74 Andy Shevchenko 2021-11-08  10  /**
070294331b7ee74 Andy Shevchenko 2021-11-08  11   * container_of - cast a me=
mber of a structure out to the containing structure
070294331b7ee74 Andy Shevchenko 2021-11-08  12   * @ptr:	the pointer to the=
 member.
070294331b7ee74 Andy Shevchenko 2021-11-08  13   * @type:	the type of the c=
ontainer struct this is embedded in.
070294331b7ee74 Andy Shevchenko 2021-11-08  14   * @member:	the name of the=
 member within the struct.
070294331b7ee74 Andy Shevchenko 2021-11-08  15   *
070294331b7ee74 Andy Shevchenko 2021-11-08  16   */
070294331b7ee74 Andy Shevchenko 2021-11-08  17  #define container_of(ptr, t=
ype, member) ({				\
070294331b7ee74 Andy Shevchenko 2021-11-08 @18  	void *__mptr =3D (void *)(=
ptr);					\
070294331b7ee74 Andy Shevchenko 2021-11-08  19  	BUILD_BUG_ON_MSG(!__same_t=
ype(*(ptr), ((type *)0)->member) &&	\
070294331b7ee74 Andy Shevchenko 2021-11-08  20  			 !__same_type(*(ptr), vo=
id),			\
070294331b7ee74 Andy Shevchenko 2021-11-08  21  			 "pointer type mismatch =
in container_of()");	\
070294331b7ee74 Andy Shevchenko 2021-11-08  22  	((type *)(__mptr - offseto=
f(type, member))); })
070294331b7ee74 Andy Shevchenko 2021-11-08  23  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7154551450065479312==--

