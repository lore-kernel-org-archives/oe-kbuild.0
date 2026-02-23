Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21821386DA
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Feb 2026 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858108; cv=none; b=jWWe+Ed8ShjJOn1UqhNKe5tOTqBYTNuRPjwslLM8GwO9kLy613cqRrt1DRDljzvv1hLCMlGTLdE757vUsuZxELQD3i8XjoA/Vb0V8vS3V7jC/Ah+KmWH0FPc4SPcrSrY3PIoIIeOHIJhKpHSCB6Z03YkmGdopy1OWQuL/KVX+t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858108; c=relaxed/simple;
	bh=vf1UpEH3t4hini6x4drOIhwFu+9wtlVWU3w2L+KQoHA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=iOeZSq12UMZ7HRLhiuRWfq5nm4g/jbILio4JDZQlV6PbNMIZYDI6D4oyu27XK4qRtc+kNizUSWt5gFhGL55cgPlRRjPYHRCzrAv9fHlvxMW9bDqADLOJm7a6+t2Qk0o9m2R3MSxQU0/QrBhYLXu1txuUkELxiiELixnh1o6EXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGqE7Qx6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGqE7Qx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771858106; x=1803394106;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vf1UpEH3t4hini6x4drOIhwFu+9wtlVWU3w2L+KQoHA=;
  b=SGqE7Qx6xn5mI+BYqpVZ1lVEn3PXRF2U4tEeg8PJHqwmsGdwFYHonIgU
   sWX0pKklhYU6X9YXLEBh1es08gEsIF070iedfo6hvS4CsK8y0H3h9pvVA
   rEvo8sLWuoqS5SduPe5sakDdQShrSsalNuCfP8roJX8tviYh3pwqVx55y
   BVSvgrPOXOmZnY8YFNGDACfuLrUFLhxm43H6jqFeDPbla2ZOWGMdzfduo
   2MC2/wAmmKT9AOUifsRHX4ExiXML4vm+ZSdaZql8ajeEY71XLc7JNLHzp
   yl0J62kVSGkoF30b1OjuVVRAHJW7FWC3+fyZmUqyGbs+UzEKs8iQhZwaf
   g==;
X-CSE-ConnectionGUID: XZZLOHRgRJ2IqdcB7qqVIg==
X-CSE-MsgGUID: VWhtDKiwSXa9QP2YVM9GFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76716541"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="76716541"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:48:26 -0800
X-CSE-ConnectionGUID: ZwpoIGW6TNCU0CB4iiBmsQ==
X-CSE-MsgGUID: nNi4ldI7Thm2LFKcZQ7nSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213517129"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2026 06:48:26 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuXEV-000000004ur-2mAs
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Feb 2026 14:48:23 +0000
Date: Mon, 23 Feb 2026 15:47:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [rw-misc:rw/drbd9 15/17] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602231532.1pLyVWZc-lkp@intel.com>
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
:::::: Manual check reason: "high confidence checkpatch report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Christoph B=C3=B6hmwalder" <christoph.boehmwalder@linbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git rw/drbd9
head:   bf25dcf596c5e954ec59b0521208f284c3e4ed47
commit: 55368ea3466d5360964ec447c01d7f665ae93c2c [15/17] drbd: rework recei=
ver for DRBD 9 transport and protocol
:::::: branch date: 40 minutes ago
:::::: commit date: 40 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602231532.1=
pLyVWZc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#10450: FILE: drivers/block/drbd/drbd_receiver.c:8225:
+		/* Do not allow RESEND for a rebooted peer. We can only allow this
+	 * for temporary network outages! */

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
