Content-Type: multipart/mixed; boundary="===============5663946243029722856=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/isdn/hardware/mISDN/hfcmulti.c:2158 hfcmulti_tx() error: dereferencing freed memory
Date: Sat, 14 Nov 2020 02:06:43 +0800
Message-ID: <202011140234.HfLvZ1Ge-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5663946243029722856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   585e5b17b92dead8a3aca4e3c9876fbca5f7e0ba
commit: be769db2f95861cc8c7c8fedcc71a8c39b803b10 net: Get rid of consume_sk=
b when tracing is off
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-m031-20201113 (attached as .config)
compiler: mips64el-linux-gcc (GCC) 9.3.0

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

--===============5663946243029722856==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
5dT/AM9L2a1LrwEA
--===============5663946243029722856==--

