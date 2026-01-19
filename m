Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0127923BCF7
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839479; cv=none; b=tjwNXZUSdzl/xfxqXDzMQvs/PIHSI7yKq7zPYiqlUdzMojw9UzFyrcOkniuE03rYjD4a3TfQ5mr3EkfAso8YJoLn5df3nQXlcf9Oefh6FrIl4wKVTWeHp6BHHpzBeo36eaK47I8L9nXNR8w5HWktKT6jZwbGu62/WV95RA688jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839479; c=relaxed/simple;
	bh=ksjdDgYEC+sIOrep5KL4T7mU7mz8lpxvNQa65ebwJDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RTB18WraweRDdotCj7r6u9nztxHstJfjFD/UYNg0LRZFoOUide1nZSd14km3O4HX4/R1O27Y2IcZbBxipnnIjgKCA+YU3xfPjJgGMTr2ZRsuWS3j07h49ztNCdVUQNJEX91asxA8EJIBtpyAg8k7XxwOm8IcnX1oqECylwX+xN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z03n+AE2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z03n+AE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768839478; x=1800375478;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ksjdDgYEC+sIOrep5KL4T7mU7mz8lpxvNQa65ebwJDQ=;
  b=Z03n+AE2dv5cdu8IgJyfecL1DaZLnfJ7BDhgn3Pk9zn9+FQTuDvZq/ZX
   th999BEQYdEagan99OGVaQTNYzslhV4eQG+FXjIHBNEdQKB+K5+P4pVqo
   h/+0bHFj+EuAonhKcD+ksxOzj+21Pf0f7GmzBLMvCGLi0ZWXX/WykCruA
   1eqKrILPq6Ymw0q2IaVObfb4DK8ruQ8oFQrunCct1Y5HsnFy8j9klBd5v
   6tEoQ8BkvSuz7wNonn9BHhEUDbl/YD8NG+mlib9DSkKnJnmtt+dnuHVR9
   Jw1kOdyXASEVtxwo9Dofyygu2iuvgEw03yxOXf4wfC7XCHHFjYd8J+Kek
   w==;
X-CSE-ConnectionGUID: iTVwp14ES+GPQ1w5y9VmpA==
X-CSE-MsgGUID: TobK9ZPQQS++03hH0j8gbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69253694"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69253694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:17:57 -0800
X-CSE-ConnectionGUID: ia7T1HOLQyacwG+Q3IJToA==
X-CSE-MsgGUID: qmZYaHLWRvymAqFAdKTPng==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2026 08:17:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhrwu-00000000O1j-41kA;
	Mon, 19 Jan 2026 16:17:52 +0000
Date: Tue, 20 Jan 2026 00:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linusw-pinctrl:devel 30/31]
 drivers/pinctrl/pinctrl-rockchip.c:3683 rockchip_pinconf_set() error: we
 previously assumed 'gpio->direction_output' could be null (see line 3644)
