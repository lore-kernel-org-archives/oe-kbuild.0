Content-Type: multipart/mixed; boundary="===============5775220605850874442=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 11/27] drivers/net/wireless/realtek/rtw89/fw.c:1898 rtw89_append_probe_req_ie() error: uninitialized symbol 'ret'.
Date: Mon, 18 Apr 2022 21:27:01 +0800
Message-ID: <202204182138.sTI7cefv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5775220605850874442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   f8ff9bfb2516afc5d92804d124874892bced0b62
commit: fb4648e8f697bbfcbcdda2ec5d8f022befd6db7a [11/27] BACKPORT: rtw89: 8=
852a: add ieee80211_ops::hw_scan
:::::: branch date: 3 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220418/202204182138.sTI7cefv-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/realtek/rtw89/fw.c:1898 rtw89_append_probe_req_ie() er=
ror: uninitialized symbol 'ret'.

vim +/ret +1898 drivers/net/wireless/realtek/rtw89/fw.c

fb4648e8f697bb Po Hao Huang 2022-02-25  1859  =

fb4648e8f697bb Po Hao Huang 2022-02-25  1860  static int rtw89_append_probe=
_req_ie(struct rtw89_dev *rtwdev,
fb4648e8f697bb Po Hao Huang 2022-02-25  1861  				     struct rtw89_vif *rt=
wvif,
fb4648e8f697bb Po Hao Huang 2022-02-25  1862  				     struct sk_buff *skb)
fb4648e8f697bb Po Hao Huang 2022-02-25  1863  {
fb4648e8f697bb Po Hao Huang 2022-02-25  1864  	struct rtw89_hw_scan_info *s=
can_info =3D &rtwdev->scan_info;
fb4648e8f697bb Po Hao Huang 2022-02-25  1865  	struct ieee80211_scan_ies *i=
es =3D rtwvif->scan_ies;
fb4648e8f697bb Po Hao Huang 2022-02-25  1866  	struct rtw89_pktofld_info *i=
nfo;
fb4648e8f697bb Po Hao Huang 2022-02-25  1867  	struct sk_buff *new;
fb4648e8f697bb Po Hao Huang 2022-02-25  1868  	int ret;
fb4648e8f697bb Po Hao Huang 2022-02-25  1869  	u8 band;
fb4648e8f697bb Po Hao Huang 2022-02-25  1870  =

fb4648e8f697bb Po Hao Huang 2022-02-25  1871  	for (band =3D NL80211_BAND_2=
GHZ; band < NUM_NL80211_BANDS; band++) {
fb4648e8f697bb Po Hao Huang 2022-02-25  1872  		if (!(rtwdev->chip->support=
_bands & BIT(band)))
fb4648e8f697bb Po Hao Huang 2022-02-25  1873  			continue;
fb4648e8f697bb Po Hao Huang 2022-02-25  1874  =

fb4648e8f697bb Po Hao Huang 2022-02-25  1875  		new =3D skb_copy(skb, GFP_K=
ERNEL);
fb4648e8f697bb Po Hao Huang 2022-02-25  1876  		if (!new) {
fb4648e8f697bb Po Hao Huang 2022-02-25  1877  			ret =3D -ENOMEM;
fb4648e8f697bb Po Hao Huang 2022-02-25  1878  			goto out;
fb4648e8f697bb Po Hao Huang 2022-02-25  1879  		}
fb4648e8f697bb Po Hao Huang 2022-02-25  1880  		skb_put_data(new, ies->ies[=
band], ies->len[band]);
fb4648e8f697bb Po Hao Huang 2022-02-25  1881  		skb_put_data(new, ies->comm=
on_ies, ies->common_ie_len);
fb4648e8f697bb Po Hao Huang 2022-02-25  1882  =

fb4648e8f697bb Po Hao Huang 2022-02-25  1883  		info =3D kzalloc(sizeof(*in=
fo), GFP_KERNEL);
fb4648e8f697bb Po Hao Huang 2022-02-25  1884  		if (!info) {
fb4648e8f697bb Po Hao Huang 2022-02-25  1885  			ret =3D -ENOMEM;
fb4648e8f697bb Po Hao Huang 2022-02-25  1886  			kfree_skb(new);
fb4648e8f697bb Po Hao Huang 2022-02-25  1887  			goto out;
fb4648e8f697bb Po Hao Huang 2022-02-25  1888  		}
fb4648e8f697bb Po Hao Huang 2022-02-25  1889  =

fb4648e8f697bb Po Hao Huang 2022-02-25  1890  		list_add_tail(&info->list, =
&scan_info->pkt_list[band]);
fb4648e8f697bb Po Hao Huang 2022-02-25  1891  		ret =3D rtw89_fw_h2c_add_pk=
t_offload(rtwdev, &info->id, new);
fb4648e8f697bb Po Hao Huang 2022-02-25  1892  		if (ret)
fb4648e8f697bb Po Hao Huang 2022-02-25  1893  			goto out;
fb4648e8f697bb Po Hao Huang 2022-02-25  1894  =

fb4648e8f697bb Po Hao Huang 2022-02-25  1895  		kfree_skb(new);
fb4648e8f697bb Po Hao Huang 2022-02-25  1896  	}
fb4648e8f697bb Po Hao Huang 2022-02-25  1897  out:
fb4648e8f697bb Po Hao Huang 2022-02-25 @1898  	return ret;
fb4648e8f697bb Po Hao Huang 2022-02-25  1899  }
fb4648e8f697bb Po Hao Huang 2022-02-25  1900  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5775220605850874442==--

