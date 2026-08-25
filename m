Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395753B9930
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Aug 2026 06:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787638779; cv=none; b=lSTmWKkTTsddaoloZQBy0PL0klZShgTMSZXXZNYiiHlm268EWeQUatxVkoBQTjZ60Ow+Q+MhZ/LTlX1ftiQ3qnt441FEoAm8o/uARTq8WLO2TCSe1LziQzKP44v7wxWl+fPOCBlm9NJHroLbkWsYbay/9Q7Vm7t4cE0SEU4jrSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787638779; c=relaxed/simple;
	bh=w3NzTVyjXu1Zfk09l9JrZpWj34RITMPUHEx/0kVETGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qTjFiwCw29tv6Xrn/Nl7KKywKqx1y8GeCh+1x5wg7o7hYBWKKn5LLTP1Ivl0esgKlmiTqLLdLl9ErlbKbyxBZ4wPz3qTjgT4gticzfV0pzb16YS8S/t32rtRlXdMGmCgw4jE1uwtLTVMQZKhYHbnpNCvO4m6WhUIIyMcMBBcvh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YneKD3yQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YneKD3yQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787638777; x=1819174777;
  h=date:from:to:cc:subject:message-id;
  bh=w3NzTVyjXu1Zfk09l9JrZpWj34RITMPUHEx/0kVETGA=;
  b=YneKD3yQV5nGLUvGEdQXjRwnKjwPjNA+y2tcsXp+mSRDFyh47kHO9Ojh
   70g8XukY5/U90GEF1PxlpHtxngEWhp+mqf2Yp3dcWTMfKm+lxDg306vBR
   27AjU21j5Wk2/D0Hq2iw2RwT5QpsfPo9kflFLDffv5/iLk0MJeborWIOR
   gS82tDgyaPIjx6Y3xYZAcjSxT77v+k0usoN8pb5I4h2J1yGoPhOIizzO5
   UpBDIXI9495lqXVmGefVx63oEShMC0Qt8AlDczjeNkNfFfQnH6gtKIU2a
   DJq5JK7ItaPp6edjis7DzKdhGAD2vixoIwy6H0O2B/uixYBrdWa3UK0SK
   g==;
X-CSE-ConnectionGUID: RTwE1qRATDq3yAeoY8pzpw==
X-CSE-MsgGUID: X6cDXNq+TpKOBR8eLgxvng==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98772371"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98772371"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 23:19:35 -0700
X-CSE-ConnectionGUID: mGsYNcycSMKgIkFlNRlP3A==
X-CSE-MsgGUID: Qz6JW88+RDCYPmkYwMVbHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="265425267"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Aug 2026 23:19:34 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wykVQ-00000000571-0XZR;
	Tue, 25 Aug 2026 06:19:32 +0000
Date: Tue, 25 Aug 2026 14:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-6.1 0/14]
 fs/smb/client/cifsacl.c:185:23-24: WARNING opportunity for min()
Message-ID: <202608251416.R8QRWtVu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   42af5216d44771f3071e771ac4dca6c186e017ed
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [0/14] smb: move client and server files to common directory fs/smb
:::::: branch date: 22 hours ago
:::::: commit date: 3 years, 2 months ago
config: i386-randconfig-051-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251416.R8QRWtVu-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608251416.R8QRWtVu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/cifsacl.c:185:23-24: WARNING opportunity for min()

vim +185 fs/smb/client/cifsacl.c

9409ae58e0759d fs/cifs/cifsacl.c Shirish Pargaonkar 2011-04-22  150  
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  151  /*
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  152   * if the two SIDs (roughly equivalent to a UUID for a user or group) are
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  153   * the same returns zero, if they do not match returns non-zero.
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  154   */
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  155  static int
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  156  compare_sids(const struct cifs_sid *ctsid, const struct cifs_sid *cwsid)
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  157  {
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  158  	int i;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  159  	int num_subauth, num_sat, num_saw;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  160  
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  161  	if ((!ctsid) || (!cwsid))
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  162  		return 1;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  163  
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  164  	/* compare the revision */
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  165  	if (ctsid->revision != cwsid->revision) {
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  166  		if (ctsid->revision > cwsid->revision)
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  167  			return 1;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  168  		else
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  169  			return -1;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  170  	}
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  171  
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  172  	/* compare all of the six auth values */
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  173  	for (i = 0; i < NUM_AUTHS; ++i) {
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  174  		if (ctsid->authority[i] != cwsid->authority[i]) {
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  175  			if (ctsid->authority[i] > cwsid->authority[i])
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  176  				return 1;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  177  			else
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  178  				return -1;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  179  		}
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  180  	}
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  181  
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  182  	/* compare all of the subauth values if any */
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  183  	num_sat = ctsid->num_subauth;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  184  	num_saw = cwsid->num_subauth;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25 @185  	num_subauth = num_sat < num_saw ? num_sat : num_saw;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  186  	if (num_subauth) {
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  187  		for (i = 0; i < num_subauth; ++i) {
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  188  			if (ctsid->sub_auth[i] != cwsid->sub_auth[i]) {
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  189  				if (le32_to_cpu(ctsid->sub_auth[i]) >
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  190  					le32_to_cpu(cwsid->sub_auth[i]))
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  191  					return 1;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  192  				else
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  193  					return -1;
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  194  			}
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  195  		}
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  196  	}
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  197  
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  198  	return 0; /* sids compare/match */
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  199  }
436bb435fcbe2d fs/cifs/cifsacl.c Jeff Layton        2012-11-25  200  

:::::: The code at line 185 was first introduced by commit
:::::: 436bb435fcbe2d52678ec7e2abc45fd1938601ce cifs: make compare_sids static

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Steve French <smfrench@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
