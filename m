Content-Type: multipart/mixed; boundary="===============0656680421738574543=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/amt.c:580:3: warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
Date: Tue, 04 Jan 2022 17:08:27 +0800
Message-ID: <202201041659.XKg3OOUG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0656680421738574543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Taehee Yoo <ap420073@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: cbc21dc1cfe949e37b2a54c71511579f1899e8d4 amt: add data plane of amt=
 interface
date:   9 weeks ago
:::::: branch date: 34 hours ago
:::::: commit date: 9 weeks ago
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/amt.c:580:3: warning: Non-boolean value returned from functi=
on returning bool [returnNonBoolInBooleanFunction]
     return -1;
     ^
>> drivers/net/amt.c:443:16: warning: Variable 'iph' is not assigned a valu=
e. [unassignedVariable]
    struct iphdr *iph;
                  ^
   drivers/net/amt.c:503:16: warning: Variable 'iph' is not assigned a valu=
e. [unassignedVariable]
    struct iphdr *iph;
                  ^

vim +580 drivers/net/amt.c

cbc21dc1cfe949 Taehee Yoo 2021-10-31  436  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  437  static bool amt_send_membership_=
update(struct amt_dev *amt,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  438  				       struct sk_buff *skb,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  439  				       bool v6)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  440  {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  441  	struct amt_header_membership_up=
date *amtmu;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  442  	struct socket *sock;
cbc21dc1cfe949 Taehee Yoo 2021-10-31 @443  	struct iphdr *iph;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  444  	struct flowi4 fl4;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  445  	struct rtable *rt;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  446  	int err;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  447  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  448  	sock =3D rcu_dereference_bh(amt=
->sock);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  449  	if (!sock)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  450  		return true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  451  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  452  	err =3D skb_cow_head(skb, LL_RE=
SERVED_SPACE(amt->dev) + sizeof(*amtmu) +
cbc21dc1cfe949 Taehee Yoo 2021-10-31  453  			   sizeof(*iph) + sizeof(stru=
ct udphdr));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  454  	if (err)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  455  		return true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  456  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  457  	skb_reset_inner_headers(skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  458  	memset(&fl4, 0, sizeof(struct f=
lowi4));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  459  	fl4.flowi4_oif         =3D amt-=
>stream_dev->ifindex;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  460  	fl4.daddr              =3D amt-=
>remote_ip;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  461  	fl4.saddr              =3D amt-=
>local_ip;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  462  	fl4.flowi4_tos         =3D AMT_=
TOS;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  463  	fl4.flowi4_proto       =3D IPPR=
OTO_UDP;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  464  	rt =3D ip_route_output_key(amt-=
>net, &fl4);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  465  	if (IS_ERR(rt)) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  466  		netdev_dbg(amt->dev, "no route=
 to %pI4\n", &amt->remote_ip);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  467  		return true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  468  	}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  469  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  470  	amtmu			=3D skb_push(skb, sizeo=
f(*amtmu));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  471  	amtmu->version		=3D 0;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  472  	amtmu->type		=3D AMT_MSG_MEMBER=
SHIP_UPDATE;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  473  	amtmu->reserved		=3D 0;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  474  	amtmu->nonce		=3D amt->nonce;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  475  	amtmu->response_mac	=3D amt->ma=
c;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  476  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  477  	if (!v6)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  478  		skb_set_inner_protocol(skb, ht=
ons(ETH_P_IP));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  479  	else
cbc21dc1cfe949 Taehee Yoo 2021-10-31  480  		skb_set_inner_protocol(skb, ht=
ons(ETH_P_IPV6));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  481  	udp_tunnel_xmit_skb(rt, sock->s=
k, skb,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  482  			    fl4.saddr,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  483  			    fl4.daddr,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  484  			    AMT_TOS,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  485  			    ip4_dst_hoplimit(&rt->dst=
),
cbc21dc1cfe949 Taehee Yoo 2021-10-31  486  			    0,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  487  			    amt->gw_port,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  488  			    amt->relay_port,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  489  			    false,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  490  			    false);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  491  	amt_update_gw_status(amt, AMT_S=
TATUS_SENT_UPDATE, true);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  492  	return false;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  493  }
cbc21dc1cfe949 Taehee Yoo 2021-10-31  494  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  495  static void amt_send_multicast_d=
ata(struct amt_dev *amt,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  496  				    const struct sk_buff *os=
kb,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  497  				    struct amt_tunnel_list *=
tunnel,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  498  				    bool v6)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  499  {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  500  	struct amt_header_mcast_data *a=
mtmd;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  501  	struct socket *sock;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  502  	struct sk_buff *skb;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  503  	struct iphdr *iph;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  504  	struct flowi4 fl4;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  505  	struct rtable *rt;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  506  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  507  	sock =3D rcu_dereference_bh(amt=
->sock);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  508  	if (!sock)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  509  		return;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  510  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  511  	skb =3D skb_copy_expand(oskb, s=
izeof(*amtmd) + sizeof(*iph) +
cbc21dc1cfe949 Taehee Yoo 2021-10-31  512  			      sizeof(struct udphdr), =
0, GFP_ATOMIC);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  513  	if (!skb)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  514  		return;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  515  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  516  	skb_reset_inner_headers(skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  517  	memset(&fl4, 0, sizeof(struct f=
lowi4));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  518  	fl4.flowi4_oif         =3D amt-=
>stream_dev->ifindex;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  519  	fl4.daddr              =3D tunn=
el->ip4;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  520  	fl4.saddr              =3D amt-=
>local_ip;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  521  	fl4.flowi4_proto       =3D IPPR=
OTO_UDP;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  522  	rt =3D ip_route_output_key(amt-=
>net, &fl4);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  523  	if (IS_ERR(rt)) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  524  		netdev_dbg(amt->dev, "no route=
 to %pI4\n", &tunnel->ip4);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  525  		kfree_skb(skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  526  		return;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  527  	}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  528  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  529  	amtmd =3D skb_push(skb, sizeof(=
*amtmd));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  530  	amtmd->version =3D 0;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  531  	amtmd->reserved =3D 0;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  532  	amtmd->type =3D AMT_MSG_MULTICA=
ST_DATA;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  533  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  534  	if (!v6)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  535  		skb_set_inner_protocol(skb, ht=
ons(ETH_P_IP));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  536  	else
cbc21dc1cfe949 Taehee Yoo 2021-10-31  537  		skb_set_inner_protocol(skb, ht=
ons(ETH_P_IPV6));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  538  	udp_tunnel_xmit_skb(rt, sock->s=
k, skb,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  539  			    fl4.saddr,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  540  			    fl4.daddr,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  541  			    AMT_TOS,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  542  			    ip4_dst_hoplimit(&rt->dst=
),
cbc21dc1cfe949 Taehee Yoo 2021-10-31  543  			    0,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  544  			    amt->relay_port,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  545  			    tunnel->source_port,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  546  			    false,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  547  			    false);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  548  }
cbc21dc1cfe949 Taehee Yoo 2021-10-31  549  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  550  static bool amt_send_membership_=
query(struct amt_dev *amt,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  551  				      struct sk_buff *skb,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  552  				      struct amt_tunnel_list=
 *tunnel,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  553  				      bool v6)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  554  {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  555  	struct amt_header_membership_qu=
ery *amtmq;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  556  	struct socket *sock;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  557  	struct rtable *rt;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  558  	struct flowi4 fl4;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  559  	int err;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  560  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  561  	sock =3D rcu_dereference_bh(amt=
->sock);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  562  	if (!sock)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  563  		return true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  564  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  565  	err =3D skb_cow_head(skb, LL_RE=
SERVED_SPACE(amt->dev) + sizeof(*amtmq) +
cbc21dc1cfe949 Taehee Yoo 2021-10-31  566  			   sizeof(struct iphdr) + siz=
eof(struct udphdr));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  567  	if (err)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  568  		return true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  569  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  570  	skb_reset_inner_headers(skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  571  	memset(&fl4, 0, sizeof(struct f=
lowi4));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  572  	fl4.flowi4_oif         =3D amt-=
>stream_dev->ifindex;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  573  	fl4.daddr              =3D tunn=
el->ip4;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  574  	fl4.saddr              =3D amt-=
>local_ip;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  575  	fl4.flowi4_tos         =3D AMT_=
TOS;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  576  	fl4.flowi4_proto       =3D IPPR=
OTO_UDP;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  577  	rt =3D ip_route_output_key(amt-=
>net, &fl4);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  578  	if (IS_ERR(rt)) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  579  		netdev_dbg(amt->dev, "no route=
 to %pI4\n", &tunnel->ip4);
cbc21dc1cfe949 Taehee Yoo 2021-10-31 @580  		return -1;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  581  	}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  582  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  583  	amtmq		=3D skb_push(skb, sizeof=
(*amtmq));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  584  	amtmq->version	=3D 0;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  585  	amtmq->type	=3D AMT_MSG_MEMBERS=
HIP_QUERY;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  586  	amtmq->reserved =3D 0;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  587  	amtmq->l	=3D 0;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  588  	amtmq->g	=3D 0;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  589  	amtmq->nonce	=3D tunnel->nonce;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  590  	amtmq->response_mac =3D tunnel-=
>mac;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  591  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  592  	if (!v6)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  593  		skb_set_inner_protocol(skb, ht=
ons(ETH_P_IP));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  594  	else
cbc21dc1cfe949 Taehee Yoo 2021-10-31  595  		skb_set_inner_protocol(skb, ht=
ons(ETH_P_IPV6));
cbc21dc1cfe949 Taehee Yoo 2021-10-31  596  	udp_tunnel_xmit_skb(rt, sock->s=
k, skb,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  597  			    fl4.saddr,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  598  			    fl4.daddr,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  599  			    AMT_TOS,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  600  			    ip4_dst_hoplimit(&rt->dst=
),
cbc21dc1cfe949 Taehee Yoo 2021-10-31  601  			    0,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  602  			    amt->relay_port,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  603  			    tunnel->source_port,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  604  			    false,
cbc21dc1cfe949 Taehee Yoo 2021-10-31  605  			    false);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  606  	amt_update_relay_status(tunnel,=
 AMT_STATUS_SENT_QUERY, true);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  607  	return false;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  608  }
cbc21dc1cfe949 Taehee Yoo 2021-10-31  609  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0656680421738574543==--

