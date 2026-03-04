Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF008373C19
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 07:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610690; cv=none; b=m7qvusf5e61PMuvvQFzC90kN43KXmd8R5Tch+VoPa90bRLzgrBizf9xfYlcrB1aKzK5rkvRXYhPgaceueSRkKgWOlAN/JJjlVgb0Otra5/Rrkt+0IlDkqKXCPXTySqDse8msHgTR5kCipUgLGdKmzEzz9qEJcwSvfeKsX2e9D9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610690; c=relaxed/simple;
	bh=Tk67TER9GN5oxR1Xxqj4PFnCeymlAO2Tv0Ku/bKSutc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=YI5WOrW/Eu1wXgpoljTTsxUX15KxJXZjXxOztlqBeRDfsmKzEgQoFNvl4OLk1jRYfLUwe3avCKXBsuEUfsSn4YyP0VSj6K0gGgcFPdubCTZbOTqqEBizWGkXwtKwcb8sSjUf6qosHEVHgB5dem5qMOCNw4mvBBqWbn9hkP4Is3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UG4+N2VU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UG4+N2VU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772610688; x=1804146688;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tk67TER9GN5oxR1Xxqj4PFnCeymlAO2Tv0Ku/bKSutc=;
  b=UG4+N2VUtE9aPdX2ZQ0wyyMZPYfErETiiQbrXvqeII4r47KWoxEmoXoP
   bsW8zBitPtbS+9IU8CDHJTHemdOm0YGIq5ik/ebLbWKg6E/teFezbgTkq
   YICZcsBy0atFKuP7/Ubp2iKlC/gaeCjfnDgBrguo2R9wgfDM5+EeHSBAe
   0u+eERXGpAEIUSJbWZTYvQ4LlpQcW0MgQNK63LgFekymZD+oTq+cucceO
   QKUPippgoc7Rogm1/5nQ9fg023ofRXndF15xqDsqu8hx7UXbwDEdofnAz
   7NYs8ctaHP9LaqQRRboNuvxlTivyh+ueCL459Yi6JimrCGSn1w0x3bm9q
   Q==;
X-CSE-ConnectionGUID: jXndDMZ7QwqZveDveJ2PCA==
X-CSE-MsgGUID: roJiqe8NTDO6bry99OYIXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73714335"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73714335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 23:51:27 -0800
X-CSE-ConnectionGUID: vgGBNmSsSKmzFCe4FzLC7g==
X-CSE-MsgGUID: aEE1Mlt7SOGcPe3hVeJhnw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2026 23:51:26 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxh0u-000000001e9-1ylr
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 07:51:24 +0000
Date: Wed, 04 Mar 2026 08:50:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kvm-x86:fixes 1/10] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'sets'
Message-ID: <202603040811.PMsFLSB9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "high confidence checkpatch report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Carlos L=C3=B3pez" <clopez@suse.de>

tree:   https://github.com/kvm-x86/linux fixes
head:   3271085a7f1030ba9897cab60452acd370423ff1
commit: 6a5028d8f9f4edaf962882ecf3e5f0044b205f0c [1/10] KVM: x86: synthesiz=
e CPUID bits only if CPU capability is set
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603040811.P=
MsFLSB9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'sets'
#20:=20
firmware will explicitly reject the command if the page sets sets these

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#24:=20
capability is set before adding it to to kvm_cpu_cap_features.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
