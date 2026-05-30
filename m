Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D626F288
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 16:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780159625; cv=none; b=MmmqVdB77XBWQY2c1uIiwDaDfo54zTShD65XyI6JqUw1UD5vAwQdcZGmFgmroN0fDjo80HmuU16zbjM6Q2ofBe3W7PstVGEwUNldnZcU76XQJBdiaeuUa/R930FGxwowbE77pk9By8IrfRiS//cRM4KuYGFWr4kOWUvtXpU9BCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780159625; c=relaxed/simple;
	bh=K+3L+0I5UvOTmDyvmEBr+Wt6UZThqewguPVRg0bMypQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KI4Gy+vqN/D9BDGEnmOyS7B9DsUetqMU+JSynhkmRsU0OU3rQZf/xXeDxoEDb9PKZZnLhpBTNU5EwhE6WGRAJ/MqH6HlBHNx8TwwvilbxuH3MSE33AMPTqZVGrrMoqFvCEeHqR3FI1j8zhVP6xk37arDWN4ozapr3Ih2Uxw9954=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PpsWPJIy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpsWPJIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780159624; x=1811695624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K+3L+0I5UvOTmDyvmEBr+Wt6UZThqewguPVRg0bMypQ=;
  b=PpsWPJIyY6ZQDp8zQyKNaHPSa6YwFvb8Hh4Us5KcLi1/6ADgzpVo+1H+
   ggPYZ66EZYsLhC0biUvSvKBle+7C+erhk+S9wW5/PKL1GJM93bQuWrZN4
   KpveHPf9KJWJYycjr30QNPbtyKCl7wOEgNnvtUS/KqsAlyJIYjoyjp1YH
   qDpKuRwTl6MnCoiV5xU0OyjxHCCCc7bfSvi1JKv2uQW8xeXxstnTPl7SW
   P06234yyuwmZY5uPhS41vw9xhsm91SdXsne4JuHfHGzuJDRjgIeoOhDT1
   us5pNYACR0heXFZcm10uLpjhbNn2aENAq+ilO3MTyl+lx2sBjNxlDJf+s
   Q==;
X-CSE-ConnectionGUID: JIKz+QReSv6vr3+N/IfRyw==
X-CSE-MsgGUID: hNEO09/DQxOq9ZPHRhV0vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="103653059"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="103653059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 09:47:04 -0700
X-CSE-ConnectionGUID: d1/vyifIQ1KIyEj3v74Paw==
X-CSE-MsgGUID: Ajsy55sTQWmo0FDSlUK1Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="273432468"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 May 2026 09:47:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTMpw-000000008gc-0EfS;
	Sat, 30 May 2026 16:47:00 +0000
Date: Sun, 31 May 2026 00:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] ceph: fix bare ceph_decode_8 OOB in decode_lockers()
Message-ID: <202605310022.LGyGb8eD-lkp@intel.com>
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
In-Reply-To: <20260528132521.843004-1-jhapavitra98@gmail.com>
References: <20260528132521.843004-1-jhapavitra98@gmail.com>
TO: Pavitra Jha <jhapavitra98@gmail.com>
TO: idryomov@gmail.com
CC: Slava.Dubeyko@ibm.com
CC: amarkuze@redhat.com
CC: ceph-devel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org
CC: Pavitra Jha <jhapavitra98@gmail.com>

