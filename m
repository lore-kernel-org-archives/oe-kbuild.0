Content-Type: multipart/mixed; boundary="===============9131707176381890924=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v7 8/8] net/fungible: Kconfig, Makefiles, and MAINTAINERS
Date: Thu, 24 Feb 2022 14:27:23 +0800
Message-ID: <202202241451.bvxyFUlX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9131707176381890924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220218234536.9810-9-dmichail@fungible.com>
References: <20220218234536.9810-9-dmichail@fungible.com>
TO: Dimitris Michailidis <d.michailidis@fungible.com>
TO: davem(a)davemloft.net
TO: kuba(a)kernel.org
TO: netdev(a)vger.kernel.org
TO: andrew(a)lunn.ch
TO: d.michailidis(a)fungible.com

Hi Dimitris,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Dimitris-Michailidis/new-F=
ungible-Ethernet-driver/20220220-185154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
129c77b5692d4a95a00aa7d58075afe77179623e
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-p002-20220223 (https://download.01.org/0day-ci/arch=
ive/20220224/202202241451.bvxyFUlX-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/165b382a06823cbcbe98671f6=
442cb3286c6924b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dimitris-Michailidis/new-Fungible-=
Ethernet-driver/20220220-185154
        git checkout 165b382a06823cbcbe98671f6442cb3286c6924b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 O=3Dbuild_dir ARCH=3Ds390 SHELL=3D/bin/bash drivers/net/ethernet/fungible/=
funeth/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/fungible/funeth/funeth_tx.c: In function 'write_pkt=
_desc':
>> drivers/net/ethernet/fungible/funeth/funeth_tx.c:252:27: error: implicit=
 declaration of function 'tls_driver_ctx' [-Werror=3Dimplicit-function-decl=
aration]
     252 |                 tls_ctx =3D tls_driver_ctx(skb->sk, TLS_OFFLOAD_=
CTX_DIR_TX);
         |                           ^~~~~~~~~~~~~~
>> drivers/net/ethernet/fungible/funeth/funeth_tx.c:252:51: error: 'TLS_OFF=
LOAD_CTX_DIR_TX' undeclared (first use in this function)
     252 |                 tls_ctx =3D tls_driver_ctx(skb->sk, TLS_OFFLOAD_=
CTX_DIR_TX);
         |                                                   ^~~~~~~~~~~~~~=
~~~~~~~~
   drivers/net/ethernet/fungible/funeth/funeth_tx.c:252:51: note: each unde=
clared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/fungible/funeth/funeth_tx.c:253:37: error: invalid =
use of undefined type 'struct fun_ktls_tx_ctx'
     253 |                 tls->tlsid =3D tls_ctx->tlsid;
         |                                     ^~
   drivers/net/ethernet/fungible/funeth/funeth_tx.c:254:24: error: invalid =
use of undefined type 'struct fun_ktls_tx_ctx'
     254 |                 tls_ctx->next_seq +=3D tls_len;
         |                        ^~
   drivers/net/ethernet/fungible/funeth/funeth_tx.c: In function 'fun_start=
_xmit':
>> drivers/net/ethernet/fungible/funeth/funeth_tx.c:318:13: error: implicit=
 declaration of function 'tls_is_sk_tx_device_offloaded' [-Werror=3Dimplici=
t-function-declaration]
     318 |             tls_is_sk_tx_device_offloaded(skb->sk)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/fungible/funeth/funeth_tx.c:319:23: error: implicit=
 declaration of function 'fun_tls_tx'; did you mean 'fun_xdp_tx'? [-Werror=
=3Dimplicit-function-declaration]
     319 |                 skb =3D fun_tls_tx(skb, q, &tls_len);
         |                       ^~~~~~~~~~
         |                       fun_xdp_tx
>> drivers/net/ethernet/fungible/funeth/funeth_tx.c:319:21: warning: assign=
ment to 'struct sk_buff *' from 'int' makes pointer from integer without a =
cast [-Wint-conversion]
     319 |                 skb =3D fun_tls_tx(skb, q, &tls_len);
         |                     ^
   cc1: some warnings being treated as errors


vim +/tls_driver_ctx +252 drivers/net/ethernet/fungible/funeth/funeth_tx.c

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  116  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  117  /* Write as many descr=
iptors as needed for the supplied skb starting at the
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  118   * current producer lo=
cation. The caller has made certain enough descriptors
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  119   * are available.
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  120   *
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  121   * Returns the number =
of descriptors written, 0 on error.
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  122   */
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  123  static unsigned int wr=
ite_pkt_desc(struct sk_buff *skb, struct funeth_txq *q,
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  124  				   unsigned int tl=
s_len)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  125  {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  126  	unsigned int extra_by=
tes =3D 0, extra_pkts =3D 0;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  127  	unsigned int idx =3D =
q->prod_cnt & q->mask;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  128  	const struct skb_shar=
ed_info *shinfo;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  129  	unsigned int lens[MAX=
_SKB_FRAGS + 1];
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  130  	dma_addr_t addrs[MAX_=
SKB_FRAGS + 1];
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  131  	struct fun_eth_tx_req=
 *req;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  132  	struct fun_dataop_gl =
*gle;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  133  	const struct tcphdr *=
th;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  134  	unsigned int ngle, i;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  135  	u16 flags;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  136  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  137  	if (unlikely(skb->len=
 < FUN_TX_MIN_LEN)) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  138  		FUN_QSTAT_INC(q, tx_=
len_err);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  139  		return 0;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  140  	}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  141  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  142  	if (unlikely(map_skb(=
skb, q->dma_dev, addrs, lens))) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  143  		FUN_QSTAT_INC(q, tx_=
map_err);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  144  		return 0;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  145  	}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  146  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  147  	req =3D fun_tx_desc_a=
ddr(q, idx);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  148  	req->op =3D FUN_ETH_O=
P_TX;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  149  	req->len8 =3D 0;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  150  	req->flags =3D 0;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  151  	req->suboff8 =3D offs=
etof(struct fun_eth_tx_req, dataop);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  152  	req->repr_idn =3D 0;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  153  	req->encap_proto =3D =
0;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  154  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  155  	shinfo =3D skb_shinfo=
(skb);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  156  	if (likely(shinfo->gs=
o_size)) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  157  		if (skb->encapsulati=
on) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  158  			u16 ol4_ofst;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  159  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  160  			flags =3D FUN_ETH_O=
UTER_EN | FUN_ETH_INNER_LSO |
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  161  				FUN_ETH_UPDATE_INN=
ER_L4_CKSUM |
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  162  				FUN_ETH_UPDATE_OUT=
ER_L3_LEN;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  163  			if (shinfo->gso_typ=
e & (SKB_GSO_UDP_TUNNEL |
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  164  						SKB_GSO_UDP_TUNN=
EL_CSUM)) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  165  				flags |=3D FUN_ETH=
_UPDATE_OUTER_L4_LEN |
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  166  					 FUN_ETH_OUTER_UD=
P;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  167  				if (shinfo->gso_ty=
pe & SKB_GSO_UDP_TUNNEL_CSUM)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  168  					flags |=3D FUN_ET=
H_UPDATE_OUTER_L4_CKSUM;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  169  				ol4_ofst =3D skb_t=
ransport_offset(skb);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  170  			} else {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  171  				ol4_ofst =3D skb_i=
nner_network_offset(skb);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  172  			}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  173  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  174  			if (ip_hdr(skb)->ve=
rsion =3D=3D 4)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  175  				flags |=3D FUN_ETH=
_UPDATE_OUTER_L3_CKSUM;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  176  			else
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  177  				flags |=3D FUN_ETH=
_OUTER_IPV6;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  178  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  179  			if (skb->inner_netw=
ork_header) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  180  				if (inner_ip_hdr(s=
kb)->version =3D=3D 4)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  181  					flags |=3D FUN_ET=
H_UPDATE_INNER_L3_CKSUM |
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  182  						 FUN_ETH_UPDATE_=
INNER_L3_LEN;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  183  				else
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  184  					flags |=3D FUN_ET=
H_INNER_IPV6 |
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  185  						 FUN_ETH_UPDATE_=
INNER_L3_LEN;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  186  			}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  187  			th =3D inner_tcp_hd=
r(skb);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  188  			fun_eth_offload_ini=
t(&req->offload, flags,
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  189  					     shinfo->gso_=
size,
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  190  					     tcp_hdr_doff=
_flags(th), 0,
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  191  					     skb_inner_ne=
twork_offset(skb),
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  192  					     skb_inner_tr=
ansport_offset(skb),
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  193  					     skb_network_=
offset(skb), ol4_ofst);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  194  			FUN_QSTAT_INC(q, tx=
_encap_tso);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  195  		} else {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  196  			/* HW considers one=
 set of headers as inner */
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  197  			flags =3D FUN_ETH_I=
NNER_LSO |
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  198  				FUN_ETH_UPDATE_INN=
ER_L4_CKSUM |
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  199  				FUN_ETH_UPDATE_INN=
ER_L3_LEN;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  200  			if (shinfo->gso_typ=
e & SKB_GSO_TCPV6)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  201  				flags |=3D FUN_ETH=
_INNER_IPV6;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  202  			else
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  203  				flags |=3D FUN_ETH=
_UPDATE_INNER_L3_CKSUM;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  204  			th =3D tcp_hdr(skb);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  205  			fun_eth_offload_ini=
t(&req->offload, flags,
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  206  					     shinfo->gso_=
size,
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  207  					     tcp_hdr_doff=
_flags(th), 0,
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  208  					     skb_network_=
offset(skb),
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  209  					     skb_transpor=
t_offset(skb), 0, 0);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  210  			FUN_QSTAT_INC(q, tx=
_tso);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  211  		}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  212  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  213  		u64_stats_update_beg=
in(&q->syncp);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  214  		q->stats.tx_cso +=3D=
 shinfo->gso_segs;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  215  		u64_stats_update_end=
