Content-Type: multipart/mixed; boundary="===============2617691043578021126=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/agg-rx.c:125:5: warning: Value stored to 'tidno' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 11 Feb 2022 00:11:14 +0800
Message-ID: <202202110012.h3UoVFsg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2617691043578021126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e3c85076d7a6f986445b9008be7e7f83d1b0780a
commit: e195dad1411594809cb955c96a7a514bcc4ad638 mt76: add support for 802.=
3 rx frames
date:   10 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-c006-20220205 (https://download.01.org/0day-ci/arc=
hive/20220211/202202110012.h3UoVFsg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 78c6b9=
0000292eb37aac5dead6ab26611cd76f42)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De195dad1411594809cb955c96a7a514bcc4ad638
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e195dad1411594809cb955c96a7a514bcc4ad638
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^    ~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   drivers/usb/host/xhci-hub.c:396:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   drivers/usb/host/xhci-hub.c:396:2: note: Value stored to 'ret' is never =
read
           ret =3D 0;
           ^     ~
   drivers/usb/host/xhci-hub.c:1238:4: warning: Value stored to 'temp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           temp =3D readl(ports[wIndex]->addr);
                           ^
   drivers/usb/host/xhci-hub.c:1238:4: note: Value stored to 'temp' is neve=
r read
   drivers/usb/host/xhci-hub.c:1256:5: warning: Value stored to 'temp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   temp =3D readl(ports[wIndex]->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1256:5: note: Value stored to 'temp' is neve=
r read
   drivers/usb/host/xhci-hub.c:1266:5: warning: Value stored to 'temp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   temp =3D readl(ports[wIndex]->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1266:5: note: Value stored to 'temp' is neve=
r read
   drivers/usb/host/xhci-hub.c:1300:5: warning: Value stored to 'temp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   temp =3D readl(ports[wIndex]->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1300:5: note: Value stored to 'temp' is neve=
r read
   drivers/usb/host/xhci-hub.c:1350:5: warning: Value stored to 'temp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   temp =3D readl(ports[wIndex]->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1350:5: note: Value stored to 'temp' is neve=
r read
   drivers/usb/host/xhci-hub.c:1375:5: warning: Value stored to 'temp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   temp =3D readl(ports[wIndex]->addr);
                                   ^
   drivers/usb/host/xhci-hub.c:1375:5: note: Value stored to 'temp' is neve=
r read
   drivers/usb/host/xhci-hub.c:1406:4: warning: Value stored to 'temp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           temp =3D readl(ports[wIndex]->addr);
                           ^
   drivers/usb/host/xhci-hub.c:1406:4: note: Value stored to 'temp' is neve=
r read
   drivers/usb/host/xhci-hub.c:1438:3: warning: Value stored to 'temp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   temp =3D readl(ports[wIndex]->addr);
                   ^
   drivers/usb/host/xhci-hub.c:1438:3: note: Value stored to 'temp' is neve=
r read
   drivers/usb/host/xhci-hub.c:1860:2: warning: Value stored to 'temp' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           temp =3D readl(&xhci->op_regs->command);
           ^
   drivers/usb/host/xhci-hub.c:1860:2: note: Value stored to 'temp' is neve=
r read
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/net/wireless/mediatek/mt76/agg-rx.c:125:5: warning: Value stored=
 to 'tidno' during its initialization is never read [clang-analyzer-deadcod=
e.DeadStores]
           u8 tidno =3D status->qos_ctl & IEEE80211_QOS_CTL_TID_MASK;
              ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/agg-rx.c:125:5: note: Value stored to=
 'tidno' during its initialization is never read
           u8 tidno =3D status->qos_ctl & IEEE80211_QOS_CTL_TID_MASK;
              ^~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2831:3: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D stmmac_rx_watchdog(priv, priv->ioaddr, priv->rx_=
riwt, rx_cnt);
                   ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2831:3: note: Value st=
ored to 'ret' is never read
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3877:3: warning: Value=
 stored to 'buf1_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3877:3: note: Value st=
ored to 'buf1_len' is never read
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3878:3: warning: Value=
 stored to 'buf2_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf2_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3878:3: note: Value st=
ored to 'buf2_len' is never read
                   buf2_len =3D 0;
                   ^          ~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:377:3: warning: Val=
