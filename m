Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6C51E52C
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Aug 2024 04:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723868971; cv=none; b=mPRbo36V5RP/qiePH6q2an9b3WX4BSQUZKW71vuYDN/+jI5e+Az9+44I3fbUVah9WDy26nXfafhh/QIu4ggWv7Z1hQPIGoOryhOL9DgaLK5QLGF/bjR0ZDsIEkpfVmFC6k4FLSifBZKpiGi18o4+f22iRv8Nz7QfYw75flByxos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723868971; c=relaxed/simple;
	bh=s7KVVBEXlEAwdLppScVht+tUF0bFNIyKXWlmAorfyGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqYHFnbqsWR8LZFmTT/cmgmghP90XxNxL9hCaylSzQayDTJ+6UE7psvTb5NdrzmMb5NuQg8CtmJLnm7s5azTYPG2TfJV7uX6cNsTinG62MmCramYYVxRILV2sW5iK0rzXH5pUMwbE/htR4njdbabJCNUHx1ewH+nnFHNMAV5fjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOtxwQVi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOtxwQVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723868968; x=1755404968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s7KVVBEXlEAwdLppScVht+tUF0bFNIyKXWlmAorfyGg=;
  b=iOtxwQViIUZAoZ3YQaPHWg5zmSrp7Ryg/ENJq1CL4aLV9MuSJYmTUIju
   ifDZFHuUZObsBqlHs+axRW/CuHx9Uetbqlamh57mlmQz04+ZzwQveQ7/0
   7dGDAft6O8Y7zJUwNe4HtXcm4zKn33QRW1R6t4AP2x2r6Zvn2U0YSsc+8
   Ih5JazJG5Ilf+glfyPYU96JmhTL269nabZCDBamyWmQ7gRBMfS2ocKuWI
   ghKH3SiS2jbrKsADjm+CuHzi966087es8KfAlL/1pdDbAouoE73imtzVy
   zCwTvkIG1kIvLjq2nH6YrrrWVSb+bPt1vO4vvIyWkevvTMKZLJijveBF+
   A==;
X-CSE-ConnectionGUID: YAu3WQ02Q0WL+Sy/NTzSmw==
X-CSE-MsgGUID: p4JPy8QXT0iSK/QiFKd+kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="13065813"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="13065813"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 21:29:27 -0700
X-CSE-ConnectionGUID: 5VLu5QthSM6iPjZiVZl+0g==
X-CSE-MsgGUID: 79YMkRRqRJmeKs7uI7eyzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="60017327"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Aug 2024 21:29:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfB48-0007BG-15;
	Sat, 17 Aug 2024 04:29:24 +0000
