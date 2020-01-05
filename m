Content-Type: multipart/mixed; boundary="===============2875746756443991068=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 2/2] PCI: Versal CPM: Add support for Versal CPM Root Port driver
Date: Sun, 05 Jan 2020 21:49:53 +0300
Message-ID: <20200105184953.GF3889@kadam>
In-Reply-To: <1576842072-32027-3-git-send-email-bharat.kumar.gogada@xilinx.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2875746756443991068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Bharat,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Bharat-Kumar-Gogada/Adding=
-support-for-versal-CPM-as-Root-Port-driver/20191223-193219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/pci/controller/pcie-xilinx-cpm.c:330 xilinx_cpm_pcie_init_irq_domai=
n() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/pci/controller/pcie-xilinx-cpm.c:338 xilinx_cpm_pcie_init_irq_domai=
n() warn: passing zero to 'PTR_ERR'

# https://github.com/0day-ci/linux/commit/f107713acb796e598f16a23b33af74fa3=
82921b2
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f107713acb796e598f16a23b33af74fa382921b2
vim +/PTR_ERR +330 drivers/pci/controller/pcie-xilinx-cpm.c

f107713acb796e Bharat Kumar Gogada 2019-12-20  320  static int xilinx_cpm_p=
cie_init_irq_domain(struct xilinx_cpm_pcie_port *port)
f107713acb796e Bharat Kumar Gogada 2019-12-20  321  {
f107713acb796e Bharat Kumar Gogada 2019-12-20  322  	struct device *dev =3D=
 port->dev;
f107713acb796e Bharat Kumar Gogada 2019-12-20  323  	struct device_node *no=
de =3D dev->of_node;
f107713acb796e Bharat Kumar Gogada 2019-12-20  324  	struct device_node *pc=
ie_intc_node;
f107713acb796e Bharat Kumar Gogada 2019-12-20  325  =

f107713acb796e Bharat Kumar Gogada 2019-12-20  326  	/* Setup INTx */
f107713acb796e Bharat Kumar Gogada 2019-12-20  327  	pcie_intc_node =3D of_=
get_next_child(node, NULL);
f107713acb796e Bharat Kumar Gogada 2019-12-20  328  	if (!pcie_intc_node) {
                                                            ^^^^^^^^^^^^^^^

f107713acb796e Bharat Kumar Gogada 2019-12-20  329  		dev_err(dev, "No PCIe=
 Intc node found\n");
f107713acb796e Bharat Kumar Gogada 2019-12-20 @330  		return PTR_ERR(pcie_i=
ntc_node);
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
(This means success).

f107713acb796e Bharat Kumar Gogada 2019-12-20  331  	}
f107713acb796e Bharat Kumar Gogada 2019-12-20  332  =

f107713acb796e Bharat Kumar Gogada 2019-12-20  333  	port->leg_domain =3D i=
rq_domain_add_linear(pcie_intc_node, INTX_NUM,
f107713acb796e Bharat Kumar Gogada 2019-12-20  334  						 &intx_domain_ops,
f107713acb796e Bharat Kumar Gogada 2019-12-20  335  						 port);
f107713acb796e Bharat Kumar Gogada 2019-12-20  336  	if (!port->leg_domain)=
 {
f107713acb796e Bharat Kumar Gogada 2019-12-20  337  		dev_err(dev, "Failed =
to get a INTx IRQ domain\n");
f107713acb796e Bharat Kumar Gogada 2019-12-20  338  		return PTR_ERR(port->=
leg_domain);
f107713acb796e Bharat Kumar Gogada 2019-12-20  339  	}
f107713acb796e Bharat Kumar Gogada 2019-12-20  340  =

f107713acb796e Bharat Kumar Gogada 2019-12-20  341  	return 0;
f107713acb796e Bharat Kumar Gogada 2019-12-20  342  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============2875746756443991068==--

