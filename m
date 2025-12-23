Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F89283FDF
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 20:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520859; cv=none; b=kcDgTkAqlgl2gDspfxGY1vWIHJBic/1DsGUsdrlerobrs1edHzfDPuCX7ef9mxqW9IwKKTr6SPBwlwkxT6h5cyUdqXa2uKj8vgOzb7AApxiuUYGvg6lTdyqUlax0Kih72M9X1wBe13wuDE901g+PeBqs0BD3x/giFPNi5Xnct04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520859; c=relaxed/simple;
	bh=itnGUJ4UEDGE/EQVEZIx/vUY9PmilQs2dqQbc6BTJcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mj0KWioosB9njtoFV5LzJxcyjhZSqPG5pZ710Kan150fsgXeGvrt+8dF5T70GvJxJ3wJqCZ5lAQrUxH15G1G0/JlDPIusgaUP5J/wntqCQoPqKL/BdOpWb8nU0HN/jjKduxPUESztoLtfoMqN6/dvMNjBCBDa5u0h6ahSUIylOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJDgM3XC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJDgM3XC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766520858; x=1798056858;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=itnGUJ4UEDGE/EQVEZIx/vUY9PmilQs2dqQbc6BTJcU=;
  b=EJDgM3XCmoUpuw4uVH8+r245uAaDylLh/PqtcgnLz+u0um6w9PzDEQ9P
   whhBdvG5s/uE8QsDHfmrZDeVedoR7eB3qDtGOKHtgLXWGz03jkl4l+eRv
   Rs5zH+VIdWUhH4aZ+xmk8CK84REWwLkkM1AplorJ3r5xyC7b3bdVTWyQl
   ghnsi23w2+ysyJw8eaP+qJzxauwKuXg7lgwrJCVQcxS299gzfC4cCmi3h
   8atfTVwj4JOjC9wD62X38HI+DtDi176wcY/CmdLA4yEUCj0McTXCC34AS
   J5xeX7HXUq8SUHjlp+HxXhdzqvvSFzcgcMsBxKOWRW6g7Xh6UAxI/tdfF
   Q==;
X-CSE-ConnectionGUID: WyqI1cJvRrK0qnJ13YaOJw==
X-CSE-MsgGUID: A6oS5YjiQRGW4dCzyE1iGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68413707"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="68413707"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 12:14:17 -0800
X-CSE-ConnectionGUID: fE3Wz7g2SSiOdbJtMQdY3w==
X-CSE-MsgGUID: ljwJqZMLTCmT1HPey2Wzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="204361886"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Dec 2025 12:14:16 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY8lp-000000002Kp-3hJB;
	Tue, 23 Dec 2025 20:14:13 +0000
Date: Wed, 24 Dec 2025 04:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vkoul-soundwire:next 5/7] drivers/soundwire/bus_type.c:102
 sdw_bus_probe() error: Calling ida_alloc_max() with a 'max' argument which is
 a power of 2. -1 missing?
Message-ID: <202512240450.hlDH3nCs-lkp@intel.com>
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
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@baylibre.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git=
 next
