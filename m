Content-Type: multipart/mixed; boundary="===============1325787380645568114=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/parsers/ofpart_bcm4908.c:41 bcm4908_partitions_fw_offset() warn: should 'offset << 10' be a 64 bit type?
Date: Wed, 08 Dec 2021 02:02:18 +0800
Message-ID: <202112080139.hREpRBPY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1325787380645568114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Rafa=C5=82 Mi=C5=82ecki" <rafal@milecki.pl>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: bb17230c61a6424b622e92006ec52ba23aa5a967 mtd: parsers: ofpart: supp=
ort BCM4908 fixed partitions
date:   9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 months ago
config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/arc=
hive/20211208/202112080139.hREpRBPY-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/parsers/ofpart_bcm4908.c:41 bcm4908_partitions_fw_offset() warn=
: should 'offset << 10' be a 64 bit type?

vim +41 drivers/mtd/parsers/ofpart_bcm4908.c

bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  16  =

bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  17  static long long bcm=
4908_partitions_fw_offset(void)
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  18  {
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  19  	struct device_node =
*root;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  20  	struct property *pr=
op;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  21  	const char *s;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  22  =

bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  23  	root =3D of_find_no=
de_by_path("/");
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  24  	if (!root)
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  25  		return -ENOENT;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  26  =

bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  27  	of_property_for_eac=
h_string(root, "brcm_blparms", prop, s) {
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  28  		size_t len =3D str=
len(BLPARAMS_FW_OFFSET);
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  29  		unsigned long offs=
et;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  30  		int err;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  31  =

bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  32  		if (strncmp(s, BLP=
ARAMS_FW_OFFSET, len) || s[len] !=3D '=3D')
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  33  			continue;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  34  =

bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  35  		err =3D kstrtoul(s=
 + len + 1, 0, &offset);
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  36  		if (err) {
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  37  			pr_err("failed to=
 parse %s\n", s + len + 1);
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  38  			return err;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  39  		}
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  40  =

bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01 @41  		return offset << 1=
0;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  42  	}
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  43  =

bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  44  	return -ENOENT;
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  45  }
bb17230c61a642 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  46  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1325787380645568114==--

