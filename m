Content-Type: multipart/mixed; boundary="===============8990204741112883494=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/isdn/hardware/mISDN/hfcmulti.c:2158 hfcmulti_tx() error: dereferencing freed memory '*sp'
Date: Thu, 05 Aug 2021 07:33:46 +0800
Message-ID: <202108050735.yXwHw2lz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8990204741112883494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   251a1524293d0a90c4d5060f65f42a3016280049
commit: be769db2f95861cc8c7c8fedcc71a8c39b803b10 net: Get rid of consume_sk=
b when tracing is off
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: ia64-randconfig-m031-20210804 (attached as .config)
compiler: ia64-linux-gcc (GCC) 10.3.0

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
drivers/isdn/hardware/mISDN/hfcmulti.c:4504 setup_pci() warn: 'hc->plx_memb=
ase' not released on lines: 4419.

vim +2158 drivers/isdn/hardware/mISDN/hfcmulti.c

af69fb3a8ffa37 Karsten Keil      2008-07-27  1925  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  1926  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  1927  /*
af69fb3a8ffa37 Karsten Keil      2008-07-27  1928   * fill fifo as much as =
possible
af69fb3a8ffa37 Karsten Keil      2008-07-27  1929   */
af69fb3a8ffa37 Karsten Keil      2008-07-27  1930  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  1931  static void
af69fb3a8ffa37 Karsten Keil      2008-07-27  1932  hfcmulti_tx(struct hfc_m=
ulti *hc, int ch)
af69fb3a8ffa37 Karsten Keil      2008-07-27  1933  {
af69fb3a8ffa37 Karsten Keil      2008-07-27  1934  	int i, ii, temp, len =
=3D 0;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1935  	int Zspace, z1, z2; /* =
must be int for calculation */
af69fb3a8ffa37 Karsten Keil      2008-07-27  1936  	int Fspace, f1, f2;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1937  	u_char *d;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1938  	int *txpending, slot_tx;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1939  	struct	bchannel *bch;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1940  	struct  dchannel *dch;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1941  	struct  sk_buff **sp =
=3D NULL;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1942  	int *idxp;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1943  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  1944  	bch =3D hc->chan[ch].bc=
h;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1945  	dch =3D hc->chan[ch].dc=
h;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1946  	if ((!dch) && (!bch))
af69fb3a8ffa37 Karsten Keil      2008-07-27  1947  		return;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1948  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  1949  	txpending =3D &hc->chan=
[ch].txpending;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1950  	slot_tx =3D hc->chan[ch=
].slot_tx;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1951  	if (dch) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  1952  		if (!test_bit(FLG_ACTI=
VE, &dch->Flags))
af69fb3a8ffa37 Karsten Keil      2008-07-27  1953  			return;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1954  		sp =3D &dch->tx_skb;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1955  		idxp =3D &dch->tx_idx;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1956  	} else {
af69fb3a8ffa37 Karsten Keil      2008-07-27  1957  		if (!test_bit(FLG_ACTI=
VE, &bch->Flags))
af69fb3a8ffa37 Karsten Keil      2008-07-27  1958  			return;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1959  		sp =3D &bch->tx_skb;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1960  		idxp =3D &bch->tx_idx;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1961  	}
af69fb3a8ffa37 Karsten Keil      2008-07-27  1962  	if (*sp)
af69fb3a8ffa37 Karsten Keil      2008-07-27  1963  		len =3D (*sp)->len;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1964  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  1965  	if ((!len) && *txpendin=
g !=3D 1)
af69fb3a8ffa37 Karsten Keil      2008-07-27  1966  		return; /* no data */
af69fb3a8ffa37 Karsten Keil      2008-07-27  1967  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  1968  	if (test_bit(HFC_CHIP_B=
410P, &hc->chip) &&
af69fb3a8ffa37 Karsten Keil      2008-07-27  1969  	    (hc->chan[ch].proto=
col =3D=3D ISDN_P_B_RAW) &&
af69fb3a8ffa37 Karsten Keil      2008-07-27  1970  	    (hc->chan[ch].slot_=
rx < 0) &&
af69fb3a8ffa37 Karsten Keil      2008-07-27  1971  	    (hc->chan[ch].slot_=
tx < 0))
af69fb3a8ffa37 Karsten Keil      2008-07-27  1972  		HFC_outb_nodebug(hc, R=
_FIFO, 0x20 | (ch << 1));
af69fb3a8ffa37 Karsten Keil      2008-07-27  1973  	else
af69fb3a8ffa37 Karsten Keil      2008-07-27  1974  		HFC_outb_nodebug(hc, R=
_FIFO, ch << 1);
af69fb3a8ffa37 Karsten Keil      2008-07-27  1975  	HFC_wait_nodebug(hc);
af69fb3a8ffa37 Karsten Keil      2008-07-27  1976  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  1977  	if (*txpending =3D=3D 2=
) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  1978  		/* reset fifo */
af69fb3a8ffa37 Karsten Keil      2008-07-27  1979  		HFC_outb_nodebug(hc, R=
_INC_RES_FIFO, V_RES_F);
af69fb3a8ffa37 Karsten Keil      2008-07-27  1980  		HFC_wait_nodebug(hc);
af69fb3a8ffa37 Karsten Keil      2008-07-27  1981  		HFC_outb(hc, A_SUBCH_C=
FG, 0);
af69fb3a8ffa37 Karsten Keil      2008-07-27  1982  		*txpending =3D 1;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1983  	}
af69fb3a8ffa37 Karsten Keil      2008-07-27  1984  next_frame:
af69fb3a8ffa37 Karsten Keil      2008-07-27  1985  	if (dch || test_bit(FLG=
_HDLC, &bch->Flags)) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  1986  		f1 =3D HFC_inb_nodebug=
(hc, A_F1);
af69fb3a8ffa37 Karsten Keil      2008-07-27  1987  		f2 =3D HFC_inb_nodebug=
(hc, A_F2);
af69fb3a8ffa37 Karsten Keil      2008-07-27  1988  		while (f2 !=3D (temp =
=3D HFC_inb_nodebug(hc, A_F2))) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  1989  			if (debug & DEBUG_HFC=
MULTI_FIFO)
af69fb3a8ffa37 Karsten Keil      2008-07-27  1990  				printk(KERN_DEBUG
af69fb3a8ffa37 Karsten Keil      2008-07-27  1991  				       "%s(card %d):=
 reread f2 because %d!=3D%d\n",
af69fb3a8ffa37 Karsten Keil      2008-07-27  1992  				       __func__, hc-=
>id + 1, temp, f2);
af69fb3a8ffa37 Karsten Keil      2008-07-27  1993  			f2 =3D temp; /* repea=
t until F2 is equal */
af69fb3a8ffa37 Karsten Keil      2008-07-27  1994  		}
af69fb3a8ffa37 Karsten Keil      2008-07-27  1995  		Fspace =3D f2 - f1 - 1;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1996  		if (Fspace < 0)
af69fb3a8ffa37 Karsten Keil      2008-07-27  1997  			Fspace +=3D hc->Flen;
af69fb3a8ffa37 Karsten Keil      2008-07-27  1998  		/*
af69fb3a8ffa37 Karsten Keil      2008-07-27  1999  		 * Old FIFO handling d=
oesn't give us the current Z2 read
af69fb3a8ffa37 Karsten Keil      2008-07-27  2000  		 * pointer, so we cann=
ot send the next frame before the fifo
af69fb3a8ffa37 Karsten Keil      2008-07-27  2001  		 * is empty. It makes =
no difference except for a slightly
af69fb3a8ffa37 Karsten Keil      2008-07-27  2002  		 * lower performance.
af69fb3a8ffa37 Karsten Keil      2008-07-27  2003  		 */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2004  		if (test_bit(HFC_CHIP_=
REVISION0, &hc->chip)) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  2005  			if (f1 !=3D f2)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2006  				Fspace =3D 0;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2007  			else
af69fb3a8ffa37 Karsten Keil      2008-07-27  2008  				Fspace =3D 1;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2009  		}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2010  		/* one frame only for =
ST D-channels, to allow resending */
db9bb63a1b5b65 Karsten Keil      2009-05-22  2011  		if (hc->ctype !=3D HFC=
_TYPE_E1 && dch) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  2012  			if (f1 !=3D f2)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2013  				Fspace =3D 0;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2014  		}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2015  		/* F-counter full cond=
ition */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2016  		if (Fspace =3D=3D 0)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2017  			return;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2018  	}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2019  	z1 =3D HFC_inw_nodebug(=
hc, A_Z1) - hc->Zmin;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2020  	z2 =3D HFC_inw_nodebug(=
hc, A_Z2) - hc->Zmin;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2021  	while (z2 !=3D (temp =
=3D (HFC_inw_nodebug(hc, A_Z2) - hc->Zmin))) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  2022  		if (debug & DEBUG_HFCM=
ULTI_FIFO)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2023  			printk(KERN_DEBUG "%s=
(card %d): reread z2 because "
af69fb3a8ffa37 Karsten Keil      2008-07-27  2024  			       "%d!=3D%d\n", =
__func__, hc->id + 1, temp, z2);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2025  		z2 =3D temp; /* repeat=
 unti Z2 is equal */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2026  	}
