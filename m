Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098833FE02
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764186269; cv=none; b=MrYmR5cRyd5VWVHzqwe6qMXhrM3rwpA3+GyUAWk+SUMi4da2LwnJBUEVEpvE5Qnwi54PBVDNQ90T7itsbPLzcQszf9wbkUbewRzlYANiNGxFk3S2PvF80b2V5OkmZE+l+LrY3aY3CedyH+NBmrVgpbryMLvZNytnIwHs2W3BAZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764186269; c=relaxed/simple;
	bh=o5wWkN3ubjdEWKrYR3+rhFcXKAOYAFR5LRkqOApJfR4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/ZEHfBnGHPBbZZWuTYjxoe0MY4sRFcqEpClM+sAfm7Em5mtvJo3VgIvYEeG3Z9P2M4HWDSt1BGwMcASl5yWffo/Wf9P2n9+Oc7oHb4pnJb91bFO3pcGhN/p7Zb+q/10lHpfADsZTHxCBBhwxVR9Av0ZW5qRDhDYPIfzFJZsPkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVwMjfxz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVwMjfxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764186269; x=1795722269;
  h=date:from:to:subject:message-id:mime-version;
  bh=o5wWkN3ubjdEWKrYR3+rhFcXKAOYAFR5LRkqOApJfR4=;
  b=YVwMjfxz9ZJEJjl0yZORD2CZp+HhrEXqgVBRiHkBbly/It0FRxqLz5oa
   6lmYkdEJwmQAK0Wg4pTu17wMnI1sm0fkE0rJdktBFt6FCMdD/qSTeg2t6
   2+xSePz49AYgdIxtTQj3uAsoI4xM9h89uiBX5o7lYBvjd8cuzrVg6aY+R
   JpoRoYFjyr9m/Ch/h7evadXzWOHlaQBsU9XwSPnSbo8AmrjsKgNarOi8O
   hhHRKaiqAtiEmc0AaCgLl8pcMwMIoFLAweTmBJ4whmyAoGKE/2jOWzL9+
   Emd0SbxjnVNmt3xCDQ0ZoQWnOiaJXxR+6jIhmM9UEO6oNYpTbwfwRj+8/
   g==;
X-CSE-ConnectionGUID: 1rOtqGW+TVWvvGUmAJDtXQ==
X-CSE-MsgGUID: f262F1/hR1i8xz2RH3Wr3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76919458"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76919458"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:44:26 -0800
X-CSE-ConnectionGUID: wsAYu3p8TrOAL5DCqi4dpA==
X-CSE-MsgGUID: Kz2fni3VQyKxo0K6dl+IHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192162474"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2025 11:44:26 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLR9-000000001P4-15LI
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:44:23 +0000
Date: Wed, 26 Nov 2025 20:44:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 574/999] checkpatch: ERROR:SPACING: space required
 after that ',' (ctx:VxV)
Message-ID: <202511262053.xvQJnnxi-lkp@intel.com>
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
commit: 33b57d5d4a4ce695d228a1b896b5cfebb2cfb914 [574/999] bcachefs: __bch2_darray_resize_noprof: support > 6.17
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262053.xvQJnnxi-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#27: FILE: fs/bcachefs/util/darray.c:27:
+#if LINUX_VERSION_CODE <= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#27: FILE: fs/bcachefs/util/darray.c:27:
+#if LINUX_VERSION_CODE <= KERNEL_VERSION(6,17,0)
                                              ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
