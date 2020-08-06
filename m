Content-Type: multipart/mixed; boundary="===============5219730069184580410=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 13557/13940] drivers/net/vxlan.c:2731:25: warning: Local variable dst shadows outer variable
Date: Thu, 06 Aug 2020 12:49:12 +0800
Message-ID: <202008061208.D4gdqJt0%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5219730069184580410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Stefano Brivio <sbrivio@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d15fe4ec043588beee823781602ddb51d0bc84c8
commit: fc68c99577cc66e38d11b3e29304efb83fa08d53 [13557/13940] vxlan: Suppo=
rt for PMTU discovery on directly bridged links
:::::: branch date: 21 hours ago
:::::: commit date: 33 hours ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/net/vxlan.c:374:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D vxlan_fdb_info(skb, vxlan, fdb, 0, 0, type, 0, rd);
        ^
   drivers/net/vxlan.c:368:0: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   drivers/net/vxlan.c:374:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D vxlan_fdb_info(skb, vxlan, fdb, 0, 0, type, 0, rd);
        ^
>> drivers/net/vxlan.c:2731:25: warning: Local variable dst shadows outer v=
ariable [shadowVar]
       struct in_addr src, dst;
                           ^
   drivers/net/vxlan.c:2600:20: note: Shadowed declaration
    union vxlan_addr *dst;
                      ^
   drivers/net/vxlan.c:2731:25: note: Shadow variable
       struct in_addr src, dst;
                           ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Dfc68c99577cc66e38d11b3e29304efb83fa08d53
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout fc68c99577cc66e38d11b3e29304efb83fa08d53
vim +2731 drivers/net/vxlan.c

fee1fad7c73dd00 pravin shelar     2016-11-13  2591  =

