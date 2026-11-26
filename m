Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717769;
	b=CEJFLvOO8EDOJEOYiar06x5dtN2v73Ed5okBPfOCxLFotuy9YZv8G0MJ8mdjoENZRCfj
	 rWqtu6U9RNlEXYL9cRjLs6iVu/p/x+RUPANFsBjeMo56b8gRIKLhAU6vE8un8EYysmUYw
	 TbTi+PWEkwLeSvpeM/tjiEWKEyb8/X4eQu9/NVcLDQ9meXAOTnNbMU9EUNmK4xX6mt7W3
	 RJt6s6VwU7KBYDAIPlz1fCNnyzbKvHNlEkRbL9c9l6+dMpcWqmLTlPYD0MqBJZ0ER+pSE
	 YjUXOY7eILUUeOvRnbrLaD3ZLJH7yg1H/ESHubKMmlxyv0iazvJtyOroNRvV1gZdqLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717769;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0fJuZpMkontnHjSXegnGpZw0Kc+nZ1C6tYXo/mCYuzU=;
	b=zv0LoKurw/0TgtYmQ9RVwiweVcrN2sRKON/8hfaCs33MXr1A9mcjv79Ze/fXZXYVQutz
	 PPBiOyn1e4UwLP+lbU6umI+52SBEcF0mWtwsF/84zfjaMNc6JG0xagdTVo7C45x4YxHjI
	 sHKXQjW/JS3KXP0JuyJ4RsP7VL7gZ8WWIgwFcg5LdwSADBiEHmXQ/Cm5EKHzBQapGyZXL
	 1QJzWBTeTmpj+zH9UVgKase+RGy0QXRkhHwZ0Th9qJsEeFKEaSAPDUTMPjbb8egG80bSB
	 W+WpUH0ju0zrvcXJgMR3Mcm75CJBfbKWwqm7/LvYahKMJmTAscUWW7tiDNSY8FSWFjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="BlQFuZY/";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED6606A31E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 18:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30ED6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BlQFuZY/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795717768; x=1827253768;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bLy+yTpy4HtmOKGV3DCMMIXNqeMFVTkxqw8gMJ37fF0=;
  b=BlQFuZY/gcNZQK69Lp29DFXK5GmzNIJQrP9HE411+chTaiEGjWCkYP4e
   9eLQgplEReS7cEJMN64GzX0igvv7a8pvh7dZsroRxtXSmhirqzJB6HlgF
   iVTqA3bzaLz6ixjJrnRmpguR2rkvo0wqugrhjimuU2sIQJ657Jj93molS
   FYilmJUNYl3MknX2UFPtudelJQnhXSm5/35DgjEu5VQF4t94LElIj1die
   ZbkxpAXO0xS313S7U0KyQtYFHjq5k6oD0zMZiNm5bke/jq9yeIHgN56N7
   itm6nkkk5n6+gIFzMBIUSZj4j1t8T7q2rK4AkrrCazLctaIbBS3WEB8Mj
   w==;
X-CSE-ConnectionGUID: 6RKcVaCZQe6uLvEr67wXag==
X-CSE-MsgGUID: dALYiFodSL682TM7QEFYHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4722582"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4722582"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 10:29:27 -0800
X-CSE-ConnectionGUID: JzGHSlW5QQKouPBD231bMQ==
X-CSE-MsgGUID: KXisSmv+RgS4CZcMA6/BRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12734980"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2026 10:29:25 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWeDj-0000000009S-1YoY;
	Thu, 26 Nov 2026 18:29:23 +0000
Date: Thu, 26 Nov 2026 19:29:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [net-next:main 30/33] net/bridge/br_forward.c:437
 br_multicast_flood() error: we previously assumed 'rpmctx' could be null (see
 line 420)
