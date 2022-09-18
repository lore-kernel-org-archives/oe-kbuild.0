Content-Type: multipart/mixed; boundary="===============8729880505835560877=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [norov:fns 8/11] lib/find_bit.c:90:40: warning: use of uninitialized value 'tmp' [CWE-457]
Date: Sun, 18 Sep 2022 12:32:41 +0800
Message-ID: <202209181251.AmGVOM3Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8729880505835560877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: lib/find_=
bit.c:90:40: warning: use of uninitialized value 'tmp' [CWE-457] [-Wanalyze=
r-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux fns
head:   585dc3f17d3cbd1636e7ff44b3908bf9c1f41797
commit: d720f1934c9d2d5fedb2f71791903bcaf6efc6ff [8/11] lib: add find_nth(,=
and,andnot)_bit()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220917 (https://download.01.org/0day-ci/archi=
ve/20220918/202209181251.AmGVOM3Y-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/norov/linux/commit/d720f1934c9d2d5fedb2f717919=
03bcaf6efc6ff
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov fns
        git checkout d720f1934c9d2d5fedb2f71791903bcaf6efc6ff
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from lib/find_bit.c:19:
   lib/find_bit.c: In function '__find_nth_bit':
>> lib/find_bit.c:90:40: warning: use of uninitialized value 'tmp' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]
      90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz);    =
                  \
         |                                        ^~~~~~~~~~~~~
   include/linux/minmax.h:31:39: note: in definition of macro '__cmp_once'
      31 |                 typeof(x) unique_x =3D (x);               \
         |                                       ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   lib/find_bit.c:90:14: note: in expansion of macro 'min'
      90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz);    =
                  \
         |              ^~~
   lib/find_bit.c:140:16: note: in expansion of macro 'FIND_NTH_BIT'
     140 |         return FIND_NTH_BIT(addr[idx], size, n);
         |                ^~~~~~~~~~~~
     '__find_nth_bit': event 1
       |
       |   73 |         unsigned long sz =3D (size), __n =3D (n), idx, w, t=
mp;                      \
       |      |                                                       ^~~
       |      |                                                       |
       |      |                                                       (1) r=
egion created on stack here
   lib/find_bit.c:140:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  140 |         return FIND_NTH_BIT(addr[idx], size, n);
       |      |                ^~~~~~~~~~~~
       |
     '__find_nth_bit': event 2
       |
       |   75 |         for (idx =3D 0; (idx + 1) * BITS_PER_LONG <=3D sz; =
idx++) {                 \
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
       |      |                                                 |
       |      |                                                 (2) followi=
ng 'false' branch...
   lib/find_bit.c:140:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  140 |         return FIND_NTH_BIT(addr[idx], size, n);
       |      |                ^~~~~~~~~~~~
       |
     '__find_nth_bit': event 3
       |
       |   89 | found:                                                     =
                     \
       |      | ^~~~~
       |      | |
       |      | (3) ...to here
   lib/find_bit.c:140:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  140 |         return FIND_NTH_BIT(addr[idx], size, n);
       |      |                ^~~~~~~~~~~~
       |
     '__find_nth_bit': event 4
       |
       |   90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz)=
;                      \
       |      |                                        ^~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (4) use of uninitial=
ized value 'tmp' here
   include/linux/minmax.h:31:39: note: in definition of macro '__cmp_once'
       |   31 |                 typeof(x) unique_x =3D (x);               \
       |      |                                       ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
       |   45 | #define min(x, y)       __careful_cmp(x, y, <)
       |      |                         ^~~~~~~~~~~~~
   lib/find_bit.c:90:14: note: in expansion of macro 'min'
       |   90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz)=
;                      \
       |      |              ^~~
   lib/find_bit.c:140:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  140 |         return FIND_NTH_BIT(addr[idx], size, n);
       |      |                ^~~~~~~~~~~~
       |
   lib/find_bit.c: In function '__find_nth_and_bit':