Date: Sat, 17 Aug 2024 12:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4] USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL
Message-ID: <202408171146.0RjWnTq8-lkp@intel.com>
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
In-Reply-To: <20240814125525.3917130-2-crwulff@gmail.com>
References: <20240814125525.3917130-2-crwulff@gmail.com>
TO: crwulff@gmail.com
TO: linux-usb@vger.kernel.org
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Konstantin Aladyshev <aladyshev22@gmail.com>
CC: David Sands <david.sands@biamp.com>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: linux-kernel@vger.kernel.org
CC: Chris Wulff <Chris.Wulff@biamp.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/crwulff-gmail-com/USB-gadget-f_hid-Add-GET_REPORT-via-userspace-IOCTL/20240814-225520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240814125525.3917130-2-crwulff%40gmail.com
patch subject: [PATCH v4] USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240817 (https://download.01.org/0day-ci/archive/20240817/202408171146.0RjWnTq8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408171146.0RjWnTq8-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_hid.c:705 f_hidg_get_report() warn: inconsistent returns '&hidg->get_report_spinlock'.
drivers/usb/gadget/function/f_hid.c:705 f_hidg_get_report() warn: inconsistent returns 'flags'.

vim +705 drivers/usb/gadget/function/f_hid.c

fce51fb916013b Chris Wulff 2024-08-14  652  
fce51fb916013b Chris Wulff 2024-08-14  653  static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *buffer)
fce51fb916013b Chris Wulff 2024-08-14  654  {
fce51fb916013b Chris Wulff 2024-08-14  655  	struct f_hidg			*hidg = file->private_data;
fce51fb916013b Chris Wulff 2024-08-14  656  	struct usb_composite_dev	*cdev = hidg->func.config->cdev;
fce51fb916013b Chris Wulff 2024-08-14  657  	unsigned long	flags;
fce51fb916013b Chris Wulff 2024-08-14  658  	struct report_entry *entry;
fce51fb916013b Chris Wulff 2024-08-14  659  	struct report_entry *ptr;
fce51fb916013b Chris Wulff 2024-08-14  660  	__u8 report_id;
fce51fb916013b Chris Wulff 2024-08-14  661  
fce51fb916013b Chris Wulff 2024-08-14  662  	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
fce51fb916013b Chris Wulff 2024-08-14  663  	if (!entry)
fce51fb916013b Chris Wulff 2024-08-14  664  		return -ENOMEM;
fce51fb916013b Chris Wulff 2024-08-14  665  
fce51fb916013b Chris Wulff 2024-08-14  666  	if (copy_from_user(&entry->report_data, buffer,
fce51fb916013b Chris Wulff 2024-08-14  667  				sizeof(struct usb_hidg_report))) {
fce51fb916013b Chris Wulff 2024-08-14  668  		ERROR(cdev, "copy_from_user error\n");
fce51fb916013b Chris Wulff 2024-08-14  669  		kfree(entry);
fce51fb916013b Chris Wulff 2024-08-14  670  		return -EINVAL;
fce51fb916013b Chris Wulff 2024-08-14  671  	}
fce51fb916013b Chris Wulff 2024-08-14  672  
fce51fb916013b Chris Wulff 2024-08-14  673  	report_id = entry->report_data.report_id;
fce51fb916013b Chris Wulff 2024-08-14  674  
fce51fb916013b Chris Wulff 2024-08-14  675  	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
fce51fb916013b Chris Wulff 2024-08-14  676  	ptr = f_hidg_search_for_report(hidg, report_id);
fce51fb916013b Chris Wulff 2024-08-14  677  
fce51fb916013b Chris Wulff 2024-08-14  678  	if (ptr) {
fce51fb916013b Chris Wulff 2024-08-14  679  		/* Report already exists in list - update it */
fce51fb916013b Chris Wulff 2024-08-14  680  		if (copy_from_user(&ptr->report_data, buffer,
fce51fb916013b Chris Wulff 2024-08-14  681  				sizeof(struct usb_hidg_report))) {
fce51fb916013b Chris Wulff 2024-08-14  682  			ERROR(cdev, "copy_from_user error\n");
fce51fb916013b Chris Wulff 2024-08-14  683  			kfree(entry);
fce51fb916013b Chris Wulff 2024-08-14  684  			return -EINVAL;
fce51fb916013b Chris Wulff 2024-08-14  685  		}
fce51fb916013b Chris Wulff 2024-08-14  686  		kfree(entry);
fce51fb916013b Chris Wulff 2024-08-14  687  	} else {
fce51fb916013b Chris Wulff 2024-08-14  688  		/* Report does not exist in list - add it */
fce51fb916013b Chris Wulff 2024-08-14  689  		list_add_tail(&entry->node, &hidg->report_list);
fce51fb916013b Chris Wulff 2024-08-14  690  	}
fce51fb916013b Chris Wulff 2024-08-14  691  
fce51fb916013b Chris Wulff 2024-08-14  692  	/* If there is no response pending then do nothing further */
fce51fb916013b Chris Wulff 2024-08-14  693  	if (hidg->get_report_returned) {
fce51fb916013b Chris Wulff 2024-08-14  694  		spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
fce51fb916013b Chris Wulff 2024-08-14  695  		return 0;
fce51fb916013b Chris Wulff 2024-08-14  696  	}
fce51fb916013b Chris Wulff 2024-08-14  697  
fce51fb916013b Chris Wulff 2024-08-14  698  	/* If this userspace response serves the current pending report */
fce51fb916013b Chris Wulff 2024-08-14  699  	if (hidg->get_report_req_report_id == report_id) {
fce51fb916013b Chris Wulff 2024-08-14  700  		hidg->get_report_returned = true;
fce51fb916013b Chris Wulff 2024-08-14  701  		wake_up(&hidg->get_queue);
fce51fb916013b Chris Wulff 2024-08-14  702  	}
fce51fb916013b Chris Wulff 2024-08-14  703  
fce51fb916013b Chris Wulff 2024-08-14  704  	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
fce51fb916013b Chris Wulff 2024-08-14 @705  	return 0;
fce51fb916013b Chris Wulff 2024-08-14  706  }
fce51fb916013b Chris Wulff 2024-08-14  707  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