7cfa153dd709f1 Andreas Eversberg 2009-05-22  2027  	hc->chan[ch].Zfill =3D =
z1 - z2;
7cfa153dd709f1 Andreas Eversberg 2009-05-22  2028  	if (hc->chan[ch].Zfill =
< 0)
7cfa153dd709f1 Andreas Eversberg 2009-05-22  2029  		hc->chan[ch].Zfill +=
=3D hc->Zlen;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2030  	Zspace =3D z2 - z1;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2031  	if (Zspace <=3D 0)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2032  		Zspace +=3D hc->Zlen;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2033  	Zspace -=3D 4; /* keep =
not too full, so pointers will not overrun */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2034  	/* fill transparent dat=
a only to maxinum transparent load (minus 4) */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2035  	if (bch && test_bit(FLG=
_TRANSPARENT, &bch->Flags))
af69fb3a8ffa37 Karsten Keil      2008-07-27  2036  		Zspace =3D Zspace - hc=
->Zlen + hc->max_trans;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2037  	if (Zspace <=3D 0) /* n=
o space of 4 bytes */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2038  		return;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2039  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  2040  	/* if no data */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2041  	if (!len) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  2042  		if (z1 =3D=3D z2) { /*=
 empty */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2043  			/* if done with FIFO =
audio data during PCM connection */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2044  			if (bch && (!test_bit=
(FLG_HDLC, &bch->Flags)) &&
af69fb3a8ffa37 Karsten Keil      2008-07-27  2045  			    *txpending && slo=
t_tx >=3D 0) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  2046  				if (debug & DEBUG_HF=
CMULTI_MODE)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2047  					printk(KERN_DEBUG
af69fb3a8ffa37 Karsten Keil      2008-07-27  2048  					       "%s: reconne=
cting PCM due to no "
af69fb3a8ffa37 Karsten Keil      2008-07-27  2049  					       "more FIFO d=
ata: channel %d "
af69fb3a8ffa37 Karsten Keil      2008-07-27  2050  					       "slot_tx %d\=
n",
af69fb3a8ffa37 Karsten Keil      2008-07-27  2051  					       __func__, ch=
, slot_tx);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2052  				/* connect slot */
db9bb63a1b5b65 Karsten Keil      2009-05-22  2053  				if (hc->ctype =3D=3D=
 HFC_TYPE_XHFC)
db9bb63a1b5b65 Karsten Keil      2009-05-22  2054  					HFC_outb(hc, A_CON_=
HDLC, 0xc0
db9bb63a1b5b65 Karsten Keil      2009-05-22  2055  						 | 0x07 << 2 | V_H=
DLC_TRP | V_IFF);
db9bb63a1b5b65 Karsten Keil      2009-05-22  2056  				/* Enable FIFO, no i=
nterrupt */
db9bb63a1b5b65 Karsten Keil      2009-05-22  2057  				else
af69fb3a8ffa37 Karsten Keil      2008-07-27  2058  					HFC_outb(hc, A_CON_=
HDLC, 0xc0 | 0x00 |
af69fb3a8ffa37 Karsten Keil      2008-07-27  2059  						 V_HDLC_TRP | V_IF=
F);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2060  				HFC_outb_nodebug(hc,=
 R_FIFO, ch << 1 | 1);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2061  				HFC_wait_nodebug(hc);
db9bb63a1b5b65 Karsten Keil      2009-05-22  2062  				if (hc->ctype =3D=3D=
 HFC_TYPE_XHFC)
db9bb63a1b5b65 Karsten Keil      2009-05-22  2063  					HFC_outb(hc, A_CON_=
HDLC, 0xc0
db9bb63a1b5b65 Karsten Keil      2009-05-22  2064  						 | 0x07 << 2 | V_H=
DLC_TRP | V_IFF);
db9bb63a1b5b65 Karsten Keil      2009-05-22  2065  				/* Enable FIFO, no i=
nterrupt */
db9bb63a1b5b65 Karsten Keil      2009-05-22  2066  				else
af69fb3a8ffa37 Karsten Keil      2008-07-27  2067  					HFC_outb(hc, A_CON_=
HDLC, 0xc0 | 0x00 |
af69fb3a8ffa37 Karsten Keil      2008-07-27  2068  						 V_HDLC_TRP | V_IF=
F);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2069  				HFC_outb_nodebug(hc,=
 R_FIFO, ch << 1);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2070  				HFC_wait_nodebug(hc);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2071  			}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2072  			*txpending =3D 0;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2073  		}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2074  		return; /* no data */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2075  	}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2076  =

