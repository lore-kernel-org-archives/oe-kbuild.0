Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0031991B6
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 00:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755564023; cv=none; b=DzIfmo5Y5OYoCTNP4AaLQ/5jMWZhTlWZHlSf58zthkFX64GlySWUYnoF9gTFb2SKGmy2aCzcOgx8p/CmBrwAjcgsrvBO7mkIEmXmQG1WEz+u7XaHzza+ldqK9zYHuwr4aWW1bvZ//AxR7sE/cx43ODudl5qfvSG8lOAgZ2TAjDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755564023; c=relaxed/simple;
	bh=Ve3OyZUee4aPt7+wnlTSp7/+CxnWRxKuG/9qbTbOwg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b9XbMXhrD2pcivFB3BvOC1YF4+FaN1yX7aMswl9LNmX+Z2V+5B+55zE5av03CE235wIFdUi7zfwzQlr842zicfnSYDRqCB7/e8Aw9fMbJB5KZ2TkzkUFghwxv4QGLb68HIftd7pFU4QLTLQEs/B2X0udh4YflE6hK+brt0vTz3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/8xm080; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/8xm080"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755564021; x=1787100021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ve3OyZUee4aPt7+wnlTSp7/+CxnWRxKuG/9qbTbOwg8=;
  b=G/8xm080l5JlBbOb5z5dIgeLLWtfcNzAZEAu/nNhWZZ52k2MF16vm/8Z
   CHyuZmvmWdYn5wUTxEkoCY75JN6IEmv/j6OhXe+ZnjtulSZYCDFZJ4qBg
   A1Mdtfh0mAfECR9O7mZxLbBF0Nheua81G/YpzbOZPEBF8Ec8DqcGTzzh9
   BugMDMJ4u42o+e6KT2B4uhRdWsavoiqDsehgH+QxRV2+KfDkodItEdTtd
   9zMoTdJR+H55cdzMpB/ig1VOahXq8PI/rhY/WzxyFc2meJZBxfgHFOq6i
   B/PTwdkgoBZIPYQuSI77lKrcF+wnqMrvhHepsf3UMuA3LMQrykIFsSzuN
   Q==;
X-CSE-ConnectionGUID: YdCFNqeTRFevYouVAkuNIA==
X-CSE-MsgGUID: v8BbO1fVTiumUNBHnXYg/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="45374367"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="45374367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 17:40:20 -0700
X-CSE-ConnectionGUID: 2QsiC+PLRBazF7TwqDzI1w==
X-CSE-MsgGUID: R9S7gH1yQbC6LehxcRF8hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167943425"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Aug 2025 17:40:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoAOf-000GLT-1T;
	Tue, 19 Aug 2025 00:40:17 +0000
Date: Tue, 19 Aug 2025 08:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <202508190853.WCSkhkog-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Maxim Levitsky <mlevitsk@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be48bcf004f9d0c9207ff21d0edb3b42f253829e
commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-r073-20250818 (https://download.01.org/0day-ci/archive/20250819/202508190853.WCSkhkog-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508190853.WCSkhkog-lkp@intel.com/

New smatch warnings:
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented

Old smatch warnings:
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +1378 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1370  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1371  int kvm_trylock_all_vcpus(struct kvm *kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1372  {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  	struct kvm_vcpu *vcpu;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  	unsigned long i, j;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1378  	kvm_for_each_vcpu(i, vcpu, kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1379  		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1380  			goto out_unlock;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1381  	return 0;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1382  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1383  out_unlock:
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1384  	kvm_for_each_vcpu(j, vcpu, kvm) {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  		if (i == j)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1386  			break;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  	}
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  	return -EINTR;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  }
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1393  int kvm_lock_all_vcpus(struct kvm *kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1394  {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1395  	struct kvm_vcpu *vcpu;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1396  	unsigned long i, j;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1397  	int r;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1398  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1399  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1400  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1401  	kvm_for_each_vcpu(i, vcpu, kvm) {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1402  		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1403  		if (r)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1404  			goto out_unlock;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1405  	}
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1406  	return 0;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1407  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1408  out_unlock:
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1409  	kvm_for_each_vcpu(j, vcpu, kvm) {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1410  		if (i == j)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1411  			break;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1412  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1413  	}
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1414  	return r;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1415  }
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1416  EXPORT_SYMBOL_GPL(kvm_lock_all_vcpus);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1417  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1418  void kvm_unlock_all_vcpus(struct kvm *kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1419  {
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1420  	struct kvm_vcpu *vcpu;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1421  	unsigned long i;
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1422  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1423  	lockdep_assert_held(&kvm->lock);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1424  
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1425  	kvm_for_each_vcpu(i, vcpu, kvm)
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1426  		mutex_unlock(&vcpu->mutex);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1427  }
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1428  EXPORT_SYMBOL_GPL(kvm_unlock_all_vcpus);
e4a454ced74c0a virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
