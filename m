Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3500B2E40B
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 06:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580081; cv=none; b=JtXzJF6IRr0plv9O6GpT+FhYQzxtqkb2JtOOhyA4HkwcY4IJlXIzTBz5z9Ks/kfgfFi15+I6my1jvQEPMFTADiWEMoNn+uf2h2INuiE+jlawIDKyITrVg33xQmQ2oGRv9U/Cyq06KPXzuctUmkOMliQR6fzC3MGd5wSIIW8SG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580081; c=relaxed/simple;
	bh=RCt4IiG2h4bPp23n3ArOt9gjQ0zMEfIBGodXk6b+/VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fF2zBNmcDdhamcM/jtk7nfgnr93BwKnlMOek9hxuvD7HkyT2xfmpoYcFnAmomXdAiRCsZH1Ym/uUD9FFVb0RsCCb9CjZwgsU8PClcSf8jdAriGfnJ5pAdPZzzT1z0ytChxLA7XQaujJO2UnRYNuJyFbGQnRycaftPoItJ9BkiJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzD4eau4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzD4eau4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769580081; x=1801116081;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RCt4IiG2h4bPp23n3ArOt9gjQ0zMEfIBGodXk6b+/VU=;
  b=TzD4eau43swXNRp3RbSlLe77RoOVJp80Cc5V7F7bu13hd6JF2dlxewVu
   zc5i6buTc5OpQxpm2XzpgOah7Goof4m96xhQE3P6mPcgd/3Ab5EjJdXBw
   mLVPLXezH8YOAZQfAHZhEHrxTKXcWcF76MA+kkUrQmBBoN8omUZlktl/P
   imrcYYeLtHSKeDBt6Uyci/81VEFyIRMaFxyNBNIM98VP8Wn1mGJxQBVQp
   tbCHuFDwT9wlC5eUi90bLzWTpMIgyl3ys+88TM0jOX8bWhKwoGOu0X3ib
   He8XEEfNJSGXWWkm+MP1Mn7hPi1ggvlBtoUy5b458I276S3QY9K6eZZaO
   g==;
X-CSE-ConnectionGUID: b+7GULxXS0C0LmG574GSsA==
X-CSE-MsgGUID: 3lR/QjFKQH+75CzZ3hOsfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70688470"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70688470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 22:01:20 -0800
X-CSE-ConnectionGUID: GlF4Va+mTzOyR4iUeJC+vw==
X-CSE-MsgGUID: Pu5i0Ie9R96T29PwZ1FgHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="213039277"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 22:01:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkyc7-00000000ZM8-3oBS;
	Wed, 28 Jan 2026 06:01:15 +0000
Date: Wed, 28 Jan 2026 14:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6978/9906]
 drivers/platform/wmi/tests/marshalling_kunit.c:449:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601281347.J8rVE0kj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check warning: drivers/p=
latform/wmi/tests/marshalling_kunit.c:449:1: sparse: sparse: bad integer co=
nstant expression"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Armin Wolf <W_Armin@gmx.de>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4f938c7d3b25d87b356af4106c2682caf8c835a2
commit: 29dfba69c3ddb7945cd772042c6a9ce770c1ba22 [6978/9906] platform/wmi: =
Add kunit test for the marshalling code
:::::: branch date: 13 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-062-20260128 (https://download.01.org/0day-ci/archi=
ve/20260128/202601281347.J8rVE0kj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260128/202601281347.J8rVE0kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601281347.J8rVE0kj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/wmi/tests/marshalling_kunit.c:449:1: sparse: sparse: ba=
d integer constant expression
   drivers/platform/wmi/tests/marshalling_kunit.c:449:1: sparse: sparse: st=
atic assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/wmi/tests/marshalling_kunit.c:450:1: sparse: sparse: ba=
d integer constant expression
   drivers/platform/wmi/tests/marshalling_kunit.c:450:1: sparse: sparse: st=
atic assertion failed: "MODULE_INFO(description, ...) contains embedded NUL=
 byte"
   drivers/platform/wmi/tests/marshalling_kunit.c:451:1: sparse: sparse: ba=
d integer constant expression
   drivers/platform/wmi/tests/marshalling_kunit.c:451:1: sparse: sparse: st=
atic assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL b=
yte"
   drivers/platform/wmi/tests/marshalling_kunit.c:452:1: sparse: sparse: ba=
d integer constant expression
   drivers/platform/wmi/tests/marshalling_kunit.c:452:1: sparse: sparse: st=
atic assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byt=
e"

vim +449 drivers/platform/wmi/tests/marshalling_kunit.c

29dfba69c3ddb7 Armin Wolf 2026-01-16  448 =20
29dfba69c3ddb7 Armin Wolf 2026-01-16 @449  MODULE_AUTHOR("Armin Wolf <W_Arm=
in@gmx.de>");

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