8dd2f36f317569 Andreas Eversberg 2008-08-02  2077  	/* "fill fifo if empty"=
 feature */
8dd2f36f317569 Andreas Eversberg 2008-08-02  2078  	if (bch && test_bit(FLG=
_FILLEMPTY, &bch->Flags)
8dd2f36f317569 Andreas Eversberg 2008-08-02  2079  	    && !test_bit(FLG_HD=
LC, &bch->Flags) && z2 =3D=3D z1) {
8dd2f36f317569 Andreas Eversberg 2008-08-02  2080  		if (debug & DEBUG_HFCM=
ULTI_FILL)
8dd2f36f317569 Andreas Eversberg 2008-08-02  2081  			printk(KERN_DEBUG "%s=
: buffer empty, so we have "
8dd2f36f317569 Andreas Eversberg 2008-08-02  2082  			       "underrun\n", =
__func__);
8dd2f36f317569 Andreas Eversberg 2008-08-02  2083  		/* fill buffer, to pre=
vent future underrun */
8dd2f36f317569 Andreas Eversberg 2008-08-02  2084  		hc->write_fifo(hc, hc-=
>silence_data, poll >> 1);
8dd2f36f317569 Andreas Eversberg 2008-08-02  2085  		Zspace -=3D (poll >> 1=
);
8dd2f36f317569 Andreas Eversberg 2008-08-02  2086  	}
8dd2f36f317569 Andreas Eversberg 2008-08-02  2087  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  2088  	/* if audio data and co=
nnected slot */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2089  	if (bch && (!test_bit(F=
LG_HDLC, &bch->Flags)) && (!*txpending)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2090  	    && slot_tx >=3D 0) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  2091  		if (debug & DEBUG_HFCM=
ULTI_MODE)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2092  			printk(KERN_DEBUG "%s=
: disconnecting PCM due to "
af69fb3a8ffa37 Karsten Keil      2008-07-27  2093  			       "FIFO data: ch=
annel %d slot_tx %d\n",
af69fb3a8ffa37 Karsten Keil      2008-07-27  2094  			       __func__, ch, =
slot_tx);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2095  		/* disconnect slot */
db9bb63a1b5b65 Karsten Keil      2009-05-22  2096  		if (hc->ctype =3D=3D H=
FC_TYPE_XHFC)
db9bb63a1b5b65 Karsten Keil      2009-05-22  2097  			HFC_outb(hc, A_CON_HD=
LC, 0x80
db9bb63a1b5b65 Karsten Keil      2009-05-22  2098  				 | 0x07 << 2 | V_HDL=
C_TRP | V_IFF);
db9bb63a1b5b65 Karsten Keil      2009-05-22  2099  		/* Enable FIFO, no int=
errupt */
db9bb63a1b5b65 Karsten Keil      2009-05-22  2100  		else
db9bb63a1b5b65 Karsten Keil      2009-05-22  2101  			HFC_outb(hc, A_CON_HD=
LC, 0x80 | 0x00 |
db9bb63a1b5b65 Karsten Keil      2009-05-22  2102  				 V_HDLC_TRP | V_IFF);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2103  		HFC_outb_nodebug(hc, R=
_FIFO, ch << 1 | 1);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2104  		HFC_wait_nodebug(hc);
db9bb63a1b5b65 Karsten Keil      2009-05-22  2105  		if (hc->ctype =3D=3D H=
FC_TYPE_XHFC)
db9bb63a1b5b65 Karsten Keil      2009-05-22  2106  			HFC_outb(hc, A_CON_HD=
LC, 0x80
db9bb63a1b5b65 Karsten Keil      2009-05-22  2107  				 | 0x07 << 2 | V_HDL=
C_TRP | V_IFF);
db9bb63a1b5b65 Karsten Keil      2009-05-22  2108  		/* Enable FIFO, no int=
errupt */
db9bb63a1b5b65 Karsten Keil      2009-05-22  2109  		else
db9bb63a1b5b65 Karsten Keil      2009-05-22  2110  			HFC_outb(hc, A_CON_HD=
LC, 0x80 | 0x00 |
db9bb63a1b5b65 Karsten Keil      2009-05-22  2111  				 V_HDLC_TRP | V_IFF);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2112  		HFC_outb_nodebug(hc, R=
_FIFO, ch << 1);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2113  		HFC_wait_nodebug(hc);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2114  	}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2115  	*txpending =3D 1;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2116  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  2117  	/* show activity */
864fd636b196e7 Andreas Eversberg 2012-04-24  2118  	if (dch)
864fd636b196e7 Andreas Eversberg 2012-04-24  2119  		hc->activity_tx |=3D 1=
 << hc->chan[ch].port;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2120  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  2121  	/* fill fifo to what we=
 have left */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2122  	ii =3D len;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2123  	if (dch || test_bit(FLG=
_HDLC, &bch->Flags))
af69fb3a8ffa37 Karsten Keil      2008-07-27  2124  		temp =3D 1;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2125  	else
af69fb3a8ffa37 Karsten Keil      2008-07-27  2126  		temp =3D 0;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2127  	i =3D *idxp;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2128  	d =3D (*sp)->data + i;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2129  	if (ii - i > Zspace)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2130  		ii =3D Zspace + i;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2131  	if (debug & DEBUG_HFCMU=
LTI_FIFO)
af69fb3a8ffa37 Karsten Keil      2008-07-27  2132  		printk(KERN_DEBUG "%s(=
card %d): fifo(%d) has %d bytes space "
af69fb3a8ffa37 Karsten Keil      2008-07-27  2133  		       "left (z1=3D%04=
x, z2=3D%04x) sending %d of %d bytes %s\n",
af69fb3a8ffa37 Karsten Keil      2008-07-27  2134  		       __func__, hc->i=
d + 1, ch, Zspace, z1, z2, ii-i, len-i,
af69fb3a8ffa37 Karsten Keil      2008-07-27  2135  		       temp ? "HDLC" :=
 "TRANS");
