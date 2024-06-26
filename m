Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F6512E40
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 19:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719430373; cv=none; b=M669AI8N58fjokVqS+GwpEKO67pjZ3gXzK+HKMxS6kDuiIWEDtrjSJe+2YsL7ryIhBwL0Lw/Kt256DzRQm+L3zyOydDJ0NPyJm1TU+3jE8tprXv+KX2i4uOI5f+ZDuxmDgID4namgLA41lynjulj/H/aOndFv/U6YBtYE/Poens=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719430373; c=relaxed/simple;
	bh=WWqZyEGpVd/dpf24BbQeaqrYy2rW1ZlQ2KMZnWCWWzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KCMgKz5zYzo7e7wspfuYVW4uzZH+1mg/11sNIF50xdTDdPhKjMguhTU79YD6V6GR/o5y8GnPg/uQKTcQi0gjG2UW6VJ3w0IuVwK72ykcE7+8WOZagu6EE8PzL5N8qFVEP4SQZwPaRkyzwHJ80t2a8bKYb8nJDjHgBUh6wXJSszE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHP88chR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHP88chR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719430371; x=1750966371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWqZyEGpVd/dpf24BbQeaqrYy2rW1ZlQ2KMZnWCWWzY=;
  b=aHP88chR4DVQhqzHRvwZksytt1eu08HHP2/vELuvquTXZVrBYN4SbalM
   4WtAw3rtJpKVOZ3rzD/a2ZKUE4ju7afridkv1iFbCsoFAIA73p6Jo/+oR
   uKx8yJ7QqQEtLghYyVUeUD3WXHAkZDsU1yLuKCEvfEMQDk4rN5Ual9Ywo
   w3e3R6PuoctE5O6a0oBcycxDUsgiRGhbAUuWMdy5WmBnJis9oweCfr4BA
   e+ka69tCq4fLWYkHj8XnVo3Y4x5JGLTkZQwZ0f5A3yIFbJIA5Cqe03OLr
   PNcW2uKDWochosgi/TLzKQFLw22SnfKquOOHkcI0naqKoRbrWjJ6m2aY+
   Q==;
X-CSE-ConnectionGUID: /IOf7curSZ+3s2ugxBTXhg==
X-CSE-MsgGUID: UQ13phRdR+6NDZ/5+BbwAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27662908"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="27662908"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 12:32:51 -0700
X-CSE-ConnectionGUID: MKos/J0NRdqn8gO9+rvACA==
X-CSE-MsgGUID: yMO5HggNTsikJVwjIzPrXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="74871129"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jun 2024 12:32:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMYNr-000FVW-1q;
	Wed, 26 Jun 2024 19:32:47 +0000
Date: Thu, 27 Jun 2024 03:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5081/8232] progs/hid.c:33:20: error: variable has
 incomplete type 'struct hid_bpf_ops'
Message-ID: <202406270328.bscLN1IF-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Benjamin Tissoires <bentiss@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: d7696738d66b4f1379fe77eef61cd1047d7f0773 [5081/8232] selftests/hid: convert the hid_bpf selftests with struct_ops
:::::: branch date: 27 hours ago
:::::: commit date: 12 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270328.bscLN1IF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406270328.bscLN1IF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/hid.c:33:20: error: variable has incomplete type 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:52:20: error: variable has incomplete type 'struct hid_bpf_ops'
      52 | struct hid_bpf_ops second_event = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:70:20: error: variable has incomplete type 'struct hid_bpf_ops'
      70 | struct hid_bpf_ops change_report_id = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:215:20: error: variable has incomplete type 'struct hid_bpf_ops'
     215 | struct hid_bpf_ops rdesc_fixup = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:237:20: error: variable has incomplete type 'struct hid_bpf_ops'
     237 | struct hid_bpf_ops test_insert1 = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:260:20: error: variable has incomplete type 'struct hid_bpf_ops'
     260 | struct hid_bpf_ops test_insert2 = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:282:20: error: variable has incomplete type 'struct hid_bpf_ops'
     282 | struct hid_bpf_ops test_insert3 = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   7 errors generated.


vim +33 tools/testing/selftests/hid/progs/hid.c

0330f725cc5b01 Benjamin Tissoires 2022-11-03  31  
d7696738d66b4f Benjamin Tissoires 2024-06-08  32  SEC(".struct_ops.link")
d7696738d66b4f Benjamin Tissoires 2024-06-08 @33  struct hid_bpf_ops first_event = {
d7696738d66b4f Benjamin Tissoires 2024-06-08  34  	.hid_device_event = (void *)hid_first_event,
d7696738d66b4f Benjamin Tissoires 2024-06-08  35  	.hid_id = 2,
d7696738d66b4f Benjamin Tissoires 2024-06-08  36  };
d7696738d66b4f Benjamin Tissoires 2024-06-08  37  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