(&q->syncp);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  216  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  217  		extra_pkts =3D shinf=
o->gso_segs - 1;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  218  		extra_bytes =3D (be1=
6_to_cpu(req->offload.inner_l4_off) +
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  219  			       __tcp_hdrlen=
(th)) * extra_pkts;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  220  	} else if (likely(skb=
->ip_summed =3D=3D CHECKSUM_PARTIAL)) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  221  		flags =3D FUN_ETH_UP=
DATE_INNER_L4_CKSUM;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  222  		if (skb->csum_offset=
 =3D=3D offsetof(struct udphdr, check))
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  223  			flags |=3D FUN_ETH_=
INNER_UDP;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  224  		fun_eth_offload_init=
(&req->offload, flags, 0, 0, 0, 0,
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  225  				     skb_checksum_=
start_offset(skb), 0, 0);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  226  		FUN_QSTAT_INC(q, tx_=
cso);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  227  	} else {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  228  		fun_eth_offload_init=
(&req->offload, 0, 0, 0, 0, 0, 0, 0, 0);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  229  	}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  230  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  231  	ngle =3D shinfo->nr_f=
rags + 1;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  232  	req->len8 =3D (sizeof=
(*req) + ngle * sizeof(*gle)) / 8;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  233  	req->dataop =3D FUN_D=
ATAOP_HDR_INIT(ngle, 0, ngle, 0, skb->len);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  234  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  235  	for (i =3D 0, gle =3D=
 (struct fun_dataop_gl *)req->dataop.imm;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  236  	     i < ngle && txq_=
to_end(q, gle); i++, gle++)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  237  		fun_dataop_gl_init(g=
le, 0, 0, lens[i], addrs[i]);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  238  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  239  	if (txq_to_end(q, gle=
) =3D=3D 0) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  240  		gle =3D (struct fun_=
dataop_gl *)q->desc;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  241  		for ( ; i < ngle; i+=
+, gle++)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  242  			fun_dataop_gl_init(=
gle, 0, 0, lens[i], addrs[i]);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  243  	}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  244  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  245  	if (IS_ENABLED(CONFIG=
_TLS_DEVICE) && unlikely(tls_len)) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  246  		struct fun_eth_tls *=
tls =3D (struct fun_eth_tls *)gle;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  247  		struct fun_ktls_tx_c=
tx *tls_ctx;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  248  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  249  		req->len8 +=3D FUNET=
H_TLS_SZ / 8;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  250  		req->flags =3D cpu_t=
o_be16(FUN_ETH_TX_TLS);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  251  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18 @252  		tls_ctx =3D tls_driv=
er_ctx(skb->sk, TLS_OFFLOAD_CTX_DIR_TX);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18 @253  		tls->tlsid =3D tls_c=
tx->tlsid;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  254  		tls_ctx->next_seq +=
=3D tls_len;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  255  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  256  		u64_stats_update_beg=
in(&q->syncp);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  257  		q->stats.tx_tls_byte=
s +=3D tls_len;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  258  		q->stats.tx_tls_pkts=
 +=3D 1 + extra_pkts;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  259  		u64_stats_update_end=
