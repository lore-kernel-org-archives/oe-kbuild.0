Content-Type: multipart/mixed; boundary="===============3567395206499811919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 01/16] ipmi: kcs_bmc_aspeed: Use of match data to extract KCS properties
Date: Wed, 09 Jun 2021 00:55:06 +0800
Message-ID: <202106090026.epELW5P7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3567395206499811919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210608104757.582199-2-andrew@aj.id.au>
References: <20210608104757.582199-2-andrew@aj.id.au>
TO: Andrew Jeffery <andrew@aj.id.au>
TO: openipmi-developer(a)lists.sourceforge.net
TO: openbmc(a)lists.ozlabs.org
TO: minyard(a)acm.org
CC: devicetree(a)vger.kernel.org
CC: tmaimon77(a)gmail.com
CC: linux-aspeed(a)lists.ozlabs.org
CC: avifishman70(a)gmail.com
CC: venture(a)google.com
CC: linux-kernel(a)vger.kernel.org
CC: tali.perry1(a)gmail.com

Hi Andrew,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on robh/for-next linux/master linus/master v5.13-r=
c5 next-20210608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andrew-Jeffery/ipmi-Allow-=
raw-access-to-KCS-devices/20210608-185151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t 603e4922f1c81fc2ed3a87b4f91a8d3aafc7e093
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/char/ipmi/kcs_bmc_aspeed.c:345:46: warning: Either the condition=
 'channel<0' is redundant, otherwise there is negative array index -1. [neg=
ativeIndex]
    kcs_bmc->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
                                                ^
   drivers/char/ipmi/kcs_bmc_aspeed.c:338:14: note: Assuming that condition=
 'channel<0' is not redundant
    if (channel < 0)
                ^
   drivers/char/ipmi/kcs_bmc_aspeed.c:345:46: note: Negative array index
    kcs_bmc->ioreg =3D ast_kcs_bmc_ioregs[channel - 1];
                                                ^

vim +345 drivers/char/ipmi/kcs_bmc_aspeed.c

09f5f680707e47 Andrew Jeffery 2019-12-16  316  =

