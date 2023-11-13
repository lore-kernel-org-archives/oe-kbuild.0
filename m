Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058A41C6AC
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xq+kBAvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699879097; x=1731415097;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kW4i/SOz8DbC4ZDvr7+lEePUGun9mZF/QkEc7jqHVb4=;
  b=Xq+kBAvbLDYBnDyMJvyQW1hGnDI+hZ7oICAWjHmUEtBGh42uUzwqwUVk
   6cctsWEcFpa3WqXj/mRsg0vnpvo3F4Xw6hknwA/JX4uVNOGzVXVPAlvQ5
   pL0gcKaI6abEuodrSnhHAsXCM0ZliZkNblGk7NezYnqOCa6I2papqlk8A
   vMg8TuUzOmQcNnCNz1bnzePuX5/gdnkkXfHC5PKjU6L1AZBfyxH3DNyCu
   C82tkXD+tFfajlDjytAXKll+cprP8H+5HxT0YjzSGgB726nv8woCRqU5r
   dUbbVnMu5wRBWwzi/06jdeySAltDJVt5LYFOa7BHP1ioIHBNnZxu8sY8z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="369764431"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="369764431"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 04:38:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="854951099"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="854951099"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2023 04:38:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2WCb-000C6A-1j;
	Mon, 13 Nov 2023 12:38:05 +0000
Date: Mon, 13 Nov 2023 20:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 10/19] KVM: x86: Implement per-guest-page
 permissions
Message-ID: <202311132003.c5QKfbEI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "has kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231113022326.24388-11-mic@digikod.net>
References: <20231113022326.24388-11-mic@digikod.net>
TO: "Mickaël Salaün" <mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-11-mic%40digikod.net
patch subject: [RFC PATCH v2 10/19] KVM: x86: Implement per-guest-page permissions
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-013-20231113 (https://download.01.org/0day-ci/archive/20231113/202311132003.c5QKfbEI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311132003.c5QKfbEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311132003.c5QKfbEI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/lib/kvm_permissions.c: In function 'kvm_permissions_get':
>> arch/x86/kvm/../../../virt/lib/kvm_permissions.c:74:20: error: implicit declaration of function 'kvm_get_memory_attributes' [-Werror=implicit-function-declaration]
      74 |         kvm_attr = kvm_get_memory_attributes(kvm, gfn);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/../../../virt/lib/kvm_permissions.c: In function 'kvm_permissions_set':
>> arch/x86/kvm/../../../virt/lib/kvm_permissions.c:91:13: error: implicit declaration of function 'kvm_range_has_memory_attributes'; did you mean 'kvm_mmu_init_memslot_memory_attributes'? [-Werror=implicit-function-declaration]
      91 |         if (kvm_range_has_memory_attributes(kvm, gfn_start, gfn_end,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             kvm_mmu_init_memslot_memory_attributes
>> arch/x86/kvm/../../../virt/lib/kvm_permissions.c:100:16: error: implicit declaration of function 'kvm_vm_set_mem_attributes' [-Werror=implicit-function-declaration]
     100 |         return kvm_vm_set_mem_attributes(kvm, gfn_start, gfn_end,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kvm_get_memory_attributes +74 arch/x86/kvm/../../../virt/lib/kvm_permissions.c

e677181e18929a Mickaël Salaün 2023-11-12   63  
e677181e18929a Mickaël Salaün 2023-11-12   64  unsigned long kvm_permissions_get(struct kvm *kvm, gfn_t gfn)
e677181e18929a Mickaël Salaün 2023-11-12   65  {
e677181e18929a Mickaël Salaün 2023-11-12   66  	unsigned long kvm_attr = 0;
e677181e18929a Mickaël Salaün 2023-11-12   67  
e677181e18929a Mickaël Salaün 2023-11-12   68  	/*
e677181e18929a Mickaël Salaün 2023-11-12   69  	 * Retrieve the permissions for a guest page. If not present (i.e., no
e677181e18929a Mickaël Salaün 2023-11-12   70  	 * attribute), then return default permissions (RWX).  This means
e677181e18929a Mickaël Salaün 2023-11-12   71  	 * setting permissions to 0 resets them to RWX. We might want to
e677181e18929a Mickaël Salaün 2023-11-12   72  	 * revisit that in a future version.
e677181e18929a Mickaël Salaün 2023-11-12   73  	 */
e677181e18929a Mickaël Salaün 2023-11-12  @74  	kvm_attr = kvm_get_memory_attributes(kvm, gfn);
e677181e18929a Mickaël Salaün 2023-11-12   75  	if (kvm_attr)
e677181e18929a Mickaël Salaün 2023-11-12   76  		return kvm_attr_to_heki_attr(kvm_attr);
e677181e18929a Mickaël Salaün 2023-11-12   77  	else
e677181e18929a Mickaël Salaün 2023-11-12   78  		return kvm_default_permissions;
e677181e18929a Mickaël Salaün 2023-11-12   79  }
e677181e18929a Mickaël Salaün 2023-11-12   80  EXPORT_SYMBOL_GPL(kvm_permissions_get);
e677181e18929a Mickaël Salaün 2023-11-12   81  
e677181e18929a Mickaël Salaün 2023-11-12   82  int kvm_permissions_set(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end,
e677181e18929a Mickaël Salaün 2023-11-12   83  			unsigned long heki_attr)
e677181e18929a Mickaël Salaün 2023-11-12   84  {
e677181e18929a Mickaël Salaün 2023-11-12   85  	if ((heki_attr | MEM_ATTR_PROT) != MEM_ATTR_PROT)
e677181e18929a Mickaël Salaün 2023-11-12   86  		return -EINVAL;
e677181e18929a Mickaël Salaün 2023-11-12   87  
e677181e18929a Mickaël Salaün 2023-11-12   88  	if (gfn_end <= gfn_start)
e677181e18929a Mickaël Salaün 2023-11-12   89  		return -EINVAL;
e677181e18929a Mickaël Salaün 2023-11-12   90  
e677181e18929a Mickaël Salaün 2023-11-12  @91  	if (kvm_range_has_memory_attributes(kvm, gfn_start, gfn_end,
e677181e18929a Mickaël Salaün 2023-11-12   92  					    KVM_MEMORY_ATTRIBUTE_HEKI_IMMUTABLE,
e677181e18929a Mickaël Salaün 2023-11-12   93  					    false)) {
e677181e18929a Mickaël Salaün 2023-11-12   94  		pr_warn_ratelimited(
e677181e18929a Mickaël Salaün 2023-11-12   95  			"Guest tried to change immutable permission for GFNs %llx-%llx\n",
e677181e18929a Mickaël Salaün 2023-11-12   96  			gfn_start, gfn_end);
e677181e18929a Mickaël Salaün 2023-11-12   97  		return -EPERM;
e677181e18929a Mickaël Salaün 2023-11-12   98  	}
e677181e18929a Mickaël Salaün 2023-11-12   99  
e677181e18929a Mickaël Salaün 2023-11-12 @100  	return kvm_vm_set_mem_attributes(kvm, gfn_start, gfn_end,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
