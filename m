Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190424;
	b=scSFQhlrAXmYG499LjCGcuALG10mKyssa9fBkZNG+RLoUWcgQaCNk6HmPn0WCVOHXGlV
	 aTHBLsniga2r3nEGpHgV7nd4UmWCBcVwc/xMmH0ZWndvS9ue9mKqVIxh4kEz6dxhy9DcE
	 x5qkyUuWSTtxc5JlG2C4avnQGRYmzYeTSmT9VSe6n3UmwRdpCW9DJ1TTmC2t1ayIxRxH7
	 YiaBe4P3y4aiGr0Pus4xdeGXlgF6wdQiFaD/nZq9x8crI3z+nLyMKTgb8gA6Jp/2M2ukS
	 PADm9pH0bpUWZvES4LijpW99itjQXF5fs+Wrc9/0d9jdOtT3NmAmqCAO8vHYlLFrQ+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190424;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=lTX0OB6w+B7awmcM6pHFdNtgVf9arhcKEKTDeyr2f+k=;
	b=rUnDt/+BVZwerdFxAah3xupxDARpmmmFJMSrrgSiWrblBBNSxBkcBDqb60n0EgAGPvS5
	 HycjYXl+9vfO+kynwsCJmlST4Qf9xdn2e0U7TN78lBeGCBSeZAgKRwJ3CdhTnmiP1rxDw
	 csYtnhPhypKZc0RhVL2NtE+hv+YUXLt+AjoWma1bd5o9cIuBdX4HUUq/Fx2pSHxEoAlZO
	 h8jnVPhSfMuQF8KV9FnhsWyG+8fic0BZN0z+7Qkrvm/ILDtwE8p5b5aKz/fW0RJ64pZeh
	 zgocgYyBL9sLMBDAOi+zeZU0z7pZVZK3U71lxj0L2njhhTqagozxgm6Otl5g/+Ur45g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RtJfLug4;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86EC606A31A
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Oct 2026 12:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C86EC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RtJfLug4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793190424; x=1824726424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jqi1/JyQqAAP+JwslfzQ0M3OJYHo0r+odplSKOV8NDE=;
  b=RtJfLug44Ny1lvfIPheuf4HpH7fx4pQjvTa3ZKQ4WKhx9yHcqozcnMxV
   3KjmlPoTQ7xajlnzZypmAeVylohTmqE8m+foaTIb9hMQAB4VB19Ibz6B6
   L161Nyq7mrBHniveSQGoQNCHuiQlReU4iIa113FDIAOJFlRRxlNezSZkY
   c7H5rRU2evddseCHU4WuFkwWtpGmYqZTpZEAjmOSdKr9jOQxAn3Jsq725
   17kx+78hR6dYLPW44eTmocuJUvPiteIy+DSQ+HUt+TuZoUx7XszBNwoI6
   b0+MuQ/lUUHDlIL26Q28T0ldEP8DVrEwiQoQY7N8OSTPKx1kaMO4lUwIE
   g==;
X-CSE-ConnectionGUID: 8g97ftoHSKiY45YAg6qeVw==
X-CSE-MsgGUID: qFqFk7h1TbiPfAogSUxljw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1800986"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1800986"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 05:27:04 -0700
X-CSE-ConnectionGUID: Ojx05jdsSFGrVMi3GfMKtg==
X-CSE-MsgGUID: NTgXbYxKS2i32nPbzaUeUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4768083"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Oct 2026 05:27:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM2k8-00000000YhY-0edY;
	Wed, 28 Oct 2026 12:27:00 +0000
Date: Wed, 28 Oct 2026 20:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] usb-storage: option_ms: bound probe-time bulk
 transfers
Message-ID: <202610282041.qJu7njvL-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261021081616.89976-1-jun85566@gmail.com>
References: <20261021081616.89976-1-jun85566@gmail.com>
TO: Lee Yongjun <jun85566@gmail.com>
TO: stern@rowland.harvard.edu
TO: gregkh@linuxfoundation.org
CC: digidietze@draisberghof.de
CC: xiehongyu1@kylinos.cn
CC: linux-usb@vger.kernel.org
CC: usb-storage@lists.one-eyed-alien.net
CC: linux-kernel@vger.kernel.org
CC: syzkaller-bugs@googlegroups.com
CC: syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
CC: Lee Yongjun <jun85566@gmail.com>

Hi Lee,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v7.3 next-20261027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lee-Yongjun/usb-storage-option_ms-bound-probe-time-bulk-transfers/20261021-171616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20261021081616.89976-1-jun85566%40gmail.com
patch subject: [PATCH v2] usb-storage: option_ms: bound probe-time bulk transfers
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261028/202610282041.qJu7njvL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282041.qJu7njvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610282041.qJu7njvL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/storage/option_ms.c:49:11: error: call to undeclared function 'usb_stor_bulk_transfer_buf_timeout'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      49 |         result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
         |                  ^
   drivers/usb/storage/option_ms.c:49:11: note: did you mean 'usb_stor_bulk_transfer_buf'?
   drivers/usb/storage/transport.h:80:12: note: 'usb_stor_bulk_transfer_buf' declared here
      80 | extern int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
         |            ^
   drivers/usb/storage/option_ms.c:95:11: error: call to undeclared function 'usb_stor_bulk_transfer_buf_timeout'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |         result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
         |                  ^
   2 errors generated.