Message-ID: <202601200057.P0Lr7NDg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-gpio@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linusw@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctr=
l.git devel
head:   76d415763bae9488dd2b923b1348ce6f26c1f0ae
commit: e2c58cbe3aff49fe201e81ee5f651294e313ec74 [30/31] pinctrl: rockchip:=
 Simplify locking with scoped_guard()
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: sh-randconfig-r073-20260119 (https://download.01.org/0day-ci/archiv=
e/20260120/202601200057.P0Lr7NDg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200057.P0Lr7NDg-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-rockchip.c:3683 rockchip_pinconf_set() error: we pr=
eviously assumed 'gpio->direction_output' could be null (see line 3644)

vim +3683 drivers/pinctrl/pinctrl-rockchip.c

e7165b1dff06b6e Heiko Stuebner      2021-09-14  3620 =20
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3621  /* set the pin c=
onfig settings for a specified pin */
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3622  static int rockc=
hip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
03b054e9696c3cb Sherman Yin         2013-08-27  3623  				unsigned long *co=
nfigs, unsigned num_configs)
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3624  {
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3625  	struct rockchip=
_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev);
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3626  	struct rockchip=
_pin_bank *bank =3D pin_to_bank(info, pin);
9ce9a02039de72e Jianqun Xu          2021-08-16  3627  	struct gpio_chip *gp=
io =3D &bank->gpio_chip;
03b054e9696c3cb Sherman Yin         2013-08-27  3628  	enum pin_config_para=
m param;
58957d2edfa19e9 Mika Westerberg     2017-01-23  3629  	u32 arg;
03b054e9696c3cb Sherman Yin         2013-08-27  3630  	int i;
03b054e9696c3cb Sherman Yin         2013-08-27  3631  	int rc;
03b054e9696c3cb Sherman Yin         2013-08-27  3632 =20
03b054e9696c3cb Sherman Yin         2013-08-27  3633  	for (i =3D 0; i < nu=
m_configs; i++) {
03b054e9696c3cb Sherman Yin         2013-08-27  3634  		param =3D pinconf_t=
o_config_param(configs[i]);
03b054e9696c3cb Sherman Yin         2013-08-27  3635  		arg =3D pinconf_to_=
config_argument(configs[i]);
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3636 =20
203a83112e097a5 Linus Walleij       2025-09-05  3637  		if (param =3D=3D PI=
N_CONFIG_LEVEL || param =3D=3D PIN_CONFIG_INPUT_ENABLE) {
8ce5ef645468502 Caleb Connolly      2022-03-28  3638  			/*
8ce5ef645468502 Caleb Connolly      2022-03-28  3639  			 * Check for gpio =
driver not being probed yet.
8ce5ef645468502 Caleb Connolly      2022-03-28  3640  			 * The lock makes =
sure that either gpio-probe has completed
8ce5ef645468502 Caleb Connolly      2022-03-28  3641  			 * or the gpio dri=
ver hasn't probed yet.
8ce5ef645468502 Caleb Connolly      2022-03-28  3642  			 */
e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3643  			scoped_guard(mutex=
, &bank->deferred_lock) {
8ce5ef645468502 Caleb Connolly      2022-03-28 @3644  				if (!gpio || !gpi=
o->direction_output) {
e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3645  					rc =3D rockchip_=
pinconf_defer_pin(bank,
e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3646  									pin - bank->=
pin_base,
e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3647  									param, arg);
8ce5ef645468502 Caleb Connolly      2022-03-28  3648  					if (rc)
8ce5ef645468502 Caleb Connolly      2022-03-28  3649  						return rc;
8ce5ef645468502 Caleb Connolly      2022-03-28  3650  					break;
8ce5ef645468502 Caleb Connolly      2022-03-28  3651  				}
e2c58cbe3aff49f Krzysztof Kozlowski 2026-01-18  3652  			}
8ce5ef645468502 Caleb Connolly      2022-03-28  3653  		}
8ce5ef645468502 Caleb Connolly      2022-03-28  3654 =20
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3655  		switch (param)=
 {
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3656  		case PIN_CONFI=
G_BIAS_DISABLE:
03b054e9696c3cb Sherman Yin         2013-08-27  3657  			rc =3D  rockchip_s=
et_pull(bank, pin - bank->pin_base,
03b054e9696c3cb Sherman Yin         2013-08-27  3658  				param);
03b054e9696c3cb Sherman Yin         2013-08-27  3659  			if (rc)
03b054e9696c3cb Sherman Yin         2013-08-27  3660  				return rc;
44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3661  			break;
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3662  		case PIN_CONFI=
G_BIAS_PULL_UP:
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3663  		case PIN_CONFI=
G_BIAS_PULL_DOWN:
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3664  		case PIN_CONFI=
G_BIAS_PULL_PIN_DEFAULT:
6ca5274d1d1258b Heiko St=C3=BCbner       2013-10-16  3665  		case PIN_CONFI=
G_BIAS_BUS_HOLD:
44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3666  			if (!rockchip=
_pinconf_pull_valid(info->ctrl, param))
44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3667  				return -ENOT=
SUPP;
44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3668 =20
44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3669  			if (!arg)
44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3670  				return -EINV=
AL;
44b6d93043ab677 Heiko St=C3=BCbner       2013-06-16  3671 =20
03b054e9696c3cb Sherman Yin         2013-08-27  3672  			rc =3D rockchip_se=
t_pull(bank, pin - bank->pin_base,
03b054e9696c3cb Sherman Yin         2013-08-27  3673  				param);
03b054e9696c3cb Sherman Yin         2013-08-27  3674  			if (rc)
03b054e9696c3cb Sherman Yin         2013-08-27  3675  				return rc;
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3676  			break;
203a83112e097a5 Linus Walleij       2025-09-05  3677  		case PIN_CONFIG_LEV=
EL:
9ce9a02039de72e Jianqun Xu          2021-08-16  3678  			rc =3D rockchip_se=
t_mux(bank, pin - bank->pin_base,
9ce9a02039de72e Jianqun Xu          2021-08-16  3679  					      RK_FUNC_GP=
IO);
9ce9a02039de72e Jianqun Xu          2021-08-16  3680  			if (rc !=3D RK_FUN=
C_GPIO)
9ce9a02039de72e Jianqun Xu          2021-08-16  3681  				return -EINVAL;
9ce9a02039de72e Jianqun Xu          2021-08-16  3682 =20
9ce9a02039de72e Jianqun Xu          2021-08-16 @3683  			rc =3D gpio->direc=
tion_output(gpio, pin - bank->pin_base,
9ce9a02039de72e Jianqun Xu          2021-08-16  3684  						    arg);
a076e2ed3fd26f8 Heiko St=C3=BCbner       2014-04-23  3685  			if (rc)
a076e2ed3fd26f8 Heiko St=C3=BCbner       2014-04-23  3686  				return rc;
a076e2ed3fd26f8 Heiko St=C3=BCbner       2014-04-23  3687  			break;
42d90a1e5caf731 Caleb Connolly      2022-03-28  3688  		case PIN_CONFIG_INP=
UT_ENABLE:
42d90a1e5caf731 Caleb Connolly      2022-03-28  3689  			rc =3D rockchip_se=
t_mux(bank, pin - bank->pin_base,
42d90a1e5caf731 Caleb Connolly      2022-03-28  3690  					      RK_FUNC_GP=
IO);
42d90a1e5caf731 Caleb Connolly      2022-03-28  3691  			if (rc !=3D RK_FUN=
C_GPIO)
42d90a1e5caf731 Caleb Connolly      2022-03-28  3692  				return -EINVAL;
42d90a1e5caf731 Caleb Connolly      2022-03-28  3693 =20
42d90a1e5caf731 Caleb Connolly      2022-03-28  3694  			rc =3D gpio->direc=
tion_input(gpio, pin - bank->pin_base);
42d90a1e5caf731 Caleb Connolly      2022-03-28  3695  			if (rc)
42d90a1e5caf731 Caleb Connolly      2022-03-28  3696  				return rc;
42d90a1e5caf731 Caleb Connolly      2022-03-28  3697  			break;
b547c8007e83a47 Heiko St=C3=BCbner       2014-07-20  3698  		case PIN_CONFI=
G_DRIVE_STRENGTH:
b547c8007e83a47 Heiko St=C3=BCbner       2014-07-20  3699  			/* rk3288 is =
the first with per-pin drive-strength */
ef17f69f5bf57de Heiko St=C3=BCbner       2015-06-12  3700  			if (!info->ct=
rl->drv_calc_reg)
b547c8007e83a47 Heiko St=C3=BCbner       2014-07-20  3701  				return -ENOT=
SUPP;
b547c8007e83a47 Heiko St=C3=BCbner       2014-07-20  3702 =20
ef17f69f5bf57de Heiko St=C3=BCbner       2015-06-12  3703  			rc =3D rockch=
ip_set_drive_perpin(bank,
ef17f69f5bf57de Heiko St=C3=BCbner       2015-06-12  3704  						pin - bank=
->pin_base, arg);
b547c8007e83a47 Heiko St=C3=BCbner       2014-07-20  3705  			if (rc < 0)
b547c8007e83a47 Heiko St=C3=BCbner       2014-07-20  3706  				return rc;
b547c8007e83a47 Heiko St=C3=BCbner       2014-07-20  3707  			break;
e3b357d7dfe6b38 david.wu            2017-03-02  3708  		case PIN_CONFIG_INP=
UT_SCHMITT_ENABLE:
e3b357d7dfe6b38 david.wu            2017-03-02  3709  			if (!info->ctrl->s=
chmitt_calc_reg)
e3b357d7dfe6b38 david.wu            2017-03-02  3710  				return -ENOTSUPP;
e3b357d7dfe6b38 david.wu            2017-03-02  3711 =20
e3b357d7dfe6b38 david.wu            2017-03-02  3712  			rc =3D rockchip_se=
t_schmitt(bank,
e3b357d7dfe6b38 david.wu            2017-03-02  3713  						  pin - bank->p=
in_base, arg);
e3b357d7dfe6b38 david.wu            2017-03-02  3714  			if (rc < 0)
e3b357d7dfe6b38 david.wu            2017-03-02  3715  				return rc;
e3b357d7dfe6b38 david.wu            2017-03-02  3716  			break;
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3717  		default:
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3718  			return -ENOTS=
UPP;
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3719  			break;
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3720  		}
03b054e9696c3cb Sherman Yin         2013-08-27  3721  	} /* for each config=
 */
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3722 =20
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3723  	return 0;
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3724  }
d3e5116119bd02e Heiko St=C3=BCbner       2013-06-10  3725 =20

:::::: The code at line 3683 was first introduced by commit
:::::: 9ce9a02039de72ec8af1bd4bff14f1780337ffcc pinctrl/rockchip: drop the =
gpio related codes

:::::: TO: Jianqun Xu <jay.xu@rock-chips.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
