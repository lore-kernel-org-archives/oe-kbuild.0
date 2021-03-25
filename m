Content-Type: multipart/mixed; boundary="===============9203055927450964872=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/sysfs.c:1034:4: warning: %u in format string (no. 2) requires 'unsigned int' but the argument type is 'signed int'.
Date: Fri, 26 Mar 2021 07:23:25 +0800
Message-ID: <202103260715.cA2suLyB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9203055927450964872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Kefeng,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   002322402dafd846c424ffa9240a937f49b48c42
commit: ed1ed4c0da5447c5e322481ce2ef9f03336c6ffb riscv: mmiowb: Fix implici=
t declaration of function 'smp_processor_id'
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +1034 fs/btrfs/sysfs.c

3b02a68a636400 Jeff Mahoney    2013-11-01  1000  =

79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1001  static void init_feature_a=
ttrs(void)
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1002  {
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1003  	struct btrfs_feature_attr=
 *fa;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1004  	int set, i;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1005  =

79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1006  	BUILD_BUG_ON(ARRAY_SIZE(b=
trfs_unknown_feature_names) !=3D
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1007  		     ARRAY_SIZE(btrfs_fe=
ature_attrs));
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1008  	BUILD_BUG_ON(ARRAY_SIZE(b=
trfs_unknown_feature_names[0]) !=3D
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1009  		     ARRAY_SIZE(btrfs_fe=
ature_attrs[0]));
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1010  =

3b02a68a636400 Jeff Mahoney    2013-11-01  1011  	memset(btrfs_feature_attr=
s, 0, sizeof(btrfs_feature_attrs));
3b02a68a636400 Jeff Mahoney    2013-11-01  1012  	memset(btrfs_unknown_feat=
ure_names, 0,
3b02a68a636400 Jeff Mahoney    2013-11-01  1013  	       sizeof(btrfs_unkno=
wn_feature_names));
3b02a68a636400 Jeff Mahoney    2013-11-01  1014  =

79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1015  	for (i =3D 0; btrfs_suppo=
rted_feature_attrs[i]; i++) {
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1016  		struct btrfs_feature_att=
r *sfa;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1017  		struct attribute *a =3D =
btrfs_supported_feature_attrs[i];
3b02a68a636400 Jeff Mahoney    2013-11-01  1018  		int bit;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1019  		sfa =3D attr_to_btrfs_fe=
ature_attr(a);
3b02a68a636400 Jeff Mahoney    2013-11-01  1020  		bit =3D ilog2(sfa->featu=
re_bit);
3b02a68a636400 Jeff Mahoney    2013-11-01  1021  		fa =3D &btrfs_feature_at=
trs[sfa->feature_set][bit];
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1022  =

79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1023  		fa->kobj_attr.attr.name =
=3D sfa->kobj_attr.attr.name;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1024  	}
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1025  =

79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1026  	for (set =3D 0; set < FEA=
T_MAX; set++) {
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1027  		for (i =3D 0; i < ARRAY_=
SIZE(btrfs_feature_attrs[set]); i++) {
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1028  			char *name =3D btrfs_un=
known_feature_names[set][i];
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1029  			fa =3D &btrfs_feature_a=
ttrs[set][i];
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1030  =

79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1031  			if (fa->kobj_attr.attr.=
name)
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1032  				continue;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1033  =

6c52157fa9378e Tomohiro Misono 2018-05-16 @1034  			snprintf(name, BTRFS_FE=
ATURE_NAME_MAX, "%s:%u",
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1035  				 btrfs_feature_set_nam=
es[set], i);
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1036  =

79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1037  			fa->kobj_attr.attr.name=
 =3D name;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1038  			fa->kobj_attr.attr.mode=
 =3D S_IRUGO;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1039  			fa->feature_set =3D set;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1040  			fa->feature_bit =3D 1UL=
L << i;
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1041  		}
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1042  	}
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1043  }
79da4fa4d9dcf8 Jeff Mahoney    2013-11-01  1044  =


:::::: The code@line 1034 was first introduced by commit
:::::: 6c52157fa9378efc0ff24c5f2602d500997f59db btrfs: sysfs: Use enum/defi=
ne value for feature array definitions

:::::: TO: Tomohiro Misono <misono.tomohiro@jp.fujitsu.com>
:::::: CC: David Sterba <dsterba@suse.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9203055927450964872==--

