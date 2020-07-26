Content-Type: multipart/mixed; boundary="===============4285725092835311566=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [balbi-usb:testing/next 40/48] drivers/usb/dwc2/platform.c:593:1: sparse: sparse: unused label 'error_debugfs'
Date: Sun, 26 Jul 2020 22:30:37 +0800
Message-ID: <202007262228.15sv4Dyo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4285725092835311566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-usb(a)vger.kernel.org
CC: linux-omap(a)vger.kernel.org
CC: Felipe Balbi <balbi@kernel.org>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Felipe Balbi <balbi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testi=
ng/next
head:   a1ff2f6769e39055e973b068070aeea0b3bcd90f
commit: 602fb68e303fb96c9e4a5eb5f25ad0ce999df37d [40/48] usb: dwc2: Add mis=
sing cleanups when usb_add_gadget_udc() fails
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: h8300-randconfig-s031-20200726 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-93-g4c6cbe55-dirty
        git checkout 602fb68e303fb96c9e4a5eb5f25ad0ce999df37d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dh8300 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/dwc2/platform.c:593:1: sparse: sparse: unused label 'error_d=
ebugfs'
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   arch/h8300/include/asm/io.h:26:18: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] b @@  =
   got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] b
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/scatterlist.h, include/linux/dma-mapping.h):
   arch/h8300/include/asm/io.h:44:11: sparse: sparse: cast removes address =
