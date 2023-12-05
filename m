Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B276EB48
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfhCydOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701815457; x=1733351457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XcT5PUQIvcmlX99k7+xDX+vBPMXE3xf7OyficoE28H4=;
  b=EfhCydOl9oQt2d/qjmvXpHjPM5hBThf00XaPNsfwsH0vcEu7upg3AoRB
   4QZHmDIe9knhCd6XFchWzsndWaijrS828XTdHE6QTuHrkTZ4qde7yYs58
   aCRvS1w430suRaYcKDpmJnH8EFb5zWm6nyLCNHUED3StK6SmmqlETVziR
   V47sRy07M0+JQU/m/hw+kCPQJXbJx1f7SMozVb78jdVaRliyeTD304zf5
   n6hco4QbSYc9ZGriZR/rUaRkSq8i17pc85TfT1Rc9ieimklMQTxVJr4Up
   uDEWMm5eUSvxdx+OlmWoZNRlYSXD9fpxwVR7jFR8vQhKINg93XSHUUAlv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396760079"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="396760079"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 14:30:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="19119390"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 14:30:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdwL-0009oH-1I;
	Tue, 05 Dec 2023 22:30:53 +0000
Date: Wed, 6 Dec 2023 06:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/xen/privcmd.c:1118:19-24: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202312060639.Y4O1iOfX-lkp@intel.com>
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
TO: Viresh Kumar <viresh.kumar@linaro.org>
CC: Juergen Gross <jgross@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: f0d7db7b33243d2aeeff14dbdde4ccc0687ef257 xen: privcmd: Add support for ioeventfd
date:   7 weeks ago
:::::: branch date: 25 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-103-20231202 (https://download.01.org/0day-ci/archive/20231206/202312060639.Y4O1iOfX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060639.Y4O1iOfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060639.Y4O1iOfX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/xen/privcmd.c:1118:19-24: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
--
>> drivers/xen/privcmd.c:1227:9-16: WARNING opportunity for memdup_user

vim +1118 drivers/xen/privcmd.c

f0d7db7b33243d Viresh Kumar 2023-10-16  1108  
f0d7db7b33243d Viresh Kumar 2023-10-16  1109  /* per-guest structure */
f0d7db7b33243d Viresh Kumar 2023-10-16  1110  struct privcmd_kernel_ioreq {
f0d7db7b33243d Viresh Kumar 2023-10-16  1111  	domid_t dom;
f0d7db7b33243d Viresh Kumar 2023-10-16  1112  	unsigned int vcpus;
f0d7db7b33243d Viresh Kumar 2023-10-16  1113  	u64 uioreq;
f0d7db7b33243d Viresh Kumar 2023-10-16  1114  	struct ioreq *ioreq;
f0d7db7b33243d Viresh Kumar 2023-10-16  1115  	spinlock_t lock; /* Protects ioeventfds list */
f0d7db7b33243d Viresh Kumar 2023-10-16  1116  	struct list_head ioeventfds;
f0d7db7b33243d Viresh Kumar 2023-10-16  1117  	struct list_head list;
f0d7db7b33243d Viresh Kumar 2023-10-16 @1118  	struct ioreq_port ports[0];
f0d7db7b33243d Viresh Kumar 2023-10-16  1119  };
f0d7db7b33243d Viresh Kumar 2023-10-16  1120  
f0d7db7b33243d Viresh Kumar 2023-10-16  1121  static irqreturn_t ioeventfd_interrupt(int irq, void *dev_id)
f0d7db7b33243d Viresh Kumar 2023-10-16  1122  {
f0d7db7b33243d Viresh Kumar 2023-10-16  1123  	struct ioreq_port *port = dev_id;
f0d7db7b33243d Viresh Kumar 2023-10-16  1124  	struct privcmd_kernel_ioreq *kioreq = port->kioreq;
f0d7db7b33243d Viresh Kumar 2023-10-16  1125  	struct ioreq *ioreq = &kioreq->ioreq[port->vcpu];
f0d7db7b33243d Viresh Kumar 2023-10-16  1126  	struct privcmd_kernel_ioeventfd *kioeventfd;
f0d7db7b33243d Viresh Kumar 2023-10-16  1127  	unsigned int state = STATE_IOREQ_READY;
f0d7db7b33243d Viresh Kumar 2023-10-16  1128  
f0d7db7b33243d Viresh Kumar 2023-10-16  1129  	if (ioreq->state != STATE_IOREQ_READY ||
f0d7db7b33243d Viresh Kumar 2023-10-16  1130  	    ioreq->type != IOREQ_TYPE_COPY || ioreq->dir != IOREQ_WRITE)
f0d7db7b33243d Viresh Kumar 2023-10-16  1131  		return IRQ_NONE;
f0d7db7b33243d Viresh Kumar 2023-10-16  1132  
f0d7db7b33243d Viresh Kumar 2023-10-16  1133  	/*
f0d7db7b33243d Viresh Kumar 2023-10-16  1134  	 * We need a barrier, smp_mb(), here to ensure reads are finished before
f0d7db7b33243d Viresh Kumar 2023-10-16  1135  	 * `state` is updated. Since the lock implementation ensures that
f0d7db7b33243d Viresh Kumar 2023-10-16  1136  	 * appropriate barrier will be added anyway, we can avoid adding
f0d7db7b33243d Viresh Kumar 2023-10-16  1137  	 * explicit barrier here.
f0d7db7b33243d Viresh Kumar 2023-10-16  1138  	 *
f0d7db7b33243d Viresh Kumar 2023-10-16  1139  	 * Ideally we don't need to update `state` within the locks, but we do
f0d7db7b33243d Viresh Kumar 2023-10-16  1140  	 * that here to avoid adding explicit barrier.
f0d7db7b33243d Viresh Kumar 2023-10-16  1141  	 */
f0d7db7b33243d Viresh Kumar 2023-10-16  1142  
f0d7db7b33243d Viresh Kumar 2023-10-16  1143  	spin_lock(&kioreq->lock);
f0d7db7b33243d Viresh Kumar 2023-10-16  1144  	ioreq->state = STATE_IOREQ_INPROCESS;
f0d7db7b33243d Viresh Kumar 2023-10-16  1145  
f0d7db7b33243d Viresh Kumar 2023-10-16  1146  	list_for_each_entry(kioeventfd, &kioreq->ioeventfds, list) {
f0d7db7b33243d Viresh Kumar 2023-10-16  1147  		if (ioreq->addr == kioeventfd->addr + VIRTIO_MMIO_QUEUE_NOTIFY &&
f0d7db7b33243d Viresh Kumar 2023-10-16  1148  		    ioreq->size == kioeventfd->addr_len &&
f0d7db7b33243d Viresh Kumar 2023-10-16  1149  		    (ioreq->data & QUEUE_NOTIFY_VQ_MASK) == kioeventfd->vq) {
f0d7db7b33243d Viresh Kumar 2023-10-16  1150  			eventfd_signal(kioeventfd->eventfd, 1);
f0d7db7b33243d Viresh Kumar 2023-10-16  1151  			state = STATE_IORESP_READY;
f0d7db7b33243d Viresh Kumar 2023-10-16  1152  			break;
f0d7db7b33243d Viresh Kumar 2023-10-16  1153  		}
f0d7db7b33243d Viresh Kumar 2023-10-16  1154  	}
f0d7db7b33243d Viresh Kumar 2023-10-16  1155  	spin_unlock(&kioreq->lock);
f0d7db7b33243d Viresh Kumar 2023-10-16  1156  
f0d7db7b33243d Viresh Kumar 2023-10-16  1157  	/*
f0d7db7b33243d Viresh Kumar 2023-10-16  1158  	 * We need a barrier, smp_mb(), here to ensure writes are finished
f0d7db7b33243d Viresh Kumar 2023-10-16  1159  	 * before `state` is updated. Since the lock implementation ensures that
f0d7db7b33243d Viresh Kumar 2023-10-16  1160  	 * appropriate barrier will be added anyway, we can avoid adding
f0d7db7b33243d Viresh Kumar 2023-10-16  1161  	 * explicit barrier here.
f0d7db7b33243d Viresh Kumar 2023-10-16  1162  	 */
f0d7db7b33243d Viresh Kumar 2023-10-16  1163  
f0d7db7b33243d Viresh Kumar 2023-10-16  1164  	ioreq->state = state;
f0d7db7b33243d Viresh Kumar 2023-10-16  1165  
f0d7db7b33243d Viresh Kumar 2023-10-16  1166  	if (state == STATE_IORESP_READY) {
f0d7db7b33243d Viresh Kumar 2023-10-16  1167  		notify_remote_via_evtchn(port->port);
f0d7db7b33243d Viresh Kumar 2023-10-16  1168  		return IRQ_HANDLED;
f0d7db7b33243d Viresh Kumar 2023-10-16  1169  	}
f0d7db7b33243d Viresh Kumar 2023-10-16  1170  
f0d7db7b33243d Viresh Kumar 2023-10-16  1171  	return IRQ_NONE;
f0d7db7b33243d Viresh Kumar 2023-10-16  1172  }
f0d7db7b33243d Viresh Kumar 2023-10-16  1173  
f0d7db7b33243d Viresh Kumar 2023-10-16  1174  static void ioreq_free(struct privcmd_kernel_ioreq *kioreq)
f0d7db7b33243d Viresh Kumar 2023-10-16  1175  {
f0d7db7b33243d Viresh Kumar 2023-10-16  1176  	struct ioreq_port *ports = kioreq->ports;
f0d7db7b33243d Viresh Kumar 2023-10-16  1177  	int i;
f0d7db7b33243d Viresh Kumar 2023-10-16  1178  
f0d7db7b33243d Viresh Kumar 2023-10-16  1179  	lockdep_assert_held(&ioreq_lock);
f0d7db7b33243d Viresh Kumar 2023-10-16  1180  
f0d7db7b33243d Viresh Kumar 2023-10-16  1181  	list_del(&kioreq->list);
f0d7db7b33243d Viresh Kumar 2023-10-16  1182  
f0d7db7b33243d Viresh Kumar 2023-10-16  1183  	for (i = kioreq->vcpus - 1; i >= 0; i--)
f0d7db7b33243d Viresh Kumar 2023-10-16  1184  		unbind_from_irqhandler(irq_from_evtchn(ports[i].port), &ports[i]);
f0d7db7b33243d Viresh Kumar 2023-10-16  1185  
f0d7db7b33243d Viresh Kumar 2023-10-16  1186  	kfree(kioreq);
f0d7db7b33243d Viresh Kumar 2023-10-16  1187  }
f0d7db7b33243d Viresh Kumar 2023-10-16  1188  
f0d7db7b33243d Viresh Kumar 2023-10-16  1189  static
f0d7db7b33243d Viresh Kumar 2023-10-16  1190  struct privcmd_kernel_ioreq *alloc_ioreq(struct privcmd_ioeventfd *ioeventfd)
f0d7db7b33243d Viresh Kumar 2023-10-16  1191  {
f0d7db7b33243d Viresh Kumar 2023-10-16  1192  	struct privcmd_kernel_ioreq *kioreq;
f0d7db7b33243d Viresh Kumar 2023-10-16  1193  	struct mm_struct *mm = current->mm;
f0d7db7b33243d Viresh Kumar 2023-10-16  1194  	struct vm_area_struct *vma;
f0d7db7b33243d Viresh Kumar 2023-10-16  1195  	struct page **pages;
f0d7db7b33243d Viresh Kumar 2023-10-16  1196  	unsigned int *ports;
f0d7db7b33243d Viresh Kumar 2023-10-16  1197  	int ret, size, i;
f0d7db7b33243d Viresh Kumar 2023-10-16  1198  
f0d7db7b33243d Viresh Kumar 2023-10-16  1199  	lockdep_assert_held(&ioreq_lock);
f0d7db7b33243d Viresh Kumar 2023-10-16  1200  
f0d7db7b33243d Viresh Kumar 2023-10-16  1201  	size = struct_size(kioreq, ports, ioeventfd->vcpus);
f0d7db7b33243d Viresh Kumar 2023-10-16  1202  	kioreq = kzalloc(size, GFP_KERNEL);
f0d7db7b33243d Viresh Kumar 2023-10-16  1203  	if (!kioreq)
f0d7db7b33243d Viresh Kumar 2023-10-16  1204  		return ERR_PTR(-ENOMEM);
f0d7db7b33243d Viresh Kumar 2023-10-16  1205  
f0d7db7b33243d Viresh Kumar 2023-10-16  1206  	kioreq->dom = ioeventfd->dom;
f0d7db7b33243d Viresh Kumar 2023-10-16  1207  	kioreq->vcpus = ioeventfd->vcpus;
f0d7db7b33243d Viresh Kumar 2023-10-16  1208  	kioreq->uioreq = ioeventfd->ioreq;
f0d7db7b33243d Viresh Kumar 2023-10-16  1209  	spin_lock_init(&kioreq->lock);
f0d7db7b33243d Viresh Kumar 2023-10-16  1210  	INIT_LIST_HEAD(&kioreq->ioeventfds);
f0d7db7b33243d Viresh Kumar 2023-10-16  1211  
f0d7db7b33243d Viresh Kumar 2023-10-16  1212  	/* The memory for ioreq server must have been mapped earlier */
f0d7db7b33243d Viresh Kumar 2023-10-16  1213  	mmap_write_lock(mm);
f0d7db7b33243d Viresh Kumar 2023-10-16  1214  	vma = find_vma(mm, (unsigned long)ioeventfd->ioreq);
f0d7db7b33243d Viresh Kumar 2023-10-16  1215  	if (!vma) {
f0d7db7b33243d Viresh Kumar 2023-10-16  1216  		pr_err("Failed to find vma for ioreq page!\n");
f0d7db7b33243d Viresh Kumar 2023-10-16  1217  		mmap_write_unlock(mm);
f0d7db7b33243d Viresh Kumar 2023-10-16  1218  		ret = -EFAULT;
f0d7db7b33243d Viresh Kumar 2023-10-16  1219  		goto error_kfree;
f0d7db7b33243d Viresh Kumar 2023-10-16  1220  	}
f0d7db7b33243d Viresh Kumar 2023-10-16  1221  
f0d7db7b33243d Viresh Kumar 2023-10-16  1222  	pages = vma->vm_private_data;
f0d7db7b33243d Viresh Kumar 2023-10-16  1223  	kioreq->ioreq = (struct ioreq *)(page_to_virt(pages[0]));
f0d7db7b33243d Viresh Kumar 2023-10-16  1224  	mmap_write_unlock(mm);
f0d7db7b33243d Viresh Kumar 2023-10-16  1225  
f0d7db7b33243d Viresh Kumar 2023-10-16  1226  	size = sizeof(*ports) * kioreq->vcpus;
f0d7db7b33243d Viresh Kumar 2023-10-16 @1227  	ports = kzalloc(size, GFP_KERNEL);
f0d7db7b33243d Viresh Kumar 2023-10-16  1228  	if (!ports) {
f0d7db7b33243d Viresh Kumar 2023-10-16  1229  		ret = -ENOMEM;
f0d7db7b33243d Viresh Kumar 2023-10-16  1230  		goto error_kfree;
f0d7db7b33243d Viresh Kumar 2023-10-16  1231  	}
f0d7db7b33243d Viresh Kumar 2023-10-16  1232  
f0d7db7b33243d Viresh Kumar 2023-10-16  1233  	if (copy_from_user(ports, u64_to_user_ptr(ioeventfd->ports), size)) {
f0d7db7b33243d Viresh Kumar 2023-10-16  1234  		ret = -EFAULT;
f0d7db7b33243d Viresh Kumar 2023-10-16  1235  		goto error_kfree_ports;
f0d7db7b33243d Viresh Kumar 2023-10-16  1236  	}
f0d7db7b33243d Viresh Kumar 2023-10-16  1237  
f0d7db7b33243d Viresh Kumar 2023-10-16  1238  	for (i = 0; i < kioreq->vcpus; i++) {
f0d7db7b33243d Viresh Kumar 2023-10-16  1239  		kioreq->ports[i].vcpu = i;
f0d7db7b33243d Viresh Kumar 2023-10-16  1240  		kioreq->ports[i].port = ports[i];
f0d7db7b33243d Viresh Kumar 2023-10-16  1241  		kioreq->ports[i].kioreq = kioreq;
f0d7db7b33243d Viresh Kumar 2023-10-16  1242  
f0d7db7b33243d Viresh Kumar 2023-10-16  1243  		ret = bind_evtchn_to_irqhandler_lateeoi(ports[i],
f0d7db7b33243d Viresh Kumar 2023-10-16  1244  				ioeventfd_interrupt, IRQF_SHARED, "ioeventfd",
f0d7db7b33243d Viresh Kumar 2023-10-16  1245  				&kioreq->ports[i]);
f0d7db7b33243d Viresh Kumar 2023-10-16  1246  		if (ret < 0)
f0d7db7b33243d Viresh Kumar 2023-10-16  1247  			goto error_unbind;
f0d7db7b33243d Viresh Kumar 2023-10-16  1248  	}
f0d7db7b33243d Viresh Kumar 2023-10-16  1249  
f0d7db7b33243d Viresh Kumar 2023-10-16  1250  	kfree(ports);
f0d7db7b33243d Viresh Kumar 2023-10-16  1251  
f0d7db7b33243d Viresh Kumar 2023-10-16  1252  	list_add_tail(&kioreq->list, &ioreq_list);
f0d7db7b33243d Viresh Kumar 2023-10-16  1253  
f0d7db7b33243d Viresh Kumar 2023-10-16  1254  	return kioreq;
f0d7db7b33243d Viresh Kumar 2023-10-16  1255  
f0d7db7b33243d Viresh Kumar 2023-10-16  1256  error_unbind:
f0d7db7b33243d Viresh Kumar 2023-10-16  1257  	while (--i >= 0)
f0d7db7b33243d Viresh Kumar 2023-10-16  1258  		unbind_from_irqhandler(irq_from_evtchn(ports[i]), &kioreq->ports[i]);
f0d7db7b33243d Viresh Kumar 2023-10-16  1259  error_kfree_ports:
f0d7db7b33243d Viresh Kumar 2023-10-16  1260  	kfree(ports);
f0d7db7b33243d Viresh Kumar 2023-10-16  1261  error_kfree:
f0d7db7b33243d Viresh Kumar 2023-10-16  1262  	kfree(kioreq);
f0d7db7b33243d Viresh Kumar 2023-10-16  1263  	return ERR_PTR(ret);
f0d7db7b33243d Viresh Kumar 2023-10-16  1264  }
f0d7db7b33243d Viresh Kumar 2023-10-16  1265  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
