Content-Type: multipart/mixed; boundary="===============3590198503525887953=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8090/9759] drivers/pinctrl/renesas/core.c:77 sh_pfc_map_resources() error: we previously assumed 'res' could be null (see line 43)
Date: Mon, 09 May 2022 00:35:57 +0800
Message-ID: <202205090000.Ectoh93w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3590198503525887953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yang Yingliang <yangyingliang@huawei.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 5376e3d904532e657fd7ca1a9b1ff3d351527b90 [8090/9759] pinctrl: renes=
as: core: Fix possible null-ptr-deref in sh_pfc_map_resources()
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: csky-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220509/202205090000.Ectoh93w-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pinctrl/renesas/core.c:77 sh_pfc_map_resources() error: we previous=
ly assumed 'res' could be null (see line 43)

vim +/res +77 drivers/pinctrl/renesas/core.c

f9165132c5ee68 drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15=
  29  =

70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  30  static int sh_pfc_map_resources(struct sh_pfc *pfc,
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  31  				struct platform_device *pdev)
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09=
  32  {
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  33  	struct sh_pfc_window *windows;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  34  	unsigned int *irqs =3D NULL;
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16=
  35  	unsigned int num_windows;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09=
  36  	struct resource *res;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  37  	unsigned int i;
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16=
  38  	int num_irqs;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09=
  39  =

70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  40  	/* Count the MEM and IRQ resources. */
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25=
  41  	for (num_windows =3D 0;; num_windows++) {
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25=
  42  		res =3D platform_get_resource(pdev, IORESOURCE_MEM, num_windows);
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25=
 @43  		if (!res)
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  44  			break;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  45  	}
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  46  	if (num_windows =3D=3D 0)
bee9f22ba196b0 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-02-16=
  47  		return -EINVAL;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09=
  48  =

ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16=
  49  	num_irqs =3D platform_irq_count(pdev);
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16=
  50  	if (num_irqs < 0)
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16=
  51  		return num_irqs;
ad7fe1a1a35994 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2019-10-16=
  52  =

70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  53  	/* Allocate memory windows and IRQs arrays. */
a86854d0c599b3 drivers/pinctrl/sh-pfc/core.c  Kees Cook          2018-06-12=
  54  	windows =3D devm_kcalloc(pfc->dev, num_windows, sizeof(*windows),
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  55  			       GFP_KERNEL);
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  56  	if (windows =3D=3D NULL)
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  57  		return -ENOMEM;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  58  =

70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  59  	pfc->num_windows =3D num_windows;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  60  	pfc->windows =3D windows;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  61  =

70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  62  	if (num_irqs) {
a86854d0c599b3 drivers/pinctrl/sh-pfc/core.c  Kees Cook          2018-06-12=
  63  		irqs =3D devm_kcalloc(pfc->dev, num_irqs, sizeof(*irqs),
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  64  				    GFP_KERNEL);
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  65  		if (irqs =3D=3D NULL)
1724acfd598bdf drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15=
  66  			return -ENOMEM;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09=
  67  =

70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  68  		pfc->num_irqs =3D num_irqs;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  69  		pfc->irqs =3D irqs;
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  70  	}
973931ae0a2dad drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15=
  71  =

70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  72  	/* Fill them. */
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25=
  73  	for (i =3D 0; i < num_windows; i++) {
5376e3d904532e drivers/pinctrl/renesas/core.c Yang Yingliang     2022-04-29=
  74  		windows->virt =3D devm_platform_get_and_ioremap_resource(pdev, i, &=
res);
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  75  		if (IS_ERR(windows->virt))
1724acfd598bdf drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15=
  76  			return -ENOMEM;
5376e3d904532e drivers/pinctrl/renesas/core.c Yang Yingliang     2022-04-29=
 @77  		windows->phys =3D res->start;
5376e3d904532e drivers/pinctrl/renesas/core.c Yang Yingliang     2022-04-29=
  78  		windows->size =3D resource_size(res);
70c8f01a357ac7 drivers/pinctrl/sh-pfc/core.c  Laurent Pinchart   2013-12-11=
  79  		windows++;
1724acfd598bdf drivers/sh/pfc/core.c          Laurent Pinchart   2012-12-15=
  80  	}
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25=
  81  	for (i =3D 0; i < num_irqs; i++)
c7977ec4a33633 drivers/pinctrl/sh-pfc/core.c  Geert Uytterhoeven 2015-06-25=
  82  		*irqs++ =3D platform_get_irq(pdev, i);
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09=
  83  =

b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09=
  84  	return 0;
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09=
  85  }
b0e10211cba162 drivers/sh/pfc.c               Magnus Damm        2011-12-09=
  86  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3590198503525887953==--

