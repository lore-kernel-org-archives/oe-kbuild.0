Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B394CDEA
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jan 2024 17:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqqBrDrj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704907936; x=1736443936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3MEwK+oYSi79HQHST3mBL70uhfpCe/yhbx0xCxn5n44=;
  b=SqqBrDrjUFt9YtfBtIch+IBEPj0JGRUpLFodpbKOGcmMt04H8xpVlbU1
   YemtjXgY4zRR5OnLg2chcQAWiRBgbwkMtYcvD2YceAG1e0Ip+cvz21dyt
   iPZVE8BgXUgfF1j3PQa9g1FfCw1L92Qx52mIooURCuc8lEAfdDRiHoq0A
   sBGKCeraZV9VMwaq24jgxcmIqTP1iFRL5MWd3ahIgcD4iC8Sa7a+am3Ma
   UhMagD7lFMOA8h/9Qvlr4434hxE22feCEHnD3C1ZB9P4KwlpcL12p7V2L
   Dp2MMEZKwFeqcB17pfely+8JOQVAJ6LbL/XuiI3CEuCTzkS3W1JcYctUg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397449305"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="397449305"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 09:32:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775291730"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="775291730"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Jan 2024 09:32:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNcQz-0007Kk-0L;
	Wed, 10 Jan 2024 17:32:09 +0000
Date: Thu, 11 Jan 2024 01:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/bluetooth/hci_sock.c:1792 hci_sock_sendmsg() warn: potential
 spectre issue 'hci_sec_filter.ocf_mask' [w] (local cap)
