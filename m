Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C11B243964
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 05:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782971662; cv=none; b=Y6LRnniy93Fcoo3JDyswj3FhM/N7/w55tdQvjac5/Jfm5vtTSETGm3z+nxfK7OuJbcDOy8F+U04ZyR5K5UsHEYi1cUYiAi7y85S/cHuLWrXZ77vKzRzFZMP89P4dqjeoFmSEHVJm98iArP/8ApZwOCeYqekvuqUUzNDC+x0t9D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782971662; c=relaxed/simple;
	bh=b/AVODv8G6ZpAACCUb4hRVfRgIaL1ai9yrHdplAsa7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hu8hxF6bg/lzwU97ArdeOOYbMrrY/+YppyYA4hTp8Tk1qaSqF4QJKM0CRgxoh7p+8iWNEUgRbD1x7CDSUs7f9SmgRK1MYrng8GdY6X1o9h52X6x0M0rdQ12HNWnVi/zSVTAM8z7nnwEWP1nbgX/MYATS6XhGBUITJX0tOCkk9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFHVMwDx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFHVMwDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782971660; x=1814507660;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b/AVODv8G6ZpAACCUb4hRVfRgIaL1ai9yrHdplAsa7Y=;
  b=RFHVMwDxbmUZstlBdHFUX9WZ78FJNv/wxR9rxBCiVCpuPtq2ilAmadUr
   7PnWUjawyKOTS1vjf2igQmqI8OtGDDr4X/hk/c/SBYE77pZTpGKUMZ2vx
   42NFtC8bYXwCLUZfH/r8n/leOHd5PuNct6bY8ao7tR0zC+FrfEX45YxfC
   KHzxW3ifwHfJDX4e7gC1bR0KPKroIJ40K3u1OzKbNVy3KZW5Y3qPSXUXA
   SAg7ZQVTTlMyXP73+lerFQgo5tI2T+Ix0fko9aU7/ENyO4tHepmyWDfZW
   nXm/NqEYtzFKRybYO23OFjZ+RTIwMj8wn0ZrV1X243yxeYx8W2LqPSQyr
   Q==;
X-CSE-ConnectionGUID: ud+wgCikRsCEjC4DSabtSw==
X-CSE-MsgGUID: aJ5baGZbQ7SNUHKYCeFceQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87627456"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87627456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 22:54:19 -0700
X-CSE-ConnectionGUID: I72aaoB6TumGZF3BL0VB4A==
X-CSE-MsgGUID: Uyax1jFgRNSIowUw75XGzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251032301"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2026 22:54:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfANL-00000000A4F-0GJT;
	Thu, 02 Jul 2026 05:54:15 +0000
Date: Thu, 02 Jul 2026 13:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ipv4/fib_semantics.c:1552 fib_create_info() error: we
 previously assumed 'nh' could be null (see line 1423)
Message-ID: <202607021349.s3Y31mqo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler=
-assisted type-based slab cache partitioning
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/202607=
02/202607021349.s3Y31mqo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab=
 cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021349.s3Y31mqo-lkp@intel.com/

smatch warnings:
net/ipv4/fib_semantics.c:1552 fib_create_info() error: we previously assume=
d 'nh' could be null (see line 1423)

