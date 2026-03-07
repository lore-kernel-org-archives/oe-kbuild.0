Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A984C3074AE
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772866750; cv=none; b=XrvAA1lL3ga+6YatARIhqsjA7+RRkemv2koaVhnn2pWQmbTCyy9hIco197/Djw0PBaxOpCmnYXCaUq7JOVnzbaHp3W0GM/NxwR6v85VHfyxZujOjN6M9AbQLEGhjaSN3VFypOeTiUJONvbqYbKu7U/NVFw81diUxb1PHm7lWQz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772866750; c=relaxed/simple;
	bh=nVQn9J7CUcNNK40FWUEfebvYDP5p1wKNN0F4g2vDTAM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0hFoNYFVd8YdJEBlthAOksn8odgM9oq6OIXRTMGrC8hJ4JJZgmAAj5BK9CgjuvFyIE30cDYI7MhT1rFhgKjW9IHpLQc+GRlDwve2fowiu7ke2wHyDHN3zSKQqz0FCy0icrx+hzfJ7QCNOcIeFKYDO8dQr08doPI9zW8FEiPJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiO5foYV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiO5foYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772866749; x=1804402749;
  h=date:from:to:subject:message-id:mime-version;
  bh=nVQn9J7CUcNNK40FWUEfebvYDP5p1wKNN0F4g2vDTAM=;
  b=SiO5foYVQzkRPVEsxyAxvlhe1QWKrKsNgC93xg2L+pKReEPdaGJR0HA1
   WD/wZLanUelqBShAiEwVsVuzxYlnz4dEiutOddNeZBDmi7fGqA+/6oZsj
   ZeD7P2GVQSw3SxSjKy5Y/db+SsSa+18FPJ4S/sSVeshebnDBAQ89tnF2/
   YBK+tJmmZhagihtEEUnmfUC689zx0FhwXP01clmsOKIBYENfTI5SHgDun
   4d9Rwb8jqHOhwopEjEZ3LDEbF2K2DuJT6hLwDBsyts1de2jehiIyKD5c0
   TVhPgAd68lvpBTKPBkOy7B/LrV7X3ej4vkArRdsaTHXGKDaF4YFjgiRb7
   Q==;
X-CSE-ConnectionGUID: Fe9i0wWNTuGnFAKGF6o27A==
X-CSE-MsgGUID: O9bY+dGSQ3ugJji8X0onUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73166487"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73166487"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 22:59:08 -0800
X-CSE-ConnectionGUID: MJLXYlU1RyqblDu6RHqTRQ==
X-CSE-MsgGUID: esX+EmJ0T5mC6XRd4Xg75A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="257144152"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2026 22:59:07 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vylcu-000000002RR-28Fb
	for oe-kbuild@lists.linux.dev;
	Sat, 07 Mar 2026 06:59:04 +0000
Date: Sat, 7 Mar 2026 07:58:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 2/3] bpf: introduce bpf_jit_insn_aux_data
Message-ID: <202603070734.2XCn0clD-lkp@intel.com>
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
In-Reply-To: <20260306221330.630971-3-yeoreum.yun@arm.com>
References: <20260306221330.630971-3-yeoreum.yun@arm.com>
TO: Yeoreum Yun <yeoreum.yun@arm.com>
TO: bpf@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org

Hi Yeoreum,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/net]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yeoreum-Yun/bpf-introduce-gotox_point-in-bpf_insn_aux_data/20260307-061908
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/20260306221330.630971-3-yeoreum.yun%40arm.com
patch subject: [PATCH 2/3] bpf: introduce bpf_jit_insn_aux_data
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260307/202603070734.2XCn0clD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#209: FILE: kernel/bpf/verifier.c:23003:
+			func[i]->aux->insn_aux_data = NULL;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
