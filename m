Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D07190679
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737359917; cv=none; b=uZX0mEUigrMGS9F+3K5qC7wRRKjQSTo6s1IdHa6pfqWXPdmN4wl/8tIpAthzpaf+/APA5Zn4huvCKpoXY8D0owqPtlQV+3Q8hpIw8eBODIqjKJS525pSR3rkGvYUEtABYOsICpxxr9gCJvFR6CzUrKJhTHrljEkzkMuSAa3lR0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737359917; c=relaxed/simple;
	bh=ZNJ5xqWpNYaeoKu+agXzzSqfH37GaXqab9i1PxDPURw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BXlXlkjPIRFvOQwkvFaY7Q1QP6kLqnEsUhoGku4FHj8XkGvoB78QOlr88nilRVPF7gAguVXqAUWSYMprYKu1bhnFbqzmFh6E0rN/jgaWYv9WgMXd/aHNSPKZhKOSb3h6bI3KExZit+e+xkVvDpFly4aqgJNNpADc4bB45D1AcJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmRzoWSI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmRzoWSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737359915; x=1768895915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNJ5xqWpNYaeoKu+agXzzSqfH37GaXqab9i1PxDPURw=;
  b=LmRzoWSIJm7BFj4lYm0F/zIYiMnFWi3G+lylMA1upelQivnIedPCwLlq
   STxSzabxzgQqBY+fL6C0Tk+45K4Y4ZnpydWxJBV5pt1O34PybWNcZbaG8
   yMPTPtMGSS8uGBEUqvrCiyDfVmPhal6LnywizM0aGMpxZuOJPxbs77RJf
   tuLW4xmF4bYFP+FuI6lG+f+L5CNLTBMdkdMGzxR20/yMzISUOO+ynNBMv
   l8SBEgwrX0aeYK0DnHUtKDrA/wu5SrqUP34c1IjN2suwaBxbY2AOhO6qO
   +F6OiR76VYeJwQu61dnhCNEi+tpxp6MgPa0DKjmsCjENudV2p+AHCxc7L
   A==;
X-CSE-ConnectionGUID: StK1DwBxTCySCEWb9Nxtqw==
X-CSE-MsgGUID: L44dR+OgQpyljXgOJem8Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="55277749"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="55277749"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 23:58:34 -0800
X-CSE-ConnectionGUID: YyaPmFflSI6ezy+2+ArRTQ==
X-CSE-MsgGUID: /xKVWse/Qj+2pjeQDtzjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111411403"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jan 2025 23:58:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZmg2-000WL9-2s;
	Mon, 20 Jan 2025 07:58:30 +0000
Date: Mon, 20 Jan 2025 15:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V7 1/5] interconnect: core: Add dynamic id allocation
 support
Message-ID: <202501201530.UTAPd4lC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250111161429.51-2-quic_rlaggysh@quicinc.com>
References: <20250111161429.51-2-quic_rlaggysh@quicinc.com>
TO: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
TO: Georgi Djakov <djakov@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Odelu Kukatla <quic_okukatla@quicinc.com>
TO: Mike Tipton <mdptipton@quicinc.com>
TO: Vivek Aknurwar <viveka@quicinc.com>
CC: Sibi Sankar <quic_sibis@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Raviteja,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.13 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raviteja-Laggyshetty/interconnect-core-Add-dynamic-id-allocation-support/20250112-001756
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250111161429.51-2-quic_rlaggysh%40quicinc.com
patch subject: [PATCH V7 1/5] interconnect: core: Add dynamic id allocation support
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-r072-20250118 (https://download.01.org/0day-ci/archive/20250120/202501201530.UTAPd4lC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501201530.UTAPd4lC-lkp@intel.com/

smatch warnings:
drivers/interconnect/core.c:889 icc_node_create_alloc_id() warn: inconsistent returns 'global &icc_lock'.

vim +889 drivers/interconnect/core.c

11f1ceca7031de Georgi Djakov        2019-01-16  860  
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  861  /**
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  862   * icc_node_create_alloc_id() - create node and dynamically allocate id
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  863   * @start_id: min id to be allocated
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  864   *
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  865   * Return: icc_node pointer on success, or ERR_PTR() on error
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  866   */
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  867  struct icc_node *icc_node_create_alloc_id(int start_id)
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  868  {
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  869  	struct icc_node *node;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  870  	int id;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  871  
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  872  	mutex_lock(&icc_lock);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  873  
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  874  	node = kzalloc(sizeof(*node), GFP_KERNEL);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  875  	if (!node)
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  876  		return ERR_PTR(-ENOMEM);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  877  
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  878  	id = idr_alloc(&icc_idr, node, start_id, 0, GFP_KERNEL);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  879  	if (id < 0) {
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  880  		WARN(1, "%s: couldn't get idr\n", __func__);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  881  		kfree(node);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  882  		node = ERR_PTR(id);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  883  		goto out;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  884  	}
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  885  	node->id = id;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  886  out:
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  887  	mutex_unlock(&icc_lock);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  888  
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11 @889  	return node;
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  890  }
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  891  EXPORT_SYMBOL_GPL(icc_node_create_alloc_id);
65971f5d716cb8 Raviteja Laggyshetty 2025-01-11  892  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
