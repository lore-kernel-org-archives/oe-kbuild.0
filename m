Content-Type: multipart/mixed; boundary="===============6625002431206810914=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/usb/rndis_host.c:301:23: warning: union member 'Anonymous1::set_c' is never used.
Date: Tue, 19 Jan 2021 16:20:57 +0800
Message-ID: <202101191638.3YLwaoBk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6625002431206810914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Guo Ren <guoren@linux.alibaba.com>

Hi Guo,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1e2a199f6ccdc15cf111d68d212e2fd4ce65682e
commit: 18c07d23da5a48525b2955aa269b8bb108c19300 csky: Fixup calltrace panic
date:   8 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 months ago
compiler: csky-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/usb/rndis_host.c:301:23: warning: union member 'Anonymous1::=
set_c' is never used. [unusedStructMember]
     struct rndis_set_c *set_c;
                         ^

vim +301 drivers/net/usb/rndis_host.c

0f2166dff6440bb6 drivers/net/usb/rndis_host.c Stephen Hemminger      2009-0=
3-20  286  =

039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  287  int
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  288  generic_rndis_bind(struct usbnet *dev, struct usb_interface *int=
f, int flags)
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  289  {
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  290  	int			retval;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  291  	struct net_device	*net =3D dev->net;
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  292  	struct cdc_state	*info =3D (void *) &dev->data;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  293  	union {
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  294  		void			*buf;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  295  		struct rndis_msg_hdr	*header;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  296  		struct rndis_init	*init;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  297  		struct rndis_init_c	*init_c;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  298  		struct rndis_query	*get;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  299  		struct rndis_query_c	*get_c;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  300  		struct rndis_set	*set;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31 @301  		struct rndis_set_c	*set_c;
9ff55874fea71f48 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  302  		struct rndis_halt	*halt;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  303  	} u;
d63ddcec20f59e78 drivers/net/usb/rndis_host.c Al Viro                2008-0=
5-21  304  	u32			tmp;
d63ddcec20f59e78 drivers/net/usb/rndis_host.c Al Viro                2008-0=
5-21  305  	__le32			phym_unspec, *phym;
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  306  	int			reply_len;
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  307  	unsigned char		*bp;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  308  =

64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  309  	/* we can't rely on i/o from stack working, or stack allocation=
 */
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  310  	u.buf =3D kmalloc(CONTROL_BUFFER_SIZE, GFP_KERNEL);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  311  	if (!u.buf)
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  312  		return -ENOMEM;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  313  	retval =3D usbnet_generic_cdc_bind(dev, intf);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  314  	if (retval < 0)
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  315  		goto fail;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  316  =

7390e8b0dee778b0 drivers/net/usb/rndis_host.c Linus Walleij          2012-0=
5-11  317  	u.init->msg_type =3D cpu_to_le32(RNDIS_MSG_INIT);
35c26c2cf6a6a2d1 drivers/net/usb/rndis_host.c Harvey Harrison        2009-0=
2-14  318  	u.init->msg_len =3D cpu_to_le32(sizeof *u.init);
35c26c2cf6a6a2d1 drivers/net/usb/rndis_host.c Harvey Harrison        2009-0=
2-14  319  	u.init->major_version =3D cpu_to_le32(1);
35c26c2cf6a6a2d1 drivers/net/usb/rndis_host.c Harvey Harrison        2009-0=
2-14  320  	u.init->minor_version =3D cpu_to_le32(0);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  321  =

ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  322  	/* max transfer (in spec) is 0x4000 at full speed, but for
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  323  	 * TX we'll stick to one Ethernet packet plus RNDIS framing.
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  324  	 * For RX we handle drivers that zero-pad to end-of-packet.
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  325  	 * Don't let userspace change these settings.
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  326  	 *
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  327  	 * NOTE: there still seems to be wierdness here, as if we need
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  328  	 * to do some more things to make sure WinCE targets accept thi=
s.
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  329  	 * They default to jumbograms of 8KB or 16KB, which is absurd
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  330  	 * for such low data rates and which is also more than Linux
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  331  	 * can usually expect to allocate for SKB data...
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  332  	 */
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  333  	net->hard_header_len +=3D sizeof (struct rndis_data_hdr);
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  334  	dev->hard_mtu =3D net->mtu + net->hard_header_len;
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  335  =

10d0f27c1baa4a09 drivers/net/usb/rndis_host.c Jean-Christophe Dubois 2008-0=
3-13  336  	dev->maxpacket =3D usb_maxpacket(dev->udev, dev->out, 1);
10d0f27c1baa4a09 drivers/net/usb/rndis_host.c Jean-Christophe Dubois 2008-0=
3-13  337  	if (dev->maxpacket =3D=3D 0) {
a475f603d23392f3 drivers/net/usb/rndis_host.c Joe Perches            2010-0=
2-17  338  		netif_dbg(dev, probe, dev->net,
a475f603d23392f3 drivers/net/usb/rndis_host.c Joe Perches            2010-0=
2-17  339  			  "dev->maxpacket can't be 0\n");
10d0f27c1baa4a09 drivers/net/usb/rndis_host.c Jean-Christophe Dubois 2008-0=
3-13  340  		retval =3D -EINVAL;
10d0f27c1baa4a09 drivers/net/usb/rndis_host.c Jean-Christophe Dubois 2008-0=
3-13  341  		goto fail_and_release;
10d0f27c1baa4a09 drivers/net/usb/rndis_host.c Jean-Christophe Dubois 2008-0=
3-13  342  	}
10d0f27c1baa4a09 drivers/net/usb/rndis_host.c Jean-Christophe Dubois 2008-0=
3-13  343  =

ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  344  	dev->rx_urb_size =3D dev->hard_mtu + (dev->maxpacket + 1);
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  345  	dev->rx_urb_size &=3D ~(dev->maxpacket - 1);
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  346  	u.init->max_transfer_size =3D cpu_to_le32(dev->rx_urb_size);
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  347  =

0f2166dff6440bb6 drivers/net/usb/rndis_host.c Stephen Hemminger      2009-0=
3-20  348  	net->netdev_ops =3D &rndis_netdev_ops;
0f2166dff6440bb6 drivers/net/usb/rndis_host.c Stephen Hemminger      2009-0=
3-20  349  =

818727badc14ce57 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
6-18  350  	retval =3D rndis_command(dev, u.header, CONTROL_BUFFER_SIZE);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  351  	if (unlikely(retval < 0)) {
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  352  		/* it might not even be an RNDIS device!! */
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  353  		dev_err(&intf->dev, "RNDIS init failed, %d\n", retval);
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  354  		goto fail_and_release;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  355  	}
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  356  	tmp =3D le32_to_cpu(u.init_c->max_transfer_size);
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  357  	if (tmp < dev->hard_mtu) {
500d2c2f7b8c1cf6 drivers/net/usb/rndis_host.c Thomas Sailer          2007-1=
0-24  358  		if (tmp <=3D net->hard_header_len) {
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  359  			dev_err(&intf->dev,
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  360  				"dev can't take %u byte packets (max %u)\n",
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  361  				dev->hard_mtu, tmp);
4149b72eaa74583c drivers/net/usb/rndis_host.c David Brownell         2007-0=
4-29  362  			retval =3D -EINVAL;
9ff55874fea71f48 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  363  			goto halt_fail_and_release;
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  364  		}
500d2c2f7b8c1cf6 drivers/net/usb/rndis_host.c Thomas Sailer          2007-1=
0-24  365  		dev_warn(&intf->dev,
500d2c2f7b8c1cf6 drivers/net/usb/rndis_host.c Thomas Sailer          2007-1=
0-24  366  			 "dev can't take %u byte packets (max %u), "
500d2c2f7b8c1cf6 drivers/net/usb/rndis_host.c Thomas Sailer          2007-1=
0-24  367  			 "adjusting MTU to %u\n",
40ac7b62d8c132c7 drivers/net/usb/rndis_host.c George Nassar          2009-1=
0-14  368  			 dev->hard_mtu, tmp, tmp - net->hard_header_len);
40ac7b62d8c132c7 drivers/net/usb/rndis_host.c George Nassar          2009-1=
0-14  369  		dev->hard_mtu =3D tmp;
40ac7b62d8c132c7 drivers/net/usb/rndis_host.c George Nassar          2009-1=
0-14  370  		net->mtu =3D dev->hard_mtu - net->hard_header_len;
500d2c2f7b8c1cf6 drivers/net/usb/rndis_host.c Thomas Sailer          2007-1=
0-24  371  	}
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  372  =

64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  373  	/* REVISIT:  peripheral "alignment" request is ignored ... */
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  374  	dev_dbg(&intf->dev,
5b5e0928f742cfa8 drivers/net/usb/rndis_host.c Alexey Dobriyan        2017-0=
2-27  375  		"hard mtu %u (%u from dev), rx buflen %zu, align %d\n",
ad55d71a3d4401f4 drivers/usb/net/rndis_host.c Ole Andre Vadla Ravnas 2006-1=
2-14  376  		dev->hard_mtu, tmp, dev->rx_urb_size,
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  377  		1 << le32_to_cpu(u.init_c->packet_alignment));
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  378  =

7c39e038fc738012 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  379  	/* module has some device initialization code needs to be done =
right
7c39e038fc738012 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  380  	 * after RNDIS_INIT */
7c39e038fc738012 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  381  	if (dev->driver_info->early_init &&
7c39e038fc738012 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  382  			dev->driver_info->early_init(dev) !=3D 0)
7c39e038fc738012 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  383  		goto halt_fail_and_release;
7c39e038fc738012 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  384  =

039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  385  	/* Check physical medium */
9f5e60dd5ffca938 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
3-23  386  	phym =3D NULL;
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  387  	reply_len =3D sizeof *phym;
7390e8b0dee778b0 drivers/net/usb/rndis_host.c Linus Walleij          2012-0=
5-11  388  	retval =3D rndis_query(dev, intf, u.buf,
5432bdc053727b92 drivers/net/usb/rndis_host.c Jussi Kivilinna        2012-0=
5-11  389  			     RNDIS_OID_GEN_PHYSICAL_MEDIUM,
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  390  			     0, (void **) &phym, &reply_len);
9f5e60dd5ffca938 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
3-23  391  	if (retval !=3D 0 || !phym) {
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  392  		/* OID is optional so don't fail here. */
7390e8b0dee778b0 drivers/net/usb/rndis_host.c Linus Walleij          2012-0=
5-11  393  		phym_unspec =3D cpu_to_le32(RNDIS_PHYSICAL_MEDIUM_UNSPECIFIED);
9f5e60dd5ffca938 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
3-23  394  		phym =3D &phym_unspec;
9f5e60dd5ffca938 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
3-23  395  	}
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  396  	if ((flags & FLAG_RNDIS_PHYM_WIRELESS) &&
3eef36689888390c drivers/net/usb/rndis_host.c Jussi Kivilinna        2012-0=
5-11  397  	    le32_to_cpup(phym) !=3D RNDIS_PHYSICAL_MEDIUM_WIRELESS_LAN)=
 {
a475f603d23392f3 drivers/net/usb/rndis_host.c Joe Perches            2010-0=
2-17  398  		netif_dbg(dev, probe, dev->net,
a475f603d23392f3 drivers/net/usb/rndis_host.c Joe Perches            2010-0=
2-17  399  			  "driver requires wireless physical medium, but device is no=
t\n");
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  400  		retval =3D -ENODEV;
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  401  		goto halt_fail_and_release;
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  402  	}
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  403  	if ((flags & FLAG_RNDIS_PHYM_NOT_WIRELESS) &&
3eef36689888390c drivers/net/usb/rndis_host.c Jussi Kivilinna        2012-0=
5-11  404  	    le32_to_cpup(phym) =3D=3D RNDIS_PHYSICAL_MEDIUM_WIRELESS_LA=
N) {
a475f603d23392f3 drivers/net/usb/rndis_host.c Joe Perches            2010-0=
2-17  405  		netif_dbg(dev, probe, dev->net,
a475f603d23392f3 drivers/net/usb/rndis_host.c Joe Perches            2010-0=
2-17  406  			  "driver requires non-wireless physical medium, but device i=
s wireless.\n");
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  407  		retval =3D -ENODEV;
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  408  		goto halt_fail_and_release;
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  409  	}
039ee17d1baabaa2 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-27  410  =

ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  411  	/* Get designated host ethernet address */
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  412  	reply_len =3D ETH_ALEN;
7390e8b0dee778b0 drivers/net/usb/rndis_host.c Linus Walleij          2012-0=
5-11  413  	retval =3D rndis_query(dev, intf, u.buf,
5432bdc053727b92 drivers/net/usb/rndis_host.c Jussi Kivilinna        2012-0=
5-11  414  			     RNDIS_OID_802_3_PERMANENT_ADDRESS,
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  415  			     48, (void **) &bp, &reply_len);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  416  	if (unlikely(retval< 0)) {
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  417  		dev_err(&intf->dev, "rndis get ethaddr, %d\n", retval);
9ff55874fea71f48 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  418  		goto halt_fail_and_release;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  419  	}
a5a18bdf7453d505 drivers/net/usb/rndis_host.c Kristian Evensen       2016-0=
7-14  420  =

a5a18bdf7453d505 drivers/net/usb/rndis_host.c Kristian Evensen       2016-0=
7-14  421  	if (bp[0] & 0x02)
a5a18bdf7453d505 drivers/net/usb/rndis_host.c Kristian Evensen       2016-0=
7-14  422  		eth_hw_addr_random(net);
a5a18bdf7453d505 drivers/net/usb/rndis_host.c Kristian Evensen       2016-0=
7-14  423  	else
a5a18bdf7453d505 drivers/net/usb/rndis_host.c Kristian Evensen       2016-0=
7-14  424  		ether_addr_copy(net->dev_addr, bp);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  425  =

64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  426  	/* set a nonzero filter to enable data transfers */
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  427  	memset(u.set, 0, sizeof *u.set);
7390e8b0dee778b0 drivers/net/usb/rndis_host.c Linus Walleij          2012-0=
5-11  428  	u.set->msg_type =3D cpu_to_le32(RNDIS_MSG_SET);
35c26c2cf6a6a2d1 drivers/net/usb/rndis_host.c Harvey Harrison        2009-0=
2-14  429  	u.set->msg_len =3D cpu_to_le32(4 + sizeof *u.set);
8cdddc3f9d6692f5 drivers/net/usb/rndis_host.c Linus Walleij          2012-0=
5-11  430  	u.set->oid =3D cpu_to_le32(RNDIS_OID_GEN_CURRENT_PACKET_FILTER);
35c26c2cf6a6a2d1 drivers/net/usb/rndis_host.c Harvey Harrison        2009-0=
2-14  431  	u.set->len =3D cpu_to_le32(4);
35c26c2cf6a6a2d1 drivers/net/usb/rndis_host.c Harvey Harrison        2009-0=
2-14  432  	u.set->offset =3D cpu_to_le32((sizeof *u.set) - 8);
7390e8b0dee778b0 drivers/net/usb/rndis_host.c Linus Walleij          2012-0=
5-11  433  	*(__le32 *)(u.buf + sizeof *u.set) =3D cpu_to_le32(RNDIS_DEFAUL=
T_FILTER);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  434  =

818727badc14ce57 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
6-18  435  	retval =3D rndis_command(dev, u.header, CONTROL_BUFFER_SIZE);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  436  	if (unlikely(retval < 0)) {
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  437  		dev_err(&intf->dev, "rndis set packet filter, %d\n", retval);
9ff55874fea71f48 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  438  		goto halt_fail_and_release;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  439  	}
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  440  =

64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  441  	retval =3D 0;
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  442  =

deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  443  	kfree(u.buf);
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  444  	return retval;
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  445  =

9ff55874fea71f48 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  446  halt_fail_and_release:
9ff55874fea71f48 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  447  	memset(u.halt, 0, sizeof *u.halt);
7390e8b0dee778b0 drivers/net/usb/rndis_host.c Linus Walleij          2012-0=
5-11  448  	u.halt->msg_type =3D cpu_to_le32(RNDIS_MSG_HALT);
35c26c2cf6a6a2d1 drivers/net/usb/rndis_host.c Harvey Harrison        2009-0=
2-14  449  	u.halt->msg_len =3D cpu_to_le32(sizeof *u.halt);
818727badc14ce57 drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
6-18  450  	(void) rndis_command(dev, (void *)u.halt, CONTROL_BUFFER_SIZE);
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  451  fail_and_release:
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  452  	usb_set_intfdata(info->data, NULL);
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  453  	usb_driver_release_interface(driver_of(intf), info->data);
ddda08624013e843 drivers/usb/net/rndis_host.c David Brownell         2007-0=
4-17  454  	info->data =3D NULL;
deb31f1764e0a11b drivers/usb/net/rndis_host.c Daniel Gollub          2007-0=
1-16  455  fail:
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  456  	kfree(u.buf);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  457  	return retval;
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  458  }
5665998cd75bbaaa drivers/net/usb/rndis_host.c Jussi Kivilinna        2008-0=
1-26  459  EXPORT_SYMBOL_GPL(generic_rndis_bind);
64e049102d3de3e6 drivers/usb/net/rndis_host.c David Brownell         2005-0=
8-31  460  =


:::::: The code at line 301 was first introduced by commit
:::::: 64e049102d3de3e61409cb6019403a9e689dfda6 [PATCH] USB: usbnet (8/9) m=
odule for RNDIS devices

:::::: TO: David Brownell <david-b@pacbell.net>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6625002431206810914==--

