Content-Type: multipart/mixed; boundary="===============3455457684727578004=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [char-misc:char-misc-next 20/24] drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c:48 gp_aux_bus_probe() warn: possible memory leak of 'aux_bus'
Date: Mon, 05 Sep 2022 13:55:35 +0800
Message-ID: <202209051355.aE8t3yUt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3455457684727578004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t char-misc-next
head:   4ec7ac90ff399b7d9af81cc8afd430a22786c61b
commit: 393fc2f5948fd340d016a9557eea6e1ac2f6c60c [20/24] misc: microchip: p=
ci1xxxx: load auxiliary bus driver for the PIO function in the multi-functi=
on endpoint of pci1xxxx device.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: microblaze-randconfig-m041-20220905 (https://download.01.org/0day-c=
i/archive/20220905/202209051355.aE8t3yUt-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c:48 gp_aux_bus_probe() warn: p=
ossible memory leak of 'aux_bus'
drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c:93 gp_aux_bus_probe() warn: u=
nsigned 'pdev->irq' is never less than zero.

vim +/aux_bus +48 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   31  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   32  static int gp_aux_bus=
_probe(struct pci_dev *pdev, const struct pci_device_id *id)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   33  {
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   34  	struct aux_bus_devic=
e *aux_bus;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   35  	int retval;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   36  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   37  	retval =3D pcim_enab=
le_device(pdev);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   38  	if (retval)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   39  		return retval;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   40  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   41  	aux_bus =3D kzalloc(=
sizeof(*aux_bus), GFP_KERNEL);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   42  	if (!aux_bus)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   43  		return -ENOMEM;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   44  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   45  	aux_bus->aux_device_=
wrapper[0] =3D kzalloc(sizeof(*aux_bus->aux_device_wrapper[0]),
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   46  						 GFP_KERNEL);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   47  	if (!aux_bus->aux_de=
vice_wrapper[0])
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  @48  		return -ENOMEM;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   49  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   50  	retval =3D ida_alloc=
(&gp_client_ida, GFP_KERNEL);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   51  	if (retval < 0)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   52  		goto err_ida_alloc_=
0;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   53  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   54  	aux_bus->aux_device_=
wrapper[0]->aux_dev.name =3D aux_dev_otp_e2p_name;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   55  	aux_bus->aux_device_=
wrapper[0]->aux_dev.dev.parent =3D &pdev->dev;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   56  	aux_bus->aux_device_=
wrapper[0]->aux_dev.dev.release =3D gp_auxiliary_device_release;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   57  	aux_bus->aux_device_=
wrapper[0]->aux_dev.id =3D retval;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   58  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   59  	aux_bus->aux_device_=
wrapper[0]->gp_aux_data.region_start =3D pci_resource_start(pdev, 0);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   60  	aux_bus->aux_device_=
wrapper[0]->gp_aux_data.region_length =3D pci_resource_end(pdev, 0);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   61  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   62  	retval =3D auxiliary=
_device_init(&aux_bus->aux_device_wrapper[0]->aux_dev);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   63  	if (retval < 0)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   64  		goto err_aux_dev_in=
it_0;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   65  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   66  	retval =3D auxiliary=
_device_add(&aux_bus->aux_device_wrapper[0]->aux_dev);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   67  	if (retval)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   68  		goto err_aux_dev_ad=
d_0;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   69  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   70  	aux_bus->aux_device_=
wrapper[1] =3D kzalloc(sizeof(*aux_bus->aux_device_wrapper[1]),
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   71  						 GFP_KERNEL);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   72  	if (!aux_bus->aux_de=
vice_wrapper[1])
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   73  		return -ENOMEM;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   74  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   75  	retval =3D ida_alloc=
(&gp_client_ida, GFP_KERNEL);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   76  	if (retval < 0)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   77  		goto err_ida_alloc_=
1;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   78  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   79  	aux_bus->aux_device_=
wrapper[1]->aux_dev.name =3D aux_dev_gpio_name;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   80  	aux_bus->aux_device_=
wrapper[1]->aux_dev.dev.parent =3D &pdev->dev;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   81  	aux_bus->aux_device_=
wrapper[1]->aux_dev.dev.release =3D gp_auxiliary_device_release;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   82  	aux_bus->aux_device_=
wrapper[1]->aux_dev.id =3D retval;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   83  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   84  	aux_bus->aux_device_=
wrapper[1]->gp_aux_data.region_start =3D pci_resource_start(pdev, 0);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   85  	aux_bus->aux_device_=
wrapper[1]->gp_aux_data.region_length =3D pci_resource_end(pdev, 0);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   86  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   87  	retval =3D pci_alloc=
_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   88  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   89  	if (retval < 0)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   90  		return retval;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   91  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   92  	pdev->irq =3D pci_ir=
q_vector(pdev, 0);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  @93  	if (pdev->irq < 0)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   94  		return retval;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   95  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   96  	aux_bus->aux_device_=
wrapper[1]->gp_aux_data.irq_num =3D pdev->irq;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   97  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   98  	retval =3D auxiliary=
_device_init(&aux_bus->aux_device_wrapper[1]->aux_dev);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25   99  	if (retval < 0)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  100  		goto err_aux_dev_in=
it_1;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  101  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  102  	retval =3D auxiliary=
_device_add(&aux_bus->aux_device_wrapper[1]->aux_dev);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  103  	if (retval)
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  104  		goto err_aux_dev_ad=
d_1;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  105  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  106  	pci_set_drvdata(pdev=
, aux_bus);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  107  	pci_set_master(pdev);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  108  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  109  	return 0;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  110  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  111  err_aux_dev_add_1:
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  112  	auxiliary_device_uni=
nit(&aux_bus->aux_device_wrapper[1]->aux_dev);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  113  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  114  err_aux_dev_init_1:
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  115  	ida_free(&gp_client_=
ida, aux_bus->aux_device_wrapper[1]->aux_dev.id);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  116  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  117  err_ida_alloc_1:
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  118  	kfree(aux_bus->aux_d=
evice_wrapper[1]);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  119  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  120  err_aux_dev_add_0:
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  121  	auxiliary_device_uni=
nit(&aux_bus->aux_device_wrapper[0]->aux_dev);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  122  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  123  err_aux_dev_init_0:
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  124  	ida_free(&gp_client_=
ida, aux_bus->aux_device_wrapper[0]->aux_dev.id);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  125  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  126  err_ida_alloc_0:
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  127  	kfree(aux_bus->aux_d=
evice_wrapper[0]);
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  128  =

393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  129  	return retval;
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  130  }
393fc2f5948fd3 Kumaravel Thiagarajan 2022-08-25  131  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3455457684727578004==--

