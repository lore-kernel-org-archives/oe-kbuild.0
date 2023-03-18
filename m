Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0654063B
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 03:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679108493; x=1710644493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mqsk0AqVPRaW4Je9dy5Y9t8ZE8N8C8k68/7u2EE0Cl4=;
  b=Y9yTP4KNQfJ5Dp2Y0XY5X1MODRh69w5AsDxVX/HwzvRfD+gCUSNLvQD9
   aYs5+3NYPRMhf68dofVM+/vyaSksm9C7SK6avYlZjdlNize7qEJMKDU+z
   jWOI9Wf9kxbuPA8YJbmyax98aPnT/pl2lgeVtnpaTdZGZPwp6oVc1au0i
   YdDC7OImST6ajEZCD36zFphzRhxByGNqL1wASLsr0XAVdJGa5Pu40OC0I
   nePQeqQ4OBu207U2v6HjCcjPFBpRjW0gVuFvoQaRSf3I3x+S61zs0c9LU
   cAI+FnGbKwUTAofYDgnzNma8lWG+r6b0j7MC+MquBHVCCVCMiRwgDVDJV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337107324"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="337107324"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 20:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630501302"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="630501302"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 20:01:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdMoz-0009lS-1m;
	Sat, 18 Mar 2023 03:01:29 +0000
Date: Sat, 18 Mar 2023 11:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] ring-buffer: Introducing ring-buffer mapping
 functions
Message-ID: <202303181001.bu7VCBhF-lkp@intel.com>
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
In-Reply-To: <20230317143310.1604700-2-vdonnefort@google.com>
References: <20230317143310.1604700-2-vdonnefort@google.com>
TO: Vincent Donnefort <vdonnefort@google.com>
TO: rostedt@goodmis.org
TO: mhiramat@kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-trace-kernel@vger.kernel.org
CC: kernel-team@android.com
CC: Vincent Donnefort <vdonnefort@google.com>

Hi Vincent,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on rostedt-trace/for-next v6.3-rc2 next-20230317]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230317-223437
patch link:    https://lore.kernel.org/r/20230317143310.1604700-2-vdonnefort%40google.com
patch subject: [PATCH 1/2] ring-buffer: Introducing ring-buffer mapping functions
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230318/202303181001.bu7VCBhF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303181001.bu7VCBhF-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:6137 ring_buffer_get_reader_page() warn: passing a valid pointer to 'PTR_ERR'
kernel/trace/ring_buffer.c:5996 rb_get_mapped_buffer() warn: inconsistent returns '&cpu_buffer->mapping_lock'.
kernel/trace/ring_buffer.c:6158 ring_buffer_update_meta_page() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +6137 kernel/trace/ring_buffer.c

