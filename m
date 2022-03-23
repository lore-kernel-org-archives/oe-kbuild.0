Content-Type: multipart/mixed; boundary="===============5729083145432550219=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ASoC: codecs: Fix error handling in power domain init and exit handlers
Date: Wed, 23 Mar 2022 12:07:56 +0800
Message-ID: <202203231218.XywussKw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5729083145432550219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1647965937-32203-1-git-send-email-quic_srivasam@quicinc.com>
References: <1647965937-32203-1-git-send-email-quic_srivasam@quicinc.com>
TO: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
TO: agross(a)kernel.org
TO: bjorn.andersson(a)linaro.org
TO: lgirdwood(a)gmail.com
TO: broonie(a)kernel.org
TO: robh+dt(a)kernel.org
TO: quic_plai(a)quicinc.com
TO: bgoswami(a)codeaurora.org
TO: perex(a)perex.cz
TO: tiwai(a)suse.com
TO: srinivas.kandagatla(a)linaro.org
TO: rohitkr(a)codeaurora.org
TO: linux-arm-msm(a)vger.kernel.org
TO: alsa-devel(a)alsa-project.org
TO: devicetree(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: swboyd(a)chromium.org
TO: judyhsiao(a)chromium.org
CC: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
CC: Venkata Prasad Potturu <quic_potturu@quicinc.com>

Hi Srinivasa,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20220322]
[cannot apply to v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Srinivasa-Rao-Mandadapu/AS=
oC-codecs-Fix-error-handling-in-power-domain-init-and-exit-handlers/2022032=
3-001954
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021-20220321 (https://download.01.org/0day-ci/arch=
ive/20220323/202203231218.XywussKw-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/soc/codecs/lpass-macro-common.c:28 lpass_macro_pds_init() warn: passi=
ng zero to 'PTR_ERR'

Old smatch warnings:
sound/soc/codecs/lpass-macro-common.c:38 lpass_macro_pds_init() warn: passi=
ng zero to 'PTR_ERR'

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
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  27  	if (IS_ERR_OR_NULL(=
l_pds->macro_pd)) {
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22 @28  		ret =3D PTR_ERR(l_=
pds->macro_pd);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  29  		goto macro_err;
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  30  	}
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  31  =

3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  32  	ret =3D pm_runtime_=
resume_and_get(l_pds->macro_pd);
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  33  	if (ret < 0)
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  34  		goto macro_sync_er=
r;
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  35  =

9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  36  	l_pds->dcodec_pd =
=3D dev_pm_domain_attach_by_name(dev, "dcodec");
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  37  	if (IS_ERR_OR_NULL(=
l_pds->dcodec_pd)) {
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  38  		ret =3D PTR_ERR(l_=
pds->dcodec_pd);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  39  		goto dcodec_err;
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  40  	}
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  41  =

3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  42  	ret =3D pm_runtime_=
resume_and_get(l_pds->dcodec_pd);
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  43  	if (ret < 0)
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
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  51  macro_sync_err:
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  52  	dev_pm_domain_detac=
h(l_pds->macro_pd, false);
3761a4daab359c Srinivasa Rao Mandadapu 2022-03-22  53  macro_err:
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  54  	return ERR_PTR(ret);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  55  }
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  56  EXPORT_SYMBOL_GPL(lp=
ass_macro_pds_init);
9e3d83c52844f9 Srinivasa Rao Mandadapu 2022-02-26  57  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5729083145432550219==--

