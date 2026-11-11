Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364079;
	b=P6AzmDCDEjIrF2PESEP15XypovCyc8TWpRAyUh9MR2oVwSyrMnH1N3MJsqFkHhegiTb1
	 L5BalN3Ld2jZ192h87Rx2IVdcYcss+pqLzpCXBZVkR4Y62IL7ERwYtG8CK16/NzdHkVZh
	 sZDvETUdCABK0rJUjz9Go6AsnjhhthjRQbIpMfdUnUQqKgnYu8so4q+qK/dSM1ZLOgqoL
	 B8vDO/qhLrzKUEmgCY5Y5dHL1iBjAklVZZS4ns4zWVWwJzkfo7cCrqXrM5E8mJqNJnUXX
	 lj5MRie/NTZ6On9Ldh4devklr6xKdIXTG/SYZFxt/LN2M9s2g2seP2QR0f/Nb6pyiWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364079;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gJ60WBYIRWdu4hrg2yV05UloJJ3XF//X8zT4ZSxkJ80=;
	b=2adNfENU8jRthTCQ+Jn2WqVB1TLtiP8v5p1nNyZYsH5UYvPzlgmWyl+w4vv3dUdIcJhk
	 utP1D5TpmuF7aF156TwFryC6tw71sDHv3chPPizxuS26fbwfU3FMUiz6IWen787puBmXq
	 QVUSWfd5HBh3c1yoEpTwKKuX99ZyrdSqcfMbHty/iLIH3JcGxcy83nqZdsIzy6Gnoip2r
	 KqIdSHlyJLYpCHGzYklUl97BkIibJySybj9ulWqRBDJCgo/0vWRRRN9yzELh7sr4PbLA0
	 gfpsDIZZ/p1kBs6N861kD0pVueZHNWf7oQgoOzYrK3L1/4WTBND5o84tb98kR8zvuWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iWfYQu+C;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D87A606A320
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 02:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D87A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iWfYQu+C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794364078; x=1825900078;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I4ewNWIMfy4oIL4XoBH3ayN/9sGHUP4z4GHg5jfjnsI=;
  b=iWfYQu+ClG3HCUYzCI/5//QQwxJB4XAcqGJQvudmUWdkUhRp75XEOyKl
   2OjoCR22bO+Bg+BzRBQJJL/lXR6o+UUe9XjKX/DuVyAAdLf+gdMfBxHUM
   2SPC6tptxSlPWgmlGQw0xYFhew7ErQaETw8ThnpfAHmh9HwUUvElSfMZK
   xDY7kK8GG1SUhw0FoqWIoKdUNWSoB8Vnc+KOXLqagCnKdtAw2tDuxmkZU
   sYhhS6nb8v6c80FQzmAb4hzxmiLMW+2AG6NqbsGHupK/jOzi1EOPsdJEp
   l9YUxo11JnqJrDOsjWIuKgnq/K2F5Nvp3HPJCRl/V83sOfmH8LNKiaV+A
   w==;
X-CSE-ConnectionGUID: 39/MZAEMSIGwVodaDA6BHA==
X-CSE-MsgGUID: lO1fwNHsQlK4yZ0/Pkp8eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3034395"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3034395"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 18:27:57 -0800
X-CSE-ConnectionGUID: fxf2se5NReyttvxRbRFINA==
X-CSE-MsgGUID: iU5nq4spTfORqMRvsRU5ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8341734"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 10 Nov 2026 18:27:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQy41-000000000Ui-2nd0;
	Wed, 11 Nov 2026 02:27:53 +0000
Date: Wed, 11 Nov 2026 03:27:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 7/10]
 drivers/platform/asus/asus-laptop.c:1351 asus_rfkill_setup() warn:
 'rfk->rfkill' is an error pointer or valid
Message-ID: <202611110347.Meo5msSy-lkp@intel.com>
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

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
TO: Chipang Kao <chipang_kao@asus.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Denis Benato <denis.benato@linux.dev>

Hi Chipang,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driv=
ers-x86.git review-ilpo-next
head:   5680519168f65666d2c03cc6ed8fe2b7052aee12
commit: ef696e89f836c31825b754abe181b490b82fbee7 [7/10] platform/asus: Move=
 ASUS platform drivers out of drivers/platform/x86
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-2200-20261111 (https://download.01.org/0day-ci/arch=
ive/20261111/202611110347.Meo5msSy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611110347.Meo5msSy-lkp@intel.com/

smatch warnings:
drivers/platform/asus/asus-laptop.c:1351 asus_rfkill_setup() warn: 'rfk->rf=
kill' is an error pointer or valid

vim +1351 drivers/platform/asus/asus-laptop.c

18e1311ee71a67 drivers/platform/x86/asus-laptop.c Corentin Chary 2010-01-25=
  1340 =20
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1341  static int asus_rfkill_setup(struct asus_laptop *asus, struct asus_=
rfkill *rfk,
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1342  			     const char *name, int control_id, int type,
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1343  			     const struct rfkill_ops *ops)
18e1311ee71a67 drivers/platform/x86/asus-laptop.c Corentin Chary 2010-01-25=
  1344  {
18e1311ee71a67 drivers/platform/x86/asus-laptop.c Corentin Chary 2010-01-25=
  1345  	int result;
18e1311ee71a67 drivers/platform/x86/asus-laptop.c Corentin Chary 2010-01-25=
  1346 =20
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1347  	rfk->control_id =3D control_id;
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1348  	rfk->asus =3D asus;
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1349  	rfk->rfkill =3D rfkill_alloc(name, &asus->platform_device->dev,
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1350  				   type, ops, rfk);
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
 @1351  	if (!rfk->rfkill)
18e1311ee71a67 drivers/platform/x86/asus-laptop.c Corentin Chary 2010-01-25=
  1352  		return -EINVAL;
18e1311ee71a67 drivers/platform/x86/asus-laptop.c Corentin Chary 2010-01-25=
  1353 =20
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1354  	result =3D rfkill_register(rfk->rfkill);
18e1311ee71a67 drivers/platform/x86/asus-laptop.c Corentin Chary 2010-01-25=
  1355  	if (result) {
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1356  		rfkill_destroy(rfk->rfkill);
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1357  		rfk->rfkill =3D NULL;
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1358  	}
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1359 =20
774b06780be20d drivers/platform/x86/asus-laptop.c Corentin Chary 2011-12-15=
  1360  	return result;
18e1311ee71a67 drivers/platform/x86/asus-laptop.c Corentin Chary 2010-01-25=
  1361  }
18e1311ee71a67 drivers/platform/x86/asus-laptop.c Corentin Chary 2010-01-25=
  1362 =20

:::::: The code at line 1351 was first introduced by commit
:::::: 774b06780be20d07c5459becd6495c04523a93a2 asus-laptop: control how BL=
ED and WLED should be exposed

:::::: TO: Corentin Chary <corentin.chary@gmail.com>
:::::: CC: Matthew Garrett <mjg@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
