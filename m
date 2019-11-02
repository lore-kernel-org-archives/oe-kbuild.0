Content-Type: multipart/mixed; boundary="===============5179109414491389049=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [wireless-drivers-next:master 106/112] drivers/net/wireless/realtek/rtw88/main.c:1030 rtw_load_firmware_cb() error: we previously assumed 'firmware' could be null (see line 1027)
Date: Sat, 02 Nov 2019 21:57:04 +0300
Message-ID: <20191102185704.GD21796@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5179109414491389049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-driv=
ers-next.git master
head:   086ddf860650cfa3065d6698fae81335b1846cdb
commit: 5195b904264098839144d08d23c600811de2e2da [106/112] rtw88: avoid FW =
info flood

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/realtek/rtw88/main.c:1030 rtw_load_firmware_cb() error=
: we previously assumed 'firmware' could be null (see line 1027)

Old smatch warnings:
include/linux/compiler.h:226 __write_once_size() warn: potential memory cor=
rupting cast 8 vs 4 bytes

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-ne=
xt.git/commit/?id=3D5195b904264098839144d08d23c600811de2e2da
git remote add wireless-drivers-next https://git.kernel.org/pub/scm/linux/k=
ernel/git/kvalo/wireless-drivers-next.git
git remote update wireless-drivers-next
git checkout 5195b904264098839144d08d23c600811de2e2da
vim +/firmware +1030 drivers/net/wireless/realtek/rtw88/main.c

e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1021  static void rtw_load_firm=
ware_cb(const struct firmware *firmware, void *context)
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1022  {
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1023  	struct rtw_dev *rtwdev =
=3D context;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1024  	struct rtw_fw_state *fw =
=3D &rtwdev->fw;
5195b904264098 Yan-Hsuan Chuang 2019-10-25  1025  	const struct rtw_fw_hdr =
*fw_hdr;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1026  =

e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26 @1027  	if (!firmware)
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1028  		rtw_err(rtwdev, "failed=
 to request firmware\n");

If firmware is NULL then

e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1029  =

5195b904264098 Yan-Hsuan Chuang 2019-10-25 @1030  	fw_hdr =3D (const struct=
 rtw_fw_hdr *)firmware->data;
                                                                           =
                 ^^^^^^^^^^^^^^^
the current code just prints an error message and then crashes.

5195b904264098 Yan-Hsuan Chuang 2019-10-25  1031  	fw->h2c_version =3D le16=
_to_cpu(fw_hdr->h2c_fmt_ver);
5195b904264098 Yan-Hsuan Chuang 2019-10-25  1032  	fw->version =3D le16_to_=
cpu(fw_hdr->version);
5195b904264098 Yan-Hsuan Chuang 2019-10-25  1033  	fw->sub_version =3D fw_h=
dr->subversion;
5195b904264098 Yan-Hsuan Chuang 2019-10-25  1034  	fw->sub_index =3D fw_hdr=
->subindex;
5195b904264098 Yan-Hsuan Chuang 2019-10-25  1035  =

e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1036  	fw->firmware =3D firmwar=
e;
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1037  	complete_all(&fw->comple=
tion);
5195b904264098 Yan-Hsuan Chuang 2019-10-25  1038  =

5195b904264098 Yan-Hsuan Chuang 2019-10-25  1039  	rtw_info(rtwdev, "Firmwa=
re version %u.%u.%u, H2C version %u\n",
5195b904264098 Yan-Hsuan Chuang 2019-10-25  1040  		 fw->version, fw->sub_v=
ersion, fw->sub_index, fw->h2c_version);
e3037485c68ec1 Yan-Hsuan Chuang 2019-04-26  1041  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============5179109414491389049==--

