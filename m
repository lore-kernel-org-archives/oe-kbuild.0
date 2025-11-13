Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54E431A564
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069301; cv=none; b=Wtyw4OdQyrORlK1tKzRoG3a7dOhqCPqpQIKimK+IMKbKLk5V8wYMB3/EI9nxon/9M39GNAidoh0Ny+7BJ+gEBB7hT2Y0X8kXnXb+vt7o+NFqXs0FIjkazY0IFZ5rdeebEUpvMMHYiMao01KxIyg6q8ZrzOhHZlNN4VhsKOqoB0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069301; c=relaxed/simple;
	bh=upZ8+Sx3Qpr9N1zqqn3QWftqKTfMKmdX35satRFXLeY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhPmDjNAFzNlOFo23Hj+Nc6gsRv24T3ovMOmpuqVmiNCtALfkuSmmyOREJAq3RtKiBLv0V7e5C4HasBedEv3XfjdjlcEFIFaqI0Wn1MfiPbPUp1facxpZukfzcR8gxm8NDXeky9miLOmT3BaDL1fq4L66TPJsoHOjz5yxSGwTuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bndbikqG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bndbikqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069300; x=1794605300;
  h=date:from:to:subject:message-id:mime-version;
  bh=upZ8+Sx3Qpr9N1zqqn3QWftqKTfMKmdX35satRFXLeY=;
  b=bndbikqGkzeSZANy7ju7YwP1nf1SFDz8EByJStZ4UwJvaPY2zgopEzcu
   y/orBwUA5wz+mo1xGuFOZ+42YdycDAa//J3TSGwVCr8Uzb7IuFFEzpZaC
   QFY63iN7cNGlrJ9LIPpIyyguEH2RBBLhuPrgV0RnhtCwSJrYUZiQHNiT/
   +2nwVfXUYTmUei3+yCKgRXtjqVIxbFUMMMmRb4QhLllpbXAEbGB6Z9DZ5
   YhFQdAfQp4zPaEWH1H3MyNjsBsvd7WAhGeELJGzmwJGtkPzRASDS1ppcq
   m3PICtIoJ1vlXs2OnmPuj39JAu92AwX50e7GElrLPJqzaOdfnlZphcpfp
   Q==;
X-CSE-ConnectionGUID: AeuK9JyuSZ6J2tfmusie9A==
X-CSE-MsgGUID: hoka4CX5Q7OBIIxZvDIAAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637515"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637515"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:28:17 -0800
X-CSE-ConnectionGUID: w4Ue3UbuRZmV6SO52csfvQ==
X-CSE-MsgGUID: oVPoFeRmRnG4/xE31PCIhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190035929"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 13:28:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJerW-0000000019v-1pWV
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:28:14 +0000
Date: Thu, 13 Nov 2025 22:27:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 575/867] checkpatch: WARNING:BRACES:
 braces {} are not necessary for any arm of this statement
Message-ID: <202511131942.Kuk3iYKi-lkp@intel.com>
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

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 407060d9ae7d986bc4f12b09ae32828fcb479d25 [575/867] bcachefs: kill racy access to bch_write_op.flags
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131942.Kuk3iYKi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131942.Kuk3iYKi-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#40: FILE: fs/bcachefs/data/write.c:1275:
+	if (unlikely(op->io_error)) {
[...]
 	} else if (unlikely(op->flags & BCH_WRITE_convert_unwritten))
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
