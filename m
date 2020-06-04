Content-Type: multipart/mixed; boundary="===============4941200221458562606=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:463:26: warning: Undefined behavior: Variable 'set_link_str' is used as parameter and destination in
Date: Thu, 04 Jun 2020 19:49:58 +0800
Message-ID: <202006041955.V3Omiswl%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4941200221458562606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Luo, bin," <luobin9@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6929f71e46bdddbf1c4d67c2728648176c67c555
commit: 01f2b3dac8c4bebeb0ec15c4b7b59993766493cc hinic: add link_ksettings =
ethtool_ops support
date:   3 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> net/netlink/genetlink.c:480:68: warning: Clarify calculation precedence =
for '&' and '?'. [clarifyCalculation]
    enum netlink_validation validate =3D ops->validate & no_strict_flag ?
                                                                      ^
--
>> net/ipv6/seg6.c:124:7: warning: Variable 'err' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     err =3D seg6_hmac_info_del(net, hmackeyid);
         ^
   net/ipv6/seg6.c:122:8: note: Variable 'err' is reassigned a value before=
 the old one has been used.
      err =3D -ENOENT;
          ^
   net/ipv6/seg6.c:124:7: note: Variable 'err' is reassigned a value before=
 the old one has been used.
     err =3D seg6_hmac_info_del(net, hmackeyid);
         ^
--
>> net/ipv6/seg6_iptunnel.c:333:6: warning: Variable 'err' is reassigned a =
value before the old one has been used. [redundantAssignment]
    err =3D seg6_do_srh(skb);
        ^
   net/ipv6/seg6_iptunnel.c:331:0: note: Variable 'err' is reassigned a val=
ue before the old one has been used.
    int err =3D -EINVAL;
   ^
   net/ipv6/seg6_iptunnel.c:333:6: note: Variable 'err' is reassigned a val=
ue before the old one has been used.
    err =3D seg6_do_srh(skb);
        ^
>> net/ipv6/seg6_local.c:434:6: warning: Variable 'err' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
    err =3D seg6_do_srh_inline(skb, slwt->srh);
        ^
   net/ipv6/seg6_local.c:428:0: note: Variable 'err' is reassigned a value =
before the old one has been used.
    int err =3D -EINVAL;
   ^
   net/ipv6/seg6_local.c:434:6: note: Variable 'err' is reassigned a value =
before the old one has been used.
    err =3D seg6_do_srh_inline(skb, slwt->srh);
        ^
   net/ipv6/seg6_local.c:466:6: warning: Variable 'err' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
    err =3D seg6_do_srh_encap(skb, slwt->srh, IPPROTO_IPV6);
        ^
   net/ipv6/seg6_local.c:455:0: note: Variable 'err' is reassigned a value =
before the old one has been used.
    int err =3D -EINVAL;
   ^
   net/ipv6/seg6_local.c:466:6: note: Variable 'err' is reassigned a value =
before the old one has been used.
    err =3D seg6_do_srh_encap(skb, slwt->srh, IPPROTO_IPV6);
        ^
>> net/tipc/crypto.c:1126:5: warning: Variable 'rc' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    rc =3D new_key;
       ^
   net/tipc/crypto.c:1082:0: note: Variable 'rc' is reassigned a value befo=
re the old one has been used.
    int rc =3D -EBUSY;
   ^
   net/tipc/crypto.c:1126:5: note: Variable 'rc' is reassigned a value befo=
re the old one has been used.
    rc =3D new_key;
       ^
   lib/xxhash.c:273:33: warning: Either the condition 'input=3D=3DNULL' is =
redundant or there is pointer arithmetic with NULL pointer. [nullPointerAri=
thmeticRedundantCheck]
    const uint8_t *const b_end =3D p + len;
                                   ^
   lib/xxhash.c:275:12: note: Assuming that condition 'input=3D=3DNULL' is =