head:   c6f1e99ab03c5a94ed6389f5930e91f274b3ba67
commit: 866160a51f5586d53e17ceab36029c8805ffea28 [5/7] soundwire: Use bus m=
ethods for .probe(), .remove() and .shutdown()
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20251224 (https://download.01.org/0day-ci/archi=
ve/20251224/202512240450.hlDH3nCs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512240450.hlDH3nCs-lkp@intel.com/

smatch warnings:
drivers/soundwire/bus_type.c:102 sdw_bus_probe() error: Calling ida_alloc_m=
ax() with a 'max' argument which is a power of 2. -1 missing?

vim +/max +102 drivers/soundwire/bus_type.c

9251345dca24b6 Vinod Koul           2017-12-14   74 =20
866160a51f5586 Uwe Kleine-K=C3=B6nig     2025-12-15   75  static int sdw_bu=
s_probe(struct device *dev)
9251345dca24b6 Vinod Koul           2017-12-14   76  {
9251345dca24b6 Vinod Koul           2017-12-14   77  	struct sdw_slave *sla=
ve =3D dev_to_sdw_dev(dev);
9251345dca24b6 Vinod Koul           2017-12-14   78  	struct sdw_driver *dr=
v =3D drv_to_sdw_driver(dev->driver);
9251345dca24b6 Vinod Koul           2017-12-14   79  	const struct sdw_devi=
ce_id *id;
9251345dca24b6 Vinod Koul           2017-12-14   80  	int ret;
9251345dca24b6 Vinod Koul           2017-12-14   81 =20
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   82  	/*
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   83  	 * fw description is =
mandatory to bind
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   84  	 */
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   85  	if (!dev->fwnode)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   86  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   87 =20
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   88  	if (!IS_ENABLED(CONFI=
G_ACPI) && !dev->of_node)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   89  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   90 =20
9251345dca24b6 Vinod Koul           2017-12-14   91  	id =3D sdw_get_device=
_id(slave, drv);
9251345dca24b6 Vinod Koul           2017-12-14   92  	if (!id)
9251345dca24b6 Vinod Koul           2017-12-14   93  		return -ENODEV;
9251345dca24b6 Vinod Koul           2017-12-14   94 =20
9251345dca24b6 Vinod Koul           2017-12-14   95  	/*
9251345dca24b6 Vinod Koul           2017-12-14   96  	 * attach to power do=
main but don't turn on (last arg)
9251345dca24b6 Vinod Koul           2017-12-14   97  	 */
d42c7c6fd66a6e Claudiu Beznea       2025-07-03   98  	ret =3D dev_pm_domain=
_attach(dev, 0);
29ffcc88f2065f Ulf Hansson          2018-04-26   99  	if (ret)
29ffcc88f2065f Ulf Hansson          2018-04-26  100  		return ret;
29ffcc88f2065f Ulf Hansson          2018-04-26  101 =20
aab12022b076f0 Charles Keepax       2025-04-29 @102  	ret =3D ida_alloc_max=
(&slave->bus->slave_ida, SDW_FW_MAX_DEVICES, GFP_KERNEL);
aab12022b076f0 Charles Keepax       2025-04-29  103  	if (ret < 0) {
aab12022b076f0 Charles Keepax       2025-04-29  104  		dev_err(dev, "Failed=
 to allocated ID: %d\n", ret);
aab12022b076f0 Charles Keepax       2025-04-29  105  		return ret;
aab12022b076f0 Charles Keepax       2025-04-29  106  	}
aab12022b076f0 Charles Keepax       2025-04-29  107  	slave->index =3D ret;
aab12022b076f0 Charles Keepax       2025-04-29  108 =20
9251345dca24b6 Vinod Koul           2017-12-14  109  	ret =3D drv->probe(sl=
ave, id);
9251345dca24b6 Vinod Koul           2017-12-14  110  	if (ret) {
aab12022b076f0 Charles Keepax       2025-04-29  111  		ida_free(&slave->bus=
->slave_ida, slave->index);
9251345dca24b6 Vinod Koul           2017-12-14  112  		return ret;
29ffcc88f2065f Ulf Hansson          2018-04-26  113  	}
56d4fe31af77f6 Vinod Koul           2017-12-14  114 =20
3dca1f89ae3455 Richard Fitzgerald   2023-01-23  115  	mutex_lock(&slave->sd=
w_dev_lock);
3dca1f89ae3455 Richard Fitzgerald   2023-01-23  116 =20
56d4fe31af77f6 Vinod Koul           2017-12-14  117  	/* device is probed s=
o let's read the properties now */
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  118  	if (drv->ops && drv->=
ops->read_prop)
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  119  		drv->ops->read_prop(=
slave);
56d4fe31af77f6 Vinod Koul           2017-12-14  120 =20
3b6c4a11bf2b81 Charles Keepax       2023-09-20  121  	if (slave->prop.use_d=
omain_irq)
3b6c4a11bf2b81 Charles Keepax       2023-09-20  122  		sdw_irq_create_mappi=
ng(slave);
12a95123bfe1dd Lucas Tanure         2023-08-04  123 =20
f88c1afe338edb Greg Kroah-Hartman   2024-01-30  124  	/* init the dynamic s=
ysfs attributes we need */
f88c1afe338edb Greg Kroah-Hartman   2024-01-30  125  	ret =3D sdw_slave_sys=
fs_dpn_init(slave);
bcac59029955ae Pierre-Louis Bossart 2020-05-19  126  	if (ret < 0)
663229e2425588 Johan Hovold         2024-07-12  127  		dev_warn(dev, "faile=
d to initialise sysfs: %d\n", ret);
bcac59029955ae Pierre-Louis Bossart 2020-05-19  128 =20
56d4fe31af77f6 Vinod Koul           2017-12-14  129  	/*
56d4fe31af77f6 Vinod Koul           2017-12-14  130  	 * Check for valid cl=
k_stop_timeout, use DisCo worst case value of
56d4fe31af77f6 Vinod Koul           2017-12-14  131  	 * 300ms
56d4fe31af77f6 Vinod Koul           2017-12-14  132  	 *
56d4fe31af77f6 Vinod Koul           2017-12-14  133  	 * TODO: check the ti=
meouts and driver removal case
56d4fe31af77f6 Vinod Koul           2017-12-14  134  	 */
56d4fe31af77f6 Vinod Koul           2017-12-14  135  	if (slave->prop.clk_s=
top_timeout =3D=3D 0)
56d4fe31af77f6 Vinod Koul           2017-12-14  136  		slave->prop.clk_stop=
_timeout =3D 300;
56d4fe31af77f6 Vinod Koul           2017-12-14  137 =20
56d4fe31af77f6 Vinod Koul           2017-12-14  138  	slave->bus->clk_stop_=
timeout =3D max_t(u32, slave->bus->clk_stop_timeout,
56d4fe31af77f6 Vinod Koul           2017-12-14  139  					     slave->prop.=
clk_stop_timeout);
56d4fe31af77f6 Vinod Koul           2017-12-14  140 =20
2140b66b5d3ecf Pierre-Louis Bossart 2020-01-14  141  	slave->probed =3D tru=
e;
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  142 =20
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  143  	/*
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  144  	 * if the probe happe=
ned after the bus was started, notify the codec driver
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  145  	 * of the current har=
dware status to e.g. start the initialization.
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  146  	 * Errors are only lo=
gged as warnings to avoid failing the probe.
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  147  	 */
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  148  	if (drv->ops && drv->=
ops->update_status) {
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  149  		ret =3D drv->ops->up=
date_status(slave, slave->status);
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  150  		if (ret < 0)
663229e2425588 Johan Hovold         2024-07-12  151  			dev_warn(dev, "fail=
ed to update status at probe: %d\n", ret);
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  152  	}
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  153 =20
bd29c00edd0a5d Pierre-Louis Bossart 2022-06-21  154  	mutex_unlock(&slave->=
sdw_dev_lock);
2140b66b5d3ecf Pierre-Louis Bossart 2020-01-14  155 =20
2140b66b5d3ecf Pierre-Louis Bossart 2020-01-14  156  	dev_dbg(dev, "probe c=
omplete\n");
2140b66b5d3ecf Pierre-Louis Bossart 2020-01-14  157 =20
56d4fe31af77f6 Vinod Koul           2017-12-14  158  	return 0;
9251345dca24b6 Vinod Koul           2017-12-14  159  }
9251345dca24b6 Vinod Koul           2017-12-14  160 =20

:::::: The code at line 102 was first introduced by commit
:::::: aab12022b076f0b385b7a9a78e1161bd2df5d1e3 soundwire: bus: Add interna=
l slave ID and use for IRQs

:::::: TO: Charles Keepax <ckeepax@opensource.cirrus.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
