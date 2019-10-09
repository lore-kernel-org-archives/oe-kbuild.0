Content-Type: multipart/mixed; boundary="===============7673764666030801396=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [staging:staging-testing 55/111] drivers/staging/wfx/wfx.h:91 wdev_to_wvif() warn: potential spectre issue 'wdev->vif' [r] (local cap)
Date: Wed, 09 Oct 2019 12:00:48 +0300
Message-ID: <20191009090048.GA13286@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7673764666030801396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
staging-testing
head:   d49d1c76b96ebf39539e93d5ab7943a01ef70e4f
commit: 9bca45f3d6924f19f29c0d019e961af3f41bdc9e [55/111] staging: wfx: all=
ow to send 802.11 frames

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/staging/wfx/wfx.h:91 wdev_to_wvif() warn: potential spectre issue '=
wdev->vif' [r] (local cap)
drivers/staging/wfx/data_tx.c:479 wfx_tx_get_raw_link_id() warn: signedness=
 bug returning '(-2)'

# https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit=
/?id=3D9bca45f3d6924f19f29c0d019e961af3f41bdc9e
git remote add staging https://git.kernel.org/pub/scm/linux/kernel/git/greg=
kh/staging.git
git remote update staging
git checkout 9bca45f3d6924f19f29c0d019e961af3f41bdc9e
vim +91 drivers/staging/wfx/wfx.h

e16e7f0716a6ba J=C3=A9r=C3=B4me Pouiller 2019-09-19  80  =

f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  81  static inline stru=
ct wfx_vif *wdev_to_wvif(struct wfx_dev *wdev, int vif_id)
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  82  {
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  83  	if (vif_id >=3D A=
RRAY_SIZE(wdev->vif)) {
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  84  		dev_dbg(wdev->de=
v, "requesting non-existent vif: %d\n", vif_id);
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  85  		return NULL;
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  86  	}

		vaf_id =3D array_index_nospec(wdev->vif, ARRAY_SIZE(wdev->vif)); ?

f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  87  	if (!wdev->vif[vi=
f_id]) {
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  88  		dev_dbg(wdev->de=
v, "requesting non-allocated vif: %d\n", vif_id);
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  89  		return NULL;
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  90  	}
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19 @91  	return (struct wf=
x_vif *) wdev->vif[vif_id]->drv_priv;
f4a71ba8753d94 J=C3=A9r=C3=B4me Pouiller 2019-09-19  92  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============7673764666030801396==--