>> lib/find_bit.c:90:40: warning: use of uninitialized value 'tmp' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]
      90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz);    =
                  \
         |                                        ^~~~~~~~~~~~~
   include/linux/minmax.h:31:39: note: in definition of macro '__cmp_once'
      31 |                 typeof(x) unique_x =3D (x);               \
         |                                       ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   lib/find_bit.c:90:14: note: in expansion of macro 'min'
      90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz);    =
                  \
         |              ^~~
   lib/find_bit.c:147:16: note: in expansion of macro 'FIND_NTH_BIT'
     147 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, n);
         |                ^~~~~~~~~~~~
     '__find_nth_and_bit': event 1
       |
       |   73 |         unsigned long sz =3D (size), __n =3D (n), idx, w, t=
mp;                      \
       |      |                                                       ^~~
       |      |                                                       |
       |      |                                                       (1) r=
egion created on stack here
   lib/find_bit.c:147:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  147 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, =
n);
       |      |                ^~~~~~~~~~~~
       |
     '__find_nth_and_bit': event 2
       |
       |   75 |         for (idx =3D 0; (idx + 1) * BITS_PER_LONG <=3D sz; =
idx++) {                 \
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
       |      |                                                 |
       |      |                                                 (2) followi=
ng 'false' branch...
   lib/find_bit.c:147:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  147 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, =
n);
       |      |                ^~~~~~~~~~~~
       |
     '__find_nth_and_bit': event 3
       |
       |   89 | found:                                                     =
                     \
       |      | ^~~~~
       |      | |
       |      | (3) ...to here
   lib/find_bit.c:147:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  147 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, =
n);
       |      |                ^~~~~~~~~~~~
       |
     '__find_nth_and_bit': event 4
       |
       |   90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz)=
;                      \
       |      |                                        ^~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (4) use of uninitial=
ized value 'tmp' here
   include/linux/minmax.h:31:39: note: in definition of macro '__cmp_once'
       |   31 |                 typeof(x) unique_x =3D (x);               \
       |      |                                       ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
       |   45 | #define min(x, y)       __careful_cmp(x, y, <)
       |      |                         ^~~~~~~~~~~~~
   lib/find_bit.c:90:14: note: in expansion of macro 'min'
       |   90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz)=
;                      \
       |      |              ^~~
   lib/find_bit.c:147:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  147 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, =
n);
       |      |                ^~~~~~~~~~~~
       |
   lib/find_bit.c: In function '__find_nth_andnot_bit':
>> lib/find_bit.c:90:40: warning: use of uninitialized value 'tmp' [CWE-457=
] [-Wanalyzer-use-of-uninitialized-value]
      90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz);    =
                  \
         |                                        ^~~~~~~~~~~~~
   include/linux/minmax.h:31:39: note: in definition of macro '__cmp_once'
      31 |                 typeof(x) unique_x =3D (x);               \
         |                                       ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   lib/find_bit.c:90:14: note: in expansion of macro 'min'
      90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz);    =
                  \
         |              ^~~
   lib/find_bit.c:154:16: note: in expansion of macro 'FIND_NTH_BIT'
     154 |         return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size, n);
         |                ^~~~~~~~~~~~
     '__find_nth_andnot_bit': event 1
       |
       |   73 |         unsigned long sz =3D (size), __n =3D (n), idx, w, t=
mp;                      \
       |      |                                                       ^~~
       |      |                                                       |
       |      |                                                       (1) r=
egion created on stack here
   lib/find_bit.c:154:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  154 |         return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size,=
 n);
       |      |                ^~~~~~~~~~~~
       |
     '__find_nth_andnot_bit': event 2
       |
       |   75 |         for (idx =3D 0; (idx + 1) * BITS_PER_LONG <=3D sz; =
idx++) {                 \
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
       |      |                                                 |
       |      |                                                 (2) followi=
ng 'false' branch...
   lib/find_bit.c:154:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  154 |         return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size,=
 n);
       |      |                ^~~~~~~~~~~~
       |
     '__find_nth_andnot_bit': event 3
       |
       |   89 | found:                                                     =
                     \
       |      | ^~~~~
       |      | |
       |      | (3) ...to here
   lib/find_bit.c:154:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  154 |         return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size,=
 n);
       |      |                ^~~~~~~~~~~~
       |
     '__find_nth_andnot_bit': event 4
       |
       |   90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz)=
