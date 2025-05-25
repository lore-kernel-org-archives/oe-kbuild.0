Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA93360
	for <oe-kbuild@lists.linux.dev>; Sun, 25 May 2025 01:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748135157; cv=none; b=J6NCjWJU1DHGUGrJI6MEhNaj8XGk89zfYas2K+QLldZGZBLlWWXIQ5kkmpg/SfzlCtiPyJU/4gQNOnp0QpjT8mDXp+VGh2ycFqCt9bqCX15S4o0JxkZxyHHlz/UwudjlyZIlbkdPTAXrvAuHFsxKTLvm+0PRmLPrRHfnAek0fgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748135157; c=relaxed/simple;
	bh=E3hH+Xyckm3bU8pSh/9Ey+WeneO0ygWI4Gz/HysbQ9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOAK56zqKe7eRm+pgmOtE7Sf62D0O4r2+YpJk5Wkmcgnbs4HlXNCSk6KYu54in+2qW9M/pHa3QdDiD4VfaFpK7rVdz83kmYJJ7HNuZwfmhL1rwUhm/ZaxFD0FfldkfHRtAJ3RPDc7sjIEjlAWquYy7CZNKuskNdCKctbCr9qLCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QflOd601; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QflOd601"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748135154; x=1779671154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3hH+Xyckm3bU8pSh/9Ey+WeneO0ygWI4Gz/HysbQ9o=;
  b=QflOd601lmGgG9DLYOGTtWOezaXEmSAq8xOFJlMJKzwk7bfe5Q7kJzH8
   cbWIwMVSKCRUFbSnaF/4pxEJhKrjowyrKAzK5VSX6E1hFb9iJ/YRzxRVH
   oxJODv04Lv5jMMmjrpqsvDgD4Uj9znkVYyyDza5PD+bSyjO9ULhF811u6
   G0GXk+6VO6VVSo/Ik/fQXiO6pj8XcYg+1DsGmCZTyHkwgVFoKJjkS9XNL
   C/v536YLMyCMMbM+A422QVT4Szm9Ym9F7qWBGFNqrEH+f6jVsVv92hc+T
   +FAIq/YnqGBnEQA/hQr+ppghGikPd4Gpy0ZC5lahgy6JdAqJYSddr/7hA
   w==;
X-CSE-ConnectionGUID: GE62hz4qQWicsnZSv5HNow==
X-CSE-MsgGUID: HDyFvxA9TjCA6wCqD7RGcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="72673846"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="72673846"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 18:05:53 -0700
X-CSE-ConnectionGUID: hdTFGTZUScCDdpv0BCH56Q==
X-CSE-MsgGUID: c6/FaNJORTmeyfek5QYqhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="142693333"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 May 2025 18:05:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIzoE-000RXw-0s;
	Sun, 25 May 2025 01:05:50 +0000
Date: Sun, 25 May 2025 09:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-wired-lan] [PATCH net-next v4 2/3] dpll: add reference
 sync get/set
Message-ID: <202505250848.GBC8s5Wc-lkp@intel.com>
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
In-Reply-To: <20250523172650.1517164-3-arkadiusz.kubalewski@intel.com>
References: <20250523172650.1517164-3-arkadiusz.kubalewski@intel.com>
TO: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
TO: donald.hunter@gmail.com
TO: kuba@kernel.org
TO: davem@davemloft.net
TO: edumazet@google.com
TO: pabeni@redhat.com
TO: horms@kernel.org
TO: vadim.fedorenko@linux.dev
TO: jiri@resnulli.us
TO: anthony.l.nguyen@intel.com
TO: przemyslaw.kitszel@intel.com
TO: andrew+netdev@lunn.ch
TO: aleksandr.loktionov@intel.com
TO: corbet@lwn.net
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: intel-wired-lan@lists.osuosl.org
CC: linux-rdma@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
CC: Milena Olech <milena.olech@intel.com>

Hi Arkadiusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ea15e046263b19e91ffd827645ae5dfa44ebd044]

url:    https://github.com/intel-lab-lkp/linux/commits/Arkadiusz-Kubalewski/dpll-add-reference-sync-netlink-attribute/20250524-013615
base:   ea15e046263b19e91ffd827645ae5dfa44ebd044
patch link:    https://lore.kernel.org/r/20250523172650.1517164-3-arkadiusz.kubalewski%40intel.com
patch subject: [Intel-wired-lan] [PATCH net-next v4 2/3] dpll: add reference sync get/set
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20250524 (https://download.01.org/0day-ci/archive/20250525/202505250848.GBC8s5Wc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505250848.GBC8s5Wc-lkp@intel.com/

New smatch warnings:
drivers/dpll/dpll_core.c:670 dpll_pin_ref_sync_pair_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:998 dpll_pin_ref_sync_state_set() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/dpll/dpll_core.c:82 dpll_xa_ref_pin_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:134 dpll_xa_ref_pin_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:163 dpll_xa_ref_dpll_add() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:215 dpll_xa_ref_dpll_del() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:235 dpll_xa_ref_dpll_first() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:568 dpll_pin_get() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:764 dpll_pin_on_pin_register() warn: iterator 'i' not incremented
drivers/dpll/dpll_core.c:798 dpll_pin_on_pin_unregister() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:62 dpll_pin_available() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:846 dpll_pin_freq_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1061 dpll_pin_on_pin_state_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1219 dpll_pin_phase_adj_set() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1366 dpll_pin_find() warn: iterator 'i' not incremented
drivers/dpll/dpll_netlink.c:1569 dpll_device_find() warn: iterator 'i' not incremented

vim +/i +670 drivers/dpll/dpll_core.c

9431063ad323ac Vadim Fedorenko      2023-09-13  664  
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  665  static void dpll_pin_ref_sync_pair_del(u32 ref_sync_pin_id)
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  666  {
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  667  	struct dpll_pin *pin, *ref_sync_pin;
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  668  	unsigned long i;
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  669  
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23 @670  	xa_for_each(&dpll_pin_xa, i, pin) {
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  671  		ref_sync_pin = xa_load(&pin->ref_sync_pins, ref_sync_pin_id);
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  672  		if (ref_sync_pin) {
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  673  			xa_erase(&pin->ref_sync_pins, ref_sync_pin_id);
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  674  			__dpll_pin_change_ntf(pin);
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  675  		}
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  676  	}
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  677  }
d487dd9d1b2560 Arkadiusz Kubalewski 2025-05-23  678  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
