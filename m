Content-Type: multipart/mixed; boundary="===============1519992316263187814=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 2/2] acpi/pci_root: negotiate CXL _OSC
Date: Thu, 17 Mar 2022 13:48:35 +0800
Message-ID: <202203171337.1O6VuoTj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1519992316263187814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220317002704.1835870-3-vishal.l.verma@intel.com>
References: <20220317002704.1835870-3-vishal.l.verma@intel.com>
TO: Vishal Verma <vishal.l.verma@intel.com>

Hi Vishal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 74be98774dfbc5b8b795db726bd772e735d2edd4]

url:    https://github.com/0day-ci/linux/commits/Vishal-Verma/acpi-add-supp=
ort-for-CXL-_OSC/20220317-082840
base:   74be98774dfbc5b8b795db726bd772e735d2edd4
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20317/202203171337.1O6VuoTj-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/acpi/pci_root.c:450 acpi_pci_osc_control_set() error: uninitialized=
 symbol 'cxl_ctrl'.
drivers/acpi/pci_root.c:564 calculate_cxl_control() error: uninitialized sy=
mbol 'control'.
drivers/acpi/pci_root.c:619 negotiate_os_control() error: uninitialized sym=
bol 'cxl_support'.

Old smatch warnings:
drivers/acpi/pci_root.c:453 acpi_pci_osc_control_set() error: uninitialized=
 symbol 'cxl_ctrl'.
drivers/acpi/pci_root.c:466 acpi_pci_osc_control_set() error: uninitialized=
 symbol 'cxl_ctrl'.
drivers/acpi/pci_root.c:480 acpi_pci_osc_control_set() error: uninitialized=
 symbol 'cxl_ctrl'.

vim +/cxl_ctrl +450 drivers/acpi/pci_root.c

2f7bbceb5b6aa93 Alexander Chiang           2009-06-10  401  =

