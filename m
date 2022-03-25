Content-Type: multipart/mixed; boundary="===============6013519038195874212=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 4/5] drivers/pci/controller/dwc/pcie-keembay.c:255 thunderbay_pcie_host_rd_other_conf() error: uninitialized symbol 'ret'.
Date: Sat, 26 Mar 2022 07:46:21 +0800
Message-ID: <202203260725.HqbfmqKQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6013519038195874212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Srikanth Thokala <srikanth.thokala@intel.com>
CC: nanli2x <nanx.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   28355ba25d3468058a5470273bc7b9c8b411b958
commit: 28f72667fffb64d777e6f3f3017995d7d4f9e558 [4/5] PCI: thunderbay: Add=
 support for Thunderbay Root Port
:::::: branch date: 5 days ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-m031-20220324 (https://download.01.org/0day-ci/arc=
hive/20220326/202203260725.HqbfmqKQ-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/controller/dwc/pcie-keembay.c:255 thunderbay_pcie_host_rd_other=
_conf() error: uninitialized symbol 'ret'.

vim +/ret +255 drivers/pci/controller/dwc/pcie-keembay.c

28f72667fffb64d Srikanth Thokala 2021-09-16  219  =

28f72667fffb64d Srikanth Thokala 2021-09-16  220  static int
28f72667fffb64d Srikanth Thokala 2021-09-16  221  thunderbay_pcie_host_rd_o=
ther_conf(struct pci_bus *bus, unsigned int devfn,
28f72667fffb64d Srikanth Thokala 2021-09-16  222  				   int where, int siz=
e, u32 *val)
28f72667fffb64d Srikanth Thokala 2021-09-16  223  {
28f72667fffb64d Srikanth Thokala 2021-09-16  224  	struct pcie_port *pp =3D=
 bus->sysdata;
28f72667fffb64d Srikanth Thokala 2021-09-16  225  	struct keembay_pcie *pci=
e;
28f72667fffb64d Srikanth Thokala 2021-09-16  226  	int ret, where_align;
28f72667fffb64d Srikanth Thokala 2021-09-16  227  	struct dw_pcie *pci;
28f72667fffb64d Srikanth Thokala 2021-09-16  228  =

28f72667fffb64d Srikanth Thokala 2021-09-16  229  	pci =3D to_dw_pcie_from_=
pp(pp);
28f72667fffb64d Srikanth Thokala 2021-09-16  230  	pcie =3D dev_get_drvdata=
(pci->dev);
28f72667fffb64d Srikanth Thokala 2021-09-16  231  =

28f72667fffb64d Srikanth Thokala 2021-09-16  232  	if (pcie->rc_dma) {
28f72667fffb64d Srikanth Thokala 2021-09-16  233  		where_align =3D where &=
 ~((typeof(where))(4) - 1);
28f72667fffb64d Srikanth Thokala 2021-09-16  234  		if (thunderbay_pcie_rc_=
dma_rd(pp,
28f72667fffb64d Srikanth Thokala 2021-09-16  235  					      pcie->rd_dma_c=
han,
28f72667fffb64d Srikanth Thokala 2021-09-16  236  					      pcie->rc_dma_m=
em_pa + where_align,
28f72667fffb64d Srikanth Thokala 2021-09-16  237  					      pp->cfg0_base =
+ where_align,
28f72667fffb64d Srikanth Thokala 2021-09-16  238  					      4))
28f72667fffb64d Srikanth Thokala 2021-09-16  239  			ret =3D PCIBIOS_BAD_RE=
GISTER_NUMBER;
28f72667fffb64d Srikanth Thokala 2021-09-16  240  =

28f72667fffb64d Srikanth Thokala 2021-09-16  241  		*val =3D *((int *)(pcie=
->rc_dma_mem_va + where));
28f72667fffb64d Srikanth Thokala 2021-09-16  242  =

28f72667fffb64d Srikanth Thokala 2021-09-16  243  		if (size =3D=3D 4)
28f72667fffb64d Srikanth Thokala 2021-09-16  244  			*val &=3D 0xFFFFFFFF;
28f72667fffb64d Srikanth Thokala 2021-09-16  245  		else if (size =3D=3D 2)
28f72667fffb64d Srikanth Thokala 2021-09-16  246  			*val &=3D 0xFFFF;
28f72667fffb64d Srikanth Thokala 2021-09-16  247  		else if (size =3D=3D 1)
28f72667fffb64d Srikanth Thokala 2021-09-16  248  			*val &=3D 0xFF;
28f72667fffb64d Srikanth Thokala 2021-09-16  249  		else
28f72667fffb64d Srikanth Thokala 2021-09-16  250  			ret =3D PCIBIOS_BAD_RE=
GISTER_NUMBER;
28f72667fffb64d Srikanth Thokala 2021-09-16  251  	} else {
28f72667fffb64d Srikanth Thokala 2021-09-16  252  		ret =3D dw_pcie_read(pp=
->va_cfg0_base + where, size, val);
28f72667fffb64d Srikanth Thokala 2021-09-16  253  	}
28f72667fffb64d Srikanth Thokala 2021-09-16  254  =

28f72667fffb64d Srikanth Thokala 2021-09-16 @255  	return ret;
28f72667fffb64d Srikanth Thokala 2021-09-16  256  }
28f72667fffb64d Srikanth Thokala 2021-09-16  257  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6013519038195874212==--

