Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC13BC682
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749520; cv=none; b=B/sQ6UWm6SI9o4ZrrwXFXnFKMNLAkbTohfGGnRVxTxHK5PuNuodR1yIEOOy7XA5a6MTgFM175c8efok7CWgAgfHCBwLlaJd0CsSGoJDUJvcVSLSNh6ZeH8SRSD0UrzJx++ch2d3Rvn2boZWahf47Jwsry5eihawG2PsusxnTxAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749520; c=relaxed/simple;
	bh=VAlzOgBszD08uOwsORqZlnEuZMxKQhdGIcUo5djFEwA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ip05jgopOcpsfQOKK1ne9ULfddvmcTLFKT7N55G61Grhw/f99kGdsLKAz+hbOQTVvg+e4p5Bk5uoL8xFZPwhfFkhP8WtMpZ2nAl/Ui4wzH0esKajI/4joMO9ZVwTqxioGazaQu9NgW/z2s/L9pNqMOZlaUYJkyMcUGt4KEUfRrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOQIbV7H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOQIbV7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773749518; x=1805285518;
  h=date:from:to:subject:message-id:mime-version;
  bh=VAlzOgBszD08uOwsORqZlnEuZMxKQhdGIcUo5djFEwA=;
  b=FOQIbV7HWYWveJRq4Hz5+jIjKJ7wfbAK3V8aWso7pYWKQdIjALcXtSyA
   04vnA6lGfQ/a7KVY9muQ3HDb11XgOpWhQGrexsCicU0vtjaSkGHVV+GMy
   rKrHYtwIZIMznhPtqOl07advGg1Y2BfGHR3wsLS8gVowD66NkSal2sYV3
   oySelBktuwoer+yIhG15EImmOpqAjdFtDh7xc73A+vWSkmyxE2nw+QwPt
   DHmD0REALnwfSqbzMp1+FaN+heI5mZAUDYfgvpznHFXQBNRMf1QBOl2KS
   aAB/AMiuN+BF7FoW7WsZEvbyxl6KK5I5kK9X+7IjxUihvwPbJeA8k/mFF
   w==;
X-CSE-ConnectionGUID: EJ0CmEhRR2C+IqzJcYrHgg==
X-CSE-MsgGUID: WZrxmXqcTUOj4/s34nHkug==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92162704"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="92162704"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:11:57 -0700
X-CSE-ConnectionGUID: DOBhBWM7S1a+sp9we/SuPA==
X-CSE-MsgGUID: ErjVtmeASau74eQ7kKt1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="219752294"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 17 Mar 2026 05:11:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2TH8-000000004Qj-1orN
	for oe-kbuild@lists.linux.dev;
	Tue, 17 Mar 2026 12:11:54 +0000
Date: Tue, 17 Mar 2026 13:11:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] workqueue: check for NULL wq in queue_delayed_work_on()
Message-ID: <202603171334.DwWhBDi0-lkp@intel.com>
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
In-Reply-To: <20260316180300.66423-1-ttdxba@gmail.com>
References: <20260316180300.66423-1-ttdxba@gmail.com>
TO: baichen <ttdxba@gmail.com>
TO: linux-kernel@vger.kernel.org

Hi baichen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/baichen/workqueue-check-for-NULL-wq-in-queue_delayed_work_on/20260317-023327
base:   v7.0-rc2
patch link:    https://lore.kernel.org/r/20260316180300.66423-1-ttdxba%40gmail.com
patch subject: [PATCH] workqueue: check for NULL wq in queue_delayed_work_on()
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260317/202603171334.DwWhBDi0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Tejun Heo <tj@kernel.org>,', should be: 'Tejun Heo <tj@kernel.org>'
#19: 
Cc: Tejun Heo <tj@kernel.org>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
