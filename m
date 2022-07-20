Content-Type: multipart/mixed; boundary="===============8742405758080400003=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/container_of.h:18:15: warning: use of uninitialized value '((struct evict_node *)((char *)__mptr + 24))[35791393].link.next' [CWE-457]
Date: Wed, 20 Jul 2022 14:24:51 +0800
Message-ID: <202207201430.iaXn4Lz2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8742405758080400003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/container_of.h:18:15: warning: use of uninitialized value '((struct ev=
ict_node *)((char *)__mptr + 24))[35791393].link.next' [CWE-457] [-Wanalyze=
r-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ca85855bdcae8f84f1512e88b4c75009ea17ea2f
commit: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out contai=
ner_of() and typeof_member() macros
date:   8 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220717 (https://download.01.org/0day-ci/archi=
ve/20220720/202207201430.iaXn4Lz2-lkp(a)intel.com/config)
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
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/selftests/test-drm_mm.c: In function 'misalignment':
   drivers/gpu/drm/selftests/test-drm_mm.c:160:13: warning: use of uninitia=
lized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     160 |         u64 rem;
         |             ^~~
     'igt_color': events 1-6
       |
       | 2032 | static int igt_color(void *ignored)
       |      |            ^~~~~~~~~
       |      |            |
       |      |            (1) entry to 'igt_color'
       |......
       | 2050 |         for (n =3D 1; n <=3D count; n++) {
       |      |                     ~~~~~~~~~~
       |      |                       |
       |      |                       (2) following 'true' branch...
       | 2051 |                 node =3D kzalloc(sizeof(*node), GFP_KERNEL);
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (3) ...to here
       | 2052 |                 if (!node) {
       |      |                    ~
       |      |                    |
       |      |                    (4) following 'false' branch (when 'node=
' is non-NULL)...
       |......
       | 2057 |                 if (!expect_insert(&mm, node,
       |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (5) ...to here
       |      |                      (6) calling 'expect_insert' from 'igt_=
color'
       | 2058 |                                    n, 0, n,
       |      |                                    ~~~~~~~~
       | 2059 |                                    &insert_modes[0])) {
       |      |                                    ~~~~~~~~~~~~~~~~~
       |
       +--> 'expect_insert': events 7-10
              |
              |  526 | static bool expect_insert(struct drm_mm *mm, struct =
drm_mm_node *node,
              |      |             ^~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'expect_insert'
              |......
              |  535 |         if (err) {
              |      |            ~ =

              |      |            |
              |      |            (8) following 'false' branch (when 'err =
=3D=3D 0')...
              |......
              |  541 |         if (!assert_node(node, mm, size, alignment, =
color)) {
              |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
              |      |              |
              |      |              (9) ...to here
              |      |              (10) calling 'assert_node' from 'expect=
_insert'
              |
              +--> 'assert_node': events 11-12
                     |
                     |  169 | static bool assert_node(struct drm_mm_node *n=
ode, struct drm_mm *mm,
                     |      |             ^~~~~~~~~~~
                     |      |             |
                     |      |             (11) entry to 'assert_node'
                     |......
                     |  185 |         if (misalignment(node, alignment)) {
                     |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (12) calling 'misalignment' from =
'assert_node'
                     |
                     +--> 'misalignment': events 13-14
                            |
                            |  158 | static u64 misalignment(struct drm_mm_=
node *node, u64 alignment)
                            |      |            ^~~~~~~~~~~~
                            |      |            |
                            |      |            (13) entry to 'misalignment'
                            |  159 | {
                            |  160 |         u64 rem;
                            |      |             ~~~
                            |      |             |
                            |      |             (14) use of uninitialized =
value '<unknown>' here
                            |
   In file included from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/gpu/drm/selftests/test-drm_mm.c:8:
   drivers/gpu/drm/selftests/test-drm_mm.c: In function 'evict_nodes':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'((struct evict_node *)((char *)__mptr + 24))[35791393].link.next' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]
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
   drivers/gpu/drm/selftests/test-drm_mm.c:1320:9: note: in expansion of ma=
cro 'list_for_each_entry_safe'
    1320 |         list_for_each_entry_safe(e, en, evict_list, link) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
     'igt_color_evict': events 1-6
       |
       | 2258 | static int igt_color_evict(void *ignored)
       |      |            ^~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'igt_color_evict'
       |......
       | 2278 |         if (!nodes)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'nodes' is no=
n-NULL)...
       |......
       | 2281 |         order =3D drm_random_order(total_size, &prng);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       | 2282 |         if (!order)
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'order' is no=
n-NULL)...
       |......
       | 2286 |         drm_mm_init(&mm, 0, 2*total_size - 1);
       |      |                             ~~~~~~~~~~~~
       |      |                              |
       |      |                              (5) ...to here
       | 2287 |         mm.color_adjust =3D separate_adjacent_colors;
       | 2288 |         for (n =3D 0; n < total_size; n++) {
       |      |                     ~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (6) following 'false' branch...
       |
     'igt_color_evict': event 7
       |
       |cc1:
       | (7): ...to here
       |
     'igt_color_evict': event 8
       |
       | 2297 |         for (mode =3D evict_modes; mode->name; mode++) {
       |      |                                  ^~~~
       |      |                                  |
       |      |                                  (8) following 'true' branc=
h...
       |
     'igt_color_evict': event 9
       |
       |cc1:
       | (9): ...to here
       |
     'igt_color_evict': event 10
       |
       | 2298 |                 for (n =3D 1; n <=3D total_size; n <<=3D 1)=
 {
       |      |                             ~~^~~~~~~~~~~~~
       |      |                               |
       |      |                               (10) following 'false' branch=
...
       |
     'igt_color_evict': event 11
       |
       |cc1:
       | (11): ...to here
       |
     'igt_color_evict': event 12
       |
       | 2311 |                 for (n =3D 1; n < total_size; n <<=3D 1) {
       |      |                             ~~^~~~~~~~~~~~
       |      |                               |
       |      |                               (12) following 'false' branch=
...
       |
     'igt_color_evict': event 13
       |
       |cc1:
       | (13): ...to here
       |
     'igt_color_evict': event 14
       |
       |include/linux/prime_numbers.h:36:36:
       |   36 |         for (prime =3D (from); prime <=3D (max); prime =3D =
next_prime_number(prime))
   drivers/gpu/drm/selftests/test-drm_mm.c:2324:17: note: in expansion of m=
acro 'for_each_prime_number_from'
       | 2324 |                 for_each_prime_number_from(n, 1, min(total_=
size, max_prime)) {
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'igt_color_evict': events 15-16
       |
       | 2325 |                         unsigned int nsize =3D (total_size =
- n + 1) / 2;
       |      |                                               ~~~~~~~~~~~^~~
       |      |                                                          |
       |      |                                                          (1=
5) ...to here

vim +18 include/linux/container_of.h

d2a8ebbf8192b84 Andy Shevchenko 2021-11-08   9  =

d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  10  /**
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  11   * container_of - cast a me=
mber of a structure out to the containing structure
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  12   * @ptr:	the pointer to the=
 member.
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  13   * @type:	the type of the c=
ontainer struct this is embedded in.
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  14   * @member:	the name of the=
 member within the struct.
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  15   *
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  16   */
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  17  #define container_of(ptr, t=
ype, member) ({				\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08 @18  	void *__mptr =3D (void *)(=
ptr);					\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  19  	BUILD_BUG_ON_MSG(!__same_t=
ype(*(ptr), ((type *)0)->member) &&	\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  20  			 !__same_type(*(ptr), vo=
id),			\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  21  			 "pointer type mismatch =
in container_of()");	\
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  22  	((type *)(__mptr - offseto=
f(type, member))); })
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  23  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8742405758080400003==--

