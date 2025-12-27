Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB253A1E8C
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 01:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766799215; cv=none; b=qKpOTxdPd7QXkQzJYZaurgs+78nI7TQ1ks/bRHoL1TEqcVjQ2Bpzz50zPrx8BaZEysghlD0XIJbi0FxzzDQJrbtgnTH4y8auAR6IB6AiqEkqqlSdbHn6L6bRb21K/OfFeyZM+GdJDjffQR4QeLsZDuflfW4hTjpUCiIWxZx7504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766799215; c=relaxed/simple;
	bh=5Qgj77CKBFXh8tpfXmsyg9XL1e2N0Lz6h9DvzFH2MdE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kkm1kmvVXw2m8EJakERKMKvjgZ/hLQAe311CywR6Cy6KbImJMF1zjwN9Bs4cJQ2C1ZlfcAp6AqyVA+YOc8jAn5YUFtrHKbmjv+BO7MWQ4lMzZeIDN7Yir2QLgmL1L/T/2NZETqz2WutWmkQ59euskrBngKMIE0MHv8VL9ZJNuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMimc9hh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMimc9hh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766799212; x=1798335212;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5Qgj77CKBFXh8tpfXmsyg9XL1e2N0Lz6h9DvzFH2MdE=;
  b=HMimc9hhBF3I0rGHozLRmMhG6obOBNFRneZ/ImLkmnYOfYgqBoOV06t3
   VJB+3QONHxFLsfh0offccT1+OvJ/ADErn13CPfSsv/rDhgX62dDBNC1qO
   Be4Ad/S49bem+fs2Y3o02YTqt1jdtXsELomnGmNmi+6Ncl6D2E69nPqBR
   umgNPvche7sjfan8MhEJmoRn8r0rJg7Mmood+rLwP24/C13eSoCWW2szk
   BJeuKbIT13cTEbVLqbXV4jXT8fGfPUqXlIvn06xr9Bys6j4M95jFOvXVB
   QYBj+yH7N+iriLuUHqgAEnGDRGkGeQAXAGUAtEJVFO4yEYwJFO2P9gNQx
   A==;
X-CSE-ConnectionGUID: cWLktq0WTbC4zm7iE2oSlg==
X-CSE-MsgGUID: Tka/n4FNS1SIO7E5FM81nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68421257"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68421257"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 17:33:32 -0800
X-CSE-ConnectionGUID: uOwJmWfRSEaWGH/eFpoqXA==
X-CSE-MsgGUID: dKdS3zD1R2m8cWA7Oqv+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200393862"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Dec 2025 17:33:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZJBR-0000000072e-0ziB
	for oe-kbuild@lists.linux.dev;
	Sat, 27 Dec 2025 01:33:29 +0000
Date: Sat, 27 Dec 2025 02:32:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] rust: drm: Improve safety comment when using
 `Pin::into_inner_unchecked`
Message-ID: <202512270244.ZfMmBvw4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251226-drm-gem-safety-comment-v1-1-5ae56d8194b9@ik.me>
References: <20251226-drm-gem-safety-comment-v1-1-5ae56d8194b9@ik.me>
TO: Ewan Chorynski via B4 Relay <devnull+ewan.chorynski.ik.me@kernel.org>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Danilo Krummrich <dakr@kernel.org>
TO: Alice Ryhl <aliceryhl@google.com>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Boqun Feng <boqun.feng@gmail.com>
TO: Gary Guo <gary@garyguo.net>
TO: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
TO: Benno Lossin <lossin@kernel.org>
TO: Andreas Hindborg <a.hindborg@kernel.org>
TO: Trevor Gross <tmgross@umich.edu>

Hi Ewan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6c8e404891e1059564d1a15a71d3d76070304dde]

url:    https://github.com/intel-lab-lkp/linux/commits/Ewan-Chorynski-via-B4-Relay/rust-drm-Improve-safety-comment-when-using-Pin-into_inner_unchecked/20251227-012429
base:   6c8e404891e1059564d1a15a71d3d76070304dde
patch link:    https://lore.kernel.org/r/20251226-drm-gem-safety-comment-v1-1-5ae56d8194b9%40ik.me
patch subject: [PATCH] rust: drm: Improve safety comment when using `Pin::into_inner_unchecked`
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251227/202512270244.ZfMmBvw4-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#10: 
comment to to better reflect this.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
