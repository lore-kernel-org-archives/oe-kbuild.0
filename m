Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6346737CD20
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 23:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777850895; cv=none; b=H5d4PshZUAe2jNEqJaJtxu38J8lsYkGfvlt+ruVTAaQzvlC3YaZGjbMaSJqr6X12Ua2wkhSIcmsIuRn514ro1aBQrTf3DqUnvGDCuXaXOL2HG79Rl7dJfCJDgm+NY6Bg1HzftxR5w8v7IrDP5cF7riAd97ioQQF6sy5D+HxIOTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777850895; c=relaxed/simple;
	bh=E6AafNSJ08P0xrcW7Xkx3bHPJEOyVZnnBAiVNIvAVoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b8CnxjDSLKNVn0Egd4ziBeAcJL8LnqvHC4DK6hJ/yp74vzLt26mPoOjgtEWRynXkJV9xTNlKvS3m7vIInudX05AHrzvzIQyLsJetzNMjP1/4acqRLUt26zhDAl21nYa9pqQNpvh1tbTY9XnTAHj0vqrMoC02pwL3txdgnHyFxbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjdSkkXh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjdSkkXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777850892; x=1809386892;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E6AafNSJ08P0xrcW7Xkx3bHPJEOyVZnnBAiVNIvAVoE=;
  b=HjdSkkXh3EzbjbogzF8rprupErcEFh5A7mmEt96X3INE0W1Z/VoIiQXy
   0j4/xPJy2YbhRcUol3X6R1x/rgLhbeTGrPonsiry+/nvBBqgypVX9ADJQ
   imcc+u2fK43JGkUrZb9maTw0fpnXve64oLyCGe7WlKDoTRljoW1h8AcMh
   Ne3MzA19Baq/B5sUqiju2I7uspZ45q9Jez7MilIR3xoOlhQg8AfmjGbn0
   6MvyMs8LGt5RUgpT+0BTyxorE8EUELhK0hSvRaefXsaXJS3mPdO+oChyU
   4Lw98CnnfzkiOkoYVX8Ttb/zCBagNbUqhOcwhqXVYWUS7GaWJkxhGSFay
   g==;
X-CSE-ConnectionGUID: DGZCVAZIT3SegM3d7OVEzA==
X-CSE-MsgGUID: r2sgmimNQEyJ1xq5o1/Iog==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="90091968"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="90091968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 16:28:12 -0700
X-CSE-ConnectionGUID: /TaEDu55RsKSwlI/B+seRg==
X-CSE-MsgGUID: ZV15VDgfQ+e48vvRZZZ3Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="234339641"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2026 16:28:09 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJgDy-000000003A5-2Ojf;
	Sun, 03 May 2026 23:28:00 +0000
Date: Mon, 04 May 2026 07:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/hwmon/lm63.c:1086:2-27: opportunity for
 str_low_high(( data -> config_fan & 0x10 ))
