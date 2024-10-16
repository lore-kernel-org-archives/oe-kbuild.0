Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BA1205E05
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071370; cv=none; b=I+GSEiAB0bYjG+f/qeehKRcZGc8pidREP0wX4dH+5MS/ZNYb463GahBNyNxEFN8/jw6Z4sokd+JsEIySMmYe2FPchbcsWJsiaOZmjEUHIOWZ2qrBj4hOt23ehEV+daJ/VrLwjcBttSS1fuv3tKzOe+vQ9xg4/AkDr5Em7KIi9QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071370; c=relaxed/simple;
	bh=rOJPeWW9Wi9blqPXjLlFRiIiWdsx3j5kWoztGCYlm+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K0RUtDvATVQRUBa3VdzsaDcawQigNqnNtuiP0/rK1hdNWdwtq+iB6LLeFaITVyC1/+2ZzHy3gZkJlzkpOkY4TFF9PJ2h4ogIfhVdAJCj5jRNMleWsBZ1AhE8EscUrdoQHgf9Lv4ymhit1lY8aa6z52QfCQV+mucXQvDAKLSyRn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ckc0uWwD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ckc0uWwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729071367; x=1760607367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rOJPeWW9Wi9blqPXjLlFRiIiWdsx3j5kWoztGCYlm+w=;
  b=Ckc0uWwDKfxdpjBcDfXVKvuyjAa+Ywe4sDdOv/yE8Oze2MSg2Ngb7DZp
   d8d1LnT5oLhBonqNDOtAcujNWqSovjY3kD7CBfQ2H/f40koYNQVJGNC1K
   DPsWew9EE5cExEFheYUFRKEBhPSJ4M5PnTGs8klJGu36AMsBJOnGOkjpT
   ExVTOb0iRWSIrNg9AQcUaIBCpRrrGRjphX3sWVwDCUSzPBdzyYJ3DKx0u
   TUgDtj2LzfmdN+g9i3XpX53evMvUafpUt8ePu0aVKwAxnHm2/iqs4BrX2
   /5sfv7ml5tRw88ULo7hvSL4K3AfK0D9/olmZz45eIzmV1db81XfEmOp74
   g==;
X-CSE-ConnectionGUID: N2h8jn+JRq2CdAny5P42rQ==
X-CSE-MsgGUID: cz83Il+hRryy1qrzC38L2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="31376579"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="31376579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 02:36:04 -0700
X-CSE-ConnectionGUID: 6/3znowLTxS30JlavoRcnw==
X-CSE-MsgGUID: aF+ePMsNR8eBok/q8l6meQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="115618434"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2024 02:36:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t10Rk-000KhJ-2f;
	Wed, 16 Oct 2024 09:36:00 +0000
Date: Wed, 16 Oct 2024 17:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] kbuild: Restore the ability to build out of tree dtbs
Message-ID: <202410161727.9NhOH6LQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241015212830.3899891-1-chris.packham@alliedtelesis.co.nz>
References: <20241015212830.3899891-1-chris.packham@alliedtelesis.co.nz>
TO: Chris Packham <chris.packham@alliedtelesis.co.nz>
TO: masahiroy@kernel.org
TO: nathan@kernel.org
TO: nicolas@fjasle.eu
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Chris Packham <chris.packham@alliedtelesis.co.nz>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.12-rc3 next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/kbuild-Restore-the-ability-to-build-out-of-tree-dtbs/20241016-053034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20241015212830.3899891-1-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH] kbuild: Restore the ability to build out of tree dtbs
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20241016/202410161727.9NhOH6LQ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161727.9NhOH6LQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410161727.9NhOH6LQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/of/empty_root.dtb.o', needed by 'drivers/of/built-in.a'.
   make[5]: Target 'drivers/of/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
