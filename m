Content-Type: multipart/mixed; boundary="===============6732834807105987414=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/isdn/hardware/mISDN/hfcmulti.c:2158 hfcmulti_tx() error: dereferencing freed memory
Date: Sun, 24 Jan 2021 22:26:07 +0800
Message-ID: <202101242248.537ZEK5l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6732834807105987414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1ae4b0be15891faf46d390e9f3dc9bd71a8cae1
commit: be769db2f95861cc8c7c8fedcc71a8c39b803b10 net: Get rid of consume_sk=
b when tracing is off
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: parisc-randconfig-m031-20210124 (attached as .config)
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
drivers/isdn/hardware/mISDN/hfcmulti.c:4409 setup_pci() warn: argument 2 to=
 %#lx specifier is cast from pointer
drivers/isdn/hardware/mISDN/hfcmulti.c:4430 setup_pci() warn: argument 3 to=
 %#lx specifier is cast from pointer
drivers/isdn/hardware/mISDN/hfcmulti.c:4460 setup_pci() warn: argument 3 to=
 %#lx specifier is cast from pointer

vim +2158 drivers/isdn/hardware/mISDN/hfcmulti.c

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1925  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1926  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1927  /*
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1928   * fill fifo as much a=
s possible
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1929   */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1930  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1931  static void
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1932  hfcmulti_tx(struct hfc=
_multi *hc, int ch)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1933  {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1934  	int i, ii, temp, len =
=3D 0;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1935  	int Zspace, z1, z2; /=
* must be int for calculation */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1936  	int Fspace, f1, f2;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1937  	u_char *d;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1938  	int *txpending, slot_=
tx;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1939  	struct	bchannel *bch;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1940  	struct  dchannel *dch;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1941  	struct  sk_buff **sp =
=3D NULL;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1942  	int *idxp;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1943  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1944  	bch =3D hc->chan[ch].=
bch;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1945  	dch =3D hc->chan[ch].=
dch;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1946  	if ((!dch) && (!bch))
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1947  		return;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1948  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1949  	txpending =3D &hc->ch=
an[ch].txpending;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1950  	slot_tx =3D hc->chan[=
ch].slot_tx;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1951  	if (dch) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1952  		if (!test_bit(FLG_AC=
TIVE, &dch->Flags))
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1953  			return;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1954  		sp =3D &dch->tx_skb;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1955  		idxp =3D &dch->tx_id=
x;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1956  	} else {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1957  		if (!test_bit(FLG_AC=
TIVE, &bch->Flags))
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1958  			return;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1959  		sp =3D &bch->tx_skb;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1960  		idxp =3D &bch->tx_id=
x;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1961  	}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1962  	if (*sp)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1963  		len =3D (*sp)->len;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1964  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1965  	if ((!len) && *txpend=
ing !=3D 1)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1966  		return; /* no data */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1967  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1968  	if (test_bit(HFC_CHIP=
_B410P, &hc->chip) &&
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1969  	    (hc->chan[ch].pro=
tocol =3D=3D ISDN_P_B_RAW) &&
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1970  	    (hc->chan[ch].slo=
t_rx < 0) &&
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1971  	    (hc->chan[ch].slo=
t_tx < 0))
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1972  		HFC_outb_nodebug(hc,=
 R_FIFO, 0x20 | (ch << 1));
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1973  	else
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1974  		HFC_outb_nodebug(hc,=
 R_FIFO, ch << 1);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1975  	HFC_wait_nodebug(hc);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1976  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1977  	if (*txpending =3D=3D=
 2) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1978  		/* reset fifo */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1979  		HFC_outb_nodebug(hc,=
 R_INC_RES_FIFO, V_RES_F);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1980  		HFC_wait_nodebug(hc);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1981  		HFC_outb(hc, A_SUBCH=
_CFG, 0);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1982  		*txpending =3D 1;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1983  	}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1984  next_frame:
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1985  	if (dch || test_bit(F=
LG_HDLC, &bch->Flags)) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1986  		f1 =3D HFC_inb_nodeb=
ug(hc, A_F1);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1987  		f2 =3D HFC_inb_nodeb=
ug(hc, A_F2);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1988  		while (f2 !=3D (temp=
 =3D HFC_inb_nodebug(hc, A_F2))) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1989  			if (debug & DEBUG_H=
FCMULTI_FIFO)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1990  				printk(KERN_DEBUG
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1991  				       "%s(card %d=
): reread f2 because %d!=3D%d\n",
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1992  				       __func__, h=
c->id + 1, temp, f2);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1993  			f2 =3D temp; /* rep=
eat until F2 is equal */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1994  		}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1995  		Fspace =3D f2 - f1 -=
 1;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1996  		if (Fspace < 0)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1997  			Fspace +=3D hc->Fle=
