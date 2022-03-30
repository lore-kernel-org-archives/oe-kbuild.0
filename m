Content-Type: multipart/mixed; boundary="===============3874730959423134564=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/hci_sock.c:1792 hci_sock_sendmsg() warn: potential spectre issue 'hci_sec_filter.ocf_mask' [w] (local cap)
Date: Thu, 31 Mar 2022 03:07:09 +0800
Message-ID: <202203310305.hSXN1Aax-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3874730959423134564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d888c83fcec75194a8a48ccd283953bdba7b2550
commit: 803f4e1eab7a8938ba3a3c30dd4eb5e9eeef5e63 asm-generic: simplify asm/=
unaligned.h
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: powerpc64-randconfig-m031-20220330 (https://download.01.org/0day-ci=
/archive/20220331/202203310305.hSXN1Aax-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/bluetooth/hci_sock.c:1792 hci_sock_sendmsg() warn: potential spectre is=
sue 'hci_sec_filter.ocf_mask' [w] (local cap)

Old smatch warnings:
net/bluetooth/hci_sock.c:1518 hci_mgmt_cmd() warn: is 'buf' large enough fo=
r 'struct mgmt_hdr'? s32min
arch/powerpc/include/asm/mmu.h:264 mmu_has_feature() warn: bitwise AND cond=
ition is false here

vim +1792 net/bluetooth/hci_sock.c

ac71494934c475 Marcel Holtmann    2015-11-08  1700  =

1b784140474e4f Ying Xue           2015-03-02  1701  static int hci_sock_sen=
dmsg(struct socket *sock, struct msghdr *msg,
1b784140474e4f Ying Xue           2015-03-02  1702  			    size_t len)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1703  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1704  	struct sock *sk =3D so=
ck->sk;
801c1e8da57499 Johan Hedberg      2015-03-06  1705  	struct hci_mgmt_chan *=
chan;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1706  	struct hci_dev *hdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1707  	struct sk_buff *skb;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1708  	int err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1709  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1710  	BT_DBG("sock %p sk %p"=
, sock, sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1711  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1712  	if (msg->msg_flags & M=
SG_OOB)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1713  		return -EOPNOTSUPP;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1714  =

ab89f0bdd63a37 Szymon Janc        2017-04-24  1715  	if (msg->msg_flags & ~=
(MSG_DONTWAIT|MSG_NOSIGNAL|MSG_ERRQUEUE|
ab89f0bdd63a37 Szymon Janc        2017-04-24  1716  			       MSG_CMSG_COMP=
AT))
^1da177e4c3f41 Linus Torvalds     2005-04-16  1717  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1718  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1719  	if (len < 4 || len > H=
CI_MAX_FRAME_SIZE)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1720  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1721  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1722  	lock_sock(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1723  =

0381101fd6a73c Johan Hedberg      2010-12-08  1724  	switch (hci_pi(sk)->ch=
annel) {
0381101fd6a73c Johan Hedberg      2010-12-08  1725  	case HCI_CHANNEL_RAW:
23500189d7e03a Marcel Holtmann    2013-08-26  1726  	case HCI_CHANNEL_USER:
0381101fd6a73c Johan Hedberg      2010-12-08  1727  		break;
cd82e61c110a36 Marcel Holtmann    2012-02-20  1728  	case HCI_CHANNEL_MONIT=
OR:
cd82e61c110a36 Marcel Holtmann    2012-02-20  1729  		err =3D -EOPNOTSUPP;
cd82e61c110a36 Marcel Holtmann    2012-02-20  1730  		goto done;
ac71494934c475 Marcel Holtmann    2015-11-08  1731  	case HCI_CHANNEL_LOGGI=
NG:
ac71494934c475 Marcel Holtmann    2015-11-08  1732  		err =3D hci_logging_f=
rame(sk, msg, len);
ac71494934c475 Marcel Holtmann    2015-11-08  1733  		goto done;
0381101fd6a73c Johan Hedberg      2010-12-08  1734  	default:
801c1e8da57499 Johan Hedberg      2015-03-06  1735  		mutex_lock(&mgmt_chan=
_list_lock);
801c1e8da57499 Johan Hedberg      2015-03-06  1736  		chan =3D __hci_mgmt_c=
han_find(hci_pi(sk)->channel);
801c1e8da57499 Johan Hedberg      2015-03-06  1737  		if (chan)
fa4335d71a1408 Johan Hedberg      2015-03-17  1738  			err =3D hci_mgmt_cmd=
(chan, sk, msg, len);
801c1e8da57499 Johan Hedberg      2015-03-06  1739  		else
0381101fd6a73c Johan Hedberg      2010-12-08  1740  			err =3D -EINVAL;
801c1e8da57499 Johan Hedberg      2015-03-06  1741  =

801c1e8da57499 Johan Hedberg      2015-03-06  1742  		mutex_unlock(&mgmt_ch=
an_list_lock);
0381101fd6a73c Johan Hedberg      2010-12-08  1743  		goto done;
0381101fd6a73c Johan Hedberg      2010-12-08  1744  	}
0381101fd6a73c Johan Hedberg      2010-12-08  1745  =

70f23020e6d891 Andrei Emeltchenko 2010-12-01  1746  	hdev =3D hci_pi(sk)->h=
dev;
70f23020e6d891 Andrei Emeltchenko 2010-12-01  1747  	if (!hdev) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1748  		err =3D -EBADFD;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1749  		goto done;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1750  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1751  =

7e21addcd0ad87 Marcel Holtmann    2009-11-18  1752  	if (!test_bit(HCI_UP, =
&hdev->flags)) {
7e21addcd0ad87 Marcel Holtmann    2009-11-18  1753  		err =3D -ENETDOWN;
7e21addcd0ad87 Marcel Holtmann    2009-11-18  1754  		goto done;
7e21addcd0ad87 Marcel Holtmann    2009-11-18  1755  	}
7e21addcd0ad87 Marcel Holtmann    2009-11-18  1756  =

70f23020e6d891 Andrei Emeltchenko 2010-12-01  1757  	skb =3D bt_skb_send_al=
loc(sk, len, msg->msg_flags & MSG_DONTWAIT, &err);
70f23020e6d891 Andrei Emeltchenko 2010-12-01  1758  	if (!skb)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1759  		goto done;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1760  =

6ce8e9ce5989ae Al Viro            2014-04-06  1761  	if (memcpy_from_msg(sk=
b_put(skb, len), msg, len)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1762  		err =3D -EFAULT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1763  		goto drop;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1764  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1765  =

8528d3f7383867 Marcel Holtmann    2015-11-08  1766  	hci_skb_pkt_type(skb) =
=3D skb->data[0];
^1da177e4c3f41 Linus Torvalds     2005-04-16  1767  	skb_pull(skb, 1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1768  =

1bc5ad168f441f Marcel Holtmann    2013-12-17  1769  	if (hci_pi(sk)->channe=
l =3D=3D HCI_CHANNEL_USER) {
1bc5ad168f441f Marcel Holtmann    2013-12-17  1770  		/* No permission chec=
k is needed for user channel
1bc5ad168f441f Marcel Holtmann    2013-12-17  1771  		 * since that gets en=
forced when binding the socket.
1bc5ad168f441f Marcel Holtmann    2013-12-17  1772  		 *
1bc5ad168f441f Marcel Holtmann    2013-12-17  1773  		 * However check that=
 the packet type is valid.
1bc5ad168f441f Marcel Holtmann    2013-12-17  1774  		 */
d79f34e32b833c Marcel Holtmann    2015-11-05  1775  		if (hci_skb_pkt_type(=
skb) !=3D HCI_COMMAND_PKT &&
d79f34e32b833c Marcel Holtmann    2015-11-05  1776  		    hci_skb_pkt_type(=
skb) !=3D HCI_ACLDATA_PKT &&
cc974003615afa Marcel Holtmann    2020-01-25  1777  		    hci_skb_pkt_type(=
skb) !=3D HCI_SCODATA_PKT &&
cc974003615afa Marcel Holtmann    2020-01-25  1778  		    hci_skb_pkt_type(=
skb) !=3D HCI_ISODATA_PKT) {
1bc5ad168f441f Marcel Holtmann    2013-12-17  1779  			err =3D -EINVAL;
1bc5ad168f441f Marcel Holtmann    2013-12-17  1780  			goto drop;
1bc5ad168f441f Marcel Holtmann    2013-12-17  1781  		}
1bc5ad168f441f Marcel Holtmann    2013-12-17  1782  =

1bc5ad168f441f Marcel Holtmann    2013-12-17  1783  		skb_queue_tail(&hdev-=
>raw_q, skb);
1bc5ad168f441f Marcel Holtmann    2013-12-17  1784  		queue_work(hdev->work=
queue, &hdev->tx_work);
d79f34e32b833c Marcel Holtmann    2015-11-05  1785  	} else if (hci_skb_pkt=
_type(skb) =3D=3D HCI_COMMAND_PKT) {
83985319393973 Harvey Harrison    2008-05-02  1786  		u16 opcode =3D get_un=
aligned_le16(skb->data);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1787  		u16 ogf =3D hci_opcod=
e_ogf(opcode);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1788  		u16 ocf =3D hci_opcod=
e_ocf(opcode);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1789  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1790  		if (((ogf > HCI_SFLT_=
MAX_OGF) ||
3bb3c7551c2f10 Gustavo Padovan    2012-05-17  1791  		     !hci_test_bit(oc=
f & HCI_FLT_OCF_BITS,
3bb3c7551c2f10 Gustavo Padovan    2012-05-17 @1792  				   &hci_sec_filter.=
ocf_mask[ogf])) &&
^1da177e4c3f41 Linus Torvalds     2005-04-16  1793  		    !capable(CAP_NET_=
RAW)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1794  			err =3D -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1795  			goto drop;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1796  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1797  =

1982162bbe2067 Marcel Holtmann    2015-11-06  1798  		/* Since the opcode h=
as already been extracted here, store
1982162bbe2067 Marcel Holtmann    2015-11-06  1799  		 * a copy of the valu=
e for later use by the drivers.
1982162bbe2067 Marcel Holtmann    2015-11-06  1800  		 */
1982162bbe2067 Marcel Holtmann    2015-11-06  1801  		hci_skb_opcode(skb) =
=3D opcode;
1982162bbe2067 Marcel Holtmann    2015-11-06  1802  =

fee746b0babf12 Marcel Holtmann    2014-06-29  1803  		if (ogf =3D=3D 0x3f) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1804  			skb_queue_tail(&hdev=
->raw_q, skb);
3eff45eaf81780 Gustavo Padovan    2011-12-15  1805  			queue_work(hdev->wor=
kqueue, &hdev->tx_work);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1806  		} else {
49c922bb1ec01a Stephen Hemminger  2014-10-27  1807  			/* Stand-alone HCI c=
ommands must be flagged as
11714b3d7acee5 Johan Hedberg      2013-03-05  1808  			 * single-command re=
quests.
11714b3d7acee5 Johan Hedberg      2013-03-05  1809  			 */
44d271377479c4 Johan Hedberg      2015-11-05  1810  			bt_cb(skb)->hci.req_=
flags |=3D HCI_REQ_START;
11714b3d7acee5 Johan Hedberg      2013-03-05  1811  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1812  			skb_queue_tail(&hdev=
->cmd_q, skb);
c347b765fe70d7 Gustavo Padovan    2011-12-14  1813  			queue_work(hdev->wor=
kqueue, &hdev->cmd_work);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1814  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1815  	} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1816  		if (!capable(CAP_NET_=
RAW)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1817  			err =3D -EPERM;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1818  			goto drop;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1819  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1820  =

d79f34e32b833c Marcel Holtmann    2015-11-05  1821  		if (hci_skb_pkt_type(=
skb) !=3D HCI_ACLDATA_PKT &&
cc974003615afa Marcel Holtmann    2020-01-25  1822  		    hci_skb_pkt_type(=
skb) !=3D HCI_SCODATA_PKT &&
cc974003615afa Marcel Holtmann    2020-01-25  1823  		    hci_skb_pkt_type(=
skb) !=3D HCI_ISODATA_PKT) {
bb77543ebd2e38 Marcel Holtmann    2015-10-09  1824  			err =3D -EINVAL;
bb77543ebd2e38 Marcel Holtmann    2015-10-09  1825  			goto drop;
bb77543ebd2e38 Marcel Holtmann    2015-10-09  1826  		}
bb77543ebd2e38 Marcel Holtmann    2015-10-09  1827  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1828  		skb_queue_tail(&hdev-=
>raw_q, skb);
3eff45eaf81780 Gustavo Padovan    2011-12-15  1829  		queue_work(hdev->work=
queue, &hdev->tx_work);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1830  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1831  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1832  	err =3D len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1833  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1834  done:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1835  	release_sock(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1836  	return err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1837  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  1838  drop:
^1da177e4c3f41 Linus Torvalds     2005-04-16  1839  	kfree_skb(skb);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1840  	goto done;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1841  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1842  =


:::::: The code at line 1792 was first introduced by commit
:::::: 3bb3c7551c2f1083263aee8312b3db1e751ca0fb Bluetooth: Fix coding style=
 in hci_sock.c

:::::: TO: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
:::::: CC: Johan Hedberg <johan.hedberg@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3874730959423134564==--

