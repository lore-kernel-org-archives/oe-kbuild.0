Content-Type: multipart/mixed; boundary="===============5400090688916410301=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 15/21] drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c:258 proc_thermal_pci_probe() warn: missing error code 'ret'
Date: Sat, 18 Dec 2021 14:57:23 +0800
Message-ID: <202112181418.z7X0aTMV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5400090688916410301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC: "Dutta, Ranjan" <ranjan.dutta@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   1295e3a3b1ca09035005acb32a98dedf96ca3a80
commit: 81915272ac5c5c670876e773a3febc7ec67268e1 [15/21] thermal/drivers/in=
t340x/processor_thermal: Add PCI MMIO based thermal driver
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-m001-20211216 (https://download.01.org/0day-ci/ar=
chive/20211218/202112181418.z7X0aTMV-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c:258 pr=
oc_thermal_pci_probe() warn: missing error code 'ret'

vim +/ret +258 drivers/thermal/intel/int340x_thermal/processor_thermal_devi=
ce_pci.c

81915272ac5c5c Srinivas Pandruvada 2021-05-25  214  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  215  static int proc_thermal=
_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
81915272ac5c5c Srinivas Pandruvada 2021-05-25  216  {
81915272ac5c5c Srinivas Pandruvada 2021-05-25  217  	struct proc_thermal_de=
vice *proc_priv;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  218  	struct proc_thermal_pc=
i *pci_info;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  219  	int irq_flag =3D 0, ir=
q, ret;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  220  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  221  	proc_priv =3D devm_kza=
lloc(&pdev->dev, sizeof(*proc_priv), GFP_KERNEL);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  222  	if (!proc_priv)
81915272ac5c5c Srinivas Pandruvada 2021-05-25  223  		return -ENOMEM;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  224  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  225  	pci_info =3D devm_kzal=
loc(&pdev->dev, sizeof(*pci_info), GFP_KERNEL);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  226  	if (!pci_info)
81915272ac5c5c Srinivas Pandruvada 2021-05-25  227  		return -ENOMEM;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  228  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  229  	pci_info->pdev =3D pde=
v;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  230  	ret =3D pcim_enable_de=
vice(pdev);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  231  	if (ret < 0) {
81915272ac5c5c Srinivas Pandruvada 2021-05-25  232  		dev_err(&pdev->dev, "=
error: could not enable device\n");
81915272ac5c5c Srinivas Pandruvada 2021-05-25  233  		return ret;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  234  	}
81915272ac5c5c Srinivas Pandruvada 2021-05-25  235  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  236  	pci_set_master(pdev);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  237  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  238  	INIT_DELAYED_WORK(&pci=
_info->work, proc_thermal_threshold_work_fn);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  239  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  240  	ret =3D proc_thermal_a=
dd(&pdev->dev, proc_priv);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  241  	if (ret) {
81915272ac5c5c Srinivas Pandruvada 2021-05-25  242  		dev_err(&pdev->dev, "=
error: proc_thermal_add, will continue\n");
81915272ac5c5c Srinivas Pandruvada 2021-05-25  243  		pci_info->no_legacy =
=3D 1;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  244  	}
81915272ac5c5c Srinivas Pandruvada 2021-05-25  245  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  246  	proc_priv->priv_data =
=3D pci_info;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  247  	pci_info->proc_priv =
=3D proc_priv;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  248  	pci_set_drvdata(pdev, =
proc_priv);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  249  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  250  	ret =3D proc_thermal_m=
mio_add(pdev, proc_priv, id->driver_data);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  251  	if (ret)
81915272ac5c5c Srinivas Pandruvada 2021-05-25  252  		goto err_ret_thermal;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  253  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  254  	pci_info->tzone =3D th=
ermal_zone_device_register("TCPU_PCI", 1, 1, pci_info,
81915272ac5c5c Srinivas Pandruvada 2021-05-25  255  							&tzone_ops,
81915272ac5c5c Srinivas Pandruvada 2021-05-25  256  							&tzone_params, 0=
, 0);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  257  	if (IS_ERR(pci_info->t=
zone))
81915272ac5c5c Srinivas Pandruvada 2021-05-25 @258  		goto err_ret_mmio;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  259  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  260  	/* request and enable =
interrupt */
81915272ac5c5c Srinivas Pandruvada 2021-05-25  261  	ret =3D pci_alloc_irq_=
vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  262  	if (ret < 0) {
81915272ac5c5c Srinivas Pandruvada 2021-05-25  263  		dev_err(&pdev->dev, "=
Failed to allocate vectors!\n");
81915272ac5c5c Srinivas Pandruvada 2021-05-25  264  		goto err_ret_tzone;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  265  	}
81915272ac5c5c Srinivas Pandruvada 2021-05-25  266  	if (!pdev->msi_enabled=
 && !pdev->msix_enabled)
81915272ac5c5c Srinivas Pandruvada 2021-05-25  267  		irq_flag =3D IRQF_SHA=
RED;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  268  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  269  	irq =3D  pci_irq_vecto=
r(pdev, 0);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  270  	ret =3D devm_request_t=
hreaded_irq(&pdev->dev, irq,
81915272ac5c5c Srinivas Pandruvada 2021-05-25  271  					proc_thermal_irq_h=
andler, NULL,
81915272ac5c5c Srinivas Pandruvada 2021-05-25  272  					irq_flag, KBUILD_M=
ODNAME, pci_info);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  273  	if (ret) {
81915272ac5c5c Srinivas Pandruvada 2021-05-25  274  		dev_err(&pdev->dev, "=
Request IRQ %d failed\n", pdev->irq);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  275  		goto err_free_vectors;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  276  	}
81915272ac5c5c Srinivas Pandruvada 2021-05-25  277  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  278  	return 0;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  279  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  280  err_free_vectors:
81915272ac5c5c Srinivas Pandruvada 2021-05-25  281  	pci_free_irq_vectors(p=
dev);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  282  err_ret_tzone:
81915272ac5c5c Srinivas Pandruvada 2021-05-25  283  	thermal_zone_device_un=
register(pci_info->tzone);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  284  err_ret_mmio:
81915272ac5c5c Srinivas Pandruvada 2021-05-25  285  	proc_thermal_mmio_remo=
ve(pdev, proc_priv);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  286  err_ret_thermal:
81915272ac5c5c Srinivas Pandruvada 2021-05-25  287  	if (!pci_info->no_lega=
cy)
81915272ac5c5c Srinivas Pandruvada 2021-05-25  288  		proc_thermal_remove(p=
roc_priv);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  289  	pci_disable_device(pde=
v);
81915272ac5c5c Srinivas Pandruvada 2021-05-25  290  =

81915272ac5c5c Srinivas Pandruvada 2021-05-25  291  	return ret;
81915272ac5c5c Srinivas Pandruvada 2021-05-25  292  }
81915272ac5c5c Srinivas Pandruvada 2021-05-25  293  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5400090688916410301==--

