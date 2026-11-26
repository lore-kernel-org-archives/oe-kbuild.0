Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691225;
	b=cFOM1/opb/hx66gVaHp6Wg+kJAnjXQ9d5jTTNkumLFNFIyHbIr3t0xATaeN6d4w0XUSw
	 YrFoirGpsN7R044lwT+Wsna7jBFWTMVFgVo+lclQV8Dxi+Rn1ib+FDjZIRfwzp+q4QX6x
	 dxvYpw3tFIG0Yku5AFdQmG9GZAuOYGZ5Nd1lmckQMpgH5Aj5kn4HRzWlYEG6LacdAmO3w
	 U7dr1VX91chrUGEaWDind7bDb69FkRrg2sBxCV07tZiTUx3DvB7lM8t+utI9QPPZS2JXN
	 ybxOlpHIqXHDgCBgin9dAI7n/rAaaujpoxL/FiDeZYhA9W8a3ItIjie1OBu3cP9HDkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691225;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DgN4rzbhVzw10YrcBz6JO2lCTUWOnSUOmZYoFFZNYAo=;
	b=P3/o4CmDjMY/NkV2pEGDyeoLQeRQiwdzRTQU1zZtFFNB9UkfnNSkkpERFl+onAajXA8A
	 KM0ATCAM8xi3LJgowyq4l5R76DyvzaJtUI0LSUD6pCKxrbVbsOF2LtAFk4FX/wBtY2oxf
	 sMQX2WNnbDlw6ntQamTvXCRxq6wcaundPxQWe5d2E00b98hkWTuPyH5EqDJ2c6niN0hVp
	 qW3aZVOiBBVkcER49zdRs32JHOxQ9D1yKFUf7pSV3rsDX3z8fxJc75TGKv3FcvhhVj0fx
	 AitUiLjjdr6Q5dGJoyZCko/FR4yO5RtBfZxrRzHYFTQM4yeacZFZe2rzIxq6/PGOzTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="fnsw8X//";
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6279606A321
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 11:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6279606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fnsw8X//
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795691225; x=1827227225;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W6UioLi6eQfP3LxS4glBazgk6Msw6DyyIpZEjnSL0H8=;
  b=fnsw8X//gLuwSFKyyBszTa5aKQKOPm2UWTvbdbcfCiA1quBAeH0bH14z
   +fLbvnk6yoqH2j+8G8R3wvp/arLyme9NnsPMYblcVzW8bQljCxccBfyWF
   dwSps/YDIA7wh1Wm+tNzSgicz3Fg1yEwXkhueWeen3+jH7zQPwIwNv5WF
   PuHJ/SMAHphCWLM044FsNRBk5+iWv6l18PKhzU6vmfEa1wxr/LiCGr+DF
   eBQVFJiN6s0anK02DeqzQZfpSumm+1mmxjv/L2VlluceytGm4t/pMRnel
   VJGpej4pYxAG75RB99revgmoL9CZPoyRRnXAz8KCEw8fq6NGj5V7MreZw
   g==;
X-CSE-ConnectionGUID: uGRNzzCCQBOPyqMlujN3fA==
X-CSE-MsgGUID: fYAfUb+aQGGUNzxKb2abCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4646238"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4646238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 03:07:04 -0800
X-CSE-ConnectionGUID: h+JqI3ZST7q0iIFmtTBAZQ==
X-CSE-MsgGUID: 7zRBbDExQk2l/QvMGX6DYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12147343"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2026 03:07:02 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWXJa-0000000001a-3Sc9;
	Thu, 26 Nov 2026 11:06:58 +0000
Date: Thu, 26 Nov 2026 12:06:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 7/65]
 drivers/platform/asus/eeepc-laptop.c:778 eeepc_new_rfkill() warn: '*rfkill'
 is an error pointer or valid
Message-ID: <20261126112615.8RAV8Qf0-lkp@intel.com>
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
head:   6fc627bda235ac5b6f43b5f784b81d6c2450ae5a
commit: ef696e89f836c31825b754abe181b490b82fbee7 [7/65] platform/asus: Move=
 ASUS platform drivers out of drivers/platform/x86
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-2200-20261125 (https://download.01.org/0day-ci/ar=
chive/20261126/20261126112615.8RAV8Qf0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261126112615.8RAV8Qf0-lkp@intel.com/

smatch warnings:
drivers/platform/asus/eeepc-laptop.c:778 eeepc_new_rfkill() warn: '*rfkill'=
 is an error pointer or valid

vim +778 drivers/platform/asus/eeepc-laptop.c

52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 762 =20
854c78363f37f0 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 763  static int eeepc_new_rfkill(struct eeepc_laptop *eeepc,
854c78363f37f0 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 764  			    struct rfkill **rfkill,
854c78363f37f0 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 765  			    const char *name,
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 766  			    enum rfkill_type type, int cm)
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 767  {
854c78363f37f0 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 768  	acpi_handle handle;
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 769  	int result;
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 770 =20
854c78363f37f0 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 771  	result =3D acpi_setter_handle(eeepc, cm, &handle);
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 772  	if (result < 0)
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 773  		return result;
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 774 =20
854c78363f37f0 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 775  	*rfkill =3D rfkill_alloc(name, &eeepc->platform_device->dev, type,
854c78363f37f0 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 776  			       &eeepc_rfkill_ops, handle);
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 777 =20
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
@778  	if (!*rfkill)
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 779  		return -EINVAL;
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 780 =20
854c78363f37f0 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 781  	rfkill_init_sw_state(*rfkill, get_acpi(eeepc, cm) !=3D 1);
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 782  	result =3D rfkill_register(*rfkill);
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 783  	if (result) {
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 784  		rfkill_destroy(*rfkill);
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 785  		*rfkill =3D NULL;
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 786  		return result;
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 787  	}
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 788  	return 0;
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 789  }
52bbe3c7b413d6 drivers/platform/x86/eeepc-laptop.c Alan Jenkins 2009-12-03 =
 790 =20

:::::: The code at line 778 was first introduced by commit
:::::: 52bbe3c7b413d656833686f9f08e5dcab3786eeb eeepc-laptop: code movement

:::::: TO: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
:::::: CC: Len Brown <len.brown@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
