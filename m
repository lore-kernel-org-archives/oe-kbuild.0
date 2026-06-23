Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784F4397E8E
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247867; cv=none; b=YoTsb+vWnSj8HVbqTO37TplrroptOcDuAhuxW6VMrfu8ss/E2XgimSk0NDB2EobTvRVEUUZS43hPj6mutyqSmaQMhaswyYebLv/XhUZsP990ynCShrf4h+YvhRCEoMq5xPnKr769X5FXpOb6g7eEotFwWcmEA3Ys26BOLT4Pi8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247867; c=relaxed/simple;
	bh=W2MKJcUJHHF4eTZI7EFVm3awyZ1ddq5SWx0sTg2nP9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GxqXANbaDEcstoFYt7OyrdqOhWW4kJAQON2JLeWtsbiWS9rcGfPuTgeJXlCu9o8ck0Huh/PhfltyRJhNA0OPD27lJBd+Z0YgLS/uDhJ2ShpTf+iuTweA+SLV2qsVhByOlhvHjnbEBVeAHwH8cC+2+BegZdJX9UpaYSmEc6quOHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPjKGxsH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPjKGxsH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782247866; x=1813783866;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W2MKJcUJHHF4eTZI7EFVm3awyZ1ddq5SWx0sTg2nP9s=;
  b=hPjKGxsHrxmQMR0p4sBQsG2gzEQfneVrg24w2fw60f58P1lqyZZWrCgA
   2OgvAsuT8EA3dt+EPc2jMLytEkyUNQIjsqsgW1nQ4morAbhXz7GUdQTtW
   dnzpCLwq24gWJAyYFc6kZr7HD5Ee5+mGuhIc6BKrscotRAvCwB4gUXXgC
   MyfIjSCDaQ1nyXLcQDkP8M1yuU/mE6Y7aEuLPgOat/OyKwB4sdSXaUCWL
   2EqrxEqEJ44j0zRL8y+Pu5WhHt8SYDP7BYz3/QyNr13mIUhPYuXSul391
   5M6XJpbAw1iq9ZW4uMUUR8+djtdqK13kY/CFHV7WwOzaSSPEcUW/yY/fG
   A==;
X-CSE-ConnectionGUID: +P3RvD92QoiGFEaoJKgrpg==
X-CSE-MsgGUID: ab/3f1kCRWW7jFtN9sstkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="70516914"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="70516914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 13:51:05 -0700
X-CSE-ConnectionGUID: j3ouOgtkQ7mn0XpE725aqQ==
X-CSE-MsgGUID: yDPNK4oBSsi9nVbUnBEo/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="254711314"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jun 2026 13:51:03 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc85F-000000006FB-3Wu1;
	Tue, 23 Jun 2026 20:51:01 +0000
Date: Tue, 23 Jun 2026 22:50:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 13/56]
 auxclock.c:340:31: warning: unused variable 'timex'
Message-ID: <202606232216.oOek47Xq-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh (Schneider Electric)" <thomas.weissschuh@linutro=
nix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/auxclock-nanosleep
head:   9f900f195cb022909f7f448feb22fd3320645e9b
commit: 9a3d455760102054fa000454efa2e14a66e2c0dc [13/56] fixme test
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
623/202606232216.oOek47Xq-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260623/202606232216.oOek47Xq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606232216.oOek47Xq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   auxclock.c: In function 'auxclock_nanosleep':
>> auxclock.c:340:31: warning: unused variable 'timex' [-Wunused-variable]
     340 |         struct __kernel_timex timex =3D {};
         |                               ^~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
