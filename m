Content-Type: multipart/mixed; boundary="===============2380236410628594924=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 4/7] kallsyms: introduce sections needed to map symbols to built-in modules
Date: Sun, 19 Dec 2021 12:14:00 +0800
Message-ID: <202112191214.roku0djI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2380236410628594924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211216201919.234994-5-nick.alcock@oracle.com>
References: <20211216201919.234994-5-nick.alcock@oracle.com>
TO: Nick Alcock <nick.alcock@oracle.com>

Hi Nick,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.16-rc5]
[cannot apply to masahiroy/kconfig jeyu/modules-next next-20211217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nick-Alcock/kbuild-bring-b=
ack-tristate-conf/20211217-051935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
136057256686de39cc3a07c2e39ef6bc43003ff6
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20211219 (https://download.01.org/0day-ci/archi=
ve/20211219/202112191214.roku0djI-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/54ce07da9021c6db11ebe215d=
22d88542671e8f6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nick-Alcock/kbuild-bring-back-tris=
tate-conf/20211217-051935
        git checkout 54ce07da9021c6db11ebe215d22d88542671e8f6
        # save the config file to linux build tree
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   scripts/kallsyms.c: In function 'make_percpus_absolute':
>> scripts/kallsyms.c:976:7: warning: use after 'free' of '<unknown>' [CWE-=
416] [-Wanalyzer-use-after-free]
     976 |   if (addr_in_range(table[i]->addr, &percpu_range, 1)) {
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'main': events 1-4
       |
       | 1106 | int main(int argc, char **argv)
       |      |     ^~~~
       |      |     |
       |      |     (1) entry to 'main'
       |......
       | 1124 |  } else if (argc !=3D 1)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'argc =3D=3D =
1')...
       |......
       | 1127 |  read_map(stdin);
       |      |  ~~~~~~~~~~~~~~~
       |      |  |
       |      |  (3) ...to here
       |      |  (4) calling 'read_map' from 'main'
       |
       +--> 'read_map': events 5-7
              |
              |  433 | static void read_map(FILE *in)
              |      |             ^~~~~~~~
              |      |             |
              |      |             (5) entry to 'read_map'
              |......
              |  437 |  while (!feof(in)) {
              |      |        ~     =

              |      |        |
              |      |        (6) following 'false' branch...
              |......
              |  455 | }
              |      | ~            =

              |      | |
              |      | (7) ...to here
              |
       <------+
       |
     'main': events 8-9
       |
       | 1127 |  read_map(stdin);
       |      |  ^~~~~~~~~~~~~~~
       |      |  |
       |      |  (8) returning to 'main' from 'read_map'
       | 1128 |  read_modules(modules_builtin);
       | 1129 |  shrink_table();
       |      |  ~~~~~~~~~~~~~~
       |      |  |
       |      |  (9) calling 'shrink_table' from 'main'
       |
       +--> 'shrink_table': events 10-14
              |
              |  410 | static void shrink_table(void)
              |      |             ^~~~~~~~~~~~
              |      |             |
              |      |             (10) entry to 'shrink_table'
              |      |             (11) entry to 'shrink_table'
              |......
              |  415 |  for (i =3D 0; i < table_cnt; i++) {
              |      |  ~~~         =

              |      |  |
              |      |  (12) following 'true' branch...
              |  416 |   if (symbol_valid(table[i])) {
              |      |       ~~~~~~~~~~~~~~~~~~~~~~
              |      |       |                 |
              |      |       |                 (13) ...to here
              |      |       (14) calling 'symbol_valid' from 'shrink_table'
              |
              +--> 'symbol_valid': events 15-18
                     |
                     |  383 | static int symbol_valid(const struct sym_entr=
y *s)
                     |      |            ^~~~~~~~~~~~
                     |      |            |
                     |      |            (15) entry to 'symbol_valid'
                     |......
                     |  389 |  if (!all_symbols) {
                     |      |     ~       =

                     |      |     |
                     |      |     (16) following 'true' branch...
                     |  390 |   if (addr_in_range(s->addr, text_ranges,
                     |      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |       |
                     |      |       (17) ...to here
                     |      |       (18) calling 'addr_in_range' from 'symb=
ol_valid'
                     |  391 |       ARRAY_SIZE(text_ranges)) =3D=3D 0)
                     |      |       ~~~~~~~~~~~~~~~~~~~~~~~~
                     |
                     +--> 'addr_in_range': events 19-25
                            |
                            |  367 | static int addr_in_range(unsigned long=
 long addr,
                            |      |            ^~~~~~~~~~~~~
                            |      |            |
                            |      |            (19) entry to 'addr_in_rang=
e'
                            |......
                            |  373 |  for (i =3D 0; i < entries; ++i) {
                            |      |  ~~~        =

                            |      |  |
                            |      |  (20) following 'true' branch...
                            |  374 |   ar =3D &ranges[i];

vim +976 scripts/kallsyms.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  970  =

c6bda7c988a579 Rusty Russell   2014-03-17  971  static void make_percpus_ab=
solute(void)
c6bda7c988a579 Rusty Russell   2014-03-17  972  {
c6bda7c988a579 Rusty Russell   2014-03-17  973  	unsigned int i;
c6bda7c988a579 Rusty Russell   2014-03-17  974  =

c6bda7c988a579 Rusty Russell   2014-03-17  975  	for (i =3D 0; i < table_cn=
t; i++)
54ce07da9021c6 Nick Alcock     2021-12-16 @976  		if (addr_in_range(table[i=
]->addr, &percpu_range, 1)) {
8c996940b3be9c Ard Biesheuvel  2016-03-15  977  			/*
8c996940b3be9c Ard Biesheuvel  2016-03-15  978  			 * Keep the 'A' override=
 for percpu symbols to
8c996940b3be9c Ard Biesheuvel  2016-03-15  979  			 * ensure consistent beh=
avior compared to older
8c996940b3be9c Ard Biesheuvel  2016-03-15  980  			 * versions of this tool.
8c996940b3be9c Ard Biesheuvel  2016-03-15  981  			 */
8d60526999aace Masahiro Yamada 2020-02-02  982  			table[i]->sym[0] =3D 'A';
8d60526999aace Masahiro Yamada 2020-02-02  983  			table[i]->percpu_absolut=
e =3D 1;
8c996940b3be9c Ard Biesheuvel  2016-03-15  984  		}
c6bda7c988a579 Rusty Russell   2014-03-17  985  }
c6bda7c988a579 Rusty Russell   2014-03-17  986  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2380236410628594924==--