4ad169300a7350a Stephen Hemminger 2013-06-17  2592  static void vxlan_xmit_=
one(struct sk_buff *skb, struct net_device *dev,
3ad7a4b141ebd60 Roopa Prabhu      2017-01-31  2593  			   __be32 default_vn=
i, struct vxlan_rdst *rdst,
3ad7a4b141ebd60 Roopa Prabhu      2017-01-31  2594  			   bool did_rsc)
d342894c5d2f8c7 stephen hemminger 2012-10-01  2595  {
d71785ffc7e7cae Paolo Abeni       2016-02-12  2596  	struct dst_cache *dst_=
cache;
3093fbe7ff4bc7d Thomas Graf       2015-07-21  2597  	struct ip_tunnel_info =
*info;
d342894c5d2f8c7 stephen hemminger 2012-10-01  2598  	struct vxlan_dev *vxla=
n =3D netdev_priv(dev);
0770b53bd276a7b pravin shelar     2016-11-13  2599  	const struct iphdr *ol=
d_iph =3D ip_hdr(skb);
e4c7ed415387cf7 Cong Wang         2013-08-31  2600  	union vxlan_addr *dst;
272d96a5ab10662 pravin shelar     2016-08-05  2601  	union vxlan_addr remot=
e_ip, local_ip;
ee122c79d4227f6 Thomas Graf       2015-07-21  2602  	struct vxlan_metadata =
_md;
ee122c79d4227f6 Thomas Graf       2015-07-21  2603  	struct vxlan_metadata =
*md =3D &_md;
e4c7ed415387cf7 Cong Wang         2013-08-31  2604  	__be16 src_port =3D 0,=
 dst_port;
655c3de16540b84 pravin shelar     2016-11-13  2605  	struct dst_entry *ndst=
 =3D NULL;
e7f70af111f086a Daniel Borkmann   2016-03-09  2606  	__be32 vni, label;
d342894c5d2f8c7 stephen hemminger 2012-10-01  2607  	__u8 tos, ttl;
49f810f00fa3474 Matthias Schiffer 2017-06-19  2608  	int ifindex;
0e6fbc5b6c62189 Pravin B Shelar   2013-06-17  2609  	int err;
dc5321d79697db1 Matthias Schiffer 2017-06-19  2610  	u32 flags =3D vxlan->c=
fg.flags;
b4ed5cad24c1072 Jiri Benc         2016-02-02  2611  	bool udp_sum =3D false;
f491e56dba511d3 Jiri Benc         2016-02-02  2612  	bool xnet =3D !net_eq(=
vxlan->net, dev_net(vxlan->dev));
e4f67addf158f98 David Stevens     2012-11-20  2613  =

61adedf3e3f1d3f Jiri Benc         2015-08-20  2614  	info =3D skb_tunnel_in=
fo(skb);
3093fbe7ff4bc7d Thomas Graf       2015-07-21  2615  =

ee122c79d4227f6 Thomas Graf       2015-07-21  2616  	if (rdst) {
0770b53bd276a7b pravin shelar     2016-11-13  2617  		dst =3D &rdst->remote=
_ip;
0770b53bd276a7b pravin shelar     2016-11-13  2618  		if (vxlan_addr_any(ds=
t)) {
0770b53bd276a7b pravin shelar     2016-11-13  2619  			if (did_rsc) {
0770b53bd276a7b pravin shelar     2016-11-13  2620  				/* short-circuited =
back to local bridge */
fc68c99577cc66e Stefano Brivio    2020-08-04  2621  				vxlan_encap_bypass(=
skb, vxlan, vxlan,
fc68c99577cc66e Stefano Brivio    2020-08-04  2622  						   default_vni, t=
rue);
0770b53bd276a7b pravin shelar     2016-11-13  2623  				return;
0770b53bd276a7b pravin shelar     2016-11-13  2624  			}
0770b53bd276a7b pravin shelar     2016-11-13  2625  			goto drop;
0770b53bd276a7b pravin shelar     2016-11-13  2626  		}
0770b53bd276a7b pravin shelar     2016-11-13  2627  =

0dfbdf4102b9303 Thomas Graf       2015-07-21  2628  		dst_port =3D rdst->re=
mote_port ? rdst->remote_port : vxlan->cfg.dst_port;
3ad7a4b141ebd60 Roopa Prabhu      2017-01-31  2629  		vni =3D (rdst->remote=
_vni) ? : default_vni;
49f810f00fa3474 Matthias Schiffer 2017-06-19  2630  		ifindex =3D rdst->rem=
ote_ifindex;
1158632b5a2dcce Brian Russell     2017-02-24  2631  		local_ip =3D vxlan->c=
fg.saddr;
d71785ffc7e7cae Paolo Abeni       2016-02-12  2632  		dst_cache =3D &rdst->=
dst_cache;
0770b53bd276a7b pravin shelar     2016-11-13  2633  		md->gbp =3D skb->mark;
72f6d71e491e6ce Hangbin Liu       2018-04-17  2634  		if (flags & VXLAN_F_T=
TL_INHERIT) {
72f6d71e491e6ce Hangbin Liu       2018-04-17  2635  			ttl =3D ip_tunnel_ge=
t_ttl(old_iph, skb);
72f6d71e491e6ce Hangbin Liu       2018-04-17  2636  		} else {
0770b53bd276a7b pravin shelar     2016-11-13  2637  			ttl =3D vxlan->cfg.t=
tl;
0770b53bd276a7b pravin shelar     2016-11-13  2638  			if (!ttl && vxlan_ad=
dr_multicast(dst))
0770b53bd276a7b pravin shelar     2016-11-13  2639  				ttl =3D 1;
72f6d71e491e6ce Hangbin Liu       2018-04-17  2640  		}
0770b53bd276a7b pravin shelar     2016-11-13  2641  =

0770b53bd276a7b pravin shelar     2016-11-13  2642  		tos =3D vxlan->cfg.to=
s;
0770b53bd276a7b pravin shelar     2016-11-13  2643  		if (tos =3D=3D 1)
0770b53bd276a7b pravin shelar     2016-11-13  2644  			tos =3D ip_tunnel_ge=
t_dsfield(old_iph, skb);
0770b53bd276a7b pravin shelar     2016-11-13  2645  =

0770b53bd276a7b pravin shelar     2016-11-13  2646  		if (dst->sa.sa_family=
 =3D=3D AF_INET)
0770b53bd276a7b pravin shelar     2016-11-13  2647  			udp_sum =3D !(flags =
& VXLAN_F_UDP_ZERO_CSUM_TX);
0770b53bd276a7b pravin shelar     2016-11-13  2648  		else
0770b53bd276a7b pravin shelar     2016-11-13  2649  			udp_sum =3D !(flags =
& VXLAN_F_UDP_ZERO_CSUM6_TX);
0770b53bd276a7b pravin shelar     2016-11-13  2650  		label =3D vxlan->cfg.=
label;
ee122c79d4227f6 Thomas Graf       2015-07-21  2651  	} else {
ee122c79d4227f6 Thomas Graf       2015-07-21  2652  		if (!info) {
ee122c79d4227f6 Thomas Graf       2015-07-21  2653  			WARN_ONCE(1, "%s: Mi=
ssing encapsulation instructions\n",
ee122c79d4227f6 Thomas Graf       2015-07-21  2654  				  dev->name);
ee122c79d4227f6 Thomas Graf       2015-07-21  2655  			goto drop;
ee122c79d4227f6 Thomas Graf       2015-07-21  2656  		}
b1be00a6c39fda2 Jiri Benc         2015-09-24  2657  		remote_ip.sa.sa_famil=
y =3D ip_tunnel_info_af(info);
272d96a5ab10662 pravin shelar     2016-08-05  2658  		if (remote_ip.sa.sa_f=
amily =3D=3D AF_INET) {
c1ea5d672aaff08 Jiri Benc         2015-08-20  2659  			remote_ip.sin.sin_ad=
dr.s_addr =3D info->key.u.ipv4.dst;
272d96a5ab10662 pravin shelar     2016-08-05  2660  			local_ip.sin.sin_add=
r.s_addr =3D info->key.u.ipv4.src;
272d96a5ab10662 pravin shelar     2016-08-05  2661  		} else {
a725e514dbb444f Jiri Benc         2015-08-20  2662  			remote_ip.sin6.sin6_=
addr =3D info->key.u.ipv6.dst;
272d96a5ab10662 pravin shelar     2016-08-05  2663  			local_ip.sin6.sin6_a=
ddr =3D info->key.u.ipv6.src;
272d96a5ab10662 pravin shelar     2016-08-05  2664  		}
ee122c79d4227f6 Thomas Graf       2015-07-21  2665  		dst =3D &remote_ip;
0770b53bd276a7b pravin shelar     2016-11-13  2666  		dst_port =3D info->ke=
y.tp_dst ? : vxlan->cfg.dst_port;
0770b53bd276a7b pravin shelar     2016-11-13  2667  		vni =3D tunnel_id_to_=
key32(info->key.tun_id);
49f810f00fa3474 Matthias Schiffer 2017-06-19  2668  		ifindex =3D 0;
d71785ffc7e7cae Paolo Abeni       2016-02-12  2669  		dst_cache =3D &info->=
dst_cache;
eadf52cf1852196 Xin Long          2019-10-29  2670  		if (info->key.tun_fla=
gs & TUNNEL_VXLAN_OPT) {
eadf52cf1852196 Xin Long          2019-10-29  2671  			if (info->options_le=
n < sizeof(*md))
eadf52cf1852196 Xin Long          2019-10-29  2672  				goto drop;
0770b53bd276a7b pravin shelar     2016-11-13  2673  			md =3D ip_tunnel_inf=
o_opts(info);
eadf52cf1852196 Xin Long          2019-10-29  2674  		}
7c383fb2254c44e Jiri Benc         2015-08-20  2675  		ttl =3D info->key.ttl;
7c383fb2254c44e Jiri Benc         2015-08-20  2676  		tos =3D info->key.tos;
e7f70af111f086a Daniel Borkmann   2016-03-09  2677  		label =3D info->key.l=
abel;
b4ed5cad24c1072 Jiri Benc         2016-02-02  2678  		udp_sum =3D !!(info->=
key.tun_flags & TUNNEL_CSUM);
ee122c79d4227f6 Thomas Graf       2015-07-21  2679  	}
0770b53bd276a7b pravin shelar     2016-11-13  2680  	src_port =3D udp_flow_=
src_port(dev_net(dev), skb, vxlan->cfg.port_min,
0770b53bd276a7b pravin shelar     2016-11-13  2681  				     vxlan->cfg.por=
t_max, true);
ee122c79d4227f6 Thomas Graf       2015-07-21  2682  =

56de859e9967c07 Jakub Kicinski    2017-02-24  2683  	rcu_read_lock();
a725e514dbb444f Jiri Benc         2015-08-20  2684  	if (dst->sa.sa_family =
=3D=3D AF_INET) {
c6fcc4fc5f8b592 pravin shelar     2016-10-28  2685  		struct vxlan_sock *so=
ck4 =3D rcu_dereference(vxlan->vn4_sock);
c46b7897ad5ba49 pravin shelar     2016-11-13  2686  		struct rtable *rt;
0770b53bd276a7b pravin shelar     2016-11-13  2687  		__be16 df =3D 0;
c6fcc4fc5f8b592 pravin shelar     2016-10-28  2688  =

aab8cc3630e3250 Alexis Bauvin     2018-12-03  2689  		if (!ifindex)
aab8cc3630e3250 Alexis Bauvin     2018-12-03  2690  			ifindex =3D sock4->s=
ock->sk->sk_bound_dev_if;
aab8cc3630e3250 Alexis Bauvin     2018-12-03  2691  =

49f810f00fa3474 Matthias Schiffer 2017-06-19  2692  		rt =3D vxlan_get_rout=
e(vxlan, dev, sock4, skb, ifindex, tos,
272d96a5ab10662 pravin shelar     2016-08-05  2693  				     dst->sin.sin_a=
ddr.s_addr,
1158632b5a2dcce Brian Russell     2017-02-24  2694  				     &local_ip.sin.=
sin_addr.s_addr,
4ecb1d83f6abe8d Martynas Pumputis 2017-01-11  2695  				     dst_port, src_=
port,
d71785ffc7e7cae Paolo Abeni       2016-02-12  2696  				     dst_cache, inf=
o);
8ebd115bb23ac42 David S. Miller   2016-11-15  2697  		if (IS_ERR(rt)) {
8ebd115bb23ac42 David S. Miller   2016-11-15  2698  			err =3D PTR_ERR(rt);
c46b7897ad5ba49 pravin shelar     2016-11-13  2699  			goto tx_error;
8ebd115bb23ac42 David S. Miller   2016-11-15  2700  		}
d342894c5d2f8c7 stephen hemminger 2012-10-01  2701  =

fee1fad7c73dd00 pravin shelar     2016-11-13  2702  		if (!info) {
b4d3069783bccf0 Stefano Brivio    2018-11-08  2703  			/* Bypass encapsulat=
ion if the destination is local */
fee1fad7c73dd00 pravin shelar     2016-11-13  2704  			err =3D encap_bypass=
_if_local(skb, dev, vxlan, dst,
49f810f00fa3474 Matthias Schiffer 2017-06-19  2705  						    dst_port, ifi=
ndex, vni,
49f810f00fa3474 Matthias Schiffer 2017-06-19  2706  						    &rt->dst, rt-=
>rt_flags);
fee1fad7c73dd00 pravin shelar     2016-11-13  2707  			if (err)
56de859e9967c07 Jakub Kicinski    2017-02-24  2708  				goto out_unlock;
b4d3069783bccf0 Stefano Brivio    2018-11-08  2709  =

b4d3069783bccf0 Stefano Brivio    2018-11-08  2710  			if (vxlan->cfg.df =
=3D=3D VXLAN_DF_SET) {
b4d3069783bccf0 Stefano Brivio    2018-11-08  2711  				df =3D htons(IP_DF);
b4d3069783bccf0 Stefano Brivio    2018-11-08  2712  			} else if (vxlan->cf=
g.df =3D=3D VXLAN_DF_INHERIT) {
b4d3069783bccf0 Stefano Brivio    2018-11-08  2713  				struct ethhdr *eth =
=3D eth_hdr(skb);
b4d3069783bccf0 Stefano Brivio    2018-11-08  2714  =

b4d3069783bccf0 Stefano Brivio    2018-11-08  2715  				if (ntohs(eth->h_pr=
oto) =3D=3D ETH_P_IPV6 ||
b4d3069783bccf0 Stefano Brivio    2018-11-08  2716  				    (ntohs(eth->h_p=
roto) =3D=3D ETH_P_IP &&
b4d3069783bccf0 Stefano Brivio    2018-11-08  2717  				     old_iph->frag_=
off & htons(IP_DF)))
b4d3069783bccf0 Stefano Brivio    2018-11-08  2718  					df =3D htons(IP_DF=
);
b4d3069783bccf0 Stefano Brivio    2018-11-08  2719  			}
fee1fad7c73dd00 pravin shelar     2016-11-13  2720  		} else if (info->key.=
tun_flags & TUNNEL_DONT_FRAGMENT) {
6ceb31ca5f65acf Alexander Duyck   2016-02-19  2721  			df =3D htons(IP_DF);
fee1fad7c73dd00 pravin shelar     2016-11-13  2722  		}
6ceb31ca5f65acf Alexander Duyck   2016-02-19  2723  =

c46b7897ad5ba49 pravin shelar     2016-11-13  2724  		ndst =3D &rt->dst;
fc68c99577cc66e Stefano Brivio    2020-08-04  2725  		err =3D skb_tunnel_ch=
eck_pmtu(skb, ndst, VXLAN_HEADROOM,
fc68c99577cc66e Stefano Brivio    2020-08-04  2726  					    netif_is_any_b=
ridge_port(dev));
fc68c99577cc66e Stefano Brivio    2020-08-04  2727  		if (err < 0) {
fc68c99577cc66e Stefano Brivio    2020-08-04  2728  			goto tx_error;
fc68c99577cc66e Stefano Brivio    2020-08-04  2729  		} else if (err) {
fc68c99577cc66e Stefano Brivio    2020-08-04  2730  			if (info) {
fc68c99577cc66e Stefano Brivio    2020-08-04 @2731  				struct in_addr src,=
 dst;
fc68c99577cc66e Stefano Brivio    2020-08-04  2732  =

fc68c99577cc66e Stefano Brivio    2020-08-04  2733  				src =3D remote_ip.s=
in.sin_addr;
fc68c99577cc66e Stefano Brivio    2020-08-04  2734  				dst =3D local_ip.si=
n.sin_addr;
fc68c99577cc66e Stefano Brivio    2020-08-04  2735  				info->key.u.ipv4.sr=
c =3D src.s_addr;
fc68c99577cc66e Stefano Brivio    2020-08-04  2736  				info->key.u.ipv4.ds=
t =3D dst.s_addr;
fc68c99577cc66e Stefano Brivio    2020-08-04  2737  			}
fc68c99577cc66e Stefano Brivio    2020-08-04  2738  			vxlan_encap_bypass(s=
kb, vxlan, vxlan, vni, false);
fc68c99577cc66e Stefano Brivio    2020-08-04  2739  			dst_release(ndst);
fc68c99577cc66e Stefano Brivio    2020-08-04  2740  			goto out_unlock;
fc68c99577cc66e Stefano Brivio    2020-08-04  2741  		}
a93bf0ff449064e Xin Long          2017-12-18  2742  =

71130f29979c7c7 Hangbin Liu       2020-01-02  2743  		tos =3D ip_tunnel_ecn=
_encap(RT_TOS(tos), old_iph, skb);
0e6fbc5b6c62189 Pravin B Shelar   2013-06-17  2744  		ttl =3D ttl ? : ip4_d=
st_hoplimit(&rt->dst);
c46b7897ad5ba49 pravin shelar     2016-11-13  2745  		err =3D vxlan_build_s=
kb(skb, ndst, sizeof(struct iphdr),
54bfd872bf16d40 Jiri Benc         2016-02-16  2746  				      vni, md, flag=
s, udp_sum);
f491e56dba511d3 Jiri Benc         2016-02-02  2747  		if (err < 0)
c46b7897ad5ba49 pravin shelar     2016-11-13  2748  			goto tx_error;
f491e56dba511d3 Jiri Benc         2016-02-02  2749  =

1158632b5a2dcce Brian Russell     2017-02-24  2750  		udp_tunnel_xmit_skb(r=
t, sock4->sock->sk, skb, local_ip.sin.sin_addr.s_addr,
af33c1adae1e095 Tom Herbert       2015-01-20  2751  				    dst->sin.sin_ad=
dr.s_addr, tos, ttl, df,
f491e56dba511d3 Jiri Benc         2016-02-02  2752  				    src_port, dst_p=
ort, xnet, !udp_sum);
e4c7ed415387cf7 Cong Wang         2013-08-31  2753  #if IS_ENABLED(CONFIG_I=
PV6)
e4c7ed415387cf7 Cong Wang         2013-08-31  2754  	} else {
c6fcc4fc5f8b592 pravin shelar     2016-10-28  2755  		struct vxlan_sock *so=
ck6 =3D rcu_dereference(vxlan->vn6_sock);
e4c7ed415387cf7 Cong Wang         2013-08-31  2756  =

aab8cc3630e3250 Alexis Bauvin     2018-12-03  2757  		if (!ifindex)
aab8cc3630e3250 Alexis Bauvin     2018-12-03  2758  			ifindex =3D sock6->s=
ock->sk->sk_bound_dev_if;
aab8cc3630e3250 Alexis Bauvin     2018-12-03  2759  =

49f810f00fa3474 Matthias Schiffer 2017-06-19  2760  		ndst =3D vxlan6_get_r=
oute(vxlan, dev, sock6, skb, ifindex, tos,
272d96a5ab10662 pravin shelar     2016-08-05  2761  					label, &dst->sin6.=
sin6_addr,
1158632b5a2dcce Brian Russell     2017-02-24  2762  					&local_ip.sin6.sin=
6_addr,
4ecb1d83f6abe8d Martynas Pumputis 2017-01-11  2763  					dst_port, src_port,
db3c6139e6ead91 Daniel Borkmann   2016-03-04  2764  					dst_cache, info);
e5d4b29fe86a911 Jiri Benc         2015-12-07  2765  		if (IS_ERR(ndst)) {
8ebd115bb23ac42 David S. Miller   2016-11-15  2766  			err =3D PTR_ERR(ndst=
);
c46b7897ad5ba49 pravin shelar     2016-11-13  2767  			ndst =3D NULL;
e4c7ed415387cf7 Cong Wang         2013-08-31  2768  			goto tx_error;
e4c7ed415387cf7 Cong Wang         2013-08-31  2769  		}
655c3de16540b84 pravin shelar     2016-11-13  2770  =

fee1fad7c73dd00 pravin shelar     2016-11-13  2771  		if (!info) {
fee1fad7c73dd00 pravin shelar     2016-11-13  2772  			u32 rt6i_flags =3D (=
(struct rt6_info *)ndst)->rt6i_flags;
e4c7ed415387cf7 Cong Wang         2013-08-31  2773  =

fee1fad7c73dd00 pravin shelar     2016-11-13  2774  			err =3D encap_bypass=
_if_local(skb, dev, vxlan, dst,
49f810f00fa3474 Matthias Schiffer 2017-06-19  2775  						    dst_port, ifi=
ndex, vni,
49f810f00fa3474 Matthias Schiffer 2017-06-19  2776  						    ndst, rt6i_fl=
ags);
fee1fad7c73dd00 pravin shelar     2016-11-13  2777  			if (err)
56de859e9967c07 Jakub Kicinski    2017-02-24  2778  				goto out_unlock;
fee1fad7c73dd00 pravin shelar     2016-11-13  2779  		}
35e2d1152b22eae Jesse Gross       2016-01-20  2780  =

fc68c99577cc66e Stefano Brivio    2020-08-04  2781  		err =3D skb_tunnel_ch=
eck_pmtu(skb, ndst, VXLAN6_HEADROOM,
fc68c99577cc66e Stefano Brivio    2020-08-04  2782  					    netif_is_any_b=
ridge_port(dev));
fc68c99577cc66e Stefano Brivio    2020-08-04  2783  		if (err < 0) {
fc68c99577cc66e Stefano Brivio    2020-08-04  2784  			goto tx_error;
fc68c99577cc66e Stefano Brivio    2020-08-04  2785  		} else if (err) {
fc68c99577cc66e Stefano Brivio    2020-08-04  2786  			if (info) {
fc68c99577cc66e Stefano Brivio    2020-08-04  2787  				struct in6_addr src=
, dst;
fc68c99577cc66e Stefano Brivio    2020-08-04  2788  =

fc68c99577cc66e Stefano Brivio    2020-08-04  2789  				src =3D remote_ip.s=
in6.sin6_addr;
fc68c99577cc66e Stefano Brivio    2020-08-04  2790  				dst =3D local_ip.si=
n6.sin6_addr;
fc68c99577cc66e Stefano Brivio    2020-08-04  2791  				info->key.u.ipv6.sr=
c =3D src;
fc68c99577cc66e Stefano Brivio    2020-08-04  2792  				info->key.u.ipv6.ds=
t =3D dst;
fc68c99577cc66e Stefano Brivio    2020-08-04  2793  			}
fc68c99577cc66e Stefano Brivio    2020-08-04  2794  =

fc68c99577cc66e Stefano Brivio    2020-08-04  2795  			vxlan_encap_bypass(s=
kb, vxlan, vxlan, vni, false);
fc68c99577cc66e Stefano Brivio    2020-08-04  2796  			dst_release(ndst);
fc68c99577cc66e Stefano Brivio    2020-08-04  2797  			goto out_unlock;
fc68c99577cc66e Stefano Brivio    2020-08-04  2798  		}
a93bf0ff449064e Xin Long          2017-12-18  2799  =

71130f29979c7c7 Hangbin Liu       2020-01-02  2800  		tos =3D ip_tunnel_ecn=
_encap(RT_TOS(tos), old_iph, skb);
e4c7ed415387cf7 Cong Wang         2013-08-31  2801  		ttl =3D ttl ? : ip6_d=
st_hoplimit(ndst);
f491e56dba511d3 Jiri Benc         2016-02-02  2802  		skb_scrub_packet(skb,=
 xnet);
f491e56dba511d3 Jiri Benc         2016-02-02  2803  		err =3D vxlan_build_s=
kb(skb, ndst, sizeof(struct ipv6hdr),
54bfd872bf16d40 Jiri Benc         2016-02-16  2804  				      vni, md, flag=
s, udp_sum);
c46b7897ad5ba49 pravin shelar     2016-11-13  2805  		if (err < 0)
c46b7897ad5ba49 pravin shelar     2016-11-13  2806  			goto tx_error;
c46b7897ad5ba49 pravin shelar     2016-11-13  2807  =

0770b53bd276a7b pravin shelar     2016-11-13  2808  		udp_tunnel6_xmit_skb(=
ndst, sock6->sock->sk, skb, dev,
1158632b5a2dcce Brian Russell     2017-02-24  2809  				     &local_ip.sin6=
.sin6_addr,
272d96a5ab10662 pravin shelar     2016-08-05  2810  				     &dst->sin6.sin=
6_addr, tos, ttl,
e7f70af111f086a Daniel Borkmann   2016-03-09  2811  				     label, src_por=
t, dst_port, !udp_sum);
e4c7ed415387cf7 Cong Wang         2013-08-31  2812  #endif
e4c7ed415387cf7 Cong Wang         2013-08-31  2813  	}
56de859e9967c07 Jakub Kicinski    2017-02-24  2814  out_unlock:
56de859e9967c07 Jakub Kicinski    2017-02-24  2815  	rcu_read_unlock();
4ad169300a7350a Stephen Hemminger 2013-06-17  2816  	return;
d342894c5d2f8c7 stephen hemminger 2012-10-01  2817  =

