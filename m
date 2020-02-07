Content-Type: multipart/mixed; boundary="===============3489790350259594303=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-wired-lan] [PATCH v2 1/2] igb: Use device_lock() insead of rtnl_lock()
Date: Fri, 07 Feb 2020 07:11:23 +0300
Message-ID: <20200207041123.GO24804@kadam>
In-Reply-To: <20200205081616.18378-1-kai.heng.feng@canonical.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3489790350259594303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kai-Heng,

url:    https://github.com/0day-ci/linux/commits/Kai-Heng-Feng/igb-Use-devi=
ce_lock-insead-of-rtnl_lock/20200205-174208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue=
.git dev-queue

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/intel/igb/igb_main.c:4036 igb_close() warn: inconsiste=
nt returns 'dev->mutex'.

# https://github.com/0day-ci/linux/commit/905877ae7d44efc1d9c5c1ae9f4489f56=
bcb13a6
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 905877ae7d44efc1d9c5c1ae9f4489f56bcb13a6
vim +4036 drivers/net/ethernet/intel/igb/igb_main.c

9d5c824399dea8 drivers/net/igb/igb_main.c                Auke Kok       200=
8-01-24  4026  =

46eafa59e18d03 drivers/net/ethernet/intel/igb/igb_main.c Stefan Assmann 201=
6-02-03  4027  int igb_close(struct net_device *netdev)
749ab2cd127046 drivers/net/ethernet/intel/igb/igb_main.c Yan, Zheng     201=
2-01-04  4028  {
905877ae7d44ef drivers/net/ethernet/intel/igb/igb_main.c Kai-Heng Feng  202=
0-02-05  4029  	struct igb_adapter *adapter =3D netdev_priv(netdev);
905877ae7d44ef drivers/net/ethernet/intel/igb/igb_main.c Kai-Heng Feng  202=
0-02-05  4030  	struct device *dev =3D &adapter->pdev->dev;
905877ae7d44ef drivers/net/ethernet/intel/igb/igb_main.c Kai-Heng Feng  202=
0-02-05  4031  =

905877ae7d44ef drivers/net/ethernet/intel/igb/igb_main.c Kai-Heng Feng  202=
0-02-05  4032  	device_lock(dev);
888f22931478a0 drivers/net/ethernet/intel/igb/igb_main.c Lyude Paul     201=
7-12-12  4033  	if (netif_device_present(netdev) || netdev->dismantle)
749ab2cd127046 drivers/net/ethernet/intel/igb/igb_main.c Yan, Zheng     201=
2-01-04  4034  		return __igb_close(netdev, false);
                                                                           =
                             ^^^^^^
Lock held for this return.

905877ae7d44ef drivers/net/ethernet/intel/igb/igb_main.c Kai-Heng Feng  202=
0-02-05  4035  	device_unlock(dev);
9474933caf21a4 drivers/net/ethernet/intel/igb/igb_main.c Todd Fujinaka  201=
6-11-15 @4036  	return 0;
749ab2cd127046 drivers/net/ethernet/intel/igb/igb_main.c Yan, Zheng     201=
2-01-04  4037  }
749ab2cd127046 drivers/net/ethernet/intel/igb/igb_main.c Yan, Zheng     201=
2-01-04  4038  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============3489790350259594303==--

