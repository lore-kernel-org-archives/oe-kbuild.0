Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAAE26D4DF
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485670; cv=none; b=FgE6YTE0i3pQCQLo6KzBgqAMgkkwi7Jte35cWdgqnmG/f6W4fyMuilMBXHXCE1kdK8se1w3v5ccnGrKWTUSs5Dd5yl3Dh2ydkjRDLBJ7miXZZFNqG9FH6NGUwuiR6CEPY+y69xZIjI1pxlm+1EqLj1Mpf3QWfRhA4u2FcrJEpTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485670; c=relaxed/simple;
	bh=x2dBIHcwh1zrI4qFY1GFQwh52T5nwAflHAO2imBffHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TiKIO75pmsAd4cHOGkw/5mgi7wY4QVHxJeWwd6cgmP1U3+B0sgfyZPyU53nIvbMq4Yp7u+x6l4XMMpX1fGN7Iq32lb9OCmXgUfIBlx444/4p7MxNHBueSReZ8jDXrnDLmENIS6yxojOrfhLFd5qTD4E5xx0LKCQMUvpQ0pUxOL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dz6bZfi8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dz6bZfi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768485668; x=1800021668;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x2dBIHcwh1zrI4qFY1GFQwh52T5nwAflHAO2imBffHA=;
  b=Dz6bZfi8FBWLXQSE7WcNs5eQDlu9GPiExaW0h8S+SLQULdAkz0A759HX
   kJTWm76wPyEdlXN7QjyiRGJv9YithXevULo0Q3n9vAgXFslM8lLcIPMQK
   KAXLMa1y4MoWPs4l8xGDQGVZQfGqtk/SK4GvJi7AJxbg3DsTjnG5+SJfd
   6oai0XPRK5zvLqJtfCq7SLjBv35dWsied2TOGrDMTKJwZ8n7SZ+uIaB8s
   5PpDhW4GiMpBLHq4f1qzX3IXyuHY0rZ0Za/boUtWyI+SCI/lD6URDEll6
   sdkQgvdFK1Wn/8RWLoSeVfJTkBP1Ob0baQn7gyCkWtFRlwd3Ey0ayxDAh
   g==;
X-CSE-ConnectionGUID: htpEntfWR+eoNEUJkQDIqg==
X-CSE-MsgGUID: 4ezCEtzcQ5+yvznQq9dUzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="72375517"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="72375517"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:01:07 -0800
X-CSE-ConnectionGUID: G7blLZSuTcSTEQQgVCixrg==
X-CSE-MsgGUID: DFtEARjQTG6rz9hXg/wnLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205452435"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jan 2026 06:01:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgNuK-00000000I2G-2T1J;
	Thu, 15 Jan 2026 14:01:04 +0000
Date: Thu, 15 Jan 2026 22:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6327/6771]
 drivers/phy/phy-common-props-test.c:420:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601152139.lvd04I0E-lkp@intel.com>
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
hy/phy-common-props-test.c:420:1: sparse: sparse: bad integer constant expr=
ession"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: "Bj=C3=B8rn Mork" <bjorn@mork.no>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
commit: e7556b59ba65179612bce3fa56bb53d1b4fb20db [6327/6771] phy: add phy_g=
et_rx_polarity() and phy_get_tx_polarity()
:::::: branch date: 9 hours ago
:::::: commit date: 25 hours ago
config: sparc64-randconfig-r133-20260115 (https://download.01.org/0day-ci/a=
rchive/20260115/202601152139.lvd04I0E-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260115/202601152139.lvd04I0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601152139.lvd04I0E-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/phy-common-props-test.c:420:1: sparse: sparse: bad integer c=
onstant expression
   drivers/phy/phy-common-props-test.c:420:1: sparse: sparse: static assert=
ion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/phy/phy-common-props-test.c:421:1: sparse: sparse: bad integer c=
onstant expression
   drivers/phy/phy-common-props-test.c:421:1: sparse: sparse: static assert=
ion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/phy/phy-common-props-test.c:422:1: sparse: sparse: bad integer c=
onstant expression
   drivers/phy/phy-common-props-test.c:422:1: sparse: sparse: static assert=
ion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/phy/phy-common-props-test.c:422:1: sparse: sparse: bad integer c=
onstant expression
   drivers/phy/phy-common-props-test.c:422:1: sparse: sparse: static assert=
ion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +420 drivers/phy/phy-common-props-test.c

e7556b59ba6517 Vladimir Oltean 2026-01-11  419 =20
e7556b59ba6517 Vladimir Oltean 2026-01-11 @420  MODULE_DESCRIPTION("Test mo=
dule for PHY common properties API");

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
