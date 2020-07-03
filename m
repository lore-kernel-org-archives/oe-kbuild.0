Content-Type: multipart/mixed; boundary="===============7694912969863055842=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 5/9] dmaengine: fsl-edma3: add fsl-edma3 driver
Date: Fri, 03 Jul 2020 12:34:14 +0800
Message-ID: <202007031253.vCIYiaEP%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7694912969863055842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1593702489-21648-6-git-send-email-yibin.gong@nxp.com>
References: <1593702489-21648-6-git-send-email-yibin.gong@nxp.com>
TO: Robin Gong <yibin.gong@nxp.com>
TO: vkoul(a)kernel.org
TO: robh+dt(a)kernel.org
TO: shawnguo(a)kernel.org
TO: s.hauer(a)pengutronix.de
TO: festevam(a)gmail.com
TO: catalin.marinas(a)arm.com
TO: will(a)kernel.org
TO: dan.j.williams(a)intel.com
TO: angelo(a)sysam.it
CC: kernel(a)pengutronix.de

Hi Robin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on shawnguo/for-next vkoul-dmaengine/next linus/ma=
ster v5.8-rc3 next-20200702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Robin-Gong/add-fsl-edma3-s=
upport/20200702-145723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/dma/fsl-edma3.c:279:25: warning: Local variable fsl_chan shadows=
 outer variable [shadowVar]
     struct fsl_edma_chan *fsl_chan =3D &fsl_edma->chans[i];
                           ^
   drivers/dma/fsl-edma3.c:246:24: note: Shadowed declaration
    struct fsl_edma_chan *fsl_chan;
                          ^
   drivers/dma/fsl-edma3.c:279:25: note: Shadow variable
     struct fsl_edma_chan *fsl_chan =3D &fsl_edma->chans[i];
                           ^
   drivers/dma/fsl-edma3.c:328:25: warning: Local variable fsl_chan shadows=
 outer variable [shadowVar]
     struct fsl_edma_chan *fsl_chan =3D &fsl_edma->chans[i];
                           ^
   drivers/dma/fsl-edma3.c:246:24: note: Shadowed declaration
    struct fsl_edma_chan *fsl_chan;
                          ^
   drivers/dma/fsl-edma3.c:328:25: note: Shadow variable
     struct fsl_edma_chan *fsl_chan =3D &fsl_edma->chans[i];
                           ^

# https://github.com/0day-ci/linux/commit/39cf04bc9b45d1b489016b0616132d63c=
f29a371
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 39cf04bc9b45d1b489016b0616132d63cf29a371
vim +279 drivers/dma/fsl-edma3.c

39cf04bc9b45d1 Robin Gong 2020-07-02  237  =

