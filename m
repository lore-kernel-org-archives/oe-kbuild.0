Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172E538DE6
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 21:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3MGPw/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700515693; x=1732051693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QaRjF61JQgVOkscESaTYc6F1Mz63DtLX+EVFlNUWLIw=;
  b=I3MGPw/UbhOLEyvPRRTp6WJ64UwoMDoxri3nJuEk9oZAh3Mm938B14kB
   VaaWjZo4X2KzwUKInakNLhNSv9EfOQ95K2XXtJHgquspgqngRouEjlob+
   kg8Ayz9EYmdG68vgb5usINxdbzkEgNeP/zYTndLS+CRh2alvvOgSRGhEL
   DnVVVJVhlsf6PfSgbrUTTTtkvvnUxICOAiKtGng+dzU0yi/vqbOBNbVTA
   OpMXdxjrDCvKjd6hnXr6PumuAOJp+DrkDnuPCMEB/82gJg7bcU0zOflN2
   KPCy6Sgv8iy59555yihVyG/VcSUsRSnWtFQqRGN9Z6FNM/O0ZXkR2opwK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4823348"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="4823348"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:28:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7688819"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2023 13:28:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5BoN-0006wM-2o;
	Mon, 20 Nov 2023 21:28:07 +0000
Date: Tue, 21 Nov 2023 05:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/virt/vboxguest/vboxguest_linux.c:65: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311210515.oI9mxbKB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Larry Finger <Larry.Finger@lwfinger.net>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: 0ba002bc4393dcfae031fc707b11c094b46a5048 virt: Add vboxguest driver for Virtual Box Guest integration
date:   6 years ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 years ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231121/202311210515.oI9mxbKB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210515.oI9mxbKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311210515.oI9mxbKB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/vboxguest/vboxguest_linux.c:65: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Close device.
   drivers/virt/vboxguest/vboxguest_linux.c:78: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Device I/O Control entry point.
   drivers/virt/vboxguest/vboxguest_linux.c:161: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Called when the input device is first opened.
   drivers/virt/vboxguest/vboxguest_linux.c:179: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Called if all open handles to the input device are closed.
   drivers/virt/vboxguest/vboxguest_linux.c:191: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Creates the kernel input device.
   drivers/virt/vboxguest/vboxguest_linux.c:243: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Does the PCI detection and init of the device.
   drivers/virt/vboxguest/vboxguest_linux.c:424: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Callback for mouse events.
--
>> drivers/virt/vboxguest/vboxguest_core.c:31: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Reserves memory in which the VMM can relocate any guest mappings
   drivers/virt/vboxguest/vboxguest_core.c:122: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Undo what vbg_guest_mappings_init did.
   drivers/virt/vboxguest/vboxguest_core.c:162: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Report the guest information to the host.
   drivers/virt/vboxguest/vboxguest_core.c:223: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Report the guest driver status to the host.
   drivers/virt/vboxguest/vboxguest_core.c:254: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Inflate the balloon by one chunk. The caller owns the balloon mutex.
   drivers/virt/vboxguest/vboxguest_core.c:304: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Deflate the balloon by one chunk. The caller owns the balloon mutex.
   drivers/virt/vboxguest/vboxguest_core.c:337: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Respond to VMMDEV_EVENT_BALLOON_CHANGE_REQUEST events, query the size
   drivers/virt/vboxguest/vboxguest_core.c:402: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Callback for heartbeat timer.
   drivers/virt/vboxguest/vboxguest_core.c:414: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Configure the host to check guest's heartbeat
   drivers/virt/vboxguest/vboxguest_core.c:440: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initializes the heartbeat timer. This feature may be disabled by the host.
   drivers/virt/vboxguest/vboxguest_core.c:477: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Cleanup hearbeat code, stop HB timer and disable host heartbeat checking.
   drivers/virt/vboxguest/vboxguest_core.c:489: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Applies a change to the bit usage tracker.
   drivers/virt/vboxguest/vboxguest_core.c:525: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Init and termination worker for resetting the (host) event filter on the host
   drivers/virt/vboxguest/vboxguest_core.c:551: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Changes the event filter mask for the given session.
   drivers/virt/vboxguest/vboxguest_core.c:626: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Init and termination worker for set guest capabilities to zero on the host.
   drivers/virt/vboxguest/vboxguest_core.c:650: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Sets the guest capabilities for a session. Takes the session spinlock.
   drivers/virt/vboxguest/vboxguest_core.c:721: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * vbg_query_host_version get the host feature mask and version information.
   drivers/virt/vboxguest/vboxguest_core.c:757: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initializes the VBoxGuest device extension when the
