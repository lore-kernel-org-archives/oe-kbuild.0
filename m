Content-Type: multipart/mixed; boundary="===============4899397121660221651=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-review:UPDATE-20201113-095924/Dmytro-Shytyi/Re-PATCH-net-next-net-Variable-SLAAC-SLAAC-with-prefixes-of-arbitrary-length-in-PIO/20201111-014800 1/1] net/ipv6/addrconf.c:2860:3: warning: Consecutive return, break, continue, goto or throw statements are unnecessary.
Date: Sat, 14 Nov 2020 18:53:34 +0800
Message-ID: <202011141820.hSLKNicK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4899397121660221651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Dmytro Shytyi <dmytro@shytyi.net>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20201113-095924/Dmy=
tro-Shytyi/Re-PATCH-net-next-net-Variable-SLAAC-SLAAC-with-prefixes-of-arbi=
trary-length-in-PIO/20201111-014800
head:   e83848a7c1d953f92a024e5a7261d3a262e95565
commit: e83848a7c1d953f92a024e5a7261d3a262e95565 [1/1] net: Variable SLAAC:=
 SLAAC with prefixes of arbitrary length in PIO
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
compiler: arceb-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   net/ipv6/addrconf.c:683:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. 'break;' missing? [redundantAssignInSwit=
ch]
    err =3D -ENOBUFS;
        ^
   net/ipv6/addrconf.c:663:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D -EINVAL;
        ^
   net/ipv6/addrconf.c:683:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D -ENOBUFS;
        ^
>> net/ipv6/addrconf.c:2860:3: warning: Consecutive return, break, continue=
, goto or throw statements are unnecessary. [duplicateBreak]
     goto put;
     ^
   net/ipv6/addrconf.c:1608:50: warning: Boolean result is used in bitwise =
operation. Clarify expression with parentheses. [clarifyCondition]
     ret =3D !(score->ifa->flags & IFA_F_HOMEADDRESS) ^ prefhome;
                                                    ^

vim +2860 net/ipv6/addrconf.c

4f672235cb11c4 Alexander Aring      2016-06-15  2735  =

