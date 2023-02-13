Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E1F7E
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Feb 2023 02:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676255343; x=1707791343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GN2f1E+Y1J2TXgaYsPTPl1ujhwknPLEY2gVxaXV4i38=;
  b=htdTLb5OrKJzcntgxbXH2+n3wIf5L62kRjefFIBRj6oTLVTs/iSHjiKW
   D2OX0zkFiLCbgV+1vEoELA5U48X1vAet+I/I+7VyqZrr4a+TE+I6cFRXD
   YmGE6otrx6t19ZVExzOiXHa04Ha+dZGsfx6bqarIsdxP1mDYxb2ZvIJ6H
   UicxqLlu7bSssCpBBnz+0jiH0NDkVJOAWdsMPKM1Qo7P9iDj4+IPeFXQj
   LeFw3EES2kLikd6H9xhTIYqzLzLctEwNET5uGiv6fYGiDVbemB/c45+bA
   SU+47ZxdKAATFP+aae0EHMDkVp9DvyTzFIw/m9kaq1Yu5wg8EQ7qsatUl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332098108"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="332098108"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 18:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="662025840"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="662025840"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Feb 2023 18:29:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pROaS-0007UX-21;
	Mon, 13 Feb 2023 02:29:00 +0000
Date: Mon, 13 Feb 2023 10:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping
 functions
Message-ID: <202302131044.i4aocWmE-lkp@intel.com>
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
In-Reply-To: <20230212153250.1099136-2-vdonnefort@google.com>
References: <20230212153250.1099136-2-vdonnefort@google.com>
TO: Vincent Donnefort <vdonnefort@google.com>

Hi Vincent,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on rostedt-trace/for-next v6.2-rc8 next-20230210]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230212-233420
patch link:    https://lore.kernel.org/r/20230212153250.1099136-2-vdonnefort%40google.com
patch subject: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping functions
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230213/202302131044.i4aocWmE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302131044.i4aocWmE-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:6014 rb_get_mapped_buffer() warn: inconsistent returns '&cpu_buffer->mapping_lock'.

vim +6014 kernel/trace/ring_buffer.c

96cfb7d92682fb Vincent Donnefort 2023-02-12  5996  
96cfb7d92682fb Vincent Donnefort 2023-02-12  5997  static struct ring_buffer_per_cpu *
96cfb7d92682fb Vincent Donnefort 2023-02-12  5998  rb_get_mapped_buffer(struct trace_buffer *buffer, int cpu)
96cfb7d92682fb Vincent Donnefort 2023-02-12  5999  {
96cfb7d92682fb Vincent Donnefort 2023-02-12  6000  	struct ring_buffer_per_cpu *cpu_buffer;
96cfb7d92682fb Vincent Donnefort 2023-02-12  6001  
96cfb7d92682fb Vincent Donnefort 2023-02-12  6002  	if (!cpumask_test_cpu(cpu, buffer->cpumask))
96cfb7d92682fb Vincent Donnefort 2023-02-12  6003  		return ERR_PTR(-EINVAL);
96cfb7d92682fb Vincent Donnefort 2023-02-12  6004  
96cfb7d92682fb Vincent Donnefort 2023-02-12  6005  	cpu_buffer = buffer->buffers[cpu];
96cfb7d92682fb Vincent Donnefort 2023-02-12  6006  
96cfb7d92682fb Vincent Donnefort 2023-02-12  6007  	down_read(&cpu_buffer->mapping_lock);
96cfb7d92682fb Vincent Donnefort 2023-02-12  6008  
96cfb7d92682fb Vincent Donnefort 2023-02-12  6009  	if (!atomic_read(&cpu_buffer->mapped)) {
96cfb7d92682fb Vincent Donnefort 2023-02-12  6010  		up_read(&cpu_buffer->mapping_lock);
96cfb7d92682fb Vincent Donnefort 2023-02-12  6011  		return ERR_PTR(-ENODEV);
96cfb7d92682fb Vincent Donnefort 2023-02-12  6012  	}
96cfb7d92682fb Vincent Donnefort 2023-02-12  6013  
96cfb7d92682fb Vincent Donnefort 2023-02-12 @6014  	return cpu_buffer;
96cfb7d92682fb Vincent Donnefort 2023-02-12  6015  }
96cfb7d92682fb Vincent Donnefort 2023-02-12  6016  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