63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  402  /**
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  403   * acpi_pci_osc=
_control_set - Request control of PCI root _OSC features.
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  404   * @handle: ACP=
I handle of a PCI root bridge (or PCIe Root Complex).
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  405   * @mask: Mask =
of _OSC bits to request control of, place to store control mask.
843438deebe247f Yang Li                    2021-12-23  406   * @support: _O=
SC supported capability.
8020d862c22d52b Vishal Verma               2022-03-16  407   * @cxl_mask: M=
ask of CXL _OSC control bits, place to store control mask.
8020d862c22d52b Vishal Verma               2022-03-16  408   * @cxl_support=
: CXL _OSC supported capability.
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  409   *
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  410   * Run _OSC que=
ry for @mask and if that is successful, compare the returned
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  411   * mask of cont=
rol bits with @req.  If all of the @req bits are set in the
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  412   * returned mas=
k, run _OSC request for it.
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  413   *
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  414   * The variable=
 at the @mask address may be modified regardless of whether or
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  415   * not the func=
tion returns success.  On success it will contain the mask of
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  416   * _OSC bits th=
e BIOS has granted control of, but its contents are meaningless
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  417   * on failure.
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  418   **/
8020d862c22d52b Vishal Verma               2022-03-16  419  static acpi_sta=
tus acpi_pci_osc_control_set(acpi_handle handle, u32 *mask,
8020d862c22d52b Vishal Verma               2022-03-16  420  					    u32 su=
pport, u32 *cxl_mask,
8020d862c22d52b Vishal Verma               2022-03-16  421  					    u32 cx=
l_support)
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  422  {
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  423  	u32 req =3D OS=
C_PCI_EXPRESS_CAPABILITY_CONTROL;
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  424  	struct acpi_pc=
i_root *root;
866e61fc40c96e7 Bjorn Helgaas              2020-06-02  425  	acpi_status st=
atus;
8020d862c22d52b Vishal Verma               2022-03-16  426  	u32 ctrl, cxl_=
ctrl, capbuf[8];
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  427  =

75fb60f26befb59 Rafael J. Wysocki          2010-08-23  428  	if (!mask)
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  429  		return AE_BAD=
_PARAMETER;
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  430  =

63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  431  	root =3D acpi_=
pci_find_root(handle);
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  432  	if (!root)
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  433  		return AE_NOT=
_EXIST;
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  434  =

6bc779ee05d4fa6 Joerg Roedel               2021-08-24  435  	ctrl   =3D *ma=
sk;
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  436  	*mask |=3D roo=
t->osc_control_set;
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  437  =

8020d862c22d52b Vishal Verma               2022-03-16  438  	if (is_cxl(roo=
t)) {
8020d862c22d52b Vishal Verma               2022-03-16  439  		cxl_ctrl   =
=3D *cxl_mask;
8020d862c22d52b Vishal Verma               2022-03-16  440  		*mask |=3D ro=
ot->osc_control_set;
8020d862c22d52b Vishal Verma               2022-03-16  441  	}
8020d862c22d52b Vishal Verma               2022-03-16  442  =

75fb60f26befb59 Rafael J. Wysocki          2010-08-23  443  	/* Need to che=
ck the available controls bits before requesting them. */
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  444  	do {
8020d862c22d52b Vishal Verma               2022-03-16  445  		status =3D ac=
pi_pci_query_osc(root, support, mask, cxl_support,
8020d862c22d52b Vishal Verma               2022-03-16  446  					    cxl_ma=
sk);
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  447  		if (ACPI_FAIL=
URE(status))
866e61fc40c96e7 Bjorn Helgaas              2020-06-02  448  			return statu=
s;
8020d862c22d52b Vishal Verma               2022-03-16  449  		if (is_cxl(ro=
ot)) {
8020d862c22d52b Vishal Verma               2022-03-16 @450  			if ((ctrl =
=3D=3D *mask) && (cxl_ctrl =3D=3D *cxl_mask))
8020d862c22d52b Vishal Verma               2022-03-16  451  				break;
8020d862c22d52b Vishal Verma               2022-03-16  452  			decode_cxl_o=
sc_control(root, "platform does not support",
8020d862c22d52b Vishal Verma               2022-03-16  453  					   cxl_ctr=
l & ~(*cxl_mask));
8020d862c22d52b Vishal Verma               2022-03-16  454  		} else {
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  455  			if (ctrl =3D=
=3D *mask)
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  456  				break;
955f14b4ed0648d Bjorn Helgaas              2013-09-05  457  			decode_osc_c=
ontrol(root, "platform does not support",
955f14b4ed0648d Bjorn Helgaas              2013-09-05  458  					   ctrl & =
~(*mask));
8020d862c22d52b Vishal Verma               2022-03-16  459  		}
75fb60f26befb59 Rafael J. Wysocki          2010-08-23  460  		ctrl =3D *mas=
k;
8020d862c22d52b Vishal Verma               2022-03-16  461  		cxl_ctrl =3D =
*cxl_mask;
8020d862c22d52b Vishal Verma               2022-03-16  462  	} while (*mask=
 || *cxl_mask);
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  463  =

6bc779ee05d4fa6 Joerg Roedel               2021-08-24  464  	/* No need to =
request _OSC if the control was already granted. */
8020d862c22d52b Vishal Verma               2022-03-16  465  	if (((root->os=
c_control_set & ctrl) =3D=3D ctrl) &&
8020d862c22d52b Vishal Verma               2022-03-16  466  	    ((root->cx=
l_osc_control_set & cxl_ctrl) =3D=3D cxl_ctrl))
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  467  		return AE_OK;
2b8fd9186d9275b Rafael J. Wysocki          2010-08-23  468  =

75fb60f26befb59 Rafael J. Wysocki          2010-08-23  469  	if ((ctrl & re=
q) !=3D req) {
955f14b4ed0648d Bjorn Helgaas              2013-09-05  470  		decode_osc_co=
ntrol(root, "not requesting control; platform does not support",
955f14b4ed0648d Bjorn Helgaas              2013-09-05  471  				   req & ~(=
ctrl));
866e61fc40c96e7 Bjorn Helgaas              2020-06-02  472  		return AE_SUP=
PORT;
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  473  	}
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  474  =

b938a229c85a567 Bjorn Helgaas              2013-09-05  475  	capbuf[OSC_QUE=
RY_DWORD] =3D 0;
b938a229c85a567 Bjorn Helgaas              2013-09-05  476  	capbuf[OSC_SUP=
PORT_DWORD] =3D root->osc_support_set;
b938a229c85a567 Bjorn Helgaas              2013-09-05  477  	capbuf[OSC_CON=
TROL_DWORD] =3D ctrl;
8020d862c22d52b Vishal Verma               2022-03-16  478  	if (is_cxl(roo=
t)) {
8020d862c22d52b Vishal Verma               2022-03-16  479  		capbuf[OSC_CX=
L_SUPPORT_DWORD] =3D root->cxl_osc_support_set;
8020d862c22d52b Vishal Verma               2022-03-16  480  		capbuf[OSC_CX=
L_CONTROL_DWORD] =3D cxl_ctrl;
8020d862c22d52b Vishal Verma               2022-03-16  481  	}
8020d862c22d52b Vishal Verma               2022-03-16  482  =

8020d862c22d52b Vishal Verma               2022-03-16  483  	status =3D acp=
i_pci_run_osc(root, capbuf, mask, cxl_mask);
866e61fc40c96e7 Bjorn Helgaas              2020-06-02  484  	if (ACPI_FAILU=
RE(status))
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  485  		return status;
866e61fc40c96e7 Bjorn Helgaas              2020-06-02  486  =

866e61fc40c96e7 Bjorn Helgaas              2020-06-02  487  	root->osc_cont=
rol_set =3D *mask;
8020d862c22d52b Vishal Verma               2022-03-16  488  	root->cxl_osc_=
control_set =3D *cxl_mask;
866e61fc40c96e7 Bjorn Helgaas              2020-06-02  489  	return AE_OK;
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  490  }
63f10f0f6df4e4e Kenji Kaneshige            2009-02-09  491  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  492  static u32 calc=
ulate_support(void)
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  493  {
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  494  	u32 support;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  495  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  496  	/*
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  497  	 * All support=
ed architectures that use ACPI have support for
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  498  	 * PCI domains=
, so we indicate this in _OSC support capabilities.
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  499  	 */
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  500  	support =3D OS=
C_PCI_SEGMENT_GROUPS_SUPPORT;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  501  	support |=3D O=
SC_PCI_HPX_TYPE_3_SUPPORT;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  502  	if (pci_ext_cf=
g_avail())
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  503  		support |=3D =
OSC_PCI_EXT_CONFIG_SUPPORT;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  504  	if (pcie_aspm_=
support_enabled())
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  505  		support |=3D =
OSC_PCI_ASPM_SUPPORT | OSC_PCI_CLOCK_PM_SUPPORT;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  506  	if (pci_msi_en=
abled())
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  507  		support |=3D =
OSC_PCI_MSI_SUPPORT;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  508  	if (IS_ENABLED=
(CONFIG_PCIE_EDR))
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  509  		support |=3D =
OSC_PCI_EDR_SUPPORT;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  510  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  511  	return support;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  512  }
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  513  =

