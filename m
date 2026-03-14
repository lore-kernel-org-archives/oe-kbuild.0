Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339AC288D6
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Mar 2026 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773488484; cv=none; b=H3UlOF0+NPlcEASl/TeTuE8fh1ZOlV/Ly5jhrMZG9qG6kgtXBcJaYZpkWmdDhuVvPGT+7wfhQAMr4lheucWDqQNkZ6PHoxlXSr3oQJqGYkxRuLGg+Tt5imOH1RnWkGZrtF5JKPb7Q9kVgMnA+hm6dHcOTGwP0lMmHad9A7nFO/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773488484; c=relaxed/simple;
	bh=3svl58k4POPg9viHspMZZ2eEhdSoH73uErJ0928chj0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FYC+cQBxCn02R/vIg5YLm+TQ34vnUNDK/83lPdkaZdGV+eVDEpp1gx9wEcM4P95NPxpfekLrNocY1eieTHy84QbIT9LweMpYNijUyeTl5pr0qjsK7z0t1iIZs7q/Xxb+ocxhkmU1r3LQVMDG0lv99V3fzdPtbo1kM0g6Jni4Oh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GY/M9y9q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GY/M9y9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773488482; x=1805024482;
  h=date:from:to:subject:message-id:mime-version;
  bh=3svl58k4POPg9viHspMZZ2eEhdSoH73uErJ0928chj0=;
  b=GY/M9y9qUhQOSqPlv4UBmTPeHvdcd4hkRX/1SQIS+8QQT5Np837xlmCb
   pdndMmsw1xH8rIKVsTpalFAjq4DjI9OL39DzubzmoEaFpbmaONBCS6SUI
   2AFEFM02TagaYyuHrT+hbV7qbLhmNVWlgESEdnILcszD67mdd/AxmJO/B
   /OY4EgmKEteZ4O02UiQcrAY9/d2S5wyUXYRPbdAXjEcpDLoSjDuhszmU7
   mGbKyFkHWS1VJxkHsU9fzuKQJ8cHyf6Zedrjlm3TnQ6PodFKB+FEoQCB7
   nVuyEFazEq8QJ+IOJz7X/tIFoKLqzrzffNsz0sYN+ikxEpu1YW2c44IhW
   Q==;
X-CSE-ConnectionGUID: ee2+iI+sRymR+gdu+EJigA==
X-CSE-MsgGUID: 2JZcWcYrTqGa75/CDi/Azw==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="85932279"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="85932279"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 04:41:21 -0700
X-CSE-ConnectionGUID: OdtU/M8mTWed+oIdTH/6sw==
X-CSE-MsgGUID: JfFpKADsQYCf1W6s7/ud+g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Mar 2026 04:41:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1NMs-000000003mr-2nGa
	for oe-kbuild@lists.linux.dev;
	Sat, 14 Mar 2026 11:41:18 +0000
Date: Sat, 14 Mar 2026 12:40:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 6/7] of: reserved_mem: clarify fdt_scan_reserved_mem*()
 functions
Message-ID: <202603141255.3uCg3tGD-lkp@intel.com>
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
In-Reply-To: <20260313150802.1121442-7-m.szyprowski@samsung.com>
References: <20260313150802.1121442-7-m.szyprowski@samsung.com>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Saravana Kannan <saravanak@kernel.org>
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-mm@kvack.org
TO: iommu@lists.linux.dev

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Szyprowski/of-reserved_mem-remove-fdt-node-from-the-structure/20260314-023123
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260313150802.1121442-7-m.szyprowski%40samsung.com
patch subject: [PATCH 6/7] of: reserved_mem: clarify fdt_scan_reserved_mem*() functions
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260314/202603141255.3uCg3tGD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#62: FILE: drivers/of/of_reserved_mem.c:272:
+ * This function is used to scan again through the DT and initialize the
+ * the "static" reserved memory regions, that are defined using the "reg"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
