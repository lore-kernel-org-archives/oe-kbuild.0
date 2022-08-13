Content-Type: multipart/mixed; boundary="===============1942440749130767134=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5, 5/8] media: mediatek: vcodec: Add venc power on/off function
Date: Sun, 14 Aug 2022 07:20:08 +0800
Message-ID: <202208140736.FET1DQOx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1942440749130767134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220729035129.3634-6-irui.wang@mediatek.com>
References: <20220729035129.3634-6-irui.wang@mediatek.com>
TO: Irui Wang <irui.wang@mediatek.com>
TO: Hans Verkuil <hverkuil@xs4all.nl>
TO: angelogioacchino.delregno(a)collabora.com
TO: Rob Herring <robh+dt@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: Alexandre Courbot <acourbot@chromium.org>
TO: Tiffany Lin <tiffany.lin@mediatek.com>
TO: "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>
TO: "Tzung-Bi Shih" <tzungbi@chromium.org>
TO: Tomasz Figa <tfiga@google.com>
TO: nicolas.dufresne(a)collabora.com
CC: Maoguang Meng <maoguang.meng@mediatek.com>
CC: Longfei Wang <longfei.wang@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>
CC: Irui Wang <irui.wang@mediatek.com>
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-mediatek(a)lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group(a)mediatek.com

Hi Irui,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master next-20220812]
[cannot apply to v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Irui-Wang/Support-H2=
64-multi-core-encoder-on-MT8195/20220729-115415
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-m041-20220812 (https://download.01.org/0day-ci/archi=
ve/20220814/202208140736.FET1DQOx-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c:77 mtk_enc_core_=
power_on() error: uninitialized symbol 'ret'.

vim +/ret +77 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c

4e855a6efa5470d8 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c     =
 Tiffany Lin 2016-05-03  59  =

1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  60  static int mtk_enc_core_power_on(struct mtk_vc=
odec_ctx *ctx)
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  61  {
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  62  	struct mtk_venc_hw_dev *sub_core;
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  63  	int ret, i;
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  64  =

1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  65  	/* multi-core encoding need power on all avai=
lable cores */
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  66  	for (i =3D 0; i < MTK_VENC_HW_MAX; i++) {
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  67  		sub_core =3D (struct mtk_venc_hw_dev *)ctx->=
dev->enc_hw_dev[i];
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  68  		if (!sub_core)
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  69  			continue;
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  70  =

1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  71  		ret =3D pm_runtime_resume_and_get(&sub_core-=
>plat_dev->dev);
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  72  		if (ret) {
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  73  			mtk_v4l2_err("power on sub_core[%d] fail %d=
", i, ret);
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  74  			goto pm_on_fail;
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  75  		}
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  76  	}
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29 @77  	return ret;
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  78  =

1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  79  pm_on_fail:
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  80  	for (i -=3D 1; i >=3D 0; i--) {
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  81  		sub_core =3D (struct mtk_venc_hw_dev *)ctx->=
dev->enc_hw_dev[i];
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  82  		pm_runtime_put_sync(&sub_core->plat_dev->dev=
);
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  83  	}
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  84  	return ret;
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  85  }
1fd72375b4f44395 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_pm.c=
 Irui Wang   2022-07-29  86  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1942440749130767134==--