ue stored to 'mask' is never read [clang-analyzer-deadcode.DeadStores]
                   mask &=3D (ADVERTISED_1000baseT_Half |
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:377:3: note: Value =
stored to 'mask' is never read
                   mask &=3D (ADVERTISED_1000baseT_Half |
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:825:22: warning: Va=
lue stored to 'priv' during its initialization is never read [clang-analyze=
r-deadcode.DeadStores]
           struct stmmac_priv *priv =3D netdev_priv(dev);
                               ^~~~   ~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:825:22: note: Value=
 stored to 'priv' during its initialization is never read
           struct stmmac_priv *priv =3D netdev_priv(dev);
                               ^~~~   ~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:832:22: warning: Va=
lue stored to 'priv' during its initialization is never read [clang-analyze=
r-deadcode.DeadStores]
           struct stmmac_priv *priv =3D netdev_priv(dev);
                               ^~~~   ~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:832:22: note: Value=
 stored to 'priv' during its initialization is never read
           struct stmmac_priv *priv =3D netdev_priv(dev);
                               ^~~~   ~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (3 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/i2c/rj54n1cb0c.c:687:3: warning: Value stored to 'input_w'=
 is never read [clang-analyzer-deadcode.DeadStores]

vim +/tidno +125 drivers/net/wireless/mediatek/mt76/agg-rx.c

aee5b8cf2477bb Felix Fietkau 2018-01-24  117  =

17cf68b702a60a Felix Fietkau 2018-01-27  118  static void
17cf68b702a60a Felix Fietkau 2018-01-27  119  mt76_rx_aggr_check_ctl(struct=
 sk_buff *skb, struct sk_buff_head *frames)
17cf68b702a60a Felix Fietkau 2018-01-27  120  {
17cf68b702a60a Felix Fietkau 2018-01-27  121  	struct mt76_rx_status *statu=
s =3D (struct mt76_rx_status *)skb->cb;
77ae1d5e13eb51 Ryder Lee     2020-04-25  122  	struct ieee80211_bar *bar =
=3D mt76_skb_get_hdr(skb);
17cf68b702a60a Felix Fietkau 2018-01-27  123  	struct mt76_wcid *wcid =3D s=
tatus->wcid;
17cf68b702a60a Felix Fietkau 2018-01-27  124  	struct mt76_rx_tid *tid;
e195dad1411594 Felix Fietkau 2020-12-16 @125  	u8 tidno =3D status->qos_ctl=
 & IEEE80211_QOS_CTL_TID_MASK;
17cf68b702a60a Felix Fietkau 2018-01-27  126  	u16 seqno;
17cf68b702a60a Felix Fietkau 2018-01-27  127  =

17cf68b702a60a Felix Fietkau 2018-01-27  128  	if (!ieee80211_is_ctl(bar->f=
rame_control))
17cf68b702a60a Felix Fietkau 2018-01-27  129  		return;
17cf68b702a60a Felix Fietkau 2018-01-27  130  =

17cf68b702a60a Felix Fietkau 2018-01-27  131  	if (!ieee80211_is_back_req(b=
ar->frame_control))
17cf68b702a60a Felix Fietkau 2018-01-27  132  		return;
17cf68b702a60a Felix Fietkau 2018-01-27  133  =

e195dad1411594 Felix Fietkau 2020-12-16  134  	status->qos_ctl =3D tidno =
=3D le16_to_cpu(bar->control) >> 12;
b183878a745108 Ryder Lee     2019-04-01  135  	seqno =3D IEEE80211_SEQ_TO_S=
N(le16_to_cpu(bar->start_seq_num));
e195dad1411594 Felix Fietkau 2020-12-16  136  	tid =3D rcu_dereference(wcid=
->aggr[tidno]);
17cf68b702a60a Felix Fietkau 2018-01-27  137  	if (!tid)
17cf68b702a60a Felix Fietkau 2018-01-27  138  		return;
17cf68b702a60a Felix Fietkau 2018-01-27  139  =

17cf68b702a60a Felix Fietkau 2018-01-27  140  	spin_lock_bh(&tid->lock);
e7aaa72f472845 Felix Fietkau 2019-10-07  141  	if (!tid->stopped) {
17cf68b702a60a Felix Fietkau 2018-01-27  142  		mt76_rx_aggr_release_frames=
(tid, frames, seqno);
17cf68b702a60a Felix Fietkau 2018-01-27  143  		mt76_rx_aggr_release_head(t=
id, frames);
e7aaa72f472845 Felix Fietkau 2019-10-07  144  	}
17cf68b702a60a Felix Fietkau 2018-01-27  145  	spin_unlock_bh(&tid->lock);
17cf68b702a60a Felix Fietkau 2018-01-27  146  }
17cf68b702a60a Felix Fietkau 2018-01-27  147  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2617691043578021126==--

