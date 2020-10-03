Content-Type: multipart/mixed; boundary="===============7297059790695593603=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/isdn/hardware/mISDN/hfcmulti.c:2158 hfcmulti_tx() error: dereferencing freed memory
Date: Sun, 04 Oct 2020 03:09:21 +0800
Message-ID: <202010040315.mYvCxeqN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7297059790695593603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d3d45f8220d60a0b2aaaacf8fb2be4e6ffd9008e
commit: be769db2f95861cc8c7c8fedcc71a8c39b803b10 net: Get rid of consume_sk=
b when tracing is off
date:   6 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 weeks ago
config: parisc-randconfig-m031-20201004 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/isdn/hardware/mISDN/hfcmulti.c:2158 hfcmulti_tx() error: dereferenc=
ing freed memory '*sp'

Old smatch warnings:
drivers/isdn/hardware/mISDN/hfcmulti.c:2162 hfcmulti_tx() error: dereferenc=
ing freed memory '*sp'
drivers/isdn/hardware/mISDN/hfcmulti.c:4411 setup_pci() warn: argument 2 to=
 %#lx specifier is cast from pointer
drivers/isdn/hardware/mISDN/hfcmulti.c:4434 setup_pci() warn: argument 3 to=
 %#lx specifier is cast from pointer
drivers/isdn/hardware/mISDN/hfcmulti.c:4462 setup_pci() warn: argument 3 to=
 %#lx specifier is cast from pointer

vim +2158 drivers/isdn/hardware/mISDN/hfcmulti.c