8020d862c22d52b Vishal Verma               2022-03-16  514  static u32 calc=
ulate_cxl_support(void)
8020d862c22d52b Vishal Verma               2022-03-16  515  {
8020d862c22d52b Vishal Verma               2022-03-16  516  	u32 support;
8020d862c22d52b Vishal Verma               2022-03-16  517  =

8020d862c22d52b Vishal Verma               2022-03-16  518  	support =3D OS=
C_CXL_2_0_PORT_DEV_REG_ACCESS_SUPPORT;
8020d862c22d52b Vishal Verma               2022-03-16  519  	support |=3D O=
SC_CXL_PER_SUPPORT;
8020d862c22d52b Vishal Verma               2022-03-16  520  	if (IS_ENABLED=
(CONFIG_HOTPLUG_PCI_PCIE))
8020d862c22d52b Vishal Verma               2022-03-16  521  		support |=3D =
OSC_CXL_NATIVE_HP_SUPPORT;
8020d862c22d52b Vishal Verma               2022-03-16  522  =

8020d862c22d52b Vishal Verma               2022-03-16  523  	return support;
8020d862c22d52b Vishal Verma               2022-03-16  524  }
8020d862c22d52b Vishal Verma               2022-03-16  525  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  526  static u32 calc=
ulate_control(void)
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  527  {
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  528  	u32 control;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  529  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  530  	control =3D OS=
C_PCI_EXPRESS_CAPABILITY_CONTROL
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  531  		| OSC_PCI_EXP=
RESS_PME_CONTROL;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  532  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  533  	if (IS_ENABLED=
(CONFIG_PCIEASPM))
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  534  		control |=3D =
OSC_PCI_EXPRESS_LTR_CONTROL;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  535  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  536  	if (IS_ENABLED=
(CONFIG_HOTPLUG_PCI_PCIE))
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  537  		control |=3D =
OSC_PCI_EXPRESS_NATIVE_HP_CONTROL;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  538  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  539  	if (IS_ENABLED=
(CONFIG_HOTPLUG_PCI_SHPC))
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  540  		control |=3D =
OSC_PCI_SHPC_NATIVE_HP_CONTROL;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  541  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  542  	if (pci_aer_av=
ailable())
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  543  		control |=3D =
OSC_PCI_EXPRESS_AER_CONTROL;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  544  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  545  	/*
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  546  	 * Per the Dow=
nstream Port Containment Related Enhancements ECN to
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  547  	 * the PCI Fir=
mware Spec, r3.2, sec 4.5.1, table 4-5,
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  548  	 * OSC_PCI_EXP=
RESS_DPC_CONTROL indicates the OS supports both DPC
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  549  	 * and EDR.
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  550  	 */
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  551  	if (IS_ENABLED=
(CONFIG_PCIE_DPC) && IS_ENABLED(CONFIG_PCIE_EDR))
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  552  		control |=3D =
OSC_PCI_EXPRESS_DPC_CONTROL;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  553  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  554  	return control;
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  555  }
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  556  =

