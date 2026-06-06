Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4183AFCFE
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780761290; cv=none; b=NWDYQj3TMRlzubAWy37cnp5LupEB5bSL8o9gH96/PGUPWUF7ZnoKdvWY3BcY51DBu2xsKf5zDfbWGeVR2nXu/+A1xzapePnM/8S1LeIT7wjW1nD8lD1TmaTeVDtoAa1kNRyen2LZILoHqku954Kai5TqcK5CXEdtjG1sAV6/eL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780761290; c=relaxed/simple;
	bh=IIPRjraE7fs4WTfMRrsCTgyo42QUJTgbzw/RrJHluZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jMV8/RquGZ3c0obJxPyczZqhG7gOWyoV1csEOV7KnacyYtq0iD1LD7Lex6TT+rE3pllmDlMpekFal84MAffIW1nrGBZ8g+24jGLkmsYFl/vZ3OOUxlSjuvbiN/ZoI8Q0OIywUFXtAw44h2oFHOD3B4yVYJS19xlB7zpqgXpPm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FniVpExe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FniVpExe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780761287; x=1812297287;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IIPRjraE7fs4WTfMRrsCTgyo42QUJTgbzw/RrJHluZo=;
  b=FniVpExerVnJKNcQ4fvdXFiu+hprKGLr/Ikye/GW/wLmIwFFSiA0pYpE
   EVncbyGBHaOoDL1VUdJk6N8amAzzWAW41fR5XMYa14hYLBGaAW4wW+kGT
   mEncYHRlL9X7tWpd5l5ErLphLfavRiQGnLkvVt6S1tSGZl4nO1bhbjITa
   3sEWayHJ8fJXoU1zXJzuUKpIG8jMfmWFpZV1ae2fgZiUoKdfnu7gk/UYA
   YJ1yh9sbFG5m2YVifvtcnYNVJx9eKqV6eyxC3TSRxO0TiDv5LrKtZZBob
   s0Je+9YqLjEJ3v2Tk7TL/zIUV/guDDsJ8dsTl8oV8CQO99fsblnUS3vqz
   Q==;
X-CSE-ConnectionGUID: 55qMt2NuSjuTewxYlm7fmw==
X-CSE-MsgGUID: 5dZrqaghQTy0/UtTyCy/2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="107003829"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="107003829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 08:54:46 -0700
X-CSE-ConnectionGUID: DQQvGMhrSbqvrrVH4cjrzQ==
X-CSE-MsgGUID: eXsjq0+UQKObNF+uQKZMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="245236303"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jun 2026 08:54:45 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVtMA-00000000H6o-0jZ2;
	Sat, 06 Jun 2026 15:54:42 +0000
Date: Sat, 06 Jun 2026 23:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sre-power-supply:for-next 7/30]
 drivers/power/supply/max17042_battery.c:117 max17042_get_temperature() warn:
 the 'MAX17042_TEMPERATURE_LSB' macro might need parens
Message-ID: <202606062322.TyvCPB3l-lkp@intel.com>
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
TO: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-sup=
ply.git for-next
head:   4acc0138c4f2fba453da5a5076ad2bba08a7463b
commit: 63f2279aa1eca55c0f6403f488739f1ff54d8564 [7/30] power: supply: max1=
7042_battery: Put LSB units into defines
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: mips-randconfig-r071-20260606 (https://download.01.org/0day-ci/arch=
ive/20260606/202606062322.TyvCPB3l-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 791=
7772d7d61384696c61102c08c2ea158e610fa)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606062322.TyvCPB3l-lkp@intel.com/

New smatch warnings:
drivers/power/supply/max17042_battery.c:117 max17042_get_temperature() warn=
: the 'MAX17042_TEMPERATURE_LSB' macro might need parens
drivers/power/supply/max17042_battery.c:194 max17042_get_battery_health() w=
arn: the 'MAX17042_VOLTAGE_LSB' macro might need parens
drivers/power/supply/max17042_battery.c:310 max17042_get_property() warn: t=
he 'MAX17042_VOLTAGE_LSB' macro might need parens
drivers/power/supply/max17042_battery.c:453 max17042_get_property() warn: t=
he 'MAX17042_TIME_LSB' macro might need parens

