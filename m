Content-Type: multipart/mixed; boundary="===============6348798920791834477=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/atm/eni.c:2158:11: warning: %ld in format string (no. 4) requires 'long' but the argument type is 'unsigned long'.
Date: Sat, 20 Feb 2021 06:15:33 +0800
Message-ID: <202102200657.3HdWHzrr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6348798920791834477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi Christophe,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f40ddce88593482919761f74910f42f4b84c004b
commit: 03fd42d458fb9cb69e712600bd69ff77ff3a45a8 powerpc/fixmap: Fix FIX_EA=
RLY_DEBUG_BASE when page size is 256k
date:   8 months ago
:::::: branch date: 5 days ago
:::::: commit date: 8 months ago
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +2158 drivers/atm/eni.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  2092  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2093  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2094  static int eni_proc_read(st=
ruct atm_dev *dev,loff_t *pos,char *page)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2095  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2096  	struct sock *s;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2097  	static const char *signal[=
] =3D { "LOST","unknown","okay" };
^1da177e4c3f41 Linus Torvalds 2005-04-16  2098  	struct eni_dev *eni_dev =
=3D ENI_DEV(dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2099  	struct atm_vcc *vcc;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2100  	int left,i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2101  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2102  	left =3D *pos;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2103  	if (!left)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2104  		return sprintf(page,DEV_L=
ABEL "(itf %d) signal %s, %dkB, "
^1da177e4c3f41 Linus Torvalds 2005-04-16  2105  		    "%d cps remaining\n",=
dev->number,signal[(int) dev->signal],
^1da177e4c3f41 Linus Torvalds 2005-04-16  2106  		    eni_dev->mem >> 10,en=
i_dev->tx_bw);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2107  	if (!--left)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2108  		return sprintf(page,"%4sB=
ursts: TX"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2109  #if !defined(CONFIG_ATM_ENI=
_BURST_TX_16W) && \
^1da177e4c3f41 Linus Torvalds 2005-04-16  2110      !defined(CONFIG_ATM_ENI=
_BURST_TX_8W) && \
^1da177e4c3f41 Linus Torvalds 2005-04-16  2111      !defined(CONFIG_ATM_ENI=
_BURST_TX_4W) && \
^1da177e4c3f41 Linus Torvalds 2005-04-16  2112      !defined(CONFIG_ATM_ENI=
_BURST_TX_2W)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2113  		    " none"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2114  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2115  #ifdef CONFIG_ATM_ENI_BURST=
_TX_16W
^1da177e4c3f41 Linus Torvalds 2005-04-16  2116  		    " 16W"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2117  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2118  #ifdef CONFIG_ATM_ENI_BURST=
_TX_8W
^1da177e4c3f41 Linus Torvalds 2005-04-16  2119  		    " 8W"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2120  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2121  #ifdef CONFIG_ATM_ENI_BURST=
_TX_4W
^1da177e4c3f41 Linus Torvalds 2005-04-16  2122  		    " 4W"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2123  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2124  #ifdef CONFIG_ATM_ENI_BURST=
_TX_2W
^1da177e4c3f41 Linus Torvalds 2005-04-16  2125  		    " 2W"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2126  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2127  		    ", RX"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2128  #if !defined(CONFIG_ATM_ENI=
_BURST_RX_16W) && \
^1da177e4c3f41 Linus Torvalds 2005-04-16  2129      !defined(CONFIG_ATM_ENI=
_BURST_RX_8W) && \
^1da177e4c3f41 Linus Torvalds 2005-04-16  2130      !defined(CONFIG_ATM_ENI=
_BURST_RX_4W) && \
^1da177e4c3f41 Linus Torvalds 2005-04-16  2131      !defined(CONFIG_ATM_ENI=
_BURST_RX_2W)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2132  		    " none"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2133  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2134  #ifdef CONFIG_ATM_ENI_BURST=
_RX_16W
^1da177e4c3f41 Linus Torvalds 2005-04-16  2135  		    " 16W"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2136  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2137  #ifdef CONFIG_ATM_ENI_BURST=
_RX_8W
^1da177e4c3f41 Linus Torvalds 2005-04-16  2138  		    " 8W"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2139  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2140  #ifdef CONFIG_ATM_ENI_BURST=
_RX_4W
^1da177e4c3f41 Linus Torvalds 2005-04-16  2141  		    " 4W"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2142  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2143  #ifdef CONFIG_ATM_ENI_BURST=
_RX_2W
^1da177e4c3f41 Linus Torvalds 2005-04-16  2144  		    " 2W"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2145  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2146  #ifndef CONFIG_ATM_ENI_TUNE=
_BURST
^1da177e4c3f41 Linus Torvalds 2005-04-16  2147  		    " (default)"
^1da177e4c3f41 Linus Torvalds 2005-04-16  2148  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  2149  		    "\n","");
^1da177e4c3f41 Linus Torvalds 2005-04-16  2150  	if (!--left) =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2151  		return sprintf(page,"%4sB=
uffer multipliers: tx %d%%, rx %d%%\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2152  		    "",eni_dev->tx_mult,e=
ni_dev->rx_mult);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2153  	for (i =3D 0; i < NR_CHAN;=
 i++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2154  		struct eni_tx *tx =3D eni=
_dev->tx+i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2155  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2156  		if (!tx->send) continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2157  		if (!--left) {
597aec3f93616c Hans Wennborg  2014-08-03 @2158  			return sprintf(page, "tx=
[%d]:    0x%lx-0x%lx "
^1da177e4c3f41 Linus Torvalds 2005-04-16  2159  			    "(%6ld bytes), rsv %=
d cps, shp %d cps%s\n",i,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2160  			    (unsigned long) (tx-=
>send - eni_dev->ram),
^1da177e4c3f41 Linus Torvalds 2005-04-16  2161  			    tx->send-eni_dev->ra=
m+tx->words*4-1,tx->words*4,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2162  			    tx->reserved,tx->sha=
ping,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2163  			    tx =3D=3D eni_dev->u=
br ? " (UBR)" : "");
^1da177e4c3f41 Linus Torvalds 2005-04-16  2164  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2165  		if (--left) continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2166  		return sprintf(page,"%10s=
backlog %u packets\n","",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2167  		    skb_queue_len(&tx->ba=
cklog));
^1da177e4c3f41 Linus Torvalds 2005-04-16  2168  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2169  	read_lock(&vcc_sklist_lock=
);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2170  	for(i =3D 0; i < VCC_HTABL=
E_SIZE; ++i) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2171  		struct hlist_head *head =
=3D &vcc_hash[i];
^1da177e4c3f41 Linus Torvalds 2005-04-16  2172  =

