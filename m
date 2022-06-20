Content-Type: multipart/mixed; boundary="===============3029568500157634682=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/damon/core.c:71:10: warning: dereference of NULL 't' [CWE-476]
Date: Mon, 20 Jun 2022 21:16:40 +0800
Message-ID: <202206202133.L7rJenny-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3029568500157634682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: mm/damon/=
core.c:71:10: warning: dereference of NULL 't' [CWE-476] [-Wanalyzer-null-d=
ereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: SeongJae Park <sjpark@amazon.de>
CC: Brendan Higgins <brendanhiggins@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 17ccae8bb5c928946f6f3af14626ec458f74e6ad mm/damon: add kunit tests
date:   10 months ago
:::::: branch date: 3 days ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220620/202206202133.L7rJenny-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D17ccae8bb5c928946f6f3af14626ec458f74e6ad
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 17ccae8bb5c928946f6f3af14626ec458f74e6ad
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/mutex.h:15,
                    from include/linux/damon.h:11,
                    from mm/damon/core.c:10:
   mm/damon/core.c: In function 'damon_add_region':
>> include/linux/list.h:100:9: warning: dereference of NULL 't' [CWE-476] [=
-Wanalyzer-null-dereference]
     100 |         __list_add(new, head->prev, head);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'damon_test_merge_two': events 1-2
       |
       |mm/damon/core-test.h:140:13:
       |  140 | static void damon_test_merge_two(struct kunit *test)
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'damon_test_merge_two'
       |......
       |  146 |         t =3D damon_new_target(42);
       |      |             ~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (2) calling 'damon_new_target' from 'damon_test=
_merge_two'
       |
       +--> 'damon_new_target': events 3-4
              |
              |mm/damon/core.c:90:22:
              |   90 | struct damon_target *damon_new_target(unsigned long =
id)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (3) entry to 'damon_new_target'
              |......
              |   95 |         if (!t)
              |      |            ~          =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'damon_new_target': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'damon_test_merge_two': events 6-7
       |
       |mm/damon/core-test.h:146:13:
       |  146 |         t =3D damon_new_target(42);
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (6) return of NULL to 'damon_test_merge_two' fr=
om 'damon_new_target'
       |  147 |         r =3D damon_new_region(0, 100);
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (7) calling 'damon_new_region' from 'damon_test=
_merge_two'
       |
       +--> 'damon_new_region': events 8-10
              |
              |mm/damon/core.c:35:22:
              |   35 | struct damon_region *damon_new_region(unsigned long =
start, unsigned long end)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (8) entry to 'damon_new_region'
              |......
              |   40 |         if (!region)
              |      |            ~          =

              |      |            |
              |      |            (9) following 'false' branch...
              |......
              |   43 |         region->ar.start =3D start;
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (10) ...to here
              |
       <------+
       |
     'damon_test_merge_two': events 11-12
       |
       |mm/damon/core-test.h:147:13:
       |  147 |         r =3D damon_new_region(0, 100);
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (11) returning to 'damon_test_merge_two' from '=
damon_new_region'
       |  148 |         r->nr_accesses =3D 10;
       |  149 |         damon_add_region(r, t);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (12) calling 'damon_add_region' from 'damon_test_me=
rge_two'
       |
       +--> 'damon_add_region': event 13
              |
              |mm/damon/core.c:62:6:
              |   62 | void damon_add_region(struct damon_region *r, struct=
 damon_target *t)
              |      |      ^~~~~~~~~~~~~~~~
              |      |      |
              |      |      (13) entry to 'damon_add_region'
              |
            'damon_add_region': event 14
              |
              |include/linux/list.h:100:9:
              |  100 |         __list_add(new, head->prev, head);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (14) dereference of NULL 't'
              |
   mm/damon/core.c: In function 'damon_destroy_region':
>> mm/damon/core.c:71:10: warning: dereference of NULL 't' [CWE-476] [-Wana=
lyzer-null-dereference]
      71 |         t->nr_regions--;
         |         ~^~~~~~~~~~~~
     'damon_test_merge_regions_of': events 1-2
       |
       |mm/damon/core-test.h:182:13:
       |  182 | static void damon_test_merge_regions_of(struct kunit *test)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'damon_test_merge_regions_of'
       |......
       |  194 |         t =3D damon_new_target(42);
       |      |             ~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (2) calling 'damon_new_target' from 'damon_test=
_merge_regions_of'
       |
       +--> 'damon_new_target': events 3-4
              |
              |mm/damon/core.c:90:22:
              |   90 | struct damon_target *damon_new_target(unsigned long =
id)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (3) entry to 'damon_new_target'
              |......
              |   95 |         if (!t)
              |      |            ~          =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'damon_new_target': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'damon_test_merge_regions_of': event 6
       |
       |mm/damon/core-test.h:194:13:
       |  194 |         t =3D damon_new_target(42);
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (6) return of NULL to 'damon_test_merge_regions=
_of' from 'damon_new_target'
       |
     'damon_test_merge_regions_of': events 7-8
       |
       |  195 |         for (i =3D 0; i < ARRAY_SIZE(sa); i++) {
       |  196 |                 r =3D damon_new_region(sa[i], ea[i]);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (8) ...to here
       |
     'damon_test_merge_regions_of': events 9-10
       |
       |  195 |         for (i =3D 0; i < ARRAY_SIZE(sa); i++) {
       |  196 |                 r =3D damon_new_region(sa[i], ea[i]);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (10) ...to here
       |
     'damon_test_merge_regions_of': events 11-13
       |
       |  195 |         for (i =3D 0; i < ARRAY_SIZE(sa); i++) {
       |......
       |  201 |         damon_merge_regions_of(t, 9, 9999);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (12) ...to here
       |      |         (13) calling 'damon_merge_regions_of' from 'damon_t=
est_merge_regions_of'
       |
       +--> 'damon_merge_regions_of': event 14
              |
              |mm/damon/core.c:477:13:
              |  477 | static void damon_merge_regions_of(struct damon_targ=
et *t, unsigned int thres,
              |      |             ^~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (14) entry to 'damon_merge_regions_of'
              |
            'damon_merge_regions_of': event 15
              |
              |include/linux/list.h:717:14:
              |  717 |              !list_entry_is_head(pos, head, member);=
                    \
              |      |              ^
              |      |              |
              |      |              (15) following 'true' branch...
   include/linux/damon.h:218:9: note: in expansion of macro 'list_for_each_=
entry_safe'
              |  218 |         list_for_each_entry_safe(r, next, &t->region=
s_list, list)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:482:9: note: in expansion of macro 'damon_for_each_regio=
n_safe'
              |  482 |         damon_for_each_region_safe(r, next, t) {
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            'damon_merge_regions_of': events 16-17
              |
              |  483 |                 if (prev && prev->ar.end =3D=3D r->a=
r.start &&
              |      |                    ^
              |      |                    |
              |      |                    (16) ...to here
              |      |                    (17) following 'false' branch (wh=
en 'prev' is NULL)...
              |
            'damon_merge_regions_of': event 18
--
              |   90 | struct damon_target *damon_new_target(unsigned long =
id)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (3) entry to 'damon_new_target'
              |......
              |   95 |         if (!t)
              |      |            ~          =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'damon_new_target': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'damon_test_merge_regions_of': event 6
       |
       |mm/damon/core-test.h:194:13:
       |  194 |         t =3D damon_new_target(42);
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (6) return of NULL to 'damon_test_merge_regions=
_of' from 'damon_new_target'
       |
     'damon_test_merge_regions_of': events 7-8
       |
       |  195 |         for (i =3D 0; i < ARRAY_SIZE(sa); i++) {
       |  196 |                 r =3D damon_new_region(sa[i], ea[i]);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (8) ...to here
       |
     'damon_test_merge_regions_of': events 9-10
       |
       |  195 |         for (i =3D 0; i < ARRAY_SIZE(sa); i++) {
       |  196 |                 r =3D damon_new_region(sa[i], ea[i]);
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (10) ...to here
       |
     'damon_test_merge_regions_of': events 11-13
       |
       |  195 |         for (i =3D 0; i < ARRAY_SIZE(sa); i++) {
       |......
       |  201 |         damon_merge_regions_of(t, 9, 9999);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (12) ...to here
       |      |         (13) calling 'damon_merge_regions_of' from 'damon_t=
est_merge_regions_of'
       |
       +--> 'damon_merge_regions_of': event 14
              |
              |mm/damon/core.c:477:13:
              |  477 | static void damon_merge_regions_of(struct damon_targ=
et *t, unsigned int thres,
              |      |             ^~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (14) entry to 'damon_merge_regions_of'
              |
            'damon_merge_regions_of': event 15
              |
              |include/linux/list.h:717:14:
              |  717 |              !list_entry_is_head(pos, head, member);=
                    \
              |      |              ^
              |      |              |
              |      |              (15) following 'false' branch...
   include/linux/damon.h:218:9: note: in expansion of macro 'list_for_each_=
entry_safe'
              |  218 |         list_for_each_entry_safe(r, next, &t->region=
s_list, list)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:482:9: note: in expansion of macro 'damon_for_each_regio=
n_safe'
              |  482 |         damon_for_each_region_safe(r, next, t) {
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            'damon_merge_regions_of': event 16
              |
              |  490 | }
              |      | ^
              |      | |
              |      | (16) ...to here
              |
       <------+
       |
     'damon_test_merge_regions_of': event 17
       |
       |mm/damon/core-test.h:201:9:
       |  201 |         damon_merge_regions_of(t, 9, 9999);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (17) returning to 'damon_test_merge_regions_of' fro=
m 'damon_merge_regions_of'
       |
     'damon_test_merge_regions_of': event 18
       |
       |mm/damon/core.c:132:17:
       |  132 |         return t->nr_regions;
       |      |                ~^~~~~~~~~~~~
       |      |                 |
       |      |                 (18) dereference of NULL 't'
       |
   In file included from mm/damon/core.c:720:
   mm/damon/core.c: In function 'damon_test_merge_two':
>> mm/damon/core-test.h:148:24: warning: dereference of NULL 'r' [CWE-476] =
[-Wanalyzer-null-dereference]
     148 |         r->nr_accesses =3D 10;
         |         ~~~~~~~~~~~~~~~^~~~
     'damon_test_merge_two': events 1-2
       |
       |  140 | static void damon_test_merge_two(struct kunit *test)
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'damon_test_merge_two'
       |......
       |  146 |         t =3D damon_new_target(42);
       |      |             ~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (2) calling 'damon_new_target' from 'damon_test=
_merge_two'
       |
       +--> 'damon_new_target': events 3-4
              |
              |mm/damon/core.c:90:22:
              |   90 | struct damon_target *damon_new_target(unsigned long =
id)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (3) entry to 'damon_new_target'
              |......
              |   95 |         if (!t)
              |      |            ~          =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'damon_new_target': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'damon_test_merge_two': events 6-7
       |
       |mm/damon/core-test.h:146:13:
       |  146 |         t =3D damon_new_target(42);
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (6) returning to 'damon_test_merge_two' from 'd=
amon_new_target'
       |  147 |         r =3D damon_new_region(0, 100);
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (7) calling 'damon_new_region' from 'damon_test=
_merge_two'
       |
       +--> 'damon_new_region': events 8-9
              |
              |mm/damon/core.c:35:22:
              |   35 | struct damon_region *damon_new_region(unsigned long =
start, unsigned long end)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (8) entry to 'damon_new_region'
              |......
              |   40 |         if (!region)
              |      |            ~          =

              |      |            |
              |      |            (9) following 'true' branch...
              |
            'damon_new_region': event 10
              |
              |cc1:
              | (10): ...to here
              |
       <------+
       |
     'damon_test_merge_two': events 11-12
       |
       |mm/damon/core-test.h:147:13:
       |  147 |         r =3D damon_new_region(0, 100);
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (11) return of NULL to 'damon_test_merge_two' f=
rom 'damon_new_region'
       |  148 |         r->nr_accesses =3D 10;
       |      |         ~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (12) dereference of NULL 'r'
       |
>> mm/damon/core-test.h:151:25: warning: dereference of NULL 'r2' [CWE-476]=
 [-Wanalyzer-null-dereference]
     151 |         r2->nr_accesses =3D 20;
         |         ~~~~~~~~~~~~~~~~^~~~
     'damon_test_merge_two': events 1-2
       |
       |  140 | static void damon_test_merge_two(struct kunit *test)
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'damon_test_merge_two'
       |......
       |  146 |         t =3D damon_new_target(42);
       |      |             ~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (2) calling 'damon_new_target' from 'damon_test=
_merge_two'
       |
       +--> 'damon_new_target': events 3-4
              |
              |mm/damon/core.c:90:22:
              |   90 | struct damon_target *damon_new_target(unsigned long =
id)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (3) entry to 'damon_new_target'
              |......
              |   95 |         if (!t)
              |      |            ~          =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'damon_new_target': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'damon_test_merge_two': events 6-7
       |
       |mm/damon/core-test.h:146:13:
       |  146 |         t =3D damon_new_target(42);
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (6) returning to 'damon_test_merge_two' from 'd=
amon_new_target'
       |  147 |         r =3D damon_new_region(0, 100);
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (7) calling 'damon_new_region' from 'damon_test=
_merge_two'
       |
       +--> 'damon_new_region': events 8-9
              |
              |mm/damon/core.c:35:22:
              |   35 | struct damon_region *damon_new_region(unsigned long =
start, unsigned long end)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (8) entry to 'damon_new_region'
              |......
              |   40 |         if (!region)
              |      |            ~          =

              |      |            |
              |      |            (9) following 'true' branch...
              |
            'damon_new_region': event 10
              |
              |cc1:
              | (10): ...to here
              |
       <------+
       |
     'damon_test_merge_two': events 11-12
       |
       |mm/damon/core-test.h:147:13:
       |  147 |         r =3D damon_new_region(0, 100);
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (11) return of NULL to 'damon_test_merge_two' f=
rom 'damon_new_region'
       |......
       |  150 |         r2 =3D damon_new_region(100, 300);
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (12) calling 'damon_new_region' from 'damon_te=
st_merge_two'
       |
       +--> 'damon_new_region': events 13-14
              |
              |mm/damon/core.c:35:22:
              |   35 | struct damon_region *damon_new_region(unsigned long =
start, unsigned long end)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (13) entry to 'damon_new_region'
              |......
              |   40 |         if (!region)
              |      |            ~          =

              |      |            |
              |      |            (14) following 'true' branch...
              |
            'damon_new_region': event 15
              |
              |cc1:
              | (15): ...to here
              |
       <------+
       |
     'damon_test_merge_two': events 16-17
       |
       |mm/damon/core-test.h:150:14:
       |  150 |         r2 =3D damon_new_region(100, 300);
       |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (16) returning to 'damon_test_merge_two' from =
'damon_new_region'
       |  151 |         r2->nr_accesses =3D 20;
       |      |         ~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (17) dereference of NULL 'r2'
       |
   In file included from mm/damon/core-test.h:15,
                    from mm/damon/core.c:720:
>> include/kunit/test.h:866:22: warning: dereference of NULL 'r' [CWE-476] =
[-Wanalyzer-null-dereference]
     866 |         typeof(left) __left =3D (left);                         =
                 \
         |                      ^~~~~~
   include/kunit/test.h:891:9: note: in expansion of macro 'KUNIT_BASE_BINA=
RY_ASSERTION'
     891 |         KUNIT_BASE_BINARY_ASSERTION(test,                       =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:980:9: note: in expansion of macro 'KUNIT_BASE_EQ_M=
SG_ASSERTION'
     980 |         KUNIT_BASE_EQ_MSG_ASSERTION(test,                       =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:990:9: note: in expansion of macro 'KUNIT_BINARY_EQ=
_MSG_ASSERTION'
     990 |         KUNIT_BINARY_EQ_MSG_ASSERTION(test,                     =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1353:9: note: in expansion of macro 'KUNIT_BINARY_E=
Q_ASSERTION'
    1353 |         KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left,=
 right)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/core-test.h:157:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     157 |         KUNIT_EXPECT_EQ(test, r->nr_accesses, 16u);
         |         ^~~~~~~~~~~~~~~
     'damon_test_merge_two': events 1-2
       |
       |  140 | static void damon_test_merge_two(struct kunit *test)
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'damon_test_merge_two'
       |......
       |  146 |         t =3D damon_new_target(42);
       |      |             ~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (2) calling 'damon_new_target' from 'damon_test=
_merge_two'
       |
       +--> 'damon_new_target': events 3-4
              |
              |mm/damon/core.c:90:22:
              |   90 | struct damon_target *damon_new_target(unsigned long =
id)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (3) entry to 'damon_new_target'
              |......
              |   95 |         if (!t)
              |      |            ~          =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'damon_new_target': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'damon_test_merge_two': events 6-7
       |
       |mm/damon/core-test.h:146:13:
       |  146 |         t =3D damon_new_target(42);
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (6) returning to 'damon_test_merge_two' from 'd=
amon_new_target'
       |  147 |         r =3D damon_new_region(0, 100);
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (7) calling 'damon_new_region' from 'damon_test=
_merge_two'
       |
       +--> 'damon_new_region': events 8-9
              |
              |mm/damon/core.c:35:22:
              |   35 | struct damon_region *damon_new_region(unsigned long =
start, unsigned long end)
              |      |                      ^~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (8) entry to 'damon_new_region'
              |......
              |   40 |         if (!region)
              |      |            ~          =

              |      |            |
              |      |            (9) following 'true' branch...
              |
            'damon_new_region': event 10
              |
              |cc1:
              | (10): ...to here
              |
       <------+
       |
     'damon_test_merge_two': event 11
       |
       |mm/damon/core-test.h:147:13:
       |  147 |         r =3D damon_new_region(0, 100);
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (11) return of NULL to 'damon_test_merge_two' f=
rom 'damon_new_region'
       |
     'damon_test_merge_two': event 12
       |
       |include/kunit/test.h:866:22:
       |  866 |         typeof(left) __left =3D (left);                    =
                      \
       |      |                      ^~~~~~
       |      |                      |
       |      |                      (12) dereference of NULL 'r'
   include/kunit/test.h:891:9: note: in expansion of macro 'KUNIT_BASE_BINA=
RY_ASSERTION'
       |  891 |         KUNIT_BASE_BINARY_ASSERTION(test,                  =
                    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:980:9: note: in expansion of macro 'KUNIT_BASE_EQ_M=
SG_ASSERTION'

vim +/t +71 mm/damon/core.c

f23b8eee1871a6 SeongJae Park 2021-09-07  67  =

b9a6ac4e4ede41 SeongJae Park 2021-09-07  68  static void damon_del_region(s=
truct damon_region *r, struct damon_target *t)
f23b8eee1871a6 SeongJae Park 2021-09-07  69  {
f23b8eee1871a6 SeongJae Park 2021-09-07  70  	list_del(&r->list);
b9a6ac4e4ede41 SeongJae Park 2021-09-07 @71  	t->nr_regions--;
f23b8eee1871a6 SeongJae Park 2021-09-07  72  }
f23b8eee1871a6 SeongJae Park 2021-09-07  73  =


:::::: The code at line 71 was first introduced by commit
:::::: b9a6ac4e4ede4172d165c133398b93e3233b0ba7 mm/damon: adaptively adjust=
 regions

:::::: TO: SeongJae Park <sjpark@amazon.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3029568500157634682==--

