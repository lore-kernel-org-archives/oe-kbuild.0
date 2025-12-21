Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C882882A9
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331127; cv=none; b=B/M3zC112xki9UaLtDRkknTLxq/7vyiEanKsGLiuGCiNKX2/xPPtBWEPs3e55rs5wQuLQg98G7gx8KpwZNJHK05VQR5W3AWoqWDnjwhlC/k6UqStijWLfIIT3Q6K2SjxUVw7lUYHUe6YWqGQnYCcepMKVjUJJdEIHyZ8SUflgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331127; c=relaxed/simple;
	bh=pObHY7VPuqXCmdcjohDpqUfnxGCs0Ruap6Yy6GplCfQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/Lgn2D6aJuikJNivemMUTSLPvJOoxcStlZzsHISqVKbXjkhdXsCWa5vUozVxMW0lY0BCcjuGlIsOFOPsqoDJXc8aCaIPoLo5gcskDP5yl7ZGWXo6MuaPaBjTsAk4NlBzZG0eDa8O0O2hten1RTUcAVGA5mtoIjAi90KQWyi7y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVoU9KxS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVoU9KxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331126; x=1797867126;
  h=date:from:to:subject:message-id:mime-version;
  bh=pObHY7VPuqXCmdcjohDpqUfnxGCs0Ruap6Yy6GplCfQ=;
  b=kVoU9KxSQdkqEfNo7kIdugMlv5Yw1h0Y3kfbLhaaN49oAfvgHeNcO0XK
   gJ2F7xOjxPxKGJk9IuMgEgAEgr9T9ENRiGCM0hBn7FCFFZXacoiP3+f2v
   kDbv1kPHzoYNfrNjJWM1duGGkIqwGcSiTMCHhR5Q6VhhC8L5yiWLqPocs
   PlscJdjiBBTKvd6GvelJXmfJeZMwbagRv0cnIMsOmNRo+vVPH4O1Kvd0U
   a+SGnRvypZkDWtlemBdwMuLDIKr/i4n83l387Bq1xT8BHRhFgsJNcJFnV
   bOD6Xi7R52TT9PsxeVYYqeT+xlhsqlpXJN2xIvkoG6hhlrvJokL2cvfqk
   Q==;
X-CSE-ConnectionGUID: r5sifQ7bRBKdUNqcFNUKyQ==
X-CSE-MsgGUID: ra7wuq49SH2R4RU1vWVprA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="70786171"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="70786171"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:32:03 -0800
X-CSE-ConnectionGUID: ZI0IZaC8RcOXe0K1/Lu1Nw==
X-CSE-MsgGUID: iwyLirohQZ6gLV4MjvgY7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="198965290"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 07:32:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLPc-0000000057Q-2RFa
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:32:00 +0000
Date: Sun, 21 Dec 2025 16:31:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 54/246] checkpatch:
 ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not
 required
Message-ID: <202512211639.NEJSI35j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: a8641cf6264648a510fb5436190135c472695b6c [54/246] gpu: drm: apple: Brightness control via atomic commits
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211639.NEJSI35j-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#136: FILE: drivers/gpu/drm/apple/dcp.c:227:
+	return (dcp->connector_type);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