8020d862c22d52b Vishal Verma               2022-03-16  557  static u32 calc=
ulate_cxl_control(void)
8020d862c22d52b Vishal Verma               2022-03-16  558  {
8020d862c22d52b Vishal Verma               2022-03-16  559  	u32 control;
8020d862c22d52b Vishal Verma               2022-03-16  560  =

8020d862c22d52b Vishal Verma               2022-03-16  561  	if (pci_aer_av=
ailable())
8020d862c22d52b Vishal Verma               2022-03-16  562  		control |=3D =
OSC_CXL_ERROR_REPORTING_CONTROL;
8020d862c22d52b Vishal Verma               2022-03-16  563  =

8020d862c22d52b Vishal Verma               2022-03-16 @564  	return control;
8020d862c22d52b Vishal Verma               2022-03-16  565  }
8020d862c22d52b Vishal Verma               2022-03-16  566  =

87f1f87a16818c3 Joerg Roedel               2021-08-24  567  static bool os_=
control_query_checks(struct acpi_pci_root *root, u32 support)
87f1f87a16818c3 Joerg Roedel               2021-08-24  568  {
87f1f87a16818c3 Joerg Roedel               2021-08-24  569  	struct acpi_de=
vice *device =3D root->device;
87f1f87a16818c3 Joerg Roedel               2021-08-24  570  =

87f1f87a16818c3 Joerg Roedel               2021-08-24  571  	if (pcie_ports=
_disabled) {
87f1f87a16818c3 Joerg Roedel               2021-08-24  572  		dev_info(&dev=
ice->dev, "PCIe port services disabled; not requesting _OSC control\n");
87f1f87a16818c3 Joerg Roedel               2021-08-24  573  		return false;
87f1f87a16818c3 Joerg Roedel               2021-08-24  574  	}
87f1f87a16818c3 Joerg Roedel               2021-08-24  575  =

87f1f87a16818c3 Joerg Roedel               2021-08-24  576  	if ((support &=
 ACPI_PCIE_REQ_SUPPORT) !=3D ACPI_PCIE_REQ_SUPPORT) {
87f1f87a16818c3 Joerg Roedel               2021-08-24  577  		decode_osc_su=
pport(root, "not requesting OS control; OS requires",
87f1f87a16818c3 Joerg Roedel               2021-08-24  578  				   ACPI_PCI=
E_REQ_SUPPORT);
87f1f87a16818c3 Joerg Roedel               2021-08-24  579  		return false;
87f1f87a16818c3 Joerg Roedel               2021-08-24  580  	}
87f1f87a16818c3 Joerg Roedel               2021-08-24  581  =

87f1f87a16818c3 Joerg Roedel               2021-08-24  582  	return true;
87f1f87a16818c3 Joerg Roedel               2021-08-24  583  }
87f1f87a16818c3 Joerg Roedel               2021-08-24  584  =

