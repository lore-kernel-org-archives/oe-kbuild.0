Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40C32470A
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069361; cv=none; b=BWN29iU3VK+MDiyFuyUdRZssL8zuE+Q5zXuEX5d28qD8KZMVLEj3nRaM4h4gvNnwf/99xCtB4hD6WmHjgb0+vxtlWgtvpssqB5xYnELD2xX4Z8Gc5xDxxaRUlfKQE3Y5/x9ClOKOo+/Bapg5BeolIvV4SAveTYf/EUfr8FnruPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069361; c=relaxed/simple;
	bh=H/RV7Oxr8xe2rNYhy+Djm3Dreq6O8Jsgajh6OK7lyyk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HcMzINlJLiPeyT1PTxZ+Fa9x0X4huYte318aOSA3wDxiTjXO0JHMr2e44BCCtFYzg3mNGR2zMtfbnfxNbC3vY07hWofX4JOw+wbmUDwCk2a+zYzWmrtidBYVJqaHyHZhk2zYv3oyQLM/XV8P4d0qDzSsPsiJM8TuBOOwOYEYmAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTKqGfYM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTKqGfYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069359; x=1794605359;
  h=date:from:to:subject:message-id:mime-version;
  bh=H/RV7Oxr8xe2rNYhy+Djm3Dreq6O8Jsgajh6OK7lyyk=;
  b=cTKqGfYMQUZVPCWlr2otaQb5qUfpR8MSkUr7gO7Xu1CsKqDm7TmGpJxr
   ZeTqD7hS7/n9yBAq/xxlh1ITL72vrXPHGvPILU6URiBsbK5qzvEGmO7/X
   ujZsSZ0NHDr+6LzIDO9JksLBBvekqwiIXD34AFAtPFR+8UnFjypPEMNQb
   Y6NezjbonuBJgRfSByo8e9Fy22oW4pPukvyMky3lPx4eBVxvW50TTXzR+
   tyvaEtkb7zcxepU27xc3hzjfsx+kJEA/Ow/wudt/Knbk++MyrmHbiEtXl
   B6KdwO41kS+xhWBZbkbBdrn0rqaLrtB5eRJH5OokfPUqPTQbqnbp28XHJ
   Q==;
X-CSE-ConnectionGUID: NeVirGZVTNqfj4BzTXtGMA==
X-CSE-MsgGUID: ZmUO5epkSiu1dmyoR58Ecg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64167535"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64167535"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:29:17 -0800
X-CSE-ConnectionGUID: XDVkeVhGQWuR8TE6I25vaw==
X-CSE-MsgGUID: 24zRsF2+Rse8MCQt8m7bkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="194744324"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 13:29:17 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJesU-000000001AY-3nlF
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:29:14 +0000
Date: Thu, 13 Nov 2025 22:28:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 719/867] checkpatch: ERROR:SPACING:
 spaces required around that ':' (ctx:VxE)
Message-ID: <202511131910.39bDSSeP-lkp@intel.com>
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
commit: 170e790c993f2dc5503d5edf6c7e211f47c320ab [719/867] bcachefs: bcachefs_metadata_version_sb_field_extent_type_u64s
:::::: branch date: 3 hours ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131910.39bDSSeP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131910.39bDSSeP-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: spaces required around that ':' (ctx:VxE)
#147: FILE: fs/bcachefs/data/extents_sb.c:22:
+	default:
 	       ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
