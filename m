Content-Type: multipart/mixed; boundary="===============3540530074765576872=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:pending-fixes 9902/9954] drivers/net/amt.c:2752 amt_rcv() error: we previously assumed 'amt' could be null (see line 2680)
Date: Mon, 30 May 2022 13:18:35 +0800
Message-ID: <202205301318.0mXnZUDh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3540530074765576872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Taehee Yoo <ap420073@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 pending-fixes
head:   9e21d180a10050c7cb41863b054fc0d62ca59677
commit: 1a1a0e80e005cbdc2c250fc858e1d8570f4e4acb [9902/9954] amt: fix possi=
ble memory leak in amt_rcv()
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220530/202205301318.0mXnZUDh-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/amt.c:2752 amt_rcv() error: we previously assumed 'amt' could b=
e null (see line 2680)

vim +/amt +2752 drivers/net/amt.c

cbc21dc1cfe949 Taehee Yoo 2021-10-31  2670  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  2671  static int amt_rcv(struct sock =
*sk, struct sk_buff *skb)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2672  {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2673  	struct amt_dev *amt;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2674  	struct iphdr *iph;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2675  	int type;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2676  	bool err;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2677  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  2678  	rcu_read_lock_bh();
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2679  	amt =3D rcu_dereference_sk_use=
r_data(sk);
cbc21dc1cfe949 Taehee Yoo 2021-10-31 @2680  	if (!amt) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2681  		err =3D true;
1a1a0e80e005cb Taehee Yoo 2022-05-23  2682  		goto drop;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2683  	}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2684  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  2685  	skb->dev =3D amt->dev;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2686  	iph =3D ip_hdr(skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2687  	type =3D amt_parse_type(skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2688  	if (type =3D=3D -1) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2689  		err =3D true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2690  		goto drop;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2691  	}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2692  =

cbc21dc1cfe949 Taehee Yoo 2021-10-31  2693  	if (amt->mode =3D=3D AMT_MODE_=
GATEWAY) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2694  		switch (type) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2695  		case AMT_MSG_ADVERTISEMENT:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2696  			if (iph->saddr !=3D amt->dis=
covery_ip) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2697  				netdev_dbg(amt->dev, "Inval=
id Relay IP\n");
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2698  				err =3D true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2699  				goto drop;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2700  			}
fe29794c3585d0 Taehee Yoo 2022-05-19  2701  			err =3D amt_advertisement_ha=
ndler(amt, skb);
fe29794c3585d0 Taehee Yoo 2022-05-19  2702  			break;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2703  		case AMT_MSG_MULTICAST_DATA:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2704  			if (iph->saddr !=3D amt->rem=
ote_ip) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2705  				netdev_dbg(amt->dev, "Inval=
id Relay IP\n");
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2706  				err =3D true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2707  				goto drop;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2708  			}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2709  			err =3D amt_multicast_data_h=
andler(amt, skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2710  			if (err)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2711  				goto drop;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2712  			else
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2713  				goto out;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2714  		case AMT_MSG_MEMBERSHIP_QUERY:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2715  			if (iph->saddr !=3D amt->rem=
ote_ip) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2716  				netdev_dbg(amt->dev, "Inval=
id Relay IP\n");
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2717  				err =3D true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2718  				goto drop;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2719  			}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2720  			err =3D amt_membership_query=
_handler(amt, skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2721  			if (err)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2722  				goto drop;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2723  			else
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2724  				goto out;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2725  		default:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2726  			err =3D true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2727  			netdev_dbg(amt->dev, "Invali=
d type of Gateway\n");
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2728  			break;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2729  		}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2730  	} else {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2731  		switch (type) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2732  		case AMT_MSG_DISCOVERY:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2733  			err =3D amt_discovery_handle=
r(amt, skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2734  			break;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2735  		case AMT_MSG_REQUEST:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2736  			err =3D amt_request_handler(=
amt, skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2737  			break;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2738  		case AMT_MSG_MEMBERSHIP_UPDAT=
E:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2739  			err =3D amt_update_handler(a=
mt, skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2740  			if (err)
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2741  				goto drop;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2742  			else
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2743  				goto out;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2744  		default:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2745  			err =3D true;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2746  			netdev_dbg(amt->dev, "Invali=
d type of relay\n");
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2747  			break;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2748  		}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2749  	}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2750  drop:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2751  	if (err) {
cbc21dc1cfe949 Taehee Yoo 2021-10-31 @2752  		amt->dev->stats.rx_dropped++;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2753  		kfree_skb(skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2754  	} else {
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2755  		consume_skb(skb);
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2756  	}
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2757  out:
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2758  	rcu_read_unlock_bh();
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2759  	return 0;
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2760  }
cbc21dc1cfe949 Taehee Yoo 2021-10-31  2761  =


:::::: The code at line 2752 was first introduced by commit
:::::: cbc21dc1cfe949e37b2a54c71511579f1899e8d4 amt: add data plane of amt =
interface

:::::: TO: Taehee Yoo <ap420073@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3540530074765576872==--

