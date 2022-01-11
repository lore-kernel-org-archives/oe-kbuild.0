Content-Type: multipart/mixed; boundary="===============3653411570407736130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: scripts/kconfig/parser.tab.c:378:19: warning: 'free' of 'yyss1' which points to memory not on the heap [CWE-590]
Date: Tue, 11 Jan 2022 22:06:16 +0800
Message-ID: <202201112243.FQMOho9k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3653411570407736130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fe8152b38d3a994c4c6fdbc0cd6551d569a5715a
commit: a77a05dc9cf24a8c88b9d9c70e8984f936d075f3 kconfig: split menu.c out =
of parser.y
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220111 (https://download.01.org/0day-ci/archi=
ve/20220111/202201112243.FQMOho9k-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da77a05dc9cf24a8c88b9d9c70e8984f936d075f3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a77a05dc9cf24a8c88b9d9c70e8984f936d075f3
        # save the config file to linux build tree
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   scripts/kconfig/parser.tab.c: In function 'yyparse':
>> scripts/kconfig/parser.tab.c:378:19: warning: 'free' of 'yyss1' which po=
ints to memory not on the heap [CWE-590] [-Wanalyzer-free-of-non-heap]
     378 | #   define YYFREE free
         |                   ^
   scripts/kconfig/parser.tab.c:359:24: note: in expansion of macro 'YYFREE'
     359 | #  define YYSTACK_FREE YYFREE
         |                        ^~~~~~
   scripts/kconfig/parser.tab.c:1352:11: note: in expansion of macro 'YYSTA=
CK_FREE'
    1352 |           YYSTACK_FREE (yyss1);
         |           ^~~~~~~~~~~~
     'yyparse': events 1-7
       |
       | 1307 |   if (yyss + yystacksize - 1 <=3D yyssp)
       |      |      ^
       |      |      |
       |      |      (1) following 'true' branch...
       |......
       | 1313 |       YYSIZE_T yysize =3D (YYSIZE_T) (yyssp - yyss + 1);
       |      |                                           ~
       |      |                                           |
       |      |                                           (2) ...to here
       |......
       | 1336 |       if (YYMAXDEPTH <=3D yystacksize)
       |      |          ~
       |      |          |
       |      |          (3) following 'false' branch (when 'yystacksize <=
=3D 9999')...
       | 1337 |         goto yyexhaustedlab;
       | 1338 |       yystacksize *=3D 2;
       |      |       ~~~~~~~~~~~~~~~~
       |      |                   |
       |      |                   (4) ...to here
       | 1339 |       if (YYMAXDEPTH < yystacksize)
       |      |          ~
       |      |          |
       |      |          (5) following 'false' branch (when 'yystacksize <=
=3D 10000')...
       |......
       | 1343 |         yytype_int16 *yyss1 =3D yyss;
       |      |                       ~~~~~
       |      |                       |
       |      |                       (6) ...to here
       |......
       | 1346 |         if (! yyptr)
       |      |            ~
       |      |            |
       |      |            (7) following 'false' branch (when 'yyptr' is no=
n-NULL)...
       |
     'yyparse': event 8
       |
       |  433 |       __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
       |      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |       |
       |      |       (8) ...to here
   scripts/kconfig/parser.tab.c:418:9: note: in expansion of macro 'YYCOPY'
       |  418 |         YYCOPY (&yyptr->Stack_alloc, Stack, yysize);       =
             \
       |      |         ^~~~~~
   scripts/kconfig/parser.tab.c:1348:9: note: in expansion of macro 'YYSTAC=
K_RELOCATE'
       | 1348 |         YYSTACK_RELOCATE (yyss_alloc, yyss);
       |      |         ^~~~~~~~~~~~~~~~
       |
     'yyparse': event 9
       |
       |  419 |         Stack =3D &yyptr->Stack_alloc;                     =
               \
       |      |               |
       |      |               (9) pointer is from here
       |......
       | 1348 |         YYSTACK_RELOCATE (yyss_alloc, yyss);
       |      |                                     =

   scripts/kconfig/parser.tab.c:1348:9: note: in expansion of macro 'YYSTAC=
K_RELOCATE'
       | 1348 |         YYSTACK_RELOCATE (yyss_alloc, yyss);
       |      |         ^~~~~~~~~~~~~~~~
       |
     'yyparse': events 10-12
       |
       | 1351 |         if (yyss1 !=3D yyssa)
       |      |            ^
       |      |            |
       |      |            (10) following 'false' branch...
       |......
       | 1356 |       yyssp =3D yyss + yysize - 1;
       |      |                    ~
       |      |                    |
       |      |                    (11) ...to here
       |......
       | 1362 |       if (yyss + yystacksize - 1 <=3D yyssp)
       |      |          ~  =

       |      |          |
       |      |          (12) following 'false' branch...
       |
     'yyparse': event 13
       |
       |  798 |   if (yydebug)                                  \
       |      |       ^~~~~~~
       |      |       |
       |      |       (13) ...to here
   scripts/kconfig/parser.tab.c:1367:3: note: in expansion of macro 'YYDPRI=
NTF'
       | 1367 |   YYDPRINTF ((stderr, "Entering state %d\n", yystate));
       |      |   ^~~~~~~~~
       |
     'yyparse': events 14-21
       |
       | 1369 |   if (yystate =3D=3D YYFINAL)
       |      |      ^

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3653411570407736130==--

