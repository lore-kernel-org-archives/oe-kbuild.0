Content-Type: multipart/mixed; boundary="===============3607714454053196861=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/realtek/rtw88/phy.c:1599:12: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 28 Aug 2022 17:58:56 +0800
Message-ID: <202208281709.E3a97e9c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3607714454053196861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/wireless/realtek/rtw88/phy.c:1599:12: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Zong-Zhe Yang" <kevin_yang@realtek.com>
CC: Kalle Valo <kvalo@codeaurora.org>
CC: "Ping-Ke Shih" <pkshih@realtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   10d4879f9ef01cc6190fafe4257d06f375bab92c
commit: f8509c38ececde7fb0f0bc9959f79d2a34be577d rtw88: upgrade rtw_regulat=
ory mechanism and mapping
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220827 (https://download.01.org/0day-ci/archi=
ve/20220828/202208281709.E3a97e9c-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df8509c38ececde7fb0f0bc9959f79d2a34be577d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f8509c38ececde7fb0f0bc9959f79d2a34be577d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/net/wireless/realtek/rtw88/phy.c: In function 'rtw_parse_tbl_txp=
wr_lmt':
>> drivers/net/wireless/realtek/rtw88/phy.c:1599:12: warning: use of uninit=
ialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1599 |         u8 regd_alt;
         |            ^~~~~~~~
     'rtw_parse_tbl_txpwr_lmt': event 1
       |
       | 1599 |         u8 regd_alt;
       |      |            ^~~~~~~~
       |      |            |
       |      |            (1) use of uninitialized value '<unknown>' here
       |

vim +1599 drivers/net/wireless/realtek/rtw88/phy.c

f8509c38ececde Zong-Zhe Yang    2021-08-30  1592  =

fa6dfe6bff246d Yan-Hsuan Chuang 2019-05-29  1593  void rtw_parse_tbl_txpwr_=
lmt(struct rtw_dev *rtwdev,
fa6dfe6bff246d Yan-Hsuan Chuang 2019-05-29  1594  			     const struct rtw_=
table *tbl)
fa6dfe6bff246d Yan-Hsuan Chuang 2019-05-29  1595  {
3457f86da60de7 Brian Norris     2019-07-12  1596  	const struct rtw_txpwr_l=
mt_cfg_pair *p =3D tbl->data;
3457f86da60de7 Brian Norris     2019-07-12  1597  	const struct rtw_txpwr_l=
mt_cfg_pair *end =3D p + tbl->size;
f8509c38ececde Zong-Zhe Yang    2021-08-30  1598  	u32 regd_cfg_flag =3D 0;
f8509c38ececde Zong-Zhe Yang    2021-08-30 @1599  	u8 regd_alt;
f8509c38ececde Zong-Zhe Yang    2021-08-30  1600  	u8 i;
fa6dfe6bff246d Yan-Hsuan Chuang 2019-05-29  1601  =

fa6dfe6bff246d Yan-Hsuan Chuang 2019-05-29  1602  	for (; p < end; p++) {
f8509c38ececde Zong-Zhe Yang    2021-08-30  1603  		regd_cfg_flag |=3D BIT(=
p->regd);
43712199e05b51 Yan-Hsuan Chuang 2019-05-29  1604  		rtw_phy_set_tx_power_li=
mit(rtwdev, p->regd, p->band,
43712199e05b51 Yan-Hsuan Chuang 2019-05-29  1605  					   p->bw, p->rs, p->=
ch, p->txpwr_lmt);
fa6dfe6bff246d Yan-Hsuan Chuang 2019-05-29  1606  	}
93f68a865f1193 Zong-Zhe Yang    2019-05-29  1607  =

f8509c38ececde Zong-Zhe Yang    2021-08-30  1608  	for (i =3D 0; i < RTW_RE=
GD_MAX; i++) {
f8509c38ececde Zong-Zhe Yang    2021-08-30  1609  		if (i =3D=3D RTW_REGD_W=
W)
f8509c38ececde Zong-Zhe Yang    2021-08-30  1610  			continue;
f8509c38ececde Zong-Zhe Yang    2021-08-30  1611  =

f8509c38ececde Zong-Zhe Yang    2021-08-30  1612  		if (regd_cfg_flag & BIT=
(i))
f8509c38ececde Zong-Zhe Yang    2021-08-30  1613  			continue;
f8509c38ececde Zong-Zhe Yang    2021-08-30  1614  =

f8509c38ececde Zong-Zhe Yang    2021-08-30  1615  		rtw_dbg(rtwdev, RTW_DBG=
_REGD,
f8509c38ececde Zong-Zhe Yang    2021-08-30  1616  			"txpwr regd %d does no=
t be configured\n", i);
f8509c38ececde Zong-Zhe Yang    2021-08-30  1617  =

f8509c38ececde Zong-Zhe Yang    2021-08-30  1618  		if (rtw_regd_has_alt(i,=
 &regd_alt) &&
f8509c38ececde Zong-Zhe Yang    2021-08-30  1619  		    regd_cfg_flag & BIT=
(regd_alt)) {
f8509c38ececde Zong-Zhe Yang    2021-08-30  1620  			rtw_dbg(rtwdev, RTW_DB=
G_REGD,
f8509c38ececde Zong-Zhe Yang    2021-08-30  1621  				"cfg txpwr regd %d by=
 regd %d as alternative\n",
f8509c38ececde Zong-Zhe Yang    2021-08-30  1622  				i, regd_alt);
f8509c38ececde Zong-Zhe Yang    2021-08-30  1623  =

f8509c38ececde Zong-Zhe Yang    2021-08-30  1624  			rtw_cfg_txpwr_lmt_by_a=
lt(rtwdev, i, regd_alt);
f8509c38ececde Zong-Zhe Yang    2021-08-30  1625  			continue;
f8509c38ececde Zong-Zhe Yang    2021-08-30  1626  		}
f8509c38ececde Zong-Zhe Yang    2021-08-30  1627  =

f8509c38ececde Zong-Zhe Yang    2021-08-30  1628  		rtw_dbg(rtwdev, RTW_DBG=
_REGD, "cfg txpwr regd %d by WW\n", i);
f8509c38ececde Zong-Zhe Yang    2021-08-30  1629  		rtw_cfg_txpwr_lmt_by_al=
t(rtwdev, i, RTW_REGD_WW);
f8509c38ececde Zong-Zhe Yang    2021-08-30  1630  	}
f8509c38ececde Zong-Zhe Yang    2021-08-30  1631  =

93f68a865f1193 Zong-Zhe Yang    2019-05-29  1632  	rtw_xref_txpwr_lmt(rtwde=
v);
fa6dfe6bff246d Yan-Hsuan Chuang 2019-05-29  1633  }
449be86670f502 Zong-Zhe Yang    2020-05-15  1634  EXPORT_SYMBOL(rtw_parse_t=
bl_txpwr_lmt);
fa6dfe6bff246d Yan-Hsuan Chuang 2019-05-29  1635  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3607714454053196861==--

