Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62292CCA9
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 23:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751065439; cv=none; b=iBOpk20hI8kJFZKmwEJ5zpHsfzSV7bHAzxJaILWaCntn9BiVp3YYxa2AtmvT+ko4YuRzGvE3uCOQ0c8gI+f8BpwcS6n5CyYScHvzHNpbctp/49nWRSAUxz+KE6gnLySJgELasSq/ZKPs4aWz4rTIOdDdjrsj3DmM50OgSCOBXBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751065439; c=relaxed/simple;
	bh=d8D2gP9JflA+Z179sGsKppXZNYpt4BsRPrPc6vPsVco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J747TLkxaOUMl7q5PQlY2b4KsZW2nj2gLOsdW5aV8CGaJNBAfv+LpvzyVxjZBT0HuF1jXjHbj+AI+Qj9AgazsEA1SriPNpTRgzr93nRIz0mUE+5Q1XpwTexDbN432hXrT+/1kXfwCdOywv0/zn7GjonQTduXFqk9DANxoHcXv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hr6V+MEV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hr6V+MEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751065436; x=1782601436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d8D2gP9JflA+Z179sGsKppXZNYpt4BsRPrPc6vPsVco=;
  b=Hr6V+MEV8oTOYwFPwCsVSo4j6W3EhTPQrKATlnbhfuowdN89c77M92TN
   GhRaNC0p9+tIvFSL5xGdjiSZdZOLDQNOAF5t5N4v0YrZsx+QMgnbugxFy
   mpbyrpoHOvoxZfvT5SvfeEcFYiGbG0cFA9bkfTyqedt0xaW1Lf0dwrfgq
   5JV4ljKkIvlkB5Xn/p3W/2JiLPoIKQNZGj9gYZEpcFSy9VOdZUyzEGgIi
   PAKMUKAtaWB/xOjVXos0wNKqRhBJKwxtEWrWzUNZv3Psm8vLoEcgSpm1m
   U3tQ3JANS94/0vSOcKmUPrPFWEj5SGoSxYccinWSp1t3iSmjWw0fbiQq0
   Q==;
X-CSE-ConnectionGUID: MJoVXnUWTgGjfxdu2mdmUA==
X-CSE-MsgGUID: Ely/XuPhR0ilJk/04sz8Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52502992"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="52502992"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 16:03:56 -0700
X-CSE-ConnectionGUID: IN16vspaQCOgmrRCABs5yw==
X-CSE-MsgGUID: 5bSLLDNARtOpwlyRdCvOYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="152654087"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jun 2025 16:03:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVI6q-000WbK-0Q;
	Fri, 27 Jun 2025 23:03:52 +0000
Date: Sat, 28 Jun 2025 07:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] cxl/memdev: automate cleanup with __free()
Message-ID: <202506280653.WmzTbwEN-lkp@intel.com>
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
In-Reply-To: <20250623083841.364002-1-pranav.tyagi03@gmail.com>
References: <20250623083841.364002-1-pranav.tyagi03@gmail.com>
TO: Pranav Tyagi <pranav.tyagi03@gmail.com>
TO: dave@stgolabs.net
TO: jonathan.cameron@huawei.com
TO: dave.jiang@intel.com
TO: alison.schofield@intel.com
TO: vishal.l.verma@intel.com
TO: ira.weiny@intel.com
TO: dan.j.williams@intel.com
TO: linux-cxl@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: ming.li@zohomail.com
CC: rrichter@amd.com
CC: peterz@infradead.org
CC: skhan@linuxfoundation.org
CC: linux-kernel-mentees@lists.linux.dev
CC: Pranav Tyagi <pranav.tyagi03@gmail.com>

Hi Pranav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cxl/next]
[also build test WARNING on linus/master v6.16-rc3 next-20250627]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranav-Tyagi/cxl-memdev-automate-cleanup-with-__free/20250623-164014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20250623083841.364002-1-pranav.tyagi03%40gmail.com
patch subject: [PATCH v2] cxl/memdev: automate cleanup with __free()
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280653.WmzTbwEN-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506280653.WmzTbwEN-lkp@intel.com/

smatch warnings:
drivers/cxl/core/memdev.c:881 cxl_fw_write() error: uninitialized symbol 'transfer'.
drivers/cxl/core/memdev.c:881 cxl_fw_write() error: uninitialized symbol 'transfer'.

vim +/transfer +881 drivers/cxl/core/memdev.c

