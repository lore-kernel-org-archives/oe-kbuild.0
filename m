Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C01327BF3
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770799646; cv=none; b=WfUDhkApfNxtXIFno3DPS5d4CMUhj90rUstvRtjQx/Qxl3WvisSi6oE2ng6YZ4LnCWp6hWKP7uG8vcCzz9F/bzffwTMDMgR+fArnQspIny8+nedDSY6afFnFenrvLyOBJzr7WxgZgDC6l+jMj6boQcKk6tDTPuVfb9SIHKqMOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770799646; c=relaxed/simple;
	bh=TFNKe5WsES6ewBic7FvsKRjehT/Sn63pLmDBCg8CHog=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=N31efYVqKnfRrxAeItijsgd3QdIhDeFA4WPXFs2zVgul7QcoT2gYyYuHZJjhZyauSq8a8W43rA3VVT+yik4deG4NyehfCipZ7mQtU9meRdrVpMxGPJuGeEY9UHVVizxSVKCg/kSQpI0HdKI/DEbm/t3am88YcA4zATRaf6deMos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKqsHeG9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKqsHeG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770799645; x=1802335645;
  h=date:from:to:subject:message-id:mime-version;
  bh=TFNKe5WsES6ewBic7FvsKRjehT/Sn63pLmDBCg8CHog=;
  b=SKqsHeG9lFvLZa6uIVIkE8hAkMv8UQ/G8drEbH/5elhEoza3HGFxJjvI
   XDXuWHUvcWcV2pZ/3uXaasio5qhWtEgAHYE46k2oDgsAWxxzNPSMHr+/H
   aZgXkRaEWwYmdzMNfEKRrG7AgxOtNchFcOU6gBUGQwEAAR18OL9AEMWES
   qhNxVXCM3Uyftglsu7riXM+VFqaY8T5gyVXKuJn68rpzZOLtuwKS3N3Hb
   XskbmaeifAFY+V2yq+HLkzHLA+z1y8sEtxyeDVFsy2xbzQO82QLdk5j8x
   QBUV0WD/3vSHvhJvTOHcwrDzfWvBK3zqmRv1l/eUZ4OsxjoKK+dSNY8FX
   A==;
X-CSE-ConnectionGUID: edcjy7d+QEa4Rosi2l89Ww==
X-CSE-MsgGUID: 1W2EZYyXQpad3iEeXtNaaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72015135"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72015135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 00:47:24 -0800
X-CSE-ConnectionGUID: WQntQ1R6SRaVYIvyEK0lDw==
X-CSE-MsgGUID: DtEQmQGmTHKzD4ThQSY5cg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2026 00:47:24 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq5sY-0000000012r-09NI
	for oe-kbuild@lists.linux.dev;
	Wed, 11 Feb 2026 08:47:22 +0000
Date: Wed, 11 Feb 2026 09:46:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Kumar-Kaushlendra/RE-PATCH-thermal-int340x-F?=
 =?us-ascii?Q?ix-sysfs-group-leak-on-DLVR-registration-failure/20260211-16?=
 =?us-ascii?Q?2504?= 1/1] checkpatch: WARNING:BAD_SIGN_OFF: Unexpected
 content after email: 'rafael@kernel.org; daniel.lezcano@linaro.org; Zhang,
 Rui <rui.zhang@intel.com>; lukasz.luba@arm.com', should be:
 '"rafael@kernel.org; daniel.lezcano@linaro.org; Zhang, Rui"
 <rui.zhang@inte...
Message-ID: <202602110958.Ln5M0uke-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Kumar, Kaushlendra" <kaushlendra.kumar@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kumar-Kaushlendra/RE-PATCH-thermal-int340x-Fix-sysfs-group-leak-on-DLVR-registration-failure/20260211-162504
head:   ade87aea43f5652ebf85094e172949d6cf7d4a86
commit: ade87aea43f5652ebf85094e172949d6cf7d4a86 [1/1] thermal: int340x: Fix sysfs group leak on DLVR registration failure
:::::: branch date: 20 minutes ago
:::::: commit date: 20 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260211/202602110958.Ln5M0uke-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'rafael@kernel.org; daniel.lezcano@linaro.org; Zhang, Rui <rui.zhang@intel.com>; lukasz.luba@arm.com', should be: '"rafael@kernel.org; daniel.lezcano@linaro.org; Zhang, Rui" <rui.zhang@intel.com> (; lukasz.luba@arm.com)'
#16: 
To: rafael@kernel.org; daniel.lezcano@linaro.org; Zhang, Rui <rui.zhang@intel.com>; lukasz.luba@arm.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
