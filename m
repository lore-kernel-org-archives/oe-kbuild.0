Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6C191F84
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 03:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755400025; cv=none; b=jjGkQiZdRAPjqhYo7RQ38bqafKuQmeNUVw10tIGfxymKNabx379vnGrTzDsfdVwLKyNMTFSTT5u8URyUvBk5UzoaAjMn9FxehTyJHTE1H72czGPygN2nin847dvdVNUAcVubqm4OQdY9EET5nM0twjPkP8ShMS5d10x4efiZGOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755400025; c=relaxed/simple;
	bh=oYiwgRqQsj2z0nxqGUOqt2t06dhJf7v9ej8OKTmrmo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTQexAM18WmNZGUtWH/HKqbZTJvZxXMnMov/6bI9rSm+8nKD8ihFcYq7dZ5qrAKARd/estqzYprcz2JPjZmMggxrwCiEER0mue8lKhhNFb3wSjqKI5xpy436WFnsOhpexJMaLSQHLUkPKmXJBj9Kyr9+AUdDjhQeqvSXpaS0r8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaK6Blw4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaK6Blw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755400023; x=1786936023;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oYiwgRqQsj2z0nxqGUOqt2t06dhJf7v9ej8OKTmrmo4=;
  b=MaK6Blw4ewY9qDwv9FF+QfufIqF8a8M8nO13x2eE/M3bu+lS5GFmir7y
   vFjvjW3sBn5btIaZmvjA03ZVTvdH0wVet8GHlNzr0jvJjXZqNRqand0Bu
   OVGaKJOnLYGg9x02arSAwRlXSZmeG+qhgYB3OnQrLbHm8Jpk4kZGnlk78
   EYWFCNpDwB2xCMKMdiB6eTuVzNITqOlPFafwtQIZMEC/GI7AQzzZanK9B
   KesGPJumrf91cvZdnXK8jdnLbw3OvNMNtYpAqJrEc9st5BirYkkgu4Kh3
   2KYdWS5Jt9JepRoIIVX0wZE1LBysMRSo32GHlkmuMNeKqIKKtVozl1K4v
   w==;
X-CSE-ConnectionGUID: iBqdyjbHTAmaRIQOgEP3dg==
X-CSE-MsgGUID: zUQxQPdoTjiiVLwpa2pqNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57741092"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57741092"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 20:07:02 -0700
X-CSE-ConnectionGUID: MUGYZJ6mS0GT5Z9ebH3cxw==
X-CSE-MsgGUID: dctk313sTAmixL9JMIqI3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172637349"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Aug 2025 20:07:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unTjW-000DKV-0f;
	Sun, 17 Aug 2025 03:06:58 +0000
Date: Sun, 17 Aug 2025 11:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 1/2] xsk: introduce XDP_GENERIC_XMIT_BATCH
 setsockopt
