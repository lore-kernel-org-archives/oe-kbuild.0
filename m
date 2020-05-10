Content-Type: multipart/mixed; boundary="===============5111538119136679515=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: physmap: Add Baikal-T1 physically mapped ROMs support
Date: Sun, 10 May 2020 09:37:31 +0800
Message-ID: <202005100926.otXAXk9t%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5111538119136679515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200508100905.5854-1-Sergey.Semin@baikalelectronics.ru>
References: <20200508100905.5854-1-Sergey.Semin@baikalelectronics.ru>
TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Richard Weinberger <richard@nod.at>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
TO: Serge Semin <fancer.lancer@gmail.com>
TO: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
TO: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
TO: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
TO: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
TO: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
TO: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
TO: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
TO: Paul Burton <paulburton@kernel.org>
TO: Ralf Baechle <ralf@linux-mips.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Lee Jones <lee.jones@linaro.org>
TO: linux-mips(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: linux-kernel(a)vger.kernel.org
TO: linux-mtd(a)lists.infradead.org
TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
TO: Serge Semin <fancer.lancer@gmail.com>
TO: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
TO: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
TO: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
TO: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
TO: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
TO: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
TO: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
TO: Paul Burton <paulburton@kernel.org>
TO: Ralf Baechle <ralf@linux-mips.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Lee Jones <lee.jones@linaro.org>
TO: linux-mips(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: linux-kernel(a)vger.kernel.org
TO: linux-mtd(a)lists.infradead.org
CC: Serge Semin <Sergey.Semin@baikalelectronics.ru>
CC: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
CC: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
CC: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
CC: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
CC: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
CC: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
CC: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Serge,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Serge-Semin/mtd-physmap-Ad=
d-Baikal-T1-physically-mapped-ROMs-support/20200509-045217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
d5eeab8d7e269e8cfc53b915bccd7bd30485bcbf
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/mtd/maps/physmap-bt1-rom.c:83:18: sparse: sparse: cast removes a=
ddress space '<asn:2>' of expression

# https://github.com/0day-ci/linux/commit/b731f5a43151d551d49405afc7e2c3088=
18f48d8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout b731f5a43151d551d49405afc7e2c308818f48d8
vim +83 drivers/mtd/maps/physmap-bt1-rom.c

b731f5a43151d5 Serge Semin 2020-05-08   62  =

b731f5a43151d5 Serge Semin 2020-05-08   63  static void __xipram bt1_rom_ma=
p_copy_from(struct map_info *map,
b731f5a43151d5 Serge Semin 2020-05-08   64  					   void *to, unsigned long=
 from,
b731f5a43151d5 Serge Semin 2020-05-08   65  					   ssize_t len)
b731f5a43151d5 Serge Semin 2020-05-08   66  {
b731f5a43151d5 Serge Semin 2020-05-08   67  	void __iomem *src =3D map->vir=
t + from;
b731f5a43151d5 Serge Semin 2020-05-08   68  	ssize_t shift, chunk;
b731f5a43151d5 Serge Semin 2020-05-08   69  	u32 data;
b731f5a43151d5 Serge Semin 2020-05-08   70  =

b731f5a43151d5 Serge Semin 2020-05-08   71  	if (len <=3D 0 || from >=3D ma=
p->size)
b731f5a43151d5 Serge Semin 2020-05-08   72  		return;
b731f5a43151d5 Serge Semin 2020-05-08   73  =

b731f5a43151d5 Serge Semin 2020-05-08   74  	/* Make sure we don't go over =
the map limit. */
b731f5a43151d5 Serge Semin 2020-05-08   75  	len =3D min_t(ssize_t, map->si=
ze - from, len);
b731f5a43151d5 Serge Semin 2020-05-08   76  =

b731f5a43151d5 Serge Semin 2020-05-08   77  	/*
b731f5a43151d5 Serge Semin 2020-05-08   78  	 * Since requested data size c=
an be pretty big we have to implement
b731f5a43151d5 Serge Semin 2020-05-08   79  	 * the copy procedure as optim=
al as possible. That's why it's split
b731f5a43151d5 Serge Semin 2020-05-08   80  	 * up into the next three stag=
es: unaligned head, aligned body,
b731f5a43151d5 Serge Semin 2020-05-08   81  	 * unaligned tail.
b731f5a43151d5 Serge Semin 2020-05-08   82  	 */
b731f5a43151d5 Serge Semin 2020-05-08  @83  	shift =3D (ssize_t)src & 0x3;
b731f5a43151d5 Serge Semin 2020-05-08   84  	if (shift) {
b731f5a43151d5 Serge Semin 2020-05-08   85  		chunk =3D min_t(ssize_t, 4 - =
shift, len);
b731f5a43151d5 Serge Semin 2020-05-08   86  		data =3D readl_relaxed(src - =
shift);
b731f5a43151d5 Serge Semin 2020-05-08   87  		memcpy(to, &data + shift, chu=
nk);
b731f5a43151d5 Serge Semin 2020-05-08   88  		src +=3D chunk;
b731f5a43151d5 Serge Semin 2020-05-08   89  		to +=3D chunk;
b731f5a43151d5 Serge Semin 2020-05-08   90  		len -=3D chunk;
b731f5a43151d5 Serge Semin 2020-05-08   91  	}
b731f5a43151d5 Serge Semin 2020-05-08   92  =

b731f5a43151d5 Serge Semin 2020-05-08   93  	while (len >=3D 4) {
b731f5a43151d5 Serge Semin 2020-05-08   94  		data =3D readl_relaxed(src);
b731f5a43151d5 Serge Semin 2020-05-08   95  		memcpy(to, &data, 4);
b731f5a43151d5 Serge Semin 2020-05-08   96  		src +=3D 4;
b731f5a43151d5 Serge Semin 2020-05-08   97  		to +=3D 4;
b731f5a43151d5 Serge Semin 2020-05-08   98  		len -=3D 4;
b731f5a43151d5 Serge Semin 2020-05-08   99  	}
b731f5a43151d5 Serge Semin 2020-05-08  100  =

b731f5a43151d5 Serge Semin 2020-05-08  101  	if (len) {
b731f5a43151d5 Serge Semin 2020-05-08  102  		data =3D readl_relaxed(src);
b731f5a43151d5 Serge Semin 2020-05-08  103  		memcpy(to, &data, len);
b731f5a43151d5 Serge Semin 2020-05-08  104  	}
b731f5a43151d5 Serge Semin 2020-05-08  105  }
b731f5a43151d5 Serge Semin 2020-05-08  106  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5111538119136679515==--

