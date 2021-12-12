Content-Type: multipart/mixed; boundary="===============5319772546675196611=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/realtek/rtw89/rtw8852a.c:1820 rtw8852a_btc_set_wl_txpwr_ctrl() error: uninitialized symbol '_cur'.
Date: Sun, 12 Dec 2021 10:30:13 +0800
Message-ID: <202112121053.PakchGHm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5319772546675196611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Ping-Ke Shih" <pkshih@realtek.com>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbdff6d583be718935b613ab2a966cddaadf661f
commit: e3ec7017f6a20d12ddd9fe23d345ebb7b8c104dd rtw89: add Realtek 802.11a=
x driver
date:   9 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 weeks ago
config: i386-randconfig-m031-20211211 (https://download.01.org/0day-ci/arch=
ive/20211212/202112121053.PakchGHm-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/realtek/rtw89/rtw8852a.c:1820 rtw8852a_btc_set_wl_txpw=
r_ctrl() error: uninitialized symbol '_cur'.

Old smatch warnings:
drivers/net/wireless/realtek/rtw89/rtw8852a.c:1821 rtw8852a_btc_set_wl_txpw=
r_ctrl() error: uninitialized symbol '_cur'.

vim +/_cur +1820 drivers/net/wireless/realtek/rtw89/rtw8852a.c

e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1794  =

e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1795  static void
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1796  rtw8852a_btc_set_wl_txpwr_ctr=
l(struct rtw89_dev *rtwdev, u32 txpwr_val)
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1797  {
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1798  	const u32 __btc_cr_all_time =
=3D R_AX_PWR_RATE_CTRL;
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1799  	const u32 __btc_cr_gnt_bt =
=3D R_AX_PWR_COEXT_CTRL;
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1800  =

e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1801  #define __do_clr(_chk) ((_chk=
) =3D=3D GENMASK(15, 0))
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1802  #define __handle(_case)						=
	\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1803  	do {								\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1804  		const u32 _reg =3D __btc_cr=
_ ## _case;			\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1805  		u32 _val =3D __btc_ctrl_val=
_ ## _case(txpwr_val);		\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1806  		u32 _cur, _wrt;						\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1807  		rtw89_debug(rtwdev, RTW89_D=
BG_TXPWR,			\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1808  			    "btc ctrl %s: 0x%x\n",=
 #_case, _val);	\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1809  		rtw89_mac_txpwr_read32(rtwd=
ev, RTW89_PHY_0, _reg, &_cur);\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1810  		rtw89_debug(rtwdev, RTW89_D=
BG_TXPWR,			\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1811  			    "btc ctrl ori 0x%x: 0x=
%x\n", _reg, _cur);	\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1812  		_wrt =3D __do_clr(_val) ?		=
			\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1813  			__btc_ctrl_rst_ ## _case(_=
cur) :		\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1814  			__btc_ctrl_gen_ ## _case(_=
cur, _val);		\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1815  		rtw89_mac_txpwr_write32(rtw=
dev, RTW89_PHY_0, _reg, _wrt);\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1816  		rtw89_debug(rtwdev, RTW89_D=
BG_TXPWR,			\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1817  			    "btc ctrl set 0x%x: 0x=
%x\n", _reg, _wrt);	\
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1818  	} while (0)
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1819  =

e3ec7017f6a20d Ping-Ke Shih 2021-10-11 @1820  	__handle(all_time);
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1821  	__handle(gnt_bt);
e3ec7017f6a20d Ping-Ke Shih 2021-10-11  1822  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5319772546675196611==--

