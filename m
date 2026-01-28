Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAC179CD
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 01:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769563663; cv=none; b=smlPk8VBdIRHqBCNIFu4j2f22chJex2KQbT+Tgcdh0PK1XwsyH71FJ+DJBK/Ca03vyclJQE+xqMKJSu82IxwmLASyvPwePH1w3Eb7ouUdmNcpBLn0qAshwAFYLKyS3RgHQzDLL9sj6Eh51AsxdAkBblOL656G55pifNuyKqZycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769563663; c=relaxed/simple;
	bh=CJgX8UWYLoTZ4zgZG7MbDF06eSzfwRGWmhySluWnAro=;
	h=Date:From:To:Subject:Message-ID; b=uJ7sOhO2/DJplBsdFrAAIHld40zxFZwBE4EfE3vgWZHKN5VBOXQ0RPu4Lx1QEFXXNsNCLWNzfH/WjXfig29SAZSEvYT/KHxFCIY6OfARsfwaZC2BjJ7adcfVawU+52at7ihYtk47CDbp1j4kCze/MmXEP5B9P6nXPiSd8NqGIzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFkAvDae; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFkAvDae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769563662; x=1801099662;
  h=date:from:to:subject:message-id;
  bh=CJgX8UWYLoTZ4zgZG7MbDF06eSzfwRGWmhySluWnAro=;
  b=dFkAvDaeGVm0k1Czw3gPoxsjt5iBcIN624Fq+S4/I5tLTdK/ubY2C0CU
   VbYgUXPqYmp7bbSfcowVjI/+/cjnlauDzZQxQzZxUzzU3eamHV6dCF2Y4
   /Nen/ck/EbaGWxSntLWvGF7dRkkBkyR9zHI1POEWd1Nml4Evqa3rl9ysg
   vM/UgWZ7bTItDD8AW83N9MbtpnqJ5doR8zYKf1lqmuz0ODzUuOGoum12s
   Czs6YDHsZdGY9Vcp1Pn1yjAOujhz6MVrN9/owMGYN05JV7+Hulq7ZflzT
   cobUPvr4vzpmJEDsJY32nlOQTLeGgkQuxnVry8hqMVFj8oeozYsmhdmAf
   w==;
X-CSE-ConnectionGUID: dL551b7hRUCfiJSN3fOv7w==
X-CSE-MsgGUID: kzPJZlMfTiGoj694uLN41Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93430696"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="93430696"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 17:27:42 -0800
X-CSE-ConnectionGUID: 9xQm8q2VT++5X33oDiIm3w==
X-CSE-MsgGUID: ruUtYo+LTM+XfxP3eVrBfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="231083411"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2026 17:27:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkuLK-000000001xp-3lzg
	for oe-kbuild@lists.linux.dev;
	Wed, 28 Jan 2026 01:27:38 +0000
Date: Wed, 28 Jan 2026 02:26:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [daeinki-drm-exynos:exynos-drm-misc-next 1/1] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Jan Remmet <j.remmet at
 phytec.de>'
Message-ID: <202601280217.Eoa3IKS6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-misc-next
head:   89f51ab5fa69db4ce2aeec80987befd1a60c6b68
commit: 89f51ab5fa69db4ce2aeec80987befd1a60c6b68 [1/1] drm/bridge: samsung-dsim: Fix init order
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260128/202601280217.Eoa3IKS6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Jan Remmet <j.remmet at phytec.de>'
#61: 
Tested-by: Jan Remmet <j.remmet at phytec.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
