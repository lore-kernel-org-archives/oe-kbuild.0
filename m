Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41163247DE1
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 03:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763608251; cv=none; b=TgawBvLctVI0XhA6cYWGgkcChNvWzwV4kO7AAd+SwUWc2f+9Wa1t5Vp3FHjU9tIucqmOwwJ/KoCCPvsi4LvEX/6jk9JQhOARSa1jfpCliiTJo8w/b/7N3DITada4rvoIYttHxXlNzNg2tuIG0ywTpAoCP5lK6OZS2GnFndfV/bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763608251; c=relaxed/simple;
	bh=yeNr7LzcXdejL+7KVY/MXU5ADAdB2MampVj/QOQebFw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TWIE/jTipqQ/MdHSrHqZZMXCAWwyivXedoWn0KbpeQvI4un11OwTSwGZtTlPNbTqbyBtoUod6lucymgHkhDAzOA+5GK7JHWSTNXNfMojdkVdKLqAcw/1uDXon9JXxsJF4gH55Q5i+Cs5dBuZKY31U2eb/sQ7q4OW9fC6TgkmOPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8V7lVYO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8V7lVYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763608249; x=1795144249;
  h=date:from:to:subject:message-id:mime-version;
  bh=yeNr7LzcXdejL+7KVY/MXU5ADAdB2MampVj/QOQebFw=;
  b=n8V7lVYO7hrV1cMIDZWx7Uy2FWB6AzV4UHAAJXy3O6Z84TojDCJRxGeJ
   XBguuWVDv2J0uowrq5HDOxLtlbtnwcXfXGCAaqiaqEQDXXZtSP+vROX2N
   v6rfFMTPNgOvnHJkQGvRIIoZgbnL+v+m0GZOcne8sHN+f8Tff8vfY754Y
   TTXSmPS84qBeNwbaHU6w/cXip8UhDD5RHb4s7HOW6BMKWlYsRawsKZM8G
   ToQDjzEQV3GtRAXTb4zjD6PCAnCfrFHsQhGogqLLpeZFcAlcZ7sKSvrQ7
   3g73Vb0M7eQVJZzTyvjR+yR9xwoJgWdLZXjEONcOw3xPZoU+A/OSWZqcO
   A==;
X-CSE-ConnectionGUID: WjPOZlQ7Qvah2i2ao58tHw==
X-CSE-MsgGUID: 7rxytMvfTcitaUmqB4FePA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69532795"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="69532795"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 19:10:48 -0800
X-CSE-ConnectionGUID: zYD+mhOITImudCUxYe5fag==
X-CSE-MsgGUID: i8DQzYKRSKmua1iPm/Maug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="190488208"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Nov 2025 19:10:47 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vLv4H-000000001NP-1FYS
	for oe-kbuild@lists.linux.dev;
	Thu, 20 Nov 2025 03:10:45 +0000
Date: Thu, 20 Nov 2025 04:09:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Mark-Harmstone/btrfs-add-definitions-and-constants-for-remap-tree/20251115-030744
 10/16] checkpatch: WARNING:BRACES: braces {} are not necessary for any arm
 of this statement
Message-ID: <202511200437.xTwGzvHq-lkp@intel.com>
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
TO: Mark Harmstone <mark@harmstone.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Mark-Harmstone/btrfs-add-definitions-and-constants-for-remap-tree/20251115-030744
head:   1f7e6feb5bbf14f724eae768e8b48751fc3a9309
commit: f2493f4f5268aab219804677f1386ca879455d53 [10/16] btrfs: handle setting up relocation of block group with remap-tree
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511200437.xTwGzvHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511200437.xTwGzvHq-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#696: FILE: fs/btrfs/relocation.c:4637:
+	if (should_relocate_using_remap_tree(bg)) {
[...]
+	} else {
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