vim +/nh +1552 net/ipv4/fib_semantics.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1397 =20
9f7f3ebeba9388 Kuniyuki Iwashima 2025-02-27  1398  	fib_info_hash_grow(net);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1399 =20
323bbfcf1ef883 Linus Torvalds    2026-02-21  1400  	fi =3D kzalloc_flex(*fi=
, fib_nh, nhs);
cfc47029fa124e Kuniyuki Iwashima 2025-02-27  1401  	if (!fi) {
cfc47029fa124e Kuniyuki Iwashima 2025-02-27  1402  		err =3D -ENOBUFS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1403  		goto failure;
cfc47029fa124e Kuniyuki Iwashima 2025-02-27  1404  	}
cfc47029fa124e Kuniyuki Iwashima 2025-02-27  1405 =20
61e2bbafb00e4b Jason Xing        2024-05-31  1406  	fi->fib_metrics =3D ip_=
fib_metrics_init(cfg->fc_mx, cfg->fc_mx_len, extack);
88e235b80c2ad9 Enrico Weigelt    2019-06-05  1407  	if (IS_ERR(fi->fib_metr=
ics)) {
767a2217533fed David Ahern       2018-10-04  1408  		err =3D PTR_ERR(fi->fi=
b_metrics);
187e5b3ac84d34 Eric Dumazet      2017-08-15  1409  		kfree(fi);
187e5b3ac84d34 Eric Dumazet      2017-08-15  1410  		return ERR_PTR(err);
187e5b3ac84d34 Eric Dumazet      2017-08-15  1411  	}
767a2217533fed David Ahern       2018-10-04  1412 =20
efd7ef1c1929d7 Eric W. Biederman 2015-03-11  1413  	fi->fib_net =3D net;
4e902c57417c4c Thomas Graf       2006-08-17  1414  	fi->fib_protocol =3D cf=
g->fc_protocol;
37e826c5138830 David S. Miller   2011-03-24  1415  	fi->fib_scope =3D cfg->=
fc_scope;
4e902c57417c4c Thomas Graf       2006-08-17  1416  	fi->fib_flags =3D cfg->=
fc_flags;
4e902c57417c4c Thomas Graf       2006-08-17  1417  	fi->fib_priority =3D cf=
g->fc_priority;
4e902c57417c4c Thomas Graf       2006-08-17  1418  	fi->fib_prefsrc =3D cfg=
->fc_prefsrc;
f4ef85bbda9632 Eric Dumazet      2012-10-04  1419  	fi->fib_type =3D cfg->f=
c_type;
5a56a0b3a45dd0 Mark Tomlinson    2016-09-05  1420  	fi->fib_tb_id =3D cfg->=
fc_table;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1421 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  1422  	fi->fib_nhs =3D nhs;
4c7e8084fd467d David Ahern       2019-06-03 @1423  	if (nh) {
4c7e8084fd467d David Ahern       2019-06-03  1424  		if (!nexthop_get(nh)) {
4c7e8084fd467d David Ahern       2019-06-03  1425  			NL_SET_ERR_MSG(extack=
, "Nexthop has been deleted");
4c7e8084fd467d David Ahern       2019-06-03  1426  			err =3D -EINVAL;
4c7e8084fd467d David Ahern       2019-06-03  1427  		} else {
4c7e8084fd467d David Ahern       2019-06-03  1428  			err =3D 0;
4c7e8084fd467d David Ahern       2019-06-03  1429  			fi->nh =3D nh;
4c7e8084fd467d David Ahern       2019-06-03  1430  		}
4c7e8084fd467d David Ahern       2019-06-03  1431  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1432  		change_nexthops(fi) {
71fceff0ea36d5 David S. Miller   2010-01-15  1433  			nexthop_nh->nh_parent=
 =3D fi;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1434  		} endfor_nexthops(fi)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1435 =20
e4516ef65490ef David Ahern       2019-03-27  1436  		if (cfg->fc_mp)
4c7e8084fd467d David Ahern       2019-06-03  1437  			err =3D fib_get_nhs(f=
i, cfg->fc_mp, cfg->fc_mp_len, cfg,
4c7e8084fd467d David Ahern       2019-06-03  1438  					  extack);
e4516ef65490ef David Ahern       2019-03-27  1439  		else
e4516ef65490ef David Ahern       2019-03-27  1440  			err =3D fib_nh_init(n=
et, fi->fib_nh, cfg, 1, extack);
4c7e8084fd467d David Ahern       2019-06-03  1441  	}
571e722676fe38 Roopa Prabhu      2015-07-21  1442 =20
e4516ef65490ef David Ahern       2019-03-27  1443  	if (err !=3D 0)
571e722676fe38 Roopa Prabhu      2015-07-21  1444  		goto failure;
571e722676fe38 Roopa Prabhu      2015-07-21  1445 =20
4e902c57417c4c Thomas Graf       2006-08-17  1446  	if (fib_props[cfg->fc_t=
ype].error) {
f35b794b3b405e David Ahern       2019-04-05  1447  		if (cfg->fc_gw_family =
|| cfg->fc_oif || cfg->fc_mp) {
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1448  			NL_SET_ERR_MSG(extack,
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1449  				       "Gateway, dev=
ice and multipath can not be specified for this route type");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1450  			goto err_inval;
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1451  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1452  		goto link_it;
4c8237cd76a051 David S. Miller   2011-03-07  1453  	} else {
4c8237cd76a051 David S. Miller   2011-03-07  1454  		switch (cfg->fc_type) {
4c8237cd76a051 David S. Miller   2011-03-07  1455  		case RTN_UNICAST:
4c8237cd76a051 David S. Miller   2011-03-07  1456  		case RTN_LOCAL:
4c8237cd76a051 David S. Miller   2011-03-07  1457  		case RTN_BROADCAST:
4c8237cd76a051 David S. Miller   2011-03-07  1458  		case RTN_ANYCAST:
4c8237cd76a051 David S. Miller   2011-03-07  1459  		case RTN_MULTICAST:
4c8237cd76a051 David S. Miller   2011-03-07  1460  			break;
4c8237cd76a051 David S. Miller   2011-03-07  1461  		default:
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1462  			NL_SET_ERR_MSG(extack=
, "Invalid route type");
4c8237cd76a051 David S. Miller   2011-03-07  1463  			goto err_inval;
4c8237cd76a051 David S. Miller   2011-03-07  1464  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1465  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1466 =20
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1467  	if (cfg->fc_scope > RT_=
SCOPE_HOST) {
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1468  		NL_SET_ERR_MSG(extack,=
 "Invalid scope");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1469  		goto err_inval;
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1470  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1471 =20
4c7e8084fd467d David Ahern       2019-06-03  1472  	if (fi->nh) {
4c7e8084fd467d David Ahern       2019-06-03  1473  		err =3D fib_check_next=
hop(fi->nh, cfg->fc_scope, extack);
4c7e8084fd467d David Ahern       2019-06-03  1474  		if (err)
4c7e8084fd467d David Ahern       2019-06-03  1475  			goto failure;
4c7e8084fd467d David Ahern       2019-06-03  1476  	} else if (cfg->fc_scop=
e =3D=3D RT_SCOPE_HOST) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1477  		struct fib_nh *nh =3D =
fi->fib_nh;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1478 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  1479  		/* Local address is ad=
ded. */
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1480  		if (nhs !=3D 1) {
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1481  			NL_SET_ERR_MSG(extack,
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1482  				       "Route with h=
ost scope can not have multiple nexthops");
6d8422a175ccf2 David Ahern       2017-05-21  1483  			goto err_inval;
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1484  		}
bdf004677107e3 David Ahern       2019-04-05  1485  		if (nh->fib_nh_gw_fami=
ly) {
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1486  			NL_SET_ERR_MSG(extack,
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1487  				       "Route with h=
ost scope can not have a gateway");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1488  			goto err_inval;
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1489  		}
b75ed8b1aa9c3a David Ahern       2019-03-27  1490  		nh->fib_nh_scope =3D R=
T_SCOPE_NOWHERE;
5481d73f81549e David Ahern       2019-06-03  1491  		nh->fib_nh_dev =3D dev=
_get_by_index(net, nh->fib_nh_oif);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1492  		err =3D -ENODEV;
b75ed8b1aa9c3a David Ahern       2019-03-27  1493  		if (!nh->fib_nh_dev)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1494  			goto failure;
e44b14ebae1025 Eric Dumazet      2021-12-06  1495  		netdev_tracker_alloc(n=
h->fib_nh_dev, &nh->fib_nh_dev_tracker,
e44b14ebae1025 Eric Dumazet      2021-12-06  1496  				     GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1497  	} else {
8a3d03166f1932 Andy Gospodarek   2015-06-23  1498  		int linkdown =3D 0;
8a3d03166f1932 Andy Gospodarek   2015-06-23  1499 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  1500  		change_nexthops(fi) {
ac1fab2d139447 David Ahern       2019-05-22  1501  			err =3D fib_check_nh(=
cfg->fc_nlinfo.nl_net, nexthop_nh,
ac1fab2d139447 David Ahern       2019-05-22  1502  					   cfg->fc_table, c=
fg->fc_scope,
ac1fab2d139447 David Ahern       2019-05-22  1503  					   extack);
6a31d2a97c04ff Eric Dumazet      2010-10-04  1504  			if (err !=3D 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1505  				goto failure;
b75ed8b1aa9c3a David Ahern       2019-03-27  1506  			if (nexthop_nh->fib_n=
h_flags & RTNH_F_LINKDOWN)
8a3d03166f1932 Andy Gospodarek   2015-06-23  1507  				linkdown++;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1508  		} endfor_nexthops(fi)
8a3d03166f1932 Andy Gospodarek   2015-06-23  1509  		if (linkdown =3D=3D fi=
->fib_nhs)
8a3d03166f1932 Andy Gospodarek   2015-06-23  1510  			fi->fib_flags |=3D RT=
NH_F_LINKDOWN;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1511  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1512 =20
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1513  	if (fi->fib_prefsrc && =
!fib_valid_prefsrc(cfg, fi->fib_prefsrc)) {
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1514  		NL_SET_ERR_MSG(extack,=
 "Invalid prefsrc address");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1515  		goto err_inval;
c3ab2b4ec8f7c0 David Ahern       2017-05-21  1516  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1517 =20
4c7e8084fd467d David Ahern       2019-06-03  1518  	if (!fi->nh) {
1fc050a1347334 David S. Miller   2011-03-07  1519  		change_nexthops(fi) {
dcb1ecb50edf82 David Ahern       2019-06-03  1520  			fib_info_update_nhc_s=
addr(net, &nexthop_nh->nh_common,
dcb1ecb50edf82 David Ahern       2019-06-03  1521  						  fi->fib_scope);
19a9d136f198cd David Ahern       2019-04-05  1522  			if (nexthop_nh->fib_n=
h_gw_family =3D=3D AF_INET6)
19a9d136f198cd David Ahern       2019-04-05  1523  				fi->fib_nh_is_v6 =3D =
true;
1fc050a1347334 David S. Miller   2011-03-07  1524  		} endfor_nexthops(fi)
1fc050a1347334 David S. Miller   2011-03-07  1525 =20
0e884c78ee19e9 Peter N=C3=B8rlund     2015-09-30  1526  		fib_rebalance(fi);
4c7e8084fd467d David Ahern       2019-06-03  1527  	}
0e884c78ee19e9 Peter N=C3=B8rlund     2015-09-30  1528 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  1529  link_it:
6a31d2a97c04ff Eric Dumazet      2010-10-04  1530  	ofi =3D fib_find_info(f=
i);
6a31d2a97c04ff Eric Dumazet      2010-10-04  1531  	if (ofi) {
fce92af1c29d90 Eric Dumazet      2023-08-30  1532  		/* fib_table_lookup() =
should not see @fi yet. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1533  		fi->fib_dead =3D 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1534  		free_fib_info(fi);
79976892f7ea37 Yajun Deng        2021-07-29  1535  		refcount_inc(&ofi->fib=
_treeref);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1536  		return ofi;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1537  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1538 =20
28814cd18cd7bf David Ahern       2021-08-02  1539  	refcount_set(&fi->fib_t=
reeref, 1);
0029c0deb590bc Reshetova, Elena  2017-07-04  1540  	refcount_set(&fi->fib_c=
lntref, 1);
143ca845ec0c62 Eric Dumazet      2024-10-04  1541 =20
9f7f3ebeba9388 Kuniyuki Iwashima 2025-02-27  1542  	net->ipv4.fib_info_cnt+=
+;
84c75e94ecee7d Kuniyuki Iwashima 2025-02-27  1543  	hlist_add_head(&fi->fib=
_hash, fib_info_hash_bucket(fi));
84c75e94ecee7d Kuniyuki Iwashima 2025-02-27  1544 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  1545  	if (fi->fib_prefsrc) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1546  		struct hlist_head *hea=
d;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1547 =20
79eb15da3cd68f Eric Dumazet      2022-01-19  1548  		head =3D fib_info_ladd=
rhash_bucket(net, fi->fib_prefsrc);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1549  		hlist_add_head(&fi->fi=
b_lhash, head);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1550  	}
4c7e8084fd467d David Ahern       2019-06-03  1551  	if (fi->nh) {
4c7e8084fd467d David Ahern       2019-06-03 @1552  		list_add(&fi->nh_list,=
 &nh->fi_list);
4c7e8084fd467d David Ahern       2019-06-03  1553  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1554  		change_nexthops(fi) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1555  			struct hlist_head *he=
ad;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1556 =20
b75ed8b1aa9c3a David Ahern       2019-03-27  1557  			if (!nexthop_nh->fib_=
nh_dev)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1558  				continue;
a3f5f4c2f9b6bc Eric Dumazet      2024-10-04  1559  			head =3D fib_nh_head(=
nexthop_nh->fib_nh_dev);
fc38b28365e5f1 Eric Dumazet      2024-10-04  1560  			hlist_add_head_rcu(&n=
exthop_nh->nh_hash, head);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1561  		} endfor_nexthops(fi)
4c7e8084fd467d David Ahern       2019-06-03  1562  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1563  	return fi;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1564 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  1565  err_inval:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1566  	err =3D -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1567 =20
^1da177e4c3f41 Linus Torvalds    2005-04-16  1568  failure:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1569  	if (fi) {
fce92af1c29d90 Eric Dumazet      2023-08-30  1570  		/* fib_table_lookup() =
should not see @fi yet. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1571  		fi->fib_dead =3D 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1572  		free_fib_info(fi);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1573  	}
4e902c57417c4c Thomas Graf       2006-08-17  1574 =20
4e902c57417c4c Thomas Graf       2006-08-17  1575  	return ERR_PTR(err);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1576  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1577 =20

:::::: The code at line 1552 was first introduced by commit
:::::: 4c7e8084fd467ddb2b0e6c6011f9c1064afb7e56 ipv4: Plumb support for nex=
thop object in a fib_info

:::::: TO: David Ahern <dsahern@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