not redundant
    if (input =3D=3D NULL)
              ^
   lib/xxhash.c:272:21: note: Assignment 'p=3D(const uint8_t*)input', assig=
ned value is 0
    const uint8_t *p =3D (const uint8_t *)input;
                       ^
   lib/xxhash.c:273:33: note: Null pointer addition
    const uint8_t *const b_end =3D p + len;
                                   ^
   lib/xxhash.c:380:33: warning: Either the condition 'input=3D=3DNULL' is =
redundant or there is pointer arithmetic with NULL pointer. [nullPointerAri=
thmeticRedundantCheck]
    const uint8_t *const b_end =3D p + len;
                                   ^
   lib/xxhash.c:382:12: note: Assuming that condition 'input=3D=3DNULL' is =
not redundant
    if (input =3D=3D NULL)
              ^
   lib/xxhash.c:379:21: note: Assignment 'p=3D(const uint8_t*)input', assig=
ned value is 0
    const uint8_t *p =3D (const uint8_t *)input;
                       ^
   lib/xxhash.c:380:33: note: Null pointer addition
    const uint8_t *const b_end =3D p + len;
                                   ^
>> lib/xxhash.c:300:3: warning: Variable 'p32' is modified but its new valu=
e is never used. [unreadVariable]
     p32++;
     ^
--
>> drivers/net/ethernet/huawei/hinic/hinic_ethtool.c:463:26: warning: Undef=
ined behavior: Variable 'set_link_str' is used as parameter and destination=
 in s[n]printf(). [sprintfOverlappingData]
             "%sspeed %d ", set_link_str, speed);
                            ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D01f2b3dac8c4bebeb0ec15c4b7b59993766493cc
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 01f2b3dac8c4bebeb0ec15c4b7b59993766493cc
vim +/set_link_str +463 drivers/net/ethernet/huawei/hinic/hinic_ethtool.c

01f2b3dac8c4be Luo bin 2020-05-11  441  =