af69fb3a8ffa37e Karsten Keil      2008-07-27  1925  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  1926  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  1927  /*
af69fb3a8ffa37e Karsten Keil      2008-07-27  1928   * fill fifo as much as=
 possible
af69fb3a8ffa37e Karsten Keil      2008-07-27  1929   */
af69fb3a8ffa37e Karsten Keil      2008-07-27  1930  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  1931  static void
af69fb3a8ffa37e Karsten Keil      2008-07-27  1932  hfcmulti_tx(struct hfc_=
multi *hc, int ch)
af69fb3a8ffa37e Karsten Keil      2008-07-27  1933  {
af69fb3a8ffa37e Karsten Keil      2008-07-27  1934  	int i, ii, temp, len =
=3D 0;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1935  	int Zspace, z1, z2; /*=
 must be int for calculation */
af69fb3a8ffa37e Karsten Keil      2008-07-27  1936  	int Fspace, f1, f2;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1937  	u_char *d;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1938  	int *txpending, slot_t=
x;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1939  	struct	bchannel *bch;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1940  	struct  dchannel *dch;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1941  	struct  sk_buff **sp =
=3D NULL;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1942  	int *idxp;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1943  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  1944  	bch =3D hc->chan[ch].b=
ch;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1945  	dch =3D hc->chan[ch].d=
ch;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1946  	if ((!dch) && (!bch))
af69fb3a8ffa37e Karsten Keil      2008-07-27  1947  		return;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1948  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  1949  	txpending =3D &hc->cha=
n[ch].txpending;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1950  	slot_tx =3D hc->chan[c=
h].slot_tx;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1951  	if (dch) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  1952  		if (!test_bit(FLG_ACT=
IVE, &dch->Flags))
af69fb3a8ffa37e Karsten Keil      2008-07-27  1953  			return;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1954  		sp =3D &dch->tx_skb;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1955  		idxp =3D &dch->tx_idx;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1956  	} else {
af69fb3a8ffa37e Karsten Keil      2008-07-27  1957  		if (!test_bit(FLG_ACT=
IVE, &bch->Flags))
af69fb3a8ffa37e Karsten Keil      2008-07-27  1958  			return;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1959  		sp =3D &bch->tx_skb;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1960  		idxp =3D &bch->tx_idx;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1961  	}
af69fb3a8ffa37e Karsten Keil      2008-07-27  1962  	if (*sp)
af69fb3a8ffa37e Karsten Keil      2008-07-27  1963  		len =3D (*sp)->len;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1964  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  1965  	if ((!len) && *txpendi=
ng !=3D 1)
af69fb3a8ffa37e Karsten Keil      2008-07-27  1966  		return; /* no data */
af69fb3a8ffa37e Karsten Keil      2008-07-27  1967  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  1968  	if (test_bit(HFC_CHIP_=
B410P, &hc->chip) &&
af69fb3a8ffa37e Karsten Keil      2008-07-27  1969  	    (hc->chan[ch].prot=
ocol =3D=3D ISDN_P_B_RAW) &&
af69fb3a8ffa37e Karsten Keil      2008-07-27  1970  	    (hc->chan[ch].slot=
_rx < 0) &&
af69fb3a8ffa37e Karsten Keil      2008-07-27  1971  	    (hc->chan[ch].slot=
_tx < 0))
af69fb3a8ffa37e Karsten Keil      2008-07-27  1972  		HFC_outb_nodebug(hc, =
R_FIFO, 0x20 | (ch << 1));
af69fb3a8ffa37e Karsten Keil      2008-07-27  1973  	else
af69fb3a8ffa37e Karsten Keil      2008-07-27  1974  		HFC_outb_nodebug(hc, =
R_FIFO, ch << 1);
af69fb3a8ffa37e Karsten Keil      2008-07-27  1975  	HFC_wait_nodebug(hc);
af69fb3a8ffa37e Karsten Keil      2008-07-27  1976  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  1977  	if (*txpending =3D=3D =
2) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  1978  		/* reset fifo */
af69fb3a8ffa37e Karsten Keil      2008-07-27  1979  		HFC_outb_nodebug(hc, =
R_INC_RES_FIFO, V_RES_F);
af69fb3a8ffa37e Karsten Keil      2008-07-27  1980  		HFC_wait_nodebug(hc);
af69fb3a8ffa37e Karsten Keil      2008-07-27  1981  		HFC_outb(hc, A_SUBCH_=
CFG, 0);
af69fb3a8ffa37e Karsten Keil      2008-07-27  1982  		*txpending =3D 1;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1983  	}
af69fb3a8ffa37e Karsten Keil      2008-07-27  1984  next_frame:
af69fb3a8ffa37e Karsten Keil      2008-07-27  1985  	if (dch || test_bit(FL=
G_HDLC, &bch->Flags)) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  1986  		f1 =3D HFC_inb_nodebu=
g(hc, A_F1);
af69fb3a8ffa37e Karsten Keil      2008-07-27  1987  		f2 =3D HFC_inb_nodebu=
g(hc, A_F2);
af69fb3a8ffa37e Karsten Keil      2008-07-27  1988  		while (f2 !=3D (temp =
=3D HFC_inb_nodebug(hc, A_F2))) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  1989  			if (debug & DEBUG_HF=
CMULTI_FIFO)
af69fb3a8ffa37e Karsten Keil      2008-07-27  1990  				printk(KERN_DEBUG
af69fb3a8ffa37e Karsten Keil      2008-07-27  1991  				       "%s(card %d)=
: reread f2 because %d!=3D%d\n",
af69fb3a8ffa37e Karsten Keil      2008-07-27  1992  				       __func__, hc=
->id + 1, temp, f2);
af69fb3a8ffa37e Karsten Keil      2008-07-27  1993  			f2 =3D temp; /* repe=
at until F2 is equal */
af69fb3a8ffa37e Karsten Keil      2008-07-27  1994  		}
af69fb3a8ffa37e Karsten Keil      2008-07-27  1995  		Fspace =3D f2 - f1 - =
1;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1996  		if (Fspace < 0)
af69fb3a8ffa37e Karsten Keil      2008-07-27  1997  			Fspace +=3D hc->Flen;
af69fb3a8ffa37e Karsten Keil      2008-07-27  1998  		/*
af69fb3a8ffa37e Karsten Keil      2008-07-27  1999  		 * Old FIFO handling =
doesn't give us the current Z2 read
af69fb3a8ffa37e Karsten Keil      2008-07-27  2000  		 * pointer, so we can=
not send the next frame before the fifo
af69fb3a8ffa37e Karsten Keil      2008-07-27  2001  		 * is empty. It makes=
 no difference except for a slightly
af69fb3a8ffa37e Karsten Keil      2008-07-27  2002  		 * lower performance.
af69fb3a8ffa37e Karsten Keil      2008-07-27  2003  		 */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2004  		if (test_bit(HFC_CHIP=
_REVISION0, &hc->chip)) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  2005  			if (f1 !=3D f2)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2006  				Fspace =3D 0;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2007  			else
af69fb3a8ffa37e Karsten Keil      2008-07-27  2008  				Fspace =3D 1;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2009  		}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2010  		/* one frame only for=
 ST D-channels, to allow resending */