Message-ID: <202605040746.0x2CDmMU-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Johannes Berg <johannes@sipsolutions.net>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML w=
ithout triggering WARN()
date:   8 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 8 months ago
config: um-randconfig-r061-20260504 (https://download.01.org/0day-ci/archiv=
e/20260504/202605040746.0x2CDmMU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605040746.0x2CDmMU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwmon/lm63.c:1086:2-27: opportunity for str_low_high(( data -> c=
onfig_fan & 0x10 ))

vim +1086 drivers/hwmon/lm63.c

d5957be2f1535b drivers/hwmon/lm63.c     Jean Delvare   2008-07-16  1009 =20
662bda28328b98 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1010  /*
662bda28328b98 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1011   *=
 Ideally we shouldn't have to initialize anything, since the BIOS
662bda28328b98 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1012   *=
 should have taken care of everything
662bda28328b98 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1013   */
e19eea84078dfa drivers/hwmon/lm63.c     Guenter Roeck  2014-04-04  1014  st=
atic void lm63_init_client(struct lm63_data *data)
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1015  {
e19eea84078dfa drivers/hwmon/lm63.c     Guenter Roeck  2014-04-04  1016  	s=
truct i2c_client *client =3D data->client;
2fd638feb6b39c drivers/hwmon/lm63.c     Guenter Roeck  2014-04-04  1017  	s=
truct device *dev =3D &client->dev;
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1018  	u=
8 convrate;
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1019 =20
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1020  	d=
ata->config =3D i2c_smbus_read_byte_data(client, LM63_REG_CONFIG1);
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1021  	d=
ata->config_fan =3D i2c_smbus_read_byte_data(client,
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1022  		=
				    LM63_REG_CONFIG_FAN);
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1023 =20
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1024  	/=
* Start converting if needed */
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1025  	i=
f (data->config & 0x40) { /* standby */
2fd638feb6b39c drivers/hwmon/lm63.c     Guenter Roeck  2014-04-04  1026  		=
dev_dbg(dev, "Switching to operational mode\n");
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1027  		=
data->config &=3D 0xA7;
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1028  		=
i2c_smbus_write_byte_data(client, LM63_REG_CONFIG1,
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1029  		=
			  data->config);
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1030  	}
409c0b5bdf7d80 drivers/hwmon/lm63.c     Jean Delvare   2012-01-16  1031  	/=
* Tachometer is always enabled on LM64 */
409c0b5bdf7d80 drivers/hwmon/lm63.c     Jean Delvare   2012-01-16  1032  	i=
f (data->kind =3D=3D lm64)
409c0b5bdf7d80 drivers/hwmon/lm63.c     Jean Delvare   2012-01-16  1033  		=
data->config |=3D 0x04;
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1034 =20
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1035  	/=
* We may need pwm1_freq before ever updating the client data */
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1036  	d=
ata->pwm1_freq =3D i2c_smbus_read_byte_data(client, LM63_REG_PWM_FREQ);
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1037  	i=
f (data->pwm1_freq =3D=3D 0)
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1038  		=
data->pwm1_freq =3D 1;
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1039 =20
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1040  	s=
witch (data->kind) {
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1041  	c=
ase lm63:
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1042  	c=
ase lm64:
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1043  		=
data->max_convrate_hz =3D LM63_MAX_CONVRATE_HZ;
2fe28ab51d2001 drivers/hwmon/lm63.c     Jean Delvare   2012-01-16  1044  		=
data->lut_size =3D 8;
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1045  		=
break;
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1046  	c=
ase lm96163:
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1047  		=
data->max_convrate_hz =3D LM96163_MAX_CONVRATE_HZ;
2fe28ab51d2001 drivers/hwmon/lm63.c     Jean Delvare   2012-01-16  1048  		=
data->lut_size =3D 12;
f496b2d4f181fa drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1049  		=
data->trutherm
f496b2d4f181fa drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1050  		=
  =3D i2c_smbus_read_byte_data(client,
f496b2d4f181fa drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1051  		=
			     LM96163_REG_TRUTHERM) & 0x02;
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1052  		=
break;
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1053  	}
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1054  	c=
onvrate =3D i2c_smbus_read_byte_data(client, LM63_REG_CONVRATE);
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1055  	i=
f (unlikely(convrate > LM63_MAX_CONVRATE))
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1056  		=
convrate =3D LM63_MAX_CONVRATE;
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1057  	d=
ata->update_interval =3D UPDATE_INTERVAL(data->max_convrate_hz,
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1058  		=
				convrate);
04738b2b2f37c1 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1059 =20
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1060  	/*
e872c91e726e7f drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1061  	 =
* For LM96163, check if high resolution PWM
e872c91e726e7f drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1062  	 =
* and unsigned temperature format is enabled.
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1063  	 =
*/
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1064  	i=
f (data->kind =3D=3D lm96163) {
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1065  		=
u8 config_enhanced
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1066  		=
  =3D i2c_smbus_read_byte_data(client,
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1067  		=
			     LM96163_REG_CONFIG_ENHANCED);
d216f6809eb690 drivers/hwmon/lm63.c     Jean Delvare   2012-01-16  1068  		=
if (config_enhanced & 0x20)
d216f6809eb690 drivers/hwmon/lm63.c     Jean Delvare   2012-01-16  1069  		=
	data->lut_temp_highres =3D true;
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1070  		=
if ((config_enhanced & 0x10)
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1071  		=
    && !(data->config_fan & 0x08) && data->pwm1_freq =3D=3D 8)
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1072  		=
	data->pwm_highres =3D true;
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1073  		=
if (config_enhanced & 0x08)
e872c91e726e7f drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1074  		=
	data->remote_unsigned =3D true;
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1075  	}
210961c436d5c5 drivers/hwmon/lm63.c     Guenter Roeck  2012-01-16  1076 =20
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1077  	/=
* Show some debug info about the LM63 configuration */
409c0b5bdf7d80 drivers/hwmon/lm63.c     Jean Delvare   2012-01-16  1078  	i=
f (data->kind =3D=3D lm63)
2fd638feb6b39c drivers/hwmon/lm63.c     Guenter Roeck  2014-04-04  1079  		=
dev_dbg(dev, "Alert/tach pin configured for %s\n",
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1080  		=
	(data->config & 0x04) ? "tachometer input" :
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1081  		=
	"alert output");
2fd638feb6b39c drivers/hwmon/lm63.c     Guenter Roeck  2014-04-04  1082  	d=
ev_dbg(dev, "PWM clock %s kHz, output frequency %u Hz\n",
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1083  		=
(data->config_fan & 0x08) ? "1.4" : "360",
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1084  		=
((data->config_fan & 0x08) ? 700 : 180000) / data->pwm1_freq);
2fd638feb6b39c drivers/hwmon/lm63.c     Guenter Roeck  2014-04-04  1085  	d=
ev_dbg(dev, "PWM output active %s, %s mode\n",
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16 @1086  		=
(data->config_fan & 0x10) ? "low" : "high",
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1087  		=
(data->config_fan & 0x20) ? "manual" : "auto");
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1088  }
^1da177e4c3f41 drivers/i2c/chips/lm63.c Linus Torvalds 2005-04-16  1089 =20

:::::: The code at line 1086 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
