Content-Type: multipart/mixed; boundary="===============7373471113704589267=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: net/dsa/tag_sja1105.c:432 sja1105_rcv() error: uninitialized symbol 'vid'.
Date: Wed, 27 Apr 2022 17:28:39 +0300
Message-ID: <20220427142839.GK2090@kadam>
In-Reply-To: <20220427135128.la6ifcrs2nmnx4ro@skbuf>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7373471113704589267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 01:51:28PM +0000, Vladimir Oltean wrote:
> On Wed, Apr 27, 2022 at 10:13:30AM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
> > head:   cf424ef014ac30b0da27125dd1fbdf10b0d3a520
> > commit: 04a1758348a87eb73b8a4554d0c227831e2bb33e net: dsa: tag_sja1105:=
 fix control packets on SJA1110 being received on an imprecise port
> > config: openrisc-randconfig-m031-20220425 (https://download.01.org/0day=
-ci/archive/20220427/202204270649.Eun9P40C-lkp(a)intel.com/config )
> > compiler: or1k-linux-gcc (GCC) 11.2.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> > net/dsa/tag_sja1105.c:432 sja1105_rcv() error: uninitialized symbol 'vi=
d'.
> > =

> > Old smatch warnings:
> > net/dsa/tag_sja1105.c:564 sja1110_rcv() error: uninitialized symbol 'vi=
d'.
> > =

> > vim +/vid +432 net/dsa/tag_sja1105.c
> > =

> > 227d07a07ef1262 Vladimir Oltean 2019-05-05  393  static struct sk_buff =
*sja1105_rcv(struct sk_buff *skb,
> > 227d07a07ef1262 Vladimir Oltean 2019-05-05  394  				   struct net_devi=
ce *netdev,
> > 227d07a07ef1262 Vladimir Oltean 2019-05-05  395  				   struct packet_t=
ype *pt)
> > 227d07a07ef1262 Vladimir Oltean 2019-05-05  396  {
> > 884be12f85666c6 Vladimir Oltean 2021-07-26  397  	int source_port =3D -=
1, switch_id =3D -1;
> > e53e18a6fe4d3ae Vladimir Oltean 2019-06-08  398  	struct sja1105_meta m=
eta =3D {0};
> > e80f40cbe4dd513 Vladimir Oltean 2020-03-24  399  	struct ethhdr *hdr;
> > 42824463d38d273 Vladimir Oltean 2019-06-08  400  	bool is_link_local;
> > e53e18a6fe4d3ae Vladimir Oltean 2019-06-08  401  	bool is_meta;
> > 884be12f85666c6 Vladimir Oltean 2021-07-26  402  	u16 vid;
> > 227d07a07ef1262 Vladimir Oltean 2019-05-05  403  =

> > e80f40cbe4dd513 Vladimir Oltean 2020-03-24  404  	hdr =3D eth_hdr(skb);
> > 42824463d38d273 Vladimir Oltean 2019-06-08  405  	is_link_local =3D sja=
1105_is_link_local(skb);
> > e53e18a6fe4d3ae Vladimir Oltean 2019-06-08  406  	is_meta =3D sja1105_i=
s_meta_frame(skb);
> > 227d07a07ef1262 Vladimir Oltean 2019-05-05  407  =

> > 227d07a07ef1262 Vladimir Oltean 2019-05-05  408  	skb->offload_fwd_mark=
 =3D 1;
> > 227d07a07ef1262 Vladimir Oltean 2019-05-05  409  =

> > 233697b3b3f60b1 Vladimir Oltean 2021-06-11  410  	if (sja1105_skb_has_t=
ag_8021q(skb)) {
> > 42824463d38d273 Vladimir Oltean 2019-06-08  411  		/* Normal traffic pa=
th. */
> > 04a1758348a87eb Vladimir Oltean 2021-07-29  412  		sja1105_vlan_rcv(skb=
, &source_port, &switch_id, &vid);
> > =

> > There is a return where *vid is not set
> =

> And also one where source_port and switch_id are left with their default
> values of -1.
> =


I should probably have wondered why I hadn't emailed you before...  For
some reason I got confused and thought it was an arch/ thing...

My desktop build does cross function analysis so it doesn't print this
false positive.

regards,
dan carpenter

--===============7373471113704589267==--

