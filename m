Content-Type: multipart/mixed; boundary="===============0809701210624728465=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/container_of.h:18:15: warning: use of uninitialized value '*input.list.next' [CWE-457]
Date: Mon, 29 Aug 2022 10:41:08 +0800
Message-ID: <202208291011.eaRx0Xwe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0809701210624728465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/container_of.h:18:15: warning: use of uninitialized value '*input.list=
.next' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b90cb1053190353cc30f0fef0ef1f378ccc063c5
commit: d2a8ebbf8192b84b11f1b204c4f7c602df32aeac kernel.h: split out contai=
ner_of() and typeof_member() macros
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220828 (https://download.01.org/0day-ci/archi=
ve/20220829/202208291011.eaRx0Xwe-lkp(a)intel.com/config)
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

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/kernel.h:12,
                    from include/linux/random.h:11,
                    from include/crypto/drbg.h:43,
                    from crypto/drbg.c:100:
   crypto/drbg.c: In function 'drbg_kcapi_hash':
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'*input.list.next' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:630:20: note: in expansion of macro 'list_next_entr=
y'
     630 |              pos =3D list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   crypto/drbg.c:1726:9: note: in expansion of macro 'list_for_each_entry'
    1726 |         list_for_each_entry(input, in, list)
         |         ^~~~~~~~~~~~~~~~~~~
     'drbg_hmac_generate': events 1-2
       |
       |  706 | static int drbg_hmac_generate(struct drbg_state *drbg,
       |      |            ^~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'drbg_hmac_generate'
       |......
       |  713 |         struct drbg_string data;
       |      |                            ~~~~
       |      |                            |
       |      |                            (2) region created on stack here
       |
     'drbg_hmac_generate': events 3-4
       |
       |include/crypto/drbg.h:144:12:
       |  144 |         if (drbg && drbg->core)
       |      |            ^        ~~~~~~~~~~
       |      |            |            |
       |      |            |            (4) ...to here
       |      |            (3) following 'true' branch (when 'drbg' is non-=
NULL)...
       |
     'drbg_hmac_generate': events 5-7
       |
       |crypto/drbg.c:725:20:
       |  725 |         while (len < buflen) {
       |      |                ~~~~^~~~~~~~
       |      |                    |
       |      |                    (5) following 'true' branch...
       |......
       |  728 |                 ret =3D drbg_kcapi_hash(drbg, drbg->V, &dat=
alist);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |                       |
       |      |                       (6) ...to here
       |      |                       (7) calling 'drbg_kcapi_hash' from 'd=
rbg_hmac_generate'
       |
       +--> 'drbg_kcapi_hash': event 8
              |
              | 1719 | static int drbg_kcapi_hash(struct drbg_state *drbg, =
unsigned char *outval,
              |      |            ^~~~~~~~~~~~~~~
              |      |            |
              |      |            (8) entry to 'drbg_kcapi_hash'
              |
            'drbg_kcapi_hash': event 9
              |
              |include/linux/list.h:629:14:
              |  629 |              !list_entry_is_head(pos, head, member);=
                    \
              |      |              ^
              |      |              |
              |      |              (9) following 'true' branch...
   crypto/drbg.c:1726:9: note: in expansion of macro 'list_for_each_entry'
              | 1726 |         list_for_each_entry(input, in, list)
              |      |         ^~~~~~~~~~~~~~~~~~~
              |
            'drbg_kcapi_hash': event 10
              |
              | 1727 |                 crypto_shash_update(&sdesc->shash, i=
nput->buf, input->len);
              |      |                                                    ~=
~~~~^~~~~
              |      |                                                     =
    |
              |      |                                                     =
    (10) ...to here
              |
            'drbg_kcapi_hash': event 11
              |
              |include/linux/container_of.h:18:15:
              |   18 |         void *__mptr =3D (void *)(ptr);             =
                      \
              |      |               ^~~~~~
              |      |               |
              |      |               (11) use of uninitialized value '*inpu=
t.list.next' here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
              |  511 |         container_of(ptr, type, member)
              |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
              |  555 |         list_entry((pos)->member.next, typeof(*(pos)=
), member)
              |      |         ^~~~~~~~~~
   include/linux/list.h:630:20: note: in expansion of macro 'list_next_entr=
y'
              |  630 |              pos =3D list_next_entry(pos, member))
              |      |                    ^~~~~~~~~~~~~~~
   crypto/drbg.c:1726:9: note: in expansion of macro 'list_for_each_entry'
              | 1726 |         list_for_each_entry(input, in, list)
              |      |         ^~~~~~~~~~~~~~~~~~~
              |
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'*input.list.next' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:630:20: note: in expansion of macro 'list_next_entr=
y'
     630 |              pos =3D list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   crypto/drbg.c:1726:9: note: in expansion of macro 'list_for_each_entry'
    1726 |         list_for_each_entry(input, in, list)
         |         ^~~~~~~~~~~~~~~~~~~
     'drbg_hmac_update': events 1-2
       |
       |  654 | static int drbg_hmac_update(struct drbg_state *drbg, struct=
 list_head *seed,
       |      |            ^~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'drbg_hmac_update'
       |......
       |  659 |         struct drbg_string seed1, seed2, vdata;
       |      |                            ~~~~~
       |      |                            |
       |      |                            (2) region created on stack here
       |
     'drbg_hmac_update': events 3-4
       |
       |include/crypto/drbg.h:144:12:
       |  144 |         if (drbg && drbg->core)
       |      |            ^        ~~~~~~~~~~
       |      |            |            |
       |      |            |            (4) ...to here
       |      |            (3) following 'true' branch...
       |
     'drbg_hmac_update': events 5-9
       |
       |crypto/drbg.c:680:23:
       |  680 |         for (i =3D 2; 0 < i; i--) {
       |      |                     ~~^~~
       |      |                       |
       |      |                       (5) following 'true' branch (when 'i =
!=3D 0')...
       |  681 |                 /* first round uses 0x0, second 0x1 */
       |  682 |                 unsigned char prefix =3D DRBG_PREFIX0;
       |      |                               ~~~~~~
       |      |                               |
       |      |                               (6) ...to here
       |  683 |                 if (1 =3D=3D i)
       |      |                    ~   =

       |      |                    |
       |      |                    (7) following 'false' branch (when 'i !=
=3D 1')...
       |......
       |  686 |                 seed2.buf =3D &prefix;
       |      |                 ~~~~~~~~~~~~~~~~~~~
       |      |                           |
       |      |                           (8) ...to here
       |  687 |                 ret =3D drbg_kcapi_hash(drbg, drbg->C, &see=
dlist);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |                       |
       |      |                       (9) calling 'drbg_kcapi_hash' from 'd=
rbg_hmac_update'
       |
       +--> 'drbg_kcapi_hash': event 10
              |
              | 1719 | static int drbg_kcapi_hash(struct drbg_state *drbg, =
unsigned char *outval,
              |      |            ^~~~~~~~~~~~~~~
              |      |            |
              |      |            (10) entry to 'drbg_kcapi_hash'
              |
            'drbg_kcapi_hash': event 11
              |
              |include/linux/list.h:629:14:
              |  629 |              !list_entry_is_head(pos, head, member);=
                    \
              |      |              ^
              |      |              |
              |      |              (11) following 'true' branch...
   crypto/drbg.c:1726:9: note: in expansion of macro 'list_for_each_entry'
              | 1726 |         list_for_each_entry(input, in, list)
              |      |         ^~~~~~~~~~~~~~~~~~~
              |
            'drbg_kcapi_hash': event 12
              |
              | 1727 |                 crypto_shash_update(&sdesc->shash, i=
nput->buf, input->len);
              |      |                                                    ~=
~~~~^~~~~
              |      |                                                     =
    |
              |      |                                                     =
    (12) ...to here
              |
            'drbg_kcapi_hash': event 13
              |
              |include/linux/container_of.h:18:15:
              |   18 |         void *__mptr =3D (void *)(ptr);             =
                      \
              |      |               ^~~~~~
              |      |               |
              |      |               (13) use of uninitialized value '*inpu=
t.list.next' here
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
              |  511 |         container_of(ptr, type, member)
              |      |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
              |  555 |         list_entry((pos)->member.next, typeof(*(pos)=
), member)
              |      |         ^~~~~~~~~~
   include/linux/list.h:630:20: note: in expansion of macro 'list_next_entr=
y'
              |  630 |              pos =3D list_next_entry(pos, member))
              |      |                    ^~~~~~~~~~~~~~~
   crypto/drbg.c:1726:9: note: in expansion of macro 'list_for_each_entry'
              | 1726 |         list_for_each_entry(input, in, list)
              |      |         ^~~~~~~~~~~~~~~~~~~
              |
>> include/linux/container_of.h:18:15: warning: use of uninitialized value =
'*input.list.next' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      18 |         void *__mptr =3D (void *)(ptr);                         =
          \
         |               ^~~~~~
   include/linux/list.h:511:9: note: in expansion of macro 'container_of'
     511 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:9: note: in expansion of macro 'list_entry'
     555 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:630:20: note: in expansion of macro 'list_next_entr=
y'
     630 |              pos =3D list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   crypto/drbg.c:1726:9: note: in expansion of macro 'list_for_each_entry'
    1726 |         list_for_each_entry(input, in, list)
         |         ^~~~~~~~~~~~~~~~~~~
     'drbg_hmac_generate': event 1
       |
       |  706 | static int drbg_hmac_generate(struct drbg_state *drbg,
       |      |            ^~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'drbg_hmac_generate'
       |
     'drbg_hmac_generate': events 2-3
       |
       |include/crypto/drbg.h:144:12:
       |  144 |         if (drbg && drbg->core)
       |      |            ^        ~~~~~~~~~~
       |      |            |            |
       |      |            |            (3) ...to here
       |      |            (2) following 'true' branch (when 'drbg' is non-=
NULL)...
       |
     'drbg_hmac_generate': event 4
       |
       |crypto/drbg.c:743:23:
       |  743 |                 ret =3D drbg_hmac_update(drbg, NULL, 1);
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (4) calling 'drbg_hmac_update' from '=
drbg_hmac_generate'
       |
       +--> 'drbg_hmac_update': events 5-8
              |
              |  654 | static int drbg_hmac_update(struct drbg_state *drbg,=
 struct list_head *seed,
              |      |            ^~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to 'drbg_hmac_update'
              |......
              |  659 |         struct drbg_string seed1, seed2, vdata;
              |      |                            ~~~~~
              |      |                            |
              |      |                            (6) region created on sta=
ck here
              |......
              |  663 |         if (!reseed) {
              |      |            ~
              |      |            |
              |      |            (7) following 'false' branch (when 'resee=
d !=3D 0')...
              |......
              |  669 |         drbg_string_fill(&seed1, drbg->V, drbg_state=
len(drbg));
              |      |                                  ~~~~~~~
              |      |                                      |
              |      |                                      (8) ...to here
              |
            'drbg_hmac_update': events 9-10
              |
              |include/crypto/drbg.h:144:12:
              |  144 |         if (drbg && drbg->core)
              |      |            ^        ~~~~~~~~~~
              |      |            |            |
              |      |            |            (10) ...to here
              |      |            (9) following 'true' branch (when 'drbg' =
is non-NULL)...
              |
            'drbg_hmac_update': events 11-12
              |
              |crypto/drbg.c:675:12:
              |  675 |         if (seed)
              |      |            ^
              |      |            |
              |      |            (11) following 'false' branch (when 'seed=
' is NULL)...
              |......
              |  678 |         drbg_string_fill(&vdata, drbg->V, drbg_state=
len(drbg));
              |      |                                  ~~~~~~~
              |      |                                      |
              |      |                                      (12) ...to here
              |
            'drbg_hmac_update': events 13-14
              |
              |include/crypto/drbg.h:144:12:
              |  144 |         if (drbg && drbg->core)
              |      |            ^        ~~~~~~~~~~
              |      |            |            |
              |      |            |            (14) ...to here
              |      |            (13) following 'true' branch (when 'drbg'=
 is non-NULL)...
              |
            'drbg_hmac_update': events 15-19
              |
              |crypto/drbg.c:680:23:
              |  680 |         for (i =3D 2; 0 < i; i--) {
              |      |                     ~~^~~
              |      |                       |
              |      |                       (15) following 'true' branch (=
when 'i !=3D 0')...
              |  681 |                 /* first round uses 0x0, second 0x1 =
*/
              |  682 |                 unsigned char prefix =3D DRBG_PREFIX=
0;

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
--===============0809701210624728465==--