e6bff995f8fe78 Neil Horman          2012-01-04  2736  void addrconf_prefix_=
rcv(struct net_device *dev, u8 *opt, int len, bool sllao)
^1da177e4c3f41 Linus Torvalds       2005-04-16  2737  {
^1da177e4c3f41 Linus Torvalds       2005-04-16  2738  	struct prefix_info *=
pinfo;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2739  	__u32 valid_lft;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2740  	__u32 prefered_lft;
4f672235cb11c4 Alexander Aring      2016-06-15  2741  	int addr_type, err;
64236f3f3d7424 Hannes Frederic Sowa 2015-03-23  2742  	u32 addr_flags =3D 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2743  	struct inet6_dev *in=
6_dev;
56d417b12e57df Brian Haley          2009-06-01  2744  	struct net *net =3D =
dev_net(dev);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2745  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2746  	pinfo =3D (struct pr=
efix_info *) opt;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2747  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2748  	if (len < sizeof(str=
uct prefix_info)) {
e32ac25018558f Joe Perches          2018-03-26  2749  		netdev_dbg(dev, "ad=
drconf: prefix option too short\n");
^1da177e4c3f41 Linus Torvalds       2005-04-16  2750  		return;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2751  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  2752  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2753  	/*
^1da177e4c3f41 Linus Torvalds       2005-04-16  2754  	 *	Validation checks=
 ([ADDRCONF], page 19)
^1da177e4c3f41 Linus Torvalds       2005-04-16  2755  	 */
^1da177e4c3f41 Linus Torvalds       2005-04-16  2756  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2757  	addr_type =3D ipv6_a=
ddr_type(&pinfo->prefix);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2758  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2759  	if (addr_type & (IPV=
6_ADDR_MULTICAST|IPV6_ADDR_LINKLOCAL))
^1da177e4c3f41 Linus Torvalds       2005-04-16  2760  		return;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2761  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2762  	valid_lft =3D ntohl(=
pinfo->valid);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2763  	prefered_lft =3D nto=
hl(pinfo->prefered);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2764  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2765  	if (prefered_lft > v=
alid_lft) {
e87cc4728f0e2f Joe Perches          2012-05-13  2766  		net_warn_ratelimite=
d("addrconf: prefix option has invalid lifetime\n");
^1da177e4c3f41 Linus Torvalds       2005-04-16  2767  		return;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2768  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  2769  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2770  	in6_dev =3D in6_dev_=
get(dev);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2771  =

63159f29be1df7 Ian Morris           2015-03-29  2772  	if (!in6_dev) {
e87cc4728f0e2f Joe Perches          2012-05-13  2773  		net_dbg_ratelimited=
("addrconf: device %s not configured\n",
e87cc4728f0e2f Joe Perches          2012-05-13  2774  				    dev->name);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2775  		return;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2776  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  2777  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2778  	/*
^1da177e4c3f41 Linus Torvalds       2005-04-16  2779  	 *	Two things going =
on here:
^1da177e4c3f41 Linus Torvalds       2005-04-16  2780  	 *	1) Add routes for=
 on-link prefixes
^1da177e4c3f41 Linus Torvalds       2005-04-16  2781  	 *	2) Configure pref=
ixes with the auto flag set
^1da177e4c3f41 Linus Torvalds       2005-04-16  2782  	 */
^1da177e4c3f41 Linus Torvalds       2005-04-16  2783  =

4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2784  	if (pinfo->onlink) {
8d1c802b2815ed David Ahern          2018-04-17  2785  		struct fib6_info *r=
t;
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2786  		unsigned long rt_ex=
pires;
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2787  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2788  		/* Avoid arithmetic=
 overflow. Really, we could
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2789  		 * save rt_expires =
in seconds, likely valid_lft,
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2790  		 * but it would req=
uire division in fib gc, that it
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2791  		 * not good.
^1da177e4c3f41 Linus Torvalds       2005-04-16  2792  		 */
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2793  		if (HZ > USER_HZ)
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2794  			rt_expires =3D add=
rconf_timeout_fixup(valid_lft, HZ);
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2795  		else
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2796  			rt_expires =3D add=
rconf_timeout_fixup(valid_lft, USER_HZ);
3dd4bc68fac5df YOSHIFUJI Hideaki    2005-12-19  2797  =

4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2798  		if (addrconf_finite=
_timeout(rt_expires))
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2799  			rt_expires *=3D HZ;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2800  =

14ef37b6d00eb5 Andreas Hofmeister   2011-10-26  2801  		rt =3D addrconf_get=
_prefix_route(&pinfo->prefix,
14ef37b6d00eb5 Andreas Hofmeister   2011-10-26  2802  					       pinfo->pr=
efix_len,
14ef37b6d00eb5 Andreas Hofmeister   2011-10-26  2803  					       dev,
14ef37b6d00eb5 Andreas Hofmeister   2011-10-26  2804  					       RTF_ADDRC=
ONF | RTF_PREFIX_RT,
2b2450ca4a2d9d David Ahern          2019-03-27  2805  					       RTF_DEFAU=
LT, true);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2806  =

14ef37b6d00eb5 Andreas Hofmeister   2011-10-26  2807  		if (rt) {
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2808  			/* Autoconf prefix=
 route */
^1da177e4c3f41 Linus Torvalds       2005-04-16  2809  			if (valid_lft =3D=
=3D 0) {
11dd74b338bf83 Roopa Prabhu         2020-04-27  2810  				ip6_del_rt(net, r=
t, false);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2811  				rt =3D NULL;
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2812  			} else if (addrcon=
f_finite_timeout(rt_expires)) {
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2813  				/* not infinity */
14895687d36805 David Ahern          2018-04-17  2814  				fib6_set_expires(=
rt, jiffies + rt_expires);
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2815  			} else {
14895687d36805 David Ahern          2018-04-17  2816  				fib6_clean_expire=
s(rt);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2817  			}
^1da177e4c3f41 Linus Torvalds       2005-04-16  2818  		} else if (valid_lf=
t) {
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2819  			clock_t expires =
=3D 0;
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2820  			int flags =3D RTF_=
ADDRCONF | RTF_PREFIX_RT;
4bed72e4f5502e YOSHIFUJI Hideaki    2008-05-27  2821  			if (addrconf_finit=
e_timeout(rt_expires)) {
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2822  				/* not infinity */
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2823  				flags |=3D RTF_EX=
PIRES;
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2824  				expires =3D jiffi=
es_to_clock_t(rt_expires);
6f704992d3658a YOSHIFUJI Hideaki    2008-05-19  2825  			}
^1da177e4c3f41 Linus Torvalds       2005-04-16  2826  			addrconf_prefix_ro=
ute(&pinfo->prefix, pinfo->prefix_len,
8308f3ff1753d0 David Ahern          2018-05-27  2827  					      0, dev, ex=
pires, flags,
8308f3ff1753d0 David Ahern          2018-05-27  2828  					      GFP_ATOMIC=
);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2829  		}
93531c6743157d David Ahern          2018-04-17  2830  		fib6_info_release(r=
t);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2831  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  2832  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2833  	/* Try to figure out=
 our local address for this prefix */
^1da177e4c3f41 Linus Torvalds       2005-04-16  2834  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2835  	if (pinfo->autoconf =
&& in6_dev->cnf.autoconf) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  2836  		struct in6_addr add=
r;
f997c55c1dc884 Alexander Aring      2016-06-15  2837  		bool tokenized =3D =
false, dev_addr_generated =3D false;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2838  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2839  		if (pinfo->prefix_l=
en =3D=3D 64) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  2840  			memcpy(&addr, &pin=
fo->prefix, 8);
f53adae4eae5ad Daniel Borkmann      2013-04-08  2841  =

f53adae4eae5ad Daniel Borkmann      2013-04-08  2842  			if (!ipv6_addr_any=
(&in6_dev->token)) {
f53adae4eae5ad Daniel Borkmann      2013-04-08  2843  				read_lock_bh(&in6=
_dev->lock);
f53adae4eae5ad Daniel Borkmann      2013-04-08  2844  				memcpy(addr.s6_ad=
dr + 8,
f53adae4eae5ad Daniel Borkmann      2013-04-08  2845  				       in6_dev->t=
oken.s6_addr + 8, 8);
f53adae4eae5ad Daniel Borkmann      2013-04-08  2846  				read_unlock_bh(&i=
n6_dev->lock);
617fe29d45bdff Daniel Borkmann      2013-04-09  2847  				tokenized =3D tru=
e;
cc9da6cc4f56e0 Bj=C3=B8rn Mork           2015-12-16  2848  			} else if (is=
_addr_mode_generate_stable(in6_dev) &&
622c81d57b392c Hannes Frederic Sowa 2015-03-23  2849  				   !ipv6_generate=
_stable_address(&addr, 0,
622c81d57b392c Hannes Frederic Sowa 2015-03-23  2850  								 in6_dev)) {
64236f3f3d7424 Hannes Frederic Sowa 2015-03-23  2851  				addr_flags |=3D I=
FA_F_STABLE_PRIVACY;
622c81d57b392c Hannes Frederic Sowa 2015-03-23  2852  				goto ok;
f53adae4eae5ad Daniel Borkmann      2013-04-08  2853  			} else if (ipv6_ge=
nerate_eui64(addr.s6_addr + 8, dev) &&
^1da177e4c3f41 Linus Torvalds       2005-04-16  2854  				   ipv6_inherit_e=
ui64(addr.s6_addr + 8, in6_dev)) {
4f672235cb11c4 Alexander Aring      2016-06-15  2855  				goto put;
f997c55c1dc884 Alexander Aring      2016-06-15  2856  			} else {
f997c55c1dc884 Alexander Aring      2016-06-15  2857  				dev_addr_generate=
d =3D true;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2858  			}
^1da177e4c3f41 Linus Torvalds       2005-04-16  2859  			goto ok;
e83848a7c1d953 Dmytro Shytyi        2020-11-13 @2860  		goto put;
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2861  		} else if (((in6_de=
v->if_flags & IF_RA_VAR_PLEN) =3D=3D IF_RA_VAR_PLEN) &&
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2862  			  pinfo->prefix_le=
n > 0 && pinfo->prefix_len <=3D 128) {
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2863  			/* SLAAC with pref=
ixes of arbitrary length (Variable SLAAC).
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2864  			 * draft-mishra-6m=
an-variable-slaac
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2865  			 * draft-mishra-v6=
ops-variable-slaac-problem-stmt
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2866  			 * Contact: Dmytro=
 Shytyi.
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2867  			 */
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2868  			memcpy(&addr, &pin=
fo->prefix, 16);
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2869  			if (in6_dev->cnf.a=
ddr_gen_mode =3D=3D IN6_ADDR_GEN_MODE_STABLE_PRIVACY) {
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2870  				if (!ipv6_generat=
e_address_variable_plen(&addr,
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2871  									 0,
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2872  									 in6_dev,
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2873  									 pinfo->pref=
ix_len,
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2874  									 true)) {
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2875  					addr_flags |=3D =
IFA_F_STABLE_PRIVACY;
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2876  					goto ok;
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2877  			}
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2878  			} else if (!ipv6_g=
enerate_address_variable_plen(&addr,
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2879  									0,
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2880  									in6_dev,
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2881  									pinfo->prefi=
x_len,
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2882  									false)) {
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2883  				goto ok;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2884  			}
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2885  		} else {
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2886  			net_dbg_ratelimite=
d("IPv6: Prefix with unexpected length %d\n",
^1da177e4c3f41 Linus Torvalds       2005-04-16  2887  					    pinfo->prefi=
x_len);
e83848a7c1d953 Dmytro Shytyi        2020-11-13  2888  		}
4f672235cb11c4 Alexander Aring      2016-06-15  2889  		goto put;
^1da177e4c3f41 Linus Torvalds       2005-04-16  2890  =

^1da177e4c3f41 Linus Torvalds       2005-04-16  2891  ok:
4f672235cb11c4 Alexander Aring      2016-06-15  2892  		err =3D addrconf_pr=
efix_rcv_add_addr(net, dev, pinfo, in6_dev,
4f672235cb11c4 Alexander Aring      2016-06-15  2893  						   &addr, addr_=
type,
4f672235cb11c4 Alexander Aring      2016-06-15  2894  						   addr_flags, =
sllao,
4f672235cb11c4 Alexander Aring      2016-06-15  2895  						   tokenized, v=
alid_lft,
8a226b2cfa776d Jiri Benc            2013-08-01  2896  						   prefered_lft=
);
4f672235cb11c4 Alexander Aring      2016-06-15  2897  		if (err)
4f672235cb11c4 Alexander Aring      2016-06-15  2898  			goto put;
f997c55c1dc884 Alexander Aring      2016-06-15  2899  =

f997c55c1dc884 Alexander Aring      2016-06-15  2900  		/* Ignore error cas=
e here because previous prefix add addr was
f997c55c1dc884 Alexander Aring      2016-06-15  2901  		 * successful which=
 will be notified.
f997c55c1dc884 Alexander Aring      2016-06-15  2902  		 */
f997c55c1dc884 Alexander Aring      2016-06-15  2903  		ndisc_ops_prefix_rc=
v_add_addr(net, dev, pinfo, in6_dev, &addr,
f997c55c1dc884 Alexander Aring      2016-06-15  2904  					      addr_type,=
 addr_flags, sllao,
f997c55c1dc884 Alexander Aring      2016-06-15  2905  					      tokenized,=
 valid_lft,
f997c55c1dc884 Alexander Aring      2016-06-15  2906  					      prefered_l=
ft,
f997c55c1dc884 Alexander Aring      2016-06-15  2907  					      dev_addr_g=
enerated);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2908  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  2909  	inet6_prefix_notify(=
RTM_NEWPREFIX, in6_dev, pinfo);
4f672235cb11c4 Alexander Aring      2016-06-15  2910  put:
^1da177e4c3f41 Linus Torvalds       2005-04-16  2911  	in6_dev_put(in6_dev);
^1da177e4c3f41 Linus Torvalds       2005-04-16  2912  }
^1da177e4c3f41 Linus Torvalds       2005-04-16  2913  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4899397121660221651==--