e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5978  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5979  static inline struct ring_buffer_per_cpu *
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5980  rb_get_mapped_buffer(struct trace_buffer *buffer, int cpu)
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5981  {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5982  	struct ring_buffer_per_cpu *cpu_buffer;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5983  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5984  	if (!cpumask_test_cpu(cpu, buffer->cpumask))
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5985  		return ERR_PTR(-EINVAL);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5986  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5987  	cpu_buffer = buffer->buffers[cpu];
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5988  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5989  	mutex_lock(&cpu_buffer->mapping_lock);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5990  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5991  	if (!cpu_buffer->mapped) {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5992  		mutex_unlock(&cpu_buffer->mapping_lock);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5993  		return ERR_PTR(-ENODEV);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5994  	}
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5995  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17 @5996  	return cpu_buffer;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5997  }
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5998  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  5999  static inline void rb_put_mapped_buffer(struct ring_buffer_per_cpu *cpu_buffer)
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6000  {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6001  	mutex_unlock(&cpu_buffer->mapping_lock);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6002  }
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6003  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6004  int ring_buffer_map(struct trace_buffer *buffer, int cpu)
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6005  {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6006  	struct ring_buffer_per_cpu *cpu_buffer;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6007  	unsigned long flags, *page_ids;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6008  	int err = 0;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6009  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6010  	if (!cpumask_test_cpu(cpu, buffer->cpumask))
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6011  		return -EINVAL;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6012  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6013  	cpu_buffer = buffer->buffers[cpu];
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6014  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6015  	mutex_lock(&cpu_buffer->mapping_lock);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6016  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6017  	if (cpu_buffer->mapped) {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6018  		WRITE_ONCE(cpu_buffer->mapped, cpu_buffer->mapped + 1);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6019  		goto unlock;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6020  	}
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6021  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6022  	/* prevent another thread from changing buffer sizes */
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6023  	mutex_lock(&buffer->mutex);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6024  	atomic_inc(&cpu_buffer->resize_disabled);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6025  	mutex_unlock(&buffer->mutex);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6026  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6027  	err = rb_alloc_meta_page(cpu_buffer);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6028  	if (err) {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6029  		atomic_dec(&cpu_buffer->resize_disabled);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6030  		goto unlock;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6031  	}
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6032  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6033  	/* page_ids include the reader page while nr_pages does not */
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6034  	page_ids = kzalloc(sizeof(*page_ids) * (cpu_buffer->nr_pages + 1),
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6035  			   GFP_KERNEL);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6036  	if (!page_ids) {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6037  		rb_free_meta_page(cpu_buffer);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6038  		atomic_dec(&cpu_buffer->resize_disabled);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6039  		err = -ENOMEM;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6040  		goto unlock;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6041  	}
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6042  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6043  	/*
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6044  	 * Lock all readers to block any page swap until the page IDs are
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6045  	 * assigned.
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6046  	 */
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6047  	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6048  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6049  	rb_setup_ids_meta_page(cpu_buffer, page_ids);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6050  	/*
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6051  	 * Ensure the writer will observe the meta-page before
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6052  	 * cpu_buffer->mapped.
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6053  	 */
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6054  	smp_wmb();
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6055  	WRITE_ONCE(cpu_buffer->mapped, 1);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6056  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6057  	/* Init meta_page values unless the writer did it already */
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6058  	cmpxchg(&cpu_buffer->meta_page->entries, 0,
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6059  		local_read(&cpu_buffer->entries));
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6060  	cmpxchg(&cpu_buffer->meta_page->overrun, 0,
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6061  		local_read(&cpu_buffer->overrun));
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6062  	cmpxchg(&cpu_buffer->meta_page->pages_touched, 0,
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6063  		local_read(&cpu_buffer->pages_touched));
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6064  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6065  	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6066  unlock:
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6067  	mutex_unlock(&cpu_buffer->mapping_lock);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6068  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6069  	return err;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6070  }
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6071  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6072  int ring_buffer_unmap(struct trace_buffer *buffer, int cpu)
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6073  {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6074  	struct ring_buffer_per_cpu *cpu_buffer;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6075  	int err = 0;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6076  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6077  	if (!cpumask_test_cpu(cpu, buffer->cpumask))
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6078  		return -EINVAL;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6079  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6080  	cpu_buffer = buffer->buffers[cpu];
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6081  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6082  	mutex_lock(&cpu_buffer->mapping_lock);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6083  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6084  	if (!cpu_buffer->mapped) {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6085  		err = -ENODEV;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6086  		goto unlock;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6087  	}
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6088  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6089  	WRITE_ONCE(cpu_buffer->mapped, cpu_buffer->mapped - 1);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6090  	if (!cpu_buffer->mapped) {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6091  		/* Wait the writer and readers to observe !mapped */
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6092  		synchronize_rcu();
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6093  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6094  		rb_free_page_ids(cpu_buffer);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6095  		rb_free_meta_page(cpu_buffer);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6096  		atomic_dec(&cpu_buffer->resize_disabled);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6097  	}
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6098  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6099  unlock:
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6100  	mutex_unlock(&cpu_buffer->mapping_lock);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6101  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6102  	return err;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6103  }
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6104  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6105  /*
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6106   *   +--------------+
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6107   *   |   meta page  |  pgoff=0
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6108   *   +--------------+
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6109   *   |  data page1  |  pgoff=1 page_ids=0
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6110   *   +--------------+
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6111   *   |  data page2  |  pgoff=2 page_ids=1
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6112   *         ...
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6113   */
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6114  struct page *ring_buffer_map_fault(struct trace_buffer *buffer, int cpu,
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6115  				   unsigned long pgoff)
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6116  {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6117  	struct ring_buffer_per_cpu *cpu_buffer = buffer->buffers[cpu];
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6118  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6119  	if (!pgoff)
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6120  		return virt_to_page(cpu_buffer->meta_page);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6121  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6122  	pgoff--;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6123  	if (pgoff > cpu_buffer->nr_pages)
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6124  		return NULL;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6125  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6126  	return virt_to_page(cpu_buffer->page_ids[pgoff]);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6127  }
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6128  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6129  int ring_buffer_get_reader_page(struct trace_buffer *buffer, int cpu)
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6130  {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6131  	struct ring_buffer_per_cpu *cpu_buffer;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6132  	struct buffer_page *reader;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6133  	unsigned long flags;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6134  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6135  	cpu_buffer = rb_get_mapped_buffer(buffer, cpu);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6136  	if (IS_ERR(cpu_buffer))
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17 @6137  		return (int)PTR_ERR(cpu_buffer);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6138  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6139  	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6140  	reader = cpu_buffer->reader_page;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6141  	reader->read = rb_page_size(reader);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6142  	if (!rb_per_cpu_empty(cpu_buffer))
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6143  		WARN_ON(!rb_get_reader_page(cpu_buffer));
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6144  	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6145  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6146  	rb_put_mapped_buffer(cpu_buffer);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6147  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6148  	return 0;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6149  }
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6150  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6151  int ring_buffer_update_meta_page(struct trace_buffer *buffer, int cpu)
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6152  {
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6153  	struct ring_buffer_per_cpu *cpu_buffer;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6154  	unsigned long flags;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6155  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6156  	cpu_buffer = rb_get_mapped_buffer(buffer, cpu);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6157  	if (IS_ERR(cpu_buffer))
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17 @6158  		return PTR_ERR(cpu_buffer);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6159  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6160  	/* Update the head page if the writer moved it */
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6161  	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6162  	rb_set_head_page(cpu_buffer);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6163  	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6164  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6165  	rb_put_mapped_buffer(cpu_buffer);
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6166  
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6167  	return 0;
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6168  }
e6f6ebfdb93b0a Vincent Donnefort 2023-03-17  6169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
