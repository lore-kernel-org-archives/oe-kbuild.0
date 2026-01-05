Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EA431B839
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 17:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767634362; cv=none; b=TPFoPSsLORif4nbcjGsbGLTHZvprS8s9MqzoEjeyeWEwQtvzkCsQh3OJ/IRGmhfTXLjZ2DkvSVdhfruiuKBmhx6orQJSjQ09sEWHLNLGEkqTjGfO621MgBY23R3HFApRr/gbV3/eDonmfD6Nk+TRPLc/GSR6rCVnMVGSFz6vOMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767634362; c=relaxed/simple;
	bh=/5EKtc5n5A9/YyBlTbckQFH21quGNOd0UduATsaHcec=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=LszjH8P5gPcqNCBU+Pbp3C7KzCVSt5+nYe1OwuQmjrWdaRv8S1z3PnJyyDbEg8HVCeKbeloptI9WF1CNYmBYtYJu4Nt4zHzYTQjkMsIepbpNfbaaKk670/IbCVpLHtsLu8cC4zUT8rWs3ZZ2PVKTAiUNRlDRq2ob6uwc+KSmzFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfaHSwvm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfaHSwvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767634360; x=1799170360;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/5EKtc5n5A9/YyBlTbckQFH21quGNOd0UduATsaHcec=;
  b=hfaHSwvmV2ezrU2svllTXLCoAkPRC3i2sBzO1REvMUTYOEL32kzKqahr
   pMfWPfePCNP2nANJ+LiayureAV+77uuVVtS0MQk/iUILkjC90agI9o91j
   mlNLxQcUmMwe2FT67HpYZj5vza97Wrdf9sSVPfNJ3Q8I9rIh2TU1rHobo
   3o5w9xIk1nL0f7bCBHhCNISJWQapY9pKuH4Ep7p2T1PTQCF4w2dymBeBF
   no9CW+NnW4AOnSAn9rTy7AemaQK+nw5RDcLYQ32agMJzvjZnzyy6cOGI9
   z8MdyYD9iYX0BOv/K4GIny6oW04fu72J+aY76RBQ8sMtzwhCrZKi5VFxj
   Q==;
X-CSE-ConnectionGUID: va1OV9PWT2WYtOshLW0CZw==
X-CSE-MsgGUID: G8gasMi4T+SU/qaRX8Codw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69052336"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="69052336"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 09:32:40 -0800
X-CSE-ConnectionGUID: SO4bVyAdTve6iROk+ZVQhg==
X-CSE-MsgGUID: kNUMwD1wR/W5qYYZMjV3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="201561455"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 05 Jan 2026 09:32:40 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcoRZ-000000001Ar-1H07
	for oe-kbuild@lists.linux.dev;
	Mon, 05 Jan 2026 17:32:37 +0000
Date: Mon, 05 Jan 2026 18:32:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 27/38]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'pages'
Message-ID: <202601051807.fhxFS8zD-lkp@intel.com>
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
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-sparc64-generic-2
head:   4efed5884f171d58fe7bf9ac029ecfe06477e285
commit: 9a67c4836b52be4843fda86c6df339bc3127e7cc [27/38] vdso/datastore: Al=
locate data pages dynamically
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601051807.f=
hxFS8zD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'pages'
#23:=20
The data pages pages need to be order-0, non-compound pages so that the

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