09f5f680707e47 Andrew Jeffery 2019-12-16  317  static int aspeed_kcs_probe(=
struct platform_device *pdev)
09f5f680707e47 Andrew Jeffery 2019-12-16  318  {
15f2c02f7bddbc Andrew Jeffery 2021-06-08  319  	const struct aspeed_kcs_of_=
ops *ops;
09f5f680707e47 Andrew Jeffery 2019-12-16  320  	struct device *dev =3D &pde=
v->dev;
15f2c02f7bddbc Andrew Jeffery 2021-06-08  321  	struct aspeed_kcs_bmc *priv;
09f5f680707e47 Andrew Jeffery 2019-12-16  322  	struct kcs_bmc *kcs_bmc;
09f5f680707e47 Andrew Jeffery 2019-12-16  323  	struct device_node *np;
15f2c02f7bddbc Andrew Jeffery 2021-06-08  324  	int rc, channel, addr;
09f5f680707e47 Andrew Jeffery 2019-12-16  325  =

8f88156f82ea4c Chia-Wei, Wang 2021-03-19  326  	np =3D dev->of_node->parent;
8f88156f82ea4c Chia-Wei, Wang 2021-03-19  327  	if (!of_device_is_compatibl=
e(np, "aspeed,ast2400-lpc-v2") &&
8f88156f82ea4c Chia-Wei, Wang 2021-03-19  328  	    !of_device_is_compatibl=
e(np, "aspeed,ast2500-lpc-v2") &&
8f88156f82ea4c Chia-Wei, Wang 2021-03-19  329  	    !of_device_is_compatibl=
e(np, "aspeed,ast2600-lpc-v2")) {
8f88156f82ea4c Chia-Wei, Wang 2021-03-19  330  		dev_err(dev, "unsupported =
LPC device binding\n");
8f88156f82ea4c Chia-Wei, Wang 2021-03-19  331  		return -ENODEV;
8f88156f82ea4c Chia-Wei, Wang 2021-03-19  332  	}
15f2c02f7bddbc Andrew Jeffery 2021-06-08  333  	ops =3D of_device_get_match=
_data(&pdev->dev);
15f2c02f7bddbc Andrew Jeffery 2021-06-08  334  	if (!ops)
09f5f680707e47 Andrew Jeffery 2019-12-16  335  		return -EINVAL;
09f5f680707e47 Andrew Jeffery 2019-12-16  336  =

15f2c02f7bddbc Andrew Jeffery 2021-06-08  337  	channel =3D ops->get_channe=
l(pdev);
15f2c02f7bddbc Andrew Jeffery 2021-06-08  338  	if (channel < 0)
15f2c02f7bddbc Andrew Jeffery 2021-06-08  339  		return channel;
15f2c02f7bddbc Andrew Jeffery 2021-06-08  340  =

15f2c02f7bddbc Andrew Jeffery 2021-06-08  341  	kcs_bmc =3D kcs_bmc_alloc(&=
pdev->dev, sizeof(struct aspeed_kcs_bmc), channel);
15f2c02f7bddbc Andrew Jeffery 2021-06-08  342  	if (!kcs_bmc)
15f2c02f7bddbc Andrew Jeffery 2021-06-08  343  		return -ENOMEM;
09f5f680707e47 Andrew Jeffery 2019-12-16  344  =

15f2c02f7bddbc Andrew Jeffery 2021-06-08 @345  	kcs_bmc->ioreg =3D ast_kcs_=
bmc_ioregs[channel - 1];
be2ed207e37453 Haiyue Wang    2018-02-02  346  	kcs_bmc->io_inputb =3D aspe=
ed_kcs_inb;
be2ed207e37453 Haiyue Wang    2018-02-02  347  	kcs_bmc->io_outputb =3D asp=
eed_kcs_outb;
be2ed207e37453 Haiyue Wang    2018-02-02  348  =

15f2c02f7bddbc Andrew Jeffery 2021-06-08  349  	addr =3D ops->get_io_addres=
s(pdev);
15f2c02f7bddbc Andrew Jeffery 2021-06-08  350  	if (addr < 0)
15f2c02f7bddbc Andrew Jeffery 2021-06-08  351  		return addr;
15f2c02f7bddbc Andrew Jeffery 2021-06-08  352  =

15f2c02f7bddbc Andrew Jeffery 2021-06-08  353  	priv =3D kcs_bmc_priv(kcs_b=
mc);
15f2c02f7bddbc Andrew Jeffery 2021-06-08  354  	priv->map =3D syscon_node_t=
o_regmap(pdev->dev.parent->of_node);
15f2c02f7bddbc Andrew Jeffery 2021-06-08  355  	if (IS_ERR(priv->map)) {
15f2c02f7bddbc Andrew Jeffery 2021-06-08  356  		dev_err(&pdev->dev, "Could=
n't get regmap\n");
15f2c02f7bddbc Andrew Jeffery 2021-06-08  357  		return -ENODEV;
15f2c02f7bddbc Andrew Jeffery 2021-06-08  358  	}
15f2c02f7bddbc Andrew Jeffery 2021-06-08  359  =

15f2c02f7bddbc Andrew Jeffery 2021-06-08  360  	aspeed_kcs_set_address(kcs_=
bmc, addr);
15f2c02f7bddbc Andrew Jeffery 2021-06-08  361  =

af6432c76a13ef Andrew Jeffery 2019-12-16  362  	rc =3D aspeed_kcs_config_ir=
q(kcs_bmc, pdev);
af6432c76a13ef Andrew Jeffery 2019-12-16  363  	if (rc)
af6432c76a13ef Andrew Jeffery 2019-12-16  364  		return rc;
af6432c76a13ef Andrew Jeffery 2019-12-16  365  =

be2ed207e37453 Haiyue Wang    2018-02-02  366  	dev_set_drvdata(dev, kcs_bm=
c);
be2ed207e37453 Haiyue Wang    2018-02-02  367  =

be2ed207e37453 Haiyue Wang    2018-02-02  368  	aspeed_kcs_enable_channel(k=
cs_bmc, true);
be2ed207e37453 Haiyue Wang    2018-02-02  369  =

be2ed207e37453 Haiyue Wang    2018-02-02  370  	rc =3D misc_register(&kcs_b=
mc->miscdev);
be2ed207e37453 Haiyue Wang    2018-02-02  371  	if (rc) {
be2ed207e37453 Haiyue Wang    2018-02-02  372  		dev_err(dev, "Unable to re=
gister device\n");
be2ed207e37453 Haiyue Wang    2018-02-02  373  		return rc;
be2ed207e37453 Haiyue Wang    2018-02-02  374  	}
be2ed207e37453 Haiyue Wang    2018-02-02  375  =

09f5f680707e47 Andrew Jeffery 2019-12-16  376  	dev_dbg(&pdev->dev,
09f5f680707e47 Andrew Jeffery 2019-12-16  377  		"Probed KCS device %d (IDR=
=3D0x%x, ODR=3D0x%x, STR=3D0x%x)\n",
09f5f680707e47 Andrew Jeffery 2019-12-16  378  		kcs_bmc->channel, kcs_bmc-=
>ioreg.idr, kcs_bmc->ioreg.odr,
09f5f680707e47 Andrew Jeffery 2019-12-16  379  		kcs_bmc->ioreg.str);
be2ed207e37453 Haiyue Wang    2018-02-02  380  =

be2ed207e37453 Haiyue Wang    2018-02-02  381  	return 0;
be2ed207e37453 Haiyue Wang    2018-02-02  382  }
be2ed207e37453 Haiyue Wang    2018-02-02  383  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3567395206499811919==--

