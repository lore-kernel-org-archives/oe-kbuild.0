Content-Type: multipart/mixed; boundary="===============1610837813747664428=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V1 RESEND 1/4] pci: add interface to create pci-ep device tree node
Date: Thu, 10 Mar 2022 03:14:30 +0800
Message-ID: <202203100338.8jox1rCr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1610837813747664428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220305052304.726050-2-lizhi.hou@xilinx.com>
References: <20220305052304.726050-2-lizhi.hou@xilinx.com>
TO: Lizhi Hou <lizhi.hou@xilinx.com>
TO: linux-pci(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: robh(a)kernel.org
CC: Lizhi Hou <lizhi.hou@xilinx.com>
CC: yilun.xu(a)intel.com
CC: maxz(a)xilinx.com
CC: sonal.santan(a)xilinx.com
CC: yliu(a)xilinx.com
CC: michal.simek(a)xilinx.com
CC: stefanos(a)xilinx.com
CC: trix(a)redhat.com
CC: mdf(a)kernel.org
CC: dwmw2(a)infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: Max Zhen <max.zhen@xilinx.com>

Hi Lizhi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on helgaas-pci/next linus/master pinchartl-media/d=
rm/du/next v5.17-rc7 next-20220309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Lizhi-Hou/Infrastructure-t=
o-define-apertures-in-a-PCIe-device-with-a-flattened-device-tree/20220307-1=
41939
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20220307 (https://download.01.org/0day-ci/arch=
ive/20220310/202203100338.8jox1rCr-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/of.c:762 devm_of_pci_create_bus_endpoint() error: double free o=
f 'prop'

vim +/prop +762 drivers/pci/of.c

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  663  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  664  /**
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  665   * devm_of_pci_create_bus_endpoin=
t - Create a device node for the given pci device.
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  666   * @pdev: PCI device pointer.
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  667   *
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  668   * For PCI device which uses flat=
tened device tree to describe apertures in its BARs,
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  669   * a device node for the given pc=
i device is required. Then the flattened device tree
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  670   * overlay from the device can be=
 applied to the base tree.
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  671   * The device node is under root =
node and act like bus node. It contains a "ranges"
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  672   * property which is used for add=
ress translation of its children. Each child node
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  673   * corresponds an aperture and us=
e BAR index and offset as its address.
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  674  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  675   * Returns 0 on success or a nega=
tive error-code on failure.
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  676   */
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  677  int devm_of_pci_create_bus_endpoi=
nt(struct pci_dev *pdev)
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  678  {
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  679  	struct property *proplist =3D NU=
LL;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  680  	struct device *dev =3D &pdev->de=
v;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  681  	int range_ncells, addr_ncells;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  682  	struct device_node *node;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  683  	void *prop =3D NULL;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  684  	u32 *range_cell;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  685  	__be32 val;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  686  	int i, ret;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  687  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  688  	node =3D of_ep_alloc_node(pdev, =
"pci-ep-bus");
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  689  	if (!node)
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  690  		return -ENOMEM;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  691  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  692  	/* the endpoint node works as 's=
imple-bus' to translate aperture addresses. */
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  693  	prop =3D "simple-bus";
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  694  	ret =3D of_ep_add_property(dev, =
&proplist, "compatible", strlen(prop) + 1, prop);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  695  	if (ret)
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  696  		goto cleanup;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  697  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  698  	/* The address and size cells of=
 nodes underneath are 2 */
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  699  	val =3D cpu_to_be32(2);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  700  	ret =3D of_ep_add_property(dev, =
&proplist, "#address-cells", sizeof(u32), &val);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  701  	if (ret)
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  702  		goto cleanup;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  703  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  704  	ret =3D of_ep_add_property(dev, =
&proplist, "#size-cells", sizeof(u32), &val);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  705  	if (ret)
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  706  		goto cleanup;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  707  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  708  	/* child address format: 0xIoooo=
ooo oooooooo, I =3D bar index, o =3D offset on bar */
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  709  	addr_ncells =3D of_n_addr_cells(=
node);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  710  	if (addr_ncells > 2) {
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  711  		/* does not support number of a=
ddress cells greater than 2 */
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  712  		ret =3D -EINVAL;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  713  		goto cleanup;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  714  	}
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  715  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  716  	/* range cells include <node add=
r cells> <child addr cells> <child size cells> */
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  717  	range_ncells =3D addr_ncells + 4;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  718  	prop =3D kzalloc(range_ncells * =
sizeof(u32) * PCI_STD_NUM_BARS, GFP_KERNEL);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  719  	if (!prop) {
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  720  		ret =3D -ENOMEM;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  721  		goto cleanup;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  722  	}
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  723  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  724  	range_cell =3D prop;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  725  	for (i =3D 0; i < PCI_STD_NUM_BA=
RS; i++) {
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  726  		if (!pci_resource_len(pdev, i))
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  727  			continue;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  728  		/* highest 4 bits of address ar=
e bar index */
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  729  		*(__be64 *)range_cell =3D cpu_t=
o_be64((u64)i << 60);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  730  		range_cell +=3D 2;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  731  		if (addr_ncells =3D=3D 2)
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  732  			*(__be64 *)range_cell =3D cpu_=
to_be64((u64)pci_resource_start(pdev, i));
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  733  		else
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  734  			*(__be32 *)range_cell =3D cpu_=
to_be32((u32)pci_resource_start(pdev, i));
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  735  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  736  		range_cell +=3D addr_ncells;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  737  		*(__be64 *)range_cell =3D cpu_t=
o_be64((u64)pci_resource_len(pdev, i));
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  738  		range_cell +=3D 2;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  739  	}
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  740  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  741  	/* error out if there is not PCI=
 BAR been found */
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  742  	if ((void *)range_cell =3D=3D pr=
op) {
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  743  		ret =3D -EINVAL;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  744  		goto cleanup;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  745  	}
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  746  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  747  	ret =3D of_ep_add_property(dev, =
&proplist, "ranges", (void *)range_cell - prop, prop);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  748  	kfree(prop);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  749  	if (ret)
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  750  		goto cleanup;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  751  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  752  	node->properties =3D proplist;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  753  	ret =3D of_attach_node(node);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  754  	if (ret)
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  755  		goto cleanup;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  756  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  757  	devres_add(dev, node);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  758  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  759  	return 0;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  760  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  761  cleanup:
3a2c08c0f0ef77 Lizhi Hou 2022-03-04 @762  	kfree(prop);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  763  	if (node)
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  764  		devres_free(node);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  765  =

3a2c08c0f0ef77 Lizhi Hou 2022-03-04  766  	return ret;
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  767  }
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  768  EXPORT_SYMBOL_GPL(devm_of_pci_cre=
ate_bus_endpoint);
3a2c08c0f0ef77 Lizhi Hou 2022-03-04  769  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1610837813747664428==--