9521875bbe0055 Vishal Verma 2023-06-14  873  
9521875bbe0055 Vishal Verma 2023-06-14  874  static enum fw_upload_err cxl_fw_write(struct fw_upload *fwl, const u8 *data,
9521875bbe0055 Vishal Verma 2023-06-14  875  				       u32 offset, u32 size, u32 *written)
9521875bbe0055 Vishal Verma 2023-06-14  876  {
aeaefabc59ec3c Dan Williams 2023-06-25  877  	struct cxl_memdev_state *mds = fwl->dd_handle;
aeaefabc59ec3c Dan Williams 2023-06-25  878  	struct cxl_dev_state *cxlds = &mds->cxlds;
8d8081cecfb994 Dave Jiang   2024-09-05  879  	struct cxl_mailbox *cxl_mbox = &cxlds->cxl_mbox;
9521875bbe0055 Vishal Verma 2023-06-14  880  	struct cxl_memdev *cxlmd = cxlds->cxlmd;
f76a702ca63e85 Pranav Tyagi 2025-06-23 @881  	struct cxl_mbox_transfer_fw *transfer __free(kfree);
9521875bbe0055 Vishal Verma 2023-06-14  882  	struct cxl_mbox_cmd mbox_cmd;
9521875bbe0055 Vishal Verma 2023-06-14  883  	u32 cur_size, remaining;
9521875bbe0055 Vishal Verma 2023-06-14  884  	size_t size_in;
9521875bbe0055 Vishal Verma 2023-06-14  885  	int rc;
9521875bbe0055 Vishal Verma 2023-06-14  886  
9521875bbe0055 Vishal Verma 2023-06-14  887  	*written = 0;
9521875bbe0055 Vishal Verma 2023-06-14  888  
9521875bbe0055 Vishal Verma 2023-06-14  889  	/* Offset has to be aligned to 128B (CXL-3.0 8.2.9.3.2 Table 8-57) */
9521875bbe0055 Vishal Verma 2023-06-14  890  	if (!IS_ALIGNED(offset, CXL_FW_TRANSFER_ALIGNMENT)) {
9521875bbe0055 Vishal Verma 2023-06-14  891  		dev_err(&cxlmd->dev,
9521875bbe0055 Vishal Verma 2023-06-14  892  			"misaligned offset for FW transfer slice (%u)\n",
9521875bbe0055 Vishal Verma 2023-06-14  893  			offset);
9521875bbe0055 Vishal Verma 2023-06-14  894  		return FW_UPLOAD_ERR_RW_ERROR;
9521875bbe0055 Vishal Verma 2023-06-14  895  	}
9521875bbe0055 Vishal Verma 2023-06-14  896  
9521875bbe0055 Vishal Verma 2023-06-14  897  	/*
aeaefabc59ec3c Dan Williams 2023-06-25  898  	 * Pick transfer size based on mds->payload_size @size must bw 128-byte
aeaefabc59ec3c Dan Williams 2023-06-25  899  	 * aligned, ->payload_size is a power of 2 starting at 256 bytes, and
aeaefabc59ec3c Dan Williams 2023-06-25  900  	 * sizeof(*transfer) is 128.  These constraints imply that @cur_size
aeaefabc59ec3c Dan Williams 2023-06-25  901  	 * will always be 128b aligned.
9521875bbe0055 Vishal Verma 2023-06-14  902  	 */
8d8081cecfb994 Dave Jiang   2024-09-05  903  	cur_size = min_t(size_t, size, cxl_mbox->payload_size - sizeof(*transfer));
9521875bbe0055 Vishal Verma 2023-06-14  904  
9521875bbe0055 Vishal Verma 2023-06-14  905  	remaining = size - cur_size;
9521875bbe0055 Vishal Verma 2023-06-14  906  	size_in = struct_size(transfer, data, cur_size);
9521875bbe0055 Vishal Verma 2023-06-14  907  
aeaefabc59ec3c Dan Williams 2023-06-25  908  	if (test_and_clear_bit(CXL_FW_CANCEL, mds->fw.state))
9521875bbe0055 Vishal Verma 2023-06-14  909  		return cxl_fw_do_cancel(fwl);
9521875bbe0055 Vishal Verma 2023-06-14  910  
9521875bbe0055 Vishal Verma 2023-06-14  911  	/*
9521875bbe0055 Vishal Verma 2023-06-14  912  	 * Slot numbers are 1-indexed
9521875bbe0055 Vishal Verma 2023-06-14  913  	 * cur_slot is the 0-indexed next_slot (i.e. 'cur_slot - 1 + 1')
9521875bbe0055 Vishal Verma 2023-06-14  914  	 * Check for rollover using modulo, and 1-index it by adding 1
9521875bbe0055 Vishal Verma 2023-06-14  915  	 */
aeaefabc59ec3c Dan Williams 2023-06-25  916  	mds->fw.next_slot = (mds->fw.cur_slot % mds->fw.num_slots) + 1;
9521875bbe0055 Vishal Verma 2023-06-14  917  
9521875bbe0055 Vishal Verma 2023-06-14  918  	/* Do the transfer via mailbox cmd */
9521875bbe0055 Vishal Verma 2023-06-14  919  	transfer = kzalloc(size_in, GFP_KERNEL);
9521875bbe0055 Vishal Verma 2023-06-14  920  	if (!transfer)
9521875bbe0055 Vishal Verma 2023-06-14  921  		return FW_UPLOAD_ERR_RW_ERROR;
9521875bbe0055 Vishal Verma 2023-06-14  922  
9521875bbe0055 Vishal Verma 2023-06-14  923  	transfer->offset = cpu_to_le32(offset / CXL_FW_TRANSFER_ALIGNMENT);
9521875bbe0055 Vishal Verma 2023-06-14  924  	memcpy(transfer->data, data + offset, cur_size);
aeaefabc59ec3c Dan Williams 2023-06-25  925  	if (mds->fw.oneshot) {
9521875bbe0055 Vishal Verma 2023-06-14  926  		transfer->action = CXL_FW_TRANSFER_ACTION_FULL;
aeaefabc59ec3c Dan Williams 2023-06-25  927  		transfer->slot = mds->fw.next_slot;
9521875bbe0055 Vishal Verma 2023-06-14  928  	} else {
9521875bbe0055 Vishal Verma 2023-06-14  929  		if (offset == 0) {
9521875bbe0055 Vishal Verma 2023-06-14  930  			transfer->action = CXL_FW_TRANSFER_ACTION_INITIATE;
9521875bbe0055 Vishal Verma 2023-06-14  931  		} else if (remaining == 0) {
9521875bbe0055 Vishal Verma 2023-06-14  932  			transfer->action = CXL_FW_TRANSFER_ACTION_END;
aeaefabc59ec3c Dan Williams 2023-06-25  933  			transfer->slot = mds->fw.next_slot;
9521875bbe0055 Vishal Verma 2023-06-14  934  		} else {
9521875bbe0055 Vishal Verma 2023-06-14  935  			transfer->action = CXL_FW_TRANSFER_ACTION_CONTINUE;
9521875bbe0055 Vishal Verma 2023-06-14  936  		}
9521875bbe0055 Vishal Verma 2023-06-14  937  	}
9521875bbe0055 Vishal Verma 2023-06-14  938  
9521875bbe0055 Vishal Verma 2023-06-14  939  	mbox_cmd = (struct cxl_mbox_cmd) {
9521875bbe0055 Vishal Verma 2023-06-14  940  		.opcode = CXL_MBOX_OP_TRANSFER_FW,
9521875bbe0055 Vishal Verma 2023-06-14  941  		.size_in = size_in,
9521875bbe0055 Vishal Verma 2023-06-14  942  		.payload_in = transfer,
9521875bbe0055 Vishal Verma 2023-06-14  943  		.poll_interval_ms = 1000,
9521875bbe0055 Vishal Verma 2023-06-14  944  		.poll_count = 30,
9521875bbe0055 Vishal Verma 2023-06-14  945  	};
9521875bbe0055 Vishal Verma 2023-06-14  946  
b5209da36b19b5 Dave Jiang   2024-09-05  947  	rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
9521875bbe0055 Vishal Verma 2023-06-14  948  	if (rc < 0) {
9521875bbe0055 Vishal Verma 2023-06-14  949  		rc = FW_UPLOAD_ERR_RW_ERROR;
f76a702ca63e85 Pranav Tyagi 2025-06-23  950  		return rc;
9521875bbe0055 Vishal Verma 2023-06-14  951  	}
9521875bbe0055 Vishal Verma 2023-06-14  952  
9521875bbe0055 Vishal Verma 2023-06-14  953  	*written = cur_size;
9521875bbe0055 Vishal Verma 2023-06-14  954  
9521875bbe0055 Vishal Verma 2023-06-14  955  	/* Activate FW if oneshot or if the last slice was written */
aeaefabc59ec3c Dan Williams 2023-06-25  956  	if (mds->fw.oneshot || remaining == 0) {
9521875bbe0055 Vishal Verma 2023-06-14  957  		dev_dbg(&cxlmd->dev, "Activating firmware slot: %d\n",
aeaefabc59ec3c Dan Williams 2023-06-25  958  			mds->fw.next_slot);
aeaefabc59ec3c Dan Williams 2023-06-25  959  		rc = cxl_mem_activate_fw(mds, mds->fw.next_slot);
9521875bbe0055 Vishal Verma 2023-06-14  960  		if (rc < 0) {
9521875bbe0055 Vishal Verma 2023-06-14  961  			dev_err(&cxlmd->dev, "Error activating firmware: %d\n",
9521875bbe0055 Vishal Verma 2023-06-14  962  				rc);
9521875bbe0055 Vishal Verma 2023-06-14  963  			rc = FW_UPLOAD_ERR_HW_ERROR;
f76a702ca63e85 Pranav Tyagi 2025-06-23  964  			return rc;
9521875bbe0055 Vishal Verma 2023-06-14  965  		}
9521875bbe0055 Vishal Verma 2023-06-14  966  	}
9521875bbe0055 Vishal Verma 2023-06-14  967  
9521875bbe0055 Vishal Verma 2023-06-14  968  	rc = FW_UPLOAD_ERR_NONE;
9521875bbe0055 Vishal Verma 2023-06-14  969  	return rc;
9521875bbe0055 Vishal Verma 2023-06-14  970  }
9521875bbe0055 Vishal Verma 2023-06-14  971  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