b67bfe0d42cac5 Sasha Levin    2013-02-27  2173  		sk_for_each(s, head) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2174  			struct eni_vcc *eni_vcc;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2175  			int length;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2176  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2177  			vcc =3D atm_sk(s);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2178  			if (vcc->dev !=3D dev)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2179  				continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2180  			eni_vcc =3D ENI_VCC(vcc);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2181  			if (--left) continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2182  			length =3D sprintf(page,=
"vcc %4d: ",vcc->vci);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2183  			if (eni_vcc->rx) {
597aec3f93616c Hans Wennborg  2014-08-03  2184  				length +=3D sprintf(pag=
e+length, "0x%lx-0x%lx "
^1da177e4c3f41 Linus Torvalds 2005-04-16  2185  				    "(%6ld bytes)",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2186  				    (unsigned long) (en=
i_vcc->recv - eni_dev->ram),
^1da177e4c3f41 Linus Torvalds 2005-04-16  2187  				    eni_vcc->recv-eni_d=
ev->ram+eni_vcc->words*4-1,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2188  				    eni_vcc->words*4);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2189  				if (eni_vcc->tx) length=
 +=3D sprintf(page+length,", ");
^1da177e4c3f41 Linus Torvalds 2005-04-16  2190  			}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2191  			if (eni_vcc->tx)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2192  				length +=3D sprintf(pag=
e+length,"tx[%d], txing %d bytes",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2193  				    eni_vcc->tx->index,=
eni_vcc->txing);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2194  			page[length] =3D '\n';
^1da177e4c3f41 Linus Torvalds 2005-04-16  2195  			read_unlock(&vcc_sklist_=
lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2196  			return length+1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2197  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2198  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2199  	read_unlock(&vcc_sklist_lo=
ck);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2200  	for (i =3D 0; i < eni_dev-=
>free_len; i++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2201  		struct eni_free *fe =3D e=
ni_dev->free_list+i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2202  		unsigned long offset;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2203  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2204  		if (--left) continue;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2205  		offset =3D (unsigned long=
) eni_dev->ram+eni_dev->base_diff;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2206  		return sprintf(page,"free=
      %p-%p (%6d bytes)\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  2207  		    fe->start-offset,fe->=
start-offset+(1 << fe->order)-1,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2208  		    1 << fe->order);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2209  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2210  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2211  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2212  =


:::::: The code at line 2158 was first introduced by commit
:::::: 597aec3f93616c6aa73c3fb1d008f66f2ede9f4c drivers: atm: fix %d confus=
ingly prefixed with 0x in format strings

:::::: TO: Hans Wennborg <hans@hanshq.net>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6348798920791834477==--