db9bb63a1b5b65d Karsten Keil      2009-05-22  2011  		if (hc->ctype !=3D HF=
C_TYPE_E1 && dch) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  2012  			if (f1 !=3D f2)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2013  				Fspace =3D 0;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2014  		}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2015  		/* F-counter full con=
dition */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2016  		if (Fspace =3D=3D 0)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2017  			return;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2018  	}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2019  	z1 =3D HFC_inw_nodebug=
(hc, A_Z1) - hc->Zmin;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2020  	z2 =3D HFC_inw_nodebug=
(hc, A_Z2) - hc->Zmin;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2021  	while (z2 !=3D (temp =
=3D (HFC_inw_nodebug(hc, A_Z2) - hc->Zmin))) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  2022  		if (debug & DEBUG_HFC=
MULTI_FIFO)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2023  			printk(KERN_DEBUG "%=
s(card %d): reread z2 because "
af69fb3a8ffa37e Karsten Keil      2008-07-27  2024  			       "%d!=3D%d\n",=
 __func__, hc->id + 1, temp, z2);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2025  		z2 =3D temp; /* repea=
t unti Z2 is equal */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2026  	}
7cfa153dd709f15 Andreas Eversberg 2009-05-22  2027  	hc->chan[ch].Zfill =3D=
 z1 - z2;
7cfa153dd709f15 Andreas Eversberg 2009-05-22  2028  	if (hc->chan[ch].Zfill=
 < 0)
7cfa153dd709f15 Andreas Eversberg 2009-05-22  2029  		hc->chan[ch].Zfill +=
=3D hc->Zlen;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2030  	Zspace =3D z2 - z1;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2031  	if (Zspace <=3D 0)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2032  		Zspace +=3D hc->Zlen;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2033  	Zspace -=3D 4; /* keep=
 not too full, so pointers will not overrun */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2034  	/* fill transparent da=
ta only to maxinum transparent load (minus 4) */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2035  	if (bch && test_bit(FL=
G_TRANSPARENT, &bch->Flags))
af69fb3a8ffa37e Karsten Keil      2008-07-27  2036  		Zspace =3D Zspace - h=
c->Zlen + hc->max_trans;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2037  	if (Zspace <=3D 0) /* =
no space of 4 bytes */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2038  		return;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2039  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  2040  	/* if no data */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2041  	if (!len) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  2042  		if (z1 =3D=3D z2) { /=
* empty */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2043  			/* if done with FIFO=
 audio data during PCM connection */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2044  			if (bch && (!test_bi=
t(FLG_HDLC, &bch->Flags)) &&
af69fb3a8ffa37e Karsten Keil      2008-07-27  2045  			    *txpending && sl=
ot_tx >=3D 0) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  2046  				if (debug & DEBUG_H=
FCMULTI_MODE)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2047  					printk(KERN_DEBUG
af69fb3a8ffa37e Karsten Keil      2008-07-27  2048  					       "%s: reconn=
ecting PCM due to no "
af69fb3a8ffa37e Karsten Keil      2008-07-27  2049  					       "more FIFO =
data: channel %d "
af69fb3a8ffa37e Karsten Keil      2008-07-27  2050  					       "slot_tx %d=
\n",
af69fb3a8ffa37e Karsten Keil      2008-07-27  2051  					       __func__, c=
h, slot_tx);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2052  				/* connect slot */
db9bb63a1b5b65d Karsten Keil      2009-05-22  2053  				if (hc->ctype =3D=
=3D HFC_TYPE_XHFC)
db9bb63a1b5b65d Karsten Keil      2009-05-22  2054  					HFC_outb(hc, A_CON=
_HDLC, 0xc0
db9bb63a1b5b65d Karsten Keil      2009-05-22  2055  						 | 0x07 << 2 | V_=
HDLC_TRP | V_IFF);
db9bb63a1b5b65d Karsten Keil      2009-05-22  2056  				/* Enable FIFO, no =
interrupt */
db9bb63a1b5b65d Karsten Keil      2009-05-22  2057  				else
af69fb3a8ffa37e Karsten Keil      2008-07-27  2058  					HFC_outb(hc, A_CON=
_HDLC, 0xc0 | 0x00 |
af69fb3a8ffa37e Karsten Keil      2008-07-27  2059  						 V_HDLC_TRP | V_I=
FF);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2060  				HFC_outb_nodebug(hc=
, R_FIFO, ch << 1 | 1);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2061  				HFC_wait_nodebug(hc=
);
db9bb63a1b5b65d Karsten Keil      2009-05-22  2062  				if (hc->ctype =3D=
=3D HFC_TYPE_XHFC)
db9bb63a1b5b65d Karsten Keil      2009-05-22  2063  					HFC_outb(hc, A_CON=
_HDLC, 0xc0
db9bb63a1b5b65d Karsten Keil      2009-05-22  2064  						 | 0x07 << 2 | V_=
HDLC_TRP | V_IFF);
db9bb63a1b5b65d Karsten Keil      2009-05-22  2065  				/* Enable FIFO, no =
interrupt */
db9bb63a1b5b65d Karsten Keil      2009-05-22  2066  				else
af69fb3a8ffa37e Karsten Keil      2008-07-27  2067  					HFC_outb(hc, A_CON=
_HDLC, 0xc0 | 0x00 |
af69fb3a8ffa37e Karsten Keil      2008-07-27  2068  						 V_HDLC_TRP | V_I=
FF);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2069  				HFC_outb_nodebug(hc=
, R_FIFO, ch << 1);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2070  				HFC_wait_nodebug(hc=
);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2071  			}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2072  			*txpending =3D 0;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2073  		}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2074  		return; /* no data */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2075  	}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2076  =

