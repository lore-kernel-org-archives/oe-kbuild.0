Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39245361
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Oct 2023 00:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+UjA3JV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697674958; x=1729210958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IpsTHauhXvRegE4+NYVi0A04sA6Jo07gDDYmulc4yec=;
  b=C+UjA3JVSEz4bcafuWhC9YMO5odx3LkbAUcsXzZejSJ/B4QYgu93VtBG
   sDMN5ex/otooacDd780CbOUUxC6etsTvvqR/XMFIZXIy/Q5czoIJd/TO9
   34rEDwi472m2MtSMSR4bs9QoHRayNyxRoiJOuncVXnY9cG6HSGUTD7VOe
   ohd7I6jh94TzyorTlHEOwxuGTi2l6AlSqJ50DnZ5nrXhnlEK2WK7zBxNV
   zGqGv8/48AySCTq2B62XRsozi+gMRD2ZBqOiCTFhWHq/i4pYqhtTEvQkb
   yiUs7VESJToKNDtgOmI3k8BnUU2Uv5bFMK1Sw9Mt+kzuQv+iTULGQRYeu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="376519341"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="376519341"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 17:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="760442117"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="760442117"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Oct 2023 17:22:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtGo6-0001K8-0m;
	Thu, 19 Oct 2023 00:22:34 +0000
Date: Thu, 19 Oct 2023 08:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 2/3] userfaultfd: UFFDIO_MOVE uABI
Message-ID: <202310190825.cNyXz30F-lkp@intel.com>
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
In-Reply-To: <20231009064230.2952396-3-surenb@google.com>
References: <20231009064230.2952396-3-surenb@google.com>
TO: Suren Baghdasaryan <surenb@google.com>
TO: akpm@linux-foundation.org
CC: viro@zeniv.linux.org.uk
CC: brauner@kernel.org
CC: shuah@kernel.org
CC: aarcange@redhat.com
CC: lokeshgidra@google.com
CC: peterx@redhat.com
CC: david@redhat.com
CC: hughd@google.com
CC: mhocko@suse.com
CC: axelrasmussen@google.com
CC: rppt@kernel.org
CC: willy@infradead.org
CC: Liam.Howlett@oracle.com
CC: jannh@google.com
CC: zhangpeng362@huawei.com
CC: bgeffon@google.com
CC: kaleshsingh@google.com
CC: ngeoffray@google.com
CC: jdduke@google.com
CC: surenb@google.com
CC: linux-mm@kvack.org
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: kernel-team@android.com

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20231018]
[cannot apply to linus/master v6.6-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/mm-rmap-support-move-to-different-root-anon_vma-in-folio_move_anon_rmap/20231009-144552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231009064230.2952396-3-surenb%40google.com
patch subject: [PATCH v3 2/3] userfaultfd: UFFDIO_MOVE uABI
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-101-20231019 (https://download.01.org/0day-ci/archive/20231019/202310190825.cNyXz30F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190825.cNyXz30F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310190825.cNyXz30F-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/userfaultfd.c:857:13-14: WARNING opportunity for swap()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