vim +/usb_stor_bulk_transfer_buf_timeout +49 drivers/usb/storage/option_ms.c

281b064f237205 Dan Williams   2008-12-14  30  
32ebbe7b6ad44a Josua Dietze   2009-05-24  31  static int option_rezero(struct us_data *us)
281b064f237205 Dan Williams   2008-12-14  32  {
38502ef49f96f7 Colin Ian King 2017-09-12  33  	static const unsigned char rezero_msg[] = {
281b064f237205 Dan Williams   2008-12-14  34  	  0x55, 0x53, 0x42, 0x43, 0x78, 0x56, 0x34, 0x12,
281b064f237205 Dan Williams   2008-12-14  35  	  0x01, 0x00, 0x00, 0x00, 0x80, 0x00, 0x06, 0x01,
281b064f237205 Dan Williams   2008-12-14  36  	  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
281b064f237205 Dan Williams   2008-12-14  37  	  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
281b064f237205 Dan Williams   2008-12-14  38  	};
281b064f237205 Dan Williams   2008-12-14  39  	char *buffer;
281b064f237205 Dan Williams   2008-12-14  40  	int result;
281b064f237205 Dan Williams   2008-12-14  41  
191648d03d2022 Joe Perches    2013-04-19  42  	usb_stor_dbg(us, "Option MS: %s\n", "DEVICE MODE SWITCH");
281b064f237205 Dan Williams   2008-12-14  43  
281b064f237205 Dan Williams   2008-12-14  44  	buffer = kzalloc(RESPONSE_LEN, GFP_KERNEL);
281b064f237205 Dan Williams   2008-12-14  45  	if (buffer == NULL)
281b064f237205 Dan Williams   2008-12-14  46  		return USB_STOR_TRANSPORT_ERROR;
281b064f237205 Dan Williams   2008-12-14  47  
281b064f237205 Dan Williams   2008-12-14  48  	memcpy(buffer, rezero_msg, sizeof(rezero_msg));
30fed35a2ad8a1 Lee Yongjun    2026-10-21 @49  	result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
30fed35a2ad8a1 Lee Yongjun    2026-10-21  50  						    buffer, sizeof(rezero_msg), NULL,
30fed35a2ad8a1 Lee Yongjun    2026-10-21  51  						    OPTION_MS_PROBE_TIMEOUT);
281b064f237205 Dan Williams   2008-12-14  52  	if (result != USB_STOR_XFER_GOOD) {
281b064f237205 Dan Williams   2008-12-14  53  		result = USB_STOR_XFER_ERROR;
281b064f237205 Dan Williams   2008-12-14  54  		goto out;
281b064f237205 Dan Williams   2008-12-14  55  	}
281b064f237205 Dan Williams   2008-12-14  56  
f0183a338e4f90 Felipe Balbi   2016-04-18  57  	/*
f0183a338e4f90 Felipe Balbi   2016-04-18  58  	 * Some of the devices need to be asked for a response, but we don't
281b064f237205 Dan Williams   2008-12-14  59  	 * care what that response is.
281b064f237205 Dan Williams   2008-12-14  60  	 */
30fed35a2ad8a1 Lee Yongjun    2026-10-21  61  	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
30fed35a2ad8a1 Lee Yongjun    2026-10-21  62  					   buffer, RESPONSE_LEN, NULL,
30fed35a2ad8a1 Lee Yongjun    2026-10-21  63  					   OPTION_MS_PROBE_TIMEOUT);
32ebbe7b6ad44a Josua Dietze   2009-05-24  64  
32ebbe7b6ad44a Josua Dietze   2009-05-24  65  	/* Read the CSW */
30fed35a2ad8a1 Lee Yongjun    2026-10-21  66  	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
30fed35a2ad8a1 Lee Yongjun    2026-10-21  67  					   buffer, 13, NULL,
30fed35a2ad8a1 Lee Yongjun    2026-10-21  68  					   OPTION_MS_PROBE_TIMEOUT);
32ebbe7b6ad44a Josua Dietze   2009-05-24  69  
281b064f237205 Dan Williams   2008-12-14  70  	result = USB_STOR_XFER_GOOD;
281b064f237205 Dan Williams   2008-12-14  71  
281b064f237205 Dan Williams   2008-12-14  72  out:
281b064f237205 Dan Williams   2008-12-14  73  	kfree(buffer);
281b064f237205 Dan Williams   2008-12-14  74  	return result;
281b064f237205 Dan Williams   2008-12-14  75  }
281b064f237205 Dan Williams   2008-12-14  76  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
