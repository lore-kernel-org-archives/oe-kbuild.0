Content-Type: multipart/mixed; boundary="===============3810949729018342558=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-goldfish:android-3.18 15022/17854] net/core/flow_dissector.c:303:12: warning: Variable 'key_basic' is reassigned a value before the old one has been used. 'break; '
Date: Sat, 20 Feb 2021 07:27:52 +0800
Message-ID: <202102200737.72PYuHSA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3810949729018342558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://android.googlesource.com/kernel/goldfish android-3.18
head:   fa7316c94fad2b143fe78cb0af113aec5e8a2a8a
commit: bb484c80792f7b566184aab3c2d6ee528d950e94 [15022/17854] flow_dissect=
: use programable dissector in skb_flow_dissect and friends
:::::: branch date: 3 days ago
:::::: commit date: 9 months ago
compiler: arceb-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/flow_dissector.c:303:12: warning: Variable 'key_basic' is reass=
igned a value before the old one has been used. 'break;' missing? [redundan=
tAssignInSwitch]
    key_basic =3D skb_flow_dissector_target(flow_dissector,
              ^
   net/core/flow_dissector.c:137:12: note: Variable 'key_basic' is reassign=
ed a value before the old one has been used. 'break;' missing?
    key_basic =3D skb_flow_dissector_target(flow_dissector,
              ^
   net/core/flow_dissector.c:303:12: note: Variable 'key_basic' is reassign=
ed a value before the old one has been used. 'break;' missing?
    key_basic =3D skb_flow_dissector_target(flow_dissector,
              ^

vim +303 net/core/flow_dissector.c

357afe9c46c951 Nikolay Aleksandrov 2013-10-02  100  =

453a940ea725d6 WANG Cong           2014-08-25  101  /**
453a940ea725d6 WANG Cong           2014-08-25  102   * __skb_flow_dissect -=
 extract the flow_keys struct and return it
453a940ea725d6 WANG Cong           2014-08-25  103   * @skb: sk_buff to ext=
ract the flow from, can be NULL if the rest are specified
bb484c80792f7b Jiri Pirko          2015-05-12  104   * @flow_dissector: lis=
t of keys to dissect
bb484c80792f7b Jiri Pirko          2015-05-12  105   * @target_container: t=
arget structure to put dissected values into
453a940ea725d6 WANG Cong           2014-08-25  106   * @data: raw buffer po=
inter to the packet, if NULL use skb->data
453a940ea725d6 WANG Cong           2014-08-25  107   * @proto: protocol for=
 which to get the flow, if @data is NULL use skb->protocol
453a940ea725d6 WANG Cong           2014-08-25  108   * @nhoff: network head=
er offset, if @data is NULL use skb_network_offset(skb)
453a940ea725d6 WANG Cong           2014-08-25  109   * @hlen: packet header=
 length, if @data is NULL use skb_headlen(skb)
453a940ea725d6 WANG Cong           2014-08-25  110   *
bb484c80792f7b Jiri Pirko          2015-05-12  111   * The function will tr=
y to retrieve individual keys into target specified
bb484c80792f7b Jiri Pirko          2015-05-12  112   * by flow_dissector fr=
om either the skbuff or a raw buffer specified by the
bb484c80792f7b Jiri Pirko          2015-05-12  113   * rest parameters.
bb484c80792f7b Jiri Pirko          2015-05-12  114   *
bb484c80792f7b Jiri Pirko          2015-05-12  115   * Caller must take car=
e of zeroing target container memory.
453a940ea725d6 WANG Cong           2014-08-25  116   */
bb484c80792f7b Jiri Pirko          2015-05-12  117  bool __skb_flow_dissect=
(const struct sk_buff *skb,
bb484c80792f7b Jiri Pirko          2015-05-12  118  			struct flow_dissecto=
r *flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  119  			void *target_contain=
er,
453a940ea725d6 WANG Cong           2014-08-25  120  			void *data, __be16 p=
roto, int nhoff, int hlen)
0744dd00c1b1be Eric Dumazet        2011-11-28  121  {
bb484c80792f7b Jiri Pirko          2015-05-12  122  	struct flow_dissector_=
key_basic *key_basic;
bb484c80792f7b Jiri Pirko          2015-05-12  123  	struct flow_dissector_=
key_addrs *key_addrs;
bb484c80792f7b Jiri Pirko          2015-05-12  124  	struct flow_dissector_=
key_ports *key_ports;
0744dd00c1b1be Eric Dumazet        2011-11-28  125  	u8 ip_proto;
0744dd00c1b1be Eric Dumazet        2011-11-28  126  =

690e36e726d00d David S. Miller     2014-08-23  127  	if (!data) {
690e36e726d00d David S. Miller     2014-08-23  128  		data =3D skb->data;
453a940ea725d6 WANG Cong           2014-08-25  129  		proto =3D skb->protoc=
ol;
453a940ea725d6 WANG Cong           2014-08-25  130  		nhoff =3D skb_network=
_offset(skb);
690e36e726d00d David S. Miller     2014-08-23  131  		hlen =3D skb_headlen(=
skb);
690e36e726d00d David S. Miller     2014-08-23  132  	}
690e36e726d00d David S. Miller     2014-08-23  133  =

bb484c80792f7b Jiri Pirko          2015-05-12  134  	/* It is ensured by sk=
b_flow_dissector_init() that basic key will
bb484c80792f7b Jiri Pirko          2015-05-12  135  	 * be always present.
bb484c80792f7b Jiri Pirko          2015-05-12  136  	 */
bb484c80792f7b Jiri Pirko          2015-05-12  137  	key_basic =3D skb_flow=
_dissector_target(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  138  					      FLOW_DISSECT=
OR_KEY_BASIC,
bb484c80792f7b Jiri Pirko          2015-05-12  139  					      target_conta=
iner);
0744dd00c1b1be Eric Dumazet        2011-11-28  140  =

0744dd00c1b1be Eric Dumazet        2011-11-28  141  again:
0744dd00c1b1be Eric Dumazet        2011-11-28  142  	switch (proto) {
2b8837aeaaa0bb Joe Perches         2014-03-12  143  	case htons(ETH_P_IP): {
0744dd00c1b1be Eric Dumazet        2011-11-28  144  		const struct iphdr *i=
ph;
0744dd00c1b1be Eric Dumazet        2011-11-28  145  		struct iphdr _iph;
0744dd00c1b1be Eric Dumazet        2011-11-28  146  ip:
690e36e726d00d David S. Miller     2014-08-23  147  		iph =3D __skb_header_=
pointer(skb, nhoff, sizeof(_iph), data, hlen, &_iph);
6f092343855a71 Jason Wang          2013-11-01  148  		if (!iph || iph->ihl =
< 5)
0744dd00c1b1be Eric Dumazet        2011-11-28  149  			return false;
3797d3e8462efd Eric Dumazet        2013-11-07  150  		nhoff +=3D iph->ihl *=
 4;
0744dd00c1b1be Eric Dumazet        2011-11-28  151  =

3797d3e8462efd Eric Dumazet        2013-11-07  152  		ip_proto =3D iph->pro=
tocol;
0744dd00c1b1be Eric Dumazet        2011-11-28  153  		if (ip_is_fragment(ip=
h))
0744dd00c1b1be Eric Dumazet        2011-11-28  154  			ip_proto =3D 0;
3797d3e8462efd Eric Dumazet        2013-11-07  155  =

bb484c80792f7b Jiri Pirko          2015-05-12  156  		if (!skb_flow_dissect=
or_uses_key(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  157  						 FLOW_DISSECTOR_K=
EY_IPV4_ADDRS))
5af7fb6e3e92c2 Alexander Duyck     2014-10-10  158  			break;
bb484c80792f7b Jiri Pirko          2015-05-12  159  		key_addrs =3D skb_flo=
w_dissector_target(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  160  						      FLOW_DISSEC=
TOR_KEY_IPV4_ADDRS,
bb484c80792f7b Jiri Pirko          2015-05-12  161  						      target_cont=
ainer);
bb484c80792f7b Jiri Pirko          2015-05-12  162  		memcpy(key_addrs, &ip=
h->saddr, sizeof(*key_addrs));
0744dd00c1b1be Eric Dumazet        2011-11-28  163  		break;
0744dd00c1b1be Eric Dumazet        2011-11-28  164  	}
2b8837aeaaa0bb Joe Perches         2014-03-12  165  	case htons(ETH_P_IPV6)=
: {
0744dd00c1b1be Eric Dumazet        2011-11-28  166  		const struct ipv6hdr =
*iph;
0744dd00c1b1be Eric Dumazet        2011-11-28  167  		struct ipv6hdr _iph;
19469a873bafd4 Tom Herbert         2014-07-01  168  		__be32 flow_label;
19469a873bafd4 Tom Herbert         2014-07-01  169  =

0744dd00c1b1be Eric Dumazet        2011-11-28  170  ipv6:
690e36e726d00d David S. Miller     2014-08-23  171  		iph =3D __skb_header_=
pointer(skb, nhoff, sizeof(_iph), data, hlen, &_iph);
0744dd00c1b1be Eric Dumazet        2011-11-28  172  		if (!iph)
0744dd00c1b1be Eric Dumazet        2011-11-28  173  			return false;
0744dd00c1b1be Eric Dumazet        2011-11-28  174  =

0744dd00c1b1be Eric Dumazet        2011-11-28  175  		ip_proto =3D iph->nex=
thdr;
0744dd00c1b1be Eric Dumazet        2011-11-28  176  		nhoff +=3D sizeof(str=
uct ipv6hdr);
19469a873bafd4 Tom Herbert         2014-07-01  177  =

bb484c80792f7b Jiri Pirko          2015-05-12  178  		if (!skb_flow_dissect=
or_uses_key(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  179  						 FLOW_DISSECTOR_K=
EY_IPV6_HASH_ADDRS))
56193d1bce2b27 Alexander Duyck     2014-09-05  180  			break;
bb484c80792f7b Jiri Pirko          2015-05-12  181  		key_addrs =3D skb_flo=
w_dissector_target(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  182  						      FLOW_DISSEC=
TOR_KEY_IPV6_HASH_ADDRS,
bb484c80792f7b Jiri Pirko          2015-05-12  183  						      target_cont=
ainer);
56193d1bce2b27 Alexander Duyck     2014-09-05  184  =

bb484c80792f7b Jiri Pirko          2015-05-12  185  		key_addrs->src =3D (_=
_force __be32)ipv6_addr_hash(&iph->saddr);
bb484c80792f7b Jiri Pirko          2015-05-12  186  		key_addrs->dst =3D (_=
_force __be32)ipv6_addr_hash(&iph->daddr);
5af7fb6e3e92c2 Alexander Duyck     2014-10-10  187  =

19469a873bafd4 Tom Herbert         2014-07-01  188  		flow_label =3D ip6_fl=
owlabel(iph);
19469a873bafd4 Tom Herbert         2014-07-01  189  		if (flow_label) {
19469a873bafd4 Tom Herbert         2014-07-01  190  			/* Awesome, IPv6 pac=
ket has a flow label so we can
19469a873bafd4 Tom Herbert         2014-07-01  191  			 * use that to repre=
sent the ports without any
19469a873bafd4 Tom Herbert         2014-07-01  192  			 * further dissectio=
n.
19469a873bafd4 Tom Herbert         2014-07-01  193  			 */
bb484c80792f7b Jiri Pirko          2015-05-12  194  =

bb484c80792f7b Jiri Pirko          2015-05-12  195  			key_basic->n_proto =
=3D proto;
bb484c80792f7b Jiri Pirko          2015-05-12  196  			key_basic->ip_proto =
=3D ip_proto;
bb484c80792f7b Jiri Pirko          2015-05-12  197  			key_basic->thoff =3D=
 (u16)nhoff;
bb484c80792f7b Jiri Pirko          2015-05-12  198  =

bb484c80792f7b Jiri Pirko          2015-05-12  199  			if (!skb_flow_dissec=
tor_uses_key(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  200  							 FLOW_DISSECTOR_=
KEY_PORTS))
bb484c80792f7b Jiri Pirko          2015-05-12  201  				break;
bb484c80792f7b Jiri Pirko          2015-05-12  202  			key_ports =3D skb_fl=
ow_dissector_target(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  203  							      FLOW_DISSE=
CTOR_KEY_PORTS,
bb484c80792f7b Jiri Pirko          2015-05-12  204  							      target_con=
tainer);
bb484c80792f7b Jiri Pirko          2015-05-12  205  			key_ports->ports =3D=
 flow_label;
19469a873bafd4 Tom Herbert         2014-07-01  206  =

19469a873bafd4 Tom Herbert         2014-07-01  207  			return true;
19469a873bafd4 Tom Herbert         2014-07-01  208  		}
19469a873bafd4 Tom Herbert         2014-07-01  209  =

0744dd00c1b1be Eric Dumazet        2011-11-28  210  		break;
0744dd00c1b1be Eric Dumazet        2011-11-28  211  	}
2b8837aeaaa0bb Joe Perches         2014-03-12  212  	case htons(ETH_P_8021A=
D):
2b8837aeaaa0bb Joe Perches         2014-03-12  213  	case htons(ETH_P_8021Q=
): {
0744dd00c1b1be Eric Dumazet        2011-11-28  214  		const struct vlan_hdr=
 *vlan;
0744dd00c1b1be Eric Dumazet        2011-11-28  215  		struct vlan_hdr _vlan;
0744dd00c1b1be Eric Dumazet        2011-11-28  216  =

690e36e726d00d David S. Miller     2014-08-23  217  		vlan =3D __skb_header=
_pointer(skb, nhoff, sizeof(_vlan), data, hlen, &_vlan);
0744dd00c1b1be Eric Dumazet        2011-11-28  218  		if (!vlan)
0744dd00c1b1be Eric Dumazet        2011-11-28  219  			return false;
0744dd00c1b1be Eric Dumazet        2011-11-28  220  =

0744dd00c1b1be Eric Dumazet        2011-11-28  221  		proto =3D vlan->h_vla=
n_encapsulated_proto;
0744dd00c1b1be Eric Dumazet        2011-11-28  222  		nhoff +=3D sizeof(*vl=
an);
0744dd00c1b1be Eric Dumazet        2011-11-28  223  		goto again;
0744dd00c1b1be Eric Dumazet        2011-11-28  224  	}
2b8837aeaaa0bb Joe Perches         2014-03-12  225  	case htons(ETH_P_PPP_S=
ES): {
0744dd00c1b1be Eric Dumazet        2011-11-28  226  		struct {
0744dd00c1b1be Eric Dumazet        2011-11-28  227  			struct pppoe_hdr hdr;
0744dd00c1b1be Eric Dumazet        2011-11-28  228  			__be16 proto;
0744dd00c1b1be Eric Dumazet        2011-11-28  229  		} *hdr, _hdr;
690e36e726d00d David S. Miller     2014-08-23  230  		hdr =3D __skb_header_=
pointer(skb, nhoff, sizeof(_hdr), data, hlen, &_hdr);
0744dd00c1b1be Eric Dumazet        2011-11-28  231  		if (!hdr)
0744dd00c1b1be Eric Dumazet        2011-11-28  232  			return false;
0744dd00c1b1be Eric Dumazet        2011-11-28  233  		proto =3D hdr->proto;
0744dd00c1b1be Eric Dumazet        2011-11-28  234  		nhoff +=3D PPPOE_SES_=
HLEN;
0744dd00c1b1be Eric Dumazet        2011-11-28  235  		switch (proto) {
2b8837aeaaa0bb Joe Perches         2014-03-12  236  		case htons(PPP_IP):
0744dd00c1b1be Eric Dumazet        2011-11-28  237  			goto ip;
2b8837aeaaa0bb Joe Perches         2014-03-12  238  		case htons(PPP_IPV6):
0744dd00c1b1be Eric Dumazet        2011-11-28  239  			goto ipv6;
0744dd00c1b1be Eric Dumazet        2011-11-28  240  		default:
0744dd00c1b1be Eric Dumazet        2011-11-28  241  			return false;
0744dd00c1b1be Eric Dumazet        2011-11-28  242  		}
0744dd00c1b1be Eric Dumazet        2011-11-28  243  	}
56193d1bce2b27 Alexander Duyck     2014-09-05  244  	case htons(ETH_P_FCOE):
bb484c80792f7b Jiri Pirko          2015-05-12  245  		key_basic->thoff =3D =
(u16)(nhoff + FCOE_HEADER_LEN);
56193d1bce2b27 Alexander Duyck     2014-09-05  246  		/* fall through */
0744dd00c1b1be Eric Dumazet        2011-11-28  247  	default:
0744dd00c1b1be Eric Dumazet        2011-11-28  248  		return false;
0744dd00c1b1be Eric Dumazet        2011-11-28  249  	}
0744dd00c1b1be Eric Dumazet        2011-11-28  250  =

0744dd00c1b1be Eric Dumazet        2011-11-28  251  	switch (ip_proto) {
0744dd00c1b1be Eric Dumazet        2011-11-28  252  	case IPPROTO_GRE: {
0744dd00c1b1be Eric Dumazet        2011-11-28  253  		struct gre_hdr {
0744dd00c1b1be Eric Dumazet        2011-11-28  254  			__be16 flags;
0744dd00c1b1be Eric Dumazet        2011-11-28  255  			__be16 proto;
0744dd00c1b1be Eric Dumazet        2011-11-28  256  		} *hdr, _hdr;
0744dd00c1b1be Eric Dumazet        2011-11-28  257  =

690e36e726d00d David S. Miller     2014-08-23  258  		hdr =3D __skb_header_=
pointer(skb, nhoff, sizeof(_hdr), data, hlen, &_hdr);
0744dd00c1b1be Eric Dumazet        2011-11-28  259  		if (!hdr)
0744dd00c1b1be Eric Dumazet        2011-11-28  260  			return false;
0744dd00c1b1be Eric Dumazet        2011-11-28  261  		/*
0744dd00c1b1be Eric Dumazet        2011-11-28  262  		 * Only look inside G=
RE if version zero and no
0744dd00c1b1be Eric Dumazet        2011-11-28  263  		 * routing
0744dd00c1b1be Eric Dumazet        2011-11-28  264  		 */
0744dd00c1b1be Eric Dumazet        2011-11-28  265  		if (!(hdr->flags & (G=
RE_VERSION|GRE_ROUTING))) {
0744dd00c1b1be Eric Dumazet        2011-11-28  266  			proto =3D hdr->proto;
0744dd00c1b1be Eric Dumazet        2011-11-28  267  			nhoff +=3D 4;
0744dd00c1b1be Eric Dumazet        2011-11-28  268  			if (hdr->flags & GRE=
_CSUM)
0744dd00c1b1be Eric Dumazet        2011-11-28  269  				nhoff +=3D 4;
0744dd00c1b1be Eric Dumazet        2011-11-28  270  			if (hdr->flags & GRE=
_KEY)
0744dd00c1b1be Eric Dumazet        2011-11-28  271  				nhoff +=3D 4;
0744dd00c1b1be Eric Dumazet        2011-11-28  272  			if (hdr->flags & GRE=
_SEQ)
0744dd00c1b1be Eric Dumazet        2011-11-28  273  				nhoff +=3D 4;
e1733de2243609 Michael Dalton      2013-03-11  274  			if (proto =3D=3D hto=
ns(ETH_P_TEB)) {
e1733de2243609 Michael Dalton      2013-03-11  275  				const struct ethhdr=
 *eth;
e1733de2243609 Michael Dalton      2013-03-11  276  				struct ethhdr _eth;
e1733de2243609 Michael Dalton      2013-03-11  277  =

690e36e726d00d David S. Miller     2014-08-23  278  				eth =3D __skb_heade=
r_pointer(skb, nhoff,
690e36e726d00d David S. Miller     2014-08-23  279  							   sizeof(_eth),
690e36e726d00d David S. Miller     2014-08-23  280  							   data, hlen, &=
_eth);
e1733de2243609 Michael Dalton      2013-03-11  281  				if (!eth)
e1733de2243609 Michael Dalton      2013-03-11  282  					return false;
e1733de2243609 Michael Dalton      2013-03-11  283  				proto =3D eth->h_pr=
oto;
e1733de2243609 Michael Dalton      2013-03-11  284  				nhoff +=3D sizeof(*=
eth);
e1733de2243609 Michael Dalton      2013-03-11  285  			}
0744dd00c1b1be Eric Dumazet        2011-11-28  286  			goto again;
0744dd00c1b1be Eric Dumazet        2011-11-28  287  		}
0744dd00c1b1be Eric Dumazet        2011-11-28  288  		break;
0744dd00c1b1be Eric Dumazet        2011-11-28  289  	}
0744dd00c1b1be Eric Dumazet        2011-11-28  290  	case IPPROTO_IPIP:
fca418955148e4 Tom Herbert         2013-07-29  291  		proto =3D htons(ETH_P=
_IP);
fca418955148e4 Tom Herbert         2013-07-29  292  		goto ip;
b438f940d3541f Tom Herbert         2013-07-29  293  	case IPPROTO_IPV6:
b438f940d3541f Tom Herbert         2013-07-29  294  		proto =3D htons(ETH_P=
_IPV6);
b438f940d3541f Tom Herbert         2013-07-29  295  		goto ipv6;
0744dd00c1b1be Eric Dumazet        2011-11-28  296  	default:
0744dd00c1b1be Eric Dumazet        2011-11-28  297  		break;
0744dd00c1b1be Eric Dumazet        2011-11-28  298  	}
0744dd00c1b1be Eric Dumazet        2011-11-28  299  =

bb484c80792f7b Jiri Pirko          2015-05-12  300  	/* It is ensured by sk=
b_flow_dissector_init() that basic key will
bb484c80792f7b Jiri Pirko          2015-05-12  301  	 * be always present.
bb484c80792f7b Jiri Pirko          2015-05-12  302  	 */
bb484c80792f7b Jiri Pirko          2015-05-12 @303  	key_basic =3D skb_flow=
_dissector_target(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  304  					      FLOW_DISSECT=
OR_KEY_BASIC,
bb484c80792f7b Jiri Pirko          2015-05-12  305  					      target_conta=
iner);
bb484c80792f7b Jiri Pirko          2015-05-12  306  	key_basic->n_proto =3D=
 proto;
bb484c80792f7b Jiri Pirko          2015-05-12  307  	key_basic->ip_proto =
=3D ip_proto;
bb484c80792f7b Jiri Pirko          2015-05-12  308  	key_basic->thoff =3D (=
u16) nhoff;
bb484c80792f7b Jiri Pirko          2015-05-12  309  =

bb484c80792f7b Jiri Pirko          2015-05-12  310  	if (skb_flow_dissector=
_uses_key(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  311  					FLOW_DISSECTOR_KEY=
_PORTS)) {
bb484c80792f7b Jiri Pirko          2015-05-12  312  		key_ports =3D skb_flo=
w_dissector_target(flow_dissector,
bb484c80792f7b Jiri Pirko          2015-05-12  313  						      FLOW_DISSEC=
TOR_KEY_PORTS,
bb484c80792f7b Jiri Pirko          2015-05-12  314  						      target_cont=
ainer);
bb484c80792f7b Jiri Pirko          2015-05-12  315  		key_ports->ports =3D =
__skb_flow_get_ports(skb, nhoff, ip_proto,
5af7fb6e3e92c2 Alexander Duyck     2014-10-10  316  							data, hlen);
bb484c80792f7b Jiri Pirko          2015-05-12  317  	}
5af7fb6e3e92c2 Alexander Duyck     2014-10-10  318  =

0744dd00c1b1be Eric Dumazet        2011-11-28  319  	return true;
0744dd00c1b1be Eric Dumazet        2011-11-28  320  }
690e36e726d00d David S. Miller     2014-08-23  321  EXPORT_SYMBOL(__skb_flo=
w_dissect);
441d9d327f1e77 Cong Wang           2013-01-21  322  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3810949729018342558==--

