Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D301E7C18
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Oct 2025 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759576511; cv=none; b=NH3aSdpcGAkw/olvjZBad8H2grPpk/GgXwzwhE1QYdHgbJHMiH9IQ1hfxqZi21SM2Wa697aBYPyh+vVqwvZ+KOQBoIRu9CH9jszQ44oS/L2mF8Y0dxaeBLLe2czp/4cL0kQqMo6c8K64rkiqlAWxesE+oCKQL28GPzmaaoCYWeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759576511; c=relaxed/simple;
	bh=5WIhmUM1SzGv0eCuuZPLCX2dMKWhuPbuMxCh/EDfZYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1l73tskz5xCKr7v7ZLHceRzzFI2Cn+PjE9oZFzOw28NHSh7NeWRsYPcBq35Mwkgz2HdyeYnPBvygwJ9MiG6grNEmvfsfqHhonx148kIrQHpyGBI27tLZF0IQ0FyEQp5RT8AZ68Hu7A8Fm8Tbdf0OnasSqE/8J9Etq76tKpCHEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxcyqcDq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxcyqcDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759576509; x=1791112509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WIhmUM1SzGv0eCuuZPLCX2dMKWhuPbuMxCh/EDfZYQ=;
  b=IxcyqcDq6eEkyoEvBPx5XC4H3FPUhz1Ngu7TOAACx6uHLThlSU2Lwzqg
   wUP6HA++nMjpdzXEkkbP1HdGLuOI6LywHOvuw1BJNNOm+OqGWm3ym/GLU
   En1zJ/HkC7+M2GCGTlQ8JheQIgxvCjm8BIBLFLUaJZ0AUkNlx8J0bEfOX
   Sl5qdVbme3KAVcFcZmYhYw2l9N+IhroB39MUPO/K5eMFDdwZvrcwJdBIy
   /FLnLfcuzRKB7fHTdwQ2a/J9sKoUKR/XtptzvBSXyQo0Gk7ogmzmazFF0
   GWUCNkrhZdJA5J7y2qltbzA1KI3RSmgV7e6SbpQMUgJyHaot8t1LcynvB
   g==;
X-CSE-ConnectionGUID: n6W8ELZdTmeqVeKJJnjXFg==
X-CSE-MsgGUID: mPxns+55QNCa9MCN+Z4Szg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72512933"
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; 
   d="scan'208";a="72512933"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 04:15:07 -0700
X-CSE-ConnectionGUID: J20xWzvqTy6trz+02uQPKA==
X-CSE-MsgGUID: 3l9z3qz/TBG4kvFPAXn2mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; 
   d="scan'208";a="179097145"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Oct 2025 04:15:05 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v50EA-0005Ex-35;
	Sat, 04 Oct 2025 11:15:02 +0000
Date: Sat, 4 Oct 2025 19:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] KVM: For manual-protect GET_DIRTY_LOG, do not hold
 slots lock
Message-ID: <202510041919.LaZWBcDN-lkp@intel.com>
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
In-Reply-To: <20250930172850.598938-1-jthoughton@google.com>
References: <20250930172850.598938-1-jthoughton@google.com>
TO: James Houghton <jthoughton@google.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: Sean Christopherson <seanjc@google.com>
CC: James Houghton <jthoughton@google.com>
CC: kvm@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a6ad54137af92535cfe32e19e5f3bc1bb7dbd383]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Houghton/KVM-selftests-Add-parallel-KVM_GET_DIRTY_LOG-to-dirty_log_perf_test/20251001-013306
base:   a6ad54137af92535cfe32e19e5f3bc1bb7dbd383
patch link:    https://lore.kernel.org/r/20250930172850.598938-1-jthoughton%40google.com
patch subject: [PATCH 1/2] KVM: For manual-protect GET_DIRTY_LOG, do not hold slots lock
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041919.LaZWBcDN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510041919.LaZWBcDN-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/../../../virt/kvm/kvm_main.c:2290 kvm_get_dirty_log_protect() error: uninitialized symbol 'flush'.

