Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801470;
	b=kEB49+rT0f0y2k0Q3EfXNwzWdt+sskdM6onvqa/z1FcXFDT5wDkzCES2QeUoeNcxotsk
	 f0EEE1hfbbld2DangAlYXb/yzZQZe+STfjqRjJfCumdrzS1Uu0vRvD5WbbKlB+23V09OJ
	 BClQkyCjqXpFxLVvuHT/It/qjC+Fuws/EC9lWKdZ0aeHmRLvMAr8mC9DrXUbfZ3+AT3Es
	 dVEdzl/wCQmh9QpQsdC4lSb7pfB/Itcu9smFQM1D0ZnBEwt0kI0fzvTOjcBZoSK7dSed2
	 kcyVH0CTALgAbniuDCV8hY/aCgI+24V0+5i/2DAP+AFwyLsjg5oT9v3ZuVPdTPFAMJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801470;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ddjh7RPNsN+pgtu2a9UvlN1sSIdmNqyeqql3WVYY+NY=;
	b=h3AZPVly1Ahahc4dlmw+2Lqn9L1LQv8CqNdyqGSdVkfclr0AY0js52SiE8oBxWKaAcmM
	 ph3nIsFwanSNP11MMIOL3YjhH71M34hcYFHyc5wvqlMY5NEdhDkzX6m68eFTg9zi73gRR
	 hDoZa5NcDa6WjAkO6QJWHKIxUZAX5FoTci0BEIyp7MUjnNqLbjK8fzkx4cPuJLSHOXXzp
	 iadcaSX8ywIFCwYowfZqUV161t9liyf4eQdCdyaQ15Ia0tegoDJD00nvuYl/oatdfQxgE
	 f3u/0Kr5e6XaAqqInCZKthggNZ+QezcDORkrbnbvudlMO8SavqfSVSG15lLoPjovKfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=egd+DU0q;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAB4606A323
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 03:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFAB4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=egd+DU0q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794801468; x=1826337468;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gfeJ1wzntqJlWNZPI/kg8+vg4DQ9f3QTcc3Ui5kG1sA=;
  b=egd+DU0qL+1dcg2cxj1DvfT7HjLZJR3z+twB+Z/a75FJFufG22YYf+cD
   mIU9+Yz1dclfK5mZ7vValM+9isG5ADIVFeF2m//98d5MiYsSYDt7+tSdU
   aBbCIlsQ1vhxfO0WJ5nGXKWd6qh/P66EPIGtDpdCNfoMnqKsd7klB3iEG
   m2FpyBXWTHgn0hRz8UM1MFGYrEKuUm9w2mZiNYzduDn+a8vQuVgEH7DQH
   srq8pqQaIwJlUEvdvilVC+735R4nsXOPwIQDgFxKV1fyt7as4bdVtDmBC
   66rCpHGfLFpphZBlKL+SLr64sfLO4MZRGtkF2aDjeYe83SSPAMjVZ4Rnf
   A==;
X-CSE-ConnectionGUID: LYEj14J9TzmIs4pbZo2JnQ==
X-CSE-MsgGUID: y1fweIlqSOeefs5O5t5K2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3558053"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3558053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 19:57:47 -0800
X-CSE-ConnectionGUID: wYq8J9TcRMq1XgUIyf2L9Q==
X-CSE-MsgGUID: tYyW8dY1RbmZSXXzk5H0Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9512536"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Nov 2026 19:57:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSnqi-000000002ad-2We5;
	Mon, 16 Nov 2026 03:57:44 +0000
Date: Mon, 16 Nov 2026 04:57:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/clients/drm_fbdev_helper.c:1812:2-8:
 preceding lock on line 1810
Message-ID: <202611160441.p615MGGT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Javier Martinez Canillas <javierm@redhat.com>

