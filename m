Content-Type: multipart/mixed; boundary="===============9005716424790660104=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 7/8] usb: xhci: Rewrite xhci_create_usb3_bos_desc()
Date: Tue, 09 Feb 2021 13:37:09 +0800
Message-ID: <202102091325.NuAEvWOw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9005716424790660104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <2d9a3de7f6cfeada9a15ec0ec4683b49c62543c2.1612410491.git.Thinh=
.Nguyen@synopsys.com>
References: <2d9a3de7f6cfeada9a15ec0ec4683b49c62543c2.1612410491.git.Thinh.=
Nguyen@synopsys.com>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Thinh.Nguyen(a)synopsys.com
TO: linux-usb(a)vger.kernel.org
TO: Mathias Nyman <mathias.nyman@intel.com>

Hi Thinh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on d021e0694d77ee3cdc5d3fca2c8d53ae7575499a]

url:    https://github.com/0day-ci/linux/commits/Thinh-Nguyen/usb-Check-for=
-genXxY-on-host/20210204-121545
base:   d021e0694d77ee3cdc5d3fca2c8d53ae7575499a
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-m001-20210209 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/usb/host/xhci-hub.c:98 xhci_create_usb3x_bos_desc() error: uninitia=
lized symbol 'bcdUSB'.

Old smatch warnings:
drivers/usb/host/xhci-hub.c:104 xhci_create_usb3x_bos_desc() error: uniniti=
alized symbol 'bcdUSB'.

vim +/bcdUSB +98 drivers/usb/host/xhci-hub.c

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   67  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   68  static int xhci_create_usb3x_b=
os_desc(struct xhci_hcd *xhci, char *buf,
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   69  				      u16 wLength)
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   70  {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   71  	struct usb_bos_descriptor	*bo=
s;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   72  	struct usb_ss_cap_descriptor	=
*ss_cap;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   73  	struct usb_ssp_cap_descriptor=
	*ssp_cap;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   74  	struct xhci_port_cap		*port_c=
ap =3D NULL;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   75  	u16				bcdUSB;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   76  	u32				reg;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   77  	u32				min_rate =3D 0;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   78  	u8				min_ssid;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   79  	u8				ssac;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   80  	u8				ssic;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   81  	int				offset;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   82  	int				i;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   83  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   84  	/* BOS descriptor */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   85  	bos =3D (struct usb_bos_descr=
iptor *)buf;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   86  	bos->bLength =3D USB_DT_BOS_S=
IZE;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   87  	bos->bDescriptorType =3D USB_=
DT_BOS;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   88  	bos->wTotalLength =3D cpu_to_=
le16(USB_DT_BOS_SIZE +
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   89  					USB_DT_USB_SS_CAP_SIZE);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   90  	bos->bNumDeviceCaps =3D 1;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   91  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   92  	/* Create the descriptor for =
port with the highest revision */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   93  	for (i =3D 0; i < xhci->num_p=
ort_caps; i++) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   94  		u8 major =3D xhci->port_caps=
[i].maj_rev;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   95  		u8 minor =3D xhci->port_caps=
[i].min_rev;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   96  		u16 rev =3D (major << 8) | m=
inor;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   97  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  @98  		if (i =3D=3D 0 || bcdUSB < r=
ev) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03   99  			bcdUSB =3D rev;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  100  			port_cap =3D &xhci->port_ca=
ps[i];
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  101  		}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  102  	}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  103  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  104  	if (bcdUSB >=3D 0x0310) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  105  		if (port_cap->psi_count) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  106  			u8 num_sym_ssa =3D 0;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  107  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  108  			for (i =3D 0; i < port_cap-=
>psi_count; i++) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  109  				if ((port_cap->psi[i] & PL=
T_MASK) =3D=3D PLT_SYM)
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  110  					num_sym_ssa++;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  111  			}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  112  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  113  			ssac =3D port_cap->psi_coun=
t + num_sym_ssa - 1;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  114  			ssic =3D port_cap->psi_uid_=
count - 1;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  115  		} else {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  116  			if (bcdUSB >=3D 0x0320)
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  117  				ssac =3D 7;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  118  			else
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  119  				ssac =3D 3;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  120  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  121  			ssic =3D (ssac + 1) / 2 - 1;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  122  		}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  123  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  124  		bos->bNumDeviceCaps++;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  125  		bos->wTotalLength =3D cpu_to=
_le16(USB_DT_BOS_SIZE +
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  126  						USB_DT_USB_SS_CAP_SIZE +
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  127  						USB_DT_USB_SSP_CAP_SIZE(=
ssac));
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  128  	}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  129  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  130  	if (wLength < USB_DT_BOS_SIZE=
 + USB_DT_USB_SS_CAP_SIZE)
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  131  		return wLength;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  132  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  133  	/* SuperSpeed USB Device Capa=
bility */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  134  	ss_cap =3D (struct usb_ss_cap=
_descriptor *)&buf[USB_DT_BOS_SIZE];
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  135  	ss_cap->bLength =3D USB_DT_US=
B_SS_CAP_SIZE;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  136  	ss_cap->bDescriptorType =3D U=
SB_DT_DEVICE_CAPABILITY;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  137  	ss_cap->bDevCapabilityType =
=3D USB_SS_CAP_TYPE;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  138  	ss_cap->bmAttributes =3D 0; /=
* set later */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  139  	ss_cap->wSpeedSupported =3D c=
pu_to_le16(USB_5GBPS_OPERATION);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  140  	ss_cap->bFunctionalitySupport=
 =3D USB_LOW_SPEED_OPERATION;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  141  	ss_cap->bU1devExitLat =3D 0; =
