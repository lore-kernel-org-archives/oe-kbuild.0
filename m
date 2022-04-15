Content-Type: multipart/mixed; boundary="===============0143552518262927043=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-sound:for-5.19 2/59] sound/soc/codecs/lpass-macro-common.c:28 lpass_macro_pds_init() warn: passing zero to 'PTR_ERR'
Date: Fri, 15 Apr 2022 20:29:13 +0800
Message-ID: <202204152011.P1CbEWrd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0143552518262927043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
CC: Mark Brown <broonie@kernel.org>
CC: Venkata Prasad Potturu <quic_potturu@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-5.19
head:   19aed2d6cdb72a7c92909832b9480d9cadebeef9
commit: 1a8ee4cf84187bce17c76886eb6dd9389c3b99a8 [2/59] ASoC: codecs: Fix e=
rror handling in power domain init and exit handlers
:::::: branch date: 20 hours ago
:::::: commit date: 10 days ago
config: s390-randconfig-m031-20220414 (https://download.01.org/0day-ci/arch=
ive/20220415/202204152011.P1CbEWrd-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/soc/codecs/lpass-macro-common.c:28 lpass_macro_pds_init() warn: passi=
ng zero to 'PTR_ERR'

Old smatch warnings:
sound/soc/codecs/lpass-macro-common.c:54 lpass_macro_pds_init() warn: passi=
ng zero to 'ERR_PTR'

vim +/PTR_ERR +28 sound/soc/codecs/lpass-macro-common.c

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  13  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  14  struct lpass_macro *=
lpass_macro_pds_init(struct device *dev)
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  15  {
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  16  	struct lpass_macro =
*l_pds;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  17  	int ret;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  18  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  19  	if (!of_find_proper=
ty(dev->of_node, "power-domains", NULL))
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  20  		return NULL;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  21  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  22  	l_pds =3D devm_kzal=
loc(dev, sizeof(*l_pds), GFP_KERNEL);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  23  	if (!l_pds)
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  24  		return ERR_PTR(-EN=
OMEM);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  25  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  26  	l_pds->macro_pd =3D=
 dev_pm_domain_attach_by_name(dev, "macro");
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  27  	if (IS_ERR_OR_NULL(=
l_pds->macro_pd)) {
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22 @28  		ret =3D PTR_ERR(l_=
pds->macro_pd);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  29  		goto macro_err;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  30  	}
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  31  =

1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  32  	ret =3D pm_runtime_=
resume_and_get(l_pds->macro_pd);
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  33  	if (ret < 0)
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  34  		goto macro_sync_er=
r;
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  35  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  36  	l_pds->dcodec_pd =
=3D dev_pm_domain_attach_by_name(dev, "dcodec");
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  37  	if (IS_ERR_OR_NULL(=
l_pds->dcodec_pd)) {
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  38  		ret =3D PTR_ERR(l_=
pds->dcodec_pd);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  39  		goto dcodec_err;
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  40  	}
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  41  =

1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  42  	ret =3D pm_runtime_=
resume_and_get(l_pds->dcodec_pd);
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  43  	if (ret < 0)
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  44  		goto dcodec_sync_e=
rr;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  45  	return l_pds;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  46  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  47  dcodec_sync_err:
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  48  	dev_pm_domain_detac=
h(l_pds->dcodec_pd, false);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  49  dcodec_err:
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  50  	pm_runtime_put(l_pd=
s->macro_pd);
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  51  macro_sync_err:
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  52  	dev_pm_domain_detac=
h(l_pds->macro_pd, false);
1a8ee4cf84187b Srinivasa Rao Mandadapu 2022-03-22  53  macro_err:
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  54  	return ERR_PTR(ret);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  55  }
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  56  EXPORT_SYMBOL_GPL(lp=
ass_macro_pds_init);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  57  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0143552518262927043==--