n;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1998  		/*
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  1999  		 * Old FIFO handling=
 doesn't give us the current Z2 read
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2000  		 * pointer, so we ca=
nnot send the next frame before the fifo
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2001  		 * is empty. It make=
s no difference except for a slightly
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2002  		 * lower performance.
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2003  		 */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2004  		if (test_bit(HFC_CHI=
P_REVISION0, &hc->chip)) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2005  			if (f1 !=3D f2)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2006  				Fspace =3D 0;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2007  			else
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2008  				Fspace =3D 1;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2009  		}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2010  		/* one frame only fo=
r ST D-channels, to allow resending */
db9bb63a1b5b65df Karsten Keil      2009-05-22  2011  		if (hc->ctype !=3D H=
FC_TYPE_E1 && dch) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2012  			if (f1 !=3D f2)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2013  				Fspace =3D 0;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2014  		}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2015  		/* F-counter full co=
ndition */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2016  		if (Fspace =3D=3D 0)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2017  			return;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2018  	}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2019  	z1 =3D HFC_inw_nodebu=
g(hc, A_Z1) - hc->Zmin;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2020  	z2 =3D HFC_inw_nodebu=
g(hc, A_Z2) - hc->Zmin;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2021  	while (z2 !=3D (temp =
=3D (HFC_inw_nodebug(hc, A_Z2) - hc->Zmin))) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2022  		if (debug & DEBUG_HF=
CMULTI_FIFO)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2023  			printk(KERN_DEBUG "=
%s(card %d): reread z2 because "
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2024  			       "%d!=3D%d\n"=
, __func__, hc->id + 1, temp, z2);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2025  		z2 =3D temp; /* repe=
at unti Z2 is equal */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2026  	}
7cfa153dd709f151 Andreas Eversberg 2009-05-22  2027  	hc->chan[ch].Zfill =
=3D z1 - z2;
7cfa153dd709f151 Andreas Eversberg 2009-05-22  2028  	if (hc->chan[ch].Zfil=
l < 0)
7cfa153dd709f151 Andreas Eversberg 2009-05-22  2029  		hc->chan[ch].Zfill +=
=3D hc->Zlen;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2030  	Zspace =3D z2 - z1;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2031  	if (Zspace <=3D 0)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2032  		Zspace +=3D hc->Zlen;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2033  	Zspace -=3D 4; /* kee=
p not too full, so pointers will not overrun */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2034  	/* fill transparent d=
ata only to maxinum transparent load (minus 4) */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2035  	if (bch && test_bit(F=
LG_TRANSPARENT, &bch->Flags))
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2036  		Zspace =3D Zspace - =
hc->Zlen + hc->max_trans;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2037  	if (Zspace <=3D 0) /*=
 no space of 4 bytes */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2038  		return;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2039  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2040  	/* if no data */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2041  	if (!len) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2042  		if (z1 =3D=3D z2) { =
/* empty */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2043  			/* if done with FIF=
O audio data during PCM connection */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2044  			if (bch && (!test_b=
it(FLG_HDLC, &bch->Flags)) &&
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2045  			    *txpending && s=
lot_tx >=3D 0) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2046  				if (debug & DEBUG_=
HFCMULTI_MODE)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2047  					printk(KERN_DEBUG
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2048  					       "%s: recon=
necting PCM due to no "
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2049  					       "more FIFO=
 data: channel %d "
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2050  					       "slot_tx %=
d\n",
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2051  					       __func__, =
ch, slot_tx);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2052  				/* connect slot */
db9bb63a1b5b65df Karsten Keil      2009-05-22  2053  				if (hc->ctype =3D=
=3D HFC_TYPE_XHFC)
db9bb63a1b5b65df Karsten Keil      2009-05-22  2054  					HFC_outb(hc, A_CO=
N_HDLC, 0xc0
db9bb63a1b5b65df Karsten Keil      2009-05-22  2055  						 | 0x07 << 2 | V=
_HDLC_TRP | V_IFF);
db9bb63a1b5b65df Karsten Keil      2009-05-22  2056  				/* Enable FIFO, no=
 interrupt */
db9bb63a1b5b65df Karsten Keil      2009-05-22  2057  				else
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2058  					HFC_outb(hc, A_CO=
N_HDLC, 0xc0 | 0x00 |
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2059  						 V_HDLC_TRP | V_=
IFF);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2060  				HFC_outb_nodebug(h=
c, R_FIFO, ch << 1 | 1);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2061  				HFC_wait_nodebug(h=
c);
db9bb63a1b5b65df Karsten Keil      2009-05-22  2062  				if (hc->ctype =3D=
=3D HFC_TYPE_XHFC)
db9bb63a1b5b65df Karsten Keil      2009-05-22  2063  					HFC_outb(hc, A_CO=
N_HDLC, 0xc0
db9bb63a1b5b65df Karsten Keil      2009-05-22  2064  						 | 0x07 << 2 | V=
_HDLC_TRP | V_IFF);
db9bb63a1b5b65df Karsten Keil      2009-05-22  2065  				/* Enable FIFO, no=
 interrupt */
db9bb63a1b5b65df Karsten Keil      2009-05-22  2066  				else
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2067  					HFC_outb(hc, A_CO=
N_HDLC, 0xc0 | 0x00 |
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2068  						 V_HDLC_TRP | V_=
IFF);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2069  				HFC_outb_nodebug(h=
c, R_FIFO, ch << 1);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2070  				HFC_wait_nodebug(h=
c);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2071  			}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2072  			*txpending =3D 0;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2073  		}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2074  		return; /* no data */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2075  	}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2076  =

