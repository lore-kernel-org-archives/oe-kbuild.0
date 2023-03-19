Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB5AA46
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 05:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679204583; x=1710740583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SonV6zS1N4TK7OS06zt9+3qtfxAsZy1YywA3GW1f4HA=;
  b=eNvhABQOGmBBGNPfHt+VGjgErzzACuqlkQvEn872oFqj3Hys/zTOxruh
   kKYKMt0h8nhSKFMwR7b8To+CE6NmU3eKIMMzT02c3m0pzWA0nWBh1VY9P
   h9osicjakCtjmUpKwjj3IdojQl8WChrr9NuPjBPRNF95lLKvop7GPQrdE
   PoawK7RGBEYRdBfE7ZvoSTq2i1YxvPzLlyUFvImdmLLau47w3wE0PIoeH
   OTONV/UrSwdB1p6kvfiFPxHFbumtquIdwirMrqmAraMfhrqbfmGSJtjMM
   5DUco2sTiFMwRu3UmVCuTUgp4phwHpDAWRRNtB/HMVL8HyQ1iR55/lVov
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="337194683"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="337194683"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 22:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="769820734"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="769820734"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2023 22:43:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdlor-000APu-24;
	Sun, 19 Mar 2023 05:43:01 +0000
Date: Sun, 19 Mar 2023 13:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] KVM: selftests: Provide generic way to read
 system counter
Message-ID: <202303191326.uhmOihJy-lkp@intel.com>
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
In-Reply-To: <20230316222752.1911001-2-coltonlewis@google.com>
References: <20230316222752.1911001-2-coltonlewis@google.com>
TO: Colton Lewis <coltonlewis@google.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Colton Lewis <coltonlewis@google.com>
TO: Sean Christopherson <seanjc@google.com>
TO: David Matlack <dmatlack@google.com>
TO: Vipin Sharma <vipinsh@google.com>
TO: Andrew Jones <andrew.jones@linux.dev>
TO: Marc Zyngier <maz@kernel.org>
TO: Ben Gardon <bgardon@google.com>
TO: Ricardo Koller <ricarkol@google.com>
TO: Oliver Upton <oliver.upton@linux.dev>
CC: kvm@vger.kernel.org

Hi Colton,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes mst-vhost/linux-next linus/master v6.3-rc2 next-20230317]
[cannot apply to kvm/queue kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/KVM-selftests-Provide-generic-way-to-read-system-counter/20230317-063111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20230316222752.1911001-2-coltonlewis%40google.com
patch subject: [PATCH v2 1/2] KVM: selftests: Provide generic way to read system counter
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303191326.uhmOihJy-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/kvm/lib/kvm_util.c: processor.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