8dd2f36f3175696 Andreas Eversberg 2008-08-02  2077  	/* "fill fifo if empty=
" feature */
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2078  	if (bch && test_bit(FL=
G_FILLEMPTY, &bch->Flags)
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2079  	    && !test_bit(FLG_H=
DLC, &bch->Flags) && z2 =3D=3D z1) {
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2080  		if (debug & DEBUG_HFC=
MULTI_FILL)
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2081  			printk(KERN_DEBUG "%=
s: buffer empty, so we have "
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2082  			       "underrun\n",=
 __func__);
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2083  		/* fill buffer, to pr=
event future underrun */
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2084  		hc->write_fifo(hc, hc=
->silence_data, poll >> 1);
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2085  		Zspace -=3D (poll >> =
1);
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2086  	}
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2087  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  2088  	/* if audio data and c=
onnected slot */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2089  	if (bch && (!test_bit(=
FLG_HDLC, &bch->Flags)) && (!*txpending)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2090  	    && slot_tx >=3D 0)=
 {
af69fb3a8ffa37e Karsten Keil      2008-07-27  2091  		if (debug & DEBUG_HFC=
MULTI_MODE)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2092  			printk(KERN_DEBUG "%=
s: disconnecting PCM due to "
af69fb3a8ffa37e Karsten Keil      2008-07-27  2093  			       "FIFO data: c=
hannel %d slot_tx %d\n",
af69fb3a8ffa37e Karsten Keil      2008-07-27  2094  			       __func__, ch,=
 slot_tx);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2095  		/* disconnect slot */
db9bb63a1b5b65d Karsten Keil      2009-05-22  2096  		if (hc->ctype =3D=3D =
HFC_TYPE_XHFC)
db9bb63a1b5b65d Karsten Keil      2009-05-22  2097  			HFC_outb(hc, A_CON_H=
DLC, 0x80
db9bb63a1b5b65d Karsten Keil      2009-05-22  2098  				 | 0x07 << 2 | V_HD=
LC_TRP | V_IFF);
db9bb63a1b5b65d Karsten Keil      2009-05-22  2099  		/* Enable FIFO, no in=
terrupt */
db9bb63a1b5b65d Karsten Keil      2009-05-22  2100  		else
db9bb63a1b5b65d Karsten Keil      2009-05-22  2101  			HFC_outb(hc, A_CON_H=
DLC, 0x80 | 0x00 |
db9bb63a1b5b65d Karsten Keil      2009-05-22  2102  				 V_HDLC_TRP | V_IFF=
);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2103  		HFC_outb_nodebug(hc, =
R_FIFO, ch << 1 | 1);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2104  		HFC_wait_nodebug(hc);
db9bb63a1b5b65d Karsten Keil      2009-05-22  2105  		if (hc->ctype =3D=3D =
HFC_TYPE_XHFC)
db9bb63a1b5b65d Karsten Keil      2009-05-22  2106  			HFC_outb(hc, A_CON_H=
DLC, 0x80
db9bb63a1b5b65d Karsten Keil      2009-05-22  2107  				 | 0x07 << 2 | V_HD=
LC_TRP | V_IFF);
db9bb63a1b5b65d Karsten Keil      2009-05-22  2108  		/* Enable FIFO, no in=
terrupt */
db9bb63a1b5b65d Karsten Keil      2009-05-22  2109  		else
db9bb63a1b5b65d Karsten Keil      2009-05-22  2110  			HFC_outb(hc, A_CON_H=
DLC, 0x80 | 0x00 |
db9bb63a1b5b65d Karsten Keil      2009-05-22  2111  				 V_HDLC_TRP | V_IFF=
);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2112  		HFC_outb_nodebug(hc, =
R_FIFO, ch << 1);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2113  		HFC_wait_nodebug(hc);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2114  	}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2115  	*txpending =3D 1;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2116  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  2117  	/* show activity */
864fd636b196e75 Andreas Eversberg 2012-04-24  2118  	if (dch)
864fd636b196e75 Andreas Eversberg 2012-04-24  2119  		hc->activity_tx |=3D =
1 << hc->chan[ch].port;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2120  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  2121  	/* fill fifo to what w=
e have left */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2122  	ii =3D len;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2123  	if (dch || test_bit(FL=
G_HDLC, &bch->Flags))
af69fb3a8ffa37e Karsten Keil      2008-07-27  2124  		temp =3D 1;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2125  	else
af69fb3a8ffa37e Karsten Keil      2008-07-27  2126  		temp =3D 0;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2127  	i =3D *idxp;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2128  	d =3D (*sp)->data + i;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2129  	if (ii - i > Zspace)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2130  		ii =3D Zspace + i;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2131  	if (debug & DEBUG_HFCM=
ULTI_FIFO)
af69fb3a8ffa37e Karsten Keil      2008-07-27  2132  		printk(KERN_DEBUG "%s=
(card %d): fifo(%d) has %d bytes space "
af69fb3a8ffa37e Karsten Keil      2008-07-27  2133  		       "left (z1=3D%0=
4x, z2=3D%04x) sending %d of %d bytes %s\n",
af69fb3a8ffa37e Karsten Keil      2008-07-27  2134  		       __func__, hc->=
id + 1, ch, Zspace, z1, z2, ii-i, len-i,
af69fb3a8ffa37e Karsten Keil      2008-07-27  2135  		       temp ? "HDLC" =
: "TRANS");
af69fb3a8ffa37e Karsten Keil      2008-07-27  2136  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  2137  	/* Have to prep the au=
dio data */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2138  	hc->write_fifo(hc, d, =
ii - i);
7cfa153dd709f15 Andreas Eversberg 2009-05-22  2139  	hc->chan[ch].Zfill +=
=3D ii - i;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2140  	*idxp =3D ii;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2141  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  2142  	/* if not all data has=
 been written */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2143  	if (ii !=3D len) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  2144  		/* NOTE: fifo is star=
ted by the calling function */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2145  		return;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2146  	}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2147  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  2148  	/* if all data has bee=
n written, terminate frame */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2149  	if (dch || test_bit(FL=
G_HDLC, &bch->Flags)) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  2150  		/* increment f-counte=
r */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2151  		HFC_outb_nodebug(hc, =
R_INC_RES_FIFO, V_INC_F);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2152  		HFC_wait_nodebug(hc);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2153  	}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2154  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  2155  	dev_kfree_skb(*sp);
8bfddfbe2100862 Karsten Keil      2012-05-15  2156  	/* check for next fram=
e */
8bfddfbe2100862 Karsten Keil      2012-05-15  2157  	if (bch && get_next_bf=
rame(bch)) {
af69fb3a8ffa37e Karsten Keil      2008-07-27 @2158  		len =3D (*sp)->len;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2159  		goto next_frame;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2160  	}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2161  	if (dch && get_next_df=
rame(dch)) {
af69fb3a8ffa37e Karsten Keil      2008-07-27  2162  		len =3D (*sp)->len;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2163  		goto next_frame;
af69fb3a8ffa37e Karsten Keil      2008-07-27  2164  	}
af69fb3a8ffa37e Karsten Keil      2008-07-27  2165  =

