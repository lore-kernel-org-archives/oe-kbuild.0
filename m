Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C417080E
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 02:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771380074; cv=none; b=p5n8sQfl3EUnYURBx1WbLatnaVCQEXF0/7L8otifipOyjaPvME0jyiF0Hc+vnptfXAS9rzH8kBzr1ysWtC2jrbmBZz6Cvc6c1ZVQ1x5DndawevrJKpDuf6D0DFdmg1rX0nfaHAupValZq4/22Roxr31Oohr6OQD3bRA3Xj/XOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771380074; c=relaxed/simple;
	bh=9XZWUzX/R64koBlcnCJlOHS/ij5ds/6MF/5pOqaKdj4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZ2mcP8NrK4ugGicBY+tmQftejl7bphITAJxWuGNQaxyIM/ZpYkOTGlX05ZdEeJ4z9VIXKimbwoAlt2Izw2rGFrKkLuenxgjdS8/pHa3h7+4G/+1spwKF6QaPp2ElEeocq/IB2A0YAsD4VBnm1m14IbZ+P38AB7e9FD5RMa+2lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfL/CKnU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfL/CKnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771380073; x=1802916073;
  h=date:from:to:subject:message-id:mime-version;
  bh=9XZWUzX/R64koBlcnCJlOHS/ij5ds/6MF/5pOqaKdj4=;
  b=AfL/CKnUiPQfgmtAGzTCmmLFHzfXSmx53q6HCsBgod0XKJdhd7AJpkoT
   GXLRNK3MNVRc58SG8uG4lLJ4oIxBSenQqi8KLh3KSsLZe9jd4L1INrkxW
   HkS2Xt5E3rA9i0Znli2k7QvWG2OAM8qXsRnhJnyHoYzTHZb8Prt4cDdWv
   ljwdCZeGp8oRqC4MxoEoPZJkZQW6Maoth3rz68eIZ8LFP4Xmu11HCPdL1
   9I0IuKOVKNCc+GYNTKsfq/h9DR8/UMLJFzpshvWxE1bIkyaWliUceacuu
   k9wtbXI/Qw1eJpDD8GzOF/qnMZMitGzvAMKL6ilKN+hRea4J6/0E0AXvl
   g==;
X-CSE-ConnectionGUID: YXJ1mRntTkqZdY4EpnQI5A==
X-CSE-MsgGUID: BBoC2LMCS1m6f9+GDHMzdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72504963"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72504963"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 18:01:13 -0800
X-CSE-ConnectionGUID: IG6o0bOZSsqAPs3OZdjD2w==
X-CSE-MsgGUID: 1dX/6Bg3SJWKrij3JrQcYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="218585702"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Feb 2026 18:01:12 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsWsH-000000003QH-3rgh
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 02:01:09 +0000
Date: Wed, 18 Feb 2026 03:00:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 4/5] pci: check if VGA decoding was really activated
Message-ID: <202602180311.7dwnNSou-lkp@intel.com>
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
In-Reply-To: <20260217170419.236739-5-Simon.Richter@hogyros.de>
References: <20260217170419.236739-5-Simon.Richter@hogyros.de>
TO: Simon Richter <Simon.Richter@hogyros.de>
TO: linux-pci@vger.kernel.org

Hi Simon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9702969978695d9a699a1f34771580cdbb153b33]

url:    https://github.com/intel-lab-lkp/linux/commits/Simon-Richter/vgaarb-pass-vga_get-errors-to-userspace/20260218-010647
base:   9702969978695d9a699a1f34771580cdbb153b33
patch link:    https://lore.kernel.org/r/20260217170419.236739-5-Simon.Richter%40hogyros.de
patch subject: [PATCH 4/5] pci: check if VGA decoding was really activated
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602180311.7dwnNSou-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#28: FILE: drivers/pci/pci.c:6204:
+				if(!(cmd & PCI_BRIDGE_CTL_VGA))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
