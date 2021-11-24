Content-Type: multipart/mixed; boundary="===============1104975497822527028=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/mctp/test/utils.c:15 mctp_test_dev_tx() error: use kfree_skb() here instead of kfree(skb)
Date: Thu, 25 Nov 2021 06:21:27 +0800
Message-ID: <202111250652.KJ5iJFpx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1104975497822527028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jeremy Kerr <jk@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5f53fa508db098c9d372423a6dac31c8a5679cdf
commit: ded21b72299529cc143a4213ea0ec4b0c620b8eb mctp: Add test utils
date:   7 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m001-20211122 (https://download.01.org/0day-ci/ar=
chive/20211125/202111250652.KJ5iJFpx-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/mctp/test/utils.c:15 mctp_test_dev_tx() error: use kfree_skb() here ins=
tead of kfree(skb)

vim +15 net/mctp/test/utils.c

ded21b72299529c Jeremy Kerr 2021-10-03  11  =

ded21b72299529c Jeremy Kerr 2021-10-03  12  static netdev_tx_t mctp_test_de=
v_tx(struct sk_buff *skb,
ded21b72299529c Jeremy Kerr 2021-10-03  13  				    struct net_device *ndev)
ded21b72299529c Jeremy Kerr 2021-10-03  14  {
ded21b72299529c Jeremy Kerr 2021-10-03 @15  	kfree(skb);
ded21b72299529c Jeremy Kerr 2021-10-03  16  	return NETDEV_TX_OK;
ded21b72299529c Jeremy Kerr 2021-10-03  17  }
ded21b72299529c Jeremy Kerr 2021-10-03  18  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1104975497822527028==--