Hi Pavitra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ceph-client/testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitra-Jha/ceph-fix-bare-ceph_decode_8-OOB-in-decode_lockers/20260528-212749
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20260528132521.843004-1-jhapavitra98%40gmail.com
patch subject: [PATCH v2] ceph: fix bare ceph_decode_8 OOB in decode_lockers()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-r073-20260530 (https://download.01.org/0day-ci/archive/20260531/202605310022.LGyGb8eD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605310022.LGyGb8eD-lkp@intel.com/

smatch warnings:
net/ceph/cls_lock_client.c:313 decode_lockers() warn: missing error code 'ret'

vim +/ret +313 net/ceph/cls_lock_client.c

d4ed4a53056288 Douglas Fuller 2015-06-29  287  
d4ed4a53056288 Douglas Fuller 2015-06-29  288  static int decode_lockers(void **p, void *end, u8 *type, char **tag,
d4ed4a53056288 Douglas Fuller 2015-06-29  289  			  struct ceph_locker **lockers, u32 *num_lockers)
d4ed4a53056288 Douglas Fuller 2015-06-29  290  {
d4ed4a53056288 Douglas Fuller 2015-06-29  291  	u8 struct_v;
d4ed4a53056288 Douglas Fuller 2015-06-29  292  	u32 struct_len;
d4ed4a53056288 Douglas Fuller 2015-06-29  293  	char *s;
d4ed4a53056288 Douglas Fuller 2015-06-29  294  	int i;
d4ed4a53056288 Douglas Fuller 2015-06-29  295  	int ret;
d4ed4a53056288 Douglas Fuller 2015-06-29  296  
d4ed4a53056288 Douglas Fuller 2015-06-29  297  	ret = ceph_start_decoding(p, end, 1, "cls_lock_get_info_reply",
d4ed4a53056288 Douglas Fuller 2015-06-29  298  				  &struct_v, &struct_len);
d4ed4a53056288 Douglas Fuller 2015-06-29  299  	if (ret)
d4ed4a53056288 Douglas Fuller 2015-06-29  300  		return ret;
d4ed4a53056288 Douglas Fuller 2015-06-29  301  
d4ed4a53056288 Douglas Fuller 2015-06-29  302  	*num_lockers = ceph_decode_32(p);
69050f8d6d075d Kees Cook      2026-02-20  303  	*lockers = kzalloc_objs(**lockers, *num_lockers, GFP_NOIO);
d4ed4a53056288 Douglas Fuller 2015-06-29  304  	if (!*lockers)
d4ed4a53056288 Douglas Fuller 2015-06-29  305  		return -ENOMEM;
d4ed4a53056288 Douglas Fuller 2015-06-29  306  
d4ed4a53056288 Douglas Fuller 2015-06-29  307  	for (i = 0; i < *num_lockers; i++) {
d4ed4a53056288 Douglas Fuller 2015-06-29  308  		ret = decode_locker(p, end, *lockers + i);
d4ed4a53056288 Douglas Fuller 2015-06-29  309  		if (ret)
d4ed4a53056288 Douglas Fuller 2015-06-29  310  			goto err_free_lockers;
d4ed4a53056288 Douglas Fuller 2015-06-29  311  	}
d4ed4a53056288 Douglas Fuller 2015-06-29  312  
cff58e4599d8e1 Pavitra Jha    2026-05-28 @313  	ceph_decode_8_safe(p, end, *type, err_free_lockers);
d4ed4a53056288 Douglas Fuller 2015-06-29  314  	s = ceph_extract_encoded_string(p, end, NULL, GFP_NOIO);
d4ed4a53056288 Douglas Fuller 2015-06-29  315  	if (IS_ERR(s)) {
d4ed4a53056288 Douglas Fuller 2015-06-29  316  		ret = PTR_ERR(s);
d4ed4a53056288 Douglas Fuller 2015-06-29  317  		goto err_free_lockers;
d4ed4a53056288 Douglas Fuller 2015-06-29  318  	}
d4ed4a53056288 Douglas Fuller 2015-06-29  319  
d4ed4a53056288 Douglas Fuller 2015-06-29  320  	*tag = s;
d4ed4a53056288 Douglas Fuller 2015-06-29  321  	return 0;
d4ed4a53056288 Douglas Fuller 2015-06-29  322  
d4ed4a53056288 Douglas Fuller 2015-06-29  323  err_free_lockers:
d4ed4a53056288 Douglas Fuller 2015-06-29  324  	ceph_free_lockers(*lockers, *num_lockers);
d4ed4a53056288 Douglas Fuller 2015-06-29  325  	return ret;
d4ed4a53056288 Douglas Fuller 2015-06-29  326  }
d4ed4a53056288 Douglas Fuller 2015-06-29  327  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
