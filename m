Content-Type: multipart/mixed; boundary="===============8031382859689261089=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] regmap: debugfs: Fix handling of name string for debugfs init delays
Date: Fri, 18 Sep 2020 03:04:23 +0800
Message-ID: <202009180353.HfQ1LA1J%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8031382859689261089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200917120828.12987-1-ckeepax@opensource.cirrus.com>
References: <20200917120828.12987-1-ckeepax@opensource.cirrus.com>
TO: Charles Keepax <ckeepax@opensource.cirrus.com>

Hi Charles,

I love your patch! Perhaps something to improve:

[auto build test WARNING on regmap/for-next]
[also build test WARNING on linux/master linus/master v5.9-rc5 next-2020091=
7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Charles-Keepax/regmap-debu=
gfs-Fix-handling-of-name-string-for-debugfs-init-delays/20200917-204117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git =
for-next
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-m001-20200917 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/base/regmap/regmap.c:1177 __regmap_init() error: uninitialized symb=
ol 'ret'.
drivers/base/regmap/regmap.c:1177 __regmap_init() warn: passing zero to 'ER=
R_PTR'

Old smatch warnings:
drivers/base/regmap/regmap.c:1901 _regmap_raw_write() error: uninitialized =
symbol 'ret'.
drivers/base/regmap/regmap.c:2685 regmap_raw_read() error: uninitialized sy=
mbol 'ret'.

# https://github.com/0day-ci/linux/commit/d1cea9a7b51682f9b773cf376db0fe146=
56869a7
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Charles-Keepax/regmap-debugfs-Fix-handling=
-of-name-string-for-debugfs-init-delays/20200917-204117
git checkout d1cea9a7b51682f9b773cf376db0fe14656869a7
vim +/ret +1177 drivers/base/regmap/regmap.c

afcc00b91f1865f Xiubo Li            2015-12-03   948  =

b83a313bf252018 Mark Brown          2011-05-11   949  	default:
8698b9364710e7b Baolin Wang         2017-11-01   950  		goto err_hwlock;
b83a313bf252018 Mark Brown          2011-05-11   951  	}
b83a313bf252018 Mark Brown          2011-05-11   952  =

8a819ff8abac9ad Mark Brown          2013-03-04   953  	if (val_endian =3D=
=3D REGMAP_ENDIAN_NATIVE)
8a819ff8abac9ad Mark Brown          2013-03-04   954  		map->format.parse_i=
nplace =3D regmap_parse_inplace_noop;
8a819ff8abac9ad Mark Brown          2013-03-04   955  =

b83a313bf252018 Mark Brown          2011-05-11   956  	switch (config->val_=
bits) {
b83a313bf252018 Mark Brown          2011-05-11   957  	case 8:
b83a313bf252018 Mark Brown          2011-05-11   958  		map->format.format_=
val =3D regmap_format_8;
b83a313bf252018 Mark Brown          2011-05-11   959  		map->format.parse_v=
al =3D regmap_parse_8;
8a819ff8abac9ad Mark Brown          2013-03-04   960  		map->format.parse_i=
nplace =3D regmap_parse_inplace_noop;
b83a313bf252018 Mark Brown          2011-05-11   961  		break;
b83a313bf252018 Mark Brown          2011-05-11   962  	case 16:
141eba2e006dd81 Stephen Warren      2012-05-24   963  		switch (val_endian)=
 {
141eba2e006dd81 Stephen Warren      2012-05-24   964  		case REGMAP_ENDIAN_=
BIG:
141eba2e006dd81 Stephen Warren      2012-05-24   965  			map->format.format=
_val =3D regmap_format_16_be;
141eba2e006dd81 Stephen Warren      2012-05-24   966  			map->format.parse_=
val =3D regmap_parse_16_be;
8a819ff8abac9ad Mark Brown          2013-03-04   967  			map->format.parse_=
inplace =3D regmap_parse_16_be_inplace;
141eba2e006dd81 Stephen Warren      2012-05-24   968  			break;
4aa8c0694c731e0 Xiubo Li            2014-04-02   969  		case REGMAP_ENDIAN_=
LITTLE:
4aa8c0694c731e0 Xiubo Li            2014-04-02   970  			map->format.format=
_val =3D regmap_format_16_le;
4aa8c0694c731e0 Xiubo Li            2014-04-02   971  			map->format.parse_=
val =3D regmap_parse_16_le;
4aa8c0694c731e0 Xiubo Li            2014-04-02   972  			map->format.parse_=
inplace =3D regmap_parse_16_le_inplace;
4aa8c0694c731e0 Xiubo Li            2014-04-02   973  			break;
141eba2e006dd81 Stephen Warren      2012-05-24   974  		case REGMAP_ENDIAN_=
NATIVE:
141eba2e006dd81 Stephen Warren      2012-05-24   975  			map->format.format=
_val =3D regmap_format_16_native;
141eba2e006dd81 Stephen Warren      2012-05-24   976  			map->format.parse_=
val =3D regmap_parse_16_native;
141eba2e006dd81 Stephen Warren      2012-05-24   977  			break;
141eba2e006dd81 Stephen Warren      2012-05-24   978  		default:
8698b9364710e7b Baolin Wang         2017-11-01   979  			goto err_hwlock;
141eba2e006dd81 Stephen Warren      2012-05-24   980  		}
b83a313bf252018 Mark Brown          2011-05-11   981  		break;
ea279fc5619e254 Marc Reilly         2012-03-16   982  	case 24:
141eba2e006dd81 Stephen Warren      2012-05-24   983  		if (val_endian !=3D=
 REGMAP_ENDIAN_BIG)
8698b9364710e7b Baolin Wang         2017-11-01   984  			goto err_hwlock;
ea279fc5619e254 Marc Reilly         2012-03-16   985  		map->format.format_=
val =3D regmap_format_24;
ea279fc5619e254 Marc Reilly         2012-03-16   986  		map->format.parse_v=
al =3D regmap_parse_24;
ea279fc5619e254 Marc Reilly         2012-03-16   987  		break;
7d5e525b9ceda0e Mark Brown          2012-02-17   988  	case 32:
141eba2e006dd81 Stephen Warren      2012-05-24   989  		switch (val_endian)=
 {
141eba2e006dd81 Stephen Warren      2012-05-24   990  		case REGMAP_ENDIAN_=
BIG:
141eba2e006dd81 Stephen Warren      2012-05-24   991  			map->format.format=
_val =3D regmap_format_32_be;
141eba2e006dd81 Stephen Warren      2012-05-24   992  			map->format.parse_=
val =3D regmap_parse_32_be;
8a819ff8abac9ad Mark Brown          2013-03-04   993  			map->format.parse_=
inplace =3D regmap_parse_32_be_inplace;
141eba2e006dd81 Stephen Warren      2012-05-24   994  			break;
4aa8c0694c731e0 Xiubo Li            2014-04-02   995  		case REGMAP_ENDIAN_=
LITTLE:
4aa8c0694c731e0 Xiubo Li            2014-04-02   996  			map->format.format=
_val =3D regmap_format_32_le;
4aa8c0694c731e0 Xiubo Li            2014-04-02   997  			map->format.parse_=
val =3D regmap_parse_32_le;
4aa8c0694c731e0 Xiubo Li            2014-04-02   998  			map->format.parse_=
inplace =3D regmap_parse_32_le_inplace;
4aa8c0694c731e0 Xiubo Li            2014-04-02   999  			break;
141eba2e006dd81 Stephen Warren      2012-05-24  1000  		case REGMAP_ENDIAN_=
NATIVE:
141eba2e006dd81 Stephen Warren      2012-05-24  1001  			map->format.format=
_val =3D regmap_format_32_native;
141eba2e006dd81 Stephen Warren      2012-05-24  1002  			map->format.parse_=
val =3D regmap_parse_32_native;
141eba2e006dd81 Stephen Warren      2012-05-24  1003  			break;
141eba2e006dd81 Stephen Warren      2012-05-24  1004  		default:
8698b9364710e7b Baolin Wang         2017-11-01  1005  			goto err_hwlock;
141eba2e006dd81 Stephen Warren      2012-05-24  1006  		}
7d5e525b9ceda0e Mark Brown          2012-02-17  1007  		break;
afcc00b91f1865f Xiubo Li            2015-12-03  1008  #ifdef CONFIG_64BIT
782035ea94dc402 Dan Carpenter       2015-12-12  1009  	case 64:
afcc00b91f1865f Xiubo Li            2015-12-03  1010  		switch (val_endian)=
 {
afcc00b91f1865f Xiubo Li            2015-12-03  1011  		case REGMAP_ENDIAN_=
BIG:
afcc00b91f1865f Xiubo Li            2015-12-03  1012  			map->format.format=
_val =3D regmap_format_64_be;
afcc00b91f1865f Xiubo Li            2015-12-03  1013  			map->format.parse_=
val =3D regmap_parse_64_be;
afcc00b91f1865f Xiubo Li            2015-12-03  1014  			map->format.parse_=
inplace =3D regmap_parse_64_be_inplace;
afcc00b91f1865f Xiubo Li            2015-12-03  1015  			break;
afcc00b91f1865f Xiubo Li            2015-12-03  1016  		case REGMAP_ENDIAN_=
LITTLE:
afcc00b91f1865f Xiubo Li            2015-12-03  1017  			map->format.format=
_val =3D regmap_format_64_le;
afcc00b91f1865f Xiubo Li            2015-12-03  1018  			map->format.parse_=
val =3D regmap_parse_64_le;
afcc00b91f1865f Xiubo Li            2015-12-03  1019  			map->format.parse_=
inplace =3D regmap_parse_64_le_inplace;
afcc00b91f1865f Xiubo Li            2015-12-03  1020  			break;
afcc00b91f1865f Xiubo Li            2015-12-03  1021  		case REGMAP_ENDIAN_=
NATIVE:
afcc00b91f1865f Xiubo Li            2015-12-03  1022  			map->format.format=
_val =3D regmap_format_64_native;
afcc00b91f1865f Xiubo Li            2015-12-03  1023  			map->format.parse_=
val =3D regmap_parse_64_native;
afcc00b91f1865f Xiubo Li            2015-12-03  1024  			break;
afcc00b91f1865f Xiubo Li            2015-12-03  1025  		default:
8698b9364710e7b Baolin Wang         2017-11-01  1026  			goto err_hwlock;
afcc00b91f1865f Xiubo Li            2015-12-03  1027  		}
afcc00b91f1865f Xiubo Li            2015-12-03  1028  		break;
afcc00b91f1865f Xiubo Li            2015-12-03  1029  #endif
b83a313bf252018 Mark Brown          2011-05-11  1030  	}
b83a313bf252018 Mark Brown          2011-05-11  1031  =

141eba2e006dd81 Stephen Warren      2012-05-24  1032  	if (map->format.form=
at_write) {
141eba2e006dd81 Stephen Warren      2012-05-24  1033  		if ((reg_endian !=
=3D REGMAP_ENDIAN_BIG) ||
141eba2e006dd81 Stephen Warren      2012-05-24  1034  		    (val_endian !=
=3D REGMAP_ENDIAN_BIG))
8698b9364710e7b Baolin Wang         2017-11-01  1035  			goto err_hwlock;
67921a1a6660d32 Markus Pargmann     2015-08-21  1036  		map->use_single_wri=
te =3D true;
141eba2e006dd81 Stephen Warren      2012-05-24  1037  	}
7a6476143270d94 Mark Brown          2012-04-30  1038  =

b83a313bf252018 Mark Brown          2011-05-11  1039  	if (!map->format.for=
mat_write &&
b83a313bf252018 Mark Brown          2011-05-11  1040  	    !(map->format.fo=
rmat_reg && map->format.format_val))
8698b9364710e7b Baolin Wang         2017-11-01  1041  		goto err_hwlock;
b83a313bf252018 Mark Brown          2011-05-11  1042  =

82159ba8e6ef8c3 Mark Brown          2012-01-18  1043  	map->work_buf =3D kz=
alloc(map->format.buf_size, GFP_KERNEL);
b83a313bf252018 Mark Brown          2011-05-11  1044  	if (map->work_buf =
=3D=3D NULL) {
b83a313bf252018 Mark Brown          2011-05-11  1045  		ret =3D -ENOMEM;
8698b9364710e7b Baolin Wang         2017-11-01  1046  		goto err_hwlock;
b83a313bf252018 Mark Brown          2011-05-11  1047  	}
b83a313bf252018 Mark Brown          2011-05-11  1048  =

d2a5884a64161b5 Andrey Smirnov      2013-01-27  1049  	if (map->format.form=
at_write) {
d2a5884a64161b5 Andrey Smirnov      2013-01-27  1050  		map->defer_caching =
=3D false;
07c320dc31d757b Andrey Smirnov      2013-01-12  1051  		map->reg_write =3D =
_regmap_bus_formatted_write;
d2a5884a64161b5 Andrey Smirnov      2013-01-27  1052  	} else if (map->form=
at.format_val) {
d2a5884a64161b5 Andrey Smirnov      2013-01-27  1053  		map->defer_caching =
=3D true;
07c320dc31d757b Andrey Smirnov      2013-01-12  1054  		map->reg_write =3D =
_regmap_bus_raw_write;
d2a5884a64161b5 Andrey Smirnov      2013-01-27  1055  	}
d2a5884a64161b5 Andrey Smirnov      2013-01-27  1056  =

d2a5884a64161b5 Andrey Smirnov      2013-01-27  1057  skip_format_initializ=
ation:
07c320dc31d757b Andrey Smirnov      2013-01-12  1058  =