d342894c5d2f8c7 stephen hemminger 2012-10-01  2818  drop:
d342894c5d2f8c7 stephen hemminger 2012-10-01  2819  	dev->stats.tx_dropped+=
+;
c46b7897ad5ba49 pravin shelar     2016-11-13  2820  	dev_kfree_skb(skb);
c46b7897ad5ba49 pravin shelar     2016-11-13  2821  	return;
d342894c5d2f8c7 stephen hemminger 2012-10-01  2822  =

d342894c5d2f8c7 stephen hemminger 2012-10-01  2823  tx_error:
56de859e9967c07 Jakub Kicinski    2017-02-24  2824  	rcu_read_unlock();
655c3de16540b84 pravin shelar     2016-11-13  2825  	if (err =3D=3D -ELOOP)
655c3de16540b84 pravin shelar     2016-11-13  2826  		dev->stats.collisions=
++;
655c3de16540b84 pravin shelar     2016-11-13  2827  	else if (err =3D=3D -E=
NETUNREACH)
655c3de16540b84 pravin shelar     2016-11-13  2828  		dev->stats.tx_carrier=
_errors++;
c46b7897ad5ba49 pravin shelar     2016-11-13  2829  	dst_release(ndst);
d342894c5d2f8c7 stephen hemminger 2012-10-01  2830  	dev->stats.tx_errors++;
c46b7897ad5ba49 pravin shelar     2016-11-13  2831  	kfree_skb(skb);
d342894c5d2f8c7 stephen hemminger 2012-10-01  2832  }
d342894c5d2f8c7 stephen hemminger 2012-10-01  2833  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5219730069184580410==--

