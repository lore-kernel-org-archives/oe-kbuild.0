Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52828273D77
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 02:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771556158; cv=none; b=DNuqAKjvlzB8aVBdCxLSZ0VbQSSpZuwsDdXgNMIONNGYT8f6PAASKcGig+hbVxRr4C6dBjgDZqVdSl2Il6W2oDYkKYgm8jGRTGP09l2rmhULQPnrKdf77os4IJ8jSh/+npl17fHNX9C+U9r4zhspCJC9/nxEVctlRW7m1HLXKEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771556158; c=relaxed/simple;
	bh=i98LVfCUCOwXYnlhj8wp98CWDoD/h4ZUQ8LzTtyJuJQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=df30k5Y1NpqkdJ+O3SwVpj+omMgRb9b4YgFNf/jW6ef8vlem42PjGIz4q6OEZPdZNMMFnCHfYO/3fPqgrG3PCchIKASYmu+IeyZWdpVn4Vuiqb0RKuh9fozNccpvyqO+T7aeB3nEiCtjeDGa9FCN6BN+nVrH3PgC3MjEcXe1rYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zn9fWLyO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zn9fWLyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771556157; x=1803092157;
  h=date:from:to:subject:message-id:mime-version;
  bh=i98LVfCUCOwXYnlhj8wp98CWDoD/h4ZUQ8LzTtyJuJQ=;
  b=Zn9fWLyOsOMzLCFXo6Eo0A96yahlLEBfyvtx324O58qzM4Ob0ldWqEs/
   r1iRIWGA97fADzcbi5wC3MHEoSRJNTS4ka+vEBhFpLl0Quxh7XnlHJEVp
   9Gv208cVWRFRAcT30+nakIKs7WvQHJP79NBmCyx2H+p9BZkjqk5j9JLgA
   Zp0tZk4xKvQD/27Jyy01G4VWAtdmo+2Y8XYk7awutR7sfsOjG1bSBbVUj
   clbJSvC5dOoM4L0hlyPwi8XzdKi74F77WvTp7TiH8nD7vJidLROocZjIO
   bsnYNmeQoMztTnQU9dKNOSB6oRY2l5TUULzOdwU5ojNHUom6xx/w7LzoG
   A==;
X-CSE-ConnectionGUID: 6hxgzB0HSBOVKngWGAGPUA==
X-CSE-MsgGUID: wD3FN5dGSJ61pNljzwXciA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72714139"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72714139"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 18:55:57 -0800
X-CSE-ConnectionGUID: I0wreDx8Tz+0T4fIo7+Igg==
X-CSE-MsgGUID: 4qRqFZhmQxK9Z3I0Rh+zHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="212895181"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2026 18:55:46 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtGgC-0000000047r-1wLI
	for oe-kbuild@lists.linux.dev;
	Fri, 20 Feb 2026 02:55:44 +0000
Date: Fri, 20 Feb 2026 03:55:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH mptcp-net 2/2] mptcp: pm: avoid sending RM_ADDR over same
 subflow
Message-ID: <202602200347.1vfhOBxu-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260219-mptcp-issue-612-v1-2-839e20d96fe7@kernel.org>
References: <20260219-mptcp-issue-612-v1-2-839e20d96fe7@kernel.org>
TO: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
TO: MPTCP Upstream <mptcp@lists.linux.dev>

Hi Matthieu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9bf535999bf8e23b5f38fffb1a7ae7ee73115e98]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthieu-Baerts-NGI0/mptcp-pm-avoid-sending-RM_ADDR-over-same-subflow/20260220-030340
base:   9bf535999bf8e23b5f38fffb1a7ae7ee73115e98
patch link:    https://lore.kernel.org/r/20260219-mptcp-issue-612-v1-2-839e20d96fe7%40kernel.org
patch subject: [PATCH mptcp-net 2/2] mptcp: pm: avoid sending RM_ADDR over same subflow
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260220/202602200347.1vfhOBxu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Frank Lorenz'
#22: 
Reported-by: Frank Lorenz

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
