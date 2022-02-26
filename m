Content-Type: multipart/mixed; boundary="===============5707921498686142365=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/parsers/ofpart_bcm4908.c:41 bcm4908_partitions_fw_offset() warn: should 'offset << 10' be a 64 bit type?
Date: Sat, 26 Feb 2022 11:23:44 +0800
Message-ID: <202202261158.HThoJHbt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5707921498686142365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Rafa=C5=82 Mi=C5=82ecki" <rafal@milecki.pl>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   53ab78cd6d5aba25575a7cfb95729336ba9497d8
commit: bb17230c61a6424b622e92006ec52ba23aa5a967 mtd: parsers: ofpart: supp=
ort BCM4908 fixed partitions
date:   12 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 12 months ago
config: arc-randconfig-m031-20220226 (https://download.01.org/0day-ci/archi=
ve/20220226/202202261158.HThoJHbt-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/parsers/ofpart_bcm4908.c:41 bcm4908_partitions_fw_offset() warn=
: should 'offset << 10' be a 64 bit type?

vim +41 drivers/mtd/parsers/ofpart_bcm4908.c

bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  16  =

bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  17  static long long bc=
m4908_partitions_fw_offset(void)
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  18  {
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  19  	struct device_node=
 *root;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  20  	struct property *p=
rop;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  21  	const char *s;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  22  =

bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  23  	root =3D of_find_n=
ode_by_path("/");
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  24  	if (!root)
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  25  		return -ENOENT;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  26  =

bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  27  	of_property_for_ea=
ch_string(root, "brcm_blparms", prop, s) {
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  28  		size_t len =3D st=
rlen(BLPARAMS_FW_OFFSET);
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  29  		unsigned long off=
set;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  30  		int err;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  31  =

bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  32  		if (strncmp(s, BL=
PARAMS_FW_OFFSET, len) || s[len] !=3D '=3D')
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  33  			continue;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  34  =

bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  35  		err =3D kstrtoul(=
s + len + 1, 0, &offset);
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  36  		if (err) {
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  37  			pr_err("failed t=
o parse %s\n", s + len + 1);
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  38  			return err;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  39  		}
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  40  =

bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01 @41  		return offset << =
10;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  42  	}
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  43  =

bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  44  	return -ENOENT;
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  45  }
bb17230c61a6424 Rafa=C5=82 Mi=C5=82ecki 2021-03-01  46  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5707921498686142365==--

