Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83C3320A37
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 04:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768537301; cv=none; b=WP2cSGiMl39cASS6S7oTNlAH2zWV0QllTYSg3K9NJDvH+j5JOxUM1MAPjAlMBDgVGnttwZK7p9QphiRfZCo96GqskC8dLlEzjc0NtgLO8UUfcIgqwnDGukB+MOetQVhvuTpQ3+6/jvkHYZUEMtO2QeqLM+iWcqiWKVFjbzWK3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768537301; c=relaxed/simple;
	bh=llPv+SHZaLXbVe7HFgRFe/a7vYJFuMGawtdAB+rybB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IMuk+3d6FoYmw3f+d34IBQEF9MZNhqdTIX46AdOBXGgfd/UpwBt5/jDSPOT7U0By+213WtNw98Jf9xCTUHigtiXEzyisqQt6Rbkd20dBlPz8gHvit+LkVJ9haL8/G6NVpMGb5q4zRW8/uMsZu9BB3nZMThhAkCOCosKCAdHBgrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcpU2gCm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcpU2gCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768537300; x=1800073300;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=llPv+SHZaLXbVe7HFgRFe/a7vYJFuMGawtdAB+rybB8=;
  b=LcpU2gCm/eE9ae5D7DaVv8rP4Vbu+e1BiVfrjK22wozKbG14W+8xAtcI
   fGCBsoujP5e1VMxHdWwmbyzkUhD1ag9vff1up+4ZINqhDBGd+e0a7rDsM
   6BqVBZa+TNeZqkF/nW1R41McTunMPT85rMKE9xo6b57flbrI//tGos/Ee
   scT2Kp3hiBiUwvnC+ojWBON2KIlqGB+vUCaQrAny8XVqE9bynu5/9SQvl
   47ZuENKC37ljw4VXdRgcWvJAbD0VhsYlceHF/NKZ0kKZCMEwJ3xOLZi5w
   ISEO/k13zmB/bvciSb/iHG81Z2M1IQnYGZH6YVmKDCqUeXQtHtxPFd/qv
   w==;
X-CSE-ConnectionGUID: R8KCBbfvT3e8d/IVbd7RSw==
X-CSE-MsgGUID: 3Q8dXobsSSugfC1jPwtTwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="92519367"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="92519367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 20:21:38 -0800
X-CSE-ConnectionGUID: Xqz3zabQTBqN60Jivcv7RA==
X-CSE-MsgGUID: 0/+KzZjjSwm62wbcQhaIWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="235831976"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 20:21:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgbL4-00000000KMh-1bg6;
	Fri, 16 Jan 2026 04:21:34 +0000
Date: Fri, 16 Jan 2026 12:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [conor:pinctrl 7/14] drivers/pinctrl/pinconf-generic.c:268
 parse_dt_cfg() error: uninitialized symbol 'val'.