Old smatch warnings:
arch/x86/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
arch/x86/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
include/linux/kvm_host.h:1012 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:5005 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:6136 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/x86/kvm/../../../virt/kvm/kvm_main.c:6147 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/flush +2290 arch/x86/kvm/../../../virt/kvm/kvm_main.c

6aa8b732ca01c3d drivers/kvm/kvm_main.c Avi Kivity          2006-12-10  2196  
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2197  #else /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2198  /**
b8b002209c06127 virt/kvm/kvm_main.c    Jiang Biao          2019-04-23  2199   * kvm_get_dirty_log_protect - get a snapshot of dirty pages
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2200   *	and reenable dirty page tracking for the corresponding pages.
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2201   * @kvm:	pointer to kvm instance
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2202   * @log:	slot id and address to which we copy the log
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2203   *
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2204   * We need to keep it in mind that VCPU threads can write to the bitmap
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2205   * concurrently. So, to avoid losing track of dirty pages we keep the
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2206   * following order:
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2207   *
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2208   *    1. Take a snapshot of the bit and clear it if needed.
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2209   *    2. Write protect the corresponding page.
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2210   *    3. Copy the snapshot to the userspace.
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2211   *    4. Upon return caller flushes TLB's if needed.
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2212   *
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2213   * Between 2 and 4, the guest may write to the page using the remaining TLB
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2214   * entry.  This is not a problem because the page is reported dirty using
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2215   * the snapshot taken before and step 4 ensures that writes done after
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2216   * exiting to userspace will be logged for the next call.
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2217   *
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2218   */
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2219  static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log,
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2220  				     bool protect)
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2221  {
9f6b8029787bb37 virt/kvm/kvm_main.c    Paolo Bonzini       2015-05-17  2222  	struct kvm_memslots *slots;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2223  	struct kvm_memory_slot *memslot;
58d6db349172786 virt/kvm/kvm_main.c    Markus Elfring      2017-01-22  2224  	int i, as_id, id;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2225  	unsigned long n;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2226  	unsigned long *dirty_bitmap;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2227  	unsigned long *dirty_bitmap_buffer;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2228  
86bdf3ebcfe1ded virt/kvm/kvm_main.c    Gavin Shan          2022-11-10  2229  	/* Dirty ring tracking may be exclusive to dirty log tracking */
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2230  	if (!kvm_use_dirty_bitmap(kvm, !protect))
b2cc64c4f3829c2 virt/kvm/kvm_main.c    Peter Xu            2020-09-30  2231  		return -ENXIO;
b2cc64c4f3829c2 virt/kvm/kvm_main.c    Peter Xu            2020-09-30  2232  
f481b069e674378 virt/kvm/kvm_main.c    Paolo Bonzini       2015-05-17  2233  	as_id = log->slot >> 16;
f481b069e674378 virt/kvm/kvm_main.c    Paolo Bonzini       2015-05-17  2234  	id = (u16)log->slot;
eed52e434bc3360 virt/kvm/kvm_main.c    Sean Christopherson 2023-10-27  2235  	if (as_id >= kvm_arch_nr_memslot_as_ids(kvm) || id >= KVM_USER_MEM_SLOTS)
58d6db349172786 virt/kvm/kvm_main.c    Markus Elfring      2017-01-22  2236  		return -EINVAL;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2237  
f481b069e674378 virt/kvm/kvm_main.c    Paolo Bonzini       2015-05-17  2238  	slots = __kvm_memslots(kvm, as_id);
f481b069e674378 virt/kvm/kvm_main.c    Paolo Bonzini       2015-05-17  2239  	memslot = id_to_memslot(slots, id);
0577d1abe704c31 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2240  	if (!memslot || !memslot->dirty_bitmap)
0577d1abe704c31 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2241  		return -ENOENT;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2242  
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2243  	dirty_bitmap = memslot->dirty_bitmap;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2244  
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2245  	if (protect)
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2246  		lockdep_assert_held(&kvm->slots_lock);
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2247  	else
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2248  		lockdep_assert_held(&kvm->srcu);
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2249  	/*
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2250  	 * kvm_arch_sync_dirty_log() must be safe to call with either kvm->srcu
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2251  	 * held OR the slots lock held.
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2252  	 */
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2253  	kvm_arch_sync_dirty_log(kvm, memslot);
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2254  
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2255  	n = kvm_dirty_bitmap_bytes(memslot);
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2256  	if (!protect) {
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2257  		/*
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2258  		 * Unlike kvm_get_dirty_log, we never flush, because no flush is
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2259  		 * needed until KVM_CLEAR_DIRTY_LOG.  There is some code
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2260  		 * duplication between this function and kvm_get_dirty_log, but
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2261  		 * hopefully all architecture transition to
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2262  		 * kvm_get_dirty_log_protect and kvm_get_dirty_log can be
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2263  		 * eliminated.
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2264  		 */
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2265  		dirty_bitmap_buffer = dirty_bitmap;
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2266  	} else {
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2267  		bool flush;
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2268  
03133347b4452ef virt/kvm/kvm_main.c    Claudio Imbrenda    2018-04-30  2269  		dirty_bitmap_buffer = kvm_second_dirty_bitmap(memslot);
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2270  		memset(dirty_bitmap_buffer, 0, n);
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2271  
531810caa9f4bc9 virt/kvm/kvm_main.c    Ben Gardon          2021-02-02  2272  		KVM_MMU_LOCK(kvm);
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2273  		for (i = 0; i < n / sizeof(long); i++) {
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2274  			unsigned long mask;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2275  			gfn_t offset;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2276  
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2277  			if (!dirty_bitmap[i])
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2278  				continue;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2279  
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2280  			flush = true;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2281  			mask = xchg(&dirty_bitmap[i], 0);
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2282  			dirty_bitmap_buffer[i] = mask;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2283  
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2284  			offset = i * BITS_PER_LONG;
58d2930f4ee335a virt/kvm/kvm_main.c    Takuya Yoshikawa    2015-03-17  2285  			kvm_arch_mmu_enable_log_dirty_pt_masked(kvm, memslot,
58d2930f4ee335a virt/kvm/kvm_main.c    Takuya Yoshikawa    2015-03-17  2286  								offset, mask);
58d2930f4ee335a virt/kvm/kvm_main.c    Takuya Yoshikawa    2015-03-17  2287  		}
531810caa9f4bc9 virt/kvm/kvm_main.c    Ben Gardon          2021-02-02  2288  		KVM_MMU_UNLOCK(kvm);
2a31b9db153530d virt/kvm/kvm_main.c    Paolo Bonzini       2018-10-23  2289  
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18 @2290  		if (flush)
619b5072443c05c virt/kvm/kvm_main.c    David Matlack       2023-08-11  2291  			kvm_flush_remote_tlbs_memslot(kvm, memslot);
82fb1294f7ad3ee virt/kvm/kvm_main.c    James Houghton      2025-09-30  2292  	}
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2293  
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2294  	if (copy_to_user(log->dirty_bitmap, dirty_bitmap_buffer, n))
58d6db349172786 virt/kvm/kvm_main.c    Markus Elfring      2017-01-22  2295  		return -EFAULT;
58d6db349172786 virt/kvm/kvm_main.c    Markus Elfring      2017-01-22  2296  	return 0;
ba0513b5b8ffbcb virt/kvm/kvm_main.c    Mario Smarduch      2015-01-15  2297  }
0dff084607bd555 virt/kvm/kvm_main.c    Sean Christopherson 2020-02-18  2298  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