39cf04bc9b45d1 Robin Gong 2020-07-02  238  static int fsl_edma3_probe(struc=
t platform_device *pdev)
39cf04bc9b45d1 Robin Gong 2020-07-02  239  {
39cf04bc9b45d1 Robin Gong 2020-07-02  240  	const struct of_device_id *of_i=
d =3D
39cf04bc9b45d1 Robin Gong 2020-07-02  241  			of_match_device(fsl_edma3_dt_=
ids, &pdev->dev);
39cf04bc9b45d1 Robin Gong 2020-07-02  242  	struct device_node *np =3D pdev=
->dev.of_node;
39cf04bc9b45d1 Robin Gong 2020-07-02  243  	struct fsl_edma3_engine *fsl_ed=
ma3;
39cf04bc9b45d1 Robin Gong 2020-07-02  244  	struct fsl_edma_engine *fsl_edm=
a;
39cf04bc9b45d1 Robin Gong 2020-07-02  245  	const struct fsl_edma_drvdata *=
drvdata =3D NULL;
39cf04bc9b45d1 Robin Gong 2020-07-02  246  	struct fsl_edma_chan *fsl_chan;
39cf04bc9b45d1 Robin Gong 2020-07-02  247  	int len, chans;
39cf04bc9b45d1 Robin Gong 2020-07-02  248  	int ret, i;
39cf04bc9b45d1 Robin Gong 2020-07-02  249  =

39cf04bc9b45d1 Robin Gong 2020-07-02  250  	if (of_id)
39cf04bc9b45d1 Robin Gong 2020-07-02  251  		drvdata =3D of_id->data;
39cf04bc9b45d1 Robin Gong 2020-07-02  252  	if (!drvdata) {
39cf04bc9b45d1 Robin Gong 2020-07-02  253  		dev_err(&pdev->dev, "unable to=
 find driver data\n");
39cf04bc9b45d1 Robin Gong 2020-07-02  254  		return -EINVAL;
39cf04bc9b45d1 Robin Gong 2020-07-02  255  	}
39cf04bc9b45d1 Robin Gong 2020-07-02  256  =

39cf04bc9b45d1 Robin Gong 2020-07-02  257  	ret =3D of_property_read_u32(np=
, "dma-channels", &chans);
39cf04bc9b45d1 Robin Gong 2020-07-02  258  	if (ret) {
39cf04bc9b45d1 Robin Gong 2020-07-02  259  		dev_err(&pdev->dev, "Can't get=
 dma-channels.\n");
39cf04bc9b45d1 Robin Gong 2020-07-02  260  		return ret;
39cf04bc9b45d1 Robin Gong 2020-07-02  261  	}
39cf04bc9b45d1 Robin Gong 2020-07-02  262  =

39cf04bc9b45d1 Robin Gong 2020-07-02  263  	len =3D sizeof(*fsl_edma3) + si=
zeof(*fsl_chan) * chans;
39cf04bc9b45d1 Robin Gong 2020-07-02  264  	fsl_edma3 =3D devm_kzalloc(&pde=
v->dev, len, GFP_KERNEL);
39cf04bc9b45d1 Robin Gong 2020-07-02  265  	if (!fsl_edma3)
39cf04bc9b45d1 Robin Gong 2020-07-02  266  		return -ENOMEM;
39cf04bc9b45d1 Robin Gong 2020-07-02  267  =

39cf04bc9b45d1 Robin Gong 2020-07-02  268  	/* Audio edma rx/tx channel sha=
red interrupt */
39cf04bc9b45d1 Robin Gong 2020-07-02  269  	if (of_property_read_bool(np, "=
shared-interrupt"))
39cf04bc9b45d1 Robin Gong 2020-07-02  270  		fsl_edma3->irqflag =3D IRQF_SH=
ARED;
39cf04bc9b45d1 Robin Gong 2020-07-02  271  =

39cf04bc9b45d1 Robin Gong 2020-07-02  272  	fsl_edma =3D &fsl_edma3->fsl_ed=
ma;
39cf04bc9b45d1 Robin Gong 2020-07-02  273  	fsl_edma->drvdata =3D drvdata;
39cf04bc9b45d1 Robin Gong 2020-07-02  274  	fsl_edma->n_chans =3D chans;
39cf04bc9b45d1 Robin Gong 2020-07-02  275  	mutex_init(&fsl_edma->fsl_edma_=
mutex);
39cf04bc9b45d1 Robin Gong 2020-07-02  276  =

39cf04bc9b45d1 Robin Gong 2020-07-02  277  	INIT_LIST_HEAD(&fsl_edma->dma_d=
ev.channels);
39cf04bc9b45d1 Robin Gong 2020-07-02  278  	for (i =3D 0; i < fsl_edma->n_c=
hans; i++) {
39cf04bc9b45d1 Robin Gong 2020-07-02 @279  		struct fsl_edma_chan *fsl_chan=
 =3D &fsl_edma->chans[i];
39cf04bc9b45d1 Robin Gong 2020-07-02  280  =

39cf04bc9b45d1 Robin Gong 2020-07-02  281  		fsl_chan->edma =3D fsl_edma;
39cf04bc9b45d1 Robin Gong 2020-07-02  282  		fsl_chan->pm_state =3D RUNNING;
39cf04bc9b45d1 Robin Gong 2020-07-02  283  		fsl_chan->idle =3D true;
39cf04bc9b45d1 Robin Gong 2020-07-02  284  		fsl_chan->dma_dir =3D DMA_NONE;
39cf04bc9b45d1 Robin Gong 2020-07-02  285  		fsl_chan->vchan.desc_free =3D =
fsl_edma_free_desc;
39cf04bc9b45d1 Robin Gong 2020-07-02  286  =

39cf04bc9b45d1 Robin Gong 2020-07-02  287  		ret =3D fsl_edma3_parse_chanir=
q(pdev, fsl_chan, i);
39cf04bc9b45d1 Robin Gong 2020-07-02  288  		if (ret)
39cf04bc9b45d1 Robin Gong 2020-07-02  289  			return ret;
39cf04bc9b45d1 Robin Gong 2020-07-02  290  =

39cf04bc9b45d1 Robin Gong 2020-07-02  291  		vchan_init(&fsl_chan->vchan, &=
fsl_edma->dma_dev);
39cf04bc9b45d1 Robin Gong 2020-07-02  292  	}
39cf04bc9b45d1 Robin Gong 2020-07-02  293  =

39cf04bc9b45d1 Robin Gong 2020-07-02  294  	dma_cap_set(DMA_PRIVATE, fsl_ed=
ma->dma_dev.cap_mask);
39cf04bc9b45d1 Robin Gong 2020-07-02  295  	dma_cap_set(DMA_SLAVE, fsl_edma=
->dma_dev.cap_mask);
39cf04bc9b45d1 Robin Gong 2020-07-02  296  	dma_cap_set(DMA_CYCLIC, fsl_edm=
a->dma_dev.cap_mask);
39cf04bc9b45d1 Robin Gong 2020-07-02  297  =

39cf04bc9b45d1 Robin Gong 2020-07-02  298  	fsl_edma->dma_dev.dev =3D &pdev=
->dev;
39cf04bc9b45d1 Robin Gong 2020-07-02  299  	fsl_edma->dma_dev.device_alloc_=
chan_resources
39cf04bc9b45d1 Robin Gong 2020-07-02  300  		=3D fsl_edma_alloc_chan_resour=
ces;
39cf04bc9b45d1 Robin Gong 2020-07-02  301  	fsl_edma->dma_dev.device_free_c=
han_resources
39cf04bc9b45d1 Robin Gong 2020-07-02  302  		=3D fsl_edma_free_chan_resourc=
es;
39cf04bc9b45d1 Robin Gong 2020-07-02  303  	fsl_edma->dma_dev.device_tx_sta=
tus =3D fsl_edma_tx_status;
39cf04bc9b45d1 Robin Gong 2020-07-02  304  	fsl_edma->dma_dev.device_prep_s=
lave_sg =3D fsl_edma_prep_slave_sg;
39cf04bc9b45d1 Robin Gong 2020-07-02  305  	fsl_edma->dma_dev.device_prep_d=
ma_cyclic =3D fsl_edma_prep_dma_cyclic;
39cf04bc9b45d1 Robin Gong 2020-07-02  306  	fsl_edma->dma_dev.device_config=
 =3D fsl_edma_slave_config;
39cf04bc9b45d1 Robin Gong 2020-07-02  307  	fsl_edma->dma_dev.device_pause =
=3D fsl_edma_pause;
39cf04bc9b45d1 Robin Gong 2020-07-02  308  	fsl_edma->dma_dev.device_resume=
 =3D fsl_edma_resume;
39cf04bc9b45d1 Robin Gong 2020-07-02  309  	fsl_edma->dma_dev.device_termin=
ate_all =3D fsl_edma_terminate_all;
39cf04bc9b45d1 Robin Gong 2020-07-02  310  	fsl_edma->dma_dev.device_issue_=
pending =3D fsl_edma_issue_pending;
39cf04bc9b45d1 Robin Gong 2020-07-02  311  =

39cf04bc9b45d1 Robin Gong 2020-07-02  312  	fsl_edma->dma_dev.src_addr_widt=
hs =3D FSL_EDMA_BUSWIDTHS;
39cf04bc9b45d1 Robin Gong 2020-07-02  313  	fsl_edma->dma_dev.dst_addr_widt=
hs =3D FSL_EDMA_BUSWIDTHS;
39cf04bc9b45d1 Robin Gong 2020-07-02  314  	fsl_edma->dma_dev.directions =
=3D BIT(DMA_DEV_TO_MEM) |
39cf04bc9b45d1 Robin Gong 2020-07-02  315  				       BIT(DMA_MEM_TO_DEV);
39cf04bc9b45d1 Robin Gong 2020-07-02  316  =

39cf04bc9b45d1 Robin Gong 2020-07-02  317  	platform_set_drvdata(pdev, fsl_=
edma3);
39cf04bc9b45d1 Robin Gong 2020-07-02  318  =

39cf04bc9b45d1 Robin Gong 2020-07-02  319  	ret =3D dma_async_device_regist=
er(&fsl_edma->dma_dev);
39cf04bc9b45d1 Robin Gong 2020-07-02  320  	if (ret) {
39cf04bc9b45d1 Robin Gong 2020-07-02  321  		dev_err(&pdev->dev,
39cf04bc9b45d1 Robin Gong 2020-07-02  322  			"Can't register Freescale eDM=
A engine. (%d)\n", ret);
39cf04bc9b45d1 Robin Gong 2020-07-02  323  		return ret;
39cf04bc9b45d1 Robin Gong 2020-07-02  324  	}
39cf04bc9b45d1 Robin Gong 2020-07-02  325  =

39cf04bc9b45d1 Robin Gong 2020-07-02  326  	/* Attach power domains from dt=
s for each dma chanel device */
39cf04bc9b45d1 Robin Gong 2020-07-02  327  	for (i =3D 0; i < fsl_edma->n_c=
hans; i++) {
39cf04bc9b45d1 Robin Gong 2020-07-02  328  		struct fsl_edma_chan *fsl_chan=
 =3D &fsl_edma->chans[i];
39cf04bc9b45d1 Robin Gong 2020-07-02  329  		const char *domn =3D "edma0-ch=
an01";
39cf04bc9b45d1 Robin Gong 2020-07-02  330  		struct device_link *link;
39cf04bc9b45d1 Robin Gong 2020-07-02  331  		struct device *dev;
39cf04bc9b45d1 Robin Gong 2020-07-02  332  =

39cf04bc9b45d1 Robin Gong 2020-07-02  333  		ret =3D of_property_read_strin=
g_index(np, "power-domain-names",
39cf04bc9b45d1 Robin Gong 2020-07-02  334  						    i, &domn);
39cf04bc9b45d1 Robin Gong 2020-07-02  335  		if (ret) {
39cf04bc9b45d1 Robin Gong 2020-07-02  336  			dev_err(dev, "parse domain na=
mes error.(%d)\n", ret);
39cf04bc9b45d1 Robin Gong 2020-07-02  337  			ret =3D -EINVAL;
39cf04bc9b45d1 Robin Gong 2020-07-02  338  			goto failed_after_register;
39cf04bc9b45d1 Robin Gong 2020-07-02  339  		}
39cf04bc9b45d1 Robin Gong 2020-07-02  340  =

39cf04bc9b45d1 Robin Gong 2020-07-02  341  		dev =3D dev_pm_domain_attach_b=
y_name(&pdev->dev, domn);
39cf04bc9b45d1 Robin Gong 2020-07-02  342  		if (IS_ERR_OR_NULL(dev)) {
39cf04bc9b45d1 Robin Gong 2020-07-02  343  			if (PTR_ERR(dev) =3D=3D -EPRO=
BE_DEFER) {
39cf04bc9b45d1 Robin Gong 2020-07-02  344  				ret =3D -EPROBE_DEFER;
39cf04bc9b45d1 Robin Gong 2020-07-02  345  				goto failed_after_register;
39cf04bc9b45d1 Robin Gong 2020-07-02  346  			}
39cf04bc9b45d1 Robin Gong 2020-07-02  347  =

39cf04bc9b45d1 Robin Gong 2020-07-02  348  			dev_err(&pdev->dev, "edma cha=
nnel attach failed.\n");
39cf04bc9b45d1 Robin Gong 2020-07-02  349  			ret =3D -EINVAL;
39cf04bc9b45d1 Robin Gong 2020-07-02  350  			goto failed_after_register;
39cf04bc9b45d1 Robin Gong 2020-07-02  351  		}
39cf04bc9b45d1 Robin Gong 2020-07-02  352  		link =3D device_link_add(&pdev=
->dev, dev, DL_FLAG_STATELESS |
39cf04bc9b45d1 Robin Gong 2020-07-02  353  				       DL_FLAG_PM_RUNTIME | =
DL_FLAG_RPM_ACTIVE);
39cf04bc9b45d1 Robin Gong 2020-07-02  354  		if (IS_ERR(link)) {
39cf04bc9b45d1 Robin Gong 2020-07-02  355  			dev_err(&pdev->dev, "Failed t=
o add link to %s: %ld\n",
39cf04bc9b45d1 Robin Gong 2020-07-02  356  				domn, PTR_ERR(link));
39cf04bc9b45d1 Robin Gong 2020-07-02  357  			ret =3D -EINVAL;
39cf04bc9b45d1 Robin Gong 2020-07-02  358  			goto failed_after_register;
39cf04bc9b45d1 Robin Gong 2020-07-02  359  		}
39cf04bc9b45d1 Robin Gong 2020-07-02  360  =

39cf04bc9b45d1 Robin Gong 2020-07-02  361  		fsl_chan->dev =3D dev;
39cf04bc9b45d1 Robin Gong 2020-07-02  362  		/* clear meaningless pending i=
rq anyway */
39cf04bc9b45d1 Robin Gong 2020-07-02  363  		edma_writel(fsl_edma, 1, fsl_c=
han->regs.intl);
39cf04bc9b45d1 Robin Gong 2020-07-02  364  		pm_runtime_put_sync(dev);
39cf04bc9b45d1 Robin Gong 2020-07-02  365  	}
39cf04bc9b45d1 Robin Gong 2020-07-02  366  =

39cf04bc9b45d1 Robin Gong 2020-07-02  367  	ret =3D of_dma_controller_regis=
ter(np, fsl_edma3_xlate, fsl_edma);
39cf04bc9b45d1 Robin Gong 2020-07-02  368  	if (ret) {
39cf04bc9b45d1 Robin Gong 2020-07-02  369  		dev_err(&pdev->dev,
39cf04bc9b45d1 Robin Gong 2020-07-02  370  			"Can't register Freescale eDM=
A of_dma. (%d)\n", ret);
39cf04bc9b45d1 Robin Gong 2020-07-02  371  		goto failed_after_register;
39cf04bc9b45d1 Robin Gong 2020-07-02  372  	}
39cf04bc9b45d1 Robin Gong 2020-07-02  373  =

39cf04bc9b45d1 Robin Gong 2020-07-02  374  	pm_runtime_dont_use_autosuspend=
(&pdev->dev);
39cf04bc9b45d1 Robin Gong 2020-07-02  375  	pm_runtime_enable(&pdev->dev);
39cf04bc9b45d1 Robin Gong 2020-07-02  376  =

39cf04bc9b45d1 Robin Gong 2020-07-02  377  	return 0;
39cf04bc9b45d1 Robin Gong 2020-07-02  378  =

39cf04bc9b45d1 Robin Gong 2020-07-02  379  failed_after_register:
39cf04bc9b45d1 Robin Gong 2020-07-02  380  	dma_async_device_unregister(&fs=
l_edma->dma_dev);
39cf04bc9b45d1 Robin Gong 2020-07-02  381  	return ret;
39cf04bc9b45d1 Robin Gong 2020-07-02  382  }
39cf04bc9b45d1 Robin Gong 2020-07-02  383  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7694912969863055842==--