Old smatch warnings:
drivers/power/supply/max17042_battery.c:203 max17042_get_battery_health() w=
arn: the 'MAX17042_VOLTAGE_LSB' macro might need parens
drivers/power/supply/max17042_battery.c:317 max17042_get_property() warn: t=
he 'MAX17042_VOLTAGE_LSB' macro might need parens
drivers/power/supply/max17042_battery.c:324 max17042_get_property() warn: t=
he 'MAX17042_VOLTAGE_LSB' macro might need parens
drivers/power/supply/max17042_battery.c:468 max17042_get_property() warn: t=
he 'MAX17042_TIME_LSB' macro might need parens

vim +/MAX17042_TEMPERATURE_LSB +117 drivers/power/supply/max17042_battery.c

359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  104 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  105  static int max17042_get_temperature(struct max17042_chi=
p *chip, int *temp)
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  106  {
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  107  	int ret;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  108  	u32 data;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  109  	struct regmap *map =3D chip->regmap;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  110 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  111  	ret =3D regmap_read(map, MAX17042_TEMP, &data);
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  112  	if (ret < 0)
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  113  		return ret;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  114 =20
c67c06939ee4a2 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  115  	*temp =3D sign_extend32(data, 15);
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  116  	/* The value is converted into deci-centigrade scale */
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06 @117  	*temp =3D *temp * 10 * MAX17042_TEMPERATURE_LSB;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  118  	return 0;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  119  }
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  120 =20
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  121  static int max17042_get_status(struct max17042_chip *ch=
ip, int *status)
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  122  {
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  123  	int ret, charge_full, charge_now;
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  124  	int avg_current;
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  125  	u32 data;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  126 =20
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  127  	ret =3D power_supply_am_i_supplied(chip->battery);
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  128  	if (ret < 0) {
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  129  		*status =3D POWER_SUPPLY_STATUS_UNKNOWN;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  130  		return 0;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  131  	}
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  132  	if (ret =3D=3D 0) {
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  133  		*status =3D POWER_SUPPLY_STATUS_DISCHARGING;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  134  		return 0;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  135  	}
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  136 =20
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  137  	/*
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  138  	 * The MAX170xx has builtin end-of-charge detection an=
d will update
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  139  	 * FullCAP to match RepCap when it detects end of char=
ging.
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  140  	 *
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  141  	 * When this cycle the battery gets charged to a highe=
r (calculated)
e370b67c2ceb3e drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  142  	 * capacity than the previous cycle then FullCAP =
will get updated
37ad56aa82be0b drivers/power/supply/max17042_battery.c Bhaskar Chowdhury   =
   2021-03-23  143  	 * continuously once end-of-charge detection kicks in,=
 so allow the
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  144  	 * 2 to differ a bit.
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  145  	 */
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  146 =20
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  147  	ret =3D regmap_read(chip->regmap, MAX17042_FullCAP, &c=
harge_full);
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  148  	if (ret < 0)
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  149  		return ret;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  150 =20
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  151  	ret =3D regmap_read(chip->regmap, MAX17042_RepCap, &ch=
arge_now);
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  152  	if (ret < 0)
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  153  		return ret;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  154 =20
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  155  	if ((charge_full - charge_now) <=3D MAX17042_FULL_THRE=
SHOLD) {
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  156  		*status =3D POWER_SUPPLY_STATUS_FULL;
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  157  		return 0;
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  158  	}
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  159 =20
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  160  	/*
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  161  	 * Even though we are supplied, we may still be discha=
rging if the
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  162  	 * supply is e.g. only delivering 5V 0.5A. Check curre=
nt if available.
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  163  	 */
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  164  	if (!chip->pdata->enable_current_sense) {
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  165  		*status =3D POWER_SUPPLY_STATUS_CHARGING;
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  166  		return 0;
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  167  	}
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  168 =20
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  169  	ret =3D regmap_read(chip->regmap, MAX17042_AvgCurrent,=
 &data);
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  170  	if (ret < 0)
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  171  		return ret;
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  172 =20
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  173  	avg_current =3D sign_extend32(data, 15);
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  174  	avg_current *=3D 1562500 / chip->pdata->r_sns;
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  175 =20
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  176  	if (avg_current > 0)
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  177  		*status =3D POWER_SUPPLY_STATUS_CHARGING;
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  178  	else
6e5ab19d54e8cd drivers/power/supply/max17042_battery.c Hans de Goede       =
   2018-01-20  179  		*status =3D POWER_SUPPLY_STATUS_DISCHARGING;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  180 =20
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  181  	return 0;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  182  }
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  183 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  184  static int max17042_get_battery_health(struct max17042_=
chip *chip, int *health)
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  185  {
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  186  	int temp, vavg, vbatt, ret;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  187  	u32 val;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  188 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  189  	ret =3D regmap_read(chip->regmap, MAX17042_AvgVCELL, &=
val);
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  190  	if (ret < 0)
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  191  		goto health_error;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  192 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  193  	/* bits [0-3] unused */
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06 @194  	vavg =3D val * MAX17042_VOLTAGE_LSB;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  195  	/* Convert to millivolts */
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  196  	vavg /=3D 1000;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  197 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  198  	ret =3D regmap_read(chip->regmap, MAX17042_VCELL, &val=
);
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  199  	if (ret < 0)
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  200  		goto health_error;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  201 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  202  	/* bits [0-3] unused */
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  203  	vbatt =3D val * MAX17042_VOLTAGE_LSB;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  204  	/* Convert to millivolts */
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  205  	vbatt /=3D 1000;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  206 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  207  	if (vavg < chip->pdata->vmin) {
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  208  		*health =3D POWER_SUPPLY_HEALTH_DEAD;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  209  		goto out;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  210  	}
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  211 =20
9a44949da66970 drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  212  	if (vbatt > size_add(chip->pdata->vmax, MAX17042_=
VMAX_TOLERANCE)) {
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  213  		*health =3D POWER_SUPPLY_HEALTH_OVERVOLTAGE;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  214  		goto out;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  215  	}
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  216 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  217  	ret =3D max17042_get_temperature(chip, &temp);
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  218  	if (ret < 0)
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  219  		goto health_error;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  220 =20
917362135b8a5c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  221  	if (temp < chip->pdata->temp_min) {
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  222  		*health =3D POWER_SUPPLY_HEALTH_COLD;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  223  		goto out;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  224  	}
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  225 =20
917362135b8a5c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  226  	if (temp > chip->pdata->temp_max) {
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  227  		*health =3D POWER_SUPPLY_HEALTH_OVERHEAT;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  228  		goto out;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  229  	}
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  230 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  231  	*health =3D POWER_SUPPLY_HEALTH_GOOD;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  232 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  233  out:
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  234  	return 0;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  235 =20
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  236  health_error:
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  237  	return ret;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  238  }
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  239 =20
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  240  static int max17042_get_property(struct power_supply *p=
sy,
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  241  			    enum power_supply_property psp,
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  242  			    union power_supply_propval *val)
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  243  {
297d716f6260cc drivers/power/max17042_battery.c        Krzysztof Kozlowski =
   2015-03-12  244  	struct max17042_chip *chip =3D power_supply_get_drvdat=
a(psy);
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  245  	struct regmap *map =3D chip->regmap;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  246  	int ret;
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  247  	u32 data;
d7d15fc67791c0 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  248  	u64 data64;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  249 =20
f3a71a6eb13b71 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-03-13  250  	if (!chip->init_complete)
f3a71a6eb13b71 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-03-13  251  		return -EAGAIN;
f3a71a6eb13b71 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-03-13  252 =20
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  253  	switch (psp) {
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  254  	case POWER_SUPPLY_PROP_STATUS:
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  255  		ret =3D max17042_get_status(chip, &val->intval);
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  256  		if (ret < 0)
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  257  			return ret;
a9df22c00d7c2c drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  258  		break;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  259  	case POWER_SUPPLY_PROP_PRESENT:
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  260  		ret =3D regmap_read(map, MAX17042_STATUS, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  261  		if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  262  			return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  263 =20
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  264  		if (data & MAX17042_STATUS_BattAbsent)
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  265  			val->intval =3D 0;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  266  		else
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  267  			val->intval =3D 1;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  268  		break;
ef7fcdaebfce56 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  269  	case POWER_SUPPLY_PROP_TECHNOLOGY:
ef7fcdaebfce56 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  270  		val->intval =3D POWER_SUPPLY_TECHNOLOGY_LION;
ef7fcdaebfce56 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  271  		break;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  272  	case POWER_SUPPLY_PROP_CYCLE_COUNT:
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  273  		ret =3D regmap_read(map, MAX17042_Cycles, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  274  		if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  275  			return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  276 =20
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  277  		val->intval =3D data;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  278  		break;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  279  	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  280  		ret =3D regmap_read(map, MAX17042_MinMaxVolt, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  281  		if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  282  			return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  283 =20
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  284  		val->intval =3D data >> 8;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  285  		val->intval *=3D 20000; /* Units of LSB =3D 20mV */
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  286  		break;
7bfc9397ff9690 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  287  	case POWER_SUPPLY_PROP_VOLTAGE_MIN:
7bfc9397ff9690 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  288  		ret =3D regmap_read(map, MAX17042_MinMaxVolt, &data);
7bfc9397ff9690 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  289  		if (ret < 0)
7bfc9397ff9690 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  290  			return ret;
7bfc9397ff9690 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  291 =20
7bfc9397ff9690 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  292  		val->intval =3D (data & 0xff) * 20000; /* Units of 20=
mV */
7bfc9397ff9690 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  293  		break;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  294  	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
709c2c70c8ea73 drivers/power/max17042_battery.c        Beomho Seo          =
   2015-04-03  295  		if (chip->chip_type =3D=3D MAXIM_DEVICE_TYPE_MAX17042)
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  296  			ret =3D regmap_read(map, MAX17042_V_empty, &data);
9a8422d205ea14 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-05-05  297  		else
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  298  			ret =3D regmap_read(map, MAX17047_V_empty, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  299  		if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  300  			return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  301 =20
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  302  		val->intval =3D data >> 7;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  303  		val->intval *=3D 10000; /* Units of LSB =3D 10mV */
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  304  		break;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  305  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  306  		ret =3D regmap_read(map, MAX17042_VCELL, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  307  		if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  308  			return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  309 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06 @310  		val->intval =3D data * MAX17042_VOLTAGE_LSB;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  311  		break;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  312  	case POWER_SUPPLY_PROP_VOLTAGE_AVG:
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  313  		ret =3D regmap_read(map, MAX17042_AvgVCELL, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  314  		if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  315  			return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  316 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  317  		val->intval =3D data * MAX17042_VOLTAGE_LSB;
a2ebfe2fc6e088 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-04-10  318  		break;
a2ebfe2fc6e088 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-04-10  319  	case POWER_SUPPLY_PROP_VOLTAGE_OCV:
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  320  		ret =3D regmap_read(map, MAX17042_OCVInternal, &data);
a2ebfe2fc6e088 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-04-10  321  		if (ret < 0)
a2ebfe2fc6e088 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-04-10  322  			return ret;
a2ebfe2fc6e088 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-04-10  323 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  324  		val->intval =3D data * MAX17042_VOLTAGE_LSB;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  325  		break;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  326  	case POWER_SUPPLY_PROP_CAPACITY:
223a3b82834f03 drivers/power/supply/max17042_battery.c Henrik Grimler      =
   2021-09-29  327  		if (chip->pdata->enable_current_sense)
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  328  			ret =3D regmap_read(map, MAX17042_RepSOC, &data);
223a3b82834f03 drivers/power/supply/max17042_battery.c Henrik Grimler      =
   2021-09-29  329  		else
223a3b82834f03 drivers/power/supply/max17042_battery.c Henrik Grimler      =
   2021-09-29  330  			ret =3D regmap_read(map, MAX17042_VFSOC, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  331  		if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  332  			return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  333 =20
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  334  		val->intval =3D data >> 8;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  335  		break;
2e015412a320e4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  336  	case POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN:
2e015412a320e4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  337  		ret =3D regmap_read(map, MAX17042_DesignCap, &data);
2e015412a320e4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  338  		if (ret < 0)
2e015412a320e4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  339  			return ret;
2e015412a320e4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  340 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  341  		data64 =3D data * MAX17042_CAPACITY_LSB;
83a86e27c34d06 drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  342  		data64 *=3D chip->task_period;
83a86e27c34d06 drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  343  		do_div(data64, MAX17042_DEFAULT_TASK_PERIOD);
2e015412a320e4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  344  		do_div(data64, chip->pdata->r_sns);
2e015412a320e4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  345  		val->intval =3D data64;
2e015412a320e4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  346  		break;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  347  	case POWER_SUPPLY_PROP_CHARGE_FULL:
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  348  		ret =3D regmap_read(map, MAX17042_FullCAP, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  349  		if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  350  			return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  351 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  352  		data64 =3D data * MAX17042_CAPACITY_LSB;
83a86e27c34d06 drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  353  		data64 *=3D chip->task_period;
83a86e27c34d06 drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  354  		do_div(data64, MAX17042_DEFAULT_TASK_PERIOD);
6d6b61eafca941 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  355  		do_div(data64, chip->pdata->r_sns);
6d6b61eafca941 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  356  		val->intval =3D data64;
6d6b61eafca941 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  357  		break;
6d6b61eafca941 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  358  	case POWER_SUPPLY_PROP_CHARGE_NOW:
6d6b61eafca941 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  359  		ret =3D regmap_read(map, MAX17042_RepCap, &data);
6d6b61eafca941 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  360  		if (ret < 0)
6d6b61eafca941 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  361  			return ret;
6d6b61eafca941 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  362 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  363  		data64 =3D data * MAX17042_CAPACITY_LSB;
83a86e27c34d06 drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  364  		data64 *=3D chip->task_period;
83a86e27c34d06 drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  365  		do_div(data64, MAX17042_DEFAULT_TASK_PERIOD);
d7d15fc67791c0 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  366  		do_div(data64, chip->pdata->r_sns);
d7d15fc67791c0 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  367  		val->intval =3D data64;
5fc55bc8225d5a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-05-07  368  		break;
5fc55bc8225d5a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-05-07  369  	case POWER_SUPPLY_PROP_CHARGE_COUNTER:
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  370  		ret =3D regmap_read(map, MAX17042_QH, &data);
5fc55bc8225d5a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-05-07  371  		if (ret < 0)
5fc55bc8225d5a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-05-07  372  			return ret;
5fc55bc8225d5a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2012-05-07  373 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  374  		data64 =3D sign_extend64(data, 15) * MAX17042_CAPACIT=
Y_LSB;
83a86e27c34d06 drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  375  		data64 *=3D chip->task_period;
83a86e27c34d06 drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  376  		data64 =3D div_s64(data64, MAX17042_DEFAULT_TASK=
_PERIOD);
6dcfa009f8a962 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  377  		val->intval =3D div_s64(data64, chip->pdata->r_sns);
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  378  		break;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  379  	case POWER_SUPPLY_PROP_TEMP:
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  380  		ret =3D max17042_get_temperature(chip, &val->intval);
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  381  		if (ret < 0)
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  382  			return ret;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  383  		break;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  384  	case POWER_SUPPLY_PROP_TEMP_ALERT_MIN:
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  385  		ret =3D regmap_read(map, MAX17042_TALRT_Th, &data);
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  386  		if (ret < 0)
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  387  			return ret;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  388  		/* LSB is Alert Minimum. In deci-centigrade */
2814913c3136b4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  389  		val->intval =3D sign_extend32(data & 0xff, 7) * 10;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  390  		break;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  391  	case POWER_SUPPLY_PROP_TEMP_ALERT_MAX:
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  392  		ret =3D regmap_read(map, MAX17042_TALRT_Th, &data);
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  393  		if (ret < 0)
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  394  			return ret;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  395  		/* MSB is Alert Maximum. In deci-centigrade */
2814913c3136b4 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  396  		val->intval =3D sign_extend32(data >> 8, 7) * 10;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  397  		break;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  398  	case POWER_SUPPLY_PROP_TEMP_MIN:
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  399  		val->intval =3D chip->pdata->temp_min;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  400  		break;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  401  	case POWER_SUPPLY_PROP_TEMP_MAX:
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  402  		val->intval =3D chip->pdata->temp_max;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  403  		break;
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  404  	case POWER_SUPPLY_PROP_HEALTH:
edd4ab0559316a drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2015-05-24  405  		ret =3D max17042_get_battery_health(chip, &val->intva=
l);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  406  		if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  407  			return ret;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  408  		break;
adb69a3c452469 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  409  	case POWER_SUPPLY_PROP_SCOPE:
adb69a3c452469 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  410  		val->intval =3D POWER_SUPPLY_SCOPE_SYSTEM;
adb69a3c452469 drivers/power/supply/max17042_battery.c Hans de Goede       =
   2017-04-14  411  		break;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  412  	case POWER_SUPPLY_PROP_CURRENT_NOW:
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  413  		if (chip->pdata->enable_current_sense) {
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  414  			ret =3D regmap_read(map, MAX17042_Current, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  415  			if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  416  				return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  417 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  418  			data64 =3D sign_extend64(data, 15) * MAX17042_CURREN=
T_LSB;
9e39ef14877772 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  419  			val->intval =3D div_s64(data64, chip->pdata->r_sns);
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  420  		} else {
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  421  			return -EINVAL;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  422  		}
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  423  		break;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  424  	case POWER_SUPPLY_PROP_CURRENT_AVG:
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  425  		if (chip->pdata->enable_current_sense) {
39e7213edc4f31 drivers/power/max17042_battery.c        Jonghwa Lee         =
   2013-10-25  426  			ret =3D regmap_read(map, MAX17042_AvgCurrent, &data);
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  427  			if (ret < 0)
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  428  				return ret;
60a1f6e4462bb7 drivers/power/max17042_battery.c        Ramakrishna Pallala =
   2011-11-26  429 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  430  			data64 =3D sign_extend64(data, 15) * MAX17042_CURREN=
T_LSB;
9e39ef14877772 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  431  			val->intval =3D div_s64(data64, chip->pdata->r_sns);
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  432  		} else {
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  433  			return -EINVAL;
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  434  		}
086ef502c20250 drivers/power/max17042_battery.c        Donggeun Kim        =
   2011-06-30  435  		break;
5225371e56c512 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  436  	case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
5225371e56c512 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  437  		ret =3D regmap_read(map, MAX17042_ICHGTerm, &data);
5225371e56c512 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  438  		if (ret < 0)
5225371e56c512 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  439  			return ret;
5225371e56c512 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  440 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  441  		data64 =3D data * MAX17042_CURRENT_LSB;
5225371e56c512 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  442  		val->intval =3D div_s64(data64, chip->pdata->r_sns);
5225371e56c512 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2020-11-25  443  		break;
21b01cc879cc3e drivers/power/supply/max17042_battery.c Geordan Neukum      =
   2020-03-30  444  	case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
21b01cc879cc3e drivers/power/supply/max17042_battery.c Geordan Neukum      =
   2020-03-30  445  		ret =3D regmap_read(map, MAX17042_TTE, &data);
21b01cc879cc3e drivers/power/supply/max17042_battery.c Geordan Neukum      =
   2020-03-30  446  		if (ret < 0)
21b01cc879cc3e drivers/power/supply/max17042_battery.c Geordan Neukum      =
   2020-03-30  447  			return ret;
21b01cc879cc3e drivers/power/supply/max17042_battery.c Geordan Neukum      =
   2020-03-30  448 =20
0c5a6dc85d739c drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  449  		/* when charging, the value is not meaningful */
0c5a6dc85d739c drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  450  		if (data =3D=3D U16_MAX)
0c5a6dc85d739c drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  451  			return -ENODATA;
0c5a6dc85d739c drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  452 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  453  		val->intval =3D data * MAX17042_TIME_LSB;
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  454  		break;
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  455  	case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  456  		if (chip->chip_type !=3D MAXIM_DEVICE_TYPE_MAX17=
055 &&
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  457  		    chip->chip_type !=3D MAXIM_DEVICE_TYPE_MAX77=
759)
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  458  			return -EINVAL;
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  459 =20
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  460  		ret =3D regmap_read(map, MAX17055_TTF, &data);
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  461  		if (ret < 0)
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  462  			return ret;
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  463 =20
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  464  		/* when discharging, the value is not meaningful=
 */
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  465  		if (data =3D=3D U16_MAX)
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  466  			return -ENODATA;
c10b68e331c51a drivers/power/supply/max17042_battery.c Andr=C3=A9 Draszik  =
        2026-03-02  467 =20
63f2279aa1eca5 drivers/power/supply/max17042_battery.c Sebastian Krzyszkowi=
ak 2026-04-06  468  		val->intval =3D data * MAX17042_TIME_LSB;
21b01cc879cc3e drivers/power/supply/max17042_battery.c Geordan Neukum      =
   2020-03-30  469  		break;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  470  	default:
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  471  		return -EINVAL;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  472  	}
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  473  	return 0;
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  474  }
359ab9f5b154cb drivers/power/max17042_battery.c        MyungJoo Ham        =
   2011-01-14  475 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
