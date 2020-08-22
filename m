Content-Type: multipart/mixed; boundary="===============0425463379328645395=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/pci.c:230:5: warning: Variable 'rc' is reassigned a value before the old one has been used.
Date: Sun, 23 Aug 2020 04:29:01 +0800
Message-ID: <202008230458.jX5I4OOB%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0425463379328645395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Oded Gabbay <oded.gabbay@gmail.com>
CC: Omer Shpigelman <oshpigelman@habana.ai>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c3d8f220d01220a5b253e422be407d068dc65511
commit: 70b2f993ea4a79c298aac4ec1c58089020536ba5 habanalabs: create common =
folder
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
compiler: arc-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/misc/habanalabs/common/pci.c:230:5: warning: Variable 'rc' is re=
assigned a value before the old one has been used. [redundantAssignment]
    rc =3D hl_pci_iatu_write(hdev, offset + 0x14,
       ^
   drivers/misc/habanalabs/common/pci.c:225:6: note: Variable 'rc' is reass=
igned a value before the old one has been used.
     rc |=3D hl_pci_iatu_write(hdev, offset + 0x10,
        ^
   drivers/misc/habanalabs/common/pci.c:230:5: note: Variable 'rc' is reass=
igned a value before the old one has been used.
    rc =3D hl_pci_iatu_write(hdev, offset + 0x14,
       ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D70b2f993ea4a79c298aac4ec1c58089020536ba5
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 70b2f993ea4a79c298aac4ec1c58089020536ba5
vim +/rc +230 drivers/misc/habanalabs/common/pci.c

b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  194  =

b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  195  /=
**
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  196   =
* hl_pci_set_inbound_region() - Configure inbound region
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  197   =
* @hdev: Pointer to hl_device structure.
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  198   =
* @region: Inbound region number.
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  199   =
* @pci_region: Inbound region parameters.
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  200   *
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  201   =
* Configure the iATU inbound region.
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  202   *
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  203   =
* Return: 0 on success, negative value for failure.
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  204   =
*/
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  205  i=
nt hl_pci_set_inbound_region(struct hl_device *hdev, u8 region,
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  206  	=
	struct hl_inbound_pci_region *pci_region)
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  207  {
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  208  	=
struct asic_fixed_properties *prop =3D &hdev->asic_prop;
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  209  	=
u64 bar_phys_base, region_base, region_end_address;
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  210  	=
u32 offset, ctrl_reg_val;
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  211  	=
int rc =3D 0;
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  212  =

f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  213  	=
/* region offset */
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  214  	=
offset =3D (0x200 * region) + 0x100;
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  215  =

f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  216  	=
if (pci_region->mode =3D=3D PCI_ADDRESS_MATCH_MODE) {
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  217  	=
	bar_phys_base =3D hdev->pcie_bar_phys[pci_region->bar];
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  218  	=
	region_base =3D bar_phys_base + pci_region->offset_in_bar;
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  219  	=
	region_end_address =3D region_base + pci_region->size - 1;
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  220  =

f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  221  	=
	rc |=3D hl_pci_iatu_write(hdev, offset + 0x8,
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  222  	=
			lower_32_bits(region_base));
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  223  	=
	rc |=3D hl_pci_iatu_write(hdev, offset + 0xC,
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  224  	=
			upper_32_bits(region_base));
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  225  	=
	rc |=3D hl_pci_iatu_write(hdev, offset + 0x10,
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  226  	=
			lower_32_bits(region_end_address));
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  227  	}
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  228  =

b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  229  	=
/* Point to the specified address */
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15 @230  	=
rc =3D hl_pci_iatu_write(hdev, offset + 0x14,
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  231  	=
		lower_32_bits(pci_region->addr));
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  232  	=
rc |=3D hl_pci_iatu_write(hdev, offset + 0x18,
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  233  	=
		upper_32_bits(pci_region->addr));
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  234  	=
rc |=3D hl_pci_iatu_write(hdev, offset + 0x0, 0);
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  235  =

f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  236  	=
/* Enable + bar/address match + match enable + bar number */
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  237  	=
ctrl_reg_val =3D FIELD_PREP(IATU_REGION_CTRL_REGION_EN_MASK, 1);
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  238  	=
ctrl_reg_val |=3D FIELD_PREP(IATU_REGION_CTRL_MATCH_MODE_MASK,
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  239  	=
		pci_region->mode);
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  240  	=
ctrl_reg_val |=3D FIELD_PREP(IATU_REGION_CTRL_NUM_MATCH_EN_MASK, 1);
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  241  =

f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  242  	=
if (pci_region->mode =3D=3D PCI_BAR_MATCH_MODE)
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  243  	=
	ctrl_reg_val |=3D FIELD_PREP(IATU_REGION_CTRL_BAR_NUM_MASK,
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  244  	=
			pci_region->bar);
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  245  =

f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  246  	=
rc |=3D hl_pci_iatu_write(hdev, offset + 0x4, ctrl_reg_val);
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  247  =

b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  248  	=
/* Return the DBI window to the default location */
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  249  	=
rc |=3D hl_pci_elbi_write(hdev, prop->pcie_aux_dbi_reg_addr, 0);
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  250  	=
rc |=3D hl_pci_elbi_write(hdev, prop->pcie_aux_dbi_reg_addr + 4, 0);
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  251  =

b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  252  	=
if (rc)
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  253  	=
	dev_err(hdev->dev, "failed to map bar %u to 0x%08llx\n",
f4cbfd2445ffa3 drivers/misc/habanalabs/pci.c Ofir Bitton 2020-06-15  254  	=
			pci_region->bar, pci_region->addr);
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  255  =

b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  256  	=
return rc;
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  257  }
b6f897d75d651f drivers/misc/habanalabs/pci.c Tomer Tayar 2019-03-05  258  =


:::::: The code at line 230 was first introduced by commit
:::::: f4cbfd2445ffa3415023899e43ac9c8334171cf4 habanalabs: PCIe iATU refac=
toring

:::::: TO: Ofir Bitton <obitton@habana.ai>
:::::: CC: Oded Gabbay <oded.gabbay@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0425463379328645395==--