Hi Thomas,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 6ccc5b5fc1d365a362055d4ae22547febcb80a34 drm/fbdev: Move fbdev help=
ers into client library
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: powerpc64-randconfig-r2100-20261115 (https://download.01.org/0day-c=
i/archive/20261116/202611160441.p615MGGT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c06=
93becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 6ccc5b5fc1d3 ("drm/fbdev: Move fbdev helpers into client library")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611160441.p615MGGT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/clients/drm_fbdev_helper.c:1812:2-8: preceding lock on l=
ine 1810

vim +1812 drivers/gpu/drm/clients/drm_fbdev_helper.c

386516744ba45d drivers/gpu/drm/drm_fb_helper.c Dave Airlie        2010-03-3=
0  1783 =20
7394371d85699a drivers/gpu/drm/drm_fb_helper.c Chris Wilson       2011-04-2=
2  1784  /**
7394371d85699a drivers/gpu/drm/drm_fb_helper.c Chris Wilson       2011-04-2=
2  1785   * drm_fb_helper_hotplug_event - respond to a hotplug notification=
 by
d0ddc0338af826 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2012-11-0=
1  1786   *                               probing all the outputs attached =
to the fb
c777990fb45b57 drivers/gpu/drm/drm_fb_helper.c Noralf Tr=C3=B8nnes     2017=
-10-30  1787   * @fb_helper: driver-allocated fbdev helper, can be NULL
7394371d85699a drivers/gpu/drm/drm_fb_helper.c Chris Wilson       2011-04-2=
2  1788   *
7394371d85699a drivers/gpu/drm/drm_fb_helper.c Chris Wilson       2011-04-2=
2  1789   * Scan the connectors attached to the fb_helper and try to put to=
gether a
62cacc79398383 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2016-08-1=
2  1790   * setup after notification of a change in output configuration.
7394371d85699a drivers/gpu/drm/drm_fb_helper.c Chris Wilson       2011-04-2=
2  1791   *
207fd32970b1de drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2013-01-2=
0  1792   * Called at runtime, takes the mode config locks to be able to ch=
eck/change the
207fd32970b1de drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2013-01-2=
0  1793   * modeset configuration. Must be run from process context (which =
usually means
207fd32970b1de drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2013-01-2=
0  1794   * either the output polling work or a work item launched from the=
 driver's
207fd32970b1de drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2013-01-2=
0  1795   * hotplug interrupt).
207fd32970b1de drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2013-01-2=
0  1796   *
50c3dc970a09b3 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2014-06-2=
7  1797   * Note that drivers may call this even before calling
af509d38bbbcf1 drivers/gpu/drm/drm_fb_helper.c Lyude              2016-05-0=
4  1798   * drm_fb_helper_initial_config but only after drm_fb_helper_init.=
 This allows
50c3dc970a09b3 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2014-06-2=
7  1799   * for a race-free fbcon setup and will make sure that the fbdev e=
mulation will
50c3dc970a09b3 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2014-06-2=
7  1800   * not miss any hotplug events.
207fd32970b1de drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2013-01-2=
0  1801   *
7394371d85699a drivers/gpu/drm/drm_fb_helper.c Chris Wilson       2011-04-2=
2  1802   * RETURNS:
7394371d85699a drivers/gpu/drm/drm_fb_helper.c Chris Wilson       2011-04-2=
2  1803   * 0 on success and a non-zero error code otherwise.
7394371d85699a drivers/gpu/drm/drm_fb_helper.c Chris Wilson       2011-04-2=
2  1804   */
7394371d85699a drivers/gpu/drm/drm_fb_helper.c Chris Wilson       2011-04-2=
2  1805  int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
386516744ba45d drivers/gpu/drm/drm_fb_helper.c Dave Airlie        2010-03-3=
0  1806  {
c777990fb45b57 drivers/gpu/drm/drm_fb_helper.c Noralf Tr=C3=B8nnes     2017=
-10-30  1807  	if (!drm_fbdev_emulation || !fb_helper)
f64c5573d253ab drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2015-08-2=
5  1808  		return 0;
f64c5573d253ab drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2015-08-2=
5  1809 =20
e9827d8ea2142d drivers/gpu/drm/drm_fb_helper.c Thierry Reding     2017-07-0=
4 @1810  	mutex_lock(&fb_helper->lock);
cdeb2ccd993ed8 drivers/gpu/drm/drm_fb_helper.c Cristian Ciocaltea 2026-06-0=
2  1811  	if (fb_helper->deferred_setup)
cdeb2ccd993ed8 drivers/gpu/drm/drm_fb_helper.c Cristian Ciocaltea 2026-06-0=
2 @1812  		return __drm_fb_helper_initial_config_and_unlock(fb_helper);
ca91a2758fcef6 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2017-07-0=
6  1813 =20
0586576950d5dd drivers/gpu/drm/drm_fb_helper.c Noralf Tr=C3=B8nnes     2019=
-05-15  1814  	if (!fb_helper->fb || !drm_master_internal_acquire(fb_helper=
->dev)) {
4abe35204af82a drivers/gpu/drm/drm_fb_helper.c Dave Airlie        2010-03-3=
0  1815  		fb_helper->delayed_hotplug =3D true;
bdac4a052a4792 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2017-07-0=
4  1816  		mutex_unlock(&fb_helper->lock);
cdeb2ccd993ed8 drivers/gpu/drm/drm_fb_helper.c Cristian Ciocaltea 2026-06-0=
2  1817  		return 0;
4abe35204af82a drivers/gpu/drm/drm_fb_helper.c Dave Airlie        2010-03-3=
0  1818  	}
e9827d8ea2142d drivers/gpu/drm/drm_fb_helper.c Thierry Reding     2017-07-0=
4  1819 =20
0586576950d5dd drivers/gpu/drm/drm_fb_helper.c Noralf Tr=C3=B8nnes     2019=
-05-15  1820  	drm_master_internal_release(fb_helper->dev);
03a9606e7feef9 drivers/gpu/drm/drm_fb_helper.c Noralf Tr=C3=B8nnes     2019=
-05-06  1821 =20
f33b9730cc5a33 drivers/gpu/drm/drm_fb_helper.c Jani Nikula        2019-12-1=
0  1822  	drm_dbg_kms(fb_helper->dev, "\n");
4abe35204af82a drivers/gpu/drm/drm_fb_helper.c Dave Airlie        2010-03-3=
0  1823 =20
aafa9e0668720a drivers/gpu/drm/drm_fb_helper.c Noralf Tr=C3=B8nnes     2019=
-06-08  1824  	drm_client_modeset_probe(&fb_helper->client, fb_helper->fb->=
width, fb_helper->fb->height);
f461bd2b494bdf drivers/gpu/drm/drm_fb_helper.c David Lechner      2017-08-0=
3  1825  	drm_setup_crtcs_fb(fb_helper);
e9827d8ea2142d drivers/gpu/drm/drm_fb_helper.c Thierry Reding     2017-07-0=
4  1826  	mutex_unlock(&fb_helper->lock);
89ced125472b85 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2013-04-1=
1  1827 =20
9877d8f6bc3749 drivers/gpu/drm/drm_fb_helper.c Thomas Zimmermann  2022-11-0=
3  1828  	drm_fb_helper_set_par(fb_helper->info);
2180c3c7e76536 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2013-01-2=
1  1829 =20
2180c3c7e76536 drivers/gpu/drm/drm_fb_helper.c Simona Vetter      2013-01-2=
1  1830  	return 0;
5c4426a782bc95 drivers/gpu/drm/drm_fb_helper.c Dave Airlie        2010-03-3=
0  1831  }
eb1f8e4f3be898 drivers/gpu/drm/drm_fb_helper.c Dave Airlie        2010-05-0=
7  1832  EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
1837c76b780a42 drivers/gpu/drm/drm_fb_helper.c Thomas Zimmermann  2026-03-0=
4  1833 =20

:::::: The code at line 1812 was first introduced by commit
:::::: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7 drm/fb-helper: Remove unuse=
d local variable in hotplug_event()

:::::: TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
:::::: CC: Luca Ceresoli <luca.ceresoli@bootlin.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