af69fb3a8ffa37 Karsten Keil      2008-07-27  2136  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  2137  	/* Have to prep the aud=
io data */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2138  	hc->write_fifo(hc, d, i=
i - i);
7cfa153dd709f1 Andreas Eversberg 2009-05-22  2139  	hc->chan[ch].Zfill +=3D=
 ii - i;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2140  	*idxp =3D ii;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2141  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  2142  	/* if not all data has =
been written */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2143  	if (ii !=3D len) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  2144  		/* NOTE: fifo is start=
ed by the calling function */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2145  		return;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2146  	}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2147  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  2148  	/* if all data has been=
 written, terminate frame */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2149  	if (dch || test_bit(FLG=
_HDLC, &bch->Flags)) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  2150  		/* increment f-counter=
 */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2151  		HFC_outb_nodebug(hc, R=
_INC_RES_FIFO, V_INC_F);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2152  		HFC_wait_nodebug(hc);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2153  	}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2154  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  2155  	dev_kfree_skb(*sp);
8bfddfbe210086 Karsten Keil      2012-05-15  2156  	/* check for next frame=
 */
8bfddfbe210086 Karsten Keil      2012-05-15  2157  	if (bch && get_next_bfr=
ame(bch)) {
af69fb3a8ffa37 Karsten Keil      2008-07-27 @2158  		len =3D (*sp)->len;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2159  		goto next_frame;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2160  	}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2161  	if (dch && get_next_dfr=
ame(dch)) {
af69fb3a8ffa37 Karsten Keil      2008-07-27  2162  		len =3D (*sp)->len;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2163  		goto next_frame;
af69fb3a8ffa37 Karsten Keil      2008-07-27  2164  	}
af69fb3a8ffa37 Karsten Keil      2008-07-27  2165  =