af69fb3a8ffa37e Karsten Keil      2008-07-27  2166  	/*
af69fb3a8ffa37e Karsten Keil      2008-07-27  2167  	 * now we have no more=
 data, so in case of transparent,
af69fb3a8ffa37e Karsten Keil      2008-07-27  2168  	 * we set the last byt=
e in fifo to 'silence' in case we will get
af69fb3a8ffa37e Karsten Keil      2008-07-27  2169  	 * no more data at all=
. this prevents sending an undefined value.
af69fb3a8ffa37e Karsten Keil      2008-07-27  2170  	 */
af69fb3a8ffa37e Karsten Keil      2008-07-27  2171  	if (bch && test_bit(FL=
G_TRANSPARENT, &bch->Flags))
8dd2f36f3175696 Andreas Eversberg 2008-08-02  2172  		HFC_outb_nodebug(hc, =
A_FIFO_DATA0_NOINC, hc->silence);
af69fb3a8ffa37e Karsten Keil      2008-07-27  2173  }
af69fb3a8ffa37e Karsten Keil      2008-07-27  2174  =


:::::: The code at line 2158 was first introduced by commit
:::::: af69fb3a8ffa37e986db00ed93099dc44babeef4 Add mISDN HFC multiport dri=
ver

:::::: TO: Karsten Keil <kkeil@suse.de>
:::::: CC: Karsten Keil <kkeil@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7297059790695593603==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7297059790695593603==--