>> drivers/virt/vboxguest/vboxguest_core.c:866: warning: expecting prototype for Call this on exit to clean-up vboxguest(). Prototype was for vbg_core_exit() instead
   drivers/virt/vboxguest/vboxguest_core.c:883: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Creates a VBoxGuest user session.
   drivers/virt/vboxguest/vboxguest_core.c:905: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Closes a VBoxGuest session.
   drivers/virt/vboxguest/vboxguest_core.c:1063: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Checks if the VMM request is allowed in the context of the given session.
   drivers/virt/vboxguest/vboxguest_core.c:1423: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Common IOCtl for user to kernel communication.
>> drivers/virt/vboxguest/vboxguest_core.c:1500: warning: expecting prototype for Report guest supported mouse(). Prototype was for vbg_core_set_mouse_status() instead
   drivers/virt/vboxguest/vboxguest_core.o: warning: objtool: vbg_report_guest_info()+0x80: sibling call from callable instruction with modified stack frame
--
>> drivers/virt/vboxguest/vboxguest_utils.c:225: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Preprocesses the HGCM call, validate parameters, alloc bounce buffers and
   drivers/virt/vboxguest/vboxguest_utils.c:289: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Translates linear address types to page list direction flags.
   drivers/virt/vboxguest/vboxguest_utils.c:357: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initializes the call request that we're sending to the host.
   drivers/virt/vboxguest/vboxguest_utils.c:413: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Tries to cancel a pending HGCM call.
   drivers/virt/vboxguest/vboxguest_utils.c:447: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Performs the call and completion wait.
   drivers/virt/vboxguest/vboxguest_utils.c:528: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copies the result of the call back to the caller info structure and user
   drivers/virt/vboxguest/vboxguest_utils.o: warning: objtool: vbg_info()+0x6e: sibling call from callable instruction with modified stack frame
   drivers/virt/vboxguest/vboxguest_utils.o: warning: objtool: vbg_warn()+0x6e: sibling call from callable instruction with modified stack frame
   drivers/virt/vboxguest/vboxguest_utils.o: warning: objtool: vbg_err()+0x6e: sibling call from callable instruction with modified stack frame
   drivers/virt/vboxguest/vboxguest_utils.o: warning: objtool: vbg_info.cold()+0x2a: return with modified stack frame
   drivers/virt/vboxguest/vboxguest_utils.o: warning: objtool: vbg_warn.cold()+0x2a: return with modified stack frame
   drivers/virt/vboxguest/vboxguest_utils.o: warning: objtool: vbg_err.cold()+0x2a: return with modified stack frame


vim +65 drivers/virt/vboxguest/vboxguest_linux.c

0ba002bc4393dc Hans de Goede 2017-11-30  63  
0ba002bc4393dc Hans de Goede 2017-11-30  64  /**
0ba002bc4393dc Hans de Goede 2017-11-30 @65   * Close device.
0ba002bc4393dc Hans de Goede 2017-11-30  66   * Return: 0 on success, negated errno on failure.
0ba002bc4393dc Hans de Goede 2017-11-30  67   * @inode:		Pointer to inode info structure.
0ba002bc4393dc Hans de Goede 2017-11-30  68   * @filp:		Associated file pointer.
0ba002bc4393dc Hans de Goede 2017-11-30  69   */
0ba002bc4393dc Hans de Goede 2017-11-30  70  static int vbg_misc_device_close(struct inode *inode, struct file *filp)
0ba002bc4393dc Hans de Goede 2017-11-30  71  {
0ba002bc4393dc Hans de Goede 2017-11-30  72  	vbg_core_close_session(filp->private_data);
0ba002bc4393dc Hans de Goede 2017-11-30  73  	filp->private_data = NULL;
0ba002bc4393dc Hans de Goede 2017-11-30  74  	return 0;
0ba002bc4393dc Hans de Goede 2017-11-30  75  }
0ba002bc4393dc Hans de Goede 2017-11-30  76  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