Message-ID: <202401110100.tb5SDmwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab27740f76654ed58dd32ac0ba0031c18a6dea3b
commit: 803f4e1eab7a8938ba3a3c30dd4eb5e9eeef5e63 asm-generic: simplify asm/unaligned.h
date:   2 years, 8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 2 years, 8 months ago
config: x86_64-randconfig-161-20240106 (https://download.01.org/0day-ci/archive/20240111/202401110100.tb5SDmwQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401110100.tb5SDmwQ-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_sock.c:1792 hci_sock_sendmsg() warn: potential spectre issue 'hci_sec_filter.ocf_mask' [w] (local cap)

vim +1792 net/bluetooth/hci_sock.c

ac71494934c475 Marcel Holtmann    2015-11-08  1700  
1b784140474e4f Ying Xue           2015-03-02  1701  static int hci_sock_sendmsg(struct socket *sock, struct msghdr *msg,
1b784140474e4f Ying Xue           2015-03-02  1702  			    size_t len)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1703  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1704  	struct sock *sk = sock->sk;
801c1e8da57499 Johan Hedberg      2015-03-06  1705  	struct hci_mgmt_chan *chan;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1706  	struct hci_dev *hdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1707  	struct sk_buff *skb;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1708  	int err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1709  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1710  	BT_DBG("sock %p sk %p", sock, sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1711  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1712  	if (msg->msg_flags & MSG_OOB)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1713  		return -EOPNOTSUPP;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1714  
ab89f0bdd63a37 Szymon Janc        2017-04-24  1715  	if (msg->msg_flags & ~(MSG_DONTWAIT|MSG_NOSIGNAL|MSG_ERRQUEUE|
ab89f0bdd63a37 Szymon Janc        2017-04-24  1716  			       MSG_CMSG_COMPAT))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1717  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1718  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1719  	if (len < 4 || len > HCI_MAX_FRAME_SIZE)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1720  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1721  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1722  	lock_sock(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1723  
0381101fd6a73c Johan Hedberg      2010-12-08  1724  	switch (hci_pi(sk)->channel) {
0381101fd6a73c Johan Hedberg      2010-12-08  1725  	case HCI_CHANNEL_RAW:
23500189d7e03a Marcel Holtmann    2013-08-26  1726  	case HCI_CHANNEL_USER:
0381101fd6a73c Johan Hedberg      2010-12-08  1727  		break;
cd82e61c110a36 Marcel Holtmann    2012-02-20  1728  	case HCI_CHANNEL_MONITOR:
cd82e61c110a36 Marcel Holtmann    2012-02-20  1729  		err = -EOPNOTSUPP;
cd82e61c110a36 Marcel Holtmann    2012-02-20  1730  		goto done;
ac71494934c475 Marcel Holtmann    2015-11-08  1731  	case HCI_CHANNEL_LOGGING:
ac71494934c475 Marcel Holtmann    2015-11-08  1732  		err = hci_logging_frame(sk, msg, len);
ac71494934c475 Marcel Holtmann    2015-11-08  1733  		goto done;
0381101fd6a73c Johan Hedberg      2010-12-08  1734  	default:
801c1e8da57499 Johan Hedberg      2015-03-06  1735  		mutex_lock(&mgmt_chan_list_lock);
801c1e8da57499 Johan Hedberg      2015-03-06  1736  		chan = __hci_mgmt_chan_find(hci_pi(sk)->channel);
801c1e8da57499 Johan Hedberg      2015-03-06  1737  		if (chan)
fa4335d71a1408 Johan Hedberg      2015-03-17  1738  			err = hci_mgmt_cmd(chan, sk, msg, len);
801c1e8da57499 Johan Hedberg      2015-03-06  1739  		else
0381101fd6a73c Johan Hedberg      2010-12-08  1740  			err = -EINVAL;
801c1e8da57499 Johan Hedberg      2015-03-06  1741  
801c1e8da57499 Johan Hedberg      2015-03-06  1742  		mutex_unlock(&mgmt_chan_list_lock);
0381101fd6a73c Johan Hedberg      2010-12-08  1743  		goto done;
0381101fd6a73c Johan Hedberg      2010-12-08  1744  	}
0381101fd6a73c Johan Hedberg      2010-12-08  1745  
70f23020e6d891 Andrei Emeltchenko 2010-12-01  1746  	hdev = hci_pi(sk)->hdev;
70f23020e6d891 Andrei Emeltchenko 2010-12-01  1747  	if (!hdev) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1748  		err = -EBADFD;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1749  		goto done;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1750  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1751  
7e21addcd0ad87 Marcel Holtmann    2009-11-18  1752  	if (!test_bit(HCI_UP, &hdev->flags)) {
7e21addcd0ad87 Marcel Holtmann    2009-11-18  1753  		err = -ENETDOWN;
7e21addcd0ad87 Marcel Holtmann    2009-11-18  1754  		goto done;
7e21addcd0ad87 Marcel Holtmann    2009-11-18  1755  	}
7e21addcd0ad87 Marcel Holtmann    2009-11-18  1756  
70f23020e6d891 Andrei Emeltchenko 2010-12-01  1757  	skb = bt_skb_send_alloc(sk, len, msg->msg_flags & MSG_DONTWAIT, &err);
70f23020e6d891 Andrei Emeltchenko 2010-12-01  1758  	if (!skb)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1759  		goto done;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1760  
6ce8e9ce5989ae Al Viro            2014-04-06  1761  	if (memcpy_from_msg(skb_put(skb, len), msg, len)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1762  		err = -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1763  		goto drop;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1764  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1765  
8528d3f7383867 Marcel Holtmann    2015-11-08  1766  	hci_skb_pkt_type(skb) = skb->data[0];
^1da177e4c3f41 Linus Torvalds     2005-04-16  1767  	skb_pull(skb, 1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1768  
1bc5ad168f441f Marcel Holtmann    2013-12-17  1769  	if (hci_pi(sk)->channel == HCI_CHANNEL_USER) {
1bc5ad168f441f Marcel Holtmann    2013-12-17  1770  		/* No permission check is needed for user channel
1bc5ad168f441f Marcel Holtmann    2013-12-17  1771  		 * since that gets enforced when binding the socket.
1bc5ad168f441f Marcel Holtmann    2013-12-17  1772  		 *
1bc5ad168f441f Marcel Holtmann    2013-12-17  1773  		 * However check that the packet type is valid.
1bc5ad168f441f Marcel Holtmann    2013-12-17  1774  		 */
d79f34e32b833c Marcel Holtmann    2015-11-05  1775  		if (hci_skb_pkt_type(skb) != HCI_COMMAND_PKT &&
d79f34e32b833c Marcel Holtmann    2015-11-05  1776  		    hci_skb_pkt_type(skb) != HCI_ACLDATA_PKT &&
cc974003615afa Marcel Holtmann    2020-01-25  1777  		    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT &&
cc974003615afa Marcel Holtmann    2020-01-25  1778  		    hci_skb_pkt_type(skb) != HCI_ISODATA_PKT) {
1bc5ad168f441f Marcel Holtmann    2013-12-17  1779  			err = -EINVAL;
1bc5ad168f441f Marcel Holtmann    2013-12-17  1780  			goto drop;
1bc5ad168f441f Marcel Holtmann    2013-12-17  1781  		}
1bc5ad168f441f Marcel Holtmann    2013-12-17  1782  
1bc5ad168f441f Marcel Holtmann    2013-12-17  1783  		skb_queue_tail(&hdev->raw_q, skb);
1bc5ad168f441f Marcel Holtmann    2013-12-17  1784  		queue_work(hdev->workqueue, &hdev->tx_work);
d79f34e32b833c Marcel Holtmann    2015-11-05  1785  	} else if (hci_skb_pkt_type(skb) == HCI_COMMAND_PKT) {
83985319393973 Harvey Harrison    2008-05-02  1786  		u16 opcode = get_unaligned_le16(skb->data);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1787  		u16 ogf = hci_opcode_ogf(opcode);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1788  		u16 ocf = hci_opcode_ocf(opcode);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1789  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1790  		if (((ogf > HCI_SFLT_MAX_OGF) ||
3bb3c7551c2f10 Gustavo Padovan    2012-05-17  1791  		     !hci_test_bit(ocf & HCI_FLT_OCF_BITS,
3bb3c7551c2f10 Gustavo Padovan    2012-05-17 @1792  				   &hci_sec_filter.ocf_mask[ogf])) &&
^1da177e4c3f41 Linus Torvalds     2005-04-16  1793  		    !capable(CAP_NET_RAW)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1794  			err = -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1795  			goto drop;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1796  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1797  
1982162bbe2067 Marcel Holtmann    2015-11-06  1798  		/* Since the opcode has already been extracted here, store
1982162bbe2067 Marcel Holtmann    2015-11-06  1799  		 * a copy of the value for later use by the drivers.
1982162bbe2067 Marcel Holtmann    2015-11-06  1800  		 */
1982162bbe2067 Marcel Holtmann    2015-11-06  1801  		hci_skb_opcode(skb) = opcode;
1982162bbe2067 Marcel Holtmann    2015-11-06  1802  
fee746b0babf12 Marcel Holtmann    2014-06-29  1803  		if (ogf == 0x3f) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1804  			skb_queue_tail(&hdev->raw_q, skb);
3eff45eaf81780 Gustavo Padovan    2011-12-15  1805  			queue_work(hdev->workqueue, &hdev->tx_work);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1806  		} else {
49c922bb1ec01a Stephen Hemminger  2014-10-27  1807  			/* Stand-alone HCI commands must be flagged as
11714b3d7acee5 Johan Hedberg      2013-03-05  1808  			 * single-command requests.
11714b3d7acee5 Johan Hedberg      2013-03-05  1809  			 */
44d271377479c4 Johan Hedberg      2015-11-05  1810  			bt_cb(skb)->hci.req_flags |= HCI_REQ_START;
11714b3d7acee5 Johan Hedberg      2013-03-05  1811  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1812  			skb_queue_tail(&hdev->cmd_q, skb);
c347b765fe70d7 Gustavo Padovan    2011-12-14  1813  			queue_work(hdev->workqueue, &hdev->cmd_work);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1814  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1815  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1816  		if (!capable(CAP_NET_RAW)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1817  			err = -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1818  			goto drop;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1819  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1820  
d79f34e32b833c Marcel Holtmann    2015-11-05  1821  		if (hci_skb_pkt_type(skb) != HCI_ACLDATA_PKT &&
cc974003615afa Marcel Holtmann    2020-01-25  1822  		    hci_skb_pkt_type(skb) != HCI_SCODATA_PKT &&
cc974003615afa Marcel Holtmann    2020-01-25  1823  		    hci_skb_pkt_type(skb) != HCI_ISODATA_PKT) {
bb77543ebd2e38 Marcel Holtmann    2015-10-09  1824  			err = -EINVAL;
bb77543ebd2e38 Marcel Holtmann    2015-10-09  1825  			goto drop;
bb77543ebd2e38 Marcel Holtmann    2015-10-09  1826  		}
bb77543ebd2e38 Marcel Holtmann    2015-10-09  1827  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1828  		skb_queue_tail(&hdev->raw_q, skb);
3eff45eaf81780 Gustavo Padovan    2011-12-15  1829  		queue_work(hdev->workqueue, &hdev->tx_work);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1830  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1831  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1832  	err = len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1833  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1834  done:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1835  	release_sock(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1836  	return err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1837  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1838  drop:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1839  	kfree_skb(skb);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1840  	goto done;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1841  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1842  

:::::: The code at line 1792 was first introduced by commit
:::::: 3bb3c7551c2f1083263aee8312b3db1e751ca0fb Bluetooth: Fix coding style in hci_sock.c

:::::: TO: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
:::::: CC: Johan Hedberg <johan.hedberg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
