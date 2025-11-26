Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC5270ED7
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 20:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187229; cv=none; b=ZiI7GMVG8h3W+MKB5bzDAD0blwGJH2x5YORri8ISEgBro2542iA1JPcrs7DIzgkmMqpeKqSh93DAuGiyF/MCogtbmov0Eaj1qtr0EytyHUoDJgUV9Va8Z/vxchsaVNyImVmfY/IUPoIMSwLZrRZtC4pK/FfSgrS/G/JmbYCKU7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187229; c=relaxed/simple;
	bh=aBVCRHAoLwZblh7z36GftVoCynjRHugx2LdY+iRoLKc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZorYnJ9HxdwABboutFKbySKL/tSb1Z5b8DPSltduJ3/fYtvJdC9RgjXbkEwbwgisOegDiDnDpCsKo6IgYUo8XKVJI04IocEvs9H9sgH2IE4y1Z4t4KhiEoBedXraClTarAkosBoZW0tsAUMZm3lyU9RgXlIK24XQE/Jju/B1DCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4R2iLwk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4R2iLwk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764187228; x=1795723228;
  h=date:from:to:subject:message-id:mime-version;
  bh=aBVCRHAoLwZblh7z36GftVoCynjRHugx2LdY+iRoLKc=;
  b=a4R2iLwkPDNm7i2GW+HU7dJ7npHADpJvQVDYyBNCcMjbjRTdLtNFmPdJ
   1BfwRwE2PkayyxB8lOEQ4tFdf9K31hRBFdJ1uJd9Uil6EPOgHAqiYmmrY
   PwG9goxWwlKNAG3BB9NTVjC8YpMXlDRDcwRoKgSTeIniLvpM7EdhlaPv2
   zSKnR6THFZrTMbcHBONT6d8zMTmDZ01JSQp1tk6rAA1a4Kv7KtYo8BMk3
   WR9ZsOYKfRHZT8lMLSxdv4bKUsNxMN5FXtClKN9GQ26xN7/eGmJyl4Wfu
   780iu6HMB8ivoQELqRq8r6imj1KTd55YVC5aXgvTHGawJSvPyJ+mGf4Kb
   w==;
X-CSE-ConnectionGUID: xqYhA1y7QZmBtXqUmyGkEw==
X-CSE-MsgGUID: +dBwDLQIRTyS69Asxs4Krw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76921079"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76921079"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 12:00:27 -0800
X-CSE-ConnectionGUID: 3iE8kXCpRE+XcgIj55y2IQ==
X-CSE-MsgGUID: DYNuwR8dTQOE2RQUQi2UMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192683092"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 12:00:27 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLgf-000000001S9-0QRQ
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 20:00:25 +0000
Date: Wed, 26 Nov 2025 20:59:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 851/999] checkpatch: WARNING:SPACING: space
 prohibited between function name and open parenthesis '('
Message-ID: <202511262014.igiNDfvj-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: 08209c1a245fe1ca0b78b31747565a552670f76e [851/999] bcachefs: bch_extent_rebalance_bp
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262014.igiNDfvj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#683: FILE: fs/bcachefs/data/reconcile_format.h:140:
+#elif defined (__BIG_ENDIAN_BITFIELD)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
