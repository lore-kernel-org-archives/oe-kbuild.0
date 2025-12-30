Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0672E03EA
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Dec 2025 02:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061393; cv=none; b=UlKNNoCOZUxBo47zCZzmJLnWoTjOUfKliQ1IJTeOluJrSfO2DG/kYUDlBWBr883JnoO+Z52mgBQ26Ed0cVQvaMFWnAkM4NeOV9+yYNG2d1gfpeItm6T/wymviwDJBiM+te8GBXnwrwVhktDkG0cgjaWTtzNFnGMelMWFXihb8g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061393; c=relaxed/simple;
	bh=H/PyX/PNElXC42+OA5yrN8sYWhUs0ykKQtimNmuqrEc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s01qY3JyjWIjg89VP2bnuXqPL7WCrFBS6SrjcEYPQmxPSwiggsBzrUT5ZuvgBit6D/Nn8ZVtG4A8qZcuvrc8momYlKPuU8sc6lvCUAkgrWr/WmRt/vQfXquLIBTUQLCmUuesSISDLTQMdcYBgEUJCCtZMlktS7LiE4jz0H3LC+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPo1Ysj0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPo1Ysj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767061391; x=1798597391;
  h=date:from:to:subject:message-id:mime-version;
  bh=H/PyX/PNElXC42+OA5yrN8sYWhUs0ykKQtimNmuqrEc=;
  b=OPo1Ysj0RVWv/2MdqD5xPrhpZGwkzoBpgfsiJQEpWF89/+M6wUkOBdou
   YL/gONfuxPt1+NdBmSTp2sLIUx64iTAyPoikOZAX/apNtMNalKtRz5sI4
   5EEjiNyThY50ckhGKfNNrG9lSJS/bC++598APVkCzZANWBSSD9SWh/Qyd
   6H9q5Q0609px620rJhtFfjMtDRQIGSQLwcmXU8qxMOwulLH2g+sxr9xUI
   lHLsCwSKPzrQPDPI8AyKeK1lDduMZC4rGXECaZweU0/cOJqCC5R+HL4pM
   82u3KKRi7raAGi4MaWhGpNl/y4EnQy4RTdeABsPSdKm8hdtiybS6aAGU2
   w==;
X-CSE-ConnectionGUID: yTVIRGuxSBi9L8QWmifgPQ==
X-CSE-MsgGUID: knkKQqqnQ0SCMdcwz9ozkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80111053"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="80111053"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:23:10 -0800
X-CSE-ConnectionGUID: 4ZwxHX5oQye8qr9BjNXzig==
X-CSE-MsgGUID: 1qfP8Cz+RV6XMIBOdskKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="205235134"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Dec 2025 18:23:09 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaPO7-000000007rk-1pd1
	for oe-kbuild@lists.linux.dev;
	Tue, 30 Dec 2025 02:23:07 +0000
Date: Tue, 30 Dec 2025 03:22:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 77/78] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202512300347.L1uapTWi-lkp@intel.com>
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
head:   5d59291a0616bad7d651eecf0fec3273627e9bb2
commit: 8e75d1d22b9e1452bee0a06281bde1cd39c86fdc [77/78] bcachefs: BCH_SB_EXTENT_BP_SHIFT()
:::::: branch date: 77 minutes ago
:::::: commit date: 78 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251230/202512300347.L1uapTWi-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#187: FILE: fs/bcachefs/data/extents_sb.c:44:
+		c->sb.extent_type_u64s[i] = extent_entry_u64s_known(i);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
