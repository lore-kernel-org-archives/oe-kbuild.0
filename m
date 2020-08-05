Content-Type: multipart/mixed; boundary="===============9134735767518083753=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c:120:2: warning: Local variable ret shadows outer variable
Date: Wed, 05 Aug 2020 16:44:21 +0300
Message-ID: <20200805134421.GP5493@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9134735767518083753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2324d50d051ec0f14a548e78554fb02513d6dcef
commit: 02ed76b6da0710a9d24f36a4a9800a68d7edb9a7 drivers: drm: panel: Add A=
SUS TM5P5 NT35596 panel driver

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c:120:2: warning: Loc=
al variable ret shadows outer variable [shadowVar]
    dsi_dcs_write_seq(dsi, 0x4f, 0x01);
    ^
   drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c:105:6: note: Shadow=
ed declaration
    int ret;
        ^
   drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c:120:2: note: Shadow=
 variable
    dsi_dcs_write_seq(dsi, 0x4f, 0x01);
    ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D02ed76b6da0710a9d24f36a4a9800a68d7edb9a7
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 02ed76b6da0710a9d24f36a4a9800a68d7edb9a7
vim +120 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c

02ed76b6da0710a Konrad Dybcio 2020-05-06  101  static int tm5p5_nt35596_off=
(struct tm5p5_nt35596 *ctx)
02ed76b6da0710a Konrad Dybcio 2020-05-06  102  {
02ed76b6da0710a Konrad Dybcio 2020-05-06  103  	struct mipi_dsi_device *dsi=
 =3D ctx->dsi;
02ed76b6da0710a Konrad Dybcio 2020-05-06  104  	struct device *dev =3D &dsi=
->dev;
02ed76b6da0710a Konrad Dybcio 2020-05-06  105  	int ret;
02ed76b6da0710a Konrad Dybcio 2020-05-06  106  =

02ed76b6da0710a Konrad Dybcio 2020-05-06  107  	ret =3D mipi_dsi_dcs_set_di=
splay_off(dsi);
02ed76b6da0710a Konrad Dybcio 2020-05-06  108  	if (ret < 0) {
02ed76b6da0710a Konrad Dybcio 2020-05-06  109  		dev_err(dev, "Failed to se=
t display off: %d\n", ret);
02ed76b6da0710a Konrad Dybcio 2020-05-06  110  		return ret;
02ed76b6da0710a Konrad Dybcio 2020-05-06  111  	}
02ed76b6da0710a Konrad Dybcio 2020-05-06  112  	msleep(60);
02ed76b6da0710a Konrad Dybcio 2020-05-06  113  =

02ed76b6da0710a Konrad Dybcio 2020-05-06  114  	ret =3D mipi_dsi_dcs_enter_=
sleep_mode(dsi);
02ed76b6da0710a Konrad Dybcio 2020-05-06  115  	if (ret < 0) {
02ed76b6da0710a Konrad Dybcio 2020-05-06  116  		dev_err(dev, "Failed to en=
ter sleep mode: %d\n", ret);
02ed76b6da0710a Konrad Dybcio 2020-05-06  117  		return ret;
02ed76b6da0710a Konrad Dybcio 2020-05-06  118  	}
02ed76b6da0710a Konrad Dybcio 2020-05-06  119  =

02ed76b6da0710a Konrad Dybcio 2020-05-06 @120  	dsi_dcs_write_seq(dsi, 0x4f=
, 0x01);

It's a really bad idea to hide a return inside a macro.  It will lead to
all sorts of locking and error handling bugs.

02ed76b6da0710a Konrad Dybcio 2020-05-06  121  =

02ed76b6da0710a Konrad Dybcio 2020-05-06  122  	return 0;
02ed76b6da0710a Konrad Dybcio 2020-05-06  123  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org
--===============9134735767518083753==--