01f2b3dac8c4be Luo bin 2020-05-11  442  static int hinic_set_settings_to_hw=
(struct hinic_dev *nic_dev,
01f2b3dac8c4be Luo bin 2020-05-11  443  				    u32 set_settings, u8 autone=
g, u32 speed)
01f2b3dac8c4be Luo bin 2020-05-11  444  {
01f2b3dac8c4be Luo bin 2020-05-11  445  	struct hinic_link_ksettings_info s=
ettings =3D {0};
01f2b3dac8c4be Luo bin 2020-05-11  446  	char set_link_str[SET_LINK_STR_MAX=
_LEN] =3D {0};
01f2b3dac8c4be Luo bin 2020-05-11  447  	struct net_device *netdev =3D nic_=
dev->netdev;
01f2b3dac8c4be Luo bin 2020-05-11  448  	enum nic_speed_level speed_level =
=3D 0;
01f2b3dac8c4be Luo bin 2020-05-11  449  	int err;
01f2b3dac8c4be Luo bin 2020-05-11  450  =

01f2b3dac8c4be Luo bin 2020-05-11  451  	err =3D snprintf(set_link_str, SET=
_LINK_STR_MAX_LEN, "%s",
01f2b3dac8c4be Luo bin 2020-05-11  452  		       (set_settings & HILINK_LIN=
K_SET_AUTONEG) ?
01f2b3dac8c4be Luo bin 2020-05-11  453  		       (autoneg ? "autong enable =
" : "autong disable ") : "");
01f2b3dac8c4be Luo bin 2020-05-11  454  	if (err < 0 || err >=3D SET_LINK_S=
TR_MAX_LEN) {
01f2b3dac8c4be Luo bin 2020-05-11  455  		netif_err(nic_dev, drv, netdev, "=
Failed to snprintf link state, function return(%d) and dest_len(%d)\n",
01f2b3dac8c4be Luo bin 2020-05-11  456  			  err, SET_LINK_STR_MAX_LEN);
01f2b3dac8c4be Luo bin 2020-05-11  457  		return -EFAULT;
01f2b3dac8c4be Luo bin 2020-05-11  458  	}
01f2b3dac8c4be Luo bin 2020-05-11  459  =

01f2b3dac8c4be Luo bin 2020-05-11  460  	if (set_settings & HILINK_LINK_SET=
_SPEED) {
01f2b3dac8c4be Luo bin 2020-05-11  461  		speed_level =3D hinic_ethtool_to_=
hw_speed_level(speed);
01f2b3dac8c4be Luo bin 2020-05-11  462  		err =3D snprintf(set_link_str, SE=
T_LINK_STR_MAX_LEN,
01f2b3dac8c4be Luo bin 2020-05-11 @463  			       "%sspeed %d ", set_link_s=
tr, speed);
01f2b3dac8c4be Luo bin 2020-05-11  464  		if (err <=3D 0 || err >=3D SET_LI=
NK_STR_MAX_LEN) {
01f2b3dac8c4be Luo bin 2020-05-11  465  			netif_err(nic_dev, drv, netdev, =
"Failed to snprintf link speed, function return(%d) and dest_len(%d)\n",
01f2b3dac8c4be Luo bin 2020-05-11  466  				  err, SET_LINK_STR_MAX_LEN);
01f2b3dac8c4be Luo bin 2020-05-11  467  			return -EFAULT;
01f2b3dac8c4be Luo bin 2020-05-11  468  		}
01f2b3dac8c4be Luo bin 2020-05-11  469  	}
01f2b3dac8c4be Luo bin 2020-05-11  470  =

01f2b3dac8c4be Luo bin 2020-05-11  471  	settings.func_id =3D HINIC_HWIF_FU=
NC_IDX(nic_dev->hwdev->hwif);
01f2b3dac8c4be Luo bin 2020-05-11  472  	settings.valid_bitmap =3D set_sett=
ings;
01f2b3dac8c4be Luo bin 2020-05-11  473  	settings.autoneg =3D autoneg;
01f2b3dac8c4be Luo bin 2020-05-11  474  	settings.speed =3D speed_level;
01f2b3dac8c4be Luo bin 2020-05-11  475  =

01f2b3dac8c4be Luo bin 2020-05-11  476  	err =3D hinic_set_link_settings(ni=
c_dev->hwdev, &settings);
01f2b3dac8c4be Luo bin 2020-05-11  477  	if (err !=3D HINIC_MGMT_CMD_UNSUPP=
ORTED) {
01f2b3dac8c4be Luo bin 2020-05-11  478  		if (err)
01f2b3dac8c4be Luo bin 2020-05-11  479  			netif_err(nic_dev, drv, netdev, =
"Set %s failed\n",
01f2b3dac8c4be Luo bin 2020-05-11  480  				  set_link_str);
01f2b3dac8c4be Luo bin 2020-05-11  481  		else
01f2b3dac8c4be Luo bin 2020-05-11  482  			netif_info(nic_dev, drv, netdev,=
 "Set %s successfully\n",
01f2b3dac8c4be Luo bin 2020-05-11  483  				   set_link_str);
01f2b3dac8c4be Luo bin 2020-05-11  484  =

01f2b3dac8c4be Luo bin 2020-05-11  485  		return err;
01f2b3dac8c4be Luo bin 2020-05-11  486  	}
01f2b3dac8c4be Luo bin 2020-05-11  487  =

01f2b3dac8c4be Luo bin 2020-05-11  488  	return set_link_settings_separate_=
cmd(nic_dev, set_settings, autoneg,
01f2b3dac8c4be Luo bin 2020-05-11  489  					      speed);
01f2b3dac8c4be Luo bin 2020-05-11  490  }
01f2b3dac8c4be Luo bin 2020-05-11  491  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4941200221458562606==--