af69fb3a8ffa37 Karsten Keil      2008-07-27  2166  	/*
af69fb3a8ffa37 Karsten Keil      2008-07-27  2167  	 * now we have no more =
data, so in case of transparent,
af69fb3a8ffa37 Karsten Keil      2008-07-27  2168  	 * we set the last byte=
 in fifo to 'silence' in case we will get
af69fb3a8ffa37 Karsten Keil      2008-07-27  2169  	 * no more data at all.=
 this prevents sending an undefined value.
af69fb3a8ffa37 Karsten Keil      2008-07-27  2170  	 */
af69fb3a8ffa37 Karsten Keil      2008-07-27  2171  	if (bch && test_bit(FLG=
_TRANSPARENT, &bch->Flags))
8dd2f36f317569 Andreas Eversberg 2008-08-02  2172  		HFC_outb_nodebug(hc, A=
_FIFO_DATA0_NOINC, hc->silence);
af69fb3a8ffa37 Karsten Keil      2008-07-27  2173  }
af69fb3a8ffa37 Karsten Keil      2008-07-27  2174  =


:::::: The code at line 2158 was first introduced by commit
:::::: af69fb3a8ffa37e986db00ed93099dc44babeef4 Add mISDN HFC multiport dri=
ver

:::::: TO: Karsten Keil <kkeil@suse.de>
:::::: CC: Karsten Keil <kkeil@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8990204741112883494==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8990204741112883494==--