/* set later */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  142  	ss_cap->bU2DevExitLat =3D 0; =
/* set later */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  143  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  144  	reg =3D readl(&xhci->cap_regs=
->hcc_params);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  145  	if (HCC_LTC(reg))
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  146  		ss_cap->bmAttributes |=3D US=
B_LTM_SUPPORT;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  147  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  148  	if ((xhci->quirks & XHCI_LPM_=
SUPPORT)) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  149  		reg =3D readl(&xhci->cap_reg=
s->hcs_params3);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  150  		ss_cap->bU1devExitLat =3D HC=
S_U1_LATENCY(reg);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  151  		ss_cap->bU2DevExitLat =3D cp=
u_to_le16(HCS_U2_LATENCY(reg));
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  152  	}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  153  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  154  	if (wLength < le16_to_cpu(bos=
->wTotalLength))
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  155  		return wLength;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  156  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  157  	if (bcdUSB < 0x0310)
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  158  		return le16_to_cpu(bos->wTot=
alLength);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  159  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  160  	ssp_cap =3D (struct usb_ssp_c=
ap_descriptor *)&buf[USB_DT_BOS_SIZE +
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  161  		USB_DT_USB_SS_CAP_SIZE];
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  162  	ssp_cap->bLength =3D USB_DT_U=
SB_SSP_CAP_SIZE(ssac);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  163  	ssp_cap->bDescriptorType =3D =
USB_DT_DEVICE_CAPABILITY;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  164  	ssp_cap->bDevCapabilityType =
=3D USB_SSP_CAP_TYPE;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  165  	ssp_cap->bReserved =3D 0;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  166  	ssp_cap->wReserved =3D 0;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  167  	ssp_cap->bmAttributes =3D
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  168  		cpu_to_le32(FIELD_PREP(USB_S=
SP_SUBLINK_SPEED_ATTRIBS, ssac) |
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  169  			    FIELD_PREP(USB_SSP_SUBL=
INK_SPEED_IDS, ssic));
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  170  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  171  	if (!port_cap->psi_count) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  172  		for (i =3D 0; i < ssac + 1; =
i++)
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  173  			ssp_cap->bmSublinkSpeedAttr=
[i] =3D
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  174  				cpu_to_le32(ssp_cap_defaul=
t_ssa[i]);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  175  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  176  		min_ssid =3D 4;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  177  		goto out;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  178  	}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  179  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  180  	offset =3D 0;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  181  	for (i =3D 0; i < port_cap->p=
si_count; i++) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  182  		u32 psi;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  183  		u32 attr;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  184  		u8 ssid;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  185  		u8 lp;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  186  		u8 lse;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  187  		u8 psie;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  188  		u16 lane_mantissa;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  189  		u16 psim;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  190  		u16 plt;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  191  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  192  		psi =3D port_cap->psi[i];
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  193  		ssid =3D XHCI_EXT_PORT_PSIV(=
psi);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  194  		lp =3D XHCI_EXT_PORT_LP(psi);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  195  		psie =3D XHCI_EXT_PORT_PSIE(=
psi);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  196  		psim =3D XHCI_EXT_PORT_PSIM(=
psi);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  197  		plt =3D psi & PLT_MASK;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  198  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  199  		lse =3D psie;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  200  		lane_mantissa =3D psim;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  201  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  202  		/* Shift to Gbps and set SSP=
 Link Protocol if 10Gpbs */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  203  		for (; psie < USB_SSP_SUBLIN=
K_SPEED_LSE_GBPS; psie++)
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  204  			psim /=3D 1000;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  205  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  206  		if (!min_rate || psim < min_=
rate) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  207  			min_ssid =3D ssid;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  208  			min_rate =3D psim;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  209  		}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  210  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  211  		/* Some host controllers don=
't set the link protocol for SSP */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  212  		if (psim >=3D 10)
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  213  			lp =3D USB_SSP_SUBLINK_SPEE=
D_LP_SSP;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  214  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  215  		/*
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  216  		 * PSIM and PSIE represent t=
he total speed of PSI. The BOS
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  217  		 * descriptor SSP sublink sp=
eed attribute lane mantissa
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  218  		 * describes the lane speed.=
 E.g. PSIM and PSIE for gen2x2
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  219  		 * is 20Gbps, but the BOS de=
scriptor lane speed mantissa is
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  220  		 * 10Gbps. Check and modify =
the mantissa value to match the
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  221  		 * lane speed.
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  222  		 */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  223  		if (bcdUSB =3D=3D 0x0320 && =
plt =3D=3D PLT_SYM) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  224  			/*
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  225  			 * The PSI dword for gen1x2=
 and gen2x1 share the same
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  226  			 * values. But the lane spe=
ed for gen1x2 is 5Gbps while
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  227  			 * gen2x1 is 10Gbps. If the=
 previous PSI dword SSID is
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  228  			 * 5 and the PSIE and PSIM =
match with SSID 6, let's
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  229  			 * assume that the controll=
er follows the default speed
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  230  			 * id with SSID 6 for gen1x=
2.
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  231  			 */
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  232  			if (ssid =3D=3D 6 && psie =
=3D=3D 3 && psim =3D=3D 10 && i) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  233  				u32 prev =3D port_cap->psi=
[i - 1];
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  234  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  235  				if ((prev & PLT_MASK) =3D=
=3D PLT_SYM &&
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  236  				    XHCI_EXT_PORT_PSIV(pre=
v) =3D=3D 5 &&
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  237  				    XHCI_EXT_PORT_PSIE(pre=
v) =3D=3D 3 &&
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  238  				    XHCI_EXT_PORT_PSIM(pre=
v) =3D=3D 10) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  239  					lse =3D USB_SSP_SUBLINK_S=
PEED_LSE_GBPS;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  240  					lane_mantissa =3D 5;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  241  				}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  242  			}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  243  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  244  			if (psie =3D=3D 3 && psim >=
 10) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  245  				lse =3D USB_SSP_SUBLINK_SP=
