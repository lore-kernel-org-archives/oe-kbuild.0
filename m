Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B97732C8E
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jul 2024 07:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719992332; cv=none; b=a1j92sYlRPX3rOry98QcIivYKRyTevr5bNC/d884XUDmp/T2U58cJn84UOUCfV/KFzmoRg1nHjVHrFKzG61NlnAwoJfoa1rwPs0brmo2APt5U7rODyrD1rvkxbi7vA1KGM54LasCWcE3X/zVFN7edXenAIi+Kf2Pun4TvOEwNjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719992332; c=relaxed/simple;
	bh=ardFNVfVK5Vd4aA3FJLv2tWUPSn4lQK9Zehbc59fe7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I4knbQcfiQoFb0Tc5fTbLD53ZD1eoU5KPFE3clAEqkTdABLdpxbDsiaBo6UqjigeiABQAXyT6olC8ZItp2R/WRB817Jg9wh5OhLrp+Qa1km613eP3INgz6FsvGnx9vHvSJQ5FtI4tuRnJwOyVnR18vK4EaFmqyJINLqA8Qpt0zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGtFv4eX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGtFv4eX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719992330; x=1751528330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ardFNVfVK5Vd4aA3FJLv2tWUPSn4lQK9Zehbc59fe7o=;
  b=RGtFv4eXWIoOYxDb6YsrnaBXasRdDhiIY/eqWz8/75AFUfjknGEnUTty
   LuGeHGDytbI4//e0/eumtYYq8fxeoxsUJ5eUsdgi9zIgtBPmNamdofwQ9
   zFK6jdpZTwISdSt6GwuNad40yQP3h76h0NDLaBU712VG+EkDnXknW0EwD
   /Dt3aQkUxq/rTPaxRap7kVLHeA0+1i2HBsjbmowkDZyfpdASU72E5J3sz
   JhGn219nLKNmaxf/fik/K88hBmrbBsq8T/zPIKDEq5Vt/5YD/bV5kZ+FJ
   JSVWeBIINWUWouI39Ap+AVGbRC89wqFZ/4mj1pvgeI2NDZmZanYvCRv1+
   Q==;
X-CSE-ConnectionGUID: ekbRWol1SryUyLq0IvR9PA==
X-CSE-MsgGUID: WlEsPdXsSDiNMKAzzabXlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28339139"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="28339139"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 00:38:50 -0700
X-CSE-ConnectionGUID: OJucYZUoQkWd+9uM4mIZGQ==
X-CSE-MsgGUID: Q3QJgrNuT1O4jHAfMTa5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="46175593"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jul 2024 00:38:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOuZi-000PSA-1O;
	Wed, 03 Jul 2024 07:38:46 +0000
Date: Wed, 3 Jul 2024 15:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: progs/test_tunnel_kern.c:30:13: error: declaration of 'struct
 bpf_fou_encap' will not be visible outside of this function
Message-ID: <202407031544.NHNJkqpO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniel Xu <dxu@dxuuu.xyz>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Antony Antony <antony.antony@secunet.com>

Hi Daniel,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9d22f7a6655941fc8b2b942ed354ec780936b3e
commit: 02b4e126e6a5f5552da2ccec47a028984d2d9654 bpf: selftests: test_tunnel: Use vmlinux.h declarations
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031544.NHNJkqpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407031544.NHNJkqpO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/test_tunnel_kern.c:30:13: error: declaration of 'struct bpf_fou_encap' will not be visible outside of this function [-Werror,-Wvisibility]
      30 |                           struct bpf_fou_encap *encap, int type) __ksym;
         |                                  ^
   progs/test_tunnel_kern.c:32:13: error: declaration of 'struct bpf_fou_encap' will not be visible outside of this function [-Werror,-Wvisibility]
      32 |                           struct bpf_fou_encap *encap) __ksym;
         |                                  ^
>> progs/test_tunnel_kern.c:737:23: error: variable has incomplete type 'struct bpf_fou_encap'
     737 |         struct bpf_fou_encap encap = {};
         |                              ^
   progs/test_tunnel_kern.c:737:9: note: forward declaration of 'struct bpf_fou_encap'
     737 |         struct bpf_fou_encap encap = {};
         |                ^
>> progs/test_tunnel_kern.c:761:43: error: use of undeclared identifier 'FOU_BPF_ENCAP_GUE'; did you mean 'TUNNEL_ENCAP_GUE'?
     761 |         ret = bpf_skb_set_fou_encap(skb, &encap, FOU_BPF_ENCAP_GUE);
         |                                                  ^~~~~~~~~~~~~~~~~
         |                                                  TUNNEL_ENCAP_GUE
   /tools/include/vmlinux.h:96070:2: note: 'TUNNEL_ENCAP_GUE' declared here
    96070 |         TUNNEL_ENCAP_GUE = 2,
          |         ^
   progs/test_tunnel_kern.c:774:23: error: variable has incomplete type 'struct bpf_fou_encap'
     774 |         struct bpf_fou_encap encap = {};
         |                              ^
   progs/test_tunnel_kern.c:774:9: note: forward declaration of 'struct bpf_fou_encap'
     774 |         struct bpf_fou_encap encap = {};
         |                ^
>> progs/test_tunnel_kern.c:798:43: error: use of undeclared identifier 'FOU_BPF_ENCAP_FOU'; did you mean 'TUNNEL_ENCAP_FOU'?
     798 |         ret = bpf_skb_set_fou_encap(skb, &encap, FOU_BPF_ENCAP_FOU);
         |                                                  ^~~~~~~~~~~~~~~~~
         |                                                  TUNNEL_ENCAP_FOU
   /tools/include/vmlinux.h:96069:2: note: 'TUNNEL_ENCAP_FOU' declared here
    96069 |         TUNNEL_ENCAP_FOU = 1,
          |         ^
   progs/test_tunnel_kern.c:812:23: error: variable has incomplete type 'struct bpf_fou_encap'
     812 |         struct bpf_fou_encap encap = {};
         |                              ^
   progs/test_tunnel_kern.c:812:9: note: forward declaration of 'struct bpf_fou_encap'
     812 |         struct bpf_fou_encap encap = {};
         |                ^
   7 errors generated.


vim +30 tools/testing/selftests/bpf/progs/test_tunnel_kern.c

1115169f47ae45 Paul Chaignon   2022-07-25  28  
d9688f898c08c8 Christian Ehrig 2023-04-07  29  int bpf_skb_set_fou_encap(struct __sk_buff *skb_ctx,
d9688f898c08c8 Christian Ehrig 2023-04-07 @30  			  struct bpf_fou_encap *encap, int type) __ksym;
d9688f898c08c8 Christian Ehrig 2023-04-07  31  int bpf_skb_get_fou_encap(struct __sk_buff *skb_ctx,
d9688f898c08c8 Christian Ehrig 2023-04-07  32  			  struct bpf_fou_encap *encap) __ksym;
d9688f898c08c8 Christian Ehrig 2023-04-07  33  

:::::: The code at line 30 was first introduced by commit
:::::: d9688f898c08c8f96fb0e7879262877ffd319bfd selftests/bpf: Test FOU kfuncs for externally controlled ipip devices

:::::: TO: Christian Ehrig <cehrig@cloudflare.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
