Content-Type: multipart/mixed; boundary="===============8384528108373100859=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: scripts/kconfig/confdata.c:1091:10: warning: leak of FILE 'file' [CWE-775]
Date: Wed, 12 Jan 2022 01:39:45 +0800
Message-ID: <202201120132.hz0HwEsQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8384528108373100859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fe8152b38d3a994c4c6fdbc0cd6551d569a5715a
commit: 57ddd07c456053dfdabebc6a2d030c57cd3fb75b kconfig: refactor conf_wri=
te_autoconf()
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220111 (https://download.01.org/0day-ci/archi=
ve/20220112/202201120132.hz0HwEsQ-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D57ddd07c456053dfdabebc6a2d030c57cd3fb75b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 57ddd07c456053dfdabebc6a2d030c57cd3fb75b
        # save the config file to linux build tree
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In function '__conf_write_autoconf':
>> scripts/kconfig/confdata.c:1091:10: warning: leak of FILE 'file' [CWE-77=
5] [-Wanalyzer-file-leak]
    1091 |   return -1;
         |          ^
     'conf_write_autoconf': events 1-2
       |
       | 1103 | int conf_write_autoconf(int overwrite)
       |      |     ^~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'conf_write_autoconf'
       |......
       | 1106 |  const char *autoconf_name =3D conf_get_autoconfig_name();
       |      |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (2) calling 'conf_get_autoconf=
ig_name' from 'conf_write_autoconf'
       |
       +--> 'conf_get_autoconfig_name': events 3-5
              |
              |  219 | static const char *conf_get_autoconfig_name(void)
              |      |                    ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (3) entry to 'conf_get_autoconfig=
_name'
              |......
              |  223 |  return name ? name : "include/config/auto.conf";
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (4) following 'true' branch (whe=
n 'name' is non-NULL)...
              |      |                     (5) ...to here
              |
       <------+
       |
     'conf_write_autoconf': events 6-7
       |
       | 1106 |  const char *autoconf_name =3D conf_get_autoconfig_name();
       |      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (6) returning to 'conf_write_a=
utoconf' from 'conf_get_autoconfig_name'
       |......
       | 1114 |  if (conf_touch_deps())
       |      |      ~~~~~~~~~~~~~~~~~        =

       |      |      |
       |      |      (7) calling 'conf_touch_deps' from 'conf_write_autocon=
f'
       |
       +--> 'conf_touch_deps': events 8-9
              |
              |  989 | static int conf_touch_deps(void)
              |      |            ^~~~~~~~~~~~~~~
              |      |            |
              |      |            (8) entry to 'conf_touch_deps'
              |......
              |  998 |  name =3D conf_get_autoconfig_name();
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (9) calling 'conf_get_autoconfig_name' from =
'conf_touch_deps'
              |
              +--> 'conf_get_autoconfig_name': events 10-12
                     |
                     |  219 | static const char *conf_get_autoconfig_name(v=
oid)
                     |      |                    ^~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (10) entry to 'conf_get_au=
toconfig_name'
                     |......
                     |  223 |  return name ? name : "include/config/auto.co=
nf";
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
                     |      |                     |
                     |      |                     (11) following 'true' bra=
nch (when 'name' is non-NULL)...
                     |      |                     (12) ...to here
                     |
              <------+
              |
            'conf_touch_deps': events 13-14
              |
              |  998 |  name =3D conf_get_autoconfig_name();
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (13) returning to 'conf_touch_deps' from 'co=
nf_get_autoconfig_name'
              |  999 |  conf_read_simple(name, S_DEF_AUTO);
              |      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |  |
              |      |  (14) calling 'conf_read_simple' from 'conf_touch_de=
ps'
              |
              +--> 'conf_read_simple': events 15-19
                     |
                     |  349 | int conf_read_simple(const char *name, int de=
f)
                     |      |     ^~~~~~~~~~~~~~~~
                     |      |     |
                     |      |     (15) entry to 'conf_read_simple'
                     |......
                     |  358 |  if (name) {
                     |      |     ~
                     |      |     |
                     |      |     (16) following 'true' branch (when 'name'=
 is non-NULL)...
                     |  359 |   in =3D zconf_fopen(name);
                     |      |        ~~~~~~~~~~~~~~~~~
                     |      |        |
                     |      |        (17) ...to here
                     |......
                     |  403 |  if (!in)
                     |      |     ~
                     |      |     |
                     |      |     (18) following 'true' branch (when 'in' i=
s NULL)...
                     |  404 |   return 1;

vim +/file +1091 scripts/kconfig/confdata.c

2e3646e51b2d641 Roman Zippel    2006-06-08  1060  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1061  static int __conf_write_a=
utoconf(const char *filename,
57ddd07c456053d Masahiro Yamada 2021-10-01  1062  				 void (*print_symbol)=
(FILE *, struct symbol *),
57ddd07c456053d Masahiro Yamada 2021-10-01  1063  				 const struct comment=
_style *comment_style)
57ddd07c456053d Masahiro Yamada 2021-10-01  1064  {
57ddd07c456053d Masahiro Yamada 2021-10-01  1065  	char tmp[PATH_MAX];
57ddd07c456053d Masahiro Yamada 2021-10-01  1066  	FILE *file;
57ddd07c456053d Masahiro Yamada 2021-10-01  1067  	struct symbol *sym;
57ddd07c456053d Masahiro Yamada 2021-10-01  1068  	int ret, i;
57ddd07c456053d Masahiro Yamada 2021-10-01  1069  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1070  	if (make_parent_dir(file=
name))
57ddd07c456053d Masahiro Yamada 2021-10-01  1071  		return -1;
57ddd07c456053d Masahiro Yamada 2021-10-01  1072  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1073  	ret =3D snprintf(tmp, si=
zeof(tmp), "%s.tmp", filename);
57ddd07c456053d Masahiro Yamada 2021-10-01  1074  	if (ret >=3D sizeof(tmp)=
) /* check truncation */
57ddd07c456053d Masahiro Yamada 2021-10-01  1075  		return -1;
57ddd07c456053d Masahiro Yamada 2021-10-01  1076  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1077  	file =3D fopen(tmp, "w");
57ddd07c456053d Masahiro Yamada 2021-10-01  1078  	if (!file) {
57ddd07c456053d Masahiro Yamada 2021-10-01  1079  		perror("fopen");
57ddd07c456053d Masahiro Yamada 2021-10-01  1080  		return -1;
57ddd07c456053d Masahiro Yamada 2021-10-01  1081  	}
57ddd07c456053d Masahiro Yamada 2021-10-01  1082  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1083  	conf_write_heading(file,=
 comment_style);
57ddd07c456053d Masahiro Yamada 2021-10-01  1084  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1085  	for_all_symbols(i, sym)
57ddd07c456053d Masahiro Yamada 2021-10-01  1086  		if ((sym->flags & SYMBO=
L_WRITE) && sym->name)
57ddd07c456053d Masahiro Yamada 2021-10-01  1087  			print_symbol(file, sym=
);
57ddd07c456053d Masahiro Yamada 2021-10-01  1088  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1089  	/* check possible errors=
 in conf_write_heading() and print_symbol() */
57ddd07c456053d Masahiro Yamada 2021-10-01  1090  	if (ferror(file))
57ddd07c456053d Masahiro Yamada 2021-10-01 @1091  		return -1;
57ddd07c456053d Masahiro Yamada 2021-10-01  1092  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1093  	fclose(file);
57ddd07c456053d Masahiro Yamada 2021-10-01  1094  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1095  	if (rename(tmp, filename=
)) {
57ddd07c456053d Masahiro Yamada 2021-10-01  1096  		perror("rename");
57ddd07c456053d Masahiro Yamada 2021-10-01  1097  		return -1;
57ddd07c456053d Masahiro Yamada 2021-10-01  1098  	}
57ddd07c456053d Masahiro Yamada 2021-10-01  1099  =

57ddd07c456053d Masahiro Yamada 2021-10-01  1100  	return 0;
57ddd07c456053d Masahiro Yamada 2021-10-01  1101  }
57ddd07c456053d Masahiro Yamada 2021-10-01  1102  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8384528108373100859==--