EED_LSE_GBPS;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  246  				lane_mantissa =3D 10;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  247  			}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  248  		}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  249  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  250  		attr =3D (FIELD_PREP(USB_SSP=
_SUBLINK_SPEED_SSID, ssid) |
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  251  			FIELD_PREP(USB_SSP_SUBLINK_=
SPEED_LP, lp) |
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  252  			FIELD_PREP(USB_SSP_SUBLINK_=
SPEED_LSE, lse) |
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  253  			FIELD_PREP(USB_SSP_SUBLINK_=
SPEED_LSM, lane_mantissa));
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  254  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  255  		switch (plt) {
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  256  		case PLT_SYM:
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  257  			attr |=3D FIELD_PREP(USB_SS=
P_SUBLINK_SPEED_ST,
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  258  					   USB_SSP_SUBLINK_SPEED_=
ST_SYM_RX);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  259  			ssp_cap->bmSublinkSpeedAttr=
[offset++] =3D cpu_to_le32(attr);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  260  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  261  			attr &=3D ~USB_SSP_SUBLINK_=
SPEED_ST;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  262  			attr |=3D FIELD_PREP(USB_SS=
P_SUBLINK_SPEED_ST,
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  263  					   USB_SSP_SUBLINK_SPEED_=
ST_SYM_TX);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  264  			ssp_cap->bmSublinkSpeedAttr=
[offset++] =3D cpu_to_le32(attr);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  265  			break;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  266  		case PLT_ASYM_RX:
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  267  			attr |=3D FIELD_PREP(USB_SS=
P_SUBLINK_SPEED_ST,
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  268  					   USB_SSP_SUBLINK_SPEED_=
ST_ASYM_RX);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  269  			ssp_cap->bmSublinkSpeedAttr=
[offset++] =3D cpu_to_le32(attr);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  270  			break;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  271  		case PLT_ASYM_TX:
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  272  			attr |=3D FIELD_PREP(USB_SS=
P_SUBLINK_SPEED_ST,
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  273  					   USB_SSP_SUBLINK_SPEED_=
ST_ASYM_TX);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  274  			ssp_cap->bmSublinkSpeedAttr=
[offset++] =3D cpu_to_le32(attr);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  275  			break;
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  276  		}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  277  	}
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  278  out:
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  279  	ssp_cap->wFunctionalitySuppor=
t =3D
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  280  		cpu_to_le16(FIELD_PREP(USB_S=
SP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID,
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  281  				       min_ssid) |
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  282  			    FIELD_PREP(USB_SSP_MIN_=
RX_LANE_COUNT, 1) |
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  283  			    FIELD_PREP(USB_SSP_MIN_=
TX_LANE_COUNT, 1));
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  284  =

e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  285  	return le16_to_cpu(bos->wTota=
lLength);
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  286  }
e531a9f0c9c4b7 Thinh Nguyen 2021-02-03  287  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9005716424790660104==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============9005716424790660104==--