Message-ID: <20261126192319.Gz4vWo6I-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: netdev@vger.kernel.org
TO: Nikolay Aleksandrov <razor@blackwall.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
main
head:   ccb81d5e317b0ae2cc66ca1c628c0ca907928f94
commit: 2661ecf12be7ecd87cf8678bbb4990c1c34a7175 [30/33] net: bridge: avoid=
 VLAN lookups for multicast router forwarding
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: sparc-randconfig-2200-20261126 (https://download.01.org/0day-ci/arc=
hive/20261126/20261126192319.Gz4vWo6I-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261126192319.Gz4vWo6I-lkp@intel.com/

New smatch warnings:
net/bridge/br_forward.c:437 br_multicast_flood() error: we previously assum=
ed 'rpmctx' could be null (see line 420)

Old smatch warnings:
net/bridge/br_forward.c:447 br_multicast_flood() error: we previously assum=
ed 'p' could be null (see line 418)

vim +/rpmctx +437 net/bridge/br_forward.c

5b9d6b154a622d Arnd Bergmann       2017-01-25  388 =20
5cb5e947d8f820 Herbert Xu          2010-02-27  389  /* called with rcu_read=
_lock */
37b090e6be2dc9 Nikolay Aleksandrov 2016-07-14  390  void br_multicast_flood=
(struct net_bridge_mdb_entry *mdst,
b35c5f632b6301 Nikolay Aleksandrov 2016-07-14  391  			struct sk_buff *skb,
adc47037a7d5c8 Nikolay Aleksandrov 2021-07-19  392  			struct net_bridge_mc=
ast *brmctx,
37b090e6be2dc9 Nikolay Aleksandrov 2016-07-14  393  			bool local_rcv, bool=
 local_orig)
5cb5e947d8f820 Herbert Xu          2010-02-27  394  {
5cb5e947d8f820 Herbert Xu          2010-02-27  395  	struct net_bridge_port=
_group *p;
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  396  	bool allow_mode_includ=
e =3D true;
911afcbaa7cd63 Nikolay Aleksandrov 2026-09-18  397  	struct br_fwd_dst prev=
 =3D {};
5cb5e947d8f820 Herbert Xu          2010-02-27  398  	struct hlist_node *rp;
911afcbaa7cd63 Nikolay Aleksandrov 2026-09-18  399  	int err =3D 0;
5cb5e947d8f820 Herbert Xu          2010-02-27  400 =20
adc47037a7d5c8 Nikolay Aleksandrov 2021-07-19  401  	rp =3D br_multicast_ge=
t_first_rport_node(brmctx, skb);
44ebb081dc6934 Linus L=C3=BCssing       2021-05-13  402 =20
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  403  	if (mdst) {
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  404  		p =3D rcu_dereference=
(mdst->ports);
adc47037a7d5c8 Nikolay Aleksandrov 2021-07-19  405  		if (br_multicast_shou=
ld_handle_mode(brmctx, mdst->addr.proto) &&
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  406  		    br_multicast_is_s=
tar_g(&mdst->addr))
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  407  			allow_mode_include =
=3D false;
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  408  	} else {
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  409  		p =3D NULL;
7b4858df3bf7a8 Ido Schimmel        2023-05-29  410  		br_tc_skb_miss_set(sk=
b, true);
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  411  	}
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  412 =20
5cb5e947d8f820 Herbert Xu          2010-02-27  413  	while (p || rp) {
afe0159d935ab7 stephen hemminger   2010-04-27  414  		struct net_bridge_por=
t *port, *lport, *rport;
2661ecf12be7ec Nikolay Aleksandrov 2026-11-23  415  		struct net_bridge_mca=
st_port *rpmctx;
911afcbaa7cd63 Nikolay Aleksandrov 2026-09-18  416  		struct br_fwd_dst fwd=
 =3D {};
afe0159d935ab7 stephen hemminger   2010-04-27  417 =20
085b53c8beabf9 Nikolay Aleksandrov 2020-09-22  418  		lport =3D p ? p->key.=
port : NULL;
2661ecf12be7ec Nikolay Aleksandrov 2026-11-23  419  		rpmctx =3D br_multica=
st_rport_ctx_from_node_skb(rp, skb);
2661ecf12be7ec Nikolay Aleksandrov 2026-11-23 @420  		rport =3D rpmctx ? rp=
mctx->port : NULL;
5cb5e947d8f820 Herbert Xu          2010-02-27  421 =20
6db6f0eae6052b Felix Fietkau       2017-01-21  422  		if ((unsigned long)lp=
ort > (unsigned long)rport) {
6db6f0eae6052b Felix Fietkau       2017-01-21  423  			port =3D lport;
6db6f0eae6052b Felix Fietkau       2017-01-21  424 =20
65b8de45ae05b9 Eric Dumazet        2026-06-11  425  			if (test_bit(BR_MULT=
ICAST_TO_UNICAST_BIT,
65b8de45ae05b9 Eric Dumazet        2026-06-11  426  				     &port->flags))=
 {
6db6f0eae6052b Felix Fietkau       2017-01-21  427  				maybe_deliver_addr(=
lport, skb, p->eth_addr,
6db6f0eae6052b Felix Fietkau       2017-01-21  428  						   local_orig);
6db6f0eae6052b Felix Fietkau       2017-01-21  429  				goto delivered;
6db6f0eae6052b Felix Fietkau       2017-01-21  430  			}
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  431  			if ((!allow_mode_inc=
lude &&
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  432  			     p->filter_mode =
=3D=3D MCAST_INCLUDE) ||
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  433  			    (p->flags & MDB_=
PG_FLAGS_BLOCKED))
36cfec73595ccb Nikolay Aleksandrov 2020-09-22  434  				goto delivered;
6db6f0eae6052b Felix Fietkau       2017-01-21  435  		} else {
6db6f0eae6052b Felix Fietkau       2017-01-21  436  			port =3D rport;
2661ecf12be7ec Nikolay Aleksandrov 2026-11-23 @437  			fwd.vlan =3D rpmctx-=
>vlan;

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