8dd2f36f31756966 Andreas Eversberg 2008-08-02  2077  	/* "fill fifo if empt=
y" feature */
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2078  	if (bch && test_bit(F=
LG_FILLEMPTY, &bch->Flags)
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2079  	    && !test_bit(FLG_=
HDLC, &bch->Flags) && z2 =3D=3D z1) {
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2080  		if (debug & DEBUG_HF=
CMULTI_FILL)
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2081  			printk(KERN_DEBUG "=
%s: buffer empty, so we have "
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2082  			       "underrun\n"=
, __func__);
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2083  		/* fill buffer, to p=
revent future underrun */
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2084  		hc->write_fifo(hc, h=
c->silence_data, poll >> 1);
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2085  		Zspace -=3D (poll >>=
 1);
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2086  	}
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2087  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2088  	/* if audio data and =
connected slot */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2089  	if (bch && (!test_bit=
(FLG_HDLC, &bch->Flags)) && (!*txpending)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2090  	    && slot_tx >=3D 0=
) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2091  		if (debug & DEBUG_HF=
CMULTI_MODE)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2092  			printk(KERN_DEBUG "=
%s: disconnecting PCM due to "
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2093  			       "FIFO data: =
channel %d slot_tx %d\n",
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2094  			       __func__, ch=
, slot_tx);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2095  		/* disconnect slot */
db9bb63a1b5b65df Karsten Keil      2009-05-22  2096  		if (hc->ctype =3D=3D=
 HFC_TYPE_XHFC)
db9bb63a1b5b65df Karsten Keil      2009-05-22  2097  			HFC_outb(hc, A_CON_=
HDLC, 0x80
db9bb63a1b5b65df Karsten Keil      2009-05-22  2098  				 | 0x07 << 2 | V_H=
DLC_TRP | V_IFF);
db9bb63a1b5b65df Karsten Keil      2009-05-22  2099  		/* Enable FIFO, no i=
nterrupt */
db9bb63a1b5b65df Karsten Keil      2009-05-22  2100  		else
db9bb63a1b5b65df Karsten Keil      2009-05-22  2101  			HFC_outb(hc, A_CON_=
HDLC, 0x80 | 0x00 |
db9bb63a1b5b65df Karsten Keil      2009-05-22  2102  				 V_HDLC_TRP | V_IF=
F);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2103  		HFC_outb_nodebug(hc,=
 R_FIFO, ch << 1 | 1);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2104  		HFC_wait_nodebug(hc);
db9bb63a1b5b65df Karsten Keil      2009-05-22  2105  		if (hc->ctype =3D=3D=
 HFC_TYPE_XHFC)
