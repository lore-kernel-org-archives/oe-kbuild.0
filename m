Content-Type: multipart/mixed; boundary="===============7733290027807973131=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/host/xhci-hub.c:79:7: warning: Possible null pointer dereference: port_cap
Date: Wed, 02 Dec 2020 23:47:32 +0800
Message-ID: <202012022316.n4SRXl12-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7733290027807973131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   509a15421674b9e1a3e1916939d0d0efd3e578da
commit: fc57313d1017dd6b6f37a94e88daa8df54368ecc xhci: Fix memory leak when=
 caching protocol extended capability PSI tables
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/usb/host/xhci-hub.c:656:9: warning: Identical condition 'retval'=
, second condition is always false [identicalConditionAfterEarlyExit]
    return retval;
           ^
   drivers/usb/host/xhci-hub.c:647:6: note: first condition
    if (retval)
        ^
   drivers/usb/host/xhci-hub.c:656:9: note: second condition
    return retval;
           ^
   drivers/usb/host/xhci.h:2440:11: warning: %d in format string (no. 1) re=
quires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType=
_sint]
      ret +=3D sprintf(str + ret, " %d%s",
             ^
   drivers/usb/host/xhci.h:2452:11: warning: %d in format string (no. 1) re=
quires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType=
_sint]
      ret +=3D sprintf(str + ret, " %d%s",
             ^
>> drivers/usb/host/xhci-hub.c:79:7: warning: Possible null pointer derefer=
ence: port_cap [nullPointer]
     if (port_cap->psi_count) {
         ^
   drivers/usb/host/xhci-hub.c:58:35: note: Assignment 'port_cap=3DNULL', a=
ssigned value is 0
    struct xhci_port_cap *port_cap =3D NULL;
                                     ^
   drivers/usb/host/xhci-hub.c:79:7: note: Null pointer dereference
     if (port_cap->psi_count) {
         ^
>> drivers/usb/host/xhci-hub.c:1390:8: warning: Variable 'temp' is reassign=
ed a value before the old one has been used. 'break;' missing? [redundantAs=
signInSwitch]
     temp =3D readl(ports[wIndex]->addr);
          ^
   drivers/usb/host/xhci-hub.c:1235:9: note: Variable 'temp' is reassigned =
a value before the old one has been used. 'break;' missing?
      temp =3D readl(ports[wIndex]->addr);
           ^
   drivers/usb/host/xhci-hub.c:1390:8: note: Variable 'temp' is reassigned =
a value before the old one has been used. 'break;' missing?
     temp =3D readl(ports[wIndex]->addr);
          ^
>> drivers/usb/host/xhci-hub.c:1390:8: warning: Variable 'temp' is reassign=
ed a value before the old one has been used. 'break;' missing? [redundantAs=
signInSwitch]
     temp =3D readl(ports[wIndex]->addr);
          ^
   drivers/usb/host/xhci-hub.c:1252:10: note: Variable 'temp' is reassigned=
 a value before the old one has been used. 'break;' missing?
       temp =3D readl(ports[wIndex]->addr);
            ^
   drivers/usb/host/xhci-hub.c:1390:8: note: Variable 'temp' is reassigned =
a value before the old one has been used. 'break;' missing?
     temp =3D readl(ports[wIndex]->addr);
          ^
>> drivers/usb/host/xhci-hub.c:1390:8: warning: Variable 'temp' is reassign=
ed a value before the old one has been used. 'break;' missing? [redundantAs=
signInSwitch]
     temp =3D readl(ports[wIndex]->addr);
          ^
   drivers/usb/host/xhci-hub.c:1261:10: note: Variable 'temp' is reassigned=
 a value before the old one has been used. 'break;' missing?
       temp =3D readl(ports[wIndex]->addr);
            ^
   drivers/usb/host/xhci-hub.c:1390:8: note: Variable 'temp' is reassigned =
a value before the old one has been used. 'break;' missing?
     temp =3D readl(ports[wIndex]->addr);
          ^
>> drivers/usb/host/xhci-hub.c:1390:8: warning: Variable 'temp' is reassign=
ed a value before the old one has been used. 'break;' missing? [redundantAs=
signInSwitch]
     temp =3D readl(ports[wIndex]->addr);
          ^
   drivers/usb/host/xhci-hub.c:1295:10: note: Variable 'temp' is reassigned=
 a value before the old one has been used. 'break;' missing?
       temp =3D readl(ports[wIndex]->addr);
            ^
   drivers/usb/host/xhci-hub.c:1390:8: note: Variable 'temp' is reassigned =
a value before the old one has been used. 'break;' missing?
     temp =3D readl(ports[wIndex]->addr);
          ^
>> drivers/usb/host/xhci-hub.c:1390:8: warning: Variable 'temp' is reassign=
ed a value before the old one has been used. 'break;' missing? [redundantAs=
signInSwitch]
     temp =3D readl(ports[wIndex]->addr);
          ^
   drivers/usb/host/xhci-hub.c:1328:9: note: Variable 'temp' is reassigned =
a value before the old one has been used. 'break;' missing?
      temp =3D readl(ports[wIndex]->addr);
           ^
   drivers/usb/host/xhci-hub.c:1390:8: note: Variable 'temp' is reassigned =
a value before the old one has been used. 'break;' missing?
     temp =3D readl(ports[wIndex]->addr);
          ^
>> drivers/usb/host/xhci-hub.c:1390:8: warning: Variable 'temp' is reassign=
ed a value before the old one has been used. 'break;' missing? [redundantAs=
signInSwitch]
     temp =3D readl(ports[wIndex]->addr);
          ^
   drivers/usb/host/xhci-hub.c:1359:9: note: Variable 'temp' is reassigned =
a value before the old one has been used. 'break;' missing?
      temp =3D readl(ports[wIndex]->addr);
           ^
   drivers/usb/host/xhci-hub.c:1390:8: note: Variable 'temp' is reassigned =
a value before the old one has been used. 'break;' missing?
     temp =3D readl(ports[wIndex]->addr);
          ^
>> drivers/usb/host/xhci-hub.c:1357:12: warning: Shifting signed 32-bit val=
ue by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
      temp |=3D PORT_WR;
              ^

vim +79 drivers/usb/host/xhci-hub.c

48e8236114c12c5 Sarah Sharp   2011-10-06   54  =

5693e0b77f82cdd Mathias Nyman 2015-10-01   55  static int xhci_create_usb3_=
bos_desc(struct xhci_hcd *xhci, char *buf,
5693e0b77f82cdd Mathias Nyman 2015-10-01   56  				     u16 wLength)
5693e0b77f82cdd Mathias Nyman 2015-10-01   57  {
fc57313d1017dd6 Mathias Nyman 2020-02-10   58  	struct xhci_port_cap *port_=
cap =3D NULL;
5693e0b77f82cdd Mathias Nyman 2015-10-01   59  	int i, ssa_count;
5693e0b77f82cdd Mathias Nyman 2015-10-01   60  	u32 temp;
5693e0b77f82cdd Mathias Nyman 2015-10-01   61  	u16 desc_size, ssp_cap_size=
, ssa_size =3D 0;
5693e0b77f82cdd Mathias Nyman 2015-10-01   62  	bool usb3_1 =3D false;
5693e0b77f82cdd Mathias Nyman 2015-10-01   63  =

5693e0b77f82cdd Mathias Nyman 2015-10-01   64  	desc_size =3D USB_DT_BOS_SI=
ZE + USB_DT_USB_SS_CAP_SIZE;
5693e0b77f82cdd Mathias Nyman 2015-10-01   65  	ssp_cap_size =3D sizeof(usb=
_bos_descriptor) - desc_size;
5693e0b77f82cdd Mathias Nyman 2015-10-01   66  =

5693e0b77f82cdd Mathias Nyman 2015-10-01   67  	/* does xhci support USB 3.=
1 Enhanced SuperSpeed */
fc57313d1017dd6 Mathias Nyman 2020-02-10   68  	for (i =3D 0; i < xhci->num=
_port_caps; i++) {
fc57313d1017dd6 Mathias Nyman 2020-02-10   69  		if (xhci->port_caps[i].maj=
_rev =3D=3D 0x03 &&
fc57313d1017dd6 Mathias Nyman 2020-02-10   70  		    xhci->port_caps[i].min=
_rev >=3D 0x01) {
fc57313d1017dd6 Mathias Nyman 2020-02-10   71  			usb3_1 =3D true;
fc57313d1017dd6 Mathias Nyman 2020-02-10   72  			port_cap =3D &xhci->port_=
caps[i];
fc57313d1017dd6 Mathias Nyman 2020-02-10   73  			break;
fc57313d1017dd6 Mathias Nyman 2020-02-10   74  		}
fc57313d1017dd6 Mathias Nyman 2020-02-10   75  	}
fc57313d1017dd6 Mathias Nyman 2020-02-10   76  =

fc57313d1017dd6 Mathias Nyman 2020-02-10   77  	if (usb3_1) {
5da665fcec1a308 Mathias Nyman 2016-01-25   78  		/* does xhci provide a PSI=
 table for SSA speed attributes? */
fc57313d1017dd6 Mathias Nyman 2020-02-10  @79  		if (port_cap->psi_count) {
5da665fcec1a308 Mathias Nyman 2016-01-25   80  			/* two SSA entries for ea=
ch unique PSI ID, RX and TX */
fc57313d1017dd6 Mathias Nyman 2020-02-10   81  			ssa_count =3D port_cap->p=
si_uid_count * 2;
5693e0b77f82cdd Mathias Nyman 2015-10-01   82  			ssa_size =3D ssa_count * =
sizeof(u32);
5da665fcec1a308 Mathias Nyman 2016-01-25   83  			ssp_cap_size -=3D 16; /* =
skip copying the default SSA */
5da665fcec1a308 Mathias Nyman 2016-01-25   84  		}
5693e0b77f82cdd Mathias Nyman 2015-10-01   85  		desc_size +=3D ssp_cap_siz=
e;
5693e0b77f82cdd Mathias Nyman 2015-10-01   86  	}
5693e0b77f82cdd Mathias Nyman 2015-10-01   87  	memcpy(buf, &usb_bos_descri=
ptor, min(desc_size, wLength));
5693e0b77f82cdd Mathias Nyman 2015-10-01   88  =

5693e0b77f82cdd Mathias Nyman 2015-10-01   89  	if (usb3_1) {
5693e0b77f82cdd Mathias Nyman 2015-10-01   90  		/* modify bos descriptor b=
NumDeviceCaps and wTotalLength */
5693e0b77f82cdd Mathias Nyman 2015-10-01   91  		buf[4] +=3D 1;
5693e0b77f82cdd Mathias Nyman 2015-10-01   92  		put_unaligned_le16(desc_si=
ze + ssa_size, &buf[2]);
5693e0b77f82cdd Mathias Nyman 2015-10-01   93  	}
5693e0b77f82cdd Mathias Nyman 2015-10-01   94  =

5693e0b77f82cdd Mathias Nyman 2015-10-01   95  	if (wLength < USB_DT_BOS_SI=
ZE + USB_DT_USB_SS_CAP_SIZE)
5693e0b77f82cdd Mathias Nyman 2015-10-01   96  		return wLength;
5693e0b77f82cdd Mathias Nyman 2015-10-01   97  =

5693e0b77f82cdd Mathias Nyman 2015-10-01   98  	/* Indicate whether the hos=
t has LTM support. */
5693e0b77f82cdd Mathias Nyman 2015-10-01   99  	temp =3D readl(&xhci->cap_r=
egs->hcc_params);
5693e0b77f82cdd Mathias Nyman 2015-10-01  100  	if (HCC_LTC(temp))
5693e0b77f82cdd Mathias Nyman 2015-10-01  101  		buf[8] |=3D USB_LTM_SUPPOR=
T;
5693e0b77f82cdd Mathias Nyman 2015-10-01  102  =

5693e0b77f82cdd Mathias Nyman 2015-10-01  103  	/* Set the U1 and U2 exit l=
atencies. */
5693e0b77f82cdd Mathias Nyman 2015-10-01  104  	if ((xhci->quirks & XHCI_LP=
M_SUPPORT)) {
5693e0b77f82cdd Mathias Nyman 2015-10-01  105  		temp =3D readl(&xhci->cap_=
regs->hcs_params3);
5693e0b77f82cdd Mathias Nyman 2015-10-01  106  		buf[12] =3D HCS_U1_LATENCY=
(temp);
5693e0b77f82cdd Mathias Nyman 2015-10-01  107  		put_unaligned_le16(HCS_U2_=
LATENCY(temp), &buf[13]);
5693e0b77f82cdd Mathias Nyman 2015-10-01  108  	}
5693e0b77f82cdd Mathias Nyman 2015-10-01  109  =

5da665fcec1a308 Mathias Nyman 2016-01-25  110  	/* If PSI table exists, add=
 the custom speed attributes from it */
fc57313d1017dd6 Mathias Nyman 2020-02-10  111  	if (usb3_1 && port_cap->psi=
_count) {
7bea22b124d7784 Mathias Nyman 2017-09-18  112  		u32 ssp_cap_base, bm_attri=
b, psi, psi_mant, psi_exp;
5693e0b77f82cdd Mathias Nyman 2015-10-01  113  		int offset;
5693e0b77f82cdd Mathias Nyman 2015-10-01  114  =

5693e0b77f82cdd Mathias Nyman 2015-10-01  115  		ssp_cap_base =3D USB_DT_BO=
S_SIZE + USB_DT_USB_SS_CAP_SIZE;
5693e0b77f82cdd Mathias Nyman 2015-10-01  116  =

5693e0b77f82cdd Mathias Nyman 2015-10-01  117  		if (wLength < desc_size)
5693e0b77f82cdd Mathias Nyman 2015-10-01  118  			return wLength;
5693e0b77f82cdd Mathias Nyman 2015-10-01  119  		buf[ssp_cap_base] =3D ssp_=
cap_size + ssa_size;
5693e0b77f82cdd Mathias Nyman 2015-10-01  120  =

5693e0b77f82cdd Mathias Nyman 2015-10-01  121  		/* attribute count SSAC bi=
ts 4:0 and ID count SSIC bits 8:5 */
5693e0b77f82cdd Mathias Nyman 2015-10-01  122  		bm_attrib =3D (ssa_count -=
 1) & 0x1f;
fc57313d1017dd6 Mathias Nyman 2020-02-10  123  		bm_attrib |=3D (port_cap->=
psi_uid_count - 1) << 5;
5693e0b77f82cdd Mathias Nyman 2015-10-01  124  		put_unaligned_le32(bm_attr=
ib, &buf[ssp_cap_base + 4]);
5693e0b77f82cdd Mathias Nyman 2015-10-01  125  =

5693e0b77f82cdd Mathias Nyman 2015-10-01  126  		if (wLength < desc_size + =
ssa_size)
5693e0b77f82cdd Mathias Nyman 2015-10-01  127  			return wLength;
5693e0b77f82cdd Mathias Nyman 2015-10-01  128  		/*
5693e0b77f82cdd Mathias Nyman 2015-10-01  129  		 * Create the Sublink Spee=
d Attributes (SSA) array.
5693e0b77f82cdd Mathias Nyman 2015-10-01  130  		 * The xhci PSI field and =
USB 3.1 SSA fields are very similar,
5693e0b77f82cdd Mathias Nyman 2015-10-01  131  		 * but link type bits 7:6 =
differ for values 01b and 10b.
5693e0b77f82cdd Mathias Nyman 2015-10-01  132  		 * xhci has also only one =
PSI entry for a symmetric link when
5693e0b77f82cdd Mathias Nyman 2015-10-01  133  		 * USB 3.1 requires two SS=
A entries (RX and TX) for every link
5693e0b77f82cdd Mathias Nyman 2015-10-01  134  		 */
5693e0b77f82cdd Mathias Nyman 2015-10-01  135  		offset =3D desc_size;
fc57313d1017dd6 Mathias Nyman 2020-02-10  136  		for (i =3D 0; i < port_cap=
->psi_count; i++) {
fc57313d1017dd6 Mathias Nyman 2020-02-10  137  			psi =3D port_cap->psi[i];
5693e0b77f82cdd Mathias Nyman 2015-10-01  138  			psi &=3D ~USB_SSP_SUBLINK=
_SPEED_RSVD;
7bea22b124d7784 Mathias Nyman 2017-09-18  139  			psi_exp =3D XHCI_EXT_PORT=
_PSIE(psi);
7bea22b124d7784 Mathias Nyman 2017-09-18  140  			psi_mant =3D XHCI_EXT_POR=
T_PSIM(psi);
7bea22b124d7784 Mathias Nyman 2017-09-18  141  =

7bea22b124d7784 Mathias Nyman 2017-09-18  142  			/* Shift to Gbps and set =
SSP Link BIT(14) if 10Gpbs */
7bea22b124d7784 Mathias Nyman 2017-09-18  143  			for (; psi_exp < 3; psi_e=
xp++)
7bea22b124d7784 Mathias Nyman 2017-09-18  144  				psi_mant /=3D 1000;
7bea22b124d7784 Mathias Nyman 2017-09-18  145  			if (psi_mant >=3D 10)
7bea22b124d7784 Mathias Nyman 2017-09-18  146  				psi |=3D BIT(14);
7bea22b124d7784 Mathias Nyman 2017-09-18  147  =

5693e0b77f82cdd Mathias Nyman 2015-10-01  148  			if ((psi & PLT_MASK) =3D=
=3D PLT_SYM) {
5693e0b77f82cdd Mathias Nyman 2015-10-01  149  			/* Symmetric, create SSA =
RX and TX from one PSI entry */
5693e0b77f82cdd Mathias Nyman 2015-10-01  150  				put_unaligned_le32(psi, =
&buf[offset]);
5693e0b77f82cdd Mathias Nyman 2015-10-01  151  				psi |=3D 1 << 7;  /* tur=
n entry to TX */
5693e0b77f82cdd Mathias Nyman 2015-10-01  152  				offset +=3D 4;
5693e0b77f82cdd Mathias Nyman 2015-10-01  153  				if (offset >=3D desc_siz=
e + ssa_size)
5693e0b77f82cdd Mathias Nyman 2015-10-01  154  					return desc_size + ssa_=
size;
5693e0b77f82cdd Mathias Nyman 2015-10-01  155  			} else if ((psi & PLT_MAS=
K) =3D=3D PLT_ASYM_RX) {
5693e0b77f82cdd Mathias Nyman 2015-10-01  156  				/* Asymetric RX, flip bi=
ts 7:6 for SSA */
5693e0b77f82cdd Mathias Nyman 2015-10-01  157  				psi ^=3D PLT_MASK;
5693e0b77f82cdd Mathias Nyman 2015-10-01  158  			}
5693e0b77f82cdd Mathias Nyman 2015-10-01  159  			put_unaligned_le32(psi, &=
buf[offset]);
5693e0b77f82cdd Mathias Nyman 2015-10-01  160  			offset +=3D 4;
5693e0b77f82cdd Mathias Nyman 2015-10-01  161  			if (offset >=3D desc_size=
 + ssa_size)
5693e0b77f82cdd Mathias Nyman 2015-10-01  162  				return desc_size + ssa_s=
ize;
5693e0b77f82cdd Mathias Nyman 2015-10-01  163  		}
5693e0b77f82cdd Mathias Nyman 2015-10-01  164  	}
5693e0b77f82cdd Mathias Nyman 2015-10-01  165  	/* ssa_size is 0 for other =
than usb 3.1 hosts */
5693e0b77f82cdd Mathias Nyman 2015-10-01  166  	return desc_size + ssa_size;
5693e0b77f82cdd Mathias Nyman 2015-10-01  167  }
48e8236114c12c5 Sarah Sharp   2011-10-06  168  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7733290027807973131==--

