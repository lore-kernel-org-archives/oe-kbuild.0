Content-Type: multipart/mixed; boundary="===============6157999700042615686=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/lpass-macro-common.c:53 lpass_macro_pds_init() warn: passing zero to 'ERR_PTR'
Date: Tue, 19 Apr 2022 10:44:49 +0800
Message-ID: <202204191038.mpYHsfUT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6157999700042615686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
CC: Mark Brown <broonie@kernel.org>
CC: Venkata Prasad Potturu <quic_potturu@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 9e3d83c52844f955aa2975f78cee48bf9f72f5e1 ASoC: codecs: Add power do=
mains support in digital macro codecs
date:   7 weeks ago
:::::: branch date: 30 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220419/202204191038.mpYHsfUT-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/codecs/lpass-macro-common.c:53 lpass_macro_pds_init() warn: passi=
ng zero to 'ERR_PTR'

vim +/ERR_PTR +53 sound/soc/codecs/lpass-macro-common.c

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
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  27  	if (IS_ERR_OR_NULL(=
l_pds->macro_pd))
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  28  		return NULL;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  29  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  30  	ret =3D pm_runtime_=
get_sync(l_pds->macro_pd);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  31  	if (ret < 0) {
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  32  		pm_runtime_put_noi=
dle(l_pds->macro_pd);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  33  		goto macro_err;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  34  	}
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  35  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  36  	l_pds->dcodec_pd =
=3D dev_pm_domain_attach_by_name(dev, "dcodec");
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  37  	if (IS_ERR_OR_NULL(=
l_pds->dcodec_pd))
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  38  		goto dcodec_err;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  39  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  40  	ret =3D pm_runtime_=
get_sync(l_pds->dcodec_pd);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  41  	if (ret < 0) {
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  42  		pm_runtime_put_noi=
dle(l_pds->dcodec_pd);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  43  		goto dcodec_sync_e=
rr;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  44  	}
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  45  	return l_pds;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  46  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  47  dcodec_sync_err:
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  48  	dev_pm_domain_detac=
h(l_pds->dcodec_pd, false);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  49  dcodec_err:
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  50  	pm_runtime_put(l_pd=
s->macro_pd);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  51  macro_err:
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  52  	dev_pm_domain_detac=
h(l_pds->macro_pd, false);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26 @53  	return ERR_PTR(ret);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  54  }
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  55  EXPORT_SYMBOL_GPL(lp=
ass_macro_pds_init);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  56  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6157999700042615686==--

