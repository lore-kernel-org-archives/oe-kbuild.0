Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A063EBF2A
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770982006; cv=none; b=pVPtenmP623AeY93gf73LdWivsHzNfLvPikSpAdxYXvEqrrhPxBH0vhFIYRV/zTKAXMZcCvNvbQLN9gVTB0eLe5i9lpTxtVxbBOILLzye1HXrjr6n0OabZ4V4iEF9YvZ2GHUxOG3VA3R9AdDZ5c0jI6Cf5wOo6XkE1xxy0vcmKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770982006; c=relaxed/simple;
	bh=TsolIHHrTdvFx6hjN2LseV76uY536Fhdhq66BloFvPg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGNfceFTRSXctbJdggqDJO2U6mTnqjSaRRcevYOgudv9hHtle1QYUmhOJmliuJedl9oK89MKWHhKyWXRw8016mzV87gkMJTrQJtkBN61I5Ml6KO02ykJnTn/gX1SubzoNUqedk0Vlz1NvbH+EK6fUr2p0IVcUWOjAq4sHsqFG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv4H6Atn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv4H6Atn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770982005; x=1802518005;
  h=date:from:to:subject:message-id:mime-version;
  bh=TsolIHHrTdvFx6hjN2LseV76uY536Fhdhq66BloFvPg=;
  b=Fv4H6AtnU6R1fNJCDSwBu0qy57T7fXSmxVa6R1P9BSPYLG4iBW6wmCTS
   BPjkrpmprJd4VVu2k0wH8fj0HbeWHW+mETZijbMJcKaXhIcXv9FdkdWkc
   N2IAhxLsqIZ4Dk04B63jaAJpbGqAmPi7Ft0TMUydcQWy86nTUB1XgH5dZ
   jWYM5nWABeMABLFzPbUfsFIyxzzWI8XB9bcGtoRt5dNTxSIKW9uyRcTUc
   muAV3vwzBEDWa3TysfGBtmVPSnEubmTKA2yAnHaTh+TtWDohlLFkCBr4s
   tM3Ot5Az9XWi5OHQu+Q92BH9zd+q9l1sSE0Wp7ovYEt8JGxRkwVBfYrNN
   w==;
X-CSE-ConnectionGUID: Zj3HjVcdRWmYrqkEwrPHTg==
X-CSE-MsgGUID: SvCF2N3tQ926KlIjapV0lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="94802827"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="94802827"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 03:26:45 -0800
X-CSE-ConnectionGUID: 9gGziVEEQw2264364XSL3g==
X-CSE-MsgGUID: bNsSsI1cS9SG/5vsVhQfcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212051075"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2026 03:26:43 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqrJp-000000001UH-2kK8
	for oe-kbuild@lists.linux.dev;
	Fri, 13 Feb 2026 11:26:41 +0000
Date: Fri, 13 Feb 2026 12:26:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 02/16] drm/i915/display: convert audio workaround to
 new framework
Message-ID: <202602131201.lZcfpLaV-lkp@intel.com>
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
In-Reply-To: <20260213102500.406925-3-luciano.coelho@intel.com>
References: <20260213102500.406925-3-luciano.coelho@intel.com>
TO: Luca Coelho <luciano.coelho@intel.com>
TO: intel-gfx@lists.freedesktop.org

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Coelho/drm-i915-display-remove-enum-macro-magic-in-intel_display_wa/20260213-190354
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20260213102500.406925-3-luciano.coelho%40intel.com
patch subject: [PATCH v3 02/16] drm/i915/display: convert audio workaround to new framework
:::::: branch date: 22 minutes ago
:::::: commit date: 22 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260213/202602131201.lZcfpLaV-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#56: FILE: drivers/gpu/drm/i915/display/intel_audio.c:436:
+	 * Corner case with Min Hblank Fix can cause audio hang
+	*/

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#69: FILE: drivers/gpu/drm/i915/display/intel_audio.c:572:
+	 * Corner case with Min Hblank Fix can cause audio hang
+	*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
