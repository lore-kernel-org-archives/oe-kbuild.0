Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F86A23CD
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Oct 2022 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667121440; x=1698657440;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IR/XCctERyYfcra++SFcelC/TEdhjena9gJUGeiTV9Q=;
  b=ckisDqf5zo6/RyBD6nZHSRFzDpZc7vxMrw+fTzMNa9upMxmosJ4/TTdb
   gvEtKEdgBwrbAmT/D85wEyRFjfBVZi51DaNi9RVGtJJAJOydfEN02wVlc
   T4NqxopFS8ChdgKcaVa+tbquNqjHiNqhWNf2TtmX74U2Y/9/mc+g/kqJM
   hv35SPe8ziK8l/vNk2/L9eyUPFX1G2QJAPbwYDWxlYDHZvjUHc3ZDbbbf
   Jvblq+NG81YfH2aVDb2rNIGsShi6uQclrZ9OuGBZYBLRTs2d3MdRfAXHh
   ve/4jvxQ4o/0UyfJmxC/asBPKxJ8bduCKU0f5u9sRLQXWcJqqD9B8yTr4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="308729712"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; 
   d="scan'208";a="308729712"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 02:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="666525437"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; 
   d="scan'208";a="666525437"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Oct 2022 02:17:18 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1op4RR-000BtK-1w;
	Sun, 30 Oct 2022 09:17:17 +0000
Date: Sun, 30 Oct 2022 17:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/panfrost/panfrost_dump.c:62:27: warning: Parameter
 'data_end' can be declared as pointer to const [constParameter]
Message-ID: <202210301705.L6p1Q0Vk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/panfrost/panfrost_dump.c:62:27: warning: Parameter 'data_end' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Adrián Larumbe" <adrian.larumbe@collabora.com>
CC: Steven Price <steven.price@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   882ad2a2a8ffa1defecdf907052f04da2737dc46
commit: 730c2bf4ad395acf0aa0820535fdb8ea6abe5df1 drm/panfrost: Add support for devcoredump
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 730c2bf4ad395acf0aa0820535fdb8ea6abe5df1
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/panfrost/panfrost_dump.c:62:27: warning: Parameter 'data_end' can be declared as pointer to const [constParameter]
             u32 type, void *data_end)
                             ^
   fs/proc/task_mmu.c:127:50: warning: Parameter 'ppos' can be declared as pointer to const [constParameter]
   static void *m_start(struct seq_file *m, loff_t *ppos)
                                                    ^
>> fs/proc/task_mmu.c:1345:64: warning: Parameter 'pme' can be declared as pointer to const [constParameter]
   static int add_to_pagemap(unsigned long addr, pagemap_entry_t *pme,
                                                                  ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:922:3: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     HDMI_WRITE(HDMI_CSC_12_11, (0x000 << 16) | 0x000);
     ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:924:3: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     HDMI_WRITE(HDMI_CSC_22_21, (0x6e0 << 16) | 0x000);
     ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:925:3: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     HDMI_WRITE(HDMI_CSC_24_23, (0x100 << 16) | 0x000);
     ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:926:3: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     HDMI_WRITE(HDMI_CSC_32_31, (0x000 << 16) | 0x6e0);
     ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:927:3: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
     HDMI_WRITE(HDMI_CSC_34_33, (0x100 << 16) | 0x000);
     ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1753:9: warning: Uninitialized variable: ret [uninitvar]
    return ret;
           ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1733:26: note: Assuming condition is false
    for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
                            ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:1753:9: note: Uninitialized variable: ret
    return ret;
           ^

vim +/data_end +62 drivers/gpu/drm/panfrost/panfrost_dump.c

730c2bf4ad395a Adrián Larumbe 2022-07-29  60  
730c2bf4ad395a Adrián Larumbe 2022-07-29  61  static void panfrost_core_dump_header(struct panfrost_dump_iterator *iter,
730c2bf4ad395a Adrián Larumbe 2022-07-29 @62  				      u32 type, void *data_end)
730c2bf4ad395a Adrián Larumbe 2022-07-29  63  {
730c2bf4ad395a Adrián Larumbe 2022-07-29  64  	struct panfrost_dump_object_header *hdr = iter->hdr;
730c2bf4ad395a Adrián Larumbe 2022-07-29  65  
730c2bf4ad395a Adrián Larumbe 2022-07-29  66  	hdr->magic = cpu_to_le32(PANFROSTDUMP_MAGIC);
730c2bf4ad395a Adrián Larumbe 2022-07-29  67  	hdr->type = cpu_to_le32(type);
730c2bf4ad395a Adrián Larumbe 2022-07-29  68  	hdr->file_offset = cpu_to_le32(iter->data - iter->start);
730c2bf4ad395a Adrián Larumbe 2022-07-29  69  	hdr->file_size = cpu_to_le32(data_end - iter->data);
730c2bf4ad395a Adrián Larumbe 2022-07-29  70  
730c2bf4ad395a Adrián Larumbe 2022-07-29  71  	iter->hdr++;
730c2bf4ad395a Adrián Larumbe 2022-07-29  72  	iter->data += le32_to_cpu(hdr->file_size);
730c2bf4ad395a Adrián Larumbe 2022-07-29  73  }
730c2bf4ad395a Adrián Larumbe 2022-07-29  74  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
