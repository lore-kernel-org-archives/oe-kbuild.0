Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF850346AC6
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 20:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774728551; cv=none; b=nnIRmVj1mZn2uUjnRq6DECU//h4+vUEotLhbfj67wmM8u4izbEt8zDhdIsFA8NZYSpZPQVeLSTPyS/4xVMXk9m5TLfctXZsBYowzGlu49kynSx/0wEjU+oaRfYe8mMEIS3s+XLc9orcvNy4EmWQoWP0ccfP1sYIshgjnXBDe+V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774728551; c=relaxed/simple;
	bh=ULX5TbHOvm7lIKudgL5STlLEFwzJKMyVGGTOjE2K2LQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=upSYB9pYRX4mGTQnST4XQUtnwBtFsYHi6UV7OdrudG8VTuE96Rw+GxoYvw4H0MSgCLZK3mTZmDOl8Xnq100VnNjWqsN+/aiI9OZh7/fzIKIYKIBwUIoNowy9/OE6q/r6z0LhCuWOP9hs/lxzUnX9KdFxhtSl+Mgtn1PDOAEUMeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCZbwYkY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCZbwYkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774728549; x=1806264549;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ULX5TbHOvm7lIKudgL5STlLEFwzJKMyVGGTOjE2K2LQ=;
  b=jCZbwYkYfbFpqlNLpnDKOl7y3o8SCwrTNM6VXZ/0OgbRdnTngg/UhBnt
   jOeIkaj+JVr02G+zvvQHVo8yNSsubQ1pYmn/uxHaSkunuxQtU6Y/SN/gY
   +xTzsh+nDyRmBQnU4W41hPgNwV2fot7Bgn1JNVZUCW3dYfF343m92Z0jP
   rzKk2JJVzrS9EXK8ELsklvv5ujKszM8vT2Ebc9TmIeFMMy0Uj6tLgWSeV
   uPcFecXRuevdrFfPBh4AhseQXHWz0i6v7IVysD8wbgfylI9N7rbEQ/Kew
   EdMPvAyDaWRF1uCydmxBpt/HLCO7GOdDvqRPMVocrPH1z6++julLgS0cM
   A==;
X-CSE-ConnectionGUID: 6GzmpRnHR3ifB9BykySMLA==
X-CSE-MsgGUID: 9KH4Zx0ZShWMe7MikzCv1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="98384214"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="98384214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 13:09:07 -0700
X-CSE-ConnectionGUID: SLOyLF70TH2T5WtxSSAcrw==
X-CSE-MsgGUID: WDg2e3gyRdemCjUs+OiQEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="256133332"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2026 13:09:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Zxx-000000007jp-0NZf
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 20:09:05 +0000
Date: Sat, 28 Mar 2026 21:08:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 17/20] drbd: rework receiver for DRBD 9 transport and
 multi-peer protocol
Message-ID: <202603282120.ob01uVck-lkp@intel.com>
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
In-Reply-To: <20260327223820.2244227-18-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-18-christoph.boehmwalder@linbit.com>
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
TO: Jens Axboe <axboe@kernel.dk>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-18-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 17/20] drbd: rework receiver for DRBD 9 transport and multi-peer protocol
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603282120.ob01uVck-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#10567: FILE: drivers/block/drbd/drbd_receiver.c:8297:
+		/* Do not allow RESEND for a rebooted peer. We can only allow this
+	 * for temporary network outages! */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
