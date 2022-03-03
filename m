Content-Type: multipart/mixed; boundary="===============3431042161127760329=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2671/10053] drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c:147:0: warning: syntax error [syntaxError]
Date: Thu, 03 Mar 2022 11:12:05 +0800
Message-ID: <202203030946.sSkWGAKe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3431042161127760329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Horatiu Vultur <horatiu.vultur@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   adaedcf826dccf01b69d9a1f1997c9446c6b2c54
commit: 77eecf25bd9d2f07673b3a62b86ba1b224b65d9e [2671/10053] net: lan966x:=
 Update extraction/injection for timestamping
:::::: branch date: 15 hours ago
:::::: commit date: 4 weeks ago
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c:147:0: warning: syn=
tax error [syntaxError]
   =

   ^
--
>> drivers/net/wireless/ath/ath9k/rng.c:0:0: warning: Invalid value: 0x7800=
00_S [cppcheckError]
   =

   ^
   drivers/net/wireless/ath/ath9k/rng.c:0:0: note: Invalid value: 0x780000_S
   =

   ^
   drivers/net/wireless/ath/ath9k/rng.c:0:0: note: Invalid value: 0x780000_S
   =

   ^
>> drivers/net/wireless/ath/ath10k/txrx.c:160:31: warning: Uninitialized va=
riable: peer [uninitvar]
    if (peer_id >=3D BITS_PER_TYPE(peer->peer_ids))
                                 ^
--
>> drivers/net/wireless/ath/wcn36xx/main.c:421:11: warning: Identical inner=
 'if' condition is always true. [identicalInnerCondition]
      if (wcn->sw_scan_channel)
             ^
   drivers/net/wireless/ath/wcn36xx/main.c:416:42: note: outer condition: w=
cn->sw_scan_channel
     if (wcn->sw_scan_opchannel =3D=3D ch && wcn->sw_scan_channel) {
                                            ^
   drivers/net/wireless/ath/wcn36xx/main.c:421:11: note: identical inner co=
ndition: wcn->sw_scan_channel
      if (wcn->sw_scan_channel)
             ^
>> drivers/net/wireless/ath/wcn36xx/smd.c:885:2: warning: Redundant pointer=
 operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    PREPARE_HAL_BUF(wcn->hal_buf, (*msg_body));
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:996:2: warning: Redundant pointer=
 operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    PREPARE_HAL_BUF(wcn->hal_buf, (*msg_body));
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:1774:2: warning: Redundant pointe=
r operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    PREPARE_HAL_BUF(wcn->hal_buf, (*msg_body));
    ^
>> drivers/net/wireless/ath/wcn36xx/smd.c:1815:2: warning: Redundant pointe=
r operation on 'msg' - it's already a pointer. [redundantPointerOp]
    PREPARE_HAL_BUF(wcn->hal_buf, (*msg));
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
--===============3431042161127760329==--