Message-ID: <202601161219.t7K6GhHj-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pin=
ctrl
head:   8a26d7f359a1052acb67617f632364d0527d9498
commit: cda61ccb5e996faddddd3668b288b5ae30814e02 [7/14] pinctrl: pinconf-ge=
neric: perform basic checks on pincfg properties
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm64-randconfig-r071-20260116 (https://download.01.org/0day-ci/arc=
hive/20260116/202601161219.t7K6GhHj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601161219.t7K6GhHj-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinconf-generic.c:268 parse_dt_cfg() error: uninitialized s=
ymbol 'val'.

vim +/val +268 drivers/pinctrl/pinconf-generic.c

7db9af4b6e41be Heiko St=C3=BCbner   2013-06-10  206 =20
dd4d01f7bad886 Soren Brinkmann 2015-01-09  207  /**
f684e4ac9f4bae Linus Walleij   2015-01-12  208   * parse_dt_cfg() - Parse D=
T pinconf parameters
dd4d01f7bad886 Soren Brinkmann 2015-01-09  209   * @np:	DT node
f684e4ac9f4bae Linus Walleij   2015-01-12  210   * @params:	Array of descri=
bing generic parameters
dd4d01f7bad886 Soren Brinkmann 2015-01-09  211   * @count:	Number of entrie=
s in @params
dd4d01f7bad886 Soren Brinkmann 2015-01-09  212   * @cfg:	Array of parsed co=
nfig options
dd4d01f7bad886 Soren Brinkmann 2015-01-09  213   * @ncfg:	Number of entries=
 in @cfg
dd4d01f7bad886 Soren Brinkmann 2015-01-09  214   *
dd4d01f7bad886 Soren Brinkmann 2015-01-09  215   * Parse the config options=
 described in @params from @np and puts the result
3ec440e33f6895 Andy Shevchenko 2017-02-28  216   * in @cfg. @cfg does not n=
eed to be empty, entries are added beginning at
dd4d01f7bad886 Soren Brinkmann 2015-01-09  217   * @ncfg. @ncfg is updated =
to reflect the number of entries after parsing. @cfg
dd4d01f7bad886 Soren Brinkmann 2015-01-09  218   * needs to have enough mem=
ory allocated to hold all possible entries.
dd4d01f7bad886 Soren Brinkmann 2015-01-09  219   */
90a18c512884ad Antonio Borneo  2025-10-23  220  static int parse_dt_cfg(str=
uct device_node *np,
f684e4ac9f4bae Linus Walleij   2015-01-12  221  			const struct pinconf_gen=
eric_params *params,
dd4d01f7bad886 Soren Brinkmann 2015-01-09  222  			unsigned int count, unsi=
gned long *cfg,
dd4d01f7bad886 Soren Brinkmann 2015-01-09  223  			unsigned int *ncfg)
dd4d01f7bad886 Soren Brinkmann 2015-01-09  224  {
cda61ccb5e996f Conor Dooley    2025-11-28  225  	unsigned long *properties;
cda61ccb5e996f Conor Dooley    2025-11-28  226  	int i, test;
cda61ccb5e996f Conor Dooley    2025-11-28  227 =20
cda61ccb5e996f Conor Dooley    2025-11-28  228  	properties =3D bitmap_zall=
oc(count, GFP_KERNEL);
dd4d01f7bad886 Soren Brinkmann 2015-01-09  229 =20
dd4d01f7bad886 Soren Brinkmann 2015-01-09  230  	for (i =3D 0; i < count; i=
++) {
dd4d01f7bad886 Soren Brinkmann 2015-01-09  231  		u32 val;
dd4d01f7bad886 Soren Brinkmann 2015-01-09  232  		int ret;
f684e4ac9f4bae Linus Walleij   2015-01-12  233  		const struct pinconf_gene=
ric_params *par =3D &params[i];
dd4d01f7bad886 Soren Brinkmann 2015-01-09  234 =20
90a18c512884ad Antonio Borneo  2025-10-23  235  		if (par->values && par->n=
um_values) {
90a18c512884ad Antonio Borneo  2025-10-23  236  			ret =3D fwnode_property_=
match_property_string(of_fwnode_handle(np),
90a18c512884ad Antonio Borneo  2025-10-23  237  								    par->property,
90a18c512884ad Antonio Borneo  2025-10-23  238  								    par->values, pa=
r->num_values);
90a18c512884ad Antonio Borneo  2025-10-23  239  			if (ret =3D=3D -ENOENT)
90a18c512884ad Antonio Borneo  2025-10-23  240  				return ret;
90a18c512884ad Antonio Borneo  2025-10-23  241  			if (ret >=3D 0) {
90a18c512884ad Antonio Borneo  2025-10-23  242  				val =3D ret;
90a18c512884ad Antonio Borneo  2025-10-23  243  				ret =3D 0;
90a18c512884ad Antonio Borneo  2025-10-23  244  			}
90a18c512884ad Antonio Borneo  2025-10-23  245  		} else {
dd4d01f7bad886 Soren Brinkmann 2015-01-09  246  			ret =3D of_property_read=
_u32(np, par->property, &val);
90a18c512884ad Antonio Borneo  2025-10-23  247  		}
dd4d01f7bad886 Soren Brinkmann 2015-01-09  248 =20
dd4d01f7bad886 Soren Brinkmann 2015-01-09  249  		/* property not found */
dd4d01f7bad886 Soren Brinkmann 2015-01-09  250  		if (ret =3D=3D -EINVAL)
dd4d01f7bad886 Soren Brinkmann 2015-01-09  251  			continue;
dd4d01f7bad886 Soren Brinkmann 2015-01-09  252 =20
cda61ccb5e996f Conor Dooley    2025-11-28  253  		/* if param is greater th=
an count, these are custom properties */
cda61ccb5e996f Conor Dooley    2025-11-28  254  		if (par->param <=3D count=
) {
cda61ccb5e996f Conor Dooley    2025-11-28  255  			ret =3D test_and_set_bit=
(par->param, properties);
cda61ccb5e996f Conor Dooley    2025-11-28  256  			if (ret) {
cda61ccb5e996f Conor Dooley    2025-11-28  257  				pr_err("%s: conflicting=
 setting detected for %s\n",
cda61ccb5e996f Conor Dooley    2025-11-28  258  				       np->name, par->p=
roperty);
cda61ccb5e996f Conor Dooley    2025-11-28  259  				bitmap_free(properties);
cda61ccb5e996f Conor Dooley    2025-11-28  260  				return -EINVAL;
cda61ccb5e996f Conor Dooley    2025-11-28  261  			}
cda61ccb5e996f Conor Dooley    2025-11-28  262  		}
cda61ccb5e996f Conor Dooley    2025-11-28  263 =20
dd4d01f7bad886 Soren Brinkmann 2015-01-09  264  		/* use default value, whe=
n no value is specified */
dd4d01f7bad886 Soren Brinkmann 2015-01-09  265  		if (ret)
dd4d01f7bad886 Soren Brinkmann 2015-01-09  266  			val =3D par->default_val=
ue;
dd4d01f7bad886 Soren Brinkmann 2015-01-09  267 =20
dd4d01f7bad886 Soren Brinkmann 2015-01-09 @268  		pr_debug("found %s with v=
alue %u\n", par->property, val);
dd4d01f7bad886 Soren Brinkmann 2015-01-09  269  		cfg[*ncfg] =3D pinconf_to=
_config_packed(par->param, val);
dd4d01f7bad886 Soren Brinkmann 2015-01-09  270  		(*ncfg)++;
dd4d01f7bad886 Soren Brinkmann 2015-01-09  271  	}
90a18c512884ad Antonio Borneo  2025-10-23  272 =20
cda61ccb5e996f Conor Dooley    2025-11-28  273  	if (test_bit(PIN_CONFIG_DR=
IVE_STRENGTH, properties) &&
cda61ccb5e996f Conor Dooley    2025-11-28  274  			test_bit(PIN_CONFIG_DRIV=
E_STRENGTH_UA, properties))
cda61ccb5e996f Conor Dooley    2025-11-28  275  		pr_err("%s: cannot have m=
ultiple drive strength properties\n",
cda61ccb5e996f Conor Dooley    2025-11-28  276  		       np->name);
cda61ccb5e996f Conor Dooley    2025-11-28  277 =20
cda61ccb5e996f Conor Dooley    2025-11-28  278  	test =3D test_bit(PIN_CONF=
IG_BIAS_BUS_HOLD, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  279  		test_bit(PIN_CONFIG_BIAS_=
DISABLE, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  280  		test_bit(PIN_CONFIG_BIAS_=
HIGH_IMPEDANCE, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  281  		test_bit(PIN_CONFIG_BIAS_=
PULL_UP, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  282  		test_bit(PIN_CONFIG_BIAS_=
PULL_PIN_DEFAULT, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  283  		test_bit(PIN_CONFIG_BIAS_=
PULL_DOWN, properties);
cda61ccb5e996f Conor Dooley    2025-11-28  284  	if (test > 1)
cda61ccb5e996f Conor Dooley    2025-11-28  285  		pr_err("%s: cannot have m=
ultiple bias configurations\n",
cda61ccb5e996f Conor Dooley    2025-11-28  286  		       np->name);
cda61ccb5e996f Conor Dooley    2025-11-28  287 =20
cda61ccb5e996f Conor Dooley    2025-11-28  288  	test =3D test_bit(PIN_CONF=
IG_DRIVE_OPEN_DRAIN, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  289  		test_bit(PIN_CONFIG_DRIVE=
_OPEN_SOURCE, properties) +
cda61ccb5e996f Conor Dooley    2025-11-28  290  		test_bit(PIN_CONFIG_DRIVE=
_PUSH_PULL, properties);
cda61ccb5e996f Conor Dooley    2025-11-28  291  	if (test > 1)
cda61ccb5e996f Conor Dooley    2025-11-28  292  		pr_err("%s: cannot have m=
ultiple drive configurations\n",
cda61ccb5e996f Conor Dooley    2025-11-28  293  		       np->name);
cda61ccb5e996f Conor Dooley    2025-11-28  294 =20
cda61ccb5e996f Conor Dooley    2025-11-28  295  	bitmap_free(properties);
90a18c512884ad Antonio Borneo  2025-10-23  296  	return 0;
dd4d01f7bad886 Soren Brinkmann 2015-01-09  297  }
dd4d01f7bad886 Soren Brinkmann 2015-01-09  298 =20

:::::: The code at line 268 was first introduced by commit
:::::: dd4d01f7bad886c22687224bc7070b87de8deb51 pinctrl: pinconf-generic: A=
llow driver to specify DT params

:::::: TO: Soren Brinkmann <soren.brinkmann@xilinx.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