(&q->syncp);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  260  	}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  261  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  262  	u64_stats_update_begi=
n(&q->syncp);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  263  	q->stats.tx_bytes +=
=3D skb->len + extra_bytes;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  264  	q->stats.tx_pkts +=3D=
 1 + extra_pkts;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  265  	u64_stats_update_end(=
&q->syncp);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  266  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  267  	q->info[idx].skb =3D =
skb;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  268  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  269  	trace_funeth_tx(q, sk=
b->len, idx, req->dataop.ngather);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  270  	return tx_req_ndesc(r=
eq);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  271  }
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  272  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  273  /* Return the number o=
f available descriptors of a Tx queue.
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  274   * HW assumes head=3D=
=3Dtail means the ring is empty so we need to keep one
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  275   * descriptor unused.
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  276   */
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  277  static unsigned int fu=
n_txq_avail(const struct funeth_txq *q)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  278  {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  279  	return q->mask - q->p=
rod_cnt + q->cons_cnt;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  280  }
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  281  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  282  /* Stop a queue if it =
can't handle another worst-case packet. */
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  283  static void fun_tx_che=
ck_stop(struct funeth_txq *q)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  284  {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  285  	if (likely(fun_txq_av=
ail(q) >=3D FUNETH_MAX_PKT_DESC))
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  286  		return;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  287  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  288  	netif_tx_stop_queue(q=
->ndq);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  289  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  290  	/* NAPI reclaim is fr=
eeing packets in parallel with us and we may race.
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  291  	 * We have stopped th=
e queue but check again after synchronizing with
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  292  	 * reclaim.
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  293  	 */
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  294  	smp_mb();
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  295  	if (likely(fun_txq_av=
ail(q) < FUNETH_MAX_PKT_DESC))
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  296  		FUN_QSTAT_INC(q, tx_=
nstops);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  297  	else
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  298  		netif_tx_start_queue=
(q->ndq);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  299  }
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  300  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  301  /* Return true if a qu=
eue has enough space to restart. Current condition is
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  302   * that the queue must=
 be >=3D 1/4 empty.
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  303   */
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  304  static bool fun_txq_ma=
y_restart(struct funeth_txq *q)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  305  {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  306  	return fun_txq_avail(=
q) >=3D q->mask / 4;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  307  }
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  308  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  309  netdev_tx_t fun_start_=
xmit(struct sk_buff *skb, struct net_device *netdev)
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  310  {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  311  	struct funeth_priv *f=
p =3D netdev_priv(netdev);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  312  	unsigned int qid =3D =
skb_get_queue_mapping(skb);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  313  	struct funeth_txq *q =
=3D fp->txqs[qid];
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  314  	unsigned int tls_len =
=3D 0;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  315  	unsigned int ndesc;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  316  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  317  	if (IS_ENABLED(CONFIG=
_TLS_DEVICE) && skb->sk &&
2458c35a3a5d46 Dimitris Michailidis 2022-02-18 @318  	    tls_is_sk_tx_devi=
ce_offloaded(skb->sk)) {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18 @319  		skb =3D fun_tls_tx(s=
kb, q, &tls_len);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  320  		if (unlikely(!skb))
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  321  			goto dropped;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  322  	}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  323  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  324  	ndesc =3D write_pkt_d=
esc(skb, q, tls_len);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  325  	if (unlikely(!ndesc))=
 {
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  326  		dev_kfree_skb_any(sk=
b);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  327  		goto dropped;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  328  	}
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  329  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  330  	q->prod_cnt +=3D ndes=
c;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  331  	fun_tx_check_stop(q);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  332  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  333  	skb_tx_timestamp(skb);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  334  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  335  	if (__netdev_tx_sent_=
queue(q->ndq, skb->len, netdev_xmit_more()))
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  336  		fun_txq_wr_db(q);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  337  	else
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  338  		FUN_QSTAT_INC(q, tx_=
more);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  339  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  340  	return NETDEV_TX_OK;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  341  =

2458c35a3a5d46 Dimitris Michailidis 2022-02-18  342  dropped:
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  343  	/* A dropped packet m=
ay be the last one in a xmit_more train,
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  344  	 * ring the doorbell =
just in case.
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  345  	 */
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  346  	if (!netdev_xmit_more=
())
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  347  		fun_txq_wr_db(q);
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  348  	return NETDEV_TX_OK;
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  349  }
2458c35a3a5d46 Dimitris Michailidis 2022-02-18  350  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9131707176381890924==--

