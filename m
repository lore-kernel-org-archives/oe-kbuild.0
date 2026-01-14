Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B099393DD9
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768389720; cv=none; b=otcQ1U7GcRNQuf056fXm5heIeVWtRDq4afUZNiUCj+H8qCpwed3Yg7kcorK9lf25QQ/NIkRTiACkypJvihCs3AidQ2i5Ct9rMYv2cRniY9TPboHbSiYI2mQKwUpEaT4s+vicmiAn1yB539OCGVSPVjfk9bfg8QGocrYiWPbyGb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768389720; c=relaxed/simple;
	bh=W3ON6qIO14oYHdl5/nsCHnvgYTKEqpa3Jm8fJQ6ugeM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=m5mzUFitDqPHFftIIFajscW1sbkWHRcgi3A320oXKRNlF4/FWD5yY38wbCzLW8f+27IVw2lRk/tddIEUcG+FPkNzi8Cir+zP6JqHbDvsHJJpSKS2lWLWRCByVfx//uMYmN5/VT+tfgxKC1C8HrpT+kpsi5SruNiO5D2rCn6+G64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiVpkvYh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiVpkvYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768389718; x=1799925718;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W3ON6qIO14oYHdl5/nsCHnvgYTKEqpa3Jm8fJQ6ugeM=;
  b=EiVpkvYhZ8xgnr1EFCqh0/KhZf62EbiT6MxQCsyQ0A7XaMt8y8JJtgmR
   /imSSj3yIJz+vd0vfEV6OrGfNnla+GYaYLE0y0VVqmelCwtaJgJdbPk2+
   QKeor7wvP0ZJslA92q3qcF7G8vsknfSSfIaqygRbClwusM3B8JDUaTtI9
   UwGFgdNsXLEJlFn37EGJWYfzeoq0IEZriY0/7iOnTnkjNCpQsJNxgFziy
   ijagedQIU+vHOlVJff65yZxp5VtxaB2M7kT/FaZOZpIjhkvUOhBwWxLAR
   knOYwYG0jfQgxDACNYWvirHL4bLtTRlxjVwVdYp1F/TGhjGMURAhzpRq+
   A==;
X-CSE-ConnectionGUID: Ft/PDEMkRmeCjpPIl0cU2w==
X-CSE-MsgGUID: AinwRgO9QuaawoBCymg9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="92355238"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="92355238"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 03:21:57 -0800
X-CSE-ConnectionGUID: xstUEy+BS++AaxbyBqxL/g==
X-CSE-MsgGUID: Dn2KsmxAQAy358Z+ndlpKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204667135"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 03:21:57 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfywk-000000001Nx-1SU8
	for oe-kbuild@lists.linux.dev;
	Wed, 14 Jan 2026 11:21:54 +0000
Date: Wed, 14 Jan 2026 12:21:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 7/18]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'pages'
Message-ID: <202601141211.VA1rlvzK-lkp@intel.com>
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
head:   0536dad52762b00b216d41a7a5aab94ffd4e5a48
commit: 3c500cfc34ab200cde680c4d2c128218d40623c6 [7/18] vdso/datastore: All=
ocate data pages dynamically
:::::: branch date: 83 minutes ago
:::::: commit date: 87 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260114/202601141211.V=
A1rlvzK-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'pages'
#22:=20
The data pages pages need to be order-0, non-compound pages so that the

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
