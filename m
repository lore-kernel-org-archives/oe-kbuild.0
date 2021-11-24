Content-Type: multipart/mixed; boundary="===============3312157593479728779=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/cdns3/cdnsp-pci.c:181 cdnsp_pci_probe() warn: possible memory leak of 'cdnsp'
Date: Thu, 25 Nov 2021 02:05:39 +0800
Message-ID: <202111250155.wjVjM01X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3312157593479728779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Pawel Laszczak <pawell@cadence.com>
CC: Peter Chen <peter.chen@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: 3d82904559f4f5a2622db1b21de3edf2eded7664 usb: cdnsp: cdns3 Add main=
 part of Cadence USBSSP DRD Driver
date:   11 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001-20211124 (https://download.01.org/0day-ci/ar=
chive/20211125/202111250155.wjVjM01X-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/cdns3/cdnsp-pci.c:181 cdnsp_pci_probe() warn: possible memory l=
eak of 'cdnsp'

vim +/cdnsp +181 drivers/usb/cdns3/cdnsp-pci.c

3d82904559f4f5 Pawel Laszczak 2020-12-07   57  =

3d82904559f4f5 Pawel Laszczak 2020-12-07   58  static int cdnsp_pci_probe(s=
truct pci_dev *pdev,
3d82904559f4f5 Pawel Laszczak 2020-12-07   59  			   const struct pci_devic=
e_id *id)
3d82904559f4f5 Pawel Laszczak 2020-12-07   60  {
3d82904559f4f5 Pawel Laszczak 2020-12-07   61  	struct device *dev =3D &pde=
v->dev;
3d82904559f4f5 Pawel Laszczak 2020-12-07   62  	struct pci_dev *func;
3d82904559f4f5 Pawel Laszczak 2020-12-07   63  	struct resource *res;
3d82904559f4f5 Pawel Laszczak 2020-12-07   64  	struct cdns *cdnsp;
3d82904559f4f5 Pawel Laszczak 2020-12-07   65  	int ret;
3d82904559f4f5 Pawel Laszczak 2020-12-07   66  =

3d82904559f4f5 Pawel Laszczak 2020-12-07   67  	/*
3d82904559f4f5 Pawel Laszczak 2020-12-07   68  	 * For GADGET/HOST PCI (dev=
fn) function number is 0,
3d82904559f4f5 Pawel Laszczak 2020-12-07   69  	 * for OTG PCI (devfn) func=
tion number is 1.
3d82904559f4f5 Pawel Laszczak 2020-12-07   70  	 */
3d82904559f4f5 Pawel Laszczak 2020-12-07   71  	if (!id || (pdev->devfn !=
=3D PCI_DEV_FN_HOST_DEVICE &&
3d82904559f4f5 Pawel Laszczak 2020-12-07   72  		    pdev->devfn !=3D PCI_D=
EV_FN_OTG))
3d82904559f4f5 Pawel Laszczak 2020-12-07   73  		return -EINVAL;
3d82904559f4f5 Pawel Laszczak 2020-12-07   74  =

3d82904559f4f5 Pawel Laszczak 2020-12-07   75  	func =3D cdnsp_get_second_f=
un(pdev);
3d82904559f4f5 Pawel Laszczak 2020-12-07   76  	if (!func)
3d82904559f4f5 Pawel Laszczak 2020-12-07   77  		return -EINVAL;
3d82904559f4f5 Pawel Laszczak 2020-12-07   78  =

3d82904559f4f5 Pawel Laszczak 2020-12-07   79  	if (func->class =3D=3D PCI_=
CLASS_SERIAL_USB_XHCI ||
3d82904559f4f5 Pawel Laszczak 2020-12-07   80  	    pdev->class =3D=3D PCI_=
CLASS_SERIAL_USB_XHCI) {
3d82904559f4f5 Pawel Laszczak 2020-12-07   81  		ret =3D -EINVAL;
3d82904559f4f5 Pawel Laszczak 2020-12-07   82  		goto put_pci;
3d82904559f4f5 Pawel Laszczak 2020-12-07   83  	}
3d82904559f4f5 Pawel Laszczak 2020-12-07   84  =

3d82904559f4f5 Pawel Laszczak 2020-12-07   85  	ret =3D pcim_enable_device(=
pdev);
3d82904559f4f5 Pawel Laszczak 2020-12-07   86  	if (ret) {
3d82904559f4f5 Pawel Laszczak 2020-12-07   87  		dev_err(&pdev->dev, "Enabl=
ing PCI device has failed %d\n", ret);
3d82904559f4f5 Pawel Laszczak 2020-12-07   88  		goto put_pci;
3d82904559f4f5 Pawel Laszczak 2020-12-07   89  	}
3d82904559f4f5 Pawel Laszczak 2020-12-07   90  =

3d82904559f4f5 Pawel Laszczak 2020-12-07   91  	pci_set_master(pdev);
3d82904559f4f5 Pawel Laszczak 2020-12-07   92  	if (pci_is_enabled(func)) {
3d82904559f4f5 Pawel Laszczak 2020-12-07   93  		cdnsp =3D pci_get_drvdata(=
func);
3d82904559f4f5 Pawel Laszczak 2020-12-07   94  	} else {
3d82904559f4f5 Pawel Laszczak 2020-12-07   95  		cdnsp =3D kzalloc(sizeof(*=
cdnsp), GFP_KERNEL);
3d82904559f4f5 Pawel Laszczak 2020-12-07   96  		if (!cdnsp) {
3d82904559f4f5 Pawel Laszczak 2020-12-07   97  			ret =3D -ENOMEM;
3d82904559f4f5 Pawel Laszczak 2020-12-07   98  			goto disable_pci;
3d82904559f4f5 Pawel Laszczak 2020-12-07   99  		}
3d82904559f4f5 Pawel Laszczak 2020-12-07  100  	}
3d82904559f4f5 Pawel Laszczak 2020-12-07  101  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  102  	/* For GADGET device functi=
on number is 0. */
3d82904559f4f5 Pawel Laszczak 2020-12-07  103  	if (pdev->devfn =3D=3D 0) {
3d82904559f4f5 Pawel Laszczak 2020-12-07  104  		resource_size_t rsrc_start=
, rsrc_len;
3d82904559f4f5 Pawel Laszczak 2020-12-07  105  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  106  		/* Function 0: host(BAR_0)=
 + device(BAR_1).*/
3d82904559f4f5 Pawel Laszczak 2020-12-07  107  		dev_dbg(dev, "Initialize r=
esources\n");
3d82904559f4f5 Pawel Laszczak 2020-12-07  108  		rsrc_start =3D pci_resourc=
e_start(pdev, PCI_BAR_DEV);
3d82904559f4f5 Pawel Laszczak 2020-12-07  109  		rsrc_len =3D pci_resource_=
len(pdev, PCI_BAR_DEV);
3d82904559f4f5 Pawel Laszczak 2020-12-07  110  		res =3D devm_request_mem_r=
egion(dev, rsrc_start, rsrc_len, "dev");
3d82904559f4f5 Pawel Laszczak 2020-12-07  111  		if (!res) {
3d82904559f4f5 Pawel Laszczak 2020-12-07  112  			dev_dbg(dev, "controller =
already in use\n");
3d82904559f4f5 Pawel Laszczak 2020-12-07  113  			ret =3D -EBUSY;
3d82904559f4f5 Pawel Laszczak 2020-12-07  114  			goto free_cdnsp;
3d82904559f4f5 Pawel Laszczak 2020-12-07  115  		}
3d82904559f4f5 Pawel Laszczak 2020-12-07  116  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  117  		cdnsp->dev_regs =3D devm_i=
oremap(dev, rsrc_start, rsrc_len);
3d82904559f4f5 Pawel Laszczak 2020-12-07  118  		if (!cdnsp->dev_regs) {
3d82904559f4f5 Pawel Laszczak 2020-12-07  119  			dev_dbg(dev, "error mappi=
ng memory\n");
3d82904559f4f5 Pawel Laszczak 2020-12-07  120  			ret =3D -EFAULT;
3d82904559f4f5 Pawel Laszczak 2020-12-07  121  			goto free_cdnsp;
3d82904559f4f5 Pawel Laszczak 2020-12-07  122  		}
3d82904559f4f5 Pawel Laszczak 2020-12-07  123  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  124  		cdnsp->dev_irq =3D pdev->i=
rq;
3d82904559f4f5 Pawel Laszczak 2020-12-07  125  		dev_dbg(dev, "USBSS-DEV ph=
ysical base addr: %pa\n",
3d82904559f4f5 Pawel Laszczak 2020-12-07  126  			&rsrc_start);
3d82904559f4f5 Pawel Laszczak 2020-12-07  127  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  128  		res =3D &cdnsp->xhci_res[0=
];
3d82904559f4f5 Pawel Laszczak 2020-12-07  129  		res->start =3D pci_resourc=
e_start(pdev, PCI_BAR_HOST);
3d82904559f4f5 Pawel Laszczak 2020-12-07  130  		res->end =3D pci_resource_=
end(pdev, PCI_BAR_HOST);
3d82904559f4f5 Pawel Laszczak 2020-12-07  131  		res->name =3D "xhci";
3d82904559f4f5 Pawel Laszczak 2020-12-07  132  		res->flags =3D IORESOURCE_=
MEM;
3d82904559f4f5 Pawel Laszczak 2020-12-07  133  		dev_dbg(dev, "USBSS-XHCI p=
hysical base addr: %pa\n",
3d82904559f4f5 Pawel Laszczak 2020-12-07  134  			&res->start);
3d82904559f4f5 Pawel Laszczak 2020-12-07  135  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  136  		/* Interrupt for XHCI, */
3d82904559f4f5 Pawel Laszczak 2020-12-07  137  		res =3D &cdnsp->xhci_res[1=
];
3d82904559f4f5 Pawel Laszczak 2020-12-07  138  		res->start =3D pdev->irq;
3d82904559f4f5 Pawel Laszczak 2020-12-07  139  		res->name =3D "host";
3d82904559f4f5 Pawel Laszczak 2020-12-07  140  		res->flags =3D IORESOURCE_=
IRQ;
3d82904559f4f5 Pawel Laszczak 2020-12-07  141  	} else {
3d82904559f4f5 Pawel Laszczak 2020-12-07  142  		res =3D &cdnsp->otg_res;
3d82904559f4f5 Pawel Laszczak 2020-12-07  143  		res->start =3D pci_resourc=
e_start(pdev, PCI_BAR_OTG);
3d82904559f4f5 Pawel Laszczak 2020-12-07  144  		res->end =3D   pci_resourc=
e_end(pdev, PCI_BAR_OTG);
3d82904559f4f5 Pawel Laszczak 2020-12-07  145  		res->name =3D "otg";
3d82904559f4f5 Pawel Laszczak 2020-12-07  146  		res->flags =3D IORESOURCE_=
MEM;
3d82904559f4f5 Pawel Laszczak 2020-12-07  147  		dev_dbg(dev, "CDNSP-DRD ph=
ysical base addr: %pa\n",
3d82904559f4f5 Pawel Laszczak 2020-12-07  148  			&res->start);
3d82904559f4f5 Pawel Laszczak 2020-12-07  149  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  150  		/* Interrupt for OTG/DRD. =
*/
3d82904559f4f5 Pawel Laszczak 2020-12-07  151  		cdnsp->otg_irq =3D pdev->i=
rq;
3d82904559f4f5 Pawel Laszczak 2020-12-07  152  	}
3d82904559f4f5 Pawel Laszczak 2020-12-07  153  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  154  	if (pci_is_enabled(func)) {
3d82904559f4f5 Pawel Laszczak 2020-12-07  155  		cdnsp->dev =3D dev;
3d82904559f4f5 Pawel Laszczak 2020-12-07  156  		cdnsp->gadget_init =3D cdn=
sp_gadget_init;
3d82904559f4f5 Pawel Laszczak 2020-12-07  157  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  158  		ret =3D cdns_init(cdnsp);
3d82904559f4f5 Pawel Laszczak 2020-12-07  159  		if (ret)
3d82904559f4f5 Pawel Laszczak 2020-12-07  160  			goto free_cdnsp;
3d82904559f4f5 Pawel Laszczak 2020-12-07  161  	}
3d82904559f4f5 Pawel Laszczak 2020-12-07  162  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  163  	pci_set_drvdata(pdev, cdnsp=
);
3d82904559f4f5 Pawel Laszczak 2020-12-07  164  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  165  	device_wakeup_enable(&pdev-=
>dev);
3d82904559f4f5 Pawel Laszczak 2020-12-07  166  	if (pci_dev_run_wake(pdev))
3d82904559f4f5 Pawel Laszczak 2020-12-07  167  		pm_runtime_put_noidle(&pde=
v->dev);
3d82904559f4f5 Pawel Laszczak 2020-12-07  168  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  169  	return 0;
3d82904559f4f5 Pawel Laszczak 2020-12-07  170  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  171  free_cdnsp:
3d82904559f4f5 Pawel Laszczak 2020-12-07  172  	if (!pci_is_enabled(func))
3d82904559f4f5 Pawel Laszczak 2020-12-07  173  		kfree(cdnsp);
3d82904559f4f5 Pawel Laszczak 2020-12-07  174  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  175  disable_pci:
3d82904559f4f5 Pawel Laszczak 2020-12-07  176  	pci_disable_device(pdev);
3d82904559f4f5 Pawel Laszczak 2020-12-07  177  =

3d82904559f4f5 Pawel Laszczak 2020-12-07  178  put_pci:
3d82904559f4f5 Pawel Laszczak 2020-12-07  179  	pci_dev_put(func);
3d82904559f4f5 Pawel Laszczak 2020-12-07  180  =

3d82904559f4f5 Pawel Laszczak 2020-12-07 @181  	return ret;
3d82904559f4f5 Pawel Laszczak 2020-12-07  182  }
3d82904559f4f5 Pawel Laszczak 2020-12-07  183  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3312157593479728779==--