53da48751c13ffc Dan Williams               2022-03-16  585  static void neg=
otiate_os_control(struct acpi_pci_root *root, int *no_aspm)
^1da177e4c3f415 Linus Torvalds             2005-04-16  586  {
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  587  	u32 support, c=
ontrol =3D 0, requested =3D 0;
8020d862c22d52b Vishal Verma               2022-03-16  588  	u32 cxl_suppor=
t, cxl_control =3D 0, cxl_requested =3D 0;
3e43abb012d45dc Bjorn Helgaas              2013-09-05  589  	acpi_status st=
atus;
3e43abb012d45dc Bjorn Helgaas              2013-09-05  590  	struct acpi_de=
vice *device =3D root->device;
bfe2414aecca03d Jiang Liu                  2013-05-28  591  	acpi_handle ha=
ndle =3D device->handle;
^1da177e4c3f415 Linus Torvalds             2005-04-16  592  =

7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  593  	/*
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  594  	 * Apple alway=
s return failure on _OSC calls when _OSI("Darwin") has
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  595  	 * been called=
 successfully. We know the feature set supported by the
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  596  	 * platform, s=
o avoid calling _OSC at all
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  597  	 */
630b3aff8a51c90 Lukas Wunner               2017-08-01  598  	if (x86_apple_=
machine) {
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  599  		root->osc_con=
trol_set =3D ~OSC_PCI_EXPRESS_PME_CONTROL;
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  600  		decode_osc_co=
ntrol(root, "OS assumes control of",
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  601  				   root->os=
c_control_set);
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  602  		return;
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  603  	}
7bc5a2bad0b8d9d Matthew Garrett            2014-09-20  604  =

4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  605  	support =3D ca=
lculate_support();
955f14b4ed0648d Bjorn Helgaas              2013-09-05  606  =

955f14b4ed0648d Bjorn Helgaas              2013-09-05  607  	decode_osc_sup=
port(root, "OS supports", support);
de18966228ed4b4 Bjorn Helgaas              2013-09-05  608  =

6bc779ee05d4fa6 Joerg Roedel               2021-08-24  609  	if (os_control=
_query_checks(root, support))
4c6f6060b7c4fe0 Joerg Roedel               2021-08-24  610  		requested =3D=
 control =3D calculate_control();
ac1c8e35a3262d0 Kuppuswamy Sathyanarayanan 2020-03-23  611  =

8020d862c22d52b Vishal Verma               2022-03-16  612  	if (is_cxl(roo=
t)) {
8020d862c22d52b Vishal Verma               2022-03-16  613  		cxl_support =
=3D calculate_cxl_support();
8020d862c22d52b Vishal Verma               2022-03-16  614  		decode_cxl_os=
c_support(root, "OS supports", cxl_support);
8020d862c22d52b Vishal Verma               2022-03-16  615  		cxl_requested=
 =3D cxl_control =3D calculate_cxl_control();
8020d862c22d52b Vishal Verma               2022-03-16  616  	}
8020d862c22d52b Vishal Verma               2022-03-16  617  =

8020d862c22d52b Vishal Verma               2022-03-16  618  	status =3D acp=
i_pci_osc_control_set(handle, &control, support,
8020d862c22d52b Vishal Verma               2022-03-16 @619  					  &cxl_con=
trol, cxl_support);
eca67315e0e0d5f Naga Chumbalkar            2011-03-21  620  	if (ACPI_SUCCE=
SS(status)) {
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  621  		if (control)
955f14b4ed0648d Bjorn Helgaas              2013-09-05  622  			decode_osc_c=
ontrol(root, "OS now controls", control);
8020d862c22d52b Vishal Verma               2022-03-16  623  		if (cxl_contr=
ol)
8020d862c22d52b Vishal Verma               2022-03-16  624  			decode_cxl_o=
sc_control(root, "OS now controls",
8020d862c22d52b Vishal Verma               2022-03-16  625  					   cxl_con=
trol);
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  626  =

b8178f130e25c1b Bjorn Helgaas              2013-04-01  627  		if (acpi_gbl_=
FADT.boot_flags & ACPI_FADT_NO_ASPM) {
b8178f130e25c1b Bjorn Helgaas              2013-04-01  628  			/*
387d37577fdd05e Matthew Garrett            2015-04-07  629  			 * We have A=
SPM control, but the FADT indicates that
387d37577fdd05e Matthew Garrett            2015-04-07  630  			 * it's unsu=
pported. Leave existing configuration
387d37577fdd05e Matthew Garrett            2015-04-07  631  			 * intact an=
d prevent the OS from touching it.
b8178f130e25c1b Bjorn Helgaas              2013-04-01  632  			 */
387d37577fdd05e Matthew Garrett            2015-04-07  633  			dev_info(&de=
vice->dev, "FADT indicates ASPM is unsupported, using BIOS configuration\n"=
);
387d37577fdd05e Matthew Garrett            2015-04-07  634  			*no_aspm =3D=
 1;
b8178f130e25c1b Bjorn Helgaas              2013-04-01  635  		}
eca67315e0e0d5f Naga Chumbalkar            2011-03-21  636  	} else {
3dc48af310709b8 Neil Horman                2013-08-29  637  		/*
3dc48af310709b8 Neil Horman                2013-08-29  638  		 * We want to=
 disable ASPM here, but aspm_disabled
3dc48af310709b8 Neil Horman                2013-08-29  639  		 * needs to r=
emain in its state from boot so that we
3dc48af310709b8 Neil Horman                2013-08-29  640  		 * properly h=
andle PCIe 1.1 devices.  So we set this
3dc48af310709b8 Neil Horman                2013-08-29  641  		 * flag here,=
 to defer the action until after the ACPI
3dc48af310709b8 Neil Horman                2013-08-29  642  		 * root scan.
3dc48af310709b8 Neil Horman                2013-08-29  643  		 */
3e43abb012d45dc Bjorn Helgaas              2013-09-05  644  		*no_aspm =3D =
1;
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  645  =

6bc779ee05d4fa6 Joerg Roedel               2021-08-24  646  		/* _OSC is op=
tional for PCI host bridges */
53da48751c13ffc Dan Williams               2022-03-16  647  		if ((status =
=3D=3D AE_NOT_FOUND) && !is_pcie(root))
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  648  			return;
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  649  =

6bc779ee05d4fa6 Joerg Roedel               2021-08-24  650  		if (control) {
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  651  			decode_osc_c=
ontrol(root, "OS requested", requested);
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  652  			decode_osc_c=
ontrol(root, "platform willing to grant", control);
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  653  		}
8020d862c22d52b Vishal Verma               2022-03-16  654  		if (cxl_contr=
ol) {
8020d862c22d52b Vishal Verma               2022-03-16  655  			decode_cxl_o=
sc_control(root, "OS requested", cxl_requested);
8020d862c22d52b Vishal Verma               2022-03-16  656  			decode_cxl_o=
sc_control(root, "platform willing to grant",
8020d862c22d52b Vishal Verma               2022-03-16  657  					   cxl_con=
trol);
8020d862c22d52b Vishal Verma               2022-03-16  658  		}
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  659  =

6bc779ee05d4fa6 Joerg Roedel               2021-08-24  660  		dev_info(&dev=
ice->dev, "_OSC: platform retains control of PCIe features (%s)\n",
6bc779ee05d4fa6 Joerg Roedel               2021-08-24  661  			 acpi_format=
_exception(status));
eca67315e0e0d5f Naga Chumbalkar            2011-03-21  662  	}
3e43abb012d45dc Bjorn Helgaas              2013-09-05  663  }
3e43abb012d45dc Bjorn Helgaas              2013-09-05  664  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1519992316263187814==--