Message-ID: <202508171049.SGYNFbP3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250811131236.56206-2-kerneljasonxing@gmail.com>
References: <20250811131236.56206-2-kerneljasonxing@gmail.com>
TO: Jason Xing <kerneljasonxing@gmail.com>
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: bjorn@kernel.org
TO: magnus.karlsson@intel.com
TO: maciej.fijalkowski@intel.com
TO: jonathan.lemon@gmail.com
TO: sdf@fomichev.me
TO: ast@kernel.org
TO: daniel@iogearbox.net
TO: hawk@kernel.org
TO: john.fastabend@gmail.com
TO: horms@kernel.org
TO: andrew+netdev@lunn.ch
CC: bpf@vger.kernel.org
CC: netdev@vger.kernel.org
CC: Jason Xing <kernelxing@tencent.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/xsk-introduce-XDP_GENERIC_XMIT_BATCH-setsockopt/20250811-211509
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250811131236.56206-2-kerneljasonxing%40gmail.com
patch subject: [PATCH net-next 1/2] xsk: introduce XDP_GENERIC_XMIT_BATCH setsockopt
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: s390-randconfig-r073-20250817 (https://download.01.org/0day-ci/archive/20250817/202508171049.SGYNFbP3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508171049.SGYNFbP3-lkp@intel.com/

smatch warnings:
net/xdp/xsk.c:1495 xsk_setsockopt() warn: inconsistent returns '&xs->mutex'.

vim +1495 net/xdp/xsk.c

c05cd364581472 Kevin Laatz        2019-08-27  1343  
c0c77d8fb787cf Björn Töpel        2018-05-02  1344  static int xsk_setsockopt(struct socket *sock, int level, int optname,
a7b75c5a8c4144 Christoph Hellwig  2020-07-23  1345  			  sockptr_t optval, unsigned int optlen)
c0c77d8fb787cf Björn Töpel        2018-05-02  1346  {
c0c77d8fb787cf Björn Töpel        2018-05-02  1347  	struct sock *sk = sock->sk;
c0c77d8fb787cf Björn Töpel        2018-05-02  1348  	struct xdp_sock *xs = xdp_sk(sk);
c0c77d8fb787cf Björn Töpel        2018-05-02  1349  	int err;
c0c77d8fb787cf Björn Töpel        2018-05-02  1350  
c0c77d8fb787cf Björn Töpel        2018-05-02  1351  	if (level != SOL_XDP)
c0c77d8fb787cf Björn Töpel        2018-05-02  1352  		return -ENOPROTOOPT;
c0c77d8fb787cf Björn Töpel        2018-05-02  1353  
c0c77d8fb787cf Björn Töpel        2018-05-02  1354  	switch (optname) {
b9b6b68e8abd10 Björn Töpel        2018-05-02  1355  	case XDP_RX_RING:
f61459030ec7ff Magnus Karlsson    2018-05-02  1356  	case XDP_TX_RING:
b9b6b68e8abd10 Björn Töpel        2018-05-02  1357  	{
b9b6b68e8abd10 Björn Töpel        2018-05-02  1358  		struct xsk_queue **q;
b9b6b68e8abd10 Björn Töpel        2018-05-02  1359  		int entries;
b9b6b68e8abd10 Björn Töpel        2018-05-02  1360  
b9b6b68e8abd10 Björn Töpel        2018-05-02  1361  		if (optlen < sizeof(entries))
b9b6b68e8abd10 Björn Töpel        2018-05-02  1362  			return -EINVAL;
a7b75c5a8c4144 Christoph Hellwig  2020-07-23  1363  		if (copy_from_sockptr(&entries, optval, sizeof(entries)))
b9b6b68e8abd10 Björn Töpel        2018-05-02  1364  			return -EFAULT;
b9b6b68e8abd10 Björn Töpel        2018-05-02  1365  
b9b6b68e8abd10 Björn Töpel        2018-05-02  1366  		mutex_lock(&xs->mutex);
455302d1c9ae93 Ilya Maximets      2019-06-28  1367  		if (xs->state != XSK_READY) {
455302d1c9ae93 Ilya Maximets      2019-06-28  1368  			mutex_unlock(&xs->mutex);
455302d1c9ae93 Ilya Maximets      2019-06-28  1369  			return -EBUSY;
455302d1c9ae93 Ilya Maximets      2019-06-28  1370  		}
f61459030ec7ff Magnus Karlsson    2018-05-02  1371  		q = (optname == XDP_TX_RING) ? &xs->tx : &xs->rx;
b9b6b68e8abd10 Björn Töpel        2018-05-02  1372  		err = xsk_init_queue(entries, q, false);
77cd0d7b3f257f Magnus Karlsson    2019-08-14  1373  		if (!err && optname == XDP_TX_RING)
77cd0d7b3f257f Magnus Karlsson    2019-08-14  1374  			/* Tx needs to be explicitly woken up the first time */
77cd0d7b3f257f Magnus Karlsson    2019-08-14  1375  			xs->tx->ring->flags |= XDP_RING_NEED_WAKEUP;
b9b6b68e8abd10 Björn Töpel        2018-05-02  1376  		mutex_unlock(&xs->mutex);
b9b6b68e8abd10 Björn Töpel        2018-05-02  1377  		return err;
b9b6b68e8abd10 Björn Töpel        2018-05-02  1378  	}
c0c77d8fb787cf Björn Töpel        2018-05-02  1379  	case XDP_UMEM_REG:
c0c77d8fb787cf Björn Töpel        2018-05-02  1380  	{
c05cd364581472 Kevin Laatz        2019-08-27  1381  		size_t mr_size = sizeof(struct xdp_umem_reg);
c05cd364581472 Kevin Laatz        2019-08-27  1382  		struct xdp_umem_reg mr = {};
c0c77d8fb787cf Björn Töpel        2018-05-02  1383  		struct xdp_umem *umem;
c0c77d8fb787cf Björn Töpel        2018-05-02  1384  
c05cd364581472 Kevin Laatz        2019-08-27  1385  		if (optlen < sizeof(struct xdp_umem_reg_v1))
c05cd364581472 Kevin Laatz        2019-08-27  1386  			return -EINVAL;
341ac980eab90a Stanislav Fomichev 2023-11-27  1387  		else if (optlen < sizeof(mr))
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1388  			mr_size = sizeof(struct xdp_umem_reg_v1);
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1389  
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1390  		BUILD_BUG_ON(sizeof(struct xdp_umem_reg_v1) >= sizeof(struct xdp_umem_reg));
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1391  
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1392  		/* Make sure the last field of the struct doesn't have
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1393  		 * uninitialized padding. All padding has to be explicit
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1394  		 * and has to be set to zero by the userspace to make
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1395  		 * struct xdp_umem_reg extensible in the future.
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1396  		 */
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1397  		BUILD_BUG_ON(offsetof(struct xdp_umem_reg, tx_metadata_len) +
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1398  			     sizeof_field(struct xdp_umem_reg, tx_metadata_len) !=
32654bbd6313b4 Stanislav Fomichev 2024-07-26  1399  			     sizeof(struct xdp_umem_reg));
c05cd364581472 Kevin Laatz        2019-08-27  1400  
a7b75c5a8c4144 Christoph Hellwig  2020-07-23  1401  		if (copy_from_sockptr(&mr, optval, mr_size))
c0c77d8fb787cf Björn Töpel        2018-05-02  1402  			return -EFAULT;
c0c77d8fb787cf Björn Töpel        2018-05-02  1403  
c0c77d8fb787cf Björn Töpel        2018-05-02  1404  		mutex_lock(&xs->mutex);
455302d1c9ae93 Ilya Maximets      2019-06-28  1405  		if (xs->state != XSK_READY || xs->umem) {
a49049ea257656 Björn Töpel        2018-05-22  1406  			mutex_unlock(&xs->mutex);
a49049ea257656 Björn Töpel        2018-05-22  1407  			return -EBUSY;
a49049ea257656 Björn Töpel        2018-05-22  1408  		}
c0c77d8fb787cf Björn Töpel        2018-05-02  1409  
a49049ea257656 Björn Töpel        2018-05-22  1410  		umem = xdp_umem_create(&mr);
a49049ea257656 Björn Töpel        2018-05-22  1411  		if (IS_ERR(umem)) {
c0c77d8fb787cf Björn Töpel        2018-05-02  1412  			mutex_unlock(&xs->mutex);
a49049ea257656 Björn Töpel        2018-05-22  1413  			return PTR_ERR(umem);
c0c77d8fb787cf Björn Töpel        2018-05-02  1414  		}
c0c77d8fb787cf Björn Töpel        2018-05-02  1415  
c0c77d8fb787cf Björn Töpel        2018-05-02  1416  		/* Make sure umem is ready before it can be seen by others */
c0c77d8fb787cf Björn Töpel        2018-05-02  1417  		smp_wmb();
9764f4b301c3e7 Björn Töpel        2019-09-04  1418  		WRITE_ONCE(xs->umem, umem);
c0c77d8fb787cf Björn Töpel        2018-05-02  1419  		mutex_unlock(&xs->mutex);
c0c77d8fb787cf Björn Töpel        2018-05-02  1420  		return 0;
c0c77d8fb787cf Björn Töpel        2018-05-02  1421  	}
423f38329d2679 Magnus Karlsson    2018-05-02  1422  	case XDP_UMEM_FILL_RING:
fe2308328cd2f2 Magnus Karlsson    2018-05-02  1423  	case XDP_UMEM_COMPLETION_RING:
423f38329d2679 Magnus Karlsson    2018-05-02  1424  	{
423f38329d2679 Magnus Karlsson    2018-05-02  1425  		struct xsk_queue **q;
423f38329d2679 Magnus Karlsson    2018-05-02  1426  		int entries;
423f38329d2679 Magnus Karlsson    2018-05-02  1427  
237f3cf13b20db Eric Dumazet       2024-04-04  1428  		if (optlen < sizeof(entries))
237f3cf13b20db Eric Dumazet       2024-04-04  1429  			return -EINVAL;
a7b75c5a8c4144 Christoph Hellwig  2020-07-23  1430  		if (copy_from_sockptr(&entries, optval, sizeof(entries)))
423f38329d2679 Magnus Karlsson    2018-05-02  1431  			return -EFAULT;
423f38329d2679 Magnus Karlsson    2018-05-02  1432  
423f38329d2679 Magnus Karlsson    2018-05-02  1433  		mutex_lock(&xs->mutex);
455302d1c9ae93 Ilya Maximets      2019-06-28  1434  		if (xs->state != XSK_READY) {
455302d1c9ae93 Ilya Maximets      2019-06-28  1435  			mutex_unlock(&xs->mutex);
455302d1c9ae93 Ilya Maximets      2019-06-28  1436  			return -EBUSY;
455302d1c9ae93 Ilya Maximets      2019-06-28  1437  		}
a49049ea257656 Björn Töpel        2018-05-22  1438  
7361f9c3d71955 Magnus Karlsson    2020-08-28  1439  		q = (optname == XDP_UMEM_FILL_RING) ? &xs->fq_tmp :
7361f9c3d71955 Magnus Karlsson    2020-08-28  1440  			&xs->cq_tmp;
b9b6b68e8abd10 Björn Töpel        2018-05-02  1441  		err = xsk_init_queue(entries, q, true);
423f38329d2679 Magnus Karlsson    2018-05-02  1442  		mutex_unlock(&xs->mutex);
423f38329d2679 Magnus Karlsson    2018-05-02  1443  		return err;
423f38329d2679 Magnus Karlsson    2018-05-02  1444  	}
45e359be1ce88f Jason Xing         2025-07-05  1445  	case XDP_MAX_TX_SKB_BUDGET:
45e359be1ce88f Jason Xing         2025-07-05  1446  	{
45e359be1ce88f Jason Xing         2025-07-05  1447  		unsigned int budget;
45e359be1ce88f Jason Xing         2025-07-05  1448  
45e359be1ce88f Jason Xing         2025-07-05  1449  		if (optlen != sizeof(budget))
45e359be1ce88f Jason Xing         2025-07-05  1450  			return -EINVAL;
45e359be1ce88f Jason Xing         2025-07-05  1451  		if (copy_from_sockptr(&budget, optval, sizeof(budget)))
45e359be1ce88f Jason Xing         2025-07-05  1452  			return -EFAULT;
45e359be1ce88f Jason Xing         2025-07-05  1453  		if (!xs->tx ||
45e359be1ce88f Jason Xing         2025-07-05  1454  		    budget < TX_BATCH_SIZE || budget > xs->tx->nentries)
45e359be1ce88f Jason Xing         2025-07-05  1455  			return -EACCES;
45e359be1ce88f Jason Xing         2025-07-05  1456  
45e359be1ce88f Jason Xing         2025-07-05  1457  		WRITE_ONCE(xs->max_tx_budget, budget);
45e359be1ce88f Jason Xing         2025-07-05  1458  		return 0;
45e359be1ce88f Jason Xing         2025-07-05  1459  	}
48248366d9de2a Jason Xing         2025-08-11  1460  	case XDP_GENERIC_XMIT_BATCH:
48248366d9de2a Jason Xing         2025-08-11  1461  	{
48248366d9de2a Jason Xing         2025-08-11  1462  		unsigned int batch, batch_alloc_len;
48248366d9de2a Jason Xing         2025-08-11  1463  		struct sk_buff **new;
48248366d9de2a Jason Xing         2025-08-11  1464  
48248366d9de2a Jason Xing         2025-08-11  1465  		if (optlen != sizeof(batch))
48248366d9de2a Jason Xing         2025-08-11  1466  			return -EINVAL;
48248366d9de2a Jason Xing         2025-08-11  1467  		if (copy_from_sockptr(&batch, optval, sizeof(batch)))
48248366d9de2a Jason Xing         2025-08-11  1468  			return -EFAULT;
48248366d9de2a Jason Xing         2025-08-11  1469  		if (batch > xs->max_tx_budget)
48248366d9de2a Jason Xing         2025-08-11  1470  			return -EACCES;
48248366d9de2a Jason Xing         2025-08-11  1471  
48248366d9de2a Jason Xing         2025-08-11  1472  		mutex_lock(&xs->mutex);
48248366d9de2a Jason Xing         2025-08-11  1473  		if (!batch) {
48248366d9de2a Jason Xing         2025-08-11  1474  			kfree(xs->skb_batch);
48248366d9de2a Jason Xing         2025-08-11  1475  			xs->generic_xmit_batch = 0;
48248366d9de2a Jason Xing         2025-08-11  1476  			goto out;
48248366d9de2a Jason Xing         2025-08-11  1477  		}
48248366d9de2a Jason Xing         2025-08-11  1478  		batch_alloc_len = sizeof(struct sk_buff *) * batch;
48248366d9de2a Jason Xing         2025-08-11  1479  		new = kmalloc(batch_alloc_len, GFP_KERNEL);
48248366d9de2a Jason Xing         2025-08-11  1480  		if (!new)
48248366d9de2a Jason Xing         2025-08-11  1481  			return -ENOMEM;
48248366d9de2a Jason Xing         2025-08-11  1482  		if (xs->skb_batch)
48248366d9de2a Jason Xing         2025-08-11  1483  			kfree(xs->skb_batch);
48248366d9de2a Jason Xing         2025-08-11  1484  
48248366d9de2a Jason Xing         2025-08-11  1485  		xs->skb_batch = new;
48248366d9de2a Jason Xing         2025-08-11  1486  		xs->generic_xmit_batch = batch;
48248366d9de2a Jason Xing         2025-08-11  1487  out:
48248366d9de2a Jason Xing         2025-08-11  1488  		mutex_unlock(&xs->mutex);
48248366d9de2a Jason Xing         2025-08-11  1489  		return 0;
48248366d9de2a Jason Xing         2025-08-11  1490  	}
c0c77d8fb787cf Björn Töpel        2018-05-02  1491  	default:
c0c77d8fb787cf Björn Töpel        2018-05-02  1492  		break;
c0c77d8fb787cf Björn Töpel        2018-05-02  1493  	}
c0c77d8fb787cf Björn Töpel        2018-05-02  1494  
c0c77d8fb787cf Björn Töpel        2018-05-02 @1495  	return -ENOPROTOOPT;
c0c77d8fb787cf Björn Töpel        2018-05-02  1496  }
c0c77d8fb787cf Björn Töpel        2018-05-02  1497  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