6863ca6227598d1 Krystian Garbaciak  2012-06-15  1059  	map->range_tree =3D =
RB_ROOT;
e3549cd01347ef2 Mark Brown          2012-10-02  1060  	for (i =3D 0; i < co=
nfig->num_ranges; i++) {
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1061  		const struct regmap=
_range_cfg *range_cfg =3D &config->ranges[i];
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1062  		struct regmap_range=
_node *new;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1063  =

6863ca6227598d1 Krystian Garbaciak  2012-06-15  1064  		/* Sanity check */
061adc064adbbdd Mark Brown          2012-10-03  1065  		if (range_cfg->rang=
e_max < range_cfg->range_min) {
061adc064adbbdd Mark Brown          2012-10-03  1066  			dev_err(map->dev, =
"Invalid range %d: %d < %d\n", i,
061adc064adbbdd Mark Brown          2012-10-03  1067  				range_cfg->range_=
max, range_cfg->range_min);
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1068  			goto err_range;
061adc064adbbdd Mark Brown          2012-10-03  1069  		}
061adc064adbbdd Mark Brown          2012-10-03  1070  =

061adc064adbbdd Mark Brown          2012-10-03  1071  		if (range_cfg->rang=
e_max > map->max_register) {
061adc064adbbdd Mark Brown          2012-10-03  1072  			dev_err(map->dev, =
"Invalid range %d: %d > %d\n", i,
061adc064adbbdd Mark Brown          2012-10-03  1073  				range_cfg->range_=
max, map->max_register);
061adc064adbbdd Mark Brown          2012-10-03  1074  			goto err_range;
061adc064adbbdd Mark Brown          2012-10-03  1075  		}
061adc064adbbdd Mark Brown          2012-10-03  1076  =

061adc064adbbdd Mark Brown          2012-10-03  1077  		if (range_cfg->sele=
ctor_reg > map->max_register) {
061adc064adbbdd Mark Brown          2012-10-03  1078  			dev_err(map->dev,
061adc064adbbdd Mark Brown          2012-10-03  1079  				"Invalid range %d=
: selector out of map\n", i);
061adc064adbbdd Mark Brown          2012-10-03  1080  			goto err_range;
061adc064adbbdd Mark Brown          2012-10-03  1081  		}
061adc064adbbdd Mark Brown          2012-10-03  1082  =

061adc064adbbdd Mark Brown          2012-10-03  1083  		if (range_cfg->wind=
ow_len =3D=3D 0) {
061adc064adbbdd Mark Brown          2012-10-03  1084  			dev_err(map->dev, =
"Invalid range %d: window_len 0\n",
061adc064adbbdd Mark Brown          2012-10-03  1085  				i);
061adc064adbbdd Mark Brown          2012-10-03  1086  			goto err_range;
061adc064adbbdd Mark Brown          2012-10-03  1087  		}
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1088  =

6863ca6227598d1 Krystian Garbaciak  2012-06-15  1089  		/* Make sure, that =
this register range has no selector
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1090  		   or data window w=
ithin its boundary */
e3549cd01347ef2 Mark Brown          2012-10-02  1091  		for (j =3D 0; j < c=
onfig->num_ranges; j++) {
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1092  			unsigned sel_reg =
=3D config->ranges[j].selector_reg;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1093  			unsigned win_min =
=3D config->ranges[j].window_start;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1094  			unsigned win_max =
=3D win_min +
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1095  					   config->range=
s[j].window_len - 1;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1096  =

f161d22081e9b81 Philipp Zabel       2013-07-23  1097  			/* Allow data wind=
ow inside its own virtual range */
f161d22081e9b81 Philipp Zabel       2013-07-23  1098  			if (j =3D=3D i)
f161d22081e9b81 Philipp Zabel       2013-07-23  1099  				continue;
f161d22081e9b81 Philipp Zabel       2013-07-23  1100  =

6863ca6227598d1 Krystian Garbaciak  2012-06-15  1101  			if (range_cfg->ran=
ge_min <=3D sel_reg &&
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1102  			    sel_reg <=3D r=
ange_cfg->range_max) {
061adc064adbbdd Mark Brown          2012-10-03  1103  				dev_err(map->dev,
061adc064adbbdd Mark Brown          2012-10-03  1104  					"Range %d: selec=
tor for %d in window\n",
061adc064adbbdd Mark Brown          2012-10-03  1105  					i, j);
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1106  				goto err_range;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1107  			}
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1108  =

6863ca6227598d1 Krystian Garbaciak  2012-06-15  1109  			if (!(win_max < ra=
nge_cfg->range_min ||
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1110  			      win_min > ra=
nge_cfg->range_max)) {
061adc064adbbdd Mark Brown          2012-10-03  1111  				dev_err(map->dev,
061adc064adbbdd Mark Brown          2012-10-03  1112  					"Range %d: windo=
w for %d in window\n",
061adc064adbbdd Mark Brown          2012-10-03  1113  					i, j);
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1114  				goto err_range;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1115  			}
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1116  		}
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1117  =

6863ca6227598d1 Krystian Garbaciak  2012-06-15  1118  		new =3D kzalloc(siz=
eof(*new), GFP_KERNEL);
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1119  		if (new =3D=3D NULL=
) {
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1120  			ret =3D -ENOMEM;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1121  			goto err_range;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1122  		}
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1123  =

4b020b3f9ba2af8 Mark Brown          2012-10-03  1124  		new->map =3D map;
d058bb49618482f Mark Brown          2012-10-03  1125  		new->name =3D range=
_cfg->name;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1126  		new->range_min =3D =
range_cfg->range_min;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1127  		new->range_max =3D =
range_cfg->range_max;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1128  		new->selector_reg =
=3D range_cfg->selector_reg;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1129  		new->selector_mask =
=3D range_cfg->selector_mask;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1130  		new->selector_shift=
 =3D range_cfg->selector_shift;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1131  		new->window_start =
=3D range_cfg->window_start;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1132  		new->window_len =3D=
 range_cfg->window_len;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1133  =

53e87f88b14c011 Nenghua Cao         2014-02-21  1134  		if (!_regmap_range_=
add(map, new)) {
061adc064adbbdd Mark Brown          2012-10-03  1135  			dev_err(map->dev, =
"Failed to add range %d\n", i);
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1136  			kfree(new);
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1137  			goto err_range;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1138  		}
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1139  =

6863ca6227598d1 Krystian Garbaciak  2012-06-15  1140  		if (map->selector_w=
ork_buf =3D=3D NULL) {
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1141  			map->selector_work=
_buf =3D
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1142  				kzalloc(map->form=
at.buf_size, GFP_KERNEL);
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1143  			if (map->selector_=
work_buf =3D=3D NULL) {
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1144  				ret =3D -ENOMEM;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1145  				goto err_range;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1146  			}
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1147  		}
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1148  	}
052d2cd123e7e36 Mark Brown          2011-11-21  1149  =

e5e3b8abeda1cf4 Lars-Peter Clausen  2011-11-16  1150  	ret =3D regcache_ini=
t(map, config);
0ff3e62ff119f2b Mark Brown          2012-10-04  1151  	if (ret !=3D 0)
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1152  		goto err_range;
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1153  =

a7a037c837cb0f9 Daeseok Youn        2014-04-01  1154  	if (dev) {
6cfec04bcc05a82 Michal Simek        2014-02-10  1155  		ret =3D regmap_atta=
ch_dev(dev, map, config);
6cfec04bcc05a82 Michal Simek        2014-02-10  1156  		if (ret !=3D 0)
6cfec04bcc05a82 Michal Simek        2014-02-10  1157  			goto err_regcache;
9b947a13e7f6017 David Lechner       2018-02-19  1158  	} else {
d1cea9a7b51682f Charles Keepax      2020-09-17  1159  		regmap_debugfs_init=
(map);
a7a037c837cb0f9 Daeseok Youn        2014-04-01  1160  	}
72b39f6f2b5a6b0 Mark Brown          2012-05-08  1161  =

b83a313bf252018 Mark Brown          2011-05-11  1162  	return map;
b83a313bf252018 Mark Brown          2011-05-11  1163  =

6cfec04bcc05a82 Michal Simek        2014-02-10  1164  err_regcache:
72b39f6f2b5a6b0 Mark Brown          2012-05-08  1165  	regcache_exit(map);
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1166  err_range:
6863ca6227598d1 Krystian Garbaciak  2012-06-15  1167  	regmap_range_exit(ma=
p);
58072cbfc522c25 Lars-Peter Clausen  2011-11-10  1168  	kfree(map->work_buf);
8698b9364710e7b Baolin Wang         2017-11-01  1169  err_hwlock:
a1a68fcaf165a6e Baolin Wang         2017-11-20  1170  	if (map->hwlock)
8698b9364710e7b Baolin Wang         2017-11-01  1171  		hwspin_lock_free(ma=
p->hwlock);
8253bb3f82554ce Bartosz Golaszewski 2017-12-13  1172  err_name:
8253bb3f82554ce Bartosz Golaszewski 2017-12-13  1173  	kfree_const(map->nam=
e);
b83a313bf252018 Mark Brown          2011-05-11  1174  err_map:
b83a313bf252018 Mark Brown          2011-05-11  1175  	kfree(map);
b83a313bf252018 Mark Brown          2011-05-11  1176  err:
b83a313bf252018 Mark Brown          2011-05-11 @1177  	return ERR_PTR(ret);
b83a313bf252018 Mark Brown          2011-05-11  1178  }
3cfe7a74d42b7e3 Nicolas Boichat     2015-07-08  1179  EXPORT_SYMBOL_GPL(__r=
egmap_init);
b83a313bf252018 Mark Brown          2011-05-11  1180  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8031382859689261089==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICL+qY18AAy5jb25maWcAjFxJd9y2st7nV/RRNsnCuRosPee8owWaBJtIc0AAsAdteBS57ehE
lvI03Nj//lUBHACw2LEXiRpVxFio+mogf/zhxwV7e336cvt6f3f78PBt8fnweHi+fT18XHy6fzj8
7yKtF1VtFjwV5hdgLu4f377+5+uHq/bq/eLyl19/OX33fHexWB+eHw8Pi+Tp8dP95zd4/v7p8Ycf
f0jqKhOrNknaDVda1FVr+M5cn3y+u3v36+Kn9PDH/e3j4tdfLqCbs8uf3V8n3mNCt6skuf7WN63G
rq5/Pb04Pe0JRTq0n19cntp/Qz8Fq1YD+dTrPmFVW4hqPQ7gNbbaMCOSgJYz3TJdtqva1CRBVPAo
90h1pY1qElMrPbYK9Xu7rZU37rIRRWpEyVvDlgVvda3MSDW54iyFzrMa/gMsGh+FDf5xsbLn9bB4
Oby+/T1u+VLVa161sOO6lN7AlTAtrzYtU7BnohTm+uIcehlmW0oBoxuuzeL+ZfH49IodD5tcJ6zo
9/HkhGpuWePvjF1Wq1lhPP6cbXi75qriRbu6Ed70fMoSKOc0qbgpGU3Z3cw9Uc8R3tOEG21SoAxb
483X35mYbmd9jAHnTmytP//pI/XxHt8fI+NCiAFTnrGmMFYivLPpm/Nam4qV/Prkp8enx8PPJ2O/
eq83QibkmLLWYteWvze84cSgW2aSvLVUf52JqrVuS17Wat8yY1iSEw83mhdi6T/HGtBKBKc9R6Zg
KMsBEwYBLfobA5dv8fL2x8u3l9fDl/HGrHjFlUjs3ZSqXnqX2CfpvN7SFFH9xhODV8MTKJUCSbd6
2yqueZWGOiCtSyaqsE2LkmJqc8EVrmlPj14yo2DrYZ1wG0Hb0Fw4CbVhOMu2rFMejpTVKuFpp21E
tRqpWjKlOTLR/aZ82awybQ/n8Phx8fQp2uZRF9fJWtcNDOSkIa29YeyZ+SxWOr9RD29YIVJmeFsw
bdpknxTEgVmFuhnPPyLb/viGV0YfJaI2ZWkCAx1nK+GYWPpbQ/KVtW4biVOOFI67M4ls7HSVtuq9
Nw9WYs39l8PzCyW0YJ/WoOQ5SKU3ZlW3+Q0q89IK43BfoFHCZOpUJMStcU+J1N9I2+bNV6xylKFu
pv5xT+bYPyMV56U00FUVXPq+fVMXTWWY2tMKxXER0+2fT2p4vN8p2MX/mNuXvxavMJ3FLUzt5fX2
9WVxe3f39Pb4ev/4Odo73HaW2D6cwA8jb4QyERkPk5gJXgAraUFHvQXUKaqThIOGA7rxh4hp7eaC
3AQUCAQjmt4iLcL27kS+Yy/snqmkWWhKtKp9C7RxKfCj5TuQIE/UdMBhn4macO720e4mEKRJU5Ny
qt0olvSEcHNGUmuRUrkktyRcaghSlqI69yYn1u6PaYs9Mn8GYp3DmHAfSMiE/WdgNkRmrs9PR+kV
lQGIyTIe8ZxdBNqhAfzoEGGSg2626qaXdn335+Hj28PhefHpcPv69nx4sc3dYglqoGd1IyWgTN1W
TcnaJQOUnASia7m2rDJANHb0piqZbE2xbLOi0fkEAcOazs4/RD0M48TUZKXqRmp/KwEDJCtSyh2z
24VjDFKk9DXp6CoN8VdMz0Ct3HB1jCVvVhz24BhLyjci4cc44HbilT+6FK6y44OA0SUZELmByQbF
Qogk7GCyljWcBqpygAqBWnZihijeDkJ2DwY10zA8qGDAGjPnoXjB9sTwy2KN22NNu/LxEP5mJXTs
LLwHSlUa+QnQ0LsH43jpBFv7tN0NMRf7TD3p5T3NGrsEy7pG84N/08eUtLUEwyBuOEIre561KuGa
Udg45tbwh6dnAcOYIv4N6jjh0qI5qwBjZJFouYZxC2ZwYM8oyWz8Eav0EvC/ALDtQUgNAl8iKhmh
VCQMHYFYV5azymGKyEtwGIK07Kgbx9E7XVmVwncsA2MdrZQ8jiUDBJs19CQbw3dj7/YnqBJvk2Tt
I0gtVhUrMk987WqyQD4sKswo50vnoOgCT0bQLp6o2wZWT8sXSzcCltRtPbWTMMqSKSX8s1wj777U
05Y2AMlDq903vM1GbIJjBCk6cu6j9eh9SuT/TQQICMXMEsltsl2gXRnXAQNWAKad0uqvpuaeW2K1
YtQGj/M05Wl8P2DwNsb/thHm1W5K60yFYnZ2GigHa2+74Jc8PH96ev5y+3h3WPD/Hh4BajGwxAmC
LYDGI7Iih3XTJgfv7Pl3DuMh2NKN4iAyfdd00Szd2H7MqpQMjss6IOM9L9hypoOQrabZ2BKOUa14
Lw7eZUIa2t1CgCunQF3U5RwVPWrAkd5J6rzJMsBHkkHfhPsLEmp42YLjxTAGKDKRsNBLBzyXiSKA
PlabWhsZODlhsK1nvnq/9L3UnQ2OBr99K+fCgaiyU56AC+5NtW6MbExrjYS5Pjk8fLp6/+7rh6t3
V+/9YNsaLG+Pqrx1GpasHQye0MrSw9L2VpUI5FSFsNc5rtfnH44xsB0GCkmGXlz6jmb6Cdigu7Or
2EUOhNBrHJRPa0+EK8pbZ4VYKowHpIg7otWiDkFXDjvaUTQGqAeDvjwyuwMHCAgM3MoVCIuJ1Ijm
xqE15y6CA+I50BzQVE+yagi6UhixyBs/7hzwWVEm2dx8xJKrygVxwJRqsSziKetGSw6bPkO2atlu
HSt6ODuy3ICn3gJMvvDCrzaQZh+eQ/edAoOp95prMCSaVXBNWVpv2zrLYLuuT79+/AT/7k6Hf3Sn
jY3EeeedAXDgTBX7BCNY3NMTcuX8pAJ0XqGvLyPXBObA3R3BE+SJ0xFWf8vnp7vDy8vT8+L129/O
U/b8qWhTAl1XSkLV4f3PODON4g6I+48gcXfOJBmBQWIpbajNk/C6SDPhO1uKG0AjQZoBn3QCDrBQ
FfGIfGdAGlDCjgEk5MT7VbSF1LQThSysHPs55uiIWmfgiIuZhQ5n3MV9MyaKhvJF6hIkLwPXYLj/
VMh3D5cH4BAA51XD/QAcbCfDWE5gx7u2qQvlTTDfoFYpliAyYDg6gRl3ggwFrcHmRuO7mKZsMLAG
kliYDkmOk9nk5P4Nk4xiSxRi7ln78MDQyW+wq3mNiMJOi8aRiaqOkMv1B7pdajoJUCI8o5MgYNfq
kljAoMZlEwq1Pe8KzGSno12M5MpnKc7maUYn0SUp5S7JV5F9xujsJmwBSybKprS3KmOlKPbXV+99
Bis64IOV2rPgApSmvfxt4K0h/6bcTdTCCEAwBohOHy94GCPE8eGquItJuY0dHW6lh+C6xny/8oFO
35wAKGSNmhJuclbv/IRELrmTPxW1cfAS0doqEwDktBTkua8YCKeoAYdQgWdr9TQiP7B7S76CGZzR
RMygTEg9oIwJYwMszc42TCdY4cHcZYv6OJK7mmhUXAFEc+55l2C1MQBM8UTSk/BYB0MTBvoKvmIJ
FRfpeNxBT3oLz7dvxEyNzsFAEIN1+aiZkUzOAWQWo2JzltDzLb48Pd6/Pj0HIXPPc+kshWLSm6xP
t2ai3nLlA+iZAcLJn10tybSevUWdw9kJoAgTHO7kZIH/4YpSNOKDh6ZKkcDNc2mwUUX1jdMrR/DA
Kim/e6DD2TgdlgXhGXtGvuLoDLiIDvnSopmwLRUKDq1dLRFr6bgL5soWtBFJADzwOMDSwg1K1J5M
qDjkZdGHY2QErhzIEy/O0a3+6k06ZhiLiKMjRRlWUeC9KHoDj9m9hiNKPNx+PPX+hUdtI5ngUdQa
IwKqsZGwGcFxmU8Mtm9RkY9HaRSFJ+xcY1fUwhbwZ8KWphRRi7sa40qNywu3a74PzoRntLbUPEFv
iaTlN+3Z6SmFgG7a88tTv3touQhZo17obq6hm8GptAgsV5gr87te8x2nEKxtR2eJ8qEcUTZqhR76
ftIfRtXoQKpiOm/ThoTbMt9rgUoc5F6hZ3EWOhTg82FIIBRmd7IYasXoVnh61hWzT/kmuh8F/MxV
BaOcB4OkezDpgF+6MwcPFAwFNZxjmKeMA0mW2hz86dfbwfe3tiPWgYH2ill2dVXQmdWYE/Oz9O6X
qfWMwdRRAAQuuchgyalpJ4l26x4X4LlLTCAFhuCIzzURHNiJNlJ2luZUVL9zeW1k0cT5qwmPgr82
sXh2XFoW4GtItFymQ9IEFzrM1kUvxUr1NsjZz6d/Ds8LMG+3nw9fDo+vdl0skWLx9DeWxHn+ZOeh
e/GbzmXvElBTgl4LacOfnlSWrS44l0EL5m761tGZKMHpX3NbQEFdojLoog8I+o+zdIOZi3TWZwIe
rBubrqyfJdltl7g1lDYBclIEemf7u8MUoDozkQg+RpdnDVrvZuIxeOc5+dVfCKspNNiJet3ISADg
wHPTlRfhIzJNok66aKObJFpi6GoMx3kuF/Da7ViR7qzrSyaqjRSXm6n0YazjDcXAtim+aUHUlRIp
9yNB4SxA73bVO3PzYPEil8yAkd7HrY0xIRyzzRsYvZ7rOmPTBwyjE4puz0CA5zqzrpriICJaR3Mb
PazEHsosOSx/CYmTmY6PsdVKcWvW5ibXAe6o76TR4BC3qQbtaa3mmPQctZ/bFNQ8jQSFk8YTjGmE
lM1vqExQeOq5yADOsQZvEQwAnRO3LJ3q7bTs3Bb0XKLuXKuwE72kY07u2Zkss7+LJTd5fYRN8bRB
BYY5hC0DNzy2jb7VcpIvuaclwvYuHxkOgQRyAqk0mdMKdKwHwUMtQYYiBDs5CvibvKmIXFCdhr66
zsT1WBq1yJ4P//d2eLz7tni5u30IXLv+8oRBAXudVvUGqzIxOmFmyNNas4GM920mbmHpfXYQu/Ey
5GRfAS9upoYjoUEL9QhmG21ZxPc/Ulcph/nMlJxQTwCtq7HckGl+f9v+bb2z66QYh9XNnFG/lNkj
HOfty8ynWGYWH5/v/+sSmkToWFr9Ohs8lokN8uGo8wHmTpkfZQKMwVOwtS6apURF2Rg74nsXFQWc
2i/r5c/b58PHKSYL++2LjcdyOuL+DNskPj4cwtskoqqHvs3udgGYlrT8AVfJq2a2C8PpmoGAqQ84
k2rOkfrgdLxYt6IBsP8rtLVbsXx76RsWP4FtWRxe73752YsggblxAQwPH0JbWbofXnDGtmDs9ew0
D0AjsCfV8vwUlvh7I9Sa3AWhGSAS2qIgLS0ZRvgoWwXwv/LSYVYq9joLpGFmnW4P7h9vn78t+Je3
h9tewsaxMUI8BK9mxXt3EQXQ+3EnfdvOs/vnL/+AUC/S6d3kKRWiyoQqrREEmx2ENLJtm2RdWQ/d
2nuEfo6qXhV86NM/rY6EKQEbK7VghZgPz8SQ2OvvqTl8fr5dfOrX5vSOX+I4w9CTJ7sSWPL1JijB
wfxJA979zeRgerkAKLbZXZ75WVGNec2zthJx2/nlVdxqJGv0oFr7UoLb57s/718Pd+j6vvt4+Bum
jrdroptcDCQsfHFRk7Ctz6SgUvQQeu2KHIKj6du6KhFb9yULvpuDRF4fcQ+AhQboMQZ1XPKWlPHf
mhJj8ksyp2FHGz28prJBFyxLTBBvR04ZJrewhNeIql3qLYvfJxKwP1iEQGTu13F62bVigpUi1JJu
77rBt60yqg4vayoXAARfDH0M6kWRDQ8L3MZ3WGyPObijERE1GGJzsWrqhiiJ0LDD1g649zmIgBxg
D4Oxm67gcsoAgG8SsQqIXSy6nGy6m7l7bc1VvLTbXBhbxBP1hcUIeoig2Zcf3BNxl7rEYFP3oll8
BgCd4X5imARz/J2koIaP+YLCsPB48KW42QfzbbuE5bjK2YhWih1I50jWdjoRE+IzzN03qmqrGjY+
KMuLC9IIaUC/BZGMLf11JQz2CaoTYvy+tkx1W4TxVOrUxqt5nOrXBA42u2nBCwZXt3NKMZhFkrFS
n2LppMvdBlce36Vs48l0KqETLozHRRzdcy7FN0NL6yYIr4zr7GLwXeEPyYG7WMCRR8RJkUnvi31X
Oy6oriartRdFmBx0nDs9WxARHzGqA74zVmWsxaSXmVdaYn157HUWJ+41ilMZl1P22qrCLBEq7j5Q
+r18rWzIPpGOFZFxOM6WMVkihmzB6ir6KOvMaiqzn6wj7dNaPMHCQE9U67TBMCAaF15kVtYJHWhJ
fQifGjsoo4sY+E4YWjmHT42VeaN89e+/Ta0IzFS4YPZQEDhydKg4VG9dZd7F+VK4ZD+1ENx+12UA
mobWY+W7INIC7mj3Qqra7nzhnyXFj7sjIR+nSOPUJWwJgO4uERTajgFBgJmjYALqW7+KNn60q07u
06oDukvqzbs/bl/Ay/zLle3+/fz06T4MuSBTt3KiV0vt8VVUcx/TSFfh2ByCTcKX6jEwJyqy2PVf
EGrflUIECdrHV0q2dFxjKfNYi9GdlUanwhW6xpfOX2nHbd9MhcOYCQ13XE11jKMHDsd60CoZXmQn
neZx9sQsuzWRr3d4LEGKzGtHV2KmV/QozunXvCOuy6vv4Lr48D19gatzfCEgpvn1ycuft2cnkz5Q
qSg+U0bY8WCh6BbAk9ZoiYaXllpR2pQNMXhTwV0FVb8vl3Whp+raAJgYUzfjmwrFTNpAV2djJ03l
vt4A5gDMLArTJAM4ZpNMjWgV/F1Cl9gX3FPbjU24zbOoLcWA178CEcTkTcGkxN1haYrb2UYRvlFJ
9u9FtEue4f8Q6YWveHu8LuW7VdC5D27G3KPVYvzr4e7t9faPh4P9GMjClu68ek7pUlRZadAKjn3A
j9Aj7Zh0ooQMX391BDh/uo4Qu4mT/oN2mpubnXh5+PL0/G1RjtGqaf71WKXKWOZSsqphFIViBugF
NoRTpI0Ls0yqaiYcsW+Cb7ev/ERkN2Oh64Iy/xhkwe7st0Kq4Pzn8uRhezelWXIf666jL53MZ9i7
rLrNqLvCvPfRQ0vUBP5SugYHTSJfmWqz6FFxvJsBXPUz9MPj6DK3UZE6ll3YO9aa+H0OV4NbI27y
Qi/ak4B+S+wJu48ApOr6/emvV8HVm694DneDqITOt+BXatiQaVHfwEMh6mPvZYG2zAG8BQGT4DWE
dRAfS8DVqWyhLRW1Dgvj4eeRvONAJRNZSMV3KPT1/3gGAyR6hPHEUzeyrgOIdLNsaCRwc5HVxQxJ
u7eujhQo2xBlH1Lyx7ORFiuGvfN1DBFL+6JK6NK4NwxsPb3fsWvBlyA3UWJlUNpYGr+JvMre0mj3
0QYYqs0KtqJMjezq0vqrwJWtB8YPDgSgs5FgW6okL5k6CvdxcdajYoWPJ+eV8ih9A4CuDq//PD3/
hemmUXV7pfHJmlNZRTDhnguAv8DuBGJs21LBaNE0xcx7D5kqrUUlqTBvrO2jyk3dkkYpkS7Mit8S
oVMTciy0scXGVI4ImGTlf9XJ/m7TPJHRYNiMFoGuJewYFFM0Hdcl5MwHjxxxpVBmy4YKGjuO1jSV
83DG+sY9avZ6LWaCw+7BjaFT6UjN6uYYbRx2JgGEfIx+7cLSAIjOE4WMqzN96rBcvxEFLmoyieyb
w+6bVM4LqOVQbPsvHEiFc8FYEl39h6PDn6tB2ojlDDxJs/RjI7256+nXJ3dvf9zfnYS9l+llVM85
SN3mKhTTzVUn6+iq0588sEzu/XgsbW7TGT8PV3917Givjp7tFXG44RxKIWkPy1IjmfVJWpjJqqGt
vVLU3ltylQI0tiDO7CWfPO0k7chUu4ROV9J2hNHu/jxd89VVW2z/bTzLBtaBRvPumGVxvCM4g0lW
aEQBEgRr7jH8YBJGbWPrNOEBqGejXGDgSjn3bj0wu8gvSV3KI0TQPWkyM0+s4ExmtLGa+XCJmfvY
GjP0e3zF+cwISyVSEhO6gDvqDR3guK6J7GxTsKr9cHp+RtdopDypOG3jiiKh3w5jhhX02e3OL+mu
mKS/wyLzem74q6LeSkan3gXnHNd0ScdHcD/mv0CTJtSb72mF2SDw1sCZv/7iHQYcH0NXYUN2Vkte
bfRWmITWZRuN3x2b+SQU3iL8guWskSjljGXEFVaaHjL/f86upblxHEn/FcccJmYOFS1SL+rQBwqk
JFh8mYAkqi4Md5V72jEeu8J27/T++80ESBEAE1LFHqrbQiYexDMzkflB+MUf3VKQVb0c2RSUaYGb
vI/roZb+Cgrmwlz1+oIGw0EekJE9LjEDD8tiITi15aqTtUE179zaaB/rB0t86XAszCJMmfXu8+mj
QxqzvqDaSwc/zF5ndQmHZllwx4n0Ij+PincIpqxsDFqc13Hi6xfPMlh73EE30EG1bzfatHtGhVyd
eJ1m+tp+qHizxWUWjPrwQnh9evr+cff5dvfbE3wn2nm+o43nDo4XxTBYcvoU1FiUSRLhBXQcvxEv
dOKQSu+7mz0nbb04KitLOcbfyh7AS3ebXF3DY2Ix9yA5pdUOHc3oWbHxgGwKOLgy+rxW8umGplEH
b79JIdQA6vbD18KSgeZlmTVuaJpAqyTlwCN3EnTwfu9x77oG8Bc1zsnT/zx/M92VLGYujMu28S84
e9a42HPL1qMo6BxGZdDOPSBmmpc7ilQQ96hQiqEPOz86QE6rXyBZGZ8cjzODGgsrxqJLMcLorLIU
7bqHq82GxqWfYqYxqCxGUOBpwUI56glKwkWK8sVze+XKolCe5/JAnZlIQmshbhud07NbLi/pQwRp
MDX8tNjZ/W1qWCUkPq9qUecTMeytnUkU/f/cjQzTvr29fr6/vSAE3+Az203/j+d/vZ7QNw0Z2Rv8
If788ePt/dP0b7vGpg3db79Buc8vSH7yFnOFS2+6j9+fMCJXkYdGI5rnqKzbvBePUboHLr2Tvn7/
8fb8+mkZdnD5FolyoiEPQSvjpaiP/z5/fvuD7m97vp06SUWmzFu+v7RhNrDYxK6rWM547P5W95Ut
48bugtm0Hblr+5dvj+/f7357f/7+ryertWeM0afnabJYhitafI3CyYqWreu44o4YMPghPn/rduK7
cmxsO+jr712aVeTGD+KczCvTWbRPAXFGY7MOlh8ZF0mcOaGG/YfVuqaLa6oC5uz76uLM+fIGU/B9
ODI2J9XR5j0WXsTEgzvq3wzTxIVbu0KNv4rgpO4yB6b+3By7nXYtvQhCGgzteLnYMmyx6iaUpjmp
hoaFgDtJzenzuCOnx9q+UdfpKlJP5231fQ2teyJbrO4WO2bl6njFQK7ciw6y9EBoI/l4yBB5aM0z
Lrl59tbp1rKI698tN3FZuzRhOrB0aXnOy3FmE7K6z8yY4d+NfpTKdyhBFNaN7cOKxE1aMG3WT8k9
w7OELv7w35WsY62pfMfH3umGa3mfxZAUSxDd2Eg36Lu3IGdnbgNWwk81omJ8Wj2+fz5js+9+PL5/
WBIZZorrJWLM2PcBSOhjgxWRbgCGXSnP774AgqTdSNVNoLp0/xJ4C1DewMqRJx19m82IflXj6Od+
nx99sOqHA/wJxyXC5mpYPfn++PqhXe3vssf/dY4UrLQsK9+XYzs43j7C1NK6b7+Z1XH+S13mv2xe
Hj/gpPnj+YdxYpn9u+F2j92nScqctYXpsL4umAr2CG042hiU7dRxfjG4cFWs42IPalIid21gF+5Q
w6vUmU3F+nlApIVEGkYQ4QMhI0qcJ2I8l5ECJwolr/Xkg+SZM+fi3EkonYR4LdLu2Opxo/3DpcWw
xx8/jMgopagqrsdvGOXujGmJ2luD/YbmR2dJ4EW0c7VoJHe+erRNx2DbVghgkyTUwYB8Ys3abdM4
350ny0Wju8MqlbMdJntrTcU6vEZn+2gyu1qCYOsQ7yc9lidkAb3y8+nF8z3ZbDbZNqNOY7QeoGko
onnJOpjtWLcFGdKrSshiqSfTIGjfmAcatfvp5fcvKFw+Pr8+fb+DorrtnhJaVUU5m88DTysQ11J1
nPvxF0J7qrlMNfYldUdpM4NK4yxvtqvC6T6cL+x0IWQ4z9xaRQZd4uuw3WjtwT83DX63spQI6IEm
HNOLoqOC7CA6oMYgjDqF6vnj31/K1y8Me3tkXLA7pmTbKXko3B4ZbecDGdZe0pjixOGoo6FICx1w
aZ8YOrkbET08ni7rWUfY+SZRDxlZRdjgqbD1j4niShlDzWgX57ZFxcPQipy5e+qpLazQUjfrWsF/
6LPv8b+/wKH7CJrVi+rLu9/1tjook+6QqZKSFOOAri5qPQ6xx/514cgb7kGu6zlw/7zWY2NI7Qsp
rhHvsv/Y/PnjG/k1+B/B/TuiYoIhL6mncIY+4WJfFmzHRzPAIWvh4Npt77VMyvVweDmLYl2vpZrI
ziZR8fayBHpzNS4f1SdZhSfU3/X/Q9CG87v/aCcRz06oM1BL93ZRo2bZgA5GsnLQnKnLRHy2ixwi
ZNVnhKj8c9Lhuga+ifUfSLBMpCh4S204GG6INgSzC1NSMZRCXfiRLonSwU2/EuVUotTFHMa/A+Dp
IVM/3769vZio1kXVgaroTfKYp5Qtykq/LBFDR+q7Li0EdH6bcTHNjpPQDJFI5uG8aZPKtOUaibbC
aBIsrRH06fzc6YeDBWWdY6CZ504RFHiPECP5JlcnANGnnInVNBSziSEGg0qZlQKxIDHonjNbR9+B
3pqRoClVIlbRJIxtszwXWbiaTKZU5YoUWsBgfd9KoM3nNEJYz7PeBcslBRTWM6gmrSZm5EXOFtO5
Id8nIlhE1mMNsBIkerWBLjMlnlDoq+jFq34ADOug7426BpG8m1Ykm9SGbj9WccEp1z4WustDp8AE
gfrjug0Du4+0b3RaoUA7WEj7gVXpbSxDQxEaEuejRA07NErO42YRLcfsqylrLPeZS3rTzBbE53V0
0M3aaLWrUtGMykzTYDKZmXu083VG16yXwWQ00bto7b8eP+7468fn+5//Ubj0Hc7CJ+rQWM7dC8hV
d99hvT//wD/N7V2iKkdu7f+PcqlNpNsVhvtKdOBQaImVx6elQ/Gjt/YLFf7dYJANzXHUVs5jTlwf
8FdUdnKYsH+/e396UQ9ymtZ4uxKFk+45qBjfuMS+/rJqnTMFksgxuNYcwwqVFqcH+ltTtqOvoNH7
H8aCYSyrT7JDllqK5ic4DoK+S93F67iI25h+Kss6gqybQJ5cIvYFeiB0+sBo2SOx1RAjgzpBZDDM
ywfh4AzogU/T9C6YrmZ3/9g8vz+d4N8/qZHf8DrFm3XadN0RQZoRtP3rajVGx8YMpliJ6IvK/EtN
I1DMtY+yYclQnhbOy0Lrskh87lbqLCYp+BnbQ1zTd3bpg4JsuOKXK9PYI3DFDF2Y6LVbeUnHxkdB
Hc1jRl/DOj8ktFPW1uOsBe0T7iXV8F3wlyg9PgDyQDcQ0tujGhn13qYn9zGVHo8j5ffQ+tyqiiz3
QVfVritYr7J/vj//9ifuJUJfucVGqKGlA/T3oT+ZxfBJwPBKaU/MI8gQsN1MmW3pSjP69b3uMm/K
5kvaK2xgiOhruSNIEyntfCLP1a4k4UaMlsZJXElbnOmSFOjphpNip1nANrXXYiqDaeDz2e4zZTFD
jY5ZpiWRgU5KXjZYWWXqQgGmjvTlHsRS3PqIPP5qBvJYJMvIAj+jIAha30yucD66ADv2YBY5861z
xAdqtuQlmNkk2JkKyS13yvjBAy1j5qsZ/Yk4lUsb0llmPj/KLPAS6FWPFN/w3Jonh7qs7e9UKW2x
jiISY9jIrF9WtRfiekavszXLcY+lt5910dCdwXzzTvJtWdBLHguj16vG93SVZzMjpZTYH8wcmMZ1
Qd1gGHkwgwMRB6cD5ThjZTryg9Wvcnco8DobOqStaH80k+V4m2W99exqBk/t4cn4w8H1SCC+Ypdm
wva265JaSc/xC5ke2guZnmMD+UiZV8yW8bq2hWcmotVfN+Y7A0nV+hp3WySyqKBGO76uafHlRVqU
KsjIKKPAxD5KdNBKxqmIFjNX59U3VJSFtLO2gMH3PHJolIcYaKl1ZbNOw5ttT792xs4xaXO451JY
eHndZr7Jj/dBdGMb00BlZMm7Q3wygUANEo/CuXmPZpK6hxyGoaaB2zF54vJNPErlllZvIN2zXHnj
y+KeYQNl5q2d3knv8xtjncf1MbUhLPJj7vNKFvstXb/YnylEArMiqCUuSvsmMGtmrcfxGmjzkTXD
pIrTVfLmdKM9nNX2JNiLKJrTO5cmQbG0PWIvvkbRbKQE05WW7p0AHCBhdL+gjX1AbMIZUGkydOly
Nr2xflStIs3pdZKfawstF38HE884b9I4K25UV8Syq2zYyHQSrZ2IaBqFNzZn+BOfR7cEVxF6Zumx
IUNp7OLqsihzelMp7LZzkClThBsAWT1HLzhX0hmXEE1XE2K3ixuvipaGe68Npctduboa0fIjnNvW
eaRATxJH3B5nLPfWNyNc842zTwf6Ql9seeGYyEEdgDlOfso5RXe6Db8haldpIRC7ybKklzfP44es
3Nrw1Q9ZPG0aWsx5yLwCKJTZpEXrIz+Q13RmQw5oN8stGe+BoT3XF4NX5zcHt06sT6sXk9mNVVOn
qMFZokEUTFeeCDgkyZJeUnUULFa3KoN5EAtyRdUYEVWTJBHnIJVYTuQCzz9XRSRypiZeoEkoM1C9
4Z/9ZJ0nZgPS2w0O1405KXhmQ+ILtgonU8r7w8plrQ34ufJs5UAKVjcGVOSCEfuKyNkqYB734rTi
LPDVCeWtgsCjUCFxdmtnFiVDN7qGtuQIqQ4fqwtkDovgJ4b3UNi7SlWdc5jQPsEWNmdab8CossJz
9nDy1TOjEeeirIT9NlByYm2TbZ2VPM4r091BWtuqTrmRy86BcNsg6WBkrPDE3krHHDIu82ifCfCz
rXfc86gMUo8IyMZJOA+j2BP/6oAo6JT2NPdNuAvD9Jb5Qd8WmoV394dxw/3baMeTZdDXNweo4bVj
3+jWExLCir612SQJPZdAqqv8sAhi7b7qNAhcIG1fe60Txt4Xh6aFWBRPV6t57glKqOjtXtB65UGs
u6BHdatg9g6SQLelex6Je1DGPIY9JFfpNhaeyzCk1zKLAs+l90CndzmkozAceQ57pMM/n/yFZF7t
6E3p5Gz8fdhke0ooayuyD/bhXB/AFE1a5lv4ee1FELmbjyREstDchLgwSYZBj6D25g+C5Lx76JJq
wZ3YK7y5pedizUVuR3AThQ46KUVMQcL19qmpYBHkOrYDIC3aRViiiILTBBMz2UyXHv6v58SUkUyS
MkunhW1P6nakOj6zcWxAqqJv707PGED7j3Gw8T8xSvfj6enu84+ei3DfOvnu03JUV2hbXWfRaf0w
MbCh+ZzocHuhwlUHUV8kxPXr648/P723vLyoDjaKBya0WUouUU3cbBC9yg2A1jQMM/dFw2sODca2
z2NqF9UseSxr3uy10/gliuEF32d4fv18ev/90XKs6jLhm8BQ9TBJ7HQMMj40XqqAEwFUl+bXYBLO
rvOcf10uIpvlvjzrqp2PTY9OZzhU/XqYMU6+KGKdYZ+e16UVp9enwI5ZzedR5KWsKIrcr61rpgvl
QQYTz4li8Sxv8oTBgpJYLhxJB+tQL6I50cRs72uix6HVoqvpmFLdJVm8mAULmhLNgoisU0/Ma7Vm
eTQNp9SHAGFKEWB3WU7nK7o+Ru8TA0NVByGlSl04ivTkvGF2ISEgB5oCb9TRaZrXmfo33Tus92st
ErI8xaf4TLYJaoIBv5Zd5mErywPbQQrRnU03p910NOW1KaMGQO7Va1Xj1asW/pWtDFY9QjdR0HGa
QcEUWdurTlFyU8xSFpMoVQYPr6yz1SBtpSl3GIRdXMDRtCVp+zX8ICmdkEm0VaQ1jzM47kAGokSQ
7lNxSPQGaZQ/JKLndZXWdnikSY8TsYxmliOgTV5GyyXVWy7T6moRK/Sa+6liOt9auigUF9u88eBW
mpwH2IV4wzgVdGMyrg9hMAmmvhoV2RMkbfKhEIewi5wV0Xwyv1EpO0dM5nEwm9CDounbIPDSpRTV
yDGKYHF6/Rqr8OiDY9aZz0HZZE3i1WQ68zUPqXPqDsZiOhdxZZtjTPIuziuxo31WTL40ld4ZhY9F
I8iLWmy3ymnY1LlhM8mdkHmzD7dlmZCnmfVtPLHe4TRpPOMwKRtfO8RCnJcL+mbIaseh+Hqz6/Zy
Ewbh0tt9tDHHZvEOoNrb2lM0mdxureb9mekMJ3sQRBPqeLbYmJjr0aSIuQiCmYeWZhsE6+eVj0H9
8IxdkTZmcLmVb78034SydvG0GEEgWJ2Mz37KeTOhIQVNVvV3jYEdP8d6Im8/LDYMq51O500rBfO0
X23FNO2UyGjZNK5btcUCUhzpZWYyKXtPmVel4NK7LeYsmC4jKr7BLUrvDHST1ckdF/fcOyDIMfVE
eDhs3AOSM2qQPNRrSvZ2GdXCvtawJGc4VAGlIYxaV/ez2f8BibZF/EzTMPwQpJorK0SxlbL0bH5I
vscQeM9MUz3l33IUObx90CHf1zNeu5K3eOOxQRTT2Rz+vlazWvw/N9ixOKu0n1ukHBS+W5MaRlyd
c57dB8jhZNI40adjDs+mp4nza0TvKVLnLam7WKcaz6znbWyauLZ7CBmE01uyhpD5xoalsKiHegOK
w9QVkijWJlrMvXKPrMRiPlne2su+pnIRhl6p9KvvcRCrV8td3smvU89h9CAsn6NO/eLmLq7ToqjK
I5gcZWGpf5oIcnsws8QRM90j+FssjsivaWsQkD3GkM6OM20m3WPhV7hAHIhWqyXeyEnuQZTVjPpo
aKtTPS7U5szjaDafEF8MhwIJi6fJyjayBrnOvFw2SEnKysRDO/K17Rvb1SgzkEXWkgTk6Fm4QuaR
aTjOj4jt0OiOwVvGvpH3K7ddCi8utx5B14RzGrs+fprA8mBC3ctrKsZnZPj0eTdWbrH45N0wOuPS
D+p/3uKrOMsRVN4owKazzXyymMIEyA8ELZovZ6PkU+4ZT6R4hkwNZ13KuD6jv1RJP9+rebWaRC87
pC2mNE0LTO34I+Okyaaz0Zrvku2AV5tkhbxqEs+hO9mos2BbCRcr4stZHk8n5E1qlxEEiQrfeczg
r3U86tSkPoYL2IX09BAkeTG/Tl76yLV6Eq2iJ1id87HSq+zHu8f37wqji/9S3qGR3wo9tk5bIqTa
4VA/Wx5NZqGbCP91o0s1gckoZMvA4zGhWCrGK0EdgJqc8TWQ3Qrr+OQmdQEWBDMk5Rp90s5QM4pb
24jN9EPfEZeWb+M8HXvHd+E7VKcPEYbExYu+QPrj8f3x2yfC8LlB4lJadtGj70mIVdRW0nzjQgfd
ehP1W2+/hvPFUHimwNgR2sx9ZKxDdXl/fnwZozh19kDjaWObEIXziTs7umQ4WKo6VUhXV+CbzAxW
9L5JCBbz+SRujzEkWY/YmUwbvGfd0zSm481oooWQahLSxtwNrPI8bciVsremiUXdHhSI2Iyi1vhW
ZZ5eY0kbmRaJDRxm1R4XiP1ce2C1TVaFGIfoATc59VutP8VaCyoSxCrs1D9LTxJv1yDDiPSEN5my
SviGh1/wGIu31y+YBoWoma8CsYlA1S47yHNT2v/dYmhG9eJwZhawiEPwzs0Lw2XeBA6HrTQZiUaZ
7ofcCwpLpyNmGPP1QOTShL5YfwGCsaIZL2Kd7P1SwYIFF8umIWq+0LxWuBEjrS11bN1pci9jDMsd
nWxjDuqjPVmQ/Rob3zSLhrwh7csxo+eGNG/HIQ1mh1ryMDvc+urKd/wCcSNgWKuuD3ykKxNJMfFi
k6WN+93OykDVMZjOqcGt3MDoC5SVdRy5JTJZZ+o8HzW9gPYqkFbz3lx51soRTMaZZXHiuRDNyybW
Pj0ZDaWEdJHHLpY6Yo2iFuJ5g6Unt1vP+0kkPHXR7pLMMjRcbmClpOPOi3brgYEpyq+lL8rggD6B
pEejgg/tnrkx1HqVKmy89GMPtjoaHHSrcBAbDIoaVKjdA+0DFHSNKqR5Q3pJA+nnmGa/XrDWumhv
YvryKud4bZpknsep8nX/aJly3NpYD1buTt2DyWaRl0T1MAuIlHlKbbIDm+MsNhCcSOCBsI5nU/q6
YuA5cur4NenubI2rCuOhrcZ2yM4KXvCbX3a9zGRTFEJ8aHwVZOZcWA3ppDe+YHXomHKq3n+Q3B68
zTMW8MkBk+/S8dm61Hr88LjXCcMyONKAc8Dq7iG7yuMrCRNsy3Yp2+spQc1nBv8q3zyqqAaoLFy4
xlKdOkqwdWcjsWX1fDKmwPnqekaaJNjqeZGaKoBJLQ7H0tFekVwI0o7NtpeaLPa+Dtr8DAyspsKG
kXKU+DxAXTZn4pvldPq1CmdudSbN5yngstmdmmase2b3UnDDs+zsA0ceK4OXM6ob+Pog1CP3xull
UhAg+AIXrl3JoN1jTz8LQowhjhsMUgn62NZ6TRRTlWMMvrdqJ2uoVmtRYiroDR4vN6DmyudOw6L9
+fL5/OPl6S/4VmyiQrb8P8aurLttXEn/Fb/1zDnT0yS4gQ/3gaIoiW1SpAVqsV901LHutM/EcSZ2
7iTz6wcFcMFSoPIQx66viLUAFICqAhYCSH7msvAa4KrLw8CLzeIA1OZZGoXYxavO8UOvHwC8OWxi
XZ3yttJC4cxWRv1exmMX22w9YVZr76+KsVatG+2l1oHIi6t27njsAJG1pxbs5+k7njKn//32/nHj
AQGZfOlHAf4Y1YjHuDnriJ9m8HqZOJ7w7mGIbDGHn+sWN14XcxB13NkLkDnurSRYOzQuDrZlecL9
6cXUJq493IWS/oRcgHEjDNH7JYui1N3sHI8Dx6WDhNMYN9kH+OAIBNxjfFK01neYElwywvIaCegF
s8zP94/r691fEOC9jxD8b69c7j7/vLu+/nV9fr4+3/3Rc/3Ot9cQOvjftTnpnPNRMCjuWqZcDy/X
WxFQbDbOpMnr8AYFtqIuDu5eM+cbDWwsS0lVWvIMCaAq+6k24twAVbrbWC1a/ODLwBe+yeE8f8hB
fHm+fP3QBq9a67IBO/i9dlYO9GpLdMquWTTdav/0dG5YuTKL02VgG3nA9AsBl9vHs3GhLAUJQng2
RiQrUZPm4285L/bVUAREr8I0s6oiIW011XdWhzNV1+RnyCv+CI+Aqkx9yXsk9ZEDbSGEYKFOh/mJ
BWbpGywuDUBdrpXvAkz50HQNUNxE0jppDMyv0oQ+K891+TivL+8gVfm0OlgW5/CVPMTQUwI/Mvhf
ejDrGF+7FprpqVAt7VgvsuDDkMW3xcDC5RhvgzOcHcE5g3FhC5BzGAPYn1ox5jg44iyNlHgn3p4y
ckIPHDkI5wpmoAKgs9ynfEb38NlHcJSrEt2eiO47qbeQQDn1ftIqyXL9A+rT4/ahbs/rB5dZpejU
Gjn/BzlRtBzsJBSKtrcnMvh0CKjby5ohWfyf4TAheqdp2kUGOyQ8FCrwdFURk5OnV90Y1SNJbLUw
uox6BIcB3a6pjCH1uM1qvb3VGBAbpv+hacvyKo6VRuzvifz5BQJ+Ks/D8QRAg1abom1tn6W2a/nH
b5/+29T3emem3tsRfGScz8IqXk2X52fxWAhfbESq7/+pRqWzMxuKy9OBQ5mpATihVt1qgIH/NhGG
d3IsQE6KU4JT9SXJFEoLF/fO2AQxMNR5SwLmUX3vY6HanGqiWMHYyY88XPkaWBbZY7fLStzzeGDK
N8Vu93goC/yWY2CrHvlsZ78fZubIN7ouA5Qxw2y7bbZVdu/wmB3YimUGj+rhwZDG5i+2h2J3K8ui
rsuOLfY7x5N5Pdu6qMttebNkZV7c5PkzY1wvuclWFcfydrnYfrsrWXG7+btybWdqyhRs0pXlFFYq
efmlE84rvoK34Nhalbz1/hH5ROU491HJjY/K3YO58sgh5lwQRWJ8Jlxheq0ArVcaBFW4LHnTvl6G
pX+9fP3K1X2RG7KPkCWvly3ejtLu6Oh6/VjAcPnqRseJZm6zIDjLHHNXllVb0JglJ7PCxfZJGp9r
LVfqYZmkedSJRviuTsC25m80z3nV27gO5wzuxpXrAp+df+9RMEIwml9NfZX4lNolLjuazIiHu604
FPi+2VbHcgtxcU0q8+M8pGrNZks+7jAF9frjK1/Y7BpZTo8qVX8oTRFcD6MSq88lFUlFnB0FJn9P
NcPvTxgac76HwajLTLBry5xQ3zP3P0aLyCG4Wt5oqV351GyNuee8WPJi+fXxYNCltZdJ1HaVglS1
QRoGVnWrliZocK2+YftZ0GgjYRXn+kiaq9LYaiNOprEt1AJIfUw7kPhDfaKx9ZnTvn9EI60/kHYf
n/C0+sOaCp0HX7JzOldQBtmMfDVs8NOtXqjKM0SjPPv44dvAVEgugp92SRvBZR4QM9qN8rwo1gKw
BZiVSGEdkVrThxyivtUzdR4ElOIHYrIqJWscz7nLmXcHbm6OZ5Lswkq3c7aYr8R0BKJKBfKZPhjX
612xBgNTs/J897hXYzD4wxrr//6/L/2Rx7SfGit49IeX6MFDucGlZmJaMhKmjkAzGhPFt6sqk39E
X0gfOfQr+YnO1qXaZEj91Hqzz5d/qVeNPJ1+f8dV6FpLv9/faTd6IxkqpfoG6ICm7BuQeHwR9qZ4
bSdWP3AlHzsA4viCepGzQAG2mOgcvvtjzEND53A2hbHxQTgS6uH1SaizSLTw8PlHZ/ITdPjqQjJq
3eIV8eyg3LGIWHJ5q2+2BduuYGgcufEp8rZ6tL+S9LkXwVW2zbFGbfnbZSYZlWaTZtMgb9p8IMkI
M9gs9tTpPhOeuhVUtGxw6rCGFuLqkhdjl2WLrOND9fGcH4nna7I4INCrqPWSyqDKg0b3XUlSbN0e
GNhCNS/oK6ERZcxJgzh8vnggyUm3KzMgp1mZybdZPsxVHfyOPbSKLp/jgQE8RxMvRNqtRwiWrMAI
qr4MzTS4FqifD1jJWkh6VlaEDwv6KtPAAbqfulMa6Po6MKUnegorTtUFsSOsrFIaP4wSfPeiFTmd
5+EdGvrRXMMJDj04qQqRCAtNoHIkurWbAkU3c44onjOrF0GIZTxIxDrbrwu4KCdp6NvCNJiM2ciu
izw1WsmQ465Lwyiy6eLGhqs97dLG+CYjTSPFZUXMg8afXJMyzJyA2N++bPSIa9JY9/LBd4rYQcP4
jNcyCXwsYIXCEPqaBYiG0NlPa98jSpPqQOQCYheQ4sXgEBopU+XwkwRNNSXqBDIBXXLyHUDgAkI3
gDYCB2KCV4lD86+vCQ6sBVmQoI++ZSxPYjQKzshxKs+rbKsc91uJ3FN4BQG/IBlYfO8mzyqr/Wgz
s+qORaqXEBB5t8ZMK6eX6Nqq0N4mneoMgRExeluY3gA90p3auTbK+Y+s3IF61NjpLlmMv7gHL+HN
tv2yqCo+U9Xox9KrLFu6zLglWxnd8/bCbnTHZk98ri2v7HKLMy+yWmO5r5IoSCLcA0VyDJ6YmR5C
eEyA5RvHHcXI0vHdzr7LOtR2YOBaV5FPWW0XnwPEQwGudmUomdjUTbmJ/QDtvjKKXDFuJ7koTLE3
E+koMgX9mYdIWfjI2PkEl6Wq3BaZK1L+wCMWMyyujc6RoBlIyGHYZ3Lpd+0qmOLF73KuRcyNBeAg
PjK3CYAgzSWA0PVF7CwHQRX6Ua4hMonvYx8DFHvxXAMLFh9dsQQUz62cwJEi0iKOgxKsCSSCiy+8
KWlMPzhPgHn7ahwhul4JKJpbrwRHioqbLDkanHqaYdoAVSS6PFZ1ppG/2K6Iv6jzUYtCltjccW44
CkjtsOebGGaXaA4HiETWSYSKY+3Q0BWGOYmpaoqLeY2GT1FgR3Ec1x0Tg+NsTGHAnWhGOMAzTiMS
zCmkgiNEhEECyCzQ5jQJYkQPACAkyDjbdrk8NCtZp78XPXLkHR/C8wICPEkyN0lwDr7xR8cUQKlj
oznytHmd4FY2Yw1XNEq1Oayt8WdBh0/YpsMmX07GRiAnBz9Qco7OnHMWnaPCUxd8KsO2bANHwXWO
0EOGFweI76GSxaEYjmhms4aw9GFS/xrTrIBLpkWATeNcI4riEwRvqR3Tk+Agc00gOAJkq8S6jiUR
1lV1zWdpbCOS+4QuqU8xjCWUUHwG5VAy31IZb3N6Y+Uptxnx8JB9KsuN2ZqzBORGTl2ezE0s3abO
TafsHqlb32WUprLMzbSCAW1IjoRo/DOVgaCjiSMRGkloYIB4+3m7B9UU+57DMY1x5+Oeo/MJrgMd
OkocrlUDy5EGSRKgT3wrHNRf2oIHQOoEiAtApgRBRxc5icCeFwxP5ktZJTTqmCMVDsbbG9Xko3mD
bL0kUmxWaNKui1aVQYjsrHH6OBrBn+UXNt3dvefj0cZgScx07yNJgrDb4NWGJjzwML7DKyEWLBo9
qmcqar7dL7YQkAFK2qxWsDnOHs81+4dnMhuHZAP5uCtFWNZztytbZuPLYpXtq+68bg68UEV7Ppas
wGqlMq5g3y/c/2crqX4CcTIglLfj7YXhE3fqCONseYEBbIvFjxsJTYVTU1oWh9WueBg4Z8sNT/ll
5tOmyjPmYN7+igXHONH43N7D3UvdjkL1OmUgnzdnTX5edgwryiTunDUIvROSl5oasOBV6i/HZtMy
C9bmm9nE8NqPF1FZl2+WjWL/PVCsCLEjsG2O2WODRksaeaRrrnB0OxdbEP8lkgWEsxb2rjw1Pp7s
rCxLN9GUx8vHp7+f3/7rrv12/Xh5vb59/7hbv/F6fXlTO3ZMpd0VfSYga0g5dAY+94AA3GDaNk2L
No/B12Z4GECMXx2uffp6hV2x5lmz6tS+nKZRFVCyQodSf7Y3sCOF7uNG2VIjDXvRIkz7Xyxhle3J
i9N5puMy6yDoJ9ae8qIVK0F/2zqbcv+czizPU1mKSE+zTEMsqJlW7N0rsGY8IkQ4rghOJwQRUc2w
Gmf5w77cFY6mypYHeH+DTxwc1z6ryho8C83vNIbE93xHwsUiP+cBDft0e6o46aWFmRlr4e0krgc7
XD94Wquya3NcIEe+Yr9rhrogRSoXCc9EK0+5qDOmXsZnK774GKUr48DzCrZwNkVZwKbJifJqzYB8
q0JWrhJz1CzNZlaeGN8yjZWcttZwnuAHzlJsD2bb90DsyYop94LtPtIpsKEcrEltJEgWyViJYZ0W
5ntmIWFL4BjPvZaqp8KpNElsYmoR4WXGJ0vmuFAVLd/rBvNCtS1TL3D3Lp/RE8+njpJDqJSM+H3e
g3Hh739d3q/P01SeX749a5oBRFrLb8x+neEqOZi83UwcLnrRxIeGgajEDWPlwggTw7A7nEVeZyq7
Qtb/Ei8kCbtGnHvEMTJXuQyyjEiC8LNVlWmX4go3PF93zmvtZEPDcZ91yVIoz70Iz6p/fv/yCbxw
hihxljpZr5aW6gQ0uAt12I7CUxbSBJrgx5ji+6wjNPFc4fOBhRc5Sj01KqugKhbDeoqnlniuGKui
Gr1Tp/ZEDwCmV8RE0/12FLrh9SeSZ2FS+fjp24g73NxHnN7AHQfDE456I0GHCGMg1U1qIKpm1pBO
rzZpd08K3YguPCLYUewAxkgWcYAk46MXHQLUbL9FT+R+cDKloyfapR8Au0NbEhMloOumy7mSy8pc
Kx9Q+adthV+2QkJy//Kwz3b3887cVZubDiAa5gwZMO7cRN/lm24JjqI3CgSB58TpxK/wuVzXJ7aW
K74Lx6sjguuBxQQ/TgT4z2z7xGevxvVOOfDc851rhT1LA6AMv+yZsiPJ7sEj8Bi1HJWjWtpxmcmC
LXgSp/hVxMhAQ+yYsIdp6mHJ0pS4RkxvL2bOO0CkBrGLtbuXgWZ9POxZ1IIUTyIICXatDt9ohuUK
HZR0naKY9I1rfx8/WJotmFQz1oJI1rbwV9HBGkz/Jo+6CL2CA5QVuRGUSFDLMInN0O4CqCPPR0ho
adn9I+UCg0222eIUeZ6RQbaAQI3WQtqTm87VCeyR5eohHNC0Nya0BgbUdoiRVJpQ7IqzT7CqzT4V
vjCKutuy2Pci/aUV4RGDH2b2sd2Nkk8uNFrpJB29pR7KJ/x5kNQMz5uRnqLFUmCCJMap9vowItaS
whE+E+lW7t2xCr3AVmtUBnj+e07vOVY+SQJU66rqIEJt50V5LI8iMY5Nd0BVZTJ9shQittAPEB7M
clRC9KBWokp1ZFzyGKBvzejH2mk0O8J0Dg7RyKg9GPiGNPXnLUile8Rd5/GiwKI5kktT7KpsOGkZ
+12N8+TS06ejkz5gvJrdFEXe8g+wOFblqeDC0lRdti7wRCBU314Ec92yfe246JjY4QxcHIGjH1js
fIVeG6NZA2HVn00gyztK4whPIFtGQYpNgAqLmIzxz4etyGwCiC+j0gOD+o31jssaX2dRtWgNIapt
rIH4GLLKtlEQqWbUE6abyU/0klVp4Dmal4MxSXzssnNi4pNXrE7iCsIXrQQtqUDQegszf0dqNMHr
VnV5IB8iReoAYJzEs1VQ9EQUi1T/UA2icejIV4CoC4vOI/VIHIrQJpoUSUe26Y0hIbVbgtep31Dp
io6OJzRwZM5Biu5VFZ6W0sjVZlzJdZw+6EwEWyx1loiixTfU6AkZVSMkS3CzDtE9rMpjqssKtto/
FZpZtYIdKPViN0Qdc5cAUeVK4TnWWLrCW62PPYOkLGB4oulgBZayeKUGP1sIRuo20x1vdZDd7HIW
1TSJMdMehadaw0m9o7W4Uhf5MfpGksZkacM6SoIbI1rqvASVAlt7NjF8mhGYHxB3sSISzq9hilKN
Y5rmrGGDLmxho7qFFErqSbNFElJWZYtyocQp2eWWfsxJteP1+qrc4fb9u3x4acghv3kfdhmzqsit
DSZQtk1XrkrVO1I8fC+wna4NjnRwz8QDTEueHjeT7Mlcd6s6O0O2Xyx3BxH2kxVVkY+n9/X1+eUy
KJIfP7+qbs19mbJaHHLi2WbbrGr4TuagMBiVWpbrsoPH7Q5Y3QzmXQbu/7f52HL3C1xD8JWbjSqc
U9UajPFOrOYZPjyUy6Ixzo9lgzXCraeaIuAeXp6vb2H18uX7j7u3r6C6K60s0zmElTKWJpq+B1Xo
0KMF71H97FkyZMuDU8uXHFLDr8stzMbZdq0+gyySr4ua8H96/QQiriPOFf8857+Z362OWz6C1CbE
Kq+InhIS1moasz35RPCwh56StZbXT5+vl/cr1FJ00d+XDxFR7CrikD3bmeyu//P9+v5xl8ktXHFq
i11ZF1suoWrMMWfh1FEz3o8IYm+5cPfPl88f128878s7b/jP108f8PvH3W8rAdy9qh//pt5kyfrC
IvoLop2XM1ItenmxXxFjUproiMAJOu/0RjXlUr6os6pqcGns2rUmCHJAyVsoMzH+Uz98HKkEC94w
oDAz58jYVEP0SNLly6eXz58v334iN1hy0uq6TMQ1kjZUOxHIRvLeXb5/vP0+dttfP+9+yzhFEuyU
fzPHcbnrR6y0nPr+/PLGp49PbxB24z/uvn57+3R9f3/jUgKh8V5ffhgmVDKR7pDtl+jNXY8vsyQM
rPmCk1Oqeln25CKLQz9CmlwgBFtxJV6zNgh15UgCOQsCDz9wGRiiAHWLmuAqIJlV1OoQEC8rcxIs
TGy/zPwgtCrNlYZE9/SY6KibTS9PLUlY3Z7M5FizfTwvutVZYpPd2i/1pOjK3ZKNjKZ4sCyLZYio
MWWNfVounEnwyR2MTsyCS3KALgZJ7PBvmDhoiJtdS45FR313W3I0iu2MOTnGg/1I/J55Pmp53wtf
RWNe8jixU+atmOCGsypu9a3Y8Cch0kYDAgqYe9Qd2sh40FMBUMV1xBNPdz7pgSOhsz3THVM8voEC
x1Y1OdW35OPQngLp6KjIGIjuRZNsRGATP0EqnZ9IREPjBlpd8lGhvn6ZyYa4upq6ZxIh9gk+GlS3
7YkcYAIggNTd0oBH6vmZRgaxwdJMA5piNiY9fk8pIqQbRomnhfUymk5pzpdXPg/96/p6/fJxB8HM
rXbdt8s45Fsxa6aVQD9faPnYaU5L2R+S5dMb5+GzH5xBD9na/RYnEdngMabnE5MRu5a7u4/vX/iK
POUwxMcyILn0v7x/uvK1+cv1DV4buH7+qnxqtnASqD5N/XwTkSS1BAlRvxm8BdyWy35ED9qIO3/Z
OpfX67cLb4YvfNGwX6uRSW/KKLLGc1mfiB4YQqG7Z2WAI4p/lsxNOsCAHhGNcOCnSCGDCFmGmwOJ
0Sd1JjiyEgMqRdQOQcfv9UeGZDa3KA4TOzfwqbWpUWzPK4JqTStATRFqQiJryuBUeVRtFT2Zb6gE
LU6ShGhDURphp9cDnMa2nghUrB38gGJydGBxTLC7q344dWnt6Qd4CoCeqU244Q0+Aq3ncIQaOToP
9fCacN+3VEhOPnj25C7IAbJsA2DEStQniJ0XeG0eIB2zbZqt5wtwrh5R3VTYKZOEd8ssr4nVU7s/
o3CLtBuL7uMMf4BDYXCvfRwOi3yNyCxHokW2mku6LrMWM2iQcNHR4h6RLRblSVDj0RHxiVTMsRWn
YY4pw3oc0ZnNTnafBPbQXh7TxA8xakwRKvWS8yGv1YVBK5Qo1erz5f1v1xKQLVs/jqzVCS77Y6vL
4RYtjNXc9LTH2JfGemi0zJr5cUzQ1rY+VvbZgGXyRRBtfUZQ47Rtv50Ox/Lv7x9vry//d73rDnJZ
t/brgh8eL2lVI1sV41tfv3/pF0cpSedAzTrFSle9jjTQlKrBRjSwyKIkdn0pQMeXNSs9z/Fh3RHd
CtbAYkctBaabAukoibH1wmDydQMXFX3ofNz8R2U65cQjFC/hKY88z1H6Ux46sfpU8Q8j5qybwJOZ
s1/Jloch+3/Knmy5kRzH9/kKRWzERvdDb+u05JnoB+ahFNt5OZkpy/WS4XKpqhztsjyyK7br7xcg
8+ABqmafbAEgkicIkjg2ulpoYBnoWrpPtztJZp52bcPpdObtNokljWFsIu/gdZ//GZPY34XbEDRF
X/duNpW4gqLEzX73/YZd07uuuXrns9Xax4PX1zMyRrNOVIH4dh4ghkFeTGfV1js7s1k0g15c/qyX
JGEAzV3qUpWSUVJ41afT8xtmsgCJe3w+vU5ejv87+Xw+vbxDSUIouleTkiY5P7x+fXp8o7KasITc
PxPWskq/JFMAnKmY6Uv8MdNyqyNS3PEaUzwU1L1ipIethR/yhNNGgfG4gPCobFlzoLLsmWQyVF5G
R70fCUScbj3JVZDoJhNdwjqzcqowVCWDs1hdlEVaJPdtFW+FXd2tfCQh/Wc1KsxX2MIkiNotrzJM
AmR9r+xO+BoswXwt6M5B1A/r7cNhObHDpxUKK2CEhgzgeCvdnfonoOrQZ1ospfIerqf6XVAPFzyd
XS1dOKYswv3renO4gDTji1+qkLokqDJNrxmP+xrYHJ+KRb5smohmWeTLWofovGj2MfPj+fWMujlC
1D4xU6pKGIybl9c+u0u2tC27HNaM+UKXIbqJaA9v2UjhcVnFZZiwZH6B7+3Bzzcowh11iJCtUdmH
Ez2NJ8JLplKcqQetp7fX54cfk/Lh5fhsDKiF0TkEFY+SmOA6Ygzm6MN9/vzweJwE56dPX46Geiq7
R74w8wP8c1g7MeitCrnc9HrEdc72fG+Pewe+6IqPdCGvqka0tyBOPN2aZLN5s9CPZpi7CzG7w2ax
WhuhEHsUT/n1fE5fa+g0CzKFqE6x1E1BekTGQeVa3NYupopLZkigHiHq9co0HtYw68WKtvaU8yoo
DvJM4aVI44SFVJTJcaIUFcf3WBTYLfr63oh+0mzPcPibfPz++TPmiLMPUNsApG6Uqjxww0e3ATlj
SFbyI8HD41/PT1++vk/+e5KGUf/6T2zNgFWP4J1hCNEqjJmd8mRXG4Rjl494ZXY18B4Rylr0Iu/B
dYsoLqN2ksMx0kizmrs0ph2aRjrBYN+nDDtHEtueWqtIVG42ZoxAC0mGedN6yDGWG3HSnlSPQWmh
runPpuVmRcY7HklMG1it6H41n67TksIF0dVMt9DU2lmFhzDPKVRn861vuD+Zij2PXZQZ6QscdbIn
FEWj58KRP9tCCMd+ysRgcAWYvpx6nhcGwzxS6cRNUBlmJkDEt85KQHjF7jIecRMItUAFzqhejsYr
B9DXC0GGWFMfRaxTE9mqMm0SnhNIova7igB2WfmUCY3FB1VwTCgv/ljMjVZ3JlpFGnUWLPrHqyJs
txanPXpdiVgi/Tie1zdW7aw0nD2oL2T3Jbb8UDW512oIicI6bfcs5ZGUzBZ3dFROgmbrjHOD4SAq
YvibLLv3UHfjZlQRy3Qj0ccS8dQTKXEWtfEethH3y90MM7h3lireqeQUYNFss/EEU0N0Kha+SLYS
zVdLTzh5iRd858uPieia84Mn8vOAbrMiiukDmCRqNpvZhRoC2uOx3aM9V9gSfecJ4oa4D/ViMaeN
RxAf1Ju1JwQdTkI2nU1pqwKJhnOrx21VipLDfRLTxw1ZWiznG/+oAPrKFx1Pro/D1v/piFUpu9Cj
iQzP50Wn7P5iccXeE8WyZ+9HK/Z+fFbk9AuCksR+XBzuigUd8gHRPI+4J1PxiPYl0B0Ioj9/ysE/
bD0LPwXsPrPpjX9edPgLDHIxW6z9g6fwFz4gZtcL/4pB9JUfvc18Senl7hYJvyRBpF+EwPY9W8/8
K13iL0wq6US+Ofj7pSfwV+GmqJLZ/EId0iL1T870cLW8Wsb0oV/t5LGoq8ITfVYpIcxjponoPJuv
/MKqDA87T4RA1IV4WcNJyo/P4oW/3YC99n9ZYlf+0iK+8s9mUeQ83PPgQr/VcNSHvdeL33O28QYa
HfE/2cKkD2Ih/NJhf5jP/Y28z7ZUyJld9Js0TzECO8q1wNSEJI+TQ6l/WEVAdZZms63gH+I/5tPl
xurNC/t8I+j0o53KFl6Qu6IgY8oDRrkFq6bySDvW9ocJrin08GPMdFRXcZ7UO10VAjzo7GQtGuTu
VgE5jnlc1QPl6/Hx6eFZVsex2EV6tsQoWGatWFjpiZ4HULvdWhW8cAKW2AZHyFPTIE5veG5+RuVJ
tmEcftlAlcPCrk5YNAmj/F8RmbEQpovFCNT/iN/E98JhJZ8uPKzCe5h7wikDA5YUMo2wp1ycCdWJ
OiyNwyKzYB+gSjb3JM4CXnkHfltZTJK0qHjRCBMKjOuiCe2p1t7c+yp9x9K6KE0umMpaCivrk/eV
dYJBKMfIdRaotgB/skAPDYSg+o7nO5bb1c8Fh6VifyMNnaxoEhz7+iuN82JfWEyKhHfLweTSwfFH
6XF96km2W+KDiK2aLEjjkkVzYwogKrleTq3FheC7XRynguaoJnTCwwxG2OrLDAasMmNyK/C9dDDx
LtcqVhPYSwCn8qrA2JC+ChUgxCt35mZwouRy1nlZ5zXl9o8YONbHNzbHkuV4pQwznL5XkzRxzTCj
uodvCWIlDSOHswKPl0d+/h0lzDF6u9aJQk6rI5ImZeiGk1tBhU2aimfM1xQQhaqPDFgmmjyxgJgz
CGMcW+A6ZpkDgrkHW0lsyQ9gWqaNI/qqzDd+SRXHOZy6zUTAPdA/u0UG6t+fxb39NR3uL13zfWHX
EaSYiD0XsRK/A8lC60QKXTWiVllNPV9tcMtuS7Ew++yO86yoY7s+B55n1Isx4j7EVdG1vIP2EGcD
+XAfwfZsC0QVCbvdNQEJD6Ep6HQsfzm7elrSxsWUOjHkzzVVnlFZEUHr11dKPrzJ9jyCE5CV59P7
6fFEBF5GfjeBpkghoJeCRmbeC8xssuE2t38c9jQGX3CtxhhPuC4vGUeZg9T1cZThvoDAz5dmMajH
+ie1Lil2IW9TXtdpDKdg0GVys8scr1MEutkcEIoeiXDuoG4vEd2kJW8Dc5UqZnnui5OIeFbhlspE
uwvN4TTrZMRtlOXyvGgwEm4e3/V+w/0kMm3FcXgd10dk0YdMLuNKcGF1gnMBbbSqqOk7lw4nNcom
rFNO2l70VBEXMrp7fABpkmMY+MZqNm4rstcxtSIG4nQGS7ocNyDT5R10yu7/mJtrIjeW1untfRKO
XpeRa8wpB+1qfZhOcUi8rTzgzLpEEP+MoDg089l0V14kwjSls6uDTaNRbKEngY8zf2Q+puV85iKK
rmY01J1qI6Zzd7ZnQ0M0VUfPFnP3eyLdzPrKGdwGBDSePnuPVGQGAkRXG3Z1tbpeu99Fxl20VVM8
A1x6leKlgHNqx8nTRRAPnx/e3miRzEKnb+TzCblXNjJCslOgzkLn6zlsnP+cyGbXRYVJ4z4dX9EC
bHJ6mYhQ8MnH7++TIL1BSdCKaPLt4UfvNvzw/HaafDxOXo7HT8dP/wKmR4PT7vj8Ovl8Ok++nc7H
ydPL51NfEtvMvz18eXr54loTyxkWhVZ4RIDy0hdvTK6sKBcLR0YiUAauvVRKuiTfVay0prkcvKgK
KXAhxjjCzw/v0Mxvk+T5+3GSPvw4nvuGZnJ0MwZd8OloOEzLEeRFW+QpZVMgBeVduLBEJ0DkfkCA
/TVSomgi7PuSoaizLhVDpntTd+C5CzG+nDx8+nJ8/z36/vD8G0jCo2z45Hz89/en81HtGIqk31TR
BPHj4PVui0vJ3/cuMhD484YPJHUFBw7YcoSI8Ypp61vdMnmzboqsAd0VPyAwMnJVpLG+I8jWETb9
comA6k/kq8Bi5hZLCoM442ZW2A44p+9NpfyImrqhDjiqNnsRJ/b+mBS1mR9dgl2p2t3WwN91eEU5
YygiaaNkdV9kHa/lrlPjA2hq61PyKgy29RI34gEjoW22xbS0olaZkq3NgMMeHuwTRyqTsVmlmKwY
aD97HlR2JDpZ5+KOVRUvfHIXBb0zNDsR12oL2PJD3XiCKqoZhYfirediEgjuobRvHOMPsgMPztwA
7Qf/zlezA+XVKUkEqGTwz2I1daRoj1ta3th6b8KpF9/ipIeArfHBuBRCXbkN07z8+uPt6REOO1Je
0vO83GlDnRelUo/C2DSEQyCqwU78pg5fs92+MPXeAaRWbnDfa6zOaMMCX9hvUNrhxtMKq3IsSmL6
oqO+L0m/balogDzpbJ/taiFKdGcbVBcJDpkZqUJgcJqG0YFksrAfNLVpZeHvIvodi/wnai0W91lf
IE5EO9MKYQD6AzUPFHbIZ5dFWm8zmvsW/3re+mWb+TZDlYZm7yZ1l5xLoikVD4td67leQpIwWHss
FhC7l1GBsoyM+I74JlhYsaIzXI87X4EG2s2vYJJMzcqHt8RI7MStv4cKseMBs8dJo8h0A56x6w9x
bp5zszjDtF43BBs8ZuJpTLu0xbOZFaNnhLVWWgENI29CwyI1xbYkCCoUrDluVLs7lEh5Yt5VKT+8
mHjIkeWZWFwtV8zhK2PZUtZ/I3Zu1VX6vlHAqRlfTMK94f8kFiP1rUxPTx3uux6QNKZ5oKoEhl1e
um0EMBnZc/zW6mCx6qDUVxBlhNCU0D5Abc1q865jwJKBKiTWzgowAFd2N0csnM2XYrpZ2ZXSYwdK
CBmMVs2laL7xJHtUY6aCRvpqW4cMA+NZn6vTcHU9O9itIKJfDjNr9feFOvTB0i/McXk4+/j89PLX
L7Nf5X5WJcGke9T5/oLOEsSV5OSX8Tb3V2uVBKgHZO4kTg/Qm77+wBC7ThHM5rIJKE1H9ZaM9k1c
qA2LaU5m8lSFicCHEiGSbDEzfdmHLqvPT1++uHKhu0KyJVV/s2QZYBq4AqTRrqidWvT4rKZvbwyi
XQybehAzWr8wSMk3F4ow1J0rDAwLa77n9b23zpcETk/T3w6OF2hPr+94/HubvKtOHudffnxXUckw
otnnpy+TX3As3h/OcIT81bBoN3odVHjBLTsOsqUyRKCnsSVTL7D0N/K4tvzIaB5oguDO0KFDPeGy
WBjGmJuHp6q3e3ODh7++v2JXvOHZ+u31eHz8agQYoSn0+/Atz2FLzym1Jwbp2ILEw9tZEVb6lalE
EYESEU5wquoQjgR6pEsAYEbmq81s42L6vX5gi8BdCOrHvSeiJeABVxc7T0TMmtBJDWy+z0wDHRUB
qwZ+vSeOoeViGVC4t272Q5sATZ7ttkgEPV1kVau9oYHjWwdWhbg96MlVLHEyDGpHwYJg9SE278RG
XFx8oI2AR5LDZf6RgKPR2hzIEd6GsPwa3dpEx6+XVK0UxpPASyO6Ws+p4piS75oOrz5SWAGodYSe
l8RErKnPVWIVLtZkiN2Ogot0Np8SXBViPncxB4CvXLBM0j4nh1KipuTFi0GyuPIXv6LtBA0aUp8Z
umk5q3U/bBNuJ3zrscHtYk6dCIbvWuk7hqXihvcdMXYA3w4jQBG/1t1sesQWtnwz4MkwwLAAPMc2
jWTlsbvWuZBJcnqCOFtM5/QM2wOGNo8dSTab6eXREyvK+2XARrBYN8MOA6dtU/AQA6qn0Dbg3kXt
UZYNkktdhARL4qsS7hFB1+SYShkxI8Pj9z16vbaidw8DubTG2iG4ms2IRSAFxZIWLiCwCCkAC24+
o5d7Fpbra19f4fs5U6aZ+ohisDx3S3H6DM6ZRF0U3M6jbdaUGAI5d69DUlArnGLpbMHD28XF2oZZ
QQgGGPe5EVR8hK9m5KAiZnV5/eCGs8Ec8Bk3n2ooyrUnGuVIMl+Sl6gDgXVq1eG0BBf1zWxdMzIH
wrA6N7XpFqtjFpeWHhLocc4GuMiu5kuiosHtckPN6apchfTCwtlwade2HTN1+IpYb0RqgkGnWZhp
CfrZpHIq9mvm9PIbHIEuT8BtDf9NZ7SQUUklLvVqn5dhsGYWKiqUR+uLMGHj3o7grtzRMxY0W9cO
Q9znmKtXjzsk7iTUuE3uilNzVqHarNjHKh48Pfs7sj4ihicQgSKC06rH9slqxliSNYfu2Yd+E/FE
G670IM4DNXp5Jw0dt0NFFhh7q4s0kMV5Y7BQYPpKtEMGaDhv3ksM3OhI0RLJ87Kp3QpkZuY2Ddx7
jVPh/Uf6qPTEUJOPH9g+Z1JlT4/n09vp8/tk9+P1eP5tP/kiY48TFla7+zKu9uSY/oxL39Ckiu8t
A6cO1MbC4wZRs4Tn1JUS5jMeoueP5kvjfApLDqKDfnhgYVztIno5IK6941WcxoLuafUamWQN7R/C
BDQoZWVd0EbOEk99oF9DYRSYKVuiOE1bkQW88Kw6xFeBJ86IKlxsNh5/z23zJ69Fc6nKPUmN1lb0
FVRSRm1ZhDdxjQmbSJJdKe876PgVmGX7UqfzIAOxSrlBKOtLgc4spdFteHd5U7LIn1BUPa3JqxBR
zm07d4tMuhTsfV5DnQViXk+n03m79+ZTVXSwGtOCfv1VBPug9riBNtUW05QtWmmq3xZlFSfcY27e
E5dVsWiDpq7JCEMlnOFhlcUCZnajbemd8XM3MYxnxg5z6zk39Q9KQd1W2xue0kPeU+2czUJfw2FW
0pc/JcuZ9J64NHPx9ijO1lf+OYD2zDWrLjFBfVu+OcHgAG1ec1aT+RDTA2ni1s0NTysVtvIE2eny
6KK5NkDyODTINOtY8Xo8fgL9QuYBqI+PX19Oz6cvP8Z7Lr/drDRob1XeFQmSs4aU9f/fb/3D+FCT
y2gN2yq+7bNmuP2ESXs9BmAdQZNzqGcZumVF2HhfmzWKboyotZCpq1Fjk+qeiNuSl740mKNq2QHD
XVVk8fApYWOAvEQLOsOefUDVAflMPH5lLNLlCaczifdY6z27B6flpUIgNerCKXYTSGeNi88MPYcu
CpvW9v7DWDBglYuR17l6KImhCVLMKwNfpyHOba1JgYa/0gEpIQ0pNRqlAJtP2mnK8uJwadbsMDJK
mGpv5PADLSlBPbxpdK+vjhC9LktmZGOST1wdk7H2A7Q7HtFtHKkydrheekJQa2SCr6xoTT4qTxAI
k2pJ+1BrRGEUxmtPXASdTMynmHqYlsP6Ry9kWNPI1NXiT6nuPP4qd7BuYKM27RmU/Hw+Pf41Eafv
Zy2/6X9pox/vQURt5nqgXIAGaTRAx+CNFC9tAjKeBp74ABwa0VBpdtQzx/Hb6f2ImUDIJ4YY3Wnw
GYOU9ERhxfT129sXkl+Zif7YQnM0Smp7NMbyQeXPaQA6Cf8ifry9H79NipdJ+PXp9Vd87Hp8+vz0
qBkpqdh+32APArA4mWfrPsYfgVbl3tRu5inmYlUQrvPp4dPj6ZuvHIlXttiH8vft+Xh8e3x4Pk5u
T2d+62PyM1L1qvo/2cHHwMFJ5O33h2eomrfuJH7QCgs0qervNA5Pz08vfzuM+kMah2Prod2HDTkh
qMLDE+d/NPTjto1nQNQr+op1PyfJCQhfTvrq7FCwr++7mM1tkUdxxvRIUToRnHxR8KO9qIcAVXEB
sp1GD8mFzUOdVp4Jwffu/O8bEdkCZmyvHUQoPqCe2PdC/Pf74+mldzwgrPoUebsVDLYN6nauI7Dz
ynfg4dSzWHqiOXSEfS5a/xfQ22ShZ8Id4d3TnAm3X416cJ1jrhsHXtWb6/WCOXCRrVb6PWYH7q1N
iTYDKuwVD0obBLFaGRoE9xwF85qOnrAHvZG2cTWsl+CH0ntMkBVaC0GOcopAaQRm3DQrKAYf82jQ
I8EFBRpopOWXNL1S55PqVsZgdUM54HVnxVog0PdDh35Q/0u07reukIICdMy2hjrPyUdhZYMPZYuw
Zql2KRyjtXZ3Ckl16x2FCaowE3WAv0JmHFMUHk6D0Psh9bSxu5+I7x/fpPAaG9sFlejMncf6h1l7
g3nq0XIbkVSn7u7b8sDa+SbPpJm2NpQ6ClmYqCHr7U54ETa7/nTvcqsBNJubt+EIV2IgtmxbhwE1
O0QrimIzNNOg9jMjNPR8+OmzTgVMWg53+iWcP0/nbw8vj+iT8vL0fjob596+RhfIhmlg5U1mws6+
Nd5Oi2DpTAP28ul8ejJ8XWCHqQqPg2pPPmwgTHsLkWYs1s9h8Y8CRYHLDKZmxMjnYBXCsY1R78uG
h4m7yfv54RHdtIg7AlHT2rEa9HpHtoZg2ddhW5peGgzzwWIcmtbv+YVl2iypBmJhH2ltinDvucrs
6TrdxBfeZqDLWLg7FHObUCezQwp3VYDtOf4Qj1hbLSormc+3AQWEOpVK1upyb2QtgdH/VfZsTXHk
Ov8VKk/nIbuHGUgCX1Ue+uKecehb+sIAL10TmCVTCZCCoU5yfv2R5L74InfybdUWGUmttt22LMmy
lKRO1wHWJZl37BAdJC37mE/cN4JjB6pHURrewDaXMBVB8wf7nN+3alkYUZj4G+W4E0c4UaQy89Xp
Jg9V5DrDRsOuzc0Kw4V+UwV/KcEXG2VQLB1JpfPdY3AdiS1df4xgSohuU1RxH8BnnNuoDJQCdCrQ
Uaqa/7aAK2rMGR1pW5K4QjMuqV1IF6IV2hmFT/HQr0Ow1BNUoBaL0czXHjzwEnlUXZdmhhkAX8Lu
1FwzIFulmBBhK9NGghIlV3mAF5705tWuLyV2zxfHb0qYIUh44BG4PAZYP/SonON9P+gNP1s+t0XD
H4zhze+kPu08niOF7tgowATa2ZnCN2pr/r5Xf5DneUsBQ5kG1xZayd/t7VczOjGpaeqxErenVrvg
y+717gkL/e6c2TvlcZ32YQRdeEQvIVHTabSZSsAyWAm8Hy9V8LyOitYyjSuR209gWgzMVzCG/xsP
lS1pW02lvelCVLmRWdbUeJusdH5yS0shroKmqWygxILQegWCdbsSTRrqfHsQdVlba0K5fkWgJ2Ia
EzKs5ArPCiLrKfWHZpYuf5hvNr5H1uqMX51mGN+uoOrYvnkqaKVbn3sEQgfq2nfA+ilJ6qWR8HeA
9PLgeOI4YjYgFgCZJIJP1KMI6zbLgooTAyMj60uNcObTjrhaRK0pwhQKNF26uorp2guSe8ZwKKKb
VHJ3JhUyvSncJyjX70wvqzaU/LFc3yzME9DlRT7HRBGVeBMVevZbQszh5+2FIkmCy6KtrB5FVZDx
4c5FNsxUA4LefzwEuMbrCzYSrfbGuECsjjoY/rloYB+9sGb3gLRejb8vl9Zvw4RVEJwf3LsQefrx
wSI/7TyRnUXRIAVvuyd0oaWvFgAbGzd4AxHKMFCV49zqy5C+pI1LLugeSLjw/VVFR7qwAxfayONG
b//E3hovHO/RDMK0zasysn93K9BotFHqof5A+0iUa17+RDIxWOFvEv41F1BNWIyp2eBBK67mYYCN
uYpUGxGg3x7lLJ8OjajaEpMV+vEkZXwNGbQe8xGC8sEqEx6Th5eYJNBz9ECEv2lfEQdezcQR9yPq
vOQ/RJ7qcy+tx5vQb/YvT2dn787/WrzRZl6KcyUWtMOfnnBeO4Pkw8kHk/uE0SsWGpgz3UlnYZZe
jFHB1cL9tpln772v1OvgWZil/5VsOL5FcjrzOBeRaZG897br3Mv4/IT3xZpE7D1Li4/vQ5yfnvva
9eHUxIBViPOrO/M8sFh6J8LCKE+LqKCOpOT5L3jwkgef8GDnYw0I/kRVp+CCzXX8B/6N557enPha
suDPWg0Sf2svCnnW8brZiOaKByEyCyLc4IPcbhoiIoF3smeexItCoq0K9uGqCBoZcMFJI8l1JdNU
d1UOmFUgeHglzJSXA0JGmHeE21pHiryVDfcodX++oWAGXxj5BBDRNolRRTZOOe9cm0uc+9OjPQCU
RKz7JG9UyaEhBFe3HgxPhTo73d2+Pu8Pv9yQYTtRL/4Gw+szBsx2jIE56HAqyxt8RnyiAquBTcOB
6R1FPLxkMDmUy8GBw68uXoNWLlTKWwtFlr6MbNSg6HcxGDDkj28qGTUugeFz6mGejXPk2WuknCWM
MolCIHGlpXaVkYFBGTR6Kmj0uFIYTC5icm9ERXlNWk5k3zp3yHjPJKiJ6P+oQY23o7SGtmBxqojY
oM6vCvnNd7uGuXsxT9IUWXHtcdcNNEFZBvDO37zsOsg8mcHH5gQJnrKwGS9HIlJyi03epXXGfWqD
oBNB5bnYQb41ous1dRjiaMY089CjX3Jlm2nzjxAWM9HLILXm6xy34Wr1tBACTQDiaLzBmJK7p/88
vv21fdi+/f60vfuxf3z7sv1nB3z2d28xVO8e5cPbLz/+eaNExsXu+XH3/ejr9vlu94iu+0l0qHDx
3cPTM0b57Q/77ff9f7eIneSKxLA8mHrQUxw6szMSL4Kraa/dDPf4dxUx+s+9tGPVUrZJA9rfozHO
wBaTow2AAqsYjkii518/Dk9Ht5jibqwsqQX8EDF0b2XUTTLASxcugpgFuqT1RSTLtai8CPeRtZE+
RQO6pJXuIZ5gLKGWQ8lquLclga/xF2XpUl+UpcsBfTguKWzGIJNdvj3c0Nx7VMs75M0HR8ucbro4
7FfJYnmGFb8eLETepqlDjUC36fSH+fptsxZ5xDTcU4Z2mAYyc5mt0lb0VVz1qgrl65fv+9u/vu1+
Hd3StL7Hcmy/nNlc1YHDMnanlIgiBhavmT6IqIprrhzAMChtdSmW794tzt3xGlF6V4LXw9fd42F/
uz3s7o7EI/UHlvHRf/aHr0fBy8vT7Z5Q8fawdToYRZnzCVcMLFqDUhQsj8sivcYrrMyaXUm8k+hF
wD/qXHZ1LZilLT7LS2YE1wEIwsuhpyEFCWKaxRe3H6H7BaIkdGGNu1QiZn6LKGQ+Xlpt/F+uSLhH
SmiZ/5kr5tWg9ZkZOodFtNYG337NhKQR9r9RIwwurxhBhQmemzZzRwTjs4ZPsd6+fPV9iSxwP8Wa
A15xH+1SUarYr/397uXgvqGKTpbM5yawOpNnRojQM+sO0fC1UquM4dDWK9vNZuLDNLgQS3e+KXjN
cOwxuJRnW9UsjmOZOIxXtLfZy9S7PMePjpfG9JOeQerHpw6zLOZmWiZhWeL9HckHggySM4sXS+6m
robXfVETePnuPQc2SvYOcmMdLFggLIJanHAo4D4i7TYD+t1iqdAz+wwx4XjDw4and0TMccvYljSg
+IUFdyg17IWranHuLt9NiY1gJ0tHc7vL5bhElFq3//HVjNwe5LYrmgCmAl9dsMbWQuZtKLkFEFQR
dz18XB7FxkxKaCGYjFg2hZrrc7MUsyKlKVuex6LwLZwRr7Y3kKl/Trn0k6Ibwjqp0HDcuiS49v65
LtXNew+H93/EIWbmBsBOOhGLqU82/4T++rlerIObIOZWQ5DWAXtx3tJO3MHqEb6BxjIeDLAqVUCx
0xCFoS32t4M0EM9MCY3EOxfqjBvLRszM2WZTsEunh/tm1oD2NMREdyeb4JprWE/FTyMlcZ4efjzv
Xl4My3mcRUkamBVOBt3rhrv+3iPPTl2hl964fQDY2tUcbupmLB5SbR/vnh6O8teHL7vno9Xucfds
2fijXKtlF5Wc3RhX4Wq4Tc9gWGVIYTh7lTCc3ooIB/hJYho2gSG9Jfd90PjDysYzx4YW4WBe/xFx
lXvORy06NPH9n5O2K5kntu/h+/7L8/b519Hz0+th/8gon6kM2Y2L4LDfODoOIgZNbCp556VxdzcV
6XIpiEqJG5aBQmnvcOb3SOQfF+ttflPRRM/27DdcOFGP8FGhrKho4mIx21SvXmqwmh+cgWxufk2D
OJmq/uFE6lGbs1mtOVMvqK+zTKCrnZzzmNR66pKGLNsw7WnqNvSSNWXG01y9Oz7vIlH1vn/Rh1Hq
zSwvovoMw2IuEY9cvKGWw2tGJhqLD30ElPBgKZe7ymjewzHSUWBVNBVeiXGQwwHFuFx3zwe8pLQ9
7F4o9erL/v5xe3h93h3dft3dfts/3ms3IIq4xfzfkg48Pr65hYdf/o1PAFn3bffr7x+7hzfj2ylC
Rj9jqYzgThdff3xjPy2uGoyPnsbXed6hULVBT4/P3xtO9iKPg+rabg7v2FecQZLgreG64YmHUMY/
GMGhyaHMsQ1UJSUZPkHqFZWYRiWoOgqaM2MgAwqUZSZQKMEewQwz2kANdznAVMmj8rpLKrpNoc8g
nSQVuQebi6ZrG6lHZwyoRGJtZFlh5nqpu1uLKjblBJa1E13eZiFfIl6dremXX8a7KJHEO6S6w2VA
WWASaRjMFGXlVbRWJxqVSCwKjHvEGg0qX0KZSr3TIw8QAlR/qrFP9sDk76IIdnEDtLBEFMgO8guw
wg1a3rSdyeBkaf00z1BNDMguEV7z+fgMEl79JYKg2jiKHCLgQ/IP2TaDxzqM9HTSMnSdQZHmg1Ru
G50vTPu4yLTuMy8BbXKMmJx4IRQvK9hwDJtEZSU15MiN2jwtKCixDGeEcpxBW2WpQYfl4Xz7QLtl
yAnM0V/dIFgfMwXxeKp6JF1kKrnHZOCxwXt8UPGXayZ0s4Z1PUdTw97FeVl7dBh9srtn1e6YxqFb
3ciSRYSAWLIYFUnqwnu7wpIq+rn3MCkp+UiRFmbmQQ2KbBea0ynUay1fBVUVXCt5o+sZdRFJEC+g
gxHBhEIRBcJNv0+lQBh/2RlCD+Fxpum08MO8hJFTMxUiHapP6zhEAE86kreDxBEXxHHVNWApGjK+
3siiSUPzxarmmHIO7/7Zvn4/YALow/7+FUsIPaiT0O3zbgv75X93/6fZB/Aw7uBdFl7Dp/947CBK
UWF8Dsapa2HdI7pGlyc9y0tFnW5ixUkwg6M0HVgGji3TiiRBCipYhi4KrVA5jSRYVr4CJfUqVVNP
G9HP+n6YFqH5S98hhu+ZmkHpUXqD4SATQFafUVHX+GalNLJgF1QgeAUKkFGgGy2FYYVcxnXhrpuV
aDDcvEhifSrrz1AO+k7fTJMCvTV2gUqCnv3U1xOBqA4ipQBitvQSLxYaR9sjqu3v4SQplirB6KEZ
oizCwA6LgEIGNoGePoVAsSgLfU00qDCy0U+OvmeGMww6N0F/PO8fD98oWerdw+7l3o2PIl3ygsbT
0rIQjBG7/BEyaDIFXblapaAvpuNB+QcvxedWiubj6ThbemPE4XA6tSLEqPS+KVSukl2RQ/FN33ow
8HTpUjcCsrBAA05UFVAZOQ2QGv4HbTgszFKx3mEdvV7777u/DvuHXod/IdJbBX92P4J6V+8GcWBY
ZbuNhOEv1bDDJuTJ56ZR1qCi8om3NKJ4E1QJp5Ct4hAz6MuyMS/Y5BQ8kLXoyF4LthxOUsHQdsA4
/3i2OF/qsVvAD/YvvN+bsdq8CGLiH5hRT2uBt+lrlaMs5S5AqC6B4UZhhJmss6DRt1IbQ82j0oXu
OKv4paTN1SMklbuTJXeHRoUE9fcipXlqoTNTMf2qMAVvF/7pLFI1CtF9ub8dxEC8+/J6T6Uo5ePL
4fn1Yfd40OYblYFHM5VyEbjAMRBJfdyPxz8XHJXKNsBz6DMR1BhpialEJsu8H4WaGZnhQoTvnsBI
hiErRJnh/Vfv1x8Z9iFa+hZE0vgCJrXeDvzNOYNG0R7WQQ4WTy4b3LwDffsjnPUTq3aUNizEFEC1
DcV7b3pT3FexQ0JeG6JlZ9EfzQtz0FTMni2I+ubpoXEjM/3WJsWNYonivPYlalQMkZC0FD7+FtkU
m9zjjCZ0WUhMicj6MaZ3dIbdruBVAYszsCyD8SMrms2VO0E3nJ42uhcavAhjbKIEGbK8zYxFEX4C
acReJk/bcCDS428RTFeLrFndf0LQYFIQMG4PBoxfYJL8auvAvMVfg2iPeyQWj/ZJemsQL7OuXFEU
sduUS94YtB/8g5fIqmkDZ8Z6wCplDcVdapJLAVUINghl0AaKCmg+GRqiJjcCY61bCAxtMfXvKKL2
Kqzro1dYjMRGpS8vplUPBpNhslsvthlOgowQRdugD5AZQoWXOaJtdvSVPy5M4NQlU/QQdi5adZIS
1kRbq0w4vYkHREfF04+Xt0fp0+231x9qs1tvH+91ZRWrF2G0bGHYpQYY995WTM1XSLIn2kY3+Ooi
adCv1+IKbeBDs/VPMUy9p6I5T5xghMyVrlFxvLTJjchujRlnmqDmVtDmM2gioI/ExcoZbPUKdrTn
R1BdkgAt4u6VKl5qkttY4M41QAKToGHfyrE0PzMO14UQpXLdK4c1BvdNO9G/Xn7sHzHgD1r+8HrY
/dzBP3aH27///lsvxUYx5chyRYaRbemVFaZ0nzJAaJYMIqpgo1jkMI78lkFo7KqzW6CDtxFX+vlY
P4f7jImOjOHJNxuFAfFdbMybE/2bNrVxJ1hBqWGWQKFgf1G6UrVHeOX7UAorFaLkXoSDS2fBQ+p7
/RXUEpjbmP3CidEdqaZuMo7XyYz9f8yCoZkN3QYGuZGkwUrPhGDAuzzTbHeSZkQwwUjVhxHt2hzj
QmDiK2cxs1+qrdmJbFDL7ZvSqu62h+0RqlO3eGzj2HV4BGQPddkDrdfV/IGSQg67E6cnKAWhI7UG
LNyqLUfjwxAQnhbbr4rA5FQXNdxMHVXUcgKkX2dRyyy+qKVB4A4stclkOO8xc7GoEl8kOOLnngWl
r8NUZjPTlFhUTu5nDSs+19xF8CHDpzEOjqr4uTf0KsbEG5ZTAGpydG1l4h70fwygmCavK/GweDSh
NC8dKSKjnTqPXYFpsuZpBo9JYq0bBtltZLNGN5+jiTJksaxw+0Ovkk3ek2WU0Aj44cGfRYJ5WXDR
EiUo/7mj/SYYDWP7GqOem2JtC43IlN/kdVM5PSYgZZ0keuMAGv6AlGv6etbOSGqseiu03ujGYFkJ
kcEyBWOZ7ZHzvh7AZU9I/BMZl6CMwZhaR3Jxcn5K7mPUfvmj6wBThHISRtNxI0MH1bRxSskme6Pb
dFipW4s9jSNTfp6952SKJdedJeDKfZeGbsINTkSjYjoGrfXOPfI06rmr9ac8vOJw5XlA1XSP9Zj3
XhlKQ/IcWzMUy554Fjm2Ec+ZYhQGzDGuLJRjtDu+YjOaanjze4yI1u9YHWm8lwN7Jym5aYMqyDxH
JmUwk1BD8aCV69Va6Msy3VfDQ64ej4xV+fNR6/H6h9t8I3McYJDXhgdmgCv3Ja1P2x/R7wXm/NUd
8s3u5YD6DeriEabn3d7vdH/JRZuzx+SsKWrcwS0zr706clcFXXk6driU229825zxfREV+k0eZcOC
ZABwvzD1bCsmNf4aPMfovw4qdOXUFgE6d6s2o7hZ3dOmkCA3g0qoY7SPxz9Pj+G/UfaCpMcTokZp
+07Bo/Qi9iR6VHYWBu3UVpZxkySTOVV+8lN4nw+nPR2m9IyCEuLdgBm8fmrspaJJCzZxN88MTzLL
1qduKavh/Sm7CKm3a3GFzq6Z4VAnWuqGHnuZvqeqIzOcVbkZANEUnPuN0GNElPlUKJts7hMBHpZF
yh+cKM9qa2cw1bHqON6Px3x3ia/2DVFUGLXi+LmsofXF7xJWxvztcjWRL2ZmOfS+8JRpIXzv8pkZ
HFRRvVf31TtKvvCUQmKA3BoPCa0ywpM4wrAwaGcXgqK8zgI2VQHxSmSVgVknnDmgsvnNdMK///Uz
ktILePMbEZHhcZwRGiKLApit/tlPgXnSXV7wpK2z9WjA2CfEs1uPc1tcHRj/D471H+Ac3QEA
--===============8031382859689261089==--

