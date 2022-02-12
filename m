Content-Type: multipart/mixed; boundary="===============5478816076054887114=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bluetooth-next:master 124/135] drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c:147:0: warning: syntax error [syntaxError]
Date: Sat, 12 Feb 2022 13:03:51 +0800
Message-ID: <202202121024.0HxEHxFg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5478816076054887114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-bluetooth(a)vger.kernel.org
TO: Horatiu Vultur <horatiu.vultur@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
head:   9b9f89c60d64d1dd184e904e2757875644f29b6e
commit: 77eecf25bd9d2f07673b3a62b86ba1b224b65d9e [124/135] net: lan966x: Up=
date extraction/injection for timestamping
:::::: branch date: 11 hours ago
:::::: commit date: 11 days ago
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c:147:0: warning: syn=
tax error [syntaxError]
   =

   ^

vim +147 drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c

77eecf25bd9d2f Horatiu Vultur 2022-01-31  139  =

77eecf25bd9d2f Horatiu Vultur 2022-01-31  140  static void lan966x_ptp_txts=
tamp_old_release(struct lan966x_port *port)
77eecf25bd9d2f Horatiu Vultur 2022-01-31  141  {
77eecf25bd9d2f Horatiu Vultur 2022-01-31  142  	struct sk_buff *skb, *skb_t=
mp;
77eecf25bd9d2f Horatiu Vultur 2022-01-31  143  	unsigned long flags;
77eecf25bd9d2f Horatiu Vultur 2022-01-31  144  =

77eecf25bd9d2f Horatiu Vultur 2022-01-31  145  	spin_lock_irqsave(&port->tx=
_skbs.lock, flags);
77eecf25bd9d2f Horatiu Vultur 2022-01-31  146  	skb_queue_walk_safe(&port->=
tx_skbs, skb, skb_tmp) {
77eecf25bd9d2f Horatiu Vultur 2022-01-31 @147  		if time_after(LAN966X_SKB_=
CB(skb)->jiffies + LAN966X_PTP_TIMEOUT,
77eecf25bd9d2f Horatiu Vultur 2022-01-31  148  			      jiffies)
77eecf25bd9d2f Horatiu Vultur 2022-01-31  149  			break;
77eecf25bd9d2f Horatiu Vultur 2022-01-31  150  =

77eecf25bd9d2f Horatiu Vultur 2022-01-31  151  		__skb_unlink(skb, &port->t=
x_skbs);
77eecf25bd9d2f Horatiu Vultur 2022-01-31  152  		dev_kfree_skb_any(skb);
77eecf25bd9d2f Horatiu Vultur 2022-01-31  153  	}
77eecf25bd9d2f Horatiu Vultur 2022-01-31  154  	spin_unlock_irqrestore(&por=
t->tx_skbs.lock, flags);
77eecf25bd9d2f Horatiu Vultur 2022-01-31  155  }
77eecf25bd9d2f Horatiu Vultur 2022-01-31  156  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5478816076054887114==--