;                      \
       |      |                                        ^~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (4) use of uninitial=
ized value 'tmp' here
   include/linux/minmax.h:31:39: note: in definition of macro '__cmp_once'
       |   31 |                 typeof(x) unique_x =3D (x);               \
       |      |                                       ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
       |   45 | #define min(x, y)       __careful_cmp(x, y, <)
       |      |                         ^~~~~~~~~~~~~
   lib/find_bit.c:90:14: note: in expansion of macro 'min'
       |   90 |         sz =3D min(idx * BITS_PER_LONG + fns(tmp, __n), sz)=
;                      \
       |      |              ^~~
   lib/find_bit.c:154:16: note: in expansion of macro 'FIND_NTH_BIT'
       |  154 |         return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size,=
 n);
       |      |                ^~~~~~~~~~~~
       |

vim +/tmp +90 lib/find_bit.c

0ade34c37012ea Clement Courbet 2018-02-06  70  =

d720f1934c9d2d Yury Norov      2022-07-10  71  #define FIND_NTH_BIT(FETCH, =
size, n)						\
d720f1934c9d2d Yury Norov      2022-07-10  72  ({										\
d720f1934c9d2d Yury Norov      2022-07-10  73  	unsigned long sz =3D (size)=
, __n =3D (n), idx, w, tmp;			\
d720f1934c9d2d Yury Norov      2022-07-10  74  										\
d720f1934c9d2d Yury Norov      2022-07-10  75  	for (idx =3D 0; (idx + 1) *=
 BITS_PER_LONG <=3D sz; idx++) {			\
d720f1934c9d2d Yury Norov      2022-07-10  76  		if (idx * BITS_PER_LONG + =
__n >=3D sz)				\
d720f1934c9d2d Yury Norov      2022-07-10  77  			goto out;						\
d720f1934c9d2d Yury Norov      2022-07-10  78  										\
d720f1934c9d2d Yury Norov      2022-07-10  79  		tmp =3D (FETCH);							\
d720f1934c9d2d Yury Norov      2022-07-10  80  		w =3D hweight_long(tmp);		=
				\
d720f1934c9d2d Yury Norov      2022-07-10  81  		if (w > __n)							\
d720f1934c9d2d Yury Norov      2022-07-10  82  			goto found;						\
d720f1934c9d2d Yury Norov      2022-07-10  83  										\
d720f1934c9d2d Yury Norov      2022-07-10  84  		__n -=3D w;							\
d720f1934c9d2d Yury Norov      2022-07-10  85  	}									\
d720f1934c9d2d Yury Norov      2022-07-10  86  										\
d720f1934c9d2d Yury Norov      2022-07-10  87  	if (sz % BITS_PER_LONG)				=
			\
d720f1934c9d2d Yury Norov      2022-07-10  88  		tmp =3D (FETCH) & BITMAP_L=
AST_WORD_MASK(sz);			\
d720f1934c9d2d Yury Norov      2022-07-10  89  found:										\
d720f1934c9d2d Yury Norov      2022-07-10 @90  	sz =3D min(idx * BITS_PER_L=
ONG + fns(tmp, __n), sz);			\
d720f1934c9d2d Yury Norov      2022-07-10  91  out:										\
d720f1934c9d2d Yury Norov      2022-07-10  92  	sz;									\
d720f1934c9d2d Yury Norov      2022-07-10  93  })
d720f1934c9d2d Yury Norov      2022-07-10  94  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8729880505835560877==--

