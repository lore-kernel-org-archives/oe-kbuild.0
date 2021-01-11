Content-Type: multipart/mixed; boundary="===============1879888281543648459=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ipv4/gre_demux.c:106:3: warning: Variable 'options' is modified but its new value is never used.
Date: Mon, 11 Jan 2021 14:37:31 +0800
Message-ID: <202101111424.D0bhoALi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1879888281543648459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7c53f6b671f4aba70ff15e1b05148b10d58c2837
commit: 17c25cafd4d3e74c83dce56b158843b19c40b414 gre: fix uninit-value in _=
_iptunnel_pull_header
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
compiler: mipsel-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/ipv4/gre_demux.c:106:3: warning: Variable 'options' is modified but =
its new value is never used. [unreadVariable]
     options++;
     ^

vim +/options +106 net/ipv4/gre_demux.c

00959ade36acadc0 net/ipv4/gre.c       Dmitry Kozlov    2010-08-21   58  =

17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07   59  /* =
Fills in tpi and returns header length to be pulled.
17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07   60   * =
Note that caller must use pskb_may_pull() before pulling GRE header.
17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07   61   */
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   62  int=
 gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
e582615ad33dbd39 net/ipv4/gre_demux.c Eric Dumazet     2016-06-15   63  		 =
    bool *csum_err, __be16 proto, int nhs)
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   64  {
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   65  	co=
nst struct gre_base_hdr *greh;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   66  	__=
be32 *options;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   67  	in=
t hdr_len;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   68  =

e582615ad33dbd39 net/ipv4/gre_demux.c Eric Dumazet     2016-06-15   69  	if=
 (unlikely(!pskb_may_pull(skb, nhs + sizeof(struct gre_base_hdr))))
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   70  		r=
eturn -EINVAL;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   71  =

e582615ad33dbd39 net/ipv4/gre_demux.c Eric Dumazet     2016-06-15   72  	gr=
eh =3D (struct gre_base_hdr *)(skb->data + nhs);
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   73  	if=
 (unlikely(greh->flags & (GRE_VERSION | GRE_ROUTING)))
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   74  		r=
eturn -EINVAL;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   75  =

95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   76  	tp=
i->flags =3D gre_flags_to_tnl_flags(greh->flags);
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   77  	hd=
r_len =3D gre_calc_hlen(tpi->flags);
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   78  =

e582615ad33dbd39 net/ipv4/gre_demux.c Eric Dumazet     2016-06-15   79  	if=
 (!pskb_may_pull(skb, nhs + hdr_len))
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   80  		r=
eturn -EINVAL;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   81  =

e582615ad33dbd39 net/ipv4/gre_demux.c Eric Dumazet     2016-06-15   82  	gr=
eh =3D (struct gre_base_hdr *)(skb->data + nhs);
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   83  	tp=
i->proto =3D greh->protocol;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   84  =

95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   85  	op=
tions =3D (__be32 *)(greh + 1);
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   86  	if=
 (greh->flags & GRE_CSUM) {
b0350d51f001e6ed net/ipv4/gre_demux.c Haishuang Yan    2018-09-14   87  		i=
f (!skb_checksum_simple_validate(skb)) {
e4aa33ad59593639 net/ipv4/gre_demux.c Li RongQing      2019-07-04   88  			=
skb_checksum_try_convert(skb, IPPROTO_GRE,
b0350d51f001e6ed net/ipv4/gre_demux.c Haishuang Yan    2018-09-14   89  			=
			 null_compute_pseudo);
b0350d51f001e6ed net/ipv4/gre_demux.c Haishuang Yan    2018-09-14   90  		}=
 else if (csum_err) {
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   91  			=
*csum_err =3D true;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   92  			=
return -EINVAL;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   93  		}
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   94  =

95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   95  		o=
ptions++;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   96  	}
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   97  =

95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   98  	if=
 (greh->flags & GRE_KEY) {
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29   99  		t=
pi->key =3D *options;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  100  		o=
ptions++;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  101  	} =
else {
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  102  		t=
pi->key =3D 0;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  103  	}
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  104  	if=
 (unlikely(greh->flags & GRE_SEQ)) {
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  105  		t=
pi->seq =3D *options;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29 @106  		o=
ptions++;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  107  	} =
else {
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  108  		t=
pi->seq =3D 0;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  109  	}
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  110  	/*=
 WCCP version 1 and 2 protocol decoding.
da73b4e9538b9be9 net/ipv4/gre_demux.c Haishuang Yan    2016-05-11  111  	 *=
 - Change protocol to IPv4/IPv6
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  112  	 *=
 - When dealing with WCCPv2, Skip extra 4 bytes in GRE header
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  113  	 */
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  114  	if=
 (greh->flags =3D=3D 0 && tpi->proto =3D=3D htons(ETH_P_WCCP)) {
17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07  115  		u=
8 _val, *val;
17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07  116  =

17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07  117  		v=
al =3D skb_header_pointer(skb, nhs + hdr_len,
17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07  118  			=
		 sizeof(_val), &_val);
17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07  119  		i=
f (!val)
17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07  120  			=
return -EINVAL;
da73b4e9538b9be9 net/ipv4/gre_demux.c Haishuang Yan    2016-05-11  121  		t=
pi->proto =3D proto;
17c25cafd4d3e74c net/ipv4/gre_demux.c Eric Dumazet     2020-03-07  122  		i=
f ((*val & 0xF0) !=3D 0x40)
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  123  			=
hdr_len +=3D 4;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  124  	}
9b8c6d7bf2e08a7d net/ipv4/gre_demux.c Eric Dumazet     2016-06-18  125  	tp=
i->hdr_len =3D hdr_len;
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  126  =

cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  127  	/*=
 ERSPAN ver 1 and 2 protocol sets GRE key field
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  128  	 *=
 to 0 and sets the configured key in the
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  129  	 *=
 inner erspan header field
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  130  	 */
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  131  	if=
 (greh->protocol =3D=3D htons(ETH_P_ERSPAN) ||
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  132  	  =
  greh->protocol =3D=3D htons(ETH_P_ERSPAN2)) {
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  133  		s=
truct erspan_base_hdr *ershdr;
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  134  =

cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  135  		i=
f (!pskb_may_pull(skb, nhs + hdr_len + sizeof(*ershdr)))
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  136  			=
return -EINVAL;
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  137  =

0e4940928c26527c net/ipv4/gre_demux.c Cong Wang        2019-12-05  138  		e=
rshdr =3D (struct erspan_base_hdr *)(skb->data + nhs + hdr_len);
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  139  		t=
pi->key =3D cpu_to_be32(get_session_id(ershdr));
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  140  	}
cb73ee40b1b381ea net/ipv4/gre_demux.c Lorenzo Bianconi 2019-01-18  141  =

f132ae7c46370c98 net/ipv4/gre_demux.c Jiri Benc        2016-05-03  142  	re=
turn hdr_len;
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  143  }
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  144  EXP=
ORT_SYMBOL(gre_parse_header);
95f5c64c3c13a609 net/ipv4/gre_demux.c Tom Herbert      2016-04-29  145  =


:::::: The code at line 106 was first introduced by commit
:::::: 95f5c64c3c13a609e137d35c4b452519e0b954df gre: Move utility functions=
 to common headers

:::::: TO: Tom Herbert <tom@herbertland.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1879888281543648459==--

