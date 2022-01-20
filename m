Content-Type: multipart/mixed; boundary="===============9062136834896658188=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/renesas/renesas-soc.c:395:28: warning: Uninitialized struct member: id.offset [uninitStructMember]
Date: Thu, 20 Jan 2022 21:41:14 +0800
Message-ID: <202201202048.zh17Rwc1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9062136834896658188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1d1df41c5a33359a00e919d54eaebfb789711fdc
commit: 05b22caa7490e4f4c94bbde33c61cf72d187b8f7 soc: renesas: Consolidate =
product register handling
date:   7 weeks ago
:::::: branch date: 27 hours ago
:::::: commit date: 7 weeks ago
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/soc/renesas/renesas-soc.c:395:28: warning: Uninitialized struct =
member: id.offset [uninitStructMember]
     product =3D readl(chipid + id->offset);
                              ^

vim +395 drivers/soc/renesas/renesas-soc.c

05b22caa7490e4 Geert Uytterhoeven 2021-11-10  361  =

8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  362  static int __init renesa=
s_soc_init(void)
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  363  {
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  364  	struct soc_device_attri=
bute *soc_dev_attr;
05b22caa7490e4 Geert Uytterhoeven 2021-11-10  365  	unsigned int product, e=
shi =3D 0, eslo;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  366  	const struct renesas_fa=
mily *family;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  367  	const struct of_device_=
id *match;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  368  	const struct renesas_so=
c *soc;
05b22caa7490e4 Geert Uytterhoeven 2021-11-10  369  	const struct renesas_id=
 *id;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  370  	void __iomem *chipid =
=3D NULL;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  371  	struct soc_device *soc_=
dev;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  372  	struct device_node *np;
05b22caa7490e4 Geert Uytterhoeven 2021-11-10  373  	const char *soc_id;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  374  =

8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  375  	match =3D of_match_node=
(renesas_socs, of_root);
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  376  	if (!match)
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  377  		return -ENODEV;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  378  =

05b22caa7490e4 Geert Uytterhoeven 2021-11-10  379  	soc_id =3D strchr(match=
->compatible, ',') + 1;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  380  	soc =3D match->data;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  381  	family =3D soc->family;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  382  =

05b22caa7490e4 Geert Uytterhoeven 2021-11-10  383  	np =3D of_find_matching=
_node_and_match(NULL, renesas_ids, &match);
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  384  	if (np) {
05b22caa7490e4 Geert Uytterhoeven 2021-11-10  385  		id =3D match->data;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  386  		chipid =3D of_iomap(np=
, 0);
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  387  		of_node_put(np);
4194b583c10492 Geert Uytterhoeven 2019-10-16  388  	} else if (soc->id && f=
amily->reg) {
05b22caa7490e4 Geert Uytterhoeven 2021-11-10  389  		/* Try hardcoded CCCR/=
PRR fallback */
05b22caa7490e4 Geert Uytterhoeven 2021-11-10  390  		id =3D &id_prr;
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  391  		chipid =3D ioremap(fam=
ily->reg, 4);
8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  392  	}
05b22caa7490e4 Geert Uytterhoeven 2021-11-10  393  =

8d6799a9ba23ac Geert Uytterhoeven 2016-11-14  394  	if (chipid) {
05b22caa7490e4 Geert Uytterhoeven 2021-11-10 @395  		product =3D readl(chip=
id + id->offset);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9062136834896658188==--

