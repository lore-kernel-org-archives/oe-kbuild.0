Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5781119C
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694787788; x=1726323788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OHfP71kYG3GXoJNW7Wk+DdApH5VI8KXhuPyP6jm0mfE=;
  b=WzAhgUyr9LPqRikdKmM8b5UPD8yIYOBUlDjTGG5q7RpelFjHXbJswPw7
   Z5HdUGvRnEFdAwmaoaSCRb5T7z+rpVRlL4JmNZ+ZKYc806q4Ac8XzAL27
   X8sz5QueOH6o8hXvC9znYJdrElxSqmLNNciNsoD9P3pRMPSJzZxaKcYI7
   KRSdrj4JsZ0VlesGNAcKMUreRH6B791Kg9dTPqOknndDYCtXMUxu9IXPU
   4yP9gLw4fJ6U43IIWKRhAFsZbMA7lgojkdGPSFflxjFEdSS/aL2k9SKLA
   p1TMaUrQXu74Q0F0DQ+VN7Mm3qqieMUyvPF7OBkF3PeoF5swKW2fO6eFU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="378170654"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="378170654"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 07:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="888251943"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="888251943"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2023 07:22:28 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh9in-00033d-2Y;
	Fri, 15 Sep 2023 14:23:01 +0000
Date: Fri, 15 Sep 2023 22:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH vfio] vfio/pci: remove msi domain on msi disable
Message-ID: <202309152211.7YCkF75G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230914191406.54656-1-shannon.nelson@amd.com>
References: <20230914191406.54656-1-shannon.nelson@amd.com>
TO: Shannon Nelson <shannon.nelson@amd.com>
TO: alex.williamson@redhat.com
TO: jgg@ziepe.ca
TO: kevin.tian@intel.com
TO: reinette.chatre@intel.com
TO: tglx@linutronix.de
TO: kvm@vger.kernel.org
CC: shannon.nelson@amd.com
CC: brett.creeley@amd.com
CC: linux-kernel@vger.kernel.org

Hi Shannon,

kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/for-linus]
[cannot apply to awilliam-vfio/next linus/master v6.6-rc1 next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shannon-Nelson/vfio-pci-remove-msi-domain-on-msi-disable/20230915-031544
base:   https://github.com/awilliam/linux-vfio.git for-linus
patch link:    https://lore.kernel.org/r/20230914191406.54656-1-shannon.nelson%40amd.com
patch subject: [PATCH vfio] vfio/pci: remove msi domain on msi disable
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-071-20230915 (https://download.01.org/0day-ci/archive/20230915/202309152211.7YCkF75G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309152211.7YCkF75G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309152211.7YCkF75G-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "msi_remove_device_irq_domain" [drivers/vfio/pci/vfio-pci-core.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