space '__iomem' of expression
   drivers/usb/dwc2/platform.c: note: in included file (through arch/h8300/=
include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32

# https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?id=
=3D602fb68e303fb96c9e4a5eb5f25ad0ce999df37d
git remote add balbi-usb https://git.kernel.org/pub/scm/linux/kernel/git/ba=
lbi/usb.git
git remote update balbi-usb
git checkout 602fb68e303fb96c9e4a5eb5f25ad0ce999df37d
vim +/error_debugfs +593 drivers/usb/dwc2/platform.c

65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  396  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  397  /**
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  398   * dwc2_driver_probe() - Called when the DWC_otg core is bound=
 to the DWC_otg
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  399   * driver
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  400   *
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  401   * @dev: Platform device
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  402   *
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  403   * This routine creates the driver components required to cont=
rol the device
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  404   * (core, HCD, and PCD) and initializes the device. The driver=
 components are
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  405   * stored in a dwc2_hsotg structure. A reference to the dwc2_h=
sotg is saved
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  406   * in the device private data. This allows the driver to acces=
s the dwc2_hsotg
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  407   * structure on subsequent calls to driver methods for this de=
vice.
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  408   */
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  409  static int dwc2_driver_probe(struct platform_device *dev)
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  410  {
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  411  	struct dwc2_hsotg *hsotg;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  412  	struct resource *res;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  413  	int retval;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  414  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  415  	hsotg =3D devm_kzalloc(&dev->dev, sizeof(*hsotg), GFP_KERNEL);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  416  	if (!hsotg)
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  417  		return -ENOMEM;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  418  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  419  	hsotg->dev =3D &dev->dev;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  420  =

642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  421  	/*
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  422  	 * Use reasonable defaults so platforms don't have to provide=
 these.
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  423  	 */
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  424  	if (!dev->dev.dma_mask)
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  425  		dev->dev.dma_mask =3D &dev->dev.coherent_dma_mask;
4cdbb4ff7fe456 drivers/staging/dwc2/platform.c Russell King            2013=
-06-10  426  	retval =3D dma_set_coherent_mask(&dev->dev, DMA_BIT_MASK(32));
42c6a25235677a drivers/usb/dwc2/platform.c     Stefan Wahren           2018=
-02-12  427  	if (retval) {
42c6a25235677a drivers/usb/dwc2/platform.c     Stefan Wahren           2018=
-02-12  428  		dev_err(&dev->dev, "can't set coherent DMA mask: %d\n", retv=
al);
4cdbb4ff7fe456 drivers/staging/dwc2/platform.c Russell King            2013=
-06-10  429  		return retval;
42c6a25235677a drivers/usb/dwc2/platform.c     Stefan Wahren           2018=
-02-12  430  	}
642f2ecc092f4d drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-05-17  431  =

5bf7e2883f1242 drivers/usb/dwc2/platform.c     Dejin Zheng             2020=
-03-24  432  	hsotg->regs =3D devm_platform_get_and_ioremap_resource(dev, 0=
, &res);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  433  	if (IS_ERR(hsotg->regs))
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  434  		return PTR_ERR(hsotg->regs);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  435  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  436  	dev_dbg(&dev->dev, "mapped PA %08lx to VA %p\n",
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  437  		(unsigned long)res->start, hsotg->regs);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  438  =

09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  439  	retval =3D dwc2_lowlevel_hw_init(hsotg);
ecb176c63ac49d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  440  	if (retval)
ecb176c63ac49d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  441  		return retval;
ecb176c63ac49d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  442  =

09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  443  	spin_lock_init(&hsotg->lock);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  444  =

a40a00318c7fcd drivers/usb/dwc2/platform.c     Heiko St=C3=BCbner          =
 2015-12-18  445  	hsotg->irq =3D platform_get_irq(dev, 0);
b33f37064b743d drivers/usb/dwc2/platform.c     Stephen Boyd            2019=
-07-30  446  	if (hsotg->irq < 0)
a40a00318c7fcd drivers/usb/dwc2/platform.c     Heiko St=C3=BCbner          =
 2015-12-18  447  		return hsotg->irq;
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  448  =

f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  449  	dev_dbg(hsotg->dev, "registering common handler for irq%d\n",
a40a00318c7fcd drivers/usb/dwc2/platform.c     Heiko St=C3=BCbner          =
 2015-12-18  450  		hsotg->irq);
a40a00318c7fcd drivers/usb/dwc2/platform.c     Heiko St=C3=BCbner          =
 2015-12-18  451  	retval =3D devm_request_irq(hsotg->dev, hsotg->irq,
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  452  				  dwc2_handle_common_intr, IRQF_SHARED,
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  453  				  dev_name(hsotg->dev), hsotg);
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  454  	if (retval)
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  455  		return retval;
f74875dc36135e drivers/usb/dwc2/platform.c     Stefan Wahren           2015=
-11-12  456  =

e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  457  	hsotg->vbus_supply =3D devm_regulator_get_optional(hsotg->dev=
, "vbus");
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  458  	if (IS_ERR(hsotg->vbus_supply)) {
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  459  		retval =3D PTR_ERR(hsotg->vbus_supply);
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  460  		hsotg->vbus_supply =3D NULL;
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  461  		if (retval !=3D -ENODEV)
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  462  			return retval;
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  463  	}
e0f681c2c11a25 drivers/usb/dwc2/platform.c     Fabrice Gasnier         2018=
-09-05  464  =

09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  465  	retval =3D dwc2_lowlevel_hw_enable(hsotg);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  466  	if (retval)
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  467  		return retval;
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  468  =

d9707490077bee drivers/usb/dwc2/platform.c     Bruno Meirelles Herrera 2018=
-08-27  469  	hsotg->needs_byte_swap =3D dwc2_check_core_endianness(hsotg);
d9707490077bee drivers/usb/dwc2/platform.c     Bruno Meirelles Herrera 2018=
-08-27  470  =

5268ed9d2e3b52 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  471  	retval =3D dwc2_get_dr_mode(hsotg);
5268ed9d2e3b52 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  472  	if (retval)
a6ef3e02542a33 drivers/usb/dwc2/platform.c     John Youn               2016=
-04-27  473  		goto error;
5268ed9d2e3b52 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  474  =

c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  475  	hsotg->need_phy_for_wake =3D
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  476  		of_property_read_bool(dev->dev.of_node,
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  477  				      "snps,need-phy-for-wake");
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  478  =

65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  479  	/*
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  480  	 * Before performing any core related operations
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  481  	 * check core version.
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  482  	 */
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  483  	retval =3D dwc2_check_core_version(hsotg);
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  484  	if (retval)
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  485  		goto error;
65dc2e72528610 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-05-21  486  =

03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  487  	/*
03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  488  	 * Reset before dwc2_get_hwparams() then it could get power-o=
n real
03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  489  	 * reset value form registers.
03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  490  	 */
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  491  	retval =3D dwc2_core_reset(hsotg, false);
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  492  	if (retval)
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  493  		goto error;
03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  494  =

03b32e4c9bd1b5 drivers/usb/dwc2/platform.c     John Youn               2016=
-01-11  495  	/* Detect config values from hardware */
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  496  	retval =3D dwc2_get_hwparams(hsotg);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  497  	if (retval)
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  498  		goto error;
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  499  =

13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  500  	/*
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  501  	 * For OTG cores, set the force mode bits to reflect the value
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  502  	 * of dr_mode. Force mode bits should not be touched at any
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  503  	 * other time after this.
13b1f8e25bfd1d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  504  	 */
25362d318371e1 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  505  	dwc2_force_dr_mode(hsotg);
263b7fb557f797 drivers/usb/dwc2/platform.c     John Youn               2015=
-12-17  506  =

334bbd4ebe1b34 drivers/usb/dwc2/platform.c     John Youn               2016=
-11-03  507  	retval =3D dwc2_init_params(hsotg);
334bbd4ebe1b34 drivers/usb/dwc2/platform.c     John Youn               2016=
-11-03  508  	if (retval)
334bbd4ebe1b34 drivers/usb/dwc2/platform.c     John Youn               2016=
-11-03  509  		goto error;
334bbd4ebe1b34 drivers/usb/dwc2/platform.c     John Youn               2016=
-11-03  510  =

a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  511  	if (hsotg->params.activate_stm_id_vb_detection) {
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  512  		u32 ggpio;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  513  =

a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  514  		hsotg->usb33d =3D devm_regulator_get(hsotg->dev, "usb33d");
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  515  		if (IS_ERR(hsotg->usb33d)) {
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  516  			retval =3D PTR_ERR(hsotg->usb33d);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  517  			if (retval !=3D -EPROBE_DEFER)
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  518  				dev_err(hsotg->dev,
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  519  					"failed to request usb33d supply: %d\n",
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  520  					retval);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  521  			goto error;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  522  		}
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  523  		retval =3D regulator_enable(hsotg->usb33d);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  524  		if (retval) {
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  525  			dev_err(hsotg->dev,
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  526  				"failed to enable usb33d supply: %d\n", retval);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  527  			goto error;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  528  		}
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  529  =

a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  530  		ggpio =3D dwc2_readl(hsotg, GGPIO);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  531  		ggpio |=3D GGPIO_STM32_OTG_GCCFG_IDEN;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  532  		ggpio |=3D GGPIO_STM32_OTG_GCCFG_VBDEN;
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  533  		dwc2_writel(hsotg, ggpio, GGPIO);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  534  	}
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  535  =

e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  536  	if (hsotg->dr_mode !=3D USB_DR_MODE_HOST) {
f3768997013e1c drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2017=
-12-25  537  		retval =3D dwc2_gadget_init(hsotg);
117777b2c3bb96 drivers/usb/dwc2/platform.c     Dinh Nguyen             2014=
-11-11  538  		if (retval)
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  539  			goto error_init;
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  540  		hsotg->gadget_enabled =3D 1;
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  541  	}
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  542  =

c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  543  	/*
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  544  	 * If we need PHY for wakeup we must be wakeup capable.
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  545  	 * When we have a device that can wake without the PHY we
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  546  	 * can adjust this condition.
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  547  	 */
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  548  	if (hsotg->need_phy_for_wake)
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  549  		device_set_wakeup_capable(&dev->dev, true);
c846b03ff76714 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-05-20  550  =

c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  551  	hsotg->reset_phy_on_wake =3D
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  552  		of_property_read_bool(dev->dev.of_node,
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  553  				      "snps,reset-phy-on-wake");
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  554  	if (hsotg->reset_phy_on_wake && !hsotg->phy) {
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  555  		dev_warn(hsotg->dev,
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  556  			 "Quirk reset-phy-on-wake only supports generic PHYs\n");
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  557  		hsotg->reset_phy_on_wake =3D false;
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  558  	}
c40cf7705e13d2 drivers/usb/dwc2/platform.c     Douglas Anderson        2019=
-04-16  559  =

e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  560  	if (hsotg->dr_mode !=3D USB_DR_MODE_PERIPHERAL) {
4fe160d51e4226 drivers/usb/dwc2/platform.c     Heiner Kallweit         2017=
-01-25  561  		retval =3D dwc2_hcd_init(hsotg);
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  562  		if (retval) {
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  563  			if (hsotg->gadget_enabled)
1f91b4cc03556b drivers/usb/dwc2/platform.c     Felipe Balbi            2015=
-08-06  564  				dwc2_hsotg_remove(hsotg);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  565  			goto error_init;
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  566  		}
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  567  		hsotg->hcd_enabled =3D 1;
e39af88f18dfe9 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-03-10  568  	}
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  569  =

5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  570  	platform_set_drvdata(dev, hsotg);
20fe440982e72d drivers/usb/dwc2/platform.c     Vardan Mikayelyan       2018=
-02-16  571  	hsotg->hibernated =3D 0;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  572  =

f91eea447ac32d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  573  	dwc2_debugfs_init(hsotg);
f91eea447ac32d drivers/usb/dwc2/platform.c     Mian Yousaf Kaukab      2015=
-04-29  574  =

09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  575  	/* Gadget code manages lowlevel hw on its own */
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  576  	if (hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL)
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  577  		dwc2_lowlevel_hw_disable(hsotg);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  578  =

207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  579  #if IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) || \
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  580  	IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  581  	/* Postponed adding a new gadget to the udc class driver list=
 */
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  582  	if (hsotg->gadget_enabled) {
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  583  		retval =3D usb_add_gadget_udc(hsotg->dev, &hsotg->gadget);
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  584  		if (retval) {
ac66bc02b04eeb drivers/usb/dwc2/platform.c     Marek Szyprowski        2020=
-07-16  585  			hsotg->gadget.udc =3D NULL;
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  586  			dwc2_hsotg_remove(hsotg);
602fb68e303fb9 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04  587  			goto error_debugfs;
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  588  		}
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  589  	}
207324a321a866 drivers/usb/dwc2/platform.c     Minas Harutyunyan       2020=
-06-09  590  #endif /* CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_R=
OLE */
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  591  	return 0;
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  592  =

602fb68e303fb9 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04 @593  error_debugfs:
602fb68e303fb9 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04  594  	dwc2_debugfs_exit(hsotg);
602fb68e303fb9 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04  595  	if (hsotg->hcd_enabled)
602fb68e303fb9 drivers/usb/dwc2/platform.c     Martin Blumenstingl     2020=
-07-04  596  		dwc2_hcd_remove(hsotg);
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  597  error_init:
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  598  	if (hsotg->params.activate_stm_id_vb_detection)
a415083a11cc76 drivers/usb/dwc2/platform.c     Amelie Delaunay         2020=
-01-24  599  		regulator_disable(hsotg->usb33d);
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  600  error:
ac66bc02b04eeb drivers/usb/dwc2/platform.c     Marek Szyprowski        2020=
-07-16  601  	if (hsotg->dr_mode !=3D USB_DR_MODE_PERIPHERAL)
09a75e85779014 drivers/usb/dwc2/platform.c     Marek Szyprowski        2015=
-10-14  602  		dwc2_lowlevel_hw_disable(hsotg);
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  603  	return retval;
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  604  }
5b9974b13e3648 drivers/staging/dwc2/platform.c Matthijs Kooijman       2013=
-04-22  605  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4285725092835311566==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AQA=
--===============4285725092835311566==--