db9bb63a1b5b65df Karsten Keil      2009-05-22  2106  			HFC_outb(hc, A_CON_=
HDLC, 0x80
db9bb63a1b5b65df Karsten Keil      2009-05-22  2107  				 | 0x07 << 2 | V_H=
DLC_TRP | V_IFF);
db9bb63a1b5b65df Karsten Keil      2009-05-22  2108  		/* Enable FIFO, no i=
nterrupt */
db9bb63a1b5b65df Karsten Keil      2009-05-22  2109  		else
db9bb63a1b5b65df Karsten Keil      2009-05-22  2110  			HFC_outb(hc, A_CON_=
HDLC, 0x80 | 0x00 |
db9bb63a1b5b65df Karsten Keil      2009-05-22  2111  				 V_HDLC_TRP | V_IF=
F);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2112  		HFC_outb_nodebug(hc,=
 R_FIFO, ch << 1);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2113  		HFC_wait_nodebug(hc);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2114  	}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2115  	*txpending =3D 1;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2116  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2117  	/* show activity */
864fd636b196e750 Andreas Eversberg 2012-04-24  2118  	if (dch)
864fd636b196e750 Andreas Eversberg 2012-04-24  2119  		hc->activity_tx |=3D=
 1 << hc->chan[ch].port;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2120  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2121  	/* fill fifo to what =
we have left */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2122  	ii =3D len;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2123  	if (dch || test_bit(F=
LG_HDLC, &bch->Flags))
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2124  		temp =3D 1;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2125  	else
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2126  		temp =3D 0;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2127  	i =3D *idxp;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2128  	d =3D (*sp)->data + i;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2129  	if (ii - i > Zspace)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2130  		ii =3D Zspace + i;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2131  	if (debug & DEBUG_HFC=
MULTI_FIFO)
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2132  		printk(KERN_DEBUG "%=
s(card %d): fifo(%d) has %d bytes space "
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2133  		       "left (z1=3D%=
04x, z2=3D%04x) sending %d of %d bytes %s\n",
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2134  		       __func__, hc-=
>id + 1, ch, Zspace, z1, z2, ii-i, len-i,
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2135  		       temp ? "HDLC"=
 : "TRANS");
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2136  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2137  	/* Have to prep the a=
udio data */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2138  	hc->write_fifo(hc, d,=
 ii - i);
7cfa153dd709f151 Andreas Eversberg 2009-05-22  2139  	hc->chan[ch].Zfill +=
=3D ii - i;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2140  	*idxp =3D ii;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2141  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2142  	/* if not all data ha=
s been written */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2143  	if (ii !=3D len) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2144  		/* NOTE: fifo is sta=
rted by the calling function */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2145  		return;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2146  	}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2147  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2148  	/* if all data has be=
en written, terminate frame */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2149  	if (dch || test_bit(F=
LG_HDLC, &bch->Flags)) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2150  		/* increment f-count=
er */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2151  		HFC_outb_nodebug(hc,=
 R_INC_RES_FIFO, V_INC_F);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2152  		HFC_wait_nodebug(hc);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2153  	}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2154  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2155  	dev_kfree_skb(*sp);
8bfddfbe2100862f Karsten Keil      2012-05-15  2156  	/* check for next fra=
me */
8bfddfbe2100862f Karsten Keil      2012-05-15  2157  	if (bch && get_next_b=
frame(bch)) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27 @2158  		len =3D (*sp)->len;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2159  		goto next_frame;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2160  	}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2161  	if (dch && get_next_d=
frame(dch)) {
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2162  		len =3D (*sp)->len;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2163  		goto next_frame;
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2164  	}
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2165  =

af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2166  	/*
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2167  	 * now we have no mor=
e data, so in case of transparent,
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2168  	 * we set the last by=
te in fifo to 'silence' in case we will get
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2169  	 * no more data at al=
l. this prevents sending an undefined value.
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2170  	 */
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2171  	if (bch && test_bit(F=
LG_TRANSPARENT, &bch->Flags))
8dd2f36f31756966 Andreas Eversberg 2008-08-02  2172  		HFC_outb_nodebug(hc,=
 A_FIFO_DATA0_NOINC, hc->silence);
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2173  }
af69fb3a8ffa37e9 Karsten Keil      2008-07-27  2174  =


:::::: The code at line 2158 was first introduced by commit
:::::: af69fb3a8ffa37e986db00ed93099dc44babeef4 Add mISDN HFC multiport dri=
ver

:::::: TO: Karsten Keil <kkeil@suse.de>
:::::: CC: Karsten Keil <kkeil@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6732834807105987414==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6732834807105987414==--

